<?php
class ControllerExtensionPaymentPtsStripe extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/pts_stripe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

				if($this->request->post['pts_stripe_total_min']==''){
					$this->request->post['pts_stripe_total_min']=0;
				}
				if($this->request->post['pts_stripe_total_max']==''){
					$this->request->post['pts_stripe_total_max']=99999999;
				}
			$this->model_setting_setting->editSetting('pts_stripe', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}
					$data['heading_title'] = $this->language->get('heading_title');
			$data['text_extension'] = $this->language->get('text_extension');
			$data['text_success'] = $this->language->get('text_success');
			$data['text_authorization'] = $this->language->get('text_authorization');
			$data['text_sale'] = $this->language->get('text_sale');
			$data['entry_client_id'] = $this->language->get('entry_client_id');
			$data['entry_secret'] = $this->language->get('entry_secret');
			$data['text_edit'] = $this->language->get('text_edit');
			$data['text_payment_status'] = $this->language->get('text_payment_status');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_payment_payment_mode'] = $this->language->get('text_payment_payment_mode');
			$data['text_payment_secret_key_test'] = $this->language->get('text_payment_secret_key_test');
			$data['text_payment_publish_key_test'] = $this->language->get('text_payment_publish_key_test');
			$data['text_payment_client_id_test'] = $this->language->get('text_payment_client_id_test');
			$data['text_payment_client_id_live'] = $this->language->get('text_payment_client_id_live');
			$data['entry_total_min'] = $this->language->get('entry_total_min');
			$data['entry_total_max'] = $this->language->get('entry_total_max');
			$data['entry_email'] = $this->language->get('entry_email');
			$data['entry_test'] = $this->language->get('entry_test');
			$data['entry_transaction'] = $this->language->get('entry_transaction');
			$data['entry_debug'] = $this->language->get('entry_debug');
			$data['entry_canceled_reversal_status'] = $this->language->get('entry_canceled_reversal_status');
			$data['entry_completed_status'] = $this->language->get('entry_completed_status');
			$data['entry_denied_status'] = $this->language->get('entry_denied_status');
			$data['entry_expired_status'] = $this->language->get('entry_expired_status');
			$data['entry_failed_status'] = $this->language->get('entry_failed_status');
			$data['entry_pending_status'] = $this->language->get('entry_pending_status');
			$data['entry_processed_status'] = $this->language->get('entry_processed_status');
			$data['entry_refunded_status'] = $this->language->get('entry_refunded_status');
			$data['entry_reversed_status'] = $this->language->get('entry_reversed_status');
			$data['entry_voided_status'] = $this->language->get('entry_voided_status');
			$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_sort_order'] = $this->language->get('entry_sort_order');
			$data['tab_general'] = $this->language->get('tab_general');
			$data['tab_order_status'] = $this->language->get('tab_order_status');
			$data['help_test'] = $this->language->get('help_test');
			$data['help_debug'] = $this->language->get('help_debug');
			$data['help_total_min'] = $this->language->get('help_total_min');
			$data['text_payment_title'] = $this->language->get('text_payment_title');
			$data['error_permission'] = $this->language->get('error_permission');
			$data['text_payment_mode_test'] = $this->language->get('text_payment_mode_test');
			$data['text_payment_mode_live'] = $this->language->get('text_payment_mode_live');
			$data['text_payment_secret_key_live'] = $this->language->get('text_payment_secret_key_live');
			$data['text_payment_publish_key_live'] = $this->language->get('text_payment_publish_key_live');
			$data['error_payment_method_title'] = $this->language->get('error_payment_method_title');
			$data['error_payment_secret_key_test'] = $this->language->get('error_payment_secret_key_test');
			$data['error_payment_publish_key_test'] = $this->language->get('error_payment_publish_key_test');
			$data['error_payment_secret_key_live'] = $this->language->get('error_payment_secret_key_live');
			$data['error_payment_publish_key_live'] = $this->language->get('error_payment_publish_key_live');
			$data['error_payment_client_id_test'] = $this->language->get('error_payment_client_id_test');
			$data['error_payment_total_max_less'] = $this->language->get('error_payment_total_max_less');
			$data['error_payment_total_min_less'] = $this->language->get('error_payment_total_min_less');
			$data['error_payment_total_min_greter'] = $this->language->get('error_payment_total_min_greter');
			$data['error_payment_total_max_greter'] = $this->language->get('error_payment_total_max_greter');
			$data['text_all_zones'] = $this->language->get('text_all_zones');
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
			} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['error_payment_method_title'])) {
			$data['error_payment_method_title'] = $this->error['error_payment_method_title'];
		} else {
			$data['error_payment_method_title'] = '';
		}
		
		if (isset($this->error['error_e_secret_key'])) {
			$data['error_secret_key'] = $this->error['error_e_secret_key'];
		} else {
			$data['error_secret_key'] = '';
		}
		if (isset($this->error['error_payment_secret_key_test'])) {
			$data['error_payment_secret_key_test'] = $this->error['error_payment_secret_key_test'];
		} else {
			$data['error_payment_secret_key_test'] = '';
		}
		if (isset($this->error['error_payment_publish_key_test'])) {
			$data['error_payment_publish_key_test'] = $this->error['error_payment_publish_key_test'];
		} else {
			$data['error_payment_publish_key_test'] = '';
		}
		
		if (isset($this->error['error_payment_secret_key_live'])) {
			$data['error_payment_secret_key_live'] = $this->error['error_payment_secret_key_live'];
		} else {
			$data['error_payment_secret_key_live'] = '';
		}
		if (isset($this->error['error_payment_publish_key_live'])) {
			$data['error_payment_publish_key_live'] = $this->error['error_payment_publish_key_live'];
		} else {
			$data['error_payment_publish_key_live'] = '';
		}
		
		if (isset($this->error['error_payment_client_id_test'])) {
			$data['error_payment_client_id_test'] = $this->error['error_payment_client_id_test'];
		} else {
			$data['error_payment_client_id_test'] = '';
		}
		
		if (isset($this->error['error_payment_client_id_live'])) {
			$data['error_payment_client_id_live'] = $this->error['error_payment_client_id_live'];
		} else {
			$data['error_payment_client_id_live'] = '';
		}
		
		if (isset($this->error['error_payment_total_min'])) {
			$data['error_payment_total_min'] = $this->error['error_payment_total_min'];
		} else {
			$data['error_payment_total_min'] = '';
		}
		
		if (isset($this->error['error_payment_total_max'])) {
			$data['error_payment_total_max'] = $this->error['error_payment_total_max'];
		} else {
			$data['error_payment_total_max'] = '';
		}

		///Help code///	
		$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-payment";
		if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
		if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'view/image/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'view/image/help.png';}
		/// End Help code///
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/pp_adaptive', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/pts_stripe', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);
		//Payment Stripe text languge
		$data['text_payment_title']=$this->language->get('text_payment_title');


		if (isset($this->request->post['pts_stripe_status'])) {
			$data['pts_stripe_status'] = $this->request->post['pts_stripe_status'];
		} else {
			$data['pts_stripe_status'] = $this->config->get('pts_stripe_status');
		}
		if (isset($this->request->post['pts_stripe_title'])) {
			$data['pts_stripe_title'] = $this->request->post['pts_stripe_title'];
		} else {
			$data['pts_stripe_title'] ='Stripe';
			if($this->config->get('pts_stripe_title')!=NULL){
			$data['pts_stripe_title'] = $this->config->get('pts_stripe_title');
			}
		}
		if (isset($this->request->post['pts_stripe_payment_mode'])) {
			$data['pts_stripe_payment_mode'] = $this->request->post['pts_stripe_payment_mode'];
		} else {
			$data['pts_stripe_payment_mode'] = $this->config->get('pts_stripe_payment_mode');
		}

		if (isset($this->request->post['pts_stripe_secret_key_test'])) {
			$data['pts_stripe_secret_key_test'] = $this->request->post['pts_stripe_secret_key_test'];
		} else {
			$data['pts_stripe_secret_key_test'] = $this->config->get('pts_stripe_secret_key_test');
		}

		if (isset($this->request->post['pts_stripe_publish_key_test'])) {
			$data['pts_stripe_publish_key_test'] = $this->request->post['pts_stripe_publish_key_test'];
		} else {
			$data['pts_stripe_publish_key_test'] = $this->config->get('pts_stripe_publish_key_test');
		}

		if (isset($this->request->post['pts_stripe_secret_key_live'])) {
			$data['pts_stripe_secret_key_live'] = $this->request->post['pts_stripe_secret_key_live'];
		} else {
			$data['pts_stripe_secret_key_live'] = $this->config->get('pts_stripe_secret_key_live');
		}

		if (isset($this->request->post['pts_stripe_publish_key_live'])) {
			$data['pts_stripe_publish_key_live'] = $this->request->post['pts_stripe_publish_key_live'];
		} else {
			$data['pts_stripe_publish_key_live'] = $this->config->get('pts_stripe_publish_key_live');
		}
		
		if (isset($this->request->post['pts_stripe_client_id_test'])) {
			$data['pts_stripe_client_id_test'] = $this->request->post['pts_stripe_client_id_test'];
		} else {
			$data['pts_stripe_client_id_test'] = $this->config->get('pts_stripe_client_id_test');
		}
		if (isset($this->request->post['pts_stripe_client_id_live'])) {
			$data['pts_stripe_client_id_live'] = $this->request->post['pts_stripe_client_id_live'];
		} else {
			$data['pts_stripe_client_id_live'] = $this->config->get('pts_stripe_client_id_live');
		}
		
		if (isset($this->request->post['pts_stripe_total_min'])) {
			$data['pts_stripe_total_min'] = $this->request->post['pts_stripe_total_min'];
		} else {
			$data['pts_stripe_total_min'] ='0';
			if($this->config->get('pts_stripe_total_min')!=NULL){
			$data['pts_stripe_total_min'] = $this->config->get('pts_stripe_total_min');
			}
		}
		if (isset($this->request->post['pts_stripe_total_max'])) {
			$data['pts_stripe_total_max'] = $this->request->post['pts_stripe_total_max'];
		} else {
			$data['pts_stripe_total_max'] ='99999999';
			if($this->config->get('pts_stripe_total_max')!=NULL){
			$data['pts_stripe_total_max'] = $this->config->get('pts_stripe_total_max');
			}
		}

		if (isset($this->request->post['pts_stripe_debug'])) {
			$data['pts_stripe_debug'] = $this->request->post['pts_stripe_debug'];
		} else {
			$data['pts_stripe_debug'] = $this->config->get('pts_stripe_debug');
		}

		if (isset($this->request->post['pts_stripe_geo_zone_id'])) {
			$data['pts_stripe_geo_zone_id'] = $this->request->post['pts_stripe_geo_zone_id'];
		} else {
			$data['pts_stripe_geo_zone_id'] = $this->config->get('pts_stripe_geo_zone_id');
		}

		if (isset($this->request->post['pts_stripe_sort_order'])) {
			$data['pts_stripe_sort_order'] = $this->request->post['pts_stripe_sort_order'];
		} else {
			$data['pts_stripe_sort_order'] = $this->config->get('pts_stripe_sort_order');
		}

		if (isset($this->request->post['pts_stripe_completed_status_id'])) {
			$data['pts_stripe_completed_status_id'] = $this->request->post['pts_stripe_completed_status_id'];
		} else {
			$data['pts_stripe_completed_status_id'] = $this->config->get('pts_stripe_completed_status_id');
		}
		
		
		/* if (isset($this->request->post['pts_stripe_canceled_reversal_status_id'])) {
			$data['pts_stripe_canceled_reversal_status_id'] = $this->request->post['pts_stripe_canceled_reversal_status_id'];
		} else {
			$data['pts_stripe_canceled_reversal_status_id'] = $this->config->get('pts_stripe_canceled_reversal_status_id');
		} */

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['pp_adaptive_geo_zone_id'])) {
			$data['pp_adaptive_geo_zone_id'] = $this->request->post['pp_adaptive_geo_zone_id'];
		} else {
			$data['pp_adaptive_geo_zone_id'] = $this->config->get('pp_adaptive_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['pp_stripe_status'])) {
			$data['pp_stripe_status'] = $this->request->post['pp_stripe_status'];
		} else {
			$data['pp_stripe_status'] = $this->config->get('pp_stripe_status');
		}
		
		if (isset($this->request->post['pp_stripe_payment_mode'])) {
			$data['pp_stripe_payment_mode'] = $this->request->post['pp_stripe_payment_mode'];
		} else {
			$data['pp_stripe_payment_mode'] = $this->config->get('pp_stripe_payment_mode');
		}

		if (isset($this->request->post['pp_adaptive_sort_order'])) {
			$data['pp_adaptive_sort_order'] = $this->request->post['pp_adaptive_sort_order'];
		} else {
			$data['pp_adaptive_sort_order'] = $this->config->get('pp_adaptive_sort_order');
		}
/*  echo "<pre>";
 print_r($data);
 die;  */
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/pts_stripe', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/pp_adaptive')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['pts_stripe_title']) {
			$this->error['error_payment_method_title'] = $this->language->get('error_payment_method_title');
		}
		if (!$this->request->post['pts_stripe_payment_mode']) {
		if (!$this->request->post['pts_stripe_secret_key_test']) {
			$this->error['error_payment_secret_key_test'] =  $this->language->get('error_payment_secret_key_test');
		}
		
		if (!$this->request->post['pts_stripe_publish_key_test']) {
			$this->error['error_payment_publish_key_test'] =  $this->language->get('error_payment_publish_key_test');
		}
		if (!$this->request->post['pts_stripe_client_id_test']) {
			$this->error['error_payment_client_id_test'] =  $this->language->get('error_payment_client_id_test');
		}
		} else {
		if (!$this->request->post['pts_stripe_secret_key_live']) {
			$this->error['error_payment_secret_key_live'] =  $this->language->get('error_payment_secret_key_live');
		}
		if (!$this->request->post['pts_stripe_publish_key_live']) {
			$this->error['error_payment_publish_key_live'] =  $this->language->get('error_payment_publish_key_live');
		}
		
		if (!$this->request->post['pts_stripe_client_id_live']) {
			$this->error['error_payment_client_id_live'] =  $this->language->get('error_payment_client_id_live');
		}
		} 
/* 		if($this->request->post['pts_stripe_total_max']===''){
			$this->request->post['pts_stripe_total_max']=99999999;
		}
		
		if($this->request->post['pts_stripe_total_min']===''){
			$this->request->post['pts_stripe_total_min']=0;
		} */
		
		if ($this->request->post['pts_stripe_total_min'] < 0 and $this->request->post['pts_stripe_total_min'] !== ''){
			$this->error['error_payment_total_min'] =  $this->language->get('error_payment_total_min_less');
		}elseif($this->request->post['pts_stripe_total_min'] >= 0){
				$total_max=99999999;	
			if($this->request->post['pts_stripe_total_max']!==''){
				$total_max=(float)$this->request->post['pts_stripe_total_max'];	
			}

			if((float)$this->request->post['pts_stripe_total_min'] >= $total_max){
			$this->error['error_payment_total_min'] =  $this->language->get('error_payment_total_min_greter');
			}
		}
		
		if ($this->request->post['pts_stripe_total_max'] < 0 and $this->request->post['pts_stripe_total_max'] !== ''){
			$this->error['error_payment_total_max'] =  $this->language->get('error_payment_total_max_less');
		}elseif( $this->request->post['pts_stripe_total_max'] >= 0){
				$total_min=0;	
			if($this->request->post['pts_stripe_total_min']!==''){
				$total_min=(float)$this->request->post['pts_stripe_total_min'];	
			}
				$total_max=99999999;	
			if($this->request->post['pts_stripe_total_max']!==''){
				$total_max=(float)$this->request->post['pts_stripe_total_max'];	
			}
			if($total_max <= $total_min){
			$this->error['error_payment_total_max'] =  $this->language->get('error_payment_total_max_greter');
			}
		}

		return !$this->error;
	}
}
?>