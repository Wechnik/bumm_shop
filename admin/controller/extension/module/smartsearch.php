<?php
class ControllerExtensionModuleSmartsearch extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/smartsearch');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('smartsearch', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_index'] = $this->language->get('text_index');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_field'] = $this->language->get('entry_field');
		$data['entry_image_width'] = $this->language->get('entry_image_width');
		$data['entry_image_height'] = $this->language->get('entry_image_height');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_oldprice'] = $this->language->get('entry_oldprice');
		$data['entry_button_all'] = $this->language->get('entry_button_all');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_search_engine'] = $this->language->get('entry_search_engine');
		$data['entry_search_model'] = $this->language->get('entry_search_model');

		$data['help_field'] = $this->language->get('help_field');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_index'] = $this->language->get('button_index');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

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
			'href' => $this->url->link('extension/module/smartsearch', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/smartsearch', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['smartsearch_status'])) {
			$data['smartsearch_status'] = $this->request->post['smartsearch_status'];
		} else {
			$data['smartsearch_status'] = $this->config->get('smartsearch_status');
		}

		if (isset($this->request->post['smartsearch_field'])) {
			$data['smartsearch_field'] = $this->request->post['smartsearch_field'];
		} else {
			$data['smartsearch_field'] = $this->config->get('smartsearch_field');
		}

		if (isset($this->request->post['smartsearch_image'])) {
			$data['smartsearch_image'] = $this->request->post['smartsearch_image'];
		} else {
			$data['smartsearch_image'] = $this->config->get('smartsearch_image');
		}

		if (isset($this->request->post['smartsearch_image_width'])) {
			$data['smartsearch_image_width'] = $this->request->post['smartsearch_image_width'];
		} else {
			$data['smartsearch_image_width'] = $this->config->get('smartsearch_image_width');
		}

		if (isset($this->request->post['smartsearch_image_height'])) {
			$data['smartsearch_image_height'] = $this->request->post['smartsearch_image_height'];
		} else {
			$data['smartsearch_image_height'] = $this->config->get('smartsearch_image_height');
		}

		if (isset($this->request->post['smartsearch_model'])) {
			$data['smartsearch_model'] = $this->request->post['smartsearch_model'];
		} else {
			$data['smartsearch_model'] = $this->config->get('smartsearch_model');
		}

		if (isset($this->request->post['smartsearch_price'])) {
			$data['smartsearch_price'] = $this->request->post['smartsearch_price'];
		} else {
			$data['smartsearch_price'] = $this->config->get('smartsearch_price');
		}

		if (isset($this->request->post['smartsearch_oldprice'])) {
			$data['smartsearch_oldprice'] = $this->request->post['smartsearch_oldprice'];
		} else {
			$data['smartsearch_oldprice'] = $this->config->get('smartsearch_oldprice');
		}

		if (isset($this->request->post['smartsearch_button_all'])) {
			$data['smartsearch_button_all'] = $this->request->post['smartsearch_button_all'];
		} else {
			$data['smartsearch_button_all'] = $this->config->get('smartsearch_button_all');
		}

		if (isset($this->request->post['smartsearch_limit'])) {
			$data['smartsearch_limit'] = $this->request->post['smartsearch_limit'];
		} else {
			$data['smartsearch_limit'] = $this->config->get('smartsearch_limit');
		}

		if (isset($this->request->post['smartsearch_search_engine'])) {
			$data['smartsearch_search_engine'] = $this->request->post['smartsearch_search_engine'];
		} else {
			$data['smartsearch_search_engine'] = $this->config->get('smartsearch_search_engine');
		}

		if (isset($this->request->post['smartsearch_search_model'])) {
			$data['smartsearch_search_model'] = $this->request->post['smartsearch_search_model'];
		} else {
			$data['smartsearch_search_model'] = $this->config->get('smartsearch_search_model');
		}

		if ($this->config->get('config_secure')) {
			$data['http_catalog'] = HTTPS_CATALOG;
		} else {
			$data['http_catalog'] = HTTP_CATALOG;
		}
		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/smartsearch', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/smartsearch')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {

		$this->db->query("
			CREATE TABLE `" . DB_PREFIX . "search_index` (
				`product_id` INT(11) NOT NULL,
				`metaphone` varchar(128) NOT NULL,
				`weight` tinyint(4) NOT NULL,
				PRIMARY KEY (`product_id`,`metaphone`,`weight`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
		");


	}
	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "search_index`");
	}
}