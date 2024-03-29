<?php
class ControllerExtensionModulePurpletreeSellerprice extends Controller {
		private $error = array();
		
		public function index() {
			if(!$this->config->get('purpletree_multivendor_seller_product_template')){
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
			}
			$this->load->language('extension/module/purpletree_sellerprice');
			$this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('setting/setting');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				
				$this->model_setting_setting->editSetting('purpletree_sellerprice', $this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_edit'] = $this->language->get('text_edit');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			
			$data['entry_status'] = $this->language->get('entry_status');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			
			///Help code///
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-module";
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
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/purpletree_sellerprice', 'token=' . $this->session->data['token'], true)
			);
			
			$data['action'] = $this->url->link('extension/module/purpletree_sellerprice', 'token=' . $this->session->data['token'], true);
			
			$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
			
			if (isset($this->request->post['purpletree_sellerprice_status'])) {
				$data['purpletree_sellerprice_status'] = $this->request->post['purpletree_sellerprice_status'];
				} else {
				$data['purpletree_sellerprice_status'] = $this->config->get('purpletree_sellerprice_status');
			}
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('extension/module/purpletree_sellerprice', $data));
		}
		
		protected function validate() {
			if (!$this->user->hasPermission('modify', 'extension/module/purpletree_sellerprice')) {
				
				$this->error['warning'] = $this->language->get('error_permission');
			}
			
			return !$this->error;
		}
}