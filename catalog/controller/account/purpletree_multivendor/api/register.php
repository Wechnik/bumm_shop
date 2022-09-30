<?php
class ControllerAccountPurpletreeMultivendorApiRegister extends Controller {
		private $error = array();
		
		public function index() {
			$json=array();
			$isMobileApiCall=true;
			if (!$isMobileApiCall) {
				$json['stauts'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if ($this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = 'Customer already Login';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$this->load->model('account/customer');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				$customer_id = $this->model_account_customer->addCustomer($this->request->post);
				
				// Clear any previous login attempts for unregistered accounts.
				$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
				
				$this->customer->login($this->request->post['email'], $this->request->post['password']);
				
				unset($this->session->data['guest']);
				
				// Add to activity log
				if ($this->config->get('config_customer_activity')) {
					$this->load->model('account/activity');
					
					$activity_data = array(
					'customer_id' => $customer_id,
					'name'        => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
					);
					
					$this->model_account_activity->addActivity('register', $activity_data);
				}
				$json['status']  = 'success';
				$json['message'] = 'Seller Register Successfully';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				
			}			
			
			if (isset($this->error['warning'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['warning'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['firstname'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['firstname'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (isset($this->error['lastname'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['lastname'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['email'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['email'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['telephone'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['telephone'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (isset($this->error['address_1'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['address_1'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			if (isset($this->error['city'])) {
				$json['data']['error_city'] = $this->error['city'];
				$json['stauts'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['postcode'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['postcode'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['country'])) {
				$json['stauts'] = 'error';
				$json['message'] =$this->error['country'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['zone'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['zone'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['custom_field'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['custom_field'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['password'])) {
				$json['stauts'] = 'error';
				$json['message'] =  $this->error['password'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['seller_store'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['seller_store'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['warning1'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['warning1'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			
			if (isset($this->error['confirm'])) {
				$json['stauts'] = 'error';
				$json['message'] = $this->error['confirm'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$json['status'] = 'error';
			$json['message'] = 'No Data';
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			
		}
		
		private function validate() {
			
			$this->load->model('purpletree_multivendor/vendor');
			if(!$this->customer->validateSeller()) {
				$this->error['warning1'] = $this->language->get('error_license');
			}
			// if($this->config->get('purpletree_multivendor_become_seller')) { 
			if($this->request->post['become_seller']){ 
				$data['become_seller'] = $this->request->post['become_seller'];
				if((utf8_strlen($this->request->post['seller_storename']) < 5) || (utf8_strlen(trim($this->request->post['seller_storename'])) > 50)) {
					$this->error['seller_store'] = $this->language->get('error_storename');
				}
			}
			//}
			
			if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
				$this->error['firstname'] = $this->language->get('error_firstname');
			}
			
			if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
				$this->error['lastname'] = $this->language->get('error_lastname');
			}
			
			if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
				$this->error['email'] = $this->language->get('error_email');
			}
			
			if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
			
			if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
				$this->error['telephone'] = $this->language->get('error_telephone');
			}
			
			if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
				$this->error['address_1'] = $this->language->get('error_address_1');
			}
			
			if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
				$this->error['city'] = $this->language->get('error_city');
			}
			
			$this->load->model('localisation/country');
			
			$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
			
			if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
				$this->error['postcode'] = $this->language->get('error_postcode');
			}
			
			if ($this->request->post['country_id'] == '') {
				$this->error['country'] = $this->language->get('error_country');
			}
			
			if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
				$this->error['zone'] = $this->language->get('error_zone');
			}
			
			// Customer Group
			if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
				$customer_group_id = $this->request->post['customer_group_id'];
				} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}
			
			// Custom field validation
			$this->load->model('account/custom_field');
			
			$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);
			
			foreach ($custom_fields as $custom_field) {
				if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
					$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
					} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
					$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
				}
			}
			
			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}
			
			if ($this->request->post['confirm'] != $this->request->post['password']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');
				
				if ($captcha) {
					$this->error['captcha'] = $captcha;
				}
			}
			
			// Agree to terms
			if ($this->config->get('config_account_id')) {
				$this->load->model('catalog/information');
				
				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
				
				if ($information_info && !isset($this->request->post['agree'])) {
					$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
				}
			}
			
			return !$this->error;
		}
}
?>