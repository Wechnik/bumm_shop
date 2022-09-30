<?php
class ControllerAccountPurpletreeMultivendorSellergeozone extends Controller {
		private $error = array();
		
		public function index() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerblogpost', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){	
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			$this->load->language('purpletree_multivendor/geo_zone');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/geozone');
			
			$this->getList();
		}
		
		public function add() {
		$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){	
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			$this->load->language('purpletree_multivendor/geo_zone');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/geozone');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				//echo"<pre>"; print_r($this->request->post); die;
				$this->request->post['seller_id'] = $this->customer->getId();
				$this->model_purpletree_multivendor_geozone->addSellerGeoZone($this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellergeozone', '', true));
			}
			$this->getForm();
		}
		
		public function edit() {
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){	
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			$this->load->language('purpletree_multivendor/geo_zone');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/geozone');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				
				$this->request->post['seller_id'] = $this->customer->getId();
				
				$this->model_purpletree_multivendor_geozone->editSellerGeoZone($this->request->get['geo_zone_id'], $this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellergeozone', '', true));
			}
			
			$this->getForm();
		}
		
		public function delete() {
		$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){	
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			$this->load->language('purpletree_multivendor/geo_zone');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/geozone');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (isset($this->request->post['selected']) && $this->validateDelete()) {
				
				foreach ($this->request->post['selected'] as $geo_zone_id) {
					$this->model_purpletree_multivendor_geozone->deleteGeoZone($geo_zone_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellergeozone', '', true));
			}
			
			$this->getList();
		}
		
		protected function getList() {
			$data['heading_title'] = $this->language->get('heading_title');
			$data['heading_title1'] = $this->language->get('heading_title1');
			
			$data['text_list'] = $this->language->get('text_list');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			
			$data['column_name'] = $this->language->get('column_name');
			$data['column_description'] = $this->language->get('column_description');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_seller'] = $this->language->get('column_seller');
			$data['column_price'] = $this->language->get('column_price');
			
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
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
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-shipping";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'image/catalog/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'image/catalog/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home','',true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/purpletree_multivendor/sellergeozone', $url, true)
			);
			
			$data['add'] = $this->url->link('account/purpletree_multivendor/sellergeozone/add', $url, true);
			
			$data['delete'] = $this->url->link('account/purpletree_multivendor/sellergeozone/delete', '',true);
			
			$data['geo_zones'] = array();
			
			$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);
			
			$geo_zone_total = $this->model_purpletree_multivendor_geozone->getTotalGeoZones($this->customer->getId());
			
			$results = $this->model_purpletree_multivendor_geozone->getGeoZones($filter_data);
			
			foreach ($results as $result) {
				$data['geo_zones'][] = array(
				'geo_zone_id' => $result['geo_zone_id'],
				'seller_name' => $result['seller_name'],
				'price' => $result['price'],
				'name'        => $result['name'],
				'description' => $result['description'],
				'edit'       => $this->url->link('account/purpletree_multivendor/sellergeozone/edit', '&geo_zone_id=' . $result['geo_zone_id'].$url, true)
				);
			}
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
				} else {
				$data['success'] = '';
			}
			
			if (isset($this->request->post['selected'])) {
				$data['selected'] = (array)$this->request->post['selected'];
				} else {
				$data['selected'] = array();
			}
			
			$url = '';
			
			if ($order == 'ASC') {
				$url .= '&order=DESC';
				} else {
				$url .= '&order=ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$data['sort_name'] = $this->url->link('purpletree_multivendor/sellergeozone',  '&sort=code' . $url, true);
			$data['sort_description'] = $this->url->link('purpletree_multivendor/sellergeozone',  '&sort=code' . $url, true);
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$pagination = new Pagination();
			$pagination->total = $geo_zone_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('account/purpletree_multivendor/sellergeozone', '' . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($geo_zone_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($geo_zone_total - $this->config->get('config_limit_admin'))) ? $geo_zone_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $geo_zone_total, ceil($geo_zone_total / $this->config->get('config_limit_admin')));
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/geo_zone_list', $data));	
		}
		
		protected function getForm() {
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_form'] = !isset($this->request->get['geo_zone_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			$data['text_all_zones'] = $this->language->get('text_all_zones');
			
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_description'] = $this->language->get('entry_description');
			$data['entry_country'] = $this->language->get('entry_country');
			$data['entry_zone'] = $this->language->get('entry_zone');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			$data['button_geo_zone_add'] = $this->language->get('button_geo_zone_add');
			$data['button_remove'] = $this->language->get('button_remove');
			
			$data['seller_name'] = $this->language->get('seller_name');
			$data['entry_price'] = $this->language->get('entry_price');
			$data['text_geo_zone'] = $this->language->get('text_geo_zone');
			
			
			$data['entry_weight_from'] = $this->language->get('entry_weight_from');
			$data['entry_weight_to'] = $this->language->get('entry_weight_to');
			$data['error_weight_from'] = $this->language->get('error_weight_from');
			$data['error_weight_from_numeric'] = $this->language->get('error_weight_from_numeric');
			$data['error_weight_to'] = $this->language->get('error_weight_to');
			$data['error_weight_to_numeric'] = $this->language->get('error_weight_to_numeric');
			
			$data['text_form'] = !isset($this->request->get['geo_zone_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->error['name'])) {
				$data['error_name'] = $this->error['name'];
				} else {
				$data['error_name'] = '';
			}
			
			if (isset($this->error['description'])) {
				$data['error_description'] = $this->error['description'];
				} else {
				$data['error_description'] = '';
			}		
			
			if (isset($this->error['store_name'])) {
				$data['error_store_name'] = $this->error['store_name'];
				} else {
				$data['error_store_name'] = '';
			}
			
			if (isset($this->error['weight_from'])) {
				$data['error_weight_from'] = $this->error['weight_from'];
			} else {
				$data['error_weight_from'] = '';
			}
			
			if (isset($this->error['weight_to'])) {
				$data['error_weight_to'] = $this->error['weight_to'];
			} else {
				$data['error_weight_to'] = '';
			}
			
			if (isset($this->error['price'])) {
				$data['error_price'] = $this->error['price'];
				} else {
				$data['error_price'] = '';
			}
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-shipping";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'image/catalog/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'image/catalog/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home','',true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/purpletree_multivendor/sellergeozone',  $url, true)
			);
			
			if (!isset($this->request->get['geo_zone_id'])) {
				$data['action'] = $this->url->link('account/purpletree_multivendor/sellergeozone/add', $url, true);
				} else {
				$data['action'] = $this->url->link('account/purpletree_multivendor/sellergeozone/edit', '&geo_zone_id=' . $this->request->get['geo_zone_id'] . $url, true);
			}
			$data['cancel'] = $this->url->link('account/purpletree_multivendor/sellergeozone','', true);
			
			
			if (isset($this->request->get['geo_zone_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$geo_zone_info = $this->model_purpletree_multivendor_geozone->getGeoZone($this->request->get['geo_zone_id']);
			}
			
			if (isset($this->request->post['seller_name'])) {
				$data['store_name'] = $this->request->post['seller_name'];
				} elseif (!empty($geo_zone_info)) {
				$data['store_name'] = $geo_zone_info['seller_name'];
				} else {
				$data['store_name'] = '';
			}	

			if (isset($this->request->post['weight_from'])) {
			$data['weight_from'] = $this->request->post['weight_from'];
			} elseif (!empty($geo_zone_info)) {
			$data['weight_from'] = $geo_zone_info['weight_from'];
			} else {
			$data['weight_from'] = '';
			}	
			
			if (isset($this->request->post['weight_to'])) {
			$data['weight_to'] = $this->request->post['weight_to'];
			} elseif (!empty($geo_zone_info)) {
			$data['weight_to'] = $geo_zone_info['weight_to'];
			} else {
			$data['weight_to'] = '';
			}	
			
			if (isset($this->request->post['price'])) {
				$data['price'] = $this->request->post['price'];
				} elseif (!empty($geo_zone_info)) {
				$data['price'] = $geo_zone_info['price'];
				} else {
				$data['price'] = '';
			}		
			if (isset($this->request->post['seller_id'])) {
				$data['vendor_id'] = $this->request->post['seller_id'];
				} elseif (!empty($geo_zone_info)) {
				$data['vendor_id'] = $geo_zone_info['seller_id'];
				} else {
				$data['vendor_id'] = '';
			}		
			if (isset($this->request->post['name'])) {
				$data['name'] = $this->request->post['name'];
				} elseif (!empty($geo_zone_info)) {
				$data['name'] = $geo_zone_info['name'];
				} else {
				$data['name'] = '';
			}
			
			if (isset($this->request->post['description'])) {
				$data['description'] = $this->request->post['description'];
				} elseif (!empty($geo_zone_info)) {
				$data['description'] = $geo_zone_info['description'];
				} else {
				$data['description'] = '';
			}
			
			$this->load->model('localisation/country');
			
			$data['countries'] = $this->model_localisation_country->getCountries();
			
			if (isset($this->request->post['zone_to_geo_zone'])) {
				$data['zone_to_geo_zones'] = $this->request->post['zone_to_geo_zone'];
				} elseif (isset($this->request->get['geo_zone_id'])) {
				$data['zone_to_geo_zones'] = $this->model_purpletree_multivendor_geozone->getZoneToGeoZones($this->request->get['geo_zone_id']);
				} else {
				$data['zone_to_geo_zones'] = array();
			}
			$data['ver']=VERSION;
			if($data['ver']=='3.1.0.0_b'){
				$this->document->addScript('admin/view/javascript/ckeditor/ckeditor.js');
				$this->document->addScript('admin/view/javascript/ckeditor/adapters/jquery.js');
				} else {
				$this->document->addScript('catalog/view/javascript/purpletree/summernote/summernote.js'); 
				$this->document->addStyle('catalog/view/javascript/purpletree/summernote/summernote.css'); 
				$this->document->addScript('catalog/view/javascript/purpletree/summernote/summernote-image-attributes.js'); 
				$this->document->addScript('catalog/view/javascript/purpletree/summernote/opencart.js'); 
			}
			$data['text_select_country'] = $this->language->get('text_select_country');
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/geo_zone_form', $data));
		}
		
		protected function validateForm() {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
				$this->error['name'] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($this->request->post['description']) < 3) || (utf8_strlen($this->request->post['description']) > 255)) {
				$this->error['description'] = $this->language->get('error_description');
			}
			if ((utf8_strlen($this->request->post['weight_from']) < 1 ) || (utf8_strlen($this->request->post['weight_from']) > 255)) {
				$this->error['weight_from'] = $this->language->get('error_weight_from');
			} elseif (!is_numeric($this->request->post['weight_from'])) {
				$this->error['weight_from'] = $this->language->get('error_weight_from_numeric');
			}
			
			if ((utf8_strlen($this->request->post['weight_to']) < 1 ) || (utf8_strlen($this->request->post['weight_to']) > 255)) {
				$this->error['weight_to'] = $this->language->get('error_weight_to');
			} elseif (!is_numeric($this->request->post['weight_to'])) {
				$this->error['weight_to'] = $this->language->get('error_weight_to_numeric');
			}
			
			if ((utf8_strlen($this->request->post['price']) < 1 ) || (utf8_strlen($this->request->post['price']) > 255)) {
				$this->error['price'] = $this->language->get('error_price');
				}elseif(!is_numeric($this->request->post['price'])){
				$this->error['price'] = $this->language->get('error_priceint');
			}
			
			return !$this->error;
		}
		
		protected function validateDelete() {
			
			$this->load->model('purpletree_multivendor/geozone');
			
			foreach ($this->request->post['selected'] as $geo_zone_id) {
				$tax_rate_total = $this->model_purpletree_multivendor_geozone->getTotalTaxRatesByGeoZoneId($geo_zone_id);
				
				if ($tax_rate_total) {
					$this->error['warning'] = sprintf($this->language->get('error_tax_rate'), $tax_rate_total);
				}
			}
			
			return !$this->error;
		}
}
?>