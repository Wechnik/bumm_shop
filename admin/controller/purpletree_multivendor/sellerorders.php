<?php
class ControllerPurpletreeMultivendorSellerorders extends Controller {
		private $error = array();
		
		public function index() {
			$this->load->language('purpletree_multivendor/sellerorder');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/stores');
			
			$this->getList();
		}
		
		protected function getList() {
			$this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			$this->load->language('purpletree_multivendor/sellerorder');
			
			if (isset($this->request->get['filter_order_status'])) {
				$filter_order_status = $this->request->get['filter_order_status'];
				} else {
				$filter_order_status = null;
			}
			if (isset($this->request->get['filter_admin_order_status'])) {
				$filter_admin_order_status = $this->request->get['filter_admin_order_status'];
				} else {
				$filter_admin_order_status = null;
			}
			
			if (isset($this->request->get['seller_id_filter'])) {
				$seller_id_filter = $this->request->get['seller_id_filter'];
				} else {
				$seller_id_filter = null;
			}
			$data['seller_id_filter'] = "";
			if (isset($this->request->get['store_name'])) {
				$data['store_name'] = $this->request->get['store_name'];
				} else {
				$data['store_name'] = "";
			}
			
			if (isset($this->request->get['filter_date_from'])) {
				$filter_date_from = $this->request->get['filter_date_from'];
				} else {
				$end_date = date('Y-m-d', strtotime("-30 days"));
				$filter_date_from = $end_date;
			}
			
			if (isset($this->request->get['filter_date_to'])) {
				$filter_date_to = $this->request->get['filter_date_to'];
				} else {
				$end_date = date('Y-m-d');
				$filter_date_to = $end_date;
			}
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
				} else {
				$sort = 'o.order_id';
			}
			
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
				} else {
				$order = 'DESC';
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			if (isset($this->request->get['seller_id_filter'])) {
				$seller_id = $this->request->get['seller_id_filter'];
				} else {
				$seller_id = 0;
			}
			
			$data['seller_id'] = (isset($this->request->get['seller_id'])?$this->request->get['seller_id']:'');
			$url = '';
			
			if (isset($this->request->get['filter_order_status'])) {
				$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
			}
			if (isset($this->request->get['filter_admin_order_status'])) {
				$url .= '&filter_admin_order_status=' . $this->request->get['filter_admin_order_status'];
			}
			
			if (isset($this->request->get['seller_id_filter'])) {
				$url .= '&seller_id_filter=' . $this->request->get['seller_id_filter'];
			}
			
			if (isset($this->request->get['filter_date_from'])) {
				$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];
			}
			
			if (isset($this->request->get['filter_date_to'])) {
				$url .= '&filter_date_to=' . $this->request->get['filter_date_to'];
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
			if (isset($this->request->get['seller_id'])) {
				$url .= '&seller_id=' . $this->request->get['seller_id'];
			}
			if (isset($this->request->get['store_name'])) {
				$url .= '&store_name=' . $this->request->get['store_name'];
			}
			
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-order";
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
			'href' => $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true)
			);
			if (!$this->customer->validateSeller()) {
		    	$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$data['invoice'] = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
				$data['shipping'] = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
				$data['add'] = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
				$data['delete'] = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
				$data['sellerinvoice'] = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
				} else {
				$data['sellerinvoice'] = $this->url->link('purpletree_multivendor/sellerorders/printsellerinvoice', 'token=' . $this->session->data['token'] . $url, true);
				$data['invoice'] = $this->url->link('sale/order/invoice', 'token=' . $this->session->data['token'], true);
				$data['shipping'] = $this->url->link('sale/order/shipping', 'token=' . $this->session->data['token'], true);
				$data['add'] = $this->url->link('sale/order/add', 'token=' . $this->session->data['token'], true);
				$data['delete'] = $this->url->link('sale/order/delete', 'token=' . $this->session->data['token'], true);
			}
			
			$data['orders'] = array();
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			$url ='';
			
			
			$filter_data = array(
			'filter_order_status'  => $filter_order_status,
			'filter_admin_order_status'  => $filter_admin_order_status,
			'seller_id_filter'  => $seller_id_filter,
			'filter_date_from'    => $filter_date_from,
			'filter_date_to' => $filter_date_to,
			'sort'                 => $sort,
			'order'                => $order,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin'),
			'seller_id'				=> $seller_id
			);
			
			$order_total = $this->model_purpletree_multivendor_stores->getTotalSellerOrders($filter_data);
			
			$results = $this->model_purpletree_multivendor_stores->getSellerOrders($filter_data);
			
			$data['total_sale'] = 0;
			$data['total_pay'] =0;
			$data['total_commission'] =0;	
			$data['total_paid'] = 0;
			
			$total_sale = 0;
			$total_commission = 0;	
			$total_paid_amount = 0;
			$total_complete_amount = 0;
			
			$pricc = 0;
			foreach ($results as $result) {
				$total = 0;
				$total_price = 0;
				
				if(isset($this->request->get['seller_id'])){
					$product_totals  = $this->model_purpletree_multivendor_stores->getSellerOrdersTotal($this->request->get['seller_id'],$result['order_id']);
					if(isset($product_totals['total'])){
						$total = $product_totals['total'];
						$total_price = $total;
						} else {
						$total_price = 0;
					}
					
					$product_commission  = $this->model_purpletree_multivendor_stores->getSellerOrdersCommission($result['order_id'],$this->request->get['seller_id']);
					
					} else{
					$total_price = $result['total_price'];
					$total = $result['total'];
					$product_commission  = $this->model_purpletree_multivendor_stores->getSellerOrdersCommission($result['order_id']);
				}
				
				$total_sale+= $total;
				if (!$this->customer->validateSeller()) {
					$this->load->language('purpletree_multivendor/ptsmultivendor');
					$this->session->data['error_warning'] = $this->language->get('error_license');
					$edit = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
					$view = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
					} else {
					$edit = $this->url->link('sale/order/edit', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, true);
					
					if(isset($seller_id) && !empty($seller_id)){
						$view = $this->url->link('purpletree_multivendor/stores/seller_order_info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'].'&seller_id='.$seller_id . $url, true);
						} else {
						$view = $this->url->link('purpletree_multivendor/sellerorders/order_info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, true);
					}
				}
				$seller_ordersss = $this->model_purpletree_multivendor_stores->getUniqueSeller($result['order_id']);
				$data['orders'][] = array(
				'order_id'      => $result['order_id'],
				'customer'      => $result['customer'],
				'admin_order_status'      => $result['admin_order_status'],
				'order_status'  => $seller_ordersss,
				'total'         => $this->currency->format($total, $result['currency_code'], $result['currency_value']),
				'commission'         => $this->currency->format($product_commission['total_commission'], $result['currency_code'], $result['currency_value']),
				'date_added'    => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'shipping_code' => $result['shipping_code'],
				'view'          => $view,
				'edit'          => $edit
				);
				$orderstatus = 0;
				if(null !== $this->config->get('purpletree_multivendor_commission_status')) {
					$orderstatus = $this->config->get('purpletree_multivendor_commission_status');
				}
				$status_array = array();
				if(!empty($seller_ordersss)) {
					foreach($seller_ordersss as $selleroder) {
						if($result['admin_order_status_idd'] == $orderstatus) {
							if($selleroder['order_status_id'] == $orderstatus) {
								if(!empty($selleroder['product'])){
									foreach($selleroder['product'] as $prod) {
										$pricc += $prod['total_price'];
									}
								}
							}
						}
					}
				}
				$total_commission+= $product_commission['total_commission'];
			}
			$orderstatus = 0;
			if(null !== $this->config->get('purpletree_multivendor_commission_status')) {
				$orderstatus = $this->config->get('purpletree_multivendor_commission_status');
			}
			else {
				$this->session->data['error_warning'] = $this->language->get('module_purpletree_multivendor_commission_status_warning');
			}
			$data['purpletree_multivendor_commission_status'] = $orderstatus;
			$total_paid_amount = $this->model_purpletree_multivendor_stores->getSellerPaidTotal($filter_data);		
			if(!empty($results)){
				$curency = $this->config->get('config_currency');
				$this->load->model('purpletree_multivendor/sellerpayment');
				$currency_detail = $this->model_purpletree_multivendor_sellerpayment->getCurrencySymbol($curency);
				
				$data['total_sale'] = $this->currency->format($total_sale, $currency_detail['code'], $currency_detail['value']);
				$data['total_pay'] = $this->currency->format((($pricc - $total_commission) - $total_paid_amount['total']), $currency_detail['code'], $currency_detail['value']);
				$data['total_paid'] = $this->currency->format(($total_paid_amount['total']), $currency_detail['code'], $currency_detail['value']);
				$data['total_commission'] = $this->currency->format($total_commission, $currency_detail['code'], $currency_detail['value']);
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_list'] = $this->language->get('text_list');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			$data['text_missing'] = $this->language->get('text_missing');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_all'] = $this->language->get('text_all');
			
			$data['column_order_id'] = $this->language->get('column_order_id');
			$data['column_customer'] = $this->language->get('column_customer');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_store'] = $this->language->get('column_store');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_shipping'] = $this->language->get('column_shipping');
			$data['column_admin_status'] = $this->language->get('column_admin_status');
			$data['column_total'] = $this->language->get('column_total');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_date_modified'] = $this->language->get('column_date_modified');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_commissions'] = $this->language->get('column_commissions');
			
			$data['entry_order_id'] = $this->language->get('entry_order_id');
			$data['entry_customer'] = $this->language->get('entry_customer');
			$data['entry_admin_order_status'] = $this->language->get('entry_admin_order_status');
			$data['entry_order_status'] = $this->language->get('entry_order_status');
			$data['entry_total'] = $this->language->get('entry_total');
			$data['entry_date_added'] = $this->language->get('entry_date_added');
			$data['entry_date_modified'] = $this->language->get('entry_date_modified');
			$data['entry_date_from'] = $this->language->get('entry_date_from');
			$data['entry_date_to'] = $this->language->get('entry_date_to');
			
			$data['entry_total_sale'] = $this->language->get('entry_total_sale');
			$data['entry_total_pay'] = $this->language->get('entry_total_pay');
			$data['entry_total_commission'] = $this->language->get('entry_total_commission');		$data['entry_total_paid'] = $this->language->get('entry_total_paid');
			
			$data['button_invoice_print'] = $this->language->get('button_invoice_print');
			$data['button_shipping_print'] = $this->language->get('button_shipping_print');
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['button_filter'] = $this->language->get('button_filter');
			$data['button_view'] = $this->language->get('button_view');
			$data['button_ip_add'] = $this->language->get('button_ip_add');
			$data['entry_seller_store'] = $this->language->get('entry_seller_store');
			
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
			
			if (isset($this->request->get['filter_order_status'])) {
				$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
			}
			if (isset($this->request->get['filter_admin_order_status'])) {
				$url .= '&filter_admin_order_status=' . $this->request->get['filter_admin_order_status'];
			}
			if (isset($this->request->get['seller_id_filter'])) {
				$url .= '&seller_id_filter=' . $this->request->get['seller_id_filter'];
			}
			
			if (isset($this->request->get['filter_date_from'])) {
				$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];
			}
			
			if (isset($this->request->get['filter_date_to'])) {
				$url .= '&filter_date_to=' . $this->request->get['filter_date_to'];
			}
			
			if ($order == 'ASC') {
				$url .= '&order=DESC';
				} else {
				$url .= '&order=ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_order_status'])) {
				$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
			}
			if (isset($this->request->get['filter_admin_order_status'])) {
				$url .= '&filter_admin_order_status=' . $this->request->get['filter_admin_order_status'];
			}
			if (isset($this->request->get['seller_id_filter'])) {
				$url .= '&seller_id_filter=' . $this->request->get['seller_id_filter'];
			}
			
			if (isset($this->request->get['filter_date_from'])) {
				$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];
			}
			
			if (isset($this->request->get['filter_date_to'])) {
				$url .= '&filter_date_to=' . $this->request->get['filter_date_to'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['seller_id'])) {
				$url .= '&seller_id=' . $this->request->get['seller_id'];
			}
			if (isset($this->request->get['store_name'])) {
				$url .= '&store_name=' . $this->request->get['store_name'];
			}
			
			$pagination = new Pagination();
			$pagination->total = $order_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));
			
			$data['filter_order_status'] = $filter_order_status;
			$data['filter_admin_order_status'] = $filter_admin_order_status;
			$data['filter_date_from'] = $filter_date_from;
			$data['filter_date_to'] = $filter_date_to;
			
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$this->load->model('localisation/order_status');
			
			$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/order_list', $data));
		}
		public function printsellerinvoice() {
			
			$this->load->language('sale/order');
			$data['text_invoice'] = $this->language->get('text_invoice');
			$data['text_order_detail'] = $this->language->get('text_order_detail');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_payment_method'] = $this->language->get('text_payment_method');
			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_website'] = $this->language->get('text_website');
			$data['text_telephone'] = $this->language->get('text_telephone');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_shipping_address'] = $this->language->get('text_shipping_address');
			$data['text_payment_address'] = $this->language->get('text_payment_address');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_total'] = $this->language->get('column_total');
			$data['column_product'] = $this->language->get('column_product');
			
			$data['title'] = $this->language->get('text_invoice');
			
			if ($this->request->server['HTTPS']) {
				$data['base'] = HTTPS_SERVER;
				} else {
				$data['base'] = HTTP_SERVER;
			}
			
			$data['direction'] = $this->language->get('direction');
			$data['lang'] = $this->language->get('code');
			
			$this->load->model('sale/order');
			
			$this->load->model('setting/setting');
			
			$data['orders'] = array();
			
			$orders = array();
			
			if (isset($this->request->post['selected'])) {
				$orders = $this->request->post['selected'];
				} elseif (isset($this->request->get['order_id'])) {
				$orders[] = $this->request->get['order_id'];
			}
			$this->load->model('purpletree_multivendor/orderinvoice');
			
			foreach ($orders as $order_id) {
				
				
				$sellorders = array();
				$seller_order_info11 = $this->model_purpletree_multivendor_orderinvoice->getsellerorder($order_id);
				if(!empty($seller_order_info11)) {
					foreach($seller_order_info11 as $sellerorder12) {
						$sellorders[] = $sellerorder12['seller_id'];
					}
				}
				
				$order_info = $this->model_sale_order->getOrder($order_id);
				
				if ($order_info) {
					$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
					
					if ($store_info) {
						$store_address = $store_info['config_address'];
						$store_email = $store_info['config_email'];
						$store_telephone = $store_info['config_telephone'];
						$store_fax = $store_info['config_fax'];
						} else {
						$store_address = $this->config->get('config_address');
						$store_email = $this->config->get('config_email');
						$store_telephone = $this->config->get('config_telephone');
						$store_fax = $this->config->get('config_fax');
					}
					
					if ($order_info['invoice_no']) {
						$invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
						} else {
						$invoice_no = '';
					}
					
					if ($order_info['payment_address_format']) {
						$format = $order_info['payment_address_format'];
						} else {
						$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
					}
					
					$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
					);					
					
					$replace = array(
					'firstname' => $order_info['payment_firstname'],
					'lastname'  => $order_info['payment_lastname'],
					'company'   => $order_info['payment_company'],
					'address_1' => $order_info['payment_address_1'],
					'address_2' => $order_info['payment_address_2'],
					'city'      => $order_info['payment_city'],
					'postcode'  => $order_info['payment_postcode'],
					'zone'      => $order_info['payment_zone'],
					'zone_code' => $order_info['payment_zone_code'],
					'country'   => $order_info['payment_country']
					);
					
					$payment_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
					
					if ($order_info['shipping_address_format']) {
						$format = $order_info['shipping_address_format'];
						} else {
						$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
					}
					
					$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
					);
					
					$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']
					);
					
					$shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
					
					$this->load->model('tool/upload');
					
					$product_data = array();
					
					$products = $this->model_sale_order->getOrderProducts($order_id);
					
					foreach ($products as $product) {
						$option_data = array();
						
						$options = $this->model_sale_order->getOrderOptions($order_id, $product['order_product_id']);
						
						foreach ($options as $option) {
							if ($option['type'] != 'file') {
								$value = $option['value'];
								} else {
								$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
								
								if ($upload_info) {
									$value = $upload_info['name'];
									} else {
									$value = '';
								}
							}
							
							$option_data[] = array(
							'name'  => $option['name'],
							'value' => $value
							);
						}
						
						$product_data[] = array(
						'name'     => $product['name'],
						'model'    => $product['model'],
						'option'   => $option_data,
						'quantity' => $product['quantity'],
						'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
						'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
						);
					}
					
					$voucher_data = array();
					
					$vouchers = $this->model_sale_order->getOrderVouchers($order_id);
					
					foreach ($vouchers as $voucher) {
						$voucher_data[] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
						);
					}
					
					$sellerorderArray = array();
					$allprodcus = array();
					$sellerorders = array();
					if ($this->config->get('purpletree_multivendor_status')) {	
						$this->load->model('purpletree_multivendor/orderinvoice');
						//print_r($products);
						$seller_order_info = $this->model_purpletree_multivendor_orderinvoice->getsellerorder($order_id);
						$productsaa = $this->model_sale_order->getOrderProducts($order_id);
						if(!empty($seller_order_info)) {
							foreach($seller_order_info as $sellerorder) {
								$sellerorderArray[$sellerorder['seller_id']][$sellerorder['id']] = $sellerorder;
								$allprodcus[] = $sellerorder['product_id'];
							}
							
							foreach($productsaa as $pro) {
								if(!in_array($pro['product_id'],$allprodcus)) {
									$sellerorderArray[0][$pro['order_product_id']] = $pro; 
								}
							}
							} else {
							$total_data = array();
							
							$totals = $this->model_sale_order->getOrderTotals($order_id);
							
							foreach ($totals as $total) {
								$total_data[] = array(
								'title' => $total['title'],
								'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value'])
								);
							}
							$data['orders'][] = array(
							'order_id'	       => $order_id,
							'invoice_no'       => $invoice_no,
							'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
							'store_name'       => $order_info['store_name'],
							'store_url'        => rtrim($order_info['store_url'], '/'),
							'store_address'    => nl2br($store_address),
							'store_email'      => $store_email,
							'store_telephone'  => $store_telephone,
							'store_fax'        => $store_fax,
							'email'            => $order_info['email'],
							'telephone'        => $order_info['telephone'],
							'shipping_address' => $shipping_address,
							'shipping_method'  => $order_info['shipping_method'],
							'payment_address'  => $payment_address,
							'payment_method'   => $order_info['payment_method'],
							'product'          => $product_data,
							'voucher'          => $voucher_data,
							'total'            => $total_data,
							'comment'          => nl2br($order_info['comment'])
							);
							$this->response->setOutput($this->load->view('sale/order_invoice', $data));
						}
						
						if(!empty($sellerorderArray)) {
							foreach($sellerorderArray as $sellerid => $sellerorders) {
								if($sellerid == 0) {
									$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
									if ($store_info) {
										$store_address = $store_info['config_address'];
										$store_email = $store_info['config_email'];
										$store_telephone = $store_info['config_telephone'];
										$store_fax = $store_info['config_fax'];
										} else {
										$store_address = $this->config->get('config_address');
										$store_email = $this->config->get('config_email');
										$store_telephone = $this->config->get('config_telephone');
										$store_fax = $this->config->get('config_fax');
									}
									} else  {
									$seller_store = $this->model_purpletree_multivendor_orderinvoice->getStoreDetail($sellerid);
									$this->load->model('purpletree_multivendor/stores');
									$cus_seller_email = $this->model_purpletree_multivendor_stores->getCustomerEmailId($sellerid);
									$order_info['store_name'] = $seller_store['store_name'];
									$store_address = $seller_store['store_address'];
									$store_email = $cus_seller_email;
									$store_telephone = $seller_store['store_phone'];
									$store_fax = '';
								}
								$product_data = array();
								$totalsub = 0;
								$totalpro = 0;
								foreach($sellerorders as $sellerord) {
									// products data
									$option_data = array();
									$product = $this->model_purpletree_multivendor_orderinvoice->getOrderProducts($order_id, $sellerord['product_id']);
									$options = $this->model_sale_order->getOrderOptions($order_id, $product['order_product_id']);
									
									foreach ($options as $option) {
										if ($option['type'] != 'file') {
											$value = $option['value'];
											} else {
											$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
											
											if ($upload_info) {
												$value = $upload_info['name'];
												} else {
												$value = '';
											}
										}
										
										$option_data[] = array(
										'name'  => $option['name'],
										'value' => $value
										);
									}
									
									$product_data[] = array(
									'name'     => $product['name'],
									'model'    => $product['model'],
									'option'   => $option_data,
									'quantity' => $product['quantity'],
									'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
									'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
									);
									$totalsub += $product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0);
									// products data
								}
								$total_data = array();
								if($sellerid == 0) {
									$totalss = $this->model_sale_order->getOrderTotals($order_id);
									$check_seller_coupon = $this->model_purpletree_multivendor_orderinvoice->checkSellerCoupon($order_id,'coupon');
									if($check_seller_coupon == 1)
									{
									foreach($totalss as $key=>$val){
										if($val['code']!='coupon'){
											$totals[$key]= $val;
										}else{
										 $sellercoupon = $val['value'];
										}
									}
									}else{ 
									$totals = $totalss; 
									}
									} else {
									$totals = $this->model_purpletree_multivendor_orderinvoice->getOrderTotals($order_id,$sellerid);
								}
								$totall =0;
								foreach ($totals as $total) {
									if($sellerid == 0) {
										if($total['code'] == 'sub_total') {
											$total_data[] = array(
											'title' => $total['title'],
											'text'  => $this->currency->format($totalsub, $order_info['currency_code'], $order_info['currency_value'])
											);
											$totall += $totalsub;
											continue;
										}
										if($total['code'] == 'total') {
											$total_data[] = array(
											'title' => $total['title'],
											'text'  => $this->currency->format($totall, $order_info['currency_code'], $order_info['currency_value'])
											);
											continue;
										}
									}
									$total_data[] = array(
									'title' => $total['title'],
									'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value'])
									);
									$totall += $total['value'];
									
								}
								if($invoice_no != "") {
									$invoice_no .= "-".$sellerid;
								}
								$data['orders'][] = array(
								'order_id'	       => $order_id.'-'.$sellerid,
								'invoice_no'       => $invoice_no,
								'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
								'store_name'       => $order_info['store_name'],
								'store_url'        => rtrim($order_info['store_url'], '/'),
								'store_address'    => nl2br($store_address),
								'store_email'      => $store_email,
								'store_telephone'  => $store_telephone,
								'store_fax'        => $store_fax,
								'email'            => $order_info['email'],
								'telephone'        => $order_info['telephone'],
								'shipping_address' => $shipping_address,
								'shipping_method'  => $order_info['shipping_method'],
								'payment_address'  => $payment_address,
								'payment_method'   => $order_info['payment_method'],
								'product'          => $product_data,
								'voucher'          => $voucher_data,
								'total'            => $total_data,
								'comment'          => nl2br($order_info['comment'])
								);
								$this->response->setOutput($this->load->view('sale/order_invoice', $data));
							}
							// Seller order
						}
					}
				}
				
				$this->response->setOutput($this->load->view('sale/order_invoice', $data));
			}
			
		}
		
		public function autocomplete() {
			$json = array();
			
			if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
				$this->load->model('catalog/product');
				$this->load->model('catalog/option');
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				if (isset($this->request->get['filter_model'])) {
					$filter_model = $this->request->get['filter_model'];
					} else {
					$filter_model = '';
				}
				
				if (isset($this->request->get['limit'])) {
					$limit = $this->request->get['limit'];
					} else {
					$limit = 5;
				}
				
				$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit
				);
				
				$results = $this->model_catalog_product->getProducts($filter_data);
				
				foreach ($results as $result) {
					$option_data = array();
					
					$product_options = $this->model_catalog_product->getProductOptions($result['product_id']);
					
					foreach ($product_options as $product_option) {
						$option_info = $this->model_catalog_option->getOption($product_option['option_id']);
						
						if ($option_info) {
							$product_option_value_data = array();
							
							foreach ($product_option['product_option_value'] as $product_option_value) {
								$option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);
								
								if ($option_value_info) {
									$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
									);
								}
							}
							
							$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
							);
						}
					}
					
					$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
					);
				}
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		public function autosellerstore() {
			$json = array();
			
			if (isset($this->request->get['store_name'])) {
				$store_name = $this->request->get['store_name'];
				} else {
				$store_name = '';
			}
			$this->load->model('purpletree_multivendor/stores');		
			$results = $this->model_purpletree_multivendor_stores->getSellerstore($store_name);
			foreach ($results as $result) {
				$json[] = array(
				'vendor_id'       => $result['seller_id'],
				'name'              => strip_tags(html_entity_decode($result['store_name'], ENT_QUOTES, 'UTF-8'))	
				);
			}	
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		
		public function order_info(){
			$this->load->model('purpletree_multivendor/stores');
			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
				} else {
				$order_id = 0;
			}
			
			if (isset($this->request->get['seller_id'])) {
				$seller_id = $this->request->get['seller_id'];
				} else {
				$seller_id = 0;
			}
			
			$order_info = $this->model_purpletree_multivendor_stores->getOrder($order_id,$seller_id);
			
			if ($order_info) {
				$this->load->language('purpletree_multivendor/sellerorder');
				
				$this->document->setTitle($this->language->get('heading_title'));
				
				$data['heading_title'] = $this->language->get('heading_title');
				
				$data['text_ip_add'] = sprintf($this->language->get('text_ip_add'), $this->request->server['REMOTE_ADDR']);
				$data['text_order_detail'] = $this->language->get('text_order_detail');
				$data['text_customer_detail'] = $this->language->get('text_customer_detail');
				$data['text_option'] = $this->language->get('text_option');
				$data['text_store'] = $this->language->get('text_store');
				$data['text_date_added'] = $this->language->get('text_date_added');
				$data['text_payment_method'] = $this->language->get('text_payment_method');
				$data['text_shipping_method'] = $this->language->get('text_shipping_method');
				$data['text_customer'] = $this->language->get('text_customer');
				$data['text_customer_group'] = $this->language->get('text_customer_group');
				$data['text_email'] = $this->language->get('text_email');
				$data['text_telephone'] = $this->language->get('text_telephone');
				$data['text_invoice'] = $this->language->get('text_invoice');
				$data['text_reward'] = $this->language->get('text_reward');
				$data['text_affiliate'] = $this->language->get('text_affiliate');
				$data['text_order'] = sprintf($this->language->get('text_order'), $this->request->get['order_id']);
				$data['text_payment_address'] = $this->language->get('text_payment_address');
				$data['text_shipping_address'] = $this->language->get('text_shipping_address');
				$data['text_comment'] = $this->language->get('text_comment');
				$data['text_account_custom_field'] = $this->language->get('text_account_custom_field');
				$data['text_payment_custom_field'] = $this->language->get('text_payment_custom_field');
				$data['text_shipping_custom_field'] = $this->language->get('text_shipping_custom_field');
				$data['text_browser'] = $this->language->get('text_browser');
				$data['text_ip'] = $this->language->get('text_ip');
				$data['text_forwarded_ip'] = $this->language->get('text_forwarded_ip');
				$data['text_user_agent'] = $this->language->get('text_user_agent');
				$data['text_accept_language'] = $this->language->get('text_accept_language');
				$data['text_history'] = $this->language->get('text_history');
				$data['text_history_add'] = $this->language->get('text_history_add');
				$data['text_loading'] = $this->language->get('text_loading');
				$data['text_seller_order_status'] = $this->language->get('text_seller_order_status');
				$data['text_seller_label'] = $this->language->get('text_seller_label');
				$data['text_seller_label_status'] = $this->language->get('text_seller_label_status');
				$data['text_refund_heding'] = $this->language->get('text_refund_heding');
				$data['text_refudn_amount'] = $this->language->get('text_refudn_amount');
				$data['button_submit'] = $this->language->get('button_submit');
				
				$data['column_product'] = $this->language->get('column_product');
				$data['column_model'] = $this->language->get('column_model');
				$data['column_quantity'] = $this->language->get('column_quantity');
				$data['column_price'] = $this->language->get('column_price');
				$data['column_total'] = $this->language->get('column_total');
				
				$data['entry_order_status'] = $this->language->get('entry_order_status');
				$data['entry_notify'] = $this->language->get('entry_notify');
				$data['entry_override'] = $this->language->get('entry_override');
				$data['entry_comment'] = $this->language->get('entry_comment');
				
				$data['help_override'] = $this->language->get('help_override');
				
				$data['button_invoice_print'] = $this->language->get('button_invoice_print');
				$data['button_shipping_print'] = $this->language->get('button_shipping_print');
				$data['button_edit'] = $this->language->get('button_edit');
				$data['button_cancel'] = $this->language->get('button_cancel');
				$data['button_generate'] = $this->language->get('button_generate');
				$data['button_reward_add'] = $this->language->get('button_reward_add');
				$data['button_reward_remove'] = $this->language->get('button_reward_remove');
				$data['button_commission_add'] = $this->language->get('button_commission_add');
				$data['button_commission_remove'] = $this->language->get('button_commission_remove');
				$data['button_history_add'] = $this->language->get('button_history_add');
				$data['button_ip_add'] = $this->language->get('button_ip_add');
				
				$data['tab_history'] = $this->language->get('tab_history');
				$data['tab_additional'] = $this->language->get('tab_additional');
				
				$url = '';
				
				if (isset($this->request->get['filter_order_id'])) {
					$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
				}
				
				if (isset($this->request->get['filter_customer'])) {
					$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_order_status'])) {
					$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
				}
				if (isset($this->request->get['filter_admin_order_status'])) {
					$url .= '&filter_admin_order_status=' . $this->request->get['filter_admin_order_status'];
				}
				if (isset($this->request->get['filter_total'])) {
					$url .= '&filter_total=' . $this->request->get['filter_total'];
				}
				
				if (isset($this->request->get['filter_date_added'])) {
					$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
				}
				
				if (isset($this->request->get['filter_date_modified'])) {
					$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-order";
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
				'href' => $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true)
				);
				
				$data['shipping'] = $this->url->link('sale/order/shipping', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'], true);
				$data['invoice'] = $this->url->link('sale/order/invoice', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'], true);
				$data['edit'] = $this->url->link('sale/order/edit', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'], true);
				$data['cancel'] = $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true);
				$data['sellerinvoice1'] = $this->url->link('purpletree_multivendor/sellerorders/printsellerinvoice', 'token=' . $this->session->data['token']  . '&order_id=' . (int)$this->request->get['order_id'], true);
				
				$data['token'] = $this->session->data['token'];
				
				$data['order_id'] = $this->request->get['order_id'];
				$data['seller_id'] = $seller_id;
				
				$data['store_id'] = $order_info['store_id'];
				$data['store_name'] = $order_info['store_name'];
				
				if ($order_info['store_id'] == 0) {
					$data['store_url'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;
					} else {
					$data['store_url'] = $order_info['store_url'];
				}
				
				if ($order_info['invoice_no']) {
					$data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
					} else {
					$data['invoice_no'] = '';
				}
				
				$data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
				
				$data['firstname'] = $order_info['firstname'];
				$data['lastname'] = $order_info['lastname'];
				
				if ($order_info['customer_id']) {
					$data['customer'] = $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $order_info['customer_id'], true);
					} else {
					$data['customer'] = '';
				}
				
				$this->load->model('customer/customer_group');
				
				$customer_group_info = $this->model_customer_customer_group->getCustomerGroup($order_info['customer_group_id']);
				
				if ($customer_group_info) {
					$data['customer_group'] = $customer_group_info['name'];
					} else {
					$data['customer_group'] = '';
				}
				
				$data['email'] = $order_info['email'];
				$data['telephone'] = $order_info['telephone'];
				
				$data['shipping_method'] = $order_info['shipping_method'];
				$data['payment_method'] = $order_info['payment_method'];
				
				// Payment Address
				if ($order_info['payment_address_format']) {
					$format = $order_info['payment_address_format'];
					} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}
				
				$find = array(
				'{firstname}',
				'{lastname}',
				'{company}',
				'{address_1}',
				'{address_2}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
				);
				
				$replace = array(
				'firstname' => $order_info['payment_firstname'],
				'lastname'  => $order_info['payment_lastname'],
				'company'   => $order_info['payment_company'],
				'address_1' => $order_info['payment_address_1'],
				'address_2' => $order_info['payment_address_2'],
				'city'      => $order_info['payment_city'],
				'postcode'  => $order_info['payment_postcode'],
				'zone'      => $order_info['payment_zone'],
				'zone_code' => $order_info['payment_zone_code'],
				'country'   => $order_info['payment_country']
				);
				
				$data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
				
				// Shipping Address
				if ($order_info['shipping_address_format']) {
					$format = $order_info['shipping_address_format'];
					} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}
				
				$find = array(
				'{firstname}',
				'{lastname}',
				'{company}',
				'{address_1}',
				'{address_2}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
				);
				
				$replace = array(
				'firstname' => $order_info['shipping_firstname'],
				'lastname'  => $order_info['shipping_lastname'],
				'company'   => $order_info['shipping_company'],
				'address_1' => $order_info['shipping_address_1'],
				'address_2' => $order_info['shipping_address_2'],
				'city'      => $order_info['shipping_city'],
				'postcode'  => $order_info['shipping_postcode'],
				'zone'      => $order_info['shipping_zone'],
				'zone_code' => $order_info['shipping_zone_code'],
				'country'   => $order_info['shipping_country']
				);
				
				$data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
				
				// Uploaded files
				$this->load->model('sale/order');
				$this->load->model('tool/upload');
				
				$data['products'] = array();
				
				$products = $this->model_purpletree_multivendor_stores->getOrderProducts($this->request->get['order_id'],$seller_id);
				
				foreach ($products as $product) {
					$option_data = array();
					
					$options = $this->model_sale_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);
					
					foreach ($options as $option) {
						if ($option['type'] != 'file') {
							$option_data[] = array(
							'name'  => $option['name'],
							'value' => $option['value'],
							'type'  => $option['type']
							);
							} else {
							$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
							
							if ($upload_info) {
								$option_data[] = array(
								'name'  => $option['name'],
								'value' => $upload_info['name'],
								'type'  => $option['type'],
								'href'  => $this->url->link('tool/upload/download', 'token=' . $this->session->data['token'] . '&code=' . $upload_info['code'], true)
								);
							}
						}
					}
					$product_seller = $this->model_purpletree_multivendor_stores->getStoreDetail($product['seller_id']);
					
					$data['products'][] = array(
					'order_product_id' => $product['order_product_id'],
					'product_id'       => $product['product_id'],
					'name'    	 	   => $product['name'],
					'model'    		   => $product['model'],
					'option'   		   => $option_data,
					'quantity'		   => $product['quantity'],
					'seller_name'		=> (!empty($product_seller['store_name'])?$product_seller['store_name']:''),
					'seller_id'		=> $product['seller_id'],
					'seller_order_status' => (!empty($product_seller['store_name'])?$this->model_purpletree_multivendor_stores->getLatestsellerstatus($this->request->get['order_id'], $product['seller_id']):''),
					'seller_href'		=> $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $product['seller_id'], true),
					'price'    		   => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
					'total'    		   => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
					'href'     		   => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $product['product_id'], true)
					);
				}
				
				$seller_id = array();
				$data['seller_detail'] = array();
				
				foreach($data['products'] as $productt) { 
					if(!in_array($productt['seller_id'],$seller_id)){
						$seller_id[] = $productt['seller_id'];
						$data['seller_detail'][] = array('seller_id'=>$productt['seller_id'],'seller_name'=>$productt['seller_name']);
					}
				} 
				
				$data['vouchers'] = array();
				$vouchers = $this->model_sale_order->getOrderVouchers($this->request->get['order_id']);
				
				foreach ($vouchers as $voucher) {
					$data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']),
					'href'        => $this->url->link('sale/voucher/edit', 'token=' . $this->session->data['token'] . '&voucher_id=' . $voucher['voucher_id'], true)
					);
				}
				
				$data['totals'] = array();
				
				$totals = $this->model_sale_order->getOrderTotals($this->request->get['order_id']);
				
				foreach ($totals as $total) {
					if($total['title'] == 'Refunded'){
						$ids = array();
						$return_sellername = "";
						$return_storeurl = "";
						$ids = explode('_',$total['code']);						
						$seller_idd = $ids[1];
						$sellerdd = $this->model_purpletree_multivendor_stores->getsellerInfofororder($seller_idd); 
						$return_sellername  = $sellerdd['seller_name'];
						$return_storeurl = $this->url->link('purpletree_multivendor/stores/edit&store_id='.$sellerdd['store_id'], 'token=' . $this->session->data['token'], true);
						$final_title = $total['title']." "."(".("<a href=".$return_storeurl.">".$return_sellername."</a>").")";
						
						
						}else{
						$final_title = $total['title'];
					}
					$data['totals'][] = array(
					'title' => $final_title,
					'sub_title' => $total['title'],
					'code' => $total['code'],
					'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
					'amount'  => ltrim($total['value'],$total['value'][0])
					);
				}
				$data['refund_acton']=$this->url->link('purpletree_multivendor/sellerorders/refundupdate', 'token=' . $this->session->data['token']. $url, true);
				$shipping_totals = $this->model_purpletree_multivendor_stores->getOrderTotalsfromorder($this->request->get['order_id']); 
				$data['shipping_totals'] = array();
				foreach ($shipping_totals as $shipping_total) {
					if($shipping_total['code'] == 'seller_shipping') {
						$sellername = "";
						$storeurll = "";
						if($shipping_total['seller_id'] != 0) {
							$sellerdd = $this->model_purpletree_multivendor_stores->getsellerInfofororder($shipping_total['seller_id']); 
							$sellername  = $sellerdd['seller_name'];
							$storeurll = $this->url->link('purpletree_multivendor/stores/edit&store_id='.$sellerdd['store_id'], 'token=' . $this->session->data['token'], true);
						}
						$data['shipping_totals'][] = array(
						'title' => $shipping_total['title'],
						'seller_id' => $shipping_total['seller_id'],
						'seller_name' => $sellername,
						'seller_link' => $storeurll,
						'text'  => $this->currency->format($shipping_total['value'], $order_info['currency_code'], $order_info['currency_value'])
						);
					}
				}
				$data['comment'] = nl2br($order_info['comment']);
				
				$this->load->model('customer/customer');
				
				$data['reward'] = $order_info['reward'];
				
				$data['reward_total'] = $this->model_customer_customer->getTotalCustomerRewardsByOrderId($this->request->get['order_id']);
				
				$data['affiliate_firstname'] = $order_info['affiliate_firstname'];
				$data['affiliate_lastname'] = $order_info['affiliate_lastname'];
				
				if ($order_info['affiliate_id']) {
					$data['affiliate'] = $this->url->link('marketing/affiliate/edit', 'token=' . $this->session->data['token'] . '&affiliate_id=' . $order_info['affiliate_id'], true);
					} else {
					$data['affiliate'] = '';
				}
				
				$data['commission'] = $this->currency->format($order_info['commission'], $order_info['currency_code'], $order_info['currency_value']);
				
				$this->load->model('marketing/affiliate');
				
				$data['commission_total'] = $this->model_marketing_affiliate->getTotalTransactionsByOrderId($this->request->get['order_id']);
				
				$this->load->model('localisation/order_status');
				
				$order_status_info = $this->model_localisation_order_status->getOrderStatus($order_info['order_status_id']);
				
				if ($order_status_info) {
					$data['order_status'] = $order_status_info['name'];
					} else {
					$data['order_status'] = '';
				}
				
				$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
				
				$data['order_status_id'] = $order_info['order_status_id'];
				
				$data['account_custom_field'] = $order_info['custom_field'];
				
				// Custom Fields
				$this->load->model('customer/custom_field');
				
				$data['account_custom_fields'] = array();
				
				$filter_data = array(
				'sort'  => 'cf.sort_order',
				'order' => 'ASC'
				);
				
				$custom_fields = $this->model_customer_custom_field->getCustomFields($filter_data);
				
				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'account' && isset($order_info['custom_field'][$custom_field['custom_field_id']])) {
						if ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio') {
							$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($order_info['custom_field'][$custom_field['custom_field_id']]);
							
							if ($custom_field_value_info) {
								$data['account_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $custom_field_value_info['name']
								);
							}
						}
						
						if ($custom_field['type'] == 'checkbox' && is_array($order_info['custom_field'][$custom_field['custom_field_id']])) {
							foreach ($order_info['custom_field'][$custom_field['custom_field_id']] as $custom_field_value_id) {
								$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($custom_field_value_id);
								
								if ($custom_field_value_info) {
									$data['account_custom_fields'][] = array(
									'name'  => $custom_field['name'],
									'value' => $custom_field_value_info['name']
									);
								}
							}
						}
						
						if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea' || $custom_field['type'] == 'file' || $custom_field['type'] == 'date' || $custom_field['type'] == 'datetime' || $custom_field['type'] == 'time') {
							$data['account_custom_fields'][] = array(
							'name'  => $custom_field['name'],
							'value' => $order_info['custom_field'][$custom_field['custom_field_id']]
							);
						}
						
						if ($custom_field['type'] == 'file') {
							$upload_info = $this->model_tool_upload->getUploadByCode($order_info['custom_field'][$custom_field['custom_field_id']]);
							
							if ($upload_info) {
								$data['account_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $upload_info['name']
								);
							}
						}
					}
				}
				
				// Custom fields
				$data['payment_custom_fields'] = array();
				
				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'address' && isset($order_info['payment_custom_field'][$custom_field['custom_field_id']])) {
						if ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio') {
							$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($order_info['payment_custom_field'][$custom_field['custom_field_id']]);
							
							if ($custom_field_value_info) {
								$data['payment_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $custom_field_value_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
						
						if ($custom_field['type'] == 'checkbox' && is_array($order_info['payment_custom_field'][$custom_field['custom_field_id']])) {
							foreach ($order_info['payment_custom_field'][$custom_field['custom_field_id']] as $custom_field_value_id) {
								$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($custom_field_value_id);
								
								if ($custom_field_value_info) {
									$data['payment_custom_fields'][] = array(
									'name'  => $custom_field['name'],
									'value' => $custom_field_value_info['name'],
									'sort_order' => $custom_field['sort_order']
									);
								}
							}
						}
						
						if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea' || $custom_field['type'] == 'file' || $custom_field['type'] == 'date' || $custom_field['type'] == 'datetime' || $custom_field['type'] == 'time') {
							$data['payment_custom_fields'][] = array(
							'name'  => $custom_field['name'],
							'value' => $order_info['payment_custom_field'][$custom_field['custom_field_id']],
							'sort_order' => $custom_field['sort_order']
							);
						}
						
						if ($custom_field['type'] == 'file') {
							$upload_info = $this->model_tool_upload->getUploadByCode($order_info['payment_custom_field'][$custom_field['custom_field_id']]);
							
							if ($upload_info) {
								$data['payment_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $upload_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
					}
				}
				
				// Shipping
				$data['shipping_custom_fields'] = array();
				
				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'address' && isset($order_info['shipping_custom_field'][$custom_field['custom_field_id']])) {
						if ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio') {
							$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($order_info['shipping_custom_field'][$custom_field['custom_field_id']]);
							
							if ($custom_field_value_info) {
								$data['shipping_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $custom_field_value_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
						
						if ($custom_field['type'] == 'checkbox' && is_array($order_info['shipping_custom_field'][$custom_field['custom_field_id']])) {
							foreach ($order_info['shipping_custom_field'][$custom_field['custom_field_id']] as $custom_field_value_id) {
								$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($custom_field_value_id);
								
								if ($custom_field_value_info) {
									$data['shipping_custom_fields'][] = array(
									'name'  => $custom_field['name'],
									'value' => $custom_field_value_info['name'],
									'sort_order' => $custom_field['sort_order']
									);
								}
							}
						}
						
						if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea' || $custom_field['type'] == 'file' || $custom_field['type'] == 'date' || $custom_field['type'] == 'datetime' || $custom_field['type'] == 'time') {
							$data['shipping_custom_fields'][] = array(
							'name'  => $custom_field['name'],
							'value' => $order_info['shipping_custom_field'][$custom_field['custom_field_id']],
							'sort_order' => $custom_field['sort_order']
							);
						}
						
						if ($custom_field['type'] == 'file') {
							$upload_info = $this->model_tool_upload->getUploadByCode($order_info['shipping_custom_field'][$custom_field['custom_field_id']]);
							
							if ($upload_info) {
								$data['shipping_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $upload_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
					}
				}
				
				$data['ip'] = $order_info['ip'];
				$data['forwarded_ip'] = $order_info['forwarded_ip'];
				$data['user_agent'] = $order_info['user_agent'];
				$data['accept_language'] = $order_info['accept_language'];
				
				// Additional Tabs
				$data['tabs'] = array();
				
				if ($this->user->hasPermission('access', 'extension/payment/' . $order_info['payment_code'])) {
					if (is_file(DIR_CATALOG . 'controller/extension/payment/' . $order_info['payment_code'] . '.php')) {
						$content = $this->load->controller('extension/payment/' . $order_info['payment_code'] . '/order');
						} else {
						$content = null;
					}
					
					if ($content) {
						$this->load->language('extension/payment/' . $order_info['payment_code']);
						
						$data['tabs'][] = array(
						'code'    => $order_info['payment_code'],
						'title'   => $this->language->get('heading_title'),
						'content' => $content
						);
					}
				}
				
				$this->load->model('extension/extension');
				
				$extensions = $this->model_extension_extension->getInstalled('fraud');
				
				foreach ($extensions as $extension) {
					if ($this->config->get($extension . '_status')) {
						$this->load->language('extension/fraud/' . $extension);
						
						$content = $this->load->controller('extension/fraud/' . $extension . '/order');
						
						if ($content) {
							$data['tabs'][] = array(
							'code'    => $extension,
							'title'   => $this->language->get('heading_title'),
							'content' => $content
							);
						}
					}
				}
				
				// The URL we send API requests to
				$data['catalog'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;
				
				// API login
				$this->load->model('user/api');
				
				$api_info = $this->model_user_api->getApi($this->config->get('config_api_id'));
				
				if ($api_info) {
					$data['api_id'] = $api_info['api_id'];
					$data['api_key'] = $api_info['key'];
					$data['api_ip'] = $this->request->server['REMOTE_ADDR'];
					} else {
					$data['api_id'] = '';
					$data['api_key'] = '';
					$data['api_ip'] = '';
				}
				$data['paypalpayouts'] = '0';
				if(null !== $this->config->get('purpletree_multivendor_commission_status') && $order_info['order_status_id'] == $this->config->get('purpletree_multivendor_commission_status') && $order_info['payment_code'] == 'pp_adaptive') {
					$data['paypalpayouts'] = '1';
				} 
				$data['header'] = $this->load->controller('common/header');
				$data['column_left'] = $this->load->controller('common/column_left');
				$data['footer'] = $this->load->controller('common/footer');
				
				$this->response->setOutput($this->load->view('purpletree_multivendor/order_info', $data));
				} else{
				return new Action('error/not_found');
			}
		}
		public function refundupdate() {
			if (isset($this->request->post['code'])) {
				$this->load->model('purpletree_multivendor/stores');
				$this->model_purpletree_multivendor_stores->updateRefund($this->request->post);
			}
			$url = '';
			if(isset($this->request->post['refund_order_id'])){
				$order_id = $this->request->post['refund_order_id'];
				$this->response->redirect($this->url->link('purpletree_multivendor/sellerorders/order_info', 'token=' . $this->session->data['token'] . '&order_id=' . $order_id . $url, true));
				}else{
				$this->response->redirect($this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true));
			}        
		}
		public function curlpaypaypal() {
			$json = array();
			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
				$access_token = $this->getAccestoken();
				$access_token = $this->getAccestoken();
				if($access_token != '') {
				$this->load->model('extension/payment/pp_adaptive');
				$this->load->model('purpletree_multivendor/commissioninvoice');
					$payout_batch_id = $this->model_extension_payment_pp_adaptive->getPayout_batch_id($order_id);
					if($payout_batch_id) {
					$getpayoutss = $this->getpayoutInformation($payout_batch_id,$order_id,$access_token);
						if(!empty($getpayoutss)) {
						if($this->config->get('payment_pp_adaptive_debug')){
										$this->log->write('getpayoutss');
										$this->log->write($getpayoutss);
									}
							foreach($getpayoutss as $keys=>$valuess){
								$invoiceidsss = $this->model_extension_pp_adaptive->getpayoutcomm($order_id,$valuess['seller_id']);
								if(!empty($invoiceidsss)) {
								foreach($invoiceidsss as $invoic) {
								$stats = 'Pending';
								if($valuess['transaction_status'] == 'SUCCESS') {
									$stats = 'Complete';
								}
									$output = implode(', ', array_map(
												function ($v, $k) {
													if(is_array($v)){
														return $k.'[]='.implode('&'.$k.'[]=', $v);
													}else{
														return $k.'='.$v;
													}
												}, 
												$valuess, 
												array_keys($valuess)
											));
								$messageseller = "Seller Payout Transaction ".$valuess['transaction_status']." status: ".$output;	
								$data = array(
											'invoice_id' 	=> $invoic['invoice_id'],
											'seller_id' 	=> $valuess['seller_id'],
											'payment_mode' 	=> 'Online',
											'status' 		=> $stats,
											'txn_id' 		=> ($valuess['transaction_id'] != '')?$valuess['transaction_id']:$valuess['transaction_status'] ,
											'amount' 		=> $valuess['amount'],
											'comment' 		=> $messageseller,
											
								);
								$this->model_purpletree_multivendor_commissioninvoice->addCommissionHistory($data);
								$json['success'] = "PayPal Payout Status updated successfully for Seller Payments.";
								}
								}
							}
						} else {
							$json['error'] = "No Seller Payouts found for the request.";
						}
					} else {
						$json['error'] = "Invalid Request for Order.";
					}
				} else {
					$json['error'] = "Invalid Access Token from Paypal Payout. Please check Purpletree Paypal Payout Settings";
				}
			} else {
				$json['error'] = "Invalid Order ID";
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	public function getAccestoken() {
		 $tokenreturn = "";
		 $client_id   = $this->config->get('payment_pp_adaptive_client_id');
		 $secret      = $this->config->get('payment_pp_adaptive_admin_secret');
	 	if (!$this->config->get('payment_pp_adaptive_test')) {
				$curl = 'https://api.paypal.com/v1/oauth2/token';
			} else {
				$curl = 'https://api.sandbox.paypal.com/v1/oauth2/token';
			}
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, $curl);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
				curl_setopt($ch, CURLOPT_USERPWD, $client_id . ':' . $secret);

				$headers = array();
				$headers[] = 'Accept: application/json';
				$headers[] = 'Accept-Language: en_US';
				$headers[] = 'Content-Type: application/x-www-form-urlencoded';
				curl_setopt($ch, CURLOPT_HTTPHEADER, $headers); 

				$result = curl_exec($ch);
				if (curl_errno($ch)) {
					if ($this->config->get('payment_pp_adaptive_debug')) {
						$this->log->write('Error on get Access Token: ' . curl_error($ch));
						//echo 'Error:' . curl_error($ch);
					}
				curl_close($ch);
				} else {
				$response = json_decode($result, true);
				curl_close($ch);
					if ($this->config->get('payment_pp_adaptive_debug')) {
						$this->log->write('Response with Access Token: ' . $result);
					}
					if(isset($response['access_token'])) {
						$tokenreturn = $response['access_token'];
					}
				}
				return $tokenreturn;
	}
	public function getpayoutInformation($payout_batch_id = "",$order_id = "",$access_token = "") {
	$ch2 = curl_init();
		if (!$this->config->get('payment_pp_adaptive_test')) {
					$curl1 = 'https://api.paypal.com/v1/payments/payouts/';
				} else {
					$curl1 = 'https://api.sandbox.paypal.com/v1/payments/payouts/';
				}
				curl_setopt($ch2, CURLOPT_URL, $curl1.$payout_batch_id);
				curl_setopt($ch2, CURLOPT_RETURNTRANSFER, 1);
				$headers = array();
				$headers[] = 'Content-Type: application/json';
				$headers[] = 'Authorization: Bearer '.$access_token;
				curl_setopt($ch2, CURLOPT_HTTPHEADER, $headers);
				$result1 = curl_exec($ch2);
				$responseData = array();
					if (curl_errno($ch2)) {
						//echo 'Error:' . curl_error($ch2);
						if ($this->config->get('payment_pp_adaptive_debug')) {
							$this->log->write('Error on GET Payouts: ' . curl_error($ch2));
						}
					curl_close($ch2);
					} else {
				$response1 = json_decode($result1, true);
					curl_close($ch2);
					if ($this->config->get('payment_pp_adaptive_debug')) {
							$this->log->write('Response check payout with id: ' . $result1);
						}
						if(isset($response1['batch_header']) && isset($response1['batch_header']['batch_status'])) {
							if(isset($response1['items'])) {
								foreach($response1['items'] as $item) {
									if(isset($item['payout_item']['recipient_type'])) {
										if($item['payout_item']['recipient_type'] == 'EMAIL') {
											if(isset($item['payout_item']['receiver'])) {
												 $recemail = $item['payout_item']['receiver'];
												// opencartdata
								$transaction_id='';
								$transaction_status='';
								if(isset($item['transaction_id'])){
									$transaction_id = $item['transaction_id'];
									//$item['payout_item_id'];
								}
								if(isset($item['transaction_status'])){
									$transaction_status=$item['transaction_status'];
								}
							if(isset($item['payout_item']['sender_item_id'])) {
								$sender_item_id = $item['payout_item']['sender_item_id'];
								$seller_id = explode('_',$sender_item_id);
								$responseData[] = array(
								'seller_id'					=> $seller_id[0],
								'transaction_id'			=> $transaction_id,
								'payout_item_id'			=> isset($item['payout_item_id'])?$item['payout_item_id']:'',
								'activity_id'				=> isset($item['activity_id'])?$item['activity_id']:'',
								'payout_batch_id'			=> isset($item['payout_batch_id'])?$item['payout_batch_id']:'',
								'transaction_status' 		=> $transaction_status,
								'email'						=> $recemail,
								'currency'					=> $item['payout_item']['amount']['currency'],
								'amount'					=> $item['payout_item']['amount']['value'],
								'sender_item_id'			=> $item['payout_item']['sender_item_id'],
								'recipient_wallet'			=> $item['payout_item']['recipient_wallet'],
								);
							}
										}
									}	
								}
							}
						}
					}
				}
					return $responseData;
	}
}