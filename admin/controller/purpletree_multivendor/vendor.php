<?php
class ControllerPurpletreeMultivendorVendor extends Controller{
		private $error = array();
		public function index(){
			$this->load->language('purpletree_multivendor/vendor');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/vendor');
			
			$this->getList();
		}
		public function deleteSeller(){
			if(!isset($this->request->get['seller_id'])){
				$this->session->data['error_warning'] = $this->language->get('error_seller_id');
				$this->response->redirect($this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'], true));	
			}
			$this->load->language('purpletree_multivendor/vendor');
			$this->load->model('purpletree_multivendor/vendor');
			$seller_id=$this->request->get['seller_id'];
			$this->session->data['token']=$this->request->get['token'];
			
			if ($this->request->server['REQUEST_METHOD'] == 'POST') {
				
				$delete_product = isset($this->request->post['delete_product'])?$this->request->post['delete_product']:'';
				// Delete products
				$sellerProducts = array();
				if($delete_product == 1) {
					$sellerProducts = $this->model_purpletree_multivendor_vendor->getsellerProducts($seller_id);
					if(!empty($sellerProducts)) {
						$this->load->model('catalog/product');
						foreach($sellerProducts as $productt) {
							$this->model_catalog_product->deleteProduct($productt['product_id']);
						}
					}
				}
				$this->model_purpletree_multivendor_vendor->deleteAllinfoSeller($seller_id);
				$this->session->data['success'] = $this->language->get('text_success_delete');
				$this->response->redirect($this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'], true));
			}
		}
		
		public function confirmdeleteSeller(){
		    $this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			$this->load->language('purpletree_multivendor/vendor');
			$url = '';
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
				} else {
				$data['success'] = '';
			}
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'view/image/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'view/image/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title_delete'),
			'href' => $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . $url, true)
			);
			$this->load->model('purpletree_multivendor/vendor');
			$results = $this->model_purpletree_multivendor_vendor->getVendors();
			$data['delete'] = $this->url->link('purpletree_multivendor/vendor/deleteSeller', 'token=' . $this->session->data['token'] . '&seller_id='.$this->request->get['seller_id'] . $url, true);
			
			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_heading'] = $this->language->get('text_heading');
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			$this->response->setOutput($this->load->view('purpletree_multivendor/seller_delete', $data));
		}
		
		protected function getList() {
		    $this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
				} else {
				$filter_name = null;
			}
			
			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
				} else {
				$filter_email = null;
			}
			
			
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
				} else {
				$filter_status = null;
			}
			
			if($this->config->get('purpletree_multivendor_subscription_plans')) {
				if (isset($this->request->get['filter_subscribed_status'])) {
					$filter_subscribed_status = $this->request->get['filter_subscribed_status'];
					} else {
					$filter_subscribed_status = NULL;
				}
				$data['purpletree_multivendor_subscription_plans'] = $this->config->get('purpletree_multivendor_subscription_plans');
			}
			
			if (isset($this->request->get['filter_approved'])) {
				$filter_approved = $this->request->get['filter_approved'];
				} else {
				$filter_approved = null;
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$filter_date_added = $this->request->get['filter_date_added'];
				} else {
				$filter_date_added = null;
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
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_customer_group_id'])) {
				$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			if($this->config->get('purpletree_multivendor_subscription_plans')) {
				if (isset($this->request->get['filter_subscribed_status'])) {
					$url .= '&filter_subscribed_status=' . $this->request->get['filter_subscribed_status'];
				}
			}
			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}
			
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller";
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
			'href' => $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . $url, true)
			);
			$data['addnewcustomer'] = array(
			'href' => $this->url->link('customer/customer/add', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			//$data['add'] = $this->url->link('purpletree_multivendor/vendor/add', 'token=' . $this->session->data['token'] . $url, true);
			$data['delete'] = $this->url->link('purpletree_multivendor/vendor/delete', 'token=' . $this->session->data['token'] . $url, true);
			
			$data['vendors'] = array();
			
			$filter_data = array(
			'filter_name'              => $filter_name,
			'filter_email'             => $filter_email,
			'filter_status'            => $filter_status,
			'filter_approved'          => $filter_approved,
			'filter_date_added'        => $filter_date_added,			
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
			);
			
			$vendor_total = $this->model_purpletree_multivendor_vendor->getTotalVendors($filter_data);
			
			$results = $this->model_purpletree_multivendor_vendor->getVendors($filter_data);
			
			foreach ($results as $result) {
				
				$hasPlan = $this->model_purpletree_multivendor_vendor->getSubscriptionplan($result['seller_id']);	
                $delete = "";				
				if (!$this->customer->validateSeller()) {
					$this->load->language('purpletree_multivendor/ptsmultivendor');
					$this->session->data['error_warning'] = $this->language->get('error_license');
					$edit = $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'], true);
					} else {
					
					$send_message = $this->url->link('purpletree_multivendor/sellerenquiries/sendsellermessage', 'token=' . $this->session->data['token'] . '&seller_id=' . $result['seller_id'] . $url, true);
					
					$edit = $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['seller_id'] . $url, true);
					
					$delete=$this->url->link('purpletree_multivendor/vendor/confirmdeleteSeller', 'token=' . $this->session->data['token'] . '&seller_id=' . $result['seller_id'] . $url, true);
				}
				if($this->config->get('purpletree_multivendor_subscription_plans')) {
					$plan = $this->url->link('purpletree_multivendor/managesubscriptionplan/add&token=' . $this->session->data['token'] . '&seller_id='. $result['seller_id'].'&action=add' , true);
					$plan1 = $this->url->link('purpletree_multivendor/managesubscriptionplan/viewallplan&token=' . $this->session->data['token'] . '&seller_id='. $result['seller_id'] , true);
					
					if($filter_subscribed_status == NULL) {
						
						$data['vendors'][] = array(
						'seller_id'    => $result['seller_id'],
						'store_name'    => $result['store_name'],
						'seller_id'    => $result['seller_id'],
						'name'           => $result['name'],
						'email'          => $result['email'],
						'customer_group' => $result['customer_group'],
						'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
						'ip'             => $result['ip'],
						'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
						'send_message'   => $send_message,
						'edit'           => $edit,
						'delete'         => $delete,
						'hasPlan'        => $hasPlan,
						'plan'           => $plan,
						'plan1'          => $plan1,
						'status_id'      => $result['status']
						);
					}
					if($filter_subscribed_status == '1' && $hasPlan == '1') {
						
						$data['vendors'][] = array(
						'seller_id'    => $result['seller_id'],
						'store_name'    => $result['store_name'],
						'seller_id'    => $result['seller_id'],
						'name'           => $result['name'],
						'email'          => $result['email'],
						'customer_group' => $result['customer_group'],
						'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
						'ip'             => $result['ip'],
						'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
						'edit'           => $edit,
						'send_message'   => $send_message,
						'delete'         => $delete,
						'hasPlan'        => $hasPlan,
						'plan'           => $plan,
						'plan1'           => $plan1,
						'status_id'      => $result['status']
						);
					}
					if($filter_subscribed_status == '0' && ($hasPlan == '' || $hasPlan == '0')) {
						
						$data['vendors'][] = array(
						'seller_id'    => $result['seller_id'],
						'store_name'    => $result['store_name'],
						'seller_id'    => $result['seller_id'],
						'name'           => $result['name'],
						'email'          => $result['email'],
						'customer_group' => $result['customer_group'],
						'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
						'ip'             => $result['ip'],
						'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
						'edit'           => $edit,
						'send_message'   => $send_message,
						'delete'        => $delete,
						'hasPlan'        => $hasPlan,
						'plan'           => $plan,
						'plan1'           => $plan1,
						'status_id'      => $result['status']
						);
					}
					} else {
					
					$data['vendors'][] = array(
					'seller_id'    => $result['seller_id'],
					'store_name'    => $result['store_name'],
					'seller_id'    => $result['seller_id'],
					'name'           => $result['name'],
					'email'          => $result['email'],
					'customer_group' => $result['customer_group'],
					'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
					'ip'             => $result['ip'],
					'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'edit'           => $edit,
					'send_message'           => $send_message,
					'delete'           => $delete,
					'status_id'      => $result['status']
					);	
				}
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_list'] = $this->language->get('text_list');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_approved'] = $this->language->get('text_approved');
			$data['text_notapproved'] = $this->language->get('text_notapproved');
			$data['text_default'] = $this->language->get('text_default');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			$data['text_all'] = $this->language->get('text_all');
			
			$data['column_name'] = $this->language->get('column_name');
			$data['column_email'] = $this->language->get('column_email');
			$data['column_customer_group'] = $this->language->get('column_customer_group');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_approved'] = $this->language->get('column_approved');
			$data['column_ip'] = $this->language->get('column_ip');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_approved'] = $this->language->get('column_approved');
			$data['column_store_name'] = $this->language->get('column_store_name');
			
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_email'] = $this->language->get('entry_email');
			$data['entry_customer_group'] = $this->language->get('entry_customer_group');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_approved'] = $this->language->get('entry_approved');
			$data['entry_ip'] = $this->language->get('entry_ip');
			$data['entry_date_added'] = $this->language->get('entry_date_added'); 
			$data['entry_subscription_status'] = $this->language->get('entry_subscription_status');
			$data['entry_subscribed'] = $this->language->get('entry_subscribed');
			$data['entry_not_subscribed'] = $this->language->get('entry_not_subscribed');
			$data['entry_add_susbcription'] = $this->language->get('entry_add_susbcription');
			$data['entry_view_susbcription'] = $this->language->get('entry_view_susbcription');
			
			$data['button_approve'] = $this->language->get('button_approve');
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['button_filter'] = $this->language->get('button_filter');
			$data['button_login'] = $this->language->get('button_login');
			$data['button_unlock'] = $this->language->get('button_unlock');
			$data['button_send_massage'] = $this->language->get('button_send_massage');
			$data['token'] = $this->session->data['token'];
			
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
			
			if (isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				
				unset($this->session->data['error_warning']);
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->request->post['selected'])) {
				$data['selected'] = (array)$this->request->post['selected'];
				} else {
				$data['selected'] = array();
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			if($this->config->get('purpletree_multivendor_subscription_plans')) {
				if (isset($this->request->get['filter_subscribed_status'])) {
					$url .= '&filter_subscribed_status=' . $this->request->get['filter_subscribed_status'];
				}
			}
			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
			
			if ($order == 'ASC') {
				$url .= '&order=DESC';
				} else {
				$url .= '&order=ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$data['sort_name'] = $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
			$data['sort_email'] = $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . '&sort=c.email' . $url, true);
			$data['sort_status'] = $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, true);
			$data['sort_date_added'] = $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, true);
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$pagination = new Pagination();
			$pagination->total = $vendor_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('purpletree_multivendor/vendor', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($vendor_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($vendor_total - $this->config->get('config_limit_admin'))) ? $vendor_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $vendor_total, ceil($vendor_total / $this->config->get('config_limit_admin')));
			
			$data['filter_name'] = $filter_name;
			$data['filter_email'] = $filter_email;
			$data['filter_status'] = $filter_status;
			$data['filter_approved'] = $filter_approved;
			$data['filter_date_added'] = $filter_date_added;
			if($this->config->get('purpletree_multivendor_subscription_plans')) {
				$data['filter_subscribed_status'] = $filter_subscribed_status;
			}
			$this->load->model('setting/store');
			$this->load->model('customer/customer_group');
			
			$data['stores'] = $this->model_setting_store->getStores();
			$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/vendor_list', $data));
		}
		public function autocomplete() {
			$json = array();
			
			if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				if (isset($this->request->get['filter_email'])) {
					$filter_email = $this->request->get['filter_email'];
					} else {
					$filter_email = '';
				}
				
				if (isset($this->request->get['filter_affiliate'])) {
					$filter_affiliate = $this->request->get['filter_affiliate'];
					} else {
					$filter_affiliate = '';
				}
				
				$this->load->model('purpletree_multivendor/vendor');
				$this->load->model('customer/customer');
				$filter_data = array(
				'filter_name'      => $filter_name,
				'filter_email'     => $filter_email,
				'filter_affiliate' => $filter_affiliate,
				'start'            => 0,
				'limit'            => 5
				);
				
				$results = $this->model_purpletree_multivendor_vendor->getSeller($filter_data);
				
				
				foreach ($results as $result) {
					$json[] = array(
					'customer_id'       => $result['customer_id'],
					'customer_group_id' => $result['customer_group_id'],
					'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'customer_group'    => $result['customer_group'],
					'firstname'         => $result['firstname'],
					'lastname'          => $result['lastname'],
					'email'             => $result['email'],
					'telephone'         => $result['telephone'],
					'custom_field'      => json_decode($result['custom_field'], true),
					'address'           => $this->model_customer_customer->getAddresses($result['customer_id'])
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
}
?>