<?php
class ControllerAccountPurpletreeMultivendorCommissioninvoice extends Controller {
		private $error = array();
		public function index(){
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/moment.js'); 
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/bootstrap-datetimepicker.min.js'); 
			$this->document->addStyle('catalog/view/javascript/purpletree/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
			
			$this->load->language('purpletree_multivendor/commissioninvoice');
			
			$this->load->model('purpletree_multivendor/commissioninvoice');
			
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
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
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			$url = '';
			
			if (isset($this->request->get['filter_date_from'])) {
				$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];
			}
			
			if (isset($this->request->get['filter_date_to'])) {
				$url .= '&filter_date_to=' . $this->request->get['filter_date_to'];
			}
			
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-commission";
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
			'href' => $this->url->link('account/purpletree_multivendor/commissioninvoice',$url, true)
			);
			$this->document->setTitle($this->language->get('heading_title'));
			
			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_action'] = $this->language->get('text_action');
			$data['text_list'] = $this->language->get('text_list');
			$data['text_pending_amt'] = $this->language->get('text_pending_amt');
			$data['text_invoice_id'] = $this->language->get('text_invoice_id');
			$data['text_created_at'] = $this->language->get('text_created_at');
			$data['text_commission'] = $this->language->get('text_commission');
			$data['text_no_results'] = $this->language->get('text_empty');
			$data['button_view'] = $this->language->get('button_view');
			$data['entry_date_from'] = $this->language->get('entry_date_from');
			$data['entry_date_to'] = $this->language->get('entry_date_to');
			$data['button_filter'] = $this->language->get('button_filter');
			
			$url = '';
			$data['seller_commissions'] = array();
			$filter_data = array(
		    'seller_id'       => $this->customer->getId(),
			'filter_date_from'    => $filter_date_from,
			'filter_date_to'	 => $filter_date_to,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin')
			);
			$seller_commissions = $this->model_purpletree_multivendor_commissioninvoice->getCommissions($filter_data);
			$total_commissions = 0;
			$data['seller_commissions'] = array();
			if(!empty($seller_commissions)) {
				foreach($seller_commissions as $invocee) {
					$data['seller_commissions'][] = array(
					'id' 			=> $invocee['id'],
					'created_at' 	=> $invocee['created_at'],
					'view' 			=> $this->url->link('account/purpletree_multivendor/commissioninvoice/view','&commision_view_id='.$invocee['id'], true)
					);
				}
				$total_commissions = $this->model_purpletree_multivendor_commissioninvoice->getTotalCommissionsinvoices($filter_data);
			}
			
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} elseif (isset($this->session->data['error_warning'])) {
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
			
			$pagination = new Pagination();
			$pagination->total = $total_commissions;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('account/purpletree_multivendor/commissioninvoice',$url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($total_commissions) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_commissions - $this->config->get('config_limit_admin'))) ? $total_commissions : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_commissions, ceil($total_commissions / $this->config->get('config_limit_admin')));
			
			$data['filter_date_from'] = $filter_date_from;
			$data['filter_date_to'] = $filter_date_to;
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/commissioninvoice_list', $data));
		}
		public function view(){
			
			//$this->document->addStyle('catalog/view/javascript/bootstrap/css/bootstrap.css');
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/commissioninvoice', '', true);
				
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
				$this->response->redirect($this->url->link('account/purpletree_multivendor/commissioninvoice', '', true));
			}
			
			$this->load->language('account/order');
			$this->load->language('purpletree_multivendor/commissioninvoice');
			//$data['title'] = $this->language->get('text_commision_invoice');
			$data['title'] = "Commission Invoice";
			$this->load->model('account/order');
			$this->load->model('purpletree_multivendor/commissioninvoice');
			$this->load->model('catalog/product');
			$this->load->model('purpletree_multivendor/sellercommission');
			
			$this->load->model('setting/setting');
			
			$data['orders'] = array();
			$store_address = "";
			$store_email = "";
			$store_telephone = "";
			$orders = array();
			
			$commisionss = array();
			$data['created_date'] = '';
			if (isset($this->request->get['commision_view_id'])) {
				
				$commisions_invoice_id = $this->request->get['commision_view_id'];
				$commisionss =  $this->model_purpletree_multivendor_commissioninvoice->getiinvoiceitems($commisions_invoice_id);
				
				$data['invoice_number'] = $this->request->get['commision_view_id'];
				$commioncreated_date = $this->model_purpletree_multivendor_commissioninvoice->getinvoicedate($commisions_invoice_id);
				//////////
				$commissions_invoice = $this->model_purpletree_multivendor_commissioninvoice->getCommissionsInvoice($commisions_invoice_id);
				//////////
				
				if(!empty($commioncreated_date)) {
					
					$data['created_date'] = $commioncreated_date['created_at'];
				}
				else {
					$this->response->redirect($this->url->link('account/purpletree_multivendor/commissioninvoice','',true));
				}
				} else {
				$this->response->redirect($this->url->link('account/purpletree_multivendor/commissioninvoice','',true));
			}
			
			$total_commission = 0;
			$total_fixed_commission = 0;
			$total_ccommission_percent = 0;
			$total_shipping_commission = 0;
			$total_percent_commission = 0;
			$total_quantity = 0;
			$this->load->model('purpletree_multivendor/sellerpayment');
			$curency = $this->config->get('config_currency');
			$seller_vatname = $this->language->get('seller_vatname');
			$vat_field_id =  $this->model_purpletree_multivendor_commissioninvoice->getCustomFieldIdFromName($seller_vatname);
			$currency_detail = $this->model_purpletree_multivendor_sellerpayment->getCurrencySymbol($curency);
			$data['taxname'] = '';
			if(null !== $this->config->get('purpletree_multivendor_tax_name')) {
				$data['taxname'] = $this->config->get('purpletree_multivendor_tax_name');
			}
			$data['taxvalue'] = '';
			if(null !== $this->config->get('purpletree_multivendor_tax_value')) {
				$data['taxvalue'] = $this->config->get('purpletree_multivendor_tax_value');
			}
			$data['seller_vatnumber'] = '';
			$data['seller_vatname'] = $seller_vatname;
			if(!empty($commisionss)) {
				foreach ($commisionss as $commisionid) {
					$data['sellerdetails'] = $this->model_purpletree_multivendor_commissioninvoice->getStoreDetail($commisionid['seller_id']);
					$this->load->model('purpletree_multivendor/vendor');
					$data['seller_country'] = $this->model_purpletree_multivendor_commissioninvoice->getCountryName($data['sellerdetails']['store_country']);
					$data['sellerdetails']['store_email']  = $this->model_purpletree_multivendor_vendor->getCustomerEmailId($commisionid['seller_id']);
					if($vat_field_id) {
						$vatnumberserialzed =  $this->model_purpletree_multivendor_commissioninvoice->getvatfromid($commisionid['seller_id']);
						if($vatnumberserialzed) {
							$customfields = json_decode($vatnumberserialzed);
							if(!empty($customfields)) {
								foreach($customfields as $key => $customfield) {
									if($key == $vat_field_id) {
										$data['seller_vatnumber'] =  $customfield;
									}
								}
							}
						}			
					}
					$order_id = $commisionid['order_id'];
					//$order_info = $this->model_account_order->getanyOrder(trim($order_id));
					$order_info = $this->model_purpletree_multivendor_commissioninvoice->getanyOrder(trim($order_id));
					// Make sure there is a shipping method
					if ($order_info) {
						$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
						if ($store_info) {
							$store_address = $store_info['config_address'];
							$store_email = $store_info['config_email'];
							$store_telephone = $store_info['config_telephone'];
							} else {
							$store_address = $this->config->get('config_address');
							$store_email = $this->config->get('config_email');
							$store_telephone = $this->config->get('config_telephone');
						}
						
						$this->load->model('tool/upload');
						$product_data = array();
						$product_info = $this->model_catalog_product->getProduct($commisionid['product_id']);
						$ccommission_percent = 0;
						if ($product_info) {
							$option_data = array();
							$products = $this->model_account_order->getOrderProducts($order_id);
							foreach ($products as $product) {
								if($product['product_id'] == $commisionid['product_id']) {
									$product = $product;
									$options = $this->model_account_order->getOrderOptions($order_id, $product['order_product_id']);
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
									break;
								}
							}
							
							
							$product_data = array(
							'name'     => $product_info['name'],
							'option'   => $option_data,
							'quantity' => $product['quantity'],
							'price_total' =>  $this->currency->format($product['total'], $currency_detail['code'], $currency_detail['value']),
							);
							$ccommission_percent = ($commisionid['commission_percent']/100)*$product['total'];
						}
						
						
						$data['orders'][] = array(
						'order_id'	       => $order_id,
						//'invoice_no'       => $invoice_no,
						'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
						'store_name'       => $order_info['store_name'],
						'store_url'        => rtrim($order_info['store_url'], '/'),
						'store_address'    => nl2br($store_address),
						'store_email'      => $store_email,
						'store_telephone'  => $store_telephone,
						'email'            => $order_info['email'],
						'telephone'        => $order_info['telephone'],
						'product'          => $product_data,
						'commission_percent'  => $this->currency->format($ccommission_percent, $currency_detail['code'], $currency_detail['value']),
						'commission_fixed'    => $this->currency->format($commisionid['commission_fixed'], $currency_detail['code'], $currency_detail['value']),
						'commission_shipping' => $this->currency->format($commisionid['commission_shipping'], $currency_detail['code'], $currency_detail['value']),
						'total_commission'    => $this->currency->format($commisionid['total_commission'], $currency_detail['code'], $currency_detail['value']),
						'comment'          	  => nl2br($order_info['comment'])
						);
						$total_ccommission_percent += $ccommission_percent;
						$total_commission += $commisionid['total_commission'];
						$total_fixed_commission += $commisionid['commission_fixed'];
						$total_shipping_commission += $commisionid['commission_shipping'];
						$total_percent_commission += $commisionid['commission_percent'];
						$total_quantity += $product['quantity'];
					}
				}
				} else {
				$this->response->redirect($this->url->link('purpletree_multivendor/commissioninvoice','',true));
			}
			///////////////////////////////////////////////
			$invoice_status = $this->model_purpletree_multivendor_commissioninvoice->getInvoiceStatus($commisions_invoice_id);
			if($invoice_status) {
				$data['invoice_status'] = $invoice_status;
				} else {
				$invoice_status = $this->model_purpletree_multivendor_commissioninvoice->getDefaultstatus();
				$data['invoice_status'] = $invoice_status;
			}
			
			if(!empty($commissions_invoice)) {
				foreach($commissions_invoice as $commissions_invoicess) {
					$commissions_invoicesss = array(
					'id' 			=> $commissions_invoicess['id'],
					'total_commission' 	=> $this->currency->format($commissions_invoicess['total_commission'], $currency_detail['code'], $currency_detail['value']),
					
					'total_pay_amount' 	=> $this->currency->format($commissions_invoicess['total_pay_amount'], $currency_detail['code'], $currency_detail['value']),				
					'created_at' 	=>date('d/m/Y', strtotime($commissions_invoicess['created_at'])),
					);
				}
			}
			
			$commissions_history = $this->model_purpletree_multivendor_commissioninvoice->getCommissionHistory($commisions_invoice_id);
			$data['commissionnn_history'] = array();
			if(isset($commissions_history) && !empty($commissions_history)){
				foreach($commissions_history as $commission_historyy){			
					$data['commissionnn_history'][]=array(
					'id'=>$commission_historyy['id'],
					'transaction_id'=>$commission_historyy['transaction_id'],
					'payment_mode'=>$commission_historyy['payment_mode'],
					'created_date'=>$commission_historyy['created_date'],
					'comment'=>$commission_historyy['comment'],
					'status_id'=>$this->model_purpletree_multivendor_commissioninvoice->getCommissionStatus($commission_historyy['status_id'])					
					);	
				}
			}
			$data['created_at'] = $commissions_invoicesss['created_at'];
			$data['total_commissionn'] = $commissions_invoicesss['total_commission'];
			$data['total_pay_amountt'] = $commissions_invoicesss['total_pay_amount'];
			$data['purpletree_multivendor_footer_text'] = $this->config->get('purpletree_multivendor_footer_text');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_transacton_id'] = $this->language->get('column_transacton_id');
			$data['column_payment_mode'] = $this->language->get('column_payment_mode');
			$data['column_payment_date'] = $this->language->get('column_payment_date');
			$data['column_commentt'] = $this->language->get('column_commentt');
			$data['column_statuss'] = $this->language->get('column_statuss');
			$data['column_commentt'] = $this->language->get('column_commentt');
			$data['column_id'] = $this->language->get('column_id');
			$data['text_created_at'] = $this->language->get('text_created_at');
			$data['column_product'] = $this->language->get('column_product');
			$data['text_payment'] = $this->language->get('text_payment');
			$data['text_totla_payable_amount'] = $this->language->get('text_totla_payable_amount');
			$data['payment_status'] = $this->language->get('payment_status');
			////////////////////////////////////////////////////
			$data['total_fixed_commission']       = $this->currency->format($total_fixed_commission, $currency_detail['code'], $currency_detail['value']);
			$data['total_shipping_commission']       = $this->currency->format($total_shipping_commission, $currency_detail['code'], $currency_detail['value']);
			$data['total_percent_commission']       = $total_percent_commission;
			$data['total_ccommission_percent']       = $this->currency->format($total_ccommission_percent, $currency_detail['code'], $currency_detail['value']);
			$data['total_commission']       = $this->currency->format($total_commission, $currency_detail['code'], $currency_detail['value']);
			$data['total_quantity']       = $total_quantity;
			$data['store_name']       = $order_info['store_name'];
			$data['store_url']        = rtrim($order_info['store_url'], '/');
			$data['store_address']    = nl2br($store_address);
			$data['store_email']      = $store_email;
			$data['store_telephone']  = $store_telephone;
			$data['text1'] = $this->language->get('text1');
			$data['column_product_price'] = $this->language->get('column_product_price');
			$data['text2'] = $this->language->get('text2');
			$data['total_text'] = $this->language->get('total_text');
			$data['text3'] = $this->language->get('text3');
			$data['invoice_number_text'] = $this->language->get('invoice_number_text');
			$data['commision_product'] = $this->language->get('commision_product');
			$data['fixed_text'] = $this->language->get('fixed_text');
			$data['column_commission_percent'] = $this->language->get('column_commission_percent');
			$data['fixed_text'] = $this->language->get('fixed_text');
			$data['shipping_text'] = $this->language->get('shipping_text');
			$data['order_id_text'] = $this->language->get('order_id_text');
			$data['vat_number'] = $this->language->get('vat_number');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_telephone'] = $this->language->get('text_telephone');
			$data['text_website'] = $this->language->get('text_website');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_product'] = $this->language->get('column_product');
			$data['text_order_detail'] = $this->language->get('text_order_detail');
			$data['commissionn_history'] = $this->language->get('commissionn_history');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['HTTPS_SERVER'] = HTTPS_SERVER;
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/commison_invoicee', $data));	
		}
}
?>