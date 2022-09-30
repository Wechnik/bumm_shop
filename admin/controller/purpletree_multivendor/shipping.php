<?php
class ControllerPurpletreeMultivendorShipping extends Controller {
		private $error = array();
		
		public function index() {
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				
			}
			$this->load->language('purpletree_multivendor/shipping');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/shipping');
			
			$this->getList();
			
		} 
		
		public function add() {
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->load->language('purpletree_multivendor/shipping');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/shipping');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) ) {
				
				$this->model_purpletree_multivendor_shipping->addShipping($this->request->post);
				$this->session->data['success'] = $this->language->get('text_success_add');
				
				$url = '';
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getForm();
		}
		public function edit() {
			$this->load->language('purpletree_multivendor/shipping');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/shipping');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_purpletree_multivendor_shipping->editShipping($this->request->get['shipping_id'], $this->request->post);
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
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			$this->getForm();
		}
		public function delete() {
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			$this->load->language('purpletree_multivendor/shipping');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/shipping');
			
			if (isset($this->request->post['selected']) && $this->validateDelete()) {
				foreach ($this->request->post['selected'] as $shipping_id) {
					
					$this->model_purpletree_multivendor_shipping->deleteShipping($shipping_id);
					
				}
				
				$this->session->data['success'] = $this->language->get('text_success_delete');
				
				$url = '';		
				
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getList();
		}
		
		public function deletes() {
			
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			$this->load->language('purpletree_multivendor/shipping');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/shipping');
			
			if (isset($this->request->get['shipping_id']) && $this->validateDelete()) {
				
				$this->model_purpletree_multivendor_shipping->deleteShipping($this->request->get['shipping_id']);
				
				$this->session->data['success'] = $this->language->get('text_success_delete');
				
				$url = '';
				
				
				$this->response->redirect($this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getList();
		}		
		
		protected function getList() {
		    $this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
				} else {
				$filter_name = '';
			}
			
			if (isset($this->request->get['filter_id'])) {
				$filter_id = $this->request->get['filter_id'];
				} else {
				$filter_id = '';
			}
			
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
			
			$url = '';
			
			if (isset($this->request->get['filter_id'])) {
				$url .= '&filter_id=' . $this->request->get['filter_id'];
			}
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_shipping_country'])) {
				$url .= '&filter_shipping_country=' . urlencode(html_entity_decode($this->request->get['filter_shipping_country'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_zip_from'])) {
				$url .= '&filter_zip_from=' . $this->request->get['filter_zip_from'];
			}
			
			if (isset($this->request->get['filter_zip_to'])) {
				$url .= '&filter_zip_to=' . $this->request->get['filter_zip_to'];
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_weight_from'])) {
				$url .= '&filter_weight_from=' . $this->request->get['filter_weight_from'];
			}
			
			if (isset($this->request->get['filter_weight_to'])) {
				$url .= '&filter_weight_to=' . $this->request->get['filter_weight_to'];
			}			
			
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
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'view/image/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'view/image/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			$data['add'] = $this->url->link('purpletree_multivendor/shipping/add', 'token=' . $this->session->data['token'] . $url, true);
			$data['delete'] = $this->url->link('purpletree_multivendor/shipping/delete', 'token=' . $this->session->data['token'] . $url, true);
			
			
			$data['sellers'] = array();
			
			$filter_data = array(
			'filter_name'              => $filter_name,
			'filter_id'              => $filter_id,
			'filter_shipping_country'  => $filter_shipping_country,
			'filter_zip_from'          => $filter_zip_from,
			'filter_zip_to'            => $filter_zip_to,
			'filter_price'             => $filter_price,
			'filter_weight_from'       => $filter_weight_from,
			'filter_weight_to'         => $filter_weight_to,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
			);
			$data['heading_title'] = $this->language->get('heading_title');
			$this->load->language('purpletree_multivendor/stores');
			$text_n_a = $this->language->get('text_n_a');
			$text_all = $this->language->get('text_all');
			$shipping_total = $this->model_purpletree_multivendor_shipping->getTotalShipping($filter_data);		
			$results = $this->model_purpletree_multivendor_shipping->getShipping($filter_data);
			$this->load->model('purpletree_multivendor/sellerpayment');
			$curency = $this->config->get('config_currency');
			
			$currency_detail = $this->model_purpletree_multivendor_sellerpayment->getCurrencySymbol($curency);
			
			foreach ($results as $result) {
				$name = '';
           if(($result['seller_id'] != 0) && ($result['seller_id'] != -1) ) {
					$seller = $this->model_purpletree_multivendor_shipping->getSellersName($result['seller_id']);
					$name = $seller['name'];
				}else{
				  if($result['seller_id'] == -1) {
				       $name = $text_all;
			      }elseif($result['seller_id']== 0){				      
					   $name = $text_n_a;
			      }
				}
				
				$data['sellers'][] = array(
			    'shipping_id'    => $result['id'],
				'seller_id'    => $result['seller_id'],
				'name'           => $name,
				'shipping_country'          => $result['shipping_country'],
				'zipcode_from' => $result['zipcode_from'],
				'zipcode_to'         =>$result['zipcode_to'] ,				
				'weight_from'             => $result['weight_from'],
				'weight_to'             => $result['weight_to'],
				'shipping_price'             => $this->currency->format($result['shipping_price'], $currency_detail['code'], $currency_detail['value']),
				//'max_days'             => $result['max_days'],
				'deletes'           => $this->url->link('purpletree_multivendor/shipping/deletes', 'token=' . $this->session->data['token'] . '&shipping_id=' . $result['id'] . $url, true),
				'edit'           => $this->url->link('purpletree_multivendor/shipping/edit', 'token=' . $this->session->data['token'] . '&shipping_id=' . $result['id'] . $url, true)
				);
			}
			
			$data['token'] = $this->session->data['token'];
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				}elseif (isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				unset($this->session->data['error_warning']);
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
			
			
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			//$data['heading_title'] = $this->language->get('heading_title');
			$data['manageshippingoption'] = $this->language->get('manageshippingoption');
			$data['text_list'] = $this->language->get('text_list');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_zip_from'] = $this->language->get('column_zip_from');
			$data['column_zip_to'] = $this->language->get('column_zip_to');
			$data['column_weight_from'] = $this->language->get('column_weight_from');
			$data['column_weight_to'] = $this->language->get('column_weight_to');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_max_days'] = $this->language->get('column_max_days');
			$data['column_shipping_country'] = $this->language->get('column_shipping_country');
			$data['column_price'] = $this->language->get('column_price');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_filter'] = $this->language->get('text_filter'); 
			$data['entry_seller_name'] = $this->language->get('entry_seller_name'); 
			$data['entry_shipping_country'] = $this->language->get('entry_shipping_country');$data['entry_zip_from'] = $this->language->get('entry_zip_from');
			$data['entry_zip_to'] = $this->language->get('entry_zip_to');
			$data['entry_weight_from'] = $this->language->get('entry_weight_from');
			$data['entry_weight_to'] = $this->language->get('entry_weight_to');
			$data['entry_max_days'] = $this->language->get('entry_max_days');
			$data['entry_price'] = $this->language->get('entry_price');
			$data['button_filter'] = $this->language->get('button_filter');
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_confirm'] = $this->language->get('text_confirm');
			
			$data['sort_name'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
			$data['sort_shipping_country'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=cu.name' . $url, true);
			$data['sort_zip_from'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=pvs.zipcode_from' . $url, true);
			$data['sort_zip_to'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=pvs.zipcode_to' . $url, true);
			$data['sort_price'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=pvs.shipping_price' . $url, true);
			$data['sort_weight_from'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=pvs.weight_from' . $url, true);
			$data['sort_weight_to'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . '&sort=pvs.weight_to' . $url, true);
			
			
            $url = '';
			
			if (isset($this->request->get['filter_id'])) {
				$url .= '&filter_id=' . $this->request->get['filter_id'];
			}
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_shipping_country'])) {
				$url .= '&filter_shipping_country=' . urlencode(html_entity_decode($this->request->get['filter_shipping_country'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_zip_from'])) {
				$url .= '&filter_zip_from=' . $this->request->get['filter_zip_from'];
			}
			
			if (isset($this->request->get['filter_zip_to'])) {
				$url .= '&filter_zip_to=' . $this->request->get['filter_zip_to'];
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_weight_from'])) {
				$url .= '&filter_weight_from=' . $this->request->get['filter_weight_from'];
			}
			
			if (isset($this->request->get['filter_weight_to'])) {
				$url .= '&filter_weight_to=' . $this->request->get['filter_weight_to'];
			}
			
			
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			$pagination = new Pagination();
			$pagination->total = $shipping_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($shipping_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($shipping_total - $this->config->get('config_limit_admin'))) ? $shipping_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $shipping_total, ceil($shipping_total / $this->config->get('config_limit_admin')));
			$data['manageshippingoption'] = $this->language->get('manageshippingoption');
			$data['manageshippingoptionUrl'] = $this->url->link('extension/shipping/purpletree_shipping', 'token=' . $this->session->data['token'], true);
			$data['button_upload'] = $this->language->get('button_upload');
			$data['filter_name'] = $filter_name;
			$data['filter_id'] = $filter_id;
			$data['shipping_country'] = $filter_shipping_country;
			$data['filter_zip_from'] = $filter_zip_from;
			$data['filter_zip_to'] = $filter_zip_to;
			$data['filter_price'] = $filter_price;
			$data['filter_weight_from'] = $filter_weight_from;	
			$data['filter_weight_to'] = $filter_weight_to;	
			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['url'] = $this->url->link('purpletree_multivendor/bulkshippingupload', 'token=' . $this->session->data['token'], true);
			$this->load->model('localisation/country');
			$data['countries'] = $this->model_localisation_country->getCountries();		
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			$this->response->setOutput($this->load->view('purpletree_multivendor/shipping_list', $data));
		}
		
		protected function getForm() {
		    $this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			if(isset($this->request->get['shipping_id'])){
			$data['text_form'] = $this->language->get('text_edit');
			}else{
			$data['text_form'] = $this->language->get('text_add');
			}
			$data['token'] = $this->session->data['token'];
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->error['filter_name'])) {
				$data['error_filter_name'] = $this->error['filter_name'];
				} else {
				$data['error_filter_name'] = '';
			}
			
			if (isset($this->error['lastname'])) {
				$data['error_lastname'] = $this->error['lastname'];
				} else {
				$data['error_lastname'] = '';
			}
			
			if (isset($this->error['shipping_country'])) {
				$data['error_shipping_country'] = $this->error['shipping_country'];
				} else {
				$data['error_shipping_country'] = '';
			}
			
			if (isset($this->error['zip_from'])) {
				$data['error_zip_from'] = $this->error['zip_from'];
				} else {
				$data['error_zip_from'] = '';
			}
			
			if (isset($this->error['zip_to'])) {
				$data['error_zip_to'] = $this->error['zip_to'];
				} else {
				$data['error_zip_to'] = '';
			}
			
			if (isset($this->error['price'])) {
				$data['error_price'] = $this->error['price'];
				} else {
				$data['error_price'] = '';
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
			
			/* 		if (isset($this->error['max_days'])) {
				$data['error_max_days'] = $this->error['max_days'];
				} else {
				$data['error_max_days'] = '';
			} */
			$url = '';
			
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-shipping";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'view/image/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'view/image/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			$data['action'] = $this->url->link('purpletree_multivendor/shipping/add', 'token=' . $this->session->data['token'] . $url, true);
			
			
			$data['cancel'] = $this->url->link('purpletree_multivendor/shipping', 'token=' . $this->session->data['token'] . $url, true);
			if (isset($this->request->get['shipping_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$shipping_info = $this->model_purpletree_multivendor_shipping->getSellerShipping($this->request->get['shipping_id']);
				//echo"<pre>"; print_r($shipping_info); die;
			}
			if (isset($this->request->post['filter_name'])) {
				$data['filter_name'] = $this->request->post['filter_name'];
				} elseif (!empty($seller_info)) {
				$data['filter_name'] = $seller_info['filter_name'];
				} else {
				$data['filter_name'] = '';
			}
			$data['heading_title'] = $this->language->get('heading_title');
			$this->load->language('purpletree_multivendor/stores');
			$text_n_a = $this->language->get('text_n_a');
			$text_all = $this->language->get('text_all');
			if (isset($this->request->post['shipping_id'])) {
				$data['shipping_id'] = $this->request->post['shipping_id'];
				} elseif (!empty($shipping_info)) {
				$data['shipping_id'] = $shipping_info['id'];
				} else {
				$data['shipping_id'] = '';
			}		
			if (isset($this->request->post['seller_id'])) {
				$data['seller_id'] = $this->request->post['seller_id'];
				} elseif (!empty($shipping_info)) {
				$data['seller_id'] = $shipping_info['seller_id'];
				} else {
				$data['seller_id'] = '';
			}
			$this->load->language('purpletree_multivendor/stores');
			if (isset($this->request->post['filter_name'])) {
				$data['filter_name'] = $this->request->post['filter_name'];
				} elseif (!empty($shipping_info)) {
				if($shipping_info['seller_id'] == -1) {				 
				    $data['filter_name'] = $text_all;
			    }elseif($shipping_info['seller_id'] == 0){
				   $data['filter_name'] = $text_n_a;
			    }else{
				$data['filter_name'] = $shipping_info['store_name'];
				}
				} else {
				$data['filter_name'] = '';
			}
			
			if (isset($this->request->post['shipping_id'])) {
				$data['shipping_id'] = $this->request->post['shipping_id'];
				} elseif (!empty($shipping_info)) {
				$data['shipping_id'] = $shipping_info['id'];
				} else {
				$data['shipping_id'] = '';
			}		
			if (isset($this->request->post['shipping_country'])) {
				$data['shipping_country'] = $this->request->post['shipping_country'];
				} elseif (!empty($shipping_info)) {
				$data['shipping_country'] = $shipping_info['shipping_country'];
				} else {
				$data['shipping_country'] = '';
			}
			if (isset($this->request->post['zip_from'])) {
				$data['zip_from'] = $this->request->post['zip_from'];
				} elseif (!empty($shipping_info)) {
				$data['zip_from'] = $shipping_info['zipcode_from'];
				} else {
				$data['zip_from'] = '';
			}		
			if (isset($this->request->post['zip_to'])) {
				$data['zip_to'] = $this->request->post['zip_to'];
				} elseif (!empty($shipping_info)) {
				$data['zip_to'] = $shipping_info['zipcode_to'];
				} else {
				$data['zip_to'] = '';
			}		
			if (isset($this->request->post['price'])) {
				$data['price'] = $this->request->post['price'];
				} elseif (!empty($shipping_info)) {
				$data['price'] = $shipping_info['shipping_price'];
				} else {
				$data['price'] = '';
			}	
			if (isset($this->request->post['weight_from'])) {
				$data['weight_from'] = $this->request->post['weight_from'];
				} elseif (!empty($shipping_info)) {
				$data['weight_from'] = $shipping_info['weight_from'];
				} else {
				$data['weight_from'] = '';
			}		
			if (isset($this->request->post['weight_to'])) {
				$data['weight_to'] = $this->request->post['weight_to'];
				} elseif (!empty($shipping_info)) {
				$data['weight_to'] = $shipping_info['weight_to'];
				} else {
				$data['weight_to'] = '';
			}
			$filter_data = array(
			'sort'  => 'cf.sort_order',
			'order' => 'ASC'
			);
			//$data['heading_title'] = $this->language->get('heading_title');
			$data['entry_seller_name'] = $this->language->get('entry_seller_name'); 
			$data['entry_shipping_country'] = $this->language->get('entry_shipping_country');$data['entry_zip_from'] = $this->language->get('entry_zip_from');
			$data['entry_zip_to'] = $this->language->get('entry_zip_to');
			$data['entry_weight_from'] = $this->language->get('entry_weight_from');
			$data['entry_weight_to'] = $this->language->get('entry_weight_to');
			$data['entry_max_days'] = $this->language->get('entry_max_days');
			$data['entry_price'] = $this->language->get('entry_price');
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			$data['text_select'] = $this->language->get('text_select');
			
			$this->load->model('localisation/country');
			$data['countries'] = $this->model_localisation_country->getCountries();
			
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/shipping_form', $data));
		}
		
		protected function validateForm() {
			
			if (utf8_strlen($this->request->post['filter_name']) == '') {
				$this->error['filter_name'] = $this->language->get('error_filter_name');
			}
			
			if (($this->request->post['shipping_country'])== '') {
				$this->error['shipping_country'] = $this->language->get('error_shipping_country');
			}
			if ($this->request->post['zip_from'] !='') {
				if ((utf8_strlen($this->request->post['zip_from']) < 1) ) {
					$this->error['zip_from'] = $this->language->get('error_zipcode');
				}
			}
			if ($this->request->post['zip_to'] !='') {
				if ((utf8_strlen($this->request->post['zip_to']) < 1) ) {
					$this->error['zip_to'] = $this->language->get('error_zipcode');
				}			
			}
			if(!isset($this->request->post['seller_id']) || $this->request->post['seller_id'] == '') {
				$this->error['filter_name'] = $this->language->get('error_filter_name');
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
			
			/*         if( ! filter_var($this->request->post['max_days'], FILTER_VALIDATE_INT)   && $this->request->post['max_days'] != '0' ){
				$this->error['max_days'] = $this->language->get('error_valid_value');
				} 
				if(utf8_strlen($this->request->post['max_days'])  < 1){
				$this->error['max_days'] = $this->language->get('error_max_days');
			}	 */
			
			return !$this->error; 
		}
		
		protected function validateDelete() {
			if (!$this->user->hasPermission('modify', 'purpletree_multivendor/shipping')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			
			return !$this->error;
		}
		
		
		public function autocompleteseller() {
		    if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}				
				$filter_data = array(
				'filter_name'  => $filter_name
				//'limit'        => 5
				);
			$this->load->language('purpletree_multivendor/shipping');
			$this->load->language('purpletree_multivendor/stores');
			$text_n_a = $this->language->get('text_n_a');
			$text_all = $this->language->get('text_all');
			$json = array();
			if (!isset($this->request->get['filter_name']) || $this->request->get['filter_name'] == '') {
			$json1[] = array(
			'vendor_id'       => -1,
			'name'              => $text_all,
			);
			$json2[] = array(
			'vendor_id'       => 0,
			'name'              => $text_n_a
			);
			$json = array_merge($json1,$json2);
			}
			$this->load->model('purpletree_multivendor/shipping');
			$results = $this->model_purpletree_multivendor_shipping->getSellers($filter_data);
			foreach ($results as $result) {
				$json[] = array(
				'vendor_id'       => $result['seller_id'],
				'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			
		}
}
?>