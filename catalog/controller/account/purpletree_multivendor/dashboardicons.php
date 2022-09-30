<?php
class ControllerAccountPurpletreeMultivendorDashboardicons extends Controller {
		private $error = array();
		
		public function index(){ 
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/dashboardicons', '', true);
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerlogin', '', true));
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
			$this->load->language('purpletree_multivendor/dashboard');
			$this->load->model('purpletree_multivendor/dashboard');
			$data['seller_orders'] = array();
			
			$this->document->setTitle($this->language->get('heading_title1'));
			if (isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				
				unset($this->session->data['error_warning']);
				} else {
				$data['error_warning'] = '';
			}
		if (isset($this->session->data['success_stripe_connect'])) {
				$data['success'] = $this->session->data['success_stripe_connect'];
				
				unset($this->session->data['success_stripe_connect']);
				} else {
				$data['success'] = '';
			}
			
			if (isset($this->session->data['error_stripe_connect_warning'])) {
				$data['error_warning'] = $this->session->data['error_stripe_connect_warning'];
				
				unset($this->session->data['error_stripe_connect_warning']);
				} else {
				$data['error_warning'] = '';
			}
			
			$url ='';
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'image/catalog/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'image/catalog/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title1'),
			'href' => $this->url->link('account/purpletree_multivendor/dashboardicons', $url, true)
			);
			//Start dashboard icons section//
            
            
	            $dashboard_icons=array();
                $dashboard_icons=$this->config->get('purpletree_multivendor_icons_status');
				if(!empty($dashboard_icons)) {
		         foreach($dashboard_icons as $key => $value){
					$data[$key]=0;
					$data[$value]=1;
				}
				}
				
                 //End dashboard icons section//
			$totalorders1 = $this->model_purpletree_multivendor_dashboard->getCountSeen($this->customer->getId());
			$data['totalorders'] = $totalorders1;
			$totalenqures1 = $this->model_purpletree_multivendor_dashboard->getCountSeen1($this->customer->getId());
			$data['totaladminmessages'] = $this->model_purpletree_multivendor_dashboard->getCountAdminMessageSeen($this->customer->getId());
			$data['totalenqures'] = $totalenqures1;
			$data['purpletree_multivendor_seller_product_template'] = $this->config->get('purpletree_multivendor_seller_product_template');
			$data['isSeller'] = $this->customer->isSeller();
			$store_id = (isset($data['isSeller']['id'])?$data['isSeller']['id']:'');
			$this->load->model('localisation/order_status');
			$data['heading_title']=$this->language->get('heading_title1');		
			$data['text_blog_post'] = $this->language->get('text_blog_post');
			$data['text_blog_comment'] = $this->language->get('text_blog_comment');
			$data['text_commissioninvoice'] = $this->language->get('text_commissioninvoice');
			$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
			$data['text_Manage_Downloads'] = $this->language->get('text_Manage_Downloads');
			$data['text_reviews'] = $this->language->get('text_reviews');
			$data['text_Seller_Account'] = $this->language->get('text_Seller_Account');
			$data['text_Customer_Enquiries'] = $this->language->get('text_Customer_Enquiries');
			$data['text_sellerenquiries'] = $this->language->get('text_sellerenquiries');
			$data['text_Bulk_product_upload'] = $this->language->get('text_Bulk_product_upload');
			$data['text_Orders'] = $this->language->get('text_Orders');
			$data['text_Seller_Store'] = $this->language->get('text_Seller_Store');
			$data['text_Store_information'] = $this->language->get('text_Store_information');
			$data['text_View_Store'] = $this->language->get('text_View_Store');
			$data['text_Subscription_Invoice'] = $this->language->get('text_Subscription_Invoice');
			$data['text_Seller_Payments'] = $this->language->get('text_Seller_Payments');
			$data['text_Subscription_plan'] = $this->language->get('text_Subscription_plan');
			$data['text_Payments'] = $this->language->get('text_Payments');
			$data['text_Commisions'] = $this->language->get('text_Commisions');
			$data['text_shiiping_rate'] = $this->language->get('text_shiiping_rate');
			$data['text_Manage_products'] = $this->language->get('text_Manage_products');		
			$data['text_seller_template_product'] = $this->language->get('text_seller_template_product');
			$data['text_sellercoupons'] = $this->language->get('text_sellercoupons');
			$data['text_seller_returns'] = $this->language->get('text_seller_returns');
			
			$data['sellerprofile'] = $this->url->link('account/edit', '', true);
			$data['downloadsitems'] = $this->url->link('account/purpletree_multivendor/downloads', '', true);
			$data['sellerstore'] = $this->url->link('account/purpletree_multivendor/sellerstore', '', true);
			$data['sellerproduct'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
			$end_date_to = date('Y-m-d');
			$end_date_from = date('Y-m-d', strtotime("-30 days"));				
			$data['sellerorder'] = $this->url->link('account/purpletree_multivendor/sellerorder', 'filter_date_from='.$end_date_from.'&filter_date_to=' .$end_date_to.'', true);
			$data['sellercommission'] = $this->url->link('account/purpletree_multivendor/sellercommission', '', true);
			$data['sellerpayment'] = $this->url->link('account/purpletree_multivendor/sellerpayment', '', true);
			$data['removeseller'] = $this->url->link('account/purpletree_multivendor/sellerstore/removeseller', '', true);
			$data['becomeseller'] = $this->url->link('account/purpletree_multivendor/sellerstore/becomeseller', '', true);
			$data['sellerview'] = $this->url->link('account/purpletree_multivendor/sellerstore/storeview&seller_store_id='.$store_id, '', true);
			$data['sellerreview'] = $this->url->link('account/purpletree_multivendor/sellerstore/sellerreview', '', true);
			$data['sellerenquiry'] = $this->url->link('account/purpletree_multivendor/sellercontact/sellercontactlist', '', true);
			$data['dashboardicons'] = $this->url->link('account/purpletree_multivendor/dashboardicons', '', true);
			$data['dashboard'] = $this->url->link('account/purpletree_multivendor/dashboard', '', true);
			if($this->config->get('purpletree_multivendor_shippingtype')){
				$data['shipping'] = $this->url->link('account/purpletree_multivendor/sellergeozone', '', true);
				} else {
				$data['shipping'] = $this->url->link('account/purpletree_multivendor/shipping', '', true);
			}
			$data['bulkproductupload'] = $this->url->link('account/purpletree_multivendor/bulkproductupload', '', true);
			
			if($this->config->get('purpletree_multivendor_subscription_plans')==1){
				
				$data['subscriptionplan'] = $this->url->link('account/purpletree_multivendor/subscriptionplan', '', true);
				
				$data['subscriptions'] = $this->url->link('account/purpletree_multivendor/subscriptions', '', true);
			}					
			$data['adminmessages'] = $this->url->link('account/purpletree_multivendor/sellerenquiries', '', true);
			$data['seller_blog_status'] = $this->config->get('purpletree_sellerblog_status');
			if($this->config->get('purpletree_sellerblog_status')){
				$data['sellerblogpost'] = $this->url->link('account/purpletree_multivendor/sellerblogpost', '', true);
				$data['sellerblogcomment'] = $this->url->link('account/purpletree_multivendor/sellerblogcomment', '', true);
			}
			$data['commissioninvoice'] = $this->url->link('account/purpletree_multivendor/commissioninvoice', '', true);
			if($data['purpletree_multivendor_seller_product_template'] == 1){
				$data['seller_template_product'] = $this->url->link('account/purpletree_multivendor/sellertemplateproduct', '', true);	
			}
			$data['sellercoupons'] = $this->url->link('account/purpletree_multivendor/sellercoupons', '', true);
			$data['seller_product_returns'] = $this->url->link('account/purpletree_multivendor/product_returns', '', true);
			//stripe connect	
			
			$data['text_stripe_connect']= $this->language->get('text_stripe_connect');
			$data['stripe_status'] = $stripe_status = $this->config->get('pts_stripe_status');
			
			if ($this->config->get('pts_stripe_debug')) {
				if($stripe_status){
					$this->log->write('Stripe payment mathod is enable');
				} else {
					$this->log->write('Stripe payment mathod is disable');
				}
			 }
			if($stripe_status){
				$data['a_href']='';	
				$data['a']='';
				$payment_mode = $this->config->get('pts_stripe_payment_mode');
				$stripe = array();
				if($payment_mode){
					$client_id=$this->config->get('pts_stripe_client_id_live');
				} else {
					$client_id=$this->config->get('pts_stripe_client_id_test');
				}
				
				if ($client_id==NULL) {
					if ($this->config->get('pts_stripe_debug')) {
						$this->log->write('Client Id is blank. Please enter client id in stripe payment setting');
					}
				}
				if($client_id!=NULL){
				$stripe_connect = 'https://dashboard.stripe.com/express/oauth/authorize?response_type=code&client_id='.$client_id.'&scope=read_write';
				
				/* $stripe_connect_standard= 'https://dashboard.stripe.com/oauth/authorize?response_type=code&client_id='.$client_id.'&scope=read_write'; */
				$data['a_href']='<a href="'.$stripe_connect.'">';	
				$data['a']='</a>';	
					$this->load->model('purpletree_multivendor/stripeconnect');
	$num_of_acc1 = $this->model_purpletree_multivendor_stripeconnect->checkAccountExistwithsellerid($this->customer->getId());
			if($num_of_acc1){
				$data['text_stripe_connect']= $this->language->get('text_stripe_connected');
				$data['a_href']='';	
				$data['a']='';	
			}
				}
			}
	//stripe connect		
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/dashboardicons', $data));
		}	
}