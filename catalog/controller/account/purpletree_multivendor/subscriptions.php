<?php
class ControllerAccountPurpletreeMultivendorSubscriptions extends Controller {
		private $error = array();
		
		public function index() {
			if (!$this->customer->isLogged()) {
				
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/subscriptions', '', true);
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
			
			$this->load->language('purpletree_multivendor/subscriptions');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/subscriptions');
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/subscriptions', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
			
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
			$this->getList();
			
		}
		
		protected function getList() {
			
			if (isset($this->request->get['filter_plan_id'])) {
				$filter_plan_id = $this->request->get['filter_plan_id'];
				} else {
				$filter_plan_id = '';
			}
			
			if (isset($this->request->get['filter_plan_name'])) {
				$filter_plan_name = $this->request->get['filter_plan_name'];
				} else {
				$filter_plan_name = '';
			}
			
			if (isset($this->request->get['filter_status_id'])) {
				$filter_status_id = $this->request->get['filter_status_id'];
				} else {
				$filter_status_id= '';
			}
			
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
				} else {
				$filter_status = '';
			}
			
			if (isset($this->request->get['filter_start_date_from'])) {
				$filter_start_date_from = $this->request->get['filter_start_date_from'];
				} else {
				$filter_start_date_from = '';
			}
			
			if (isset($this->request->get['filter_start_date_to'])) {
				$filter_start_date_to = $this->request->get['filter_start_date_to'];
				} else {
				$filter_start_date_to = '';
			}
			
			if (isset($this->request->get['filter_end_date_from'])) {
				$filter_end_date_from = $this->request->get['filter_end_date_from'];
				} else {
				$filter_end_date_from = '';
			}
			
			if (isset($this->request->get['filter_end_date_to'])) {
				$filter_end_date_to = $this->request->get['filter_end_date_to'];
				} else {
				$filter_end_date_to = '';
			}		
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			
			$url = '';
			
			
			if (isset($this->request->get['filter_plan_id'])) {
				$url .= '&filter_plan_id=' . urlencode(html_entity_decode($this->request->get['filter_plan_id'], ENT_QUOTES, 'UTF-8'));
			}
			if (isset($this->request->get['filter_plan_name'])) {
				$url .= '&filter_plan_name=' . urlencode(html_entity_decode($this->request->get['filter_plan_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_status_id'])) {
				$url .= '&filter_status_id=' . $this->request->get['filter_status_id'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_start_date_from'])) {
				$url .= '&filter_start_date_from=' . $this->request->get['filter_start_date_from'];
			}
			
			if (isset($this->request->get['filter_start_date_to'])) {
				$url .= '&filter_start_date_to=' . $this->request->get['filter_start_date_to'];
			}
			
			if (isset($this->request->get['filter_end_date_from'])) {
				$url .= '&filter_end_date_from=' . $this->request->get['filter_end_date_from'];
			}
			
			if (isset($this->request->get['filter_end_date_to'])) {
				$url .= '&filter_end_date_to=' . $this->request->get['filter_end_date_to'];
			}		
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			//Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-subscription";
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
			'href' => $this->url->link('account/purpletree_multivendor/subscriptions', '' . $url, true)
			);	
			$data['button_view']=$this->language->get('button_view');
			
			$data['subscription'] = array();
			
			$filter_data = array(
			'seller_id'              => $this->customer->getId(),
			'filter_plan_id'         => $filter_plan_id,
			'filter_plan_name'         => $filter_plan_name,
			'filter_status_id'       => $filter_status_id,
			'filter_status'          => $filter_status,
			'filter_start_date_from' => $filter_start_date_from,
			'filter_start_date_to'   => $filter_start_date_to,
			'filter_end_date_from'   => $filter_end_date_from,
			'filter_end_date_to'     => $filter_end_date_to,			
			'start'                  => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                  => $this->config->get('config_limit_admin')
			); 
			
			$subscription_total = $this->model_purpletree_multivendor_subscriptions->getTotalSubscription( $filter_data );
			
			$results = $this->model_purpletree_multivendor_subscriptions->getSubscription( $filter_data );
			$curency = $this->config->get('config_currency');
			$this->load->model('purpletree_multivendor/dashboard');
			$currency_detail = $this->model_purpletree_multivendor_dashboard->getCurrencySymbol($curency);			
			
			foreach ($results as $result) {
				
				if($this->config->get('module_purpletree_multivendor_multiple_subscription_plan_active')){	
					
					if($result['new_status']==1){
						$status=$this->language->get('text_yes');;
						}else{
						$status=$this->language->get('text_no');;
					}	
					
					} else {			
					if($result['status']==1){
						$status=$this->language->get('text_yes');;
						}else{
						$status=$this->language->get('text_no');;
					}	
					
					
				}
				
				$validity=$this->model_purpletree_multivendor_subscriptions->validity($result['plan_id']);
				
				$endDate=($result['end_date']=='0000-00-00 00:00:00')?date('d/m/Y',strtotime(' + '.$validity.' days',strtotime($result['start_date']))):date('d/m/Y',strtotime($result['end_date']));
				
				$data['subscription'][] = array(			   				
				'plan_name'          => $result['plan_name'],			
				'status'             => $status,
				'status_name'             => $result['status_name'],
				'start_date'         =>($result['start_date']!='0000-00-00 00:00:00')?date('d/m/Y',strtotime($result['start_date'])):'',
				'end_date'             => $endDate, 
				'created_date'             =>($result['created_date']!='0000-00-00 00:00:00')?date('d/m/Y',strtotime($result['created_date'])):'',				
				'view'           => $this->url->link('account/purpletree_multivendor/subscriptionplan/invoice', '' . 'invoice_id=' . $result['invoice_id'] , true)
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
			
			
			if (isset($this->request->get['filter_plan_id'])) {
				$url .= '&filter_plan_id=' . urlencode(html_entity_decode($this->request->get['filter_plan_id'], ENT_QUOTES, 'UTF-8'));
			}
			if (isset($this->request->get['filter_plan_name'])) {
				$url .= '&filter_plan_name=' . urlencode(html_entity_decode($this->request->get['filter_plan_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_status_id'])) {
				$url .= '&filter_status_id=' . $this->request->get['filter_status_id'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_start_date_from'])) {
				$url .= '&filter_start_date_from=' . $this->request->get['filter_start_date_from'];
			}
			
			if (isset($this->request->get['filter_start_date_to'])) {
				$url .= '&filter_start_date_to=' . $this->request->get['filter_start_date_to'];
			}
			
			if (isset($this->request->get['filter_end_date_from'])) {
				$url .= '&filter_end_date_from=' . $this->request->get['filter_end_date_from'];
			}
			
			if (isset($this->request->get['filter_end_date_to'])) {
				$url .= '&filter_end_date_to=' . $this->request->get['filter_end_date_to'];
			}		
			
			$pagination = new Pagination();
			$pagination->total = $subscription_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('account/purpletree_multivendor/subscriptions', '' . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($subscription_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($subscription_total - $this->config->get('config_limit_admin'))) ? $subscription_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $subscription_total, ceil($subscription_total / $this->config->get('config_limit_admin')));       	
			$data['heading_title'] = $this->language->get('heading_title');
			$data['column_plan_name'] = $this->language->get('column_plan_name');
			$data['column_active'] = $this->language->get('column_active');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_start_date'] = $this->language->get('column_start_date');
			$data['column_created_date'] = $this->language->get('column_created_date');
			$data['column_end_date'] = $this->language->get('column_end_date');
			$data['column_action'] = $this->language->get('column_action');
			$data['text_list'] = $this->language->get('text_list');
			$data['entry_plan_name'] = $this->language->get('entry_plan_name');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_start_date_from'] = $this->language->get('entry_start_date_from');
			$data['entry_start_date_to'] = $this->language->get('entry_start_date_to');
			$data['entry_end_date_from'] = $this->language->get('entry_end_date_from');
			$data['entry_end_date_to'] = $this->language->get('entry_end_date_to');
			$data['button_filter'] = $this->language->get('button_filter');		
			$data['filter_plan_name'] = $filter_plan_name;		
			$data['filter_status'] = $filter_status;
			$data['filter_start_date_from'] = $filter_start_date_from;	
			$data['filter_start_date_to'] = $filter_start_date_to;	
			$data['filter_end_date_from'] = $filter_end_date_from;	
			$data['filter_end_date_to'] = $filter_end_date_to;			
			$data['text_no_results'] = $this->language->get('text_no_results');	
			
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/moment.js'); 
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/bootstrap-datetimepicker.min.js'); 
			$this->document->addStyle('catalog/view/javascript/purpletree/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/subscriptions_list', $data));
		}
		public function autoplanname() {
			$json = array();
			
			if (isset($this->request->get['filter_plan_name'])) {
				$filter_plan_name = $this->request->get['filter_plan_name'];
				} else {
				$filter_plan_name = '';
			}
			$this->load->model('purpletree_multivendor/subscriptions');	
			
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$results = $this->model_purpletree_multivendor_subscriptions->getSubscriptionPlanName($filter_plan_name);
			foreach ($results as $result) {
				$json[] = array(
				'plan_id'       => $result['plan_id'],
				'plan_name'              => strip_tags(html_entity_decode($result['plan_name'], ENT_QUOTES, 'UTF-8'))	
				);
			}	
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function autoplanstatus() {
			$json = array();
			
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
				} else {
				$filter_status = '';
			}
			$this->load->model('purpletree_multivendor/subscriptions');		
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$results = $this->model_purpletree_multivendor_subscriptions->getSubscriptionPlanStatus($filter_status);
			foreach ($results as $result) {
				$json[] = array(
				'status_id'       => $result['status_id'],
				'status'              => strip_tags(html_entity_decode($result['status'], ENT_QUOTES, 'UTF-8'))	
				);
			}	
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}	
}	
?>