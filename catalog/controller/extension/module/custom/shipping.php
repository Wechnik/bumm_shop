<?php
class ControllerExtensionModuleCustomShipping extends Controller {
	public function index($setting) {

		// Блок отображается
		if (isset($setting['status']) && (bool)$setting['status'] === true && $this->cart->hasShipping()) {

			$this->load->language('extension/module/custom/shipping');

			// Получаем методы доставки
			$this->load->model('catalog/product');
			$data['shipping_methods'] = $this->session->data['shipping_methods'] = $this->getMethods();
			foreach ($this->session->data['product_id'] as $cart_id){
				$product_id = $this->cart->getProductId($cart_id);
				$product_info = $this->model_catalog_product->getProduct($product_id);
				$product_shipping = $product_info['product_shippings'];
				if((json_decode($product_shipping))){
				    foreach (json_decode($product_shipping) as $shipp){
				        $shipping[$shipp] = $shipp; 
				    }
				}
			    }
			    if(isset($shipping)){
				foreach ($shipping as $key => $ship){
				    if(isset($data['shipping_methods'][$key])){
				       $shipping_methods[] = $data['shipping_methods'][$key];
				    }
				}
			    }else{
				$shipping_methods = array();
			    }
			    
			    $data['shipping_methods'] = $shipping_methods;
			    $data['heading_shipping'] = $this->language->get('heading_shipping');

			$data['text_address_existing'] = $this->language->get('text_address_existing');
			$data['text_address_new'] = $this->language->get('text_address_new');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_none'] = $this->language->get('text_none');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['text_address_existing'] = $this->language->get('text_address_existing');
			$data['text_address_new'] = $this->language->get('text_address_new');

			$data['entry_company'] = $this->language->get('entry_company');
			$data['entry_address_1'] = $this->language->get('entry_address_1');
			$data['entry_address_2'] = $this->language->get('entry_address_2');
			$data['entry_postcode'] = $this->language->get('entry_postcode');
			$data['entry_city'] = $this->language->get('entry_city');
			$data['entry_country'] = $this->language->get('entry_country');
			$data['entry_zone'] = $this->language->get('entry_zone');

			if (empty($this->session->data['shipping_methods'])) {
				$data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['shipping_method']['code'])) {
				$data['code'] = $this->session->data['shipping_method']['code'];
			} else {
				$data['code'] = '';
			}

			if (isset($this->session->data['shipping_address']['address_id'])) {
				$data['address_id'] = $this->session->data['shipping_address']['address_id'];
			} else {
				$data['address_id'] = $this->customer->getAddressId();
			}

			$this->load->model('account/address');

			$data['addresses'] = $this->model_account_address->getAddresses();

			if (isset($this->session->data['shipping_address']['address_1'])) {
				$data['address_1'] = $this->session->data['shipping_address']['address_1'];
			} else {
				$data['address_1'] = '';
			}

			if (isset($this->session->data['shipping_address']['address_2'])) {
				$data['address_2'] = $this->session->data['shipping_address']['address_2'];
			} else {
				$data['address_2'] = '';
			}

			if (isset($this->session->data['shipping_address']['city'])) {
				$data['city'] = $this->session->data['shipping_address']['city'];
			} else {
				$data['city'] = '';
			}

			if (isset($this->session->data['shipping_address']['postcode'])) {
				$data['postcode'] = $this->session->data['shipping_address']['postcode'];
			} else {
				$data['postcode'] = '';
			}

			if (isset($this->session->data['shipping_address']['country_id'])) {
				$data['country_id'] = $this->session->data['shipping_address']['country_id'];
			} else {
				$data['country_id'] = $this->config->get('config_country_id');
			}

			if (isset($this->session->data['shipping_address']['zone_id'])) {
				$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
			} else {
				$data['zone_id'] = '';
			}

			if (isset($this->session->data['shipping_address']['company'])) {
				$data['company'] = $this->session->data['shipping_address']['company'];
			} else {
				$data['company'] = '';
			}

			$this->load->model('localisation/country');

			$data['countries'] = $this->model_localisation_country->getCountries();

			// Custom Fields
			$this->load->model('account/custom_field');

			$data['custom_fields'] = $this->model_account_custom_field->getCustomFields();

			foreach($data['custom_fields'] as $key => $field){

				if ($field['location'] !== 'address') {
						unset($data['custom_fields'][$key]);
						continue;
					}

				$custom_field_id = $field['custom_field_id'];

				if ( isset($this->session->data['shipping_address']['shipping_custom_field'][$custom_field_id]) ) {
					$data['custom_fields'][$key]['value'] = $this->session->data['shipping_address']['shipping_custom_field'][$custom_field_id];
				}

			}

			// Setting
			$data['setting'] = $setting;
                $data_query = array();
     $this->load->model('affiliate/affiliate');
        $data['partner'] = '';
        foreach ($this->session->data['product_id'] as $prod_id){
            $product_id = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "cart WHERE cart_id = '" . $prod_id . "'")->row;
            $product_id = $product_id['product_id'];
            
            $prod_cats_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "'")->rows;
            
            foreach ($prod_cats_id as $prod_cat_id) {
                $aff_centrs_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_centr")->rows;  // print_r($aff_centrs_id); exit;
                foreach ($aff_centrs_id as $aff_centr_id) {
                    if (in_array($prod_cat_id['category_id'], explode( ',', $aff_centr_id['category']))) {
                        $data['partner'] = '1';
                        $data_query[]=array('centr_id' => $aff_centr_id['centr_id']);
                    }
                }
            }
        }
        
      //  $data['city'] = $this->session->data['shipping_address']['city'];
      if (empty($this->session->data['shipping_address']['city'])) $data['city'] = 'Москва'; else $data['city'] = $this->session->data['shipping_address']['city'];  
        $data['affiliate_centr'] = $this->model_affiliate_affiliate->getMaps($data_query,$data['city']);

        $data['affiliate_citys'] = $this->model_affiliate_affiliate->getCity();
        $data['aff_centrs'] = $this->model_affiliate_affiliate->getCityCentrs($data_query,$data['city']);
      

			return $this->load->view('extension/module/custom/shipping', $data);

		// Блок отключен
		} else {

			$this->session->data['shipping_method'] = array();
			$this->session->data['shipping_address'] = $this->full(array());
			$this->session->data['payment_address'] = $this->full(array());

			return false;

		}

	}

	public function update(){
		$json = array();

		$this->load->model('setting/setting');

		if (!empty($this->request->get['shipping_method'])) {

			$shipping = explode('.', $this->request->get['shipping_method']);
			$shipping_method = $shipping[0];

			$setting = $this->model_setting_setting->getSetting('custom');

			foreach($setting['custom_shipping']['fields'] as $field){

				if (isset($field['method']) && in_array($shipping_method, $field['method'])){

					if (isset($field['required']) && in_array($shipping_method, $field['required'])){
						$required = true;
					} else {
						$required = false;
					}

					$json[] = array(
						'name' => str_replace('_', '-', $field['name']),
						'required' => $required
					);

				}
			}

			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function save(){

		$json = array();
		
		$this->load->language('extension/module/custom/shipping');

		$this->load->model('setting/setting');
		$this->load->model('account/custom_field');
		$setting = $this->model_setting_setting->getSetting('custom');

		// Method
		if (!isset($this->request->post['shipping_method'])) {
			$json['error']['warning'] = $this->language->get('error_shipping1');
		} else {
			$shipping = explode('.', $this->request->post['shipping_method']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$json['error']['warning'] = $this->language->get('error_shipping2');
			}

			if (!$json) {
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
				$shipping_code = $shipping[0];
			}

		}

		// Address
		if (!$json) {

			// Клиент зарегистрированный
			if ( $this->customer->isLogged() ) {

				// Выбран существующий адрес
				if (isset($this->request->post['shipping_address']) && $this->request->post['shipping_address'] == 'existing') {

					$this->load->model('account/address');

					if (empty($this->request->post['address_id'])) {
						$json['error']['warning'] = $this->language->get('error_address');
					} elseif (!in_array($this->request->post['address_id'], array_keys($this->model_account_address->getAddresses()))) {
						$json['error']['warning'] = $this->language->get('error_address');
					}

					if (!$json) {
						$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);
						$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);
					}
					
				// Новый адрес	
				} else {

					// Обрабатываем адрес
					$result = $this->getAddress($setting['custom_shipping']['fields'], $this->request->post, $shipping_code);

					$json = $result['json'];

					if ( !$json ){
						$address = $this->full($result['address']);

						$this->session->data['payment_address'] = $this->full(array());
						$address['firstname'] = $this->customer->getFirstName();
						$address['lastname'] = $this->customer->getLastName();
						$this->session->data['shipping_address'] = $this->addAddress($address);
					}

				}

			// Не авторизован
			} else {

				// Обрабатываем адрес
				$result = $this->getAddress($setting['custom_shipping']['fields'], $this->request->post, $shipping_code);
				$json = $result['json'];
				
				if (!$json) {

					// Получаем адрес со всеми полями (все поля + юзер)
					$address = $this->full(array_merge($result['address'], $this->session->data['guest']));

					// Надо зарегистрировать
					if ( $this->session->data['account'] == 'register') {

						// Регистрируем юзера и авторизуем его
						$json = $this->addCustomer($address);

						// Добавлем к юзеру адрес
						if (!$json){

							// Очищаем гостя
							unset($this->session->data['guest']);

							$this->session->data['payment_address'] = $this->full(array());
							$this->session->data['shipping_address'] = $this->getAddressById( $this->customer->getAddressId() );

						}

					// Без регистрации	
					} else {

						// Убираем address, так как гостевой заказ данные принимает напрямую.
						if (isset($address['custom_field']['address'])) {
							$custom_field = $address['custom_field']['address'];
							unset($address['custom_field']['address']);
							$address['custom_field'] = $custom_field;
						}

						// Добавляем название страны и геозону
						$this->load->model('extension/module/custom/custom');
						$address = $this->model_extension_module_custom_custom->addAddressInfo($address);
						

						$this->session->data['payment_address'] = $this->full(array());
						$this->session->data['shipping_address'] = $address;

					}

				
				}

			}

		}



		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));


	}

	private function getAddress($fields, $post, $shipping_code){

		$address = array();
		$json = array();

		// Пробегаемся по полям
		foreach($fields as $field){

			$name = $field['name'];
			$value = $post[$name];
			$validation = $field['validation'];

			if (isset($field['method']) && array_search($shipping_code, (array)$field['method']) !== false) {

				// Если поле обязательно, то проверяем его 
				if (isset($field['required']) && array_search($shipping_code, (array)$field['required']) !== false) {

					// Если есть ошибка, то запомниаем её
					if ($this->validate($name, $value, $validation)) {
						if (stripos($name, 'custom_field') === false) {
							$json['error'][$name] = $this->language->get('error_'.$name);
						} else {
							$custom_field = $this->model_account_custom_field->getCustomField((int)substr($name, 12));
							$json['error'][$name] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
						}
					} else {
						$address[$name] = $value;
					}

				} else {
					$address[$name] = $value;
				}

			}	

		}

		return array(
			'json' => $json,
			'address' => $address
		);

	}

	private function full($address){

		// Восстанавливаем custom-поля
		foreach($address as $key => $field){

			// is_array - чтобы не ушатать возможное уже готовое значение
			if (stripos($key, 'custom_field') !== false && !is_array($address[$key])) {
				$id = (int)str_replace('custom_field', '', $key);
				$address['custom_field']['address'][$id] = $field;
				unset($address[$key]);
			}

		}

		// Какие поля должны быть
		$default = array(
			'firstname' => '',
			'lastname' => '',
			'company' => '',
			'address_1' => '',
			'address_2' => '',
			'city' => '',
			'postcode' => '',
			'zone' => '',
			'zone_id' => '',
			'country' => '',
			'default' => true,
			'country_id' => '',
			'address_format' => '',
		);

		return array_merge($default, $address);
	}

	private function validate($name, $value, $validation = ''){

		// Проверяем на пустоту
		if (empty($value)) {
			return true;

		// Проверка на регулярное выражение		
		} elseif (!empty($validation) && !filter_var($value, FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => trim($validation) )))){
			return true;
		}

		return false;

	}

	private function getMethods(){

		// Shipping Methods
		$method_data = array();
		
		$this->load->model('extension/extension');
		$results = $this->model_extension_extension->getExtensions('shipping');

		if (!empty($this->session->data['shipping_address']['country_id'])) {
			$country_id = $this->session->data['shipping_address']['country_id'];	
		} elseif (!empty($this->session->data['prmn.city_manager'])){
			$country_id = $this->progroman_city_manager->getCountryId();
		} else {
			$country_id = $this->config->get('config_country_id');
		}

		if (!empty($this->session->data['shipping_address']['zone_id'])) {
			$zone_id = $this->session->data['shipping_address']['zone_id'];
		} elseif (!empty($this->session->data['prmn.city_manager'])){
			$zone_id = $this->progroman_city_manager->getZoneId();
		} else {
			$zone_id = 0;
		}
		
		if (!empty($this->session->data['shipping_address']['postcode'])) {
			$postcode = $this->session->data['shipping_address']['postcode'];
		} else {
			$postcode = '';
		}
		
		if (!empty($this->session->data['shipping_address']['city'])) {
			$city = $this->session->data['shipping_address']['city'];
		} else {
			$city = '';
		}

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('extension/shipping/' . $result['code']);

				$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote(array(
					'country_id' => $country_id,
					'postcode' => $postcode,
					'zone_id' => $zone_id,
					'city' => $city,
				));

				if ($quote) {
					$method_data[$result['code']] = array(
						'title'      => $quote['title'],
						'quote'      => $quote['quote'],
						'sort_order' => $quote['sort_order'],
						'error'      => $quote['error']
					);
				}
			}
		}
		
		$sort_order = array();

		foreach ($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		return $method_data;

	}

	private function addCustomer($customer){

		$json = array();

		// Регистрариуем
		$this->load->model('account/customer');
		$customer_id = $this->model_account_customer->addCustomer( $customer );

		// Clear any previous login attempts for unregistered accounts.
		$this->model_account_customer->deleteLoginAttempts($customer['email']);

		// Смиотрим, что там с этой группой можно делать
		$this->load->model('account/customer_group');
		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer['customer_group_id']);

		if ($customer_group_info && !$customer_group_info['approval']) {
			$this->customer->login($customer['email'], $customer['password']);
		} else {
			$json['redirect'] = $this->url->link('account/success');
		}

		// Add to activity log
		if ($this->config->get('config_customer_activity')) {

			$this->load->model('account/activity');
			$activity_data = array(
				'customer_id' => $customer_id,
				'name'        => $customer['firstname'] . ' ' . $customer['lastname']
			);
			$this->model_account_activity->addActivity('register', $activity_data);

		}

		return $json;
	}

	private function addAddress($address){

		$this->load->model('account/address');

        $isset_address_id = $this->model_account_address->validateAddress($address);

        if($isset_address_id){
    		$address_id = $isset_address_id;
        } else {
		    $address_id = $this->model_account_address->addAddress($address);
        }
		return $this->model_account_address->getAddress($address_id);

	}

	private function getAddressById($address_id){

		$this->load->model('account/address');

		return $this->model_account_address->getAddress($address_id);

	}

}
