<?php
class ModelExtensionShippingC6V extends Model {
	function getQuote($address) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('c6v_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('c6v_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status && $this->config->get('c6v_api_key') && isset($address['city'])) {
			$pickup_cities = $this->config->get('c6v_pickup_cities');

			if (isset($this->session->data['c6v_pickup_city']) && !in_array($this->session->data['c6v_pickup_city'], $pickup_cities)) {
				$this->session->data['c6v_pickup_city'] = $pickup_cities[0];
			}

			$startCity = isset($this->session->data['c6v_pickup_city']) ? $this->session->data['c6v_pickup_city'] : $pickup_cities[0];
			$endCity = trim($address['city']);
			$weight = 0;
			$length = 0;
			$width = 0;
			$height = 0;
			$volume = 0;
			$start = true;
			$total = $this->cart->getSubTotal();

			foreach ($this->cart->getProducts() as $product) {
				if ($product['shipping']) {
					// получаем реальные габариты товара
					$product_weight = $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('c6v_weight_class_id'));
					$product_length = $this->length->convert($product['length'], $product['length_class_id'], $this->config->get('c6v_length_class_id'));
					$product_width = $this->length->convert($product['width'], $product['length_class_id'], $this->config->get('c6v_length_class_id'));
					$product_height = $this->length->convert($product['height'], $product['length_class_id'], $this->config->get('c6v_length_class_id'));

					// заменяем на дефолтные, если габариты не заданы
					$product_weight = $product_weight == 0 ? $this->config->get('c6v_default_weight') : $product_weight;
					$product_length = $product_length == 0 ? $this->config->get('c6v_default_length') : $product_length;
					$product_width = $product_width == 0 ? $this->config->get('c6v_default_width') : $product_width;
					$product_height = $product_height == 0 ? $this->config->get('c6v_default_height') : $product_height;

					// собираем габариты отправления
					if ($this->config->get('c6v_calc_type') == 1) {
						$length += $product_length * $product['quantity'];
						$width += $product_width > $width ? $product_width : 0;
						$height += $product_height > $height ? $product_height : 0;
					} elseif ($this->config->get('c6v_calc_type') == 2) {
						$length += $product_length > $length ? $product_length : 0;
						$width += $product_width > $width ? $product_width : 0;
						$height += $product_height * $product['quantity'];
					} elseif ($this->config->get('c6v_calc_type') == 3) {
						$volume += ($product_length * $product_width * $product_height) * $product['quantity'];
					} else {
						$length += $product_length > $length ? $product_length : 0;
						$width += $product_width * $product['quantity'];
						$height += $product_height > $height ? $product_height : 0;
					}

					$weight += $product_weight;
				}
			}

			if ($this->config->get('c6v_calc_type') == 3) {
				$length = $width = $height = pow($volume, 1/3);
			}

			if (
				($this->config->get('c6v_min_total') > 0 && $total < $this->config->get('c6v_min_total')) ||
				($this->config->get('c6v_max_total') > 0 && $total > $this->config->get('c6v_max_total')) ||
				($this->config->get('c6v_min_weight') > 0 && $weight < $this->config->get('c6v_min_weight')) ||
				($this->config->get('c6v_max_weight') > 0 && $weight > $this->config->get('c6v_max_weight'))
			) {
				$start = false;
			}

			if ($start && $endCity != '') {
				$results = $this->getCost($startCity, $endCity, ceil($weight), ceil($width), ceil($height), ceil($length));
			}

			if (!empty($results)) {
				$quote_data = array();

				foreach ($results as $result) {
					if (stripos($result['server'], '-')) {
						$serv = explode('-', $result['server']);
						$server = $serv[0];
						$server_id = $serv[1];

						if ($server == 'cdektk' || $server == 'russianpost') {
							if (!empty($this->config->get('c6v_exclude_' . $server)) && in_array($server_id, $this->config->get('c6v_exclude_' . $server))) {
								continue;
							}
						}
					} else {
						$server = $result['server'];
					}

					if ($this->config->has('c6v_add_day_' . $server)) {
						$add_day = $this->config->get('c6v_add_day_' . $server);
					} else {
						$add_day = $this->config->get('c6v_add_day');
					}

					if ($add_day > 0) {
						if (stripos($result['days'], '-')) {
							$numbers = explode('-', $result['days']);
							$numbers[0] += $add_day;
							$numbers[1] += $add_day;
							$result['days'] = implode('-', $numbers);
						} elseif ((int)$result['days']) {
							$result['days'] += $add_day;
						}
					}

					if ($result['days'] == 'уточняйте') {
						$days = 'срок доставки уточняйте';
					} else {
						$days =  $result['days'] . ' ' . $this->numeric_cases($result['days'], array('день','дня','дней'));
					}

					if ($this->config->has('c6v_add_cost_' . $server)) {
						$add_cost = $this->config->get('c6v_add_cost_' . $server);
					} else {
						$add_cost = $this->config->get('c6v_add_cost');
					}

					if ($add_cost > 0) {
						$price = $result['price'] + $add_cost;
					} else {
						$price = $result['price'];
					}

					if (is_numeric($this->config->get('c6v_fix_price_' . $server))) {
						$cost = $this->config->get('c6v_fix_price_' . $server);
					} elseif (is_numeric($this->config->get('c6v_fix_price'))) {
						$cost = $this->config->get('c6v_fix_price');
					} else {
						$cost = $price;
					}

					$input = array(
						'{{logo}}',
						'{{name}}',
						'{{description}}',
						'{{days}}',
					);

					$output = array(
						'logo'        => '<img src="' . HTTP_SERVER . 'catalog/view/image/c6v/' . $server . '.png" title="' . $result['name'] . '" / >',
						'name'        => $result['name'],
						'description' => $result['description'],
						'days'        => $days,
					);

					$quote_data['c6v_' . $result['server']] = array(
						'code'         => 'c6v.' . 'c6v_' . $result['server'],
						'title'        => html_entity_decode(str_replace($input, $output, $this->config->get('c6v_quote_title'))),
						'cost'         => $this->config->get('c6v_cost_status') ? $cost : 0,
						'tax_class_id' => $this->config->get('c6v_tax_class_id'),
						'text'         => $this->currency->format($this->tax->calculate($price, $this->config->get('c6v_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency']),
						'sort'         => $this->config->get('c6v_sort_order_' . $server)
					);
				}

				$keys = array_column($quote_data, 'sort');
				array_multisort($keys, SORT_ASC, $quote_data);

				if ($this->config->has('c6v_pickup_cities') && count($pickup_cities) > 1) {
					$html = '<div style="margin: 10px 0;">Склад: <select onchange="c6v_set_pickup(this.value);" style="max-width: 300px;">"';

					foreach ($pickup_cities as $city) {
						$html .= '<option value="' . $city . '"';

						if (isset($this->session->data['c6v_pickup_city']) && $this->session->data['c6v_pickup_city'] == $city && in_array($this->session->data['c6v_pickup_city'], $pickup_cities)) {
							$html .= 'selected="selected"';
						}

						$html .= '>' . $city . '</option>';
					}

					$html .= '</select></div>';
				} else {
					$html = '';
				}

				$method_data = array(
					'code'       => 'c6v',
					'title'      => $this->config->get('c6v_title') . $html,
					'quote'      => $quote_data,
					'sort_order' => $this->config->get('c6v_sort_order'),
					'error'      => false,
				);
			}
		}

		return $method_data;
	}

	public function getCities() {
		$data = $this->cache->get('c6v_cities');

		if (!$data) {
			$data = array();

			$params['key'] = $this->config->get('c6v_api_key');
			$params['q'] = 'getCities';

			$result = $this->curl($params);
			$data = json_decode($result['data'], true);

			if (isset($data['err'])) {
				$data = array();
			}

			if ($this->config->get('c6v_logging')) {
				if ($result['info']['http_code'] < 200 || $result['info']['http_code'] >= 300 || isset($result['data']['err'])) {
					$this->log->write('[c6v][error][getCities][results:' . $result['data'] . ']');
				} else {
					$this->log->write('[c6v][success][getCities][results:' . $result['data'] . ']');
				}
			}

			$this->cache->set('c6v_cities', $data);
		}

		return $data;
	}

	protected function getCost($startCity, $endCity, $weight, $width, $height, $length) {
		$params['key'] = $this->config->get('c6v_api_key');
		$params['q'] = 'getPrice';
		$params['startCity'] = $startCity;
		$params['endCity'] = $endCity;
		$params['weight'] = $weight;
		$params['width'] = $width;
		$params['height'] = $height;
		$params['length'] = $length;

		$result = $this->curl($params);

		$data = json_decode($result['data'], true);

		if (isset($data['err']) || isset($data['message'])) {
			$data = array();
		}

		if ($this->config->get('c6v_logging')) {
			if ($result['info']['http_code'] < 200 || $result['info']['http_code'] >= 300 || isset($result['data']['err'])) {
				$this->log->write('[c6v][error][getPrice][startCity:' . $startCity . '][endCity:' . $endCity . '][weight:' . $weight . '][width:' . $width . '][height:' . $height . '][length:' . $length . '][results:' . $result['data'] . ']');
			} else {
				$this->log->write('[c6v][success][getPrice][startCity:' . $startCity . '][endCity:' . $endCity . '][weight:' . $weight . '][width:' . $width . '][height:' . $height . '][length:' . $length . '][results:' . $result['data'] . ']');
			}
		}

		return $data;
	}

	protected function curl($params) {
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
		curl_setopt($ch, CURLOPT_URL, 'http://api.c6v.ru/?partner=p0v1n0m&' . http_build_query($params));

		$result['data'] = curl_exec($ch);
		$result['info'] = curl_getinfo($ch);

		curl_close($ch);

		return $result;
	}

	protected function numeric_cases($number, $word) {
		if (stripos($number, '-')) {
			$numbers = explode('-', $number);
			$number = $numbers[1];
		}

		return $word[ ($number%100>4 && $number%100<20)? 2: array(2, 0, 1, 1, 1, 2)[min($number%10, 5)] ];
	}
}
