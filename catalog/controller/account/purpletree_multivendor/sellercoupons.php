<?php
class ControllerAccountPurpletreeMultivendorSellercoupons extends Controller {
		private $error = array();
		
		public function index() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/dashboard', '', true);
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
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
			}
			$this->load->language('purpletree_multivendor/sellercoupon');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellercoupons');
			
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
			$this->load->language('purpletree_multivendor/sellercoupon');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellercoupons');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				
				$this->model_purpletree_multivendor_sellercoupons->addCoupon($this->customer->getId(),$this->request->post);
				
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
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellercoupons', '', true));
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
			$this->load->language('purpletree_multivendor/sellercoupon');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellercoupons');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				//echo"<pre>"; print_r($this->request->post); die;
				$this->model_purpletree_multivendor_sellercoupons->editCoupon($this->request->get['coupon_id'], $this->request->post);
				
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
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellercoupons', '', true));
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
			$this->load->language('purpletree_multivendor/sellercoupon');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellercoupons');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $coupon_id) {
					$this->model_purpletree_multivendor_sellercoupons->deleteCoupon($coupon_id);
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
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellercoupons', '', true));
			}
			
			$this->getList();
		}
		
		protected function getList() {
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-coupons";
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
			'href' => $this->url->link('account/purpletree_multivendor/sellercoupons',  $url, true)
			);
			$data['add'] = $this->url->link('account/purpletree_multivendor/sellercoupons/add', '',true);
			$data['delete'] = $this->url->link('account/purpletree_multivendor/sellercoupons/delete', '',true);
			
			$data['coupons'] = array();
			
			$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);
			
			$coupon_total = $this->model_purpletree_multivendor_sellercoupons->getTotalCoupons($this->customer->getId());
			
			$results = $this->model_purpletree_multivendor_sellercoupons->getCoupons($this->customer->getId(),$filter_data);
			
			foreach ($results as $result) {
				$data['coupons'][] = array(
				'coupon_id'  => $result['coupon_id'],
				'name'       => $result['name'],
				'code'       => $result['code'],
				'discount'   => $result['discount'],
				'date_start' => date($this->language->get('date_format_short'), strtotime($result['date_start'])),
				'date_end'   => date($this->language->get('date_format_short'), strtotime($result['date_end'])),
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'edit'       => $this->url->link('account/purpletree_multivendor/sellercoupons/edit', '&coupon_id=' . $result['coupon_id'].$url, true)
				);
			}
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_list'] = $this->language->get('text_list');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			
			$data['column_name'] = $this->language->get('column_name');
			$data['column_code'] = $this->language->get('column_code');
			$data['column_discount'] = $this->language->get('column_discount');
			$data['column_date_start'] = $this->language->get('column_date_start');
			$data['column_date_end'] = $this->language->get('column_date_end');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_action'] = $this->language->get('column_action');
			
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			
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
			
			$data['sort_name'] = $this->url->link('account/purpletree_multivendor/sellercoupons' , $url, true);
			$data['sort_code'] = $this->url->link('account/purpletree_multivendor/sellercoupons',  '&sort=code' . $url, true);
			$data['sort_discount'] = $this->url->link('account/purpletree_multivendor/sellercoupons', '&sort=discount' . $url, true);
			$data['sort_date_start'] = $this->url->link('account/purpletree_multivendor/sellercoupons', '&sort=date_start' . $url, true);
			$data['sort_date_end'] = $this->url->link('account/purpletree_multivendor/sellercoupons', '&sort=date_end' . $url, true);
			$data['sort_status'] = $this->url->link('account/purpletree_multivendor/sellercoupons', '&sort=status' . $url, true);
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$pagination = new Pagination();
			$pagination->total = $coupon_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('account/purpletree_multivendor/sellercoupons', '' . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			$data['results'] = sprintf($this->language->get('text_pagination'), ($coupon_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($coupon_total - $this->config->get('config_limit_admin'))) ? $coupon_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $coupon_total, ceil($coupon_total / $this->config->get('config_limit_admin')));
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/coupon_list', $data));
		}
		
		protected function getForm() {
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
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_form'] = !isset($this->request->get['coupon_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
			$data['text_percent'] = $this->language->get('text_percent');
			$data['text_amount'] = $this->language->get('text_amount');
			
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_description'] = $this->language->get('entry_description');
			$data['entry_code'] = $this->language->get('entry_code');
			$data['entry_discount'] = $this->language->get('entry_discount');
			$data['entry_logged'] = $this->language->get('entry_logged');
			$data['entry_shipping'] = $this->language->get('entry_shipping');
			$data['entry_type'] = $this->language->get('entry_type');
			$data['entry_total'] = $this->language->get('entry_total');
			$data['entry_category'] = $this->language->get('entry_category');
			$data['entry_product'] = $this->language->get('entry_product');
			$data['entry_date_start'] = $this->language->get('entry_date_start');
			$data['entry_date_end'] = $this->language->get('entry_date_end');
			$data['entry_uses_total'] = $this->language->get('entry_uses_total');
			$data['entry_uses_customer'] = $this->language->get('entry_uses_customer');
			$data['entry_status'] = $this->language->get('entry_status');
			
			$data['help_code'] = $this->language->get('help_code');
			$data['help_type'] = $this->language->get('help_type');
			$data['help_logged'] = $this->language->get('help_logged');
			$data['help_total'] = $this->language->get('help_total');
			$data['help_category'] = $this->language->get('help_category');
			$data['help_product'] = $this->language->get('help_product');
			$data['help_uses_total'] = $this->language->get('help_uses_total');
			$data['help_uses_customer'] = $this->language->get('help_uses_customer');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			$data['tab_general'] = $this->language->get('tab_general');
			$data['button_back'] = $this->language->get('button_back');
			$data['tab_history'] = $this->language->get('tab_history');
			$data['button_continue'] = $this->language->get('button_continue');
			
			$data['text_form'] = !isset($this->request->get['coupon_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			
			if (isset($this->request->get['coupon_id'])) {
				$data['coupon_id'] = $this->request->get['coupon_id'];
				} else {
				$data['coupon_id'] = 0;
			}
			
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
			
			if (isset($this->error['code'])) {
				$data['error_code'] = $this->error['code'];
				} else {
				$data['error_code'] = '';
			}
			
			if (isset($this->error['date_start'])) {
				$data['error_date_start'] = $this->error['date_start'];
				} else {
				$data['error_date_start'] = '';
			}
			
			if (isset($this->error['date_end'])) {
				$data['error_date_end'] = $this->error['date_end'];
				} else {
				$data['error_date_end'] = '';
			}
			
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-coupons";
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
			'href' => $this->url->link('account/purpletree_multivendor/sellertemplateproduct',  $url, true)
			);
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/moment.js'); 
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js'); 
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
			$this->document->addScript('catalog/view/javascript/purpletree/summernote/summernote.js'); 
			$this->document->addStyle('catalog/view/javascript/purpletree/summernote/summernote.css');
			$this->document->addScript('catalog/view/javascript/purpletree/summernote/opencart.js'); 
			if (!isset($this->request->get['coupon_id'])) {
				$data['action'] = $this->url->link('account/purpletree_multivendor/sellercoupons/add', '',true);
				} else {
				$data['action'] = $this->url->link('account/purpletree_multivendor/sellercoupons/edit','&coupon_id=' . $this->request->get['coupon_id'] , true);
			}
			$data['cancel'] = $this->url->link('account/purpletree_multivendor/sellercoupons','', true);
			
			if (isset($this->request->get['coupon_id']) && (!$this->request->server['REQUEST_METHOD'] != 'POST')) {
				$coupon_info = $this->model_purpletree_multivendor_sellercoupons->getCoupon($this->request->get['coupon_id']);
			}
			
			if (isset($this->request->post['name'])) {
				$data['name'] = $this->request->post['name'];
				} elseif (!empty($coupon_info)) {
				$data['name'] = $coupon_info['name'];
				} else {
				$data['name'] = '';
			}
			
			if (isset($this->request->post['code'])) {
				$data['code'] = $this->request->post['code'];
				} elseif (!empty($coupon_info)) {
				$data['code'] = $coupon_info['code'];
				} else {
				$data['code'] = '';
			}
			
			if (isset($this->request->post['type'])) {
				$data['type'] = $this->request->post['type'];
				} elseif (!empty($coupon_info)) {
				$data['type'] = $coupon_info['type'];
				} else {
				$data['type'] = '';
			}
			
			if (isset($this->request->post['discount'])) {
				$data['discount'] = $this->request->post['discount'];
				} elseif (!empty($coupon_info)) {
				$data['discount'] = $coupon_info['discount'];
				} else {
				$data['discount'] = '';
			}
			
			if (isset($this->request->post['logged'])) {
				$data['logged'] = $this->request->post['logged'];
				} elseif (!empty($coupon_info)) {
				$data['logged'] = $coupon_info['logged'];
				} else {
				$data['logged'] = '';
			}
			
			if (isset($this->request->post['shipping'])) {
				$data['shipping'] = $this->request->post['shipping'];
				} elseif (!empty($coupon_info)) {
				$data['shipping'] = $coupon_info['shipping'];
				} else {
				$data['shipping'] = '';
			}
			
			if (isset($this->request->post['total'])) {
				$data['total'] = $this->request->post['total'];
				} elseif (!empty($coupon_info)) {
				$data['total'] = $coupon_info['total'];
				} else {
				$data['total'] = '';
			}
			
			if (isset($this->request->post['coupon_product'])) {
				$products = $this->request->post['coupon_product'];
				} elseif (isset($this->request->get['coupon_id'])) {
				$products = $this->model_purpletree_multivendor_sellercoupons->getCouponProducts($this->request->get['coupon_id']);
				} else {
				$products = array();
			}
			
			$this->load->model('catalog/product');
			
			$data['coupon_product'] = array();
			
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);
				
				if ($product_info) {
					$data['coupon_product'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
					);
				}
			}
			
			if (isset($this->request->post['coupon_category'])) {
				$categories = $this->request->post['coupon_category'];
				} elseif (isset($this->request->get['coupon_id'])) {
				$categories = $this->model_purpletree_multivendor_sellercoupons->getCouponCategories($this->request->get['coupon_id']);
				} else {
				$categories = array();
			}
			
			$this->load->model('catalog/category');
			$this->load->model('purpletree_multivendor/sellerproduct');
			$data['coupon_category'] = array();
			
			foreach ($categories as $category_id) {
				$category_info = $this->model_purpletree_multivendor_sellerproduct->getCategory($category_id);
				
				if ($category_info) {
					$data['coupon_category'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']
					);
				}
			}
			
			if (isset($this->request->post['date_start'])) {
				$data['date_start'] = $this->request->post['date_start'];
				} elseif (!empty($coupon_info)) {
				$data['date_start'] = ($coupon_info['date_start'] != '0000-00-00' ? $coupon_info['date_start'] : '');
				} else {
				$data['date_start'] = date('Y-m-d', time());
			}
			
			if (isset($this->request->post['date_end'])) {
				$data['date_end'] = $this->request->post['date_end'];
				} elseif (!empty($coupon_info)) {
				$data['date_end'] = ($coupon_info['date_end'] != '0000-00-00' ? $coupon_info['date_end'] : '');
				} else {
				$data['date_end'] = date('Y-m-d', strtotime('+1 month'));
			}
			
			if (isset($this->request->post['uses_total'])) {
				$data['uses_total'] = $this->request->post['uses_total'];
				} elseif (!empty($coupon_info)) {
				$data['uses_total'] = $coupon_info['uses_total'];
				} else {
				$data['uses_total'] = 1;
			}
			
			if (isset($this->request->post['uses_customer'])) {
				$data['uses_customer'] = $this->request->post['uses_customer'];
				} elseif (!empty($coupon_info)) {
				$data['uses_customer'] = $coupon_info['uses_customer'];
				} else {
				$data['uses_customer'] = 1;
			}
			
			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
				} elseif (!empty($coupon_info)) {
				$data['status'] = $coupon_info['status'];
				} else {
				$data['status'] = true;
			}
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/coupon_form', $data));
		}
		
		protected function validateForm() {
			
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 128)) {
				$this->error['name'] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($this->request->post['code']) < 3) || (utf8_strlen($this->request->post['code']) > 10)) {
				$this->error['code'] = $this->language->get('error_code');
			}
			
			$coupon_info = $this->model_purpletree_multivendor_sellercoupons->getCouponByCode($this->request->post['code']);
			
			if ($coupon_info) {
				if (!isset($this->request->get['coupon_id'])) {
					$this->error['warning'] = $this->language->get('error_exists');
					} elseif ($coupon_info['coupon_id'] != $this->request->get['coupon_id']) {
					$this->error['warning'] = $this->language->get('error_exists');
				}
			}
			
			return !$this->error;
		}
		
		public function history() {
			$this->load->language('purpletree_multivendor/sellercoupon');
			
			$this->load->model('purpletree_multivendor/sellercoupons');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$data['text_no_results'] = $this->language->get('text_no_results');
			
			$data['column_order_id'] = $this->language->get('column_order_id');
			$data['column_customer'] = $this->language->get('column_customer');
			$data['column_amount'] = $this->language->get('column_amount');
			$data['column_date_added'] = $this->language->get('column_date_added');
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			
			$data['histories'] = array();
			
			$results = $this->model_purpletree_multivendor_sellercoupons->getCouponHistories($this->request->get['coupon_id'], ($page - 1) * 10, 10);
			
			foreach ($results as $result) {
				$data['histories'][] = array(
				'order_id'   => $result['order_id'],
				'customer'   => $result['customer'],
				'amount'     => $result['amount'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
				);
			}
			
			$history_total = $this->model_purpletree_multivendor_sellercoupons->getTotalCouponHistories($this->request->get['coupon_id'],$this->customer->getId());
			$url ='';
			$pagination = new Pagination();
			$pagination->total = $history_total;
			$pagination->page = $page;
			$pagination->limit = 10;
			$pagination->url = $this->url->link('account/purpletree_multivendor/sellercoupons/history', $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf('Showing %d to %d of %d (%d Pages)', ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/coupon_history', $data));
		}
}
?>