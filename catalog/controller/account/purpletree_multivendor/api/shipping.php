<?php
class ControllerAccountPurpletreeMultivendorApiShipping extends Controller {
		private $error = array();
		private $json = array();
		public function index() {
			$this->load->language('purpletree_multivendor/api');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_approved');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json)); 
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			
			$this->load->language('purpletree_multivendor/shipping');
			$this->load->model('purpletree_multivendor/shipping');
			$json = $this->getList();
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json)); 
			
		}
		
		public function add() {
			$this->load->language('purpletree_multivendor/api');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_approved');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json)); 
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			$this->load->language('purpletree_multivendor/shipping');
			$this->load->model('purpletree_multivendor/shipping');
			if (($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) ) {
				$seller_id=$this->customer->getId();
				$this->model_purpletree_multivendor_shipping->addShipping($this->request->post,$seller_id);
				$this->session->data['success'] = $this->language->get('text_success_add');
				$json['status'] = 'success';
				$json['message'] =  $this->language->get('text_success_add');
				
			}
			$json = $this->getForm();
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		public function deletes() {
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_approved');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json)); 
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			$this->load->language('purpletree_multivendor/shipping');
			$this->load->model('purpletree_multivendor/shipping');
			
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $shipping_id) {
					$this->model_purpletree_multivendor_shipping->deleteShipping($shipping_id);
				}
				$this->session->data['success'] = $this->language->get('text_success_delete');
				$json['status'] = 'success';
				$json['message'] =  $this->language->get('text_success_delete');
			}
			
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function delete() {
			
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_approved');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json)); 
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			$this->load->language('purpletree_multivendor/shipping');
			$this->load->model('purpletree_multivendor/shipping');
			
			if (isset($this->request->get['shipping_id']) ) {
				
				$this->model_purpletree_multivendor_shipping->deleteShipping($this->request->get['shipping_id']);
				
				$this->session->data['success'] = $this->language->get('text_success_delete');
				$json['status'] = 'success';
				$json['message'] =  $this->language->get('text_success_delete');
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		protected function getList() {
			
			if (isset($this->request->get['filter_shipping_country'])) {
				$filter_shipping_country = $this->request->get['filter_shipping_country'];
				} else {
				$filter_shipping_country = '';
			}
			
			if (isset($this->request->get['filter_zip_from'])) {
				$filter_zip_from = $this->request->get['filter_zip_from'];
				} else {
				$filter_zip_from = '';
			}
			
			if (isset($this->request->get['filter_zip_to'])) {
				$filter_zip_to = $this->request->get['filter_zip_to'];
				} else {
				$filter_zip_to = '';
			}
			
			if (isset($this->request->get['filter_price'])) {
				$filter_price = $this->request->get['filter_price'];
				} else {
				$filter_price = '';
			}
			
			if (isset($this->request->get['filter_weight_from'])) {
				$filter_weight_from = $this->request->get['filter_weight_from'];
				} else {
				$filter_weight_from = '';
			}
			
			if (isset($this->request->get['filter_weight_to'])) {
				$filter_weight_to = $this->request->get['filter_weight_to'];
				} else {
				$filter_weight_to = '';
			}
			
			
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
				} else {
				$sort = 'name';
			}
			
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
				} else {
				$order = 'ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
				} else {
				$limit = $this->config->get('config_limit_admin');
			}
			
			$json['data']['sellers'] = array();
			
			$filter_data = array(
			'seller_id'       => $this->customer->getId(),
			'filter_shipping_country'  => $filter_shipping_country,
			'filter_zip_from'          => $filter_zip_from,
			'filter_zip_to'            => $filter_zip_to,
			'filter_price'             => $filter_price,
			'filter_weight_from'       => $filter_weight_from,
			'filter_weight_to'         => $filter_weight_to,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $limit
			);
			
			$shipping_total = $this->model_purpletree_multivendor_shipping->getTotalShipping($filter_data);		
			
			$results = $this->model_purpletree_multivendor_shipping->getShipping($filter_data);
			$curency = $this->config->get('config_currency');
			$this->load->model('purpletree_multivendor/dashboard');
			$currency_detail = $this->model_purpletree_multivendor_dashboard->getCurrencySymbol($curency);
			if(!empty($results)) {
				foreach ($results as $result) {
					
					$json['data']['sellers'][] = array(
					'shipping_id'    => $result['id'],
					'seller_id'    => $result['seller_id'],
					'shipping_country'          => $result['shipping_country'],
					'zipcode_from' => $result['zipcode_from'],
					'zipcode_to'         =>$result['zipcode_to'] ,
					'shipping_price'             => $this->currency->format($result['shipping_price'], $currency_detail['code'], $currency_detail['value']),
					'weight_from'             => $result['weight_from'],
					'weight_to'             => $result['weight_to']
					);
					$json['status'] = 'success';
				}
			}
			if (isset($this->error['warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['warning'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->session->data['success'])) {
				$json['status'] = 'success';
				$json['message'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->request->post['selected'])) {
				$json['data']['selected'] = (array)$this->request->post['selected'];
				} else {
				$json['data']['selected'] = array();
			}
			$json['data']['pagination']['total'] = $shipping_total;
			$json['data']['pagination']['page'] = $page;
			$json['data']['pagination']['limit'] = $this->config->get('config_limit_admin');
			$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($shipping_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($shipping_total - $this->config->get('config_limit_admin'))) ? $shipping_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $shipping_total, ceil($shipping_total / $this->config->get('config_limit_admin')));
			
			
			$json['data']['shipping_country'] = $filter_shipping_country;
			$json['data']['filter_zip_from'] = $filter_zip_from;
			$json['data']['filter_zip_to'] = $filter_zip_to;
			$json['data']['filter_price'] = $filter_price;
			$json['data']['filter_weight_from'] = $filter_weight_from;
			$json['data']['filter_weight_to'] = $filter_weight_to;		
			$this->load->model('localisation/country');
			$json['data']['countries'] = $this->model_localisation_country->getCountries();
			$json['data']['sort'] = $sort;
			$json['data']['order'] = $order;
			
			return $json;
		}
		
		protected function getForm() {
			
			$json['data']['text_form'] = $this->language->get('text_add') ;
			$data['seller_id'] = $this->customer->getId();
			
			if (isset($this->error['warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['warning'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['shipping_country'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['shipping_country']; 
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['zip_from'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['zip_from']; 
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['zip_to'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['zip_to']; 
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['price'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['price']; 
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['weight_from'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['weight_from']; 
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['weight_to'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['weight_to']; 
				return $json;
				} else {
				$json['message'] = '';
			}
			
			$json['data']['seller_id'] =  $this->customer->getId();
			
			if (isset($this->request->post['shipping_country'])) {
				$json['data']['shipping_country'] = $this->request->post['shipping_country'];
				} elseif (!empty($seller_info)) {
				$json['data']['shipping_country'] = $seller_info['shipping_country'];
			}
			
			if (isset($this->request->post['zip_from'])) {
				$json['data']['zip_from'] = $this->request->post['zip_from'];
				} elseif (!empty($seller_info)) {
				$json['data']['zip_from'] = $seller_info['zip_from'];
			}
			if (isset($this->request->post['zip_to'])) {
				$json['data']['zip_to'] = $this->request->post['zip_to'];
				} elseif (!empty($seller_info)) {
				$json['data']['zip_to'] = $seller_info['zip_to'];
			} 
			if (isset($this->request->post['price'])) {
				$json['data']['price'] = $this->request->post['price'];
				} elseif (!empty($seller_info)) {
				$json['data']['price'] = $seller_info['price'];
			} 
			
			if (isset($this->request->post['weight_from'])) {
				$json['data']['weight_from'] = $this->request->post['weight_from'];
				} elseif (!empty($seller_info)) {
				$json['data']['weight_from'] = $seller_info['weight_from'];
			}
			
			if (isset($this->request->post['weight_to'])) {
				$json['data']['weight_to'] = $this->request->post['weight_to'];
				} elseif (!empty($seller_info)) {
				$json['data']['weight_to'] = $seller_info['weight_to'];
			} 
			
			$filter_data = array(
			'sort'  => 'cf.sort_order',
			'order' => 'ASC'
			);
			$this->load->model('localisation/country');
			$json['data']['countries'] = $this->model_localisation_country->getCountries();
			
			$json['status'] = 'success';
			return $json;
		}
		
		protected function validateForm() {
			
			if (($this->request->post['shipping_country'])== '') {
				$this->error['shipping_country'] = $this->language->get('error_shipping_country');
			}
			
			if ((utf8_strlen($this->request->post['zip_from']) < 1) ) {
				$this->error['zip_from'] = $this->language->get('error_zipcode');
			}
			
			if ((utf8_strlen($this->request->post['zip_to']) < 1) ) {
				$this->error['zip_to'] = $this->language->get('error_zipcode');
			}
			
			if( ! filter_var($this->request->post['price'], FILTER_VALIDATE_FLOAT) && $this->request->post['price'] != '0') {
				$this->error['price'] = $this->language->get('error_valid_value');
			}
			if(utf8_strlen($this->request->post['price']) < 1){
				$this->error['price'] = $this->language->get('error_shipping_price');
			}
			
			if( ! filter_var($this->request->post['weight_from'], FILTER_VALIDATE_FLOAT) && $this->request->post['weight_from'] != '0' ){
				$this->error['weight_from'] = $this->language->get('error_valid_value');
			}
			if(utf8_strlen($this->request->post['weight_from']) < 1){
				$this->error['weight_from'] = $this->language->get('error_weight');
			}
			
			if( ! filter_var($this->request->post['weight_to'], FILTER_VALIDATE_FLOAT) && $this->request->post['weight_to'] != '0' ){
				
				$this->error['weight_to'] = $this->language->get('error_valid_value');
			}		
			if($this->request->post['weight_to'] < $this->request->post['weight_from']) {
				$this->error['weight_to'] = $this->language->get('error_weight_to');
			}
			if(utf8_strlen($this->request->post['weight_to'] ) < 1){
				$this->error['weight_to'] = $this->language->get('error_weight');
			}
			return !$this->error; 
		}
}
?>