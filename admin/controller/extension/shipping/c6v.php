<?php
class ControllerExtensionShippingC6V extends Controller {
	private $version = '1.10.1';
	private $error = array();
	private $tk = [
		'cdektk',
		'dellintk',
		'gtdtk',
		'nrgtk',
		'jeldortk',
		'pectk',
		'emspost',
		'dimextk',
		'magictranstk',
		'vozovoztk',
		'glavdostavkatk',
		'baikalsrtk',
		'russianpost',
	];
	private $cdektk_tariffs = [
		62 => 'Магистральный экспресс склад-склад',
		63 => 'Магистральный супер-экспресс склад-склад',
		15 => 'Экспресс тяжеловесы склад-склад',
		5 => 'Экономичный экспресс склад-склад',
		10 => 'Экспресс лайт склад-склад',
		136 => 'Посылка склад-склад',
		234 => 'Экономичная посылка склад-склад',
		11 => 'Экспресс лайт склад-дверь',
		16 => 'Экспресс тяжеловесы склад-дверь',
		137 => 'Посылка склад-дверь',
		233 => 'Экономичная посылка склад-дверь',
		17 => 'Экспресс тяжеловесы дверь-склад',
		138 => 'Посылка дверь-склад',
		12 => 'Экспресс лайт дверь-склад',
		139 => 'Посылка дверь-дверь',
		18 => 'Экспресс тяжеловесы дверь-дверь',
		1 => 'Экспресс лайт дверь-дверь',
		3 => 'Супер-экспресс до 18',
		57 => 'Супер-экспресс до 9',
		58 => 'Супер-экспресс до 10',
		59 => 'Супер-экспресс до 12',
		60 => 'Супер-экспресс до 14',
		61 => 'Супер-экспресс до 16',
	];
	private $russianpost_tariffs = [
		4030 => 'Посылка нестандартная',
		47030 => 'Посылка 1 класса',
		23030 => 'Посылка онлайн обыкновенная',
		30030 => 'Бизнес курьер',
		31030 => 'Бизнес курьер экспресс',
	];

	public function index() {
		$this->load->language('extension/shipping/c6v');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('c6v', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_info'] = $this->language->get('text_info');
		$data['text_version'] = $this->language->get('text_version');
		$data['text_developer'] = $this->language->get('text_developer');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_cdektk'] = $this->language->get('text_cdektk');
		$data['text_dellintk'] = $this->language->get('text_dellintk');
		$data['text_gtdtk'] = $this->language->get('text_gtdtk');
		$data['text_nrgtk'] = $this->language->get('text_nrgtk');
		$data['text_jeldortk'] = $this->language->get('text_jeldortk');
		$data['text_pectk'] = $this->language->get('text_pectk');
		$data['text_emspost'] = $this->language->get('text_emspost');
		$data['text_dimextk'] = $this->language->get('text_dimextk');
		$data['text_magictranstk'] = $this->language->get('text_magictranstk');
		$data['text_vozovoztk'] = $this->language->get('text_vozovoztk');
		$data['text_glavdostavkatk'] = $this->language->get('text_glavdostavkatk');
		$data['text_baikalsrtk'] = $this->language->get('text_baikalsrtk');
		$data['text_russianpost'] = $this->language->get('text_russianpost');
		$data['text_width'] = $this->language->get('text_width');
		$data['text_length'] = $this->language->get('text_length');
		$data['text_height'] = $this->language->get('text_height');
		$data['text_volume'] = $this->language->get('text_volume');
		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_tk'] = $this->language->get('tab_tk');
		$data['tab_support'] = $this->language->get('tab_support');
		$data['entry_api_key'] = $this->language->get('entry_api_key');
		$data['entry_pickup_cities'] = $this->language->get('entry_pickup_cities');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_quote_title'] = $this->language->get('entry_quote_title');
		$data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$data['entry_length_class'] = $this->language->get('entry_length_class');
		$data['entry_default_weight'] = $this->language->get('entry_default_weight');
		$data['entry_default_dimension'] = $this->language->get('entry_default_dimension');
		$data['entry_default_length'] = $this->language->get('entry_default_length');
		$data['entry_default_width'] = $this->language->get('entry_default_width');
		$data['entry_default_height'] = $this->language->get('entry_default_height');
		$data['entry_min_total'] = $this->language->get('entry_min_total');
		$data['entry_max_total'] = $this->language->get('entry_max_total');
		$data['entry_min_weight'] = $this->language->get('entry_min_weight');
		$data['entry_max_weight'] = $this->language->get('entry_max_weight');
		$data['entry_cost_status'] = $this->language->get('entry_cost_status');
		$data['entry_calc_type'] = $this->language->get('entry_calc_type');
		$data['entry_fix_price'] = $this->language->get('entry_fix_price');
		$data['entry_add_cost'] = $this->language->get('entry_add_cost');
		$data['entry_add_day'] = $this->language->get('entry_add_day');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_logging'] = $this->language->get('entry_logging');
		$data['entry_exclude_tariff'] = $this->language->get('entry_exclude_tariff');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/shipping/c6v', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/shipping/c6v', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true);

		$data['tk'] = $this->tk;

		$data['cdektk_tariffs'] = $this->cdektk_tariffs;

		$data['russianpost_tariffs'] = $this->russianpost_tariffs;

		foreach ($data['tk'] as $tk) {
			if (isset($this->request->post['c6v_fix_price_' . $tk])) {
				$data['c6v_fix_price_' . $tk] = $this->request->post['c6v_fix_price_' . $tk];
			} else {
				$data['c6v_fix_price_' . $tk] = $this->config->get('c6v_fix_price_' . $tk);
			}

			if (isset($this->request->post['c6v_add_cost_' . $tk])) {
				$data['c6v_add_cost_' . $tk] = $this->request->post['c6v_add_cost_' . $tk];
			} else {
				$data['c6v_add_cost_' . $tk] = $this->config->get('c6v_add_cost_' . $tk);
			}

			if (isset($this->request->post['c6v_add_day_' . $tk])) {
				$data['c6v_add_day_' . $tk] = $this->request->post['c6v_add_day_' . $tk];
			} else {
				$data['c6v_add_day_' . $tk] = $this->config->get('c6v_add_day_' . $tk);
			}

			if (isset($this->request->post['c6v_sort_order_' . $tk])) {
				$data['c6v_sort_order_' . $tk] = $this->request->post['c6v_sort_order_' . $tk];
			} else {
				$data['c6v_sort_order_' . $tk] = $this->config->get('c6v_sort_order_' . $tk);
			}
		}

		if (isset($this->request->post['c6v_exclude_cdektk'])) {
			$data['c6v_exclude_cdektk'] = $this->request->post['c6v_exclude_cdektk'];
		} elseif ($this->config->has('c6v_exclude_cdektk')) {
			$data['c6v_exclude_cdektk'] = $this->config->get('c6v_exclude_cdektk');
		} else {
			$data['c6v_exclude_cdektk'] = [];
		}

		if (isset($this->request->post['c6v_exclude_russianpost'])) {
			$data['c6v_exclude_russianpost'] = $this->request->post['c6v_exclude_russianpost'];
		} elseif ($this->config->has('c6v_exclude_russianpost')) {
			$data['c6v_exclude_russianpost'] = $this->config->get('c6v_exclude_russianpost');
		} else {
			$data['c6v_exclude_russianpost'] = [];
		}

		if (isset($this->request->post['c6v_api_key'])) {
			$data['c6v_api_key'] = $this->request->post['c6v_api_key'];
		} else {
			$data['c6v_api_key'] = $this->config->get('c6v_api_key');
		}

		$data['c6v_cities'] = $this->getCities();

		if (isset($this->request->post['c6v_pickup_cities'])) {
			$data['c6v_pickup_cities'] = $this->request->post['c6v_pickup_cities'];
		} elseif ($this->config->has('c6v_pickup_cities')) {
			$data['c6v_pickup_cities'] = $this->config->get('c6v_pickup_cities');
		} else {
			$data['c6v_pickup_cities'] = [];
		}

		if (isset($this->request->post['c6v_title'])) {
			$data['c6v_title'] = $this->request->post['c6v_title'];
		} else {
			$data['c6v_title'] = $this->config->get('c6v_title');
		}

		if (isset($this->request->post['c6v_quote_title'])) {
			$data['c6v_quote_title'] = $this->request->post['c6v_quote_title'];
		} elseif ($this->config->has('c6v_quote_title')) {
			$data['c6v_quote_title'] = $this->config->get('c6v_quote_title');
		} else {
			$data['c6v_quote_title'] = '{{logo}} {{name}} - {{description}} ({{days}})';
		}

		$this->load->model('localisation/weight_class');

		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['c6v_weight_class_id'])) {
			$data['c6v_weight_class_id'] = $this->request->post['c6v_weight_class_id'];
		} else {
			$data['c6v_weight_class_id'] = $this->config->get('c6v_weight_class_id');
		}

		if (isset($this->request->post['c6v_default_weight'])) {
			$data['c6v_default_weight'] = $this->request->post['c6v_default_weight'];
		} elseif ($this->config->has('c6v_default_weight')) {
			$data['c6v_default_weight'] = $this->config->get('c6v_default_weight');
		} else {
			$data['c6v_default_weight'] = 1;
		}

		$this->load->model('localisation/length_class');

		$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		if (isset($this->request->post['c6v_length_class_id'])) {
			$data['c6v_length_class_id'] = $this->request->post['c6v_length_class_id'];
		} else {
			$data['c6v_length_class_id'] = $this->config->get('c6v_length_class_id');
		}

		if (isset($this->request->post['c6v_default_length'])) {
			$data['c6v_default_length'] = $this->request->post['c6v_default_length'];
		} elseif ($this->config->has('c6v_default_length')) {
			$data['c6v_default_length'] = $this->config->get('c6v_default_length');
		} else {
			$data['c6v_default_length'] = 10;
		}

		if (isset($this->request->post['c6v_default_width'])) {
			$data['c6v_default_width'] = $this->request->post['c6v_default_width'];
		} elseif ($this->config->has('c6v_default_width')) {
			$data['c6v_default_width'] = $this->config->get('c6v_default_width');
		} else {
			$data['c6v_default_width'] = 10;
		}

		if (isset($this->request->post['c6v_default_height'])) {
			$data['c6v_default_height'] = $this->request->post['c6v_default_height'];
		} elseif ($this->config->has('c6v_default_height')) {
			$data['c6v_default_height'] = $this->config->get('c6v_default_height');
		} else {
			$data['c6v_default_height'] = 10;
		}

		if (isset($this->request->post['c6v_min_total'])) {
			$data['c6v_min_total'] = $this->request->post['c6v_min_total'];
		} else {
			$data['c6v_min_total'] = $this->config->get('c6v_min_total');
		}

		if (isset($this->request->post['c6v_min_weight'])) {
			$data['c6v_min_weight'] = $this->request->post['c6v_min_weight'];
		} else {
			$data['c6v_min_weight'] = $this->config->get('c6v_min_weight');
		}

		if (isset($this->request->post['c6v_max_weight'])) {
			$data['c6v_max_weight'] = $this->request->post['c6v_max_weight'];
		} else {
			$data['c6v_max_weight'] = $this->config->get('c6v_max_weight');
		}

		if (isset($this->request->post['c6v_max_total'])) {
			$data['c6v_max_total'] = $this->request->post['c6v_max_total'];
		} else {
			$data['c6v_max_total'] = $this->config->get('c6v_max_total');
		}

		if (isset($this->request->post['c6v_fix_price'])) {
			$data['c6v_fix_price'] = $this->request->post['c6v_fix_price'];
		} else {
			$data['c6v_fix_price'] = $this->config->get('c6v_fix_price');
		}

		if (isset($this->request->post['c6v_add_cost'])) {
			$data['c6v_add_cost'] = $this->request->post['c6v_add_cost'];
		} else {
			$data['c6v_add_cost'] = $this->config->get('c6v_add_cost');
		}

		if (isset($this->request->post['c6v_add_day'])) {
			$data['c6v_add_day'] = $this->request->post['c6v_add_day'];
		} else {
			$data['c6v_add_day'] = $this->config->get('c6v_add_day');
		}

		if (isset($this->request->post['c6v_cost_status'])) {
			$data['c6v_cost_status'] = $this->request->post['c6v_cost_status'];
		} elseif ($this->config->has('c6v_cost_status')) {
			$data['c6v_cost_status'] = $this->config->get('c6v_cost_status');
		} else {
			$data['c6v_cost_status'] = 1;
		}

		if (isset($this->request->post['c6v_calc_type'])) {
			$data['c6v_calc_type'] = $this->request->post['c6v_calc_type'];
		} else {
			$data['c6v_calc_type'] = $this->config->get('c6v_calc_type');
		}

		if (isset($this->request->post['c6v_tax_class_id'])) {
			$data['c6v_tax_class_id'] = $this->request->post['c6v_tax_class_id'];
		} else {
			$data['c6v_tax_class_id'] = $this->config->get('c6v_tax_class_id');
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['c6v_geo_zone_id'])) {
			$data['c6v_geo_zone_id'] = $this->request->post['c6v_geo_zone_id'];
		} else {
			$data['c6v_geo_zone_id'] = $this->config->get('c6v_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['c6v_status'])) {
			$data['c6v_status'] = $this->request->post['c6v_status'];
		} else {
			$data['c6v_status'] = $this->config->get('c6v_status');
		}

		if (isset($this->request->post['c6v_sort_order'])) {
			$data['c6v_sort_order'] = $this->request->post['c6v_sort_order'];
		} else {
			$data['c6v_sort_order'] = $this->config->get('c6v_sort_order');
		}

		if (isset($this->request->post['c6v_logging'])) {
			$data['c6v_logging'] = $this->request->post['c6v_logging'];
		} else {
			$data['c6v_logging'] = $this->config->get('c6v_logging');
		}

		$data['version'] = $this->version;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/shipping/c6v', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/shipping/c6v')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
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

	protected function getCities() {
		$data = $this->cache->get('c6v_cities');

		if (!$data) {
			$this->load->model('extension/shipping/c6v');

			$data = array();

			if ($this->config->get('c6v_api_key')) {
				$params['key'] = $this->config->get('c6v_api_key');
				$params['q'] = 'getCities';

				$result = $this->curl($params);
				$data = json_decode($result['data'], true);

				if (isset($data['err']) || isset($data['message'])) {
					$data = $this->model_extension_shipping_c6v->getStaticCities();
				}

				if ($this->config->get('c6v_logging')) {
					if ($result['info']['http_code'] < 200 || $result['info']['http_code'] >= 300 || isset($result['data']['err'])) {
						$this->log->write('[c6v][error][getCities][results:' . $result['data'] . ']');
					} else {
						$this->log->write('[c6v][success][getCities][results:' . $result['data'] . ']');
					}
				}
			} else {
				$data = $this->model_extension_shipping_c6v->getStaticCities();
			}

			$this->cache->set('c6v_cities', $data);
		}

		sort($data);

		return $data;
	}
}
