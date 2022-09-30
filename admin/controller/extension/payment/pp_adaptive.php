<?php
class ControllerExtensionPaymentPPAdaptive extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/pp_adaptive');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('pp_adaptive', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_authorization'] = $this->language->get('text_authorization');
		$data['text_sale'] = $this->language->get('text_sale');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_test'] = $this->language->get('entry_test');
		$data['entry_transaction'] = $this->language->get('entry_transaction');
		$data['entry_debug'] = $this->language->get('entry_debug');
		$data['entry_total'] = $this->language->get('entry_total');
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
		$data['entry_secret'] = $this->language->get('entry_secret');
		$data['entry_client_id'] = $this->language->get('entry_client_id');

		$data['help_test'] = $this->language->get('help_test');
		$data['help_debug'] = $this->language->get('help_debug');
		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_order_status'] = $this->language->get('tab_order_status');
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}
		
		if (isset($this->error['error_e_secret_key'])) {
			$data['error_secret_key'] = $this->error['error_e_secret_key'];
		} else {
			$data['error_secret_key'] = '';
		}
		if (isset($this->error['error_e_client_id'])) {
			$data['error_client_id'] = $this->error['error_e_client_id'];
		} else {
			$data['error_client_id'] = '';
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
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/pp_adaptive', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/pp_adaptive', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);

		if (isset($this->request->post['pp_adaptive_email'])) {
			$data['pp_adaptive_email'] = $this->request->post['pp_adaptive_email'];
		} else {
			$data['pp_adaptive_email'] = $this->config->get('pp_adaptive_email');
		}
		if (isset($this->request->post['pp_adaptive_client_id'])) {
			$data['pp_adaptive_client_id'] = $this->request->post['pp_adaptive_client_id'];
		} else {
			$data['pp_adaptive_client_id'] = $this->config->get('pp_adaptive_client_id');
		}
		if (isset($this->request->post['pp_adaptive_admin_secret'])) {
			$data['pp_adaptive_admin_secret'] = $this->request->post['pp_adaptive_admin_secret'];
		} else {
			$data['pp_adaptive_admin_secret'] = $this->config->get('pp_adaptive_admin_secret');
		}

		if (isset($this->request->post['pp_adaptive_test'])) {
			$data['pp_adaptive_test'] = $this->request->post['pp_adaptive_test'];
		} else {
			$data['pp_adaptive_test'] = $this->config->get('pp_adaptive_test');
		}

		if (isset($this->request->post['pp_adaptive_transaction'])) {
			$data['pp_adaptive_transaction'] = $this->request->post['pp_adaptive_transaction'];
		} else {
			$data['pp_adaptive_transaction'] = $this->config->get('pp_adaptive_transaction');
		}

		if (isset($this->request->post['pp_adaptive_debug'])) {
			$data['pp_adaptive_debug'] = $this->request->post['pp_adaptive_debug'];
		} else {
			$data['pp_adaptive_debug'] = $this->config->get('pp_adaptive_debug');
		}

		if (isset($this->request->post['pp_adaptive_total'])) {
			$data['pp_adaptive_total'] = $this->request->post['pp_adaptive_total'];
		} else {
			$data['pp_adaptive_total'] = $this->config->get('pp_adaptive_total');
		}

		if (isset($this->request->post['pp_adaptive_canceled_reversal_status_id'])) {
			$data['pp_adaptive_canceled_reversal_status_id'] = $this->request->post['pp_adaptive_canceled_reversal_status_id'];
		} else {
			$data['pp_adaptive_canceled_reversal_status_id'] = $this->config->get('pp_adaptive_canceled_reversal_status_id');
		}

		if (isset($this->request->post['pp_adaptive_completed_status_id'])) {
			$data['pp_adaptive_completed_status_id'] = $this->request->post['pp_adaptive_completed_status_id'];
		} else {
			$data['pp_adaptive_completed_status_id'] = $this->config->get('pp_adaptive_completed_status_id');
		}

		if (isset($this->request->post['pp_adaptive_denied_status_id'])) {
			$data['pp_adaptive_denied_status_id'] = $this->request->post['pp_adaptive_denied_status_id'];
		} else {
			$data['pp_adaptive_denied_status_id'] = $this->config->get('pp_adaptive_denied_status_id');
		}

		if (isset($this->request->post['pp_adaptive_expired_status_id'])) {
			$data['pp_adaptive_expired_status_id'] = $this->request->post['pp_adaptive_expired_status_id'];
		} else {
			$data['pp_adaptive_expired_status_id'] = $this->config->get('pp_adaptive_expired_status_id');
		}

		if (isset($this->request->post['pp_adaptive_failed_status_id'])) {
			$data['pp_adaptive_failed_status_id'] = $this->request->post['pp_adaptive_failed_status_id'];
		} else {
			$data['pp_adaptive_failed_status_id'] = $this->config->get('pp_adaptive_failed_status_id');
		}

		if (isset($this->request->post['pp_adaptive_pending_status_id'])) {
			$data['pp_adaptive_pending_status_id'] = $this->request->post['pp_adaptive_pending_status_id'];
		} else {
			$data['pp_adaptive_pending_status_id'] = $this->config->get('pp_adaptive_pending_status_id');
		}

		if (isset($this->request->post['pp_adaptive_processed_status_id'])) {
			$data['pp_adaptive_processed_status_id'] = $this->request->post['pp_adaptive_processed_status_id'];
		} else {
			$data['pp_adaptive_processed_status_id'] = $this->config->get('pp_adaptive_processed_status_id');
		}

		if (isset($this->request->post['pp_adaptive_refunded_status_id'])) {
			$data['pp_adaptive_refunded_status_id'] = $this->request->post['pp_adaptive_refunded_status_id'];
		} else {
			$data['pp_adaptive_refunded_status_id'] = $this->config->get('pp_adaptive_refunded_status_id');
		}

		if (isset($this->request->post['pp_adaptive_reversed_status_id'])) {
			$data['pp_adaptive_reversed_status_id'] = $this->request->post['pp_adaptive_reversed_status_id'];
		} else {
			$data['pp_adaptive_reversed_status_id'] = $this->config->get('pp_adaptive_reversed_status_id');
		}

		if (isset($this->request->post['pp_adaptive_voided_status_id'])) {
			$data['pp_adaptive_voided_status_id'] = $this->request->post['pp_adaptive_voided_status_id'];
		} else {
			$data['pp_adaptive_voided_status_id'] = $this->config->get('pp_adaptive_voided_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['pp_adaptive_geo_zone_id'])) {
			$data['pp_adaptive_geo_zone_id'] = $this->request->post['pp_adaptive_geo_zone_id'];
		} else {
			$data['pp_adaptive_geo_zone_id'] = $this->config->get('pp_adaptive_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['pp_adaptive_status'])) {
			$data['pp_adaptive_status'] = $this->request->post['pp_adaptive_status'];
		} else {
			$data['pp_adaptive_status'] = $this->config->get('pp_adaptive_status');
		}

		if (isset($this->request->post['pp_adaptive_sort_order'])) {
			$data['pp_adaptive_sort_order'] = $this->request->post['pp_adaptive_sort_order'];
		} else {
			$data['pp_adaptive_sort_order'] = $this->config->get('pp_adaptive_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/pp_adaptive', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/pp_adaptive')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['pp_adaptive_email']) {
			$this->error['email'] = $this->language->get('error_email');
		}
		if (!$this->request->post['pp_adaptive_client_id']) {
			$this->error['error_e_client_id'] =  $this->language->get('error_error_client_id');
		}
		if (!$this->request->post['pp_adaptive_admin_secret']) {
			$this->error['error_e_secret_key'] = $this->language->get('error_error_secret_key');
		}

		return !$this->error;
	}
}
?>