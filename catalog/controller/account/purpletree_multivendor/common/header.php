<?php
class ControllerAccountPurpletreeMultivendorCommonHeader extends Controller {
	public function index() {
		$data = array();
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}
		$data['heading_title1'] = $this->document->getTitle();
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['name'] = $this->config->get('config_name');

			if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
				$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
			} else {
				$data['logo'] = '';
			}
		$data['home'] = $this->url->link('common/home');	
		$this->load->language('extension/module/purpletree_sellerpanel');  
		$data['text_logout'] = $this->language->get('text_logout');	
		$this->load->language('purpletree_multivendor/header');  
		$data['text_sellerprofile'] 			= $this->language->get('text_sellerprofile');
		$data['text_store'] = $this->language->get('text_store');
		$this->load->language('account/ptsregister');
		$data['text_seller_panel'] 				= $this->language->get('text_seller_panel');
		$data['seller_logo'] = '/admin/view/image/logo.png';
		if($this->customer->isLogged() && $seller_store = $this->customer->isSeller()) {
			$this->load->model('purpletree_multivendor/vendor');
			$data['logged'] = 1;
			$seller = $this->model_purpletree_multivendor_vendor->getsellerInfo();
			//echo "<pre>";
			if($seller) {
				if(isset($seller['store_logo']) && $seller['store_logo'] != '') {
					//$data['seller_logo'] = 'image/'.$seller['store_logo'];
				}
				$data['firstname'] = '';
				if(isset($seller['firstname'])) {
					$data['firstname'] = $seller['firstname'];
				} 
				$data['lastname'] = '';
				if(isset($seller['lastname'])) {
					$data['lastname']  = $seller['lastname'];
				}
			//print_r($seller); die;
				$data['profile'] 			= $this->url->link('account/purpletree_multivendor/sellerstore', '', true);
				$data['storename']  = '';
			if(isset($seller['store_name'])) {
				$data['storename'] 				= $seller['store_name'];
			} 
			$data['storeurl'] = '';
			if(isset($seller['id'])) {
			$data['storeurl'] 				= $this->url->link('account/purpletree_multivendor/sellerstore/storeview&seller_store_id='.$seller["id"], '', true);
			}
			}
			
			
			$this->load->model('tool/image');
			$data['image'] = $this->model_tool_image->resize('catalog/no_image_seller.png', 40, 40);
				$data['sellerprofile'] 			= $this->url->link('account/edit', '', true);
				$data['currency'] = $this->load->controller('account/purpletree_multivendor/common/currency');
		}
		$data['logout'] 				= $this->url->link('account/logout', '', true);
			$data['dashboardpageurl'] 			= $this->url->link('account/purpletree_multivendor/dashboardicons', '', true);
			$data['language'] = $this->load->controller('account/purpletree_multivendor/common/language');
			$data['direction'] = $this->language->get('direction');
			$data['lang'] = $this->language->get('code');
			
			$data['stylespts'] = $this->document->getStyles();
			$data['scriptspts'] = $this->document->getScripts('header');
		
		return $this->load->view('account/purpletree_multivendor/header', $data);
	}
}