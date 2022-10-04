<?php
class ControllerAccountPurpletreeMultivendorDownloads extends Controller {
		
		private $error = array();
		public function index() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/downloads', '', true);
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
			
			$this->load->language('purpletree_multivendor/downloads');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['heading_titlee'] = $this->language->get('heading_titlee');
			
			$this->load->model('purpletree_multivendor/downloads');
			
			
			
			$this->getList();
			
		}
		
		public function add() {
			
			if (!$this->customer->isLogged()) {
				
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/downloads', '', true);
				
				
				
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
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/downloads', '', true));
				
			}
			
			$this->load->language('purpletree_multivendor/downloads');
			
			
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['heading_titlee'] = $this->language->get('heading_titlee');
			
			$this->load->model('purpletree_multivendor/downloads');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				
				$this->model_purpletree_multivendor_downloads->addDownload($this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					
					$url .= '&sort=' . $this->request->get['sort'];
					
				}
								
				if (isset($this->request->get['order'])) {
					
					$url .= '&order=' . $this->request->get['order'];
					
				}
				
				if (isset($this->request->get['page'])) {
					
					$url .= '&page=' . $this->request->get['page'];
					
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/downloads',  $url, true));
				
			}
			
			
			$this->getForm();
			
		}
		
		
		public function edit() {
			if (!$this->customer->isLogged()) {
				$this->load->language('purpletree_multivendor/downloads');
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/downloads', '', true);
				
				
				$this->document->setTitle($this->language->get('heading_title'));
				
				$this->response->redirect($this->url->link('account/login', '', true));
				
			}
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$this->load->language('purpletree_multivendor/downloads');
			$this->load->model('purpletree_multivendor/downloads');
			
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
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/downloads', '', true));
				
			}
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				
				$this->model_purpletree_multivendor_downloads->editDownload($this->request->get['download_id'], $this->request->post);

				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					
					$url .= '&sort=' . $this->request->get['sort'];
					
				}
				
				if (isset($this->request->get['order'])) {
					
					$url .= '&order=' . $this->request->get['order'];
					
				}
				
				if (isset($this->request->get['page'])) {
					
					$url .= '&page=' . $this->request->get['page'];
					
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/downloads',  $url, true));
				
			}
			
			$this->getForm();
			
		}
		
		
		
		public function delete() {
			
			if (!$this->customer->isLogged()) {
				
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/downloads', '', true);
				
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
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/downloads', '', true));
				
			}
			
			$this->load->language('purpletree_multivendor/downloads');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$data['heading_titlee'] = $this->language->get('heading_titlee');
			
			$this->load->model('purpletree_multivendor/downloads');
			
			if (isset($this->request->post['selected']) && $this->validateDelete()) {
				
				foreach ($this->request->post['selected'] as $download_id) {
					
					$this->model_purpletree_multivendor_downloads->deleteDownload($download_id);
					
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					
					$url .= '&sort=' . $this->request->get['sort'];
					
				}
				
				if (isset($this->request->get['order'])) {
					
					$url .= '&order=' . $this->request->get['order'];
					
				}
				
				if (isset($this->request->get['page'])) {
					
					$url .= '&page=' . $this->request->get['page'];
					
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/downloads',  $url, true));
				
			}
			
			$this->getList();
			
		}
		
		protected function getList() {
			
			if (isset($this->request->get['sort'])) {
				
				$sort = $this->request->get['sort'];
				
				} else {
				
				$sort = 'dd.name';
				
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-product";
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
			
			'href' => $this->url->link('account/purpletree_multivendor/downloads',  $url, true)
			
			);
			
			$data['add'] = $this->url->link('account/purpletree_multivendor/downloads/add',  $url, true);
			
			$data['delete'] = $this->url->link('account/purpletree_multivendor/downloads/delete',  $url, true);
			
			
			
			$data['downloads'] = array();
			
			$filter_data = array(
			
			'sort'  => $sort,
			
			'order' => $order,
			
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			
			'limit' => $this->config->get('config_limit_admin')
			
			);
			$download_total = $this->model_purpletree_multivendor_downloads->getTotalDownloads();
			$results = $this->model_purpletree_multivendor_downloads->getDownloads($filter_data);
			foreach ($results as $result) {
				
				$data['downloads'][] = array(
				
				'download_id' => $result['download_id'],
				
				'name'        => $result['name'],
				
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				
				'edit'        => $this->url->link('account/purpletree_multivendor/downloads/edit',  '&download_id=' . $result['download_id'] . $url, true)
				
				);
				
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['heading_titlee'] = $this->language->get('heading_titlee');
			
			$data['text_list'] = $this->language->get('text_list');
			
			$data['text_no_results'] = $this->language->get('text_no_results');
			
			$data['text_confirm'] = $this->language->get('text_confirm');
			
			$data['column_name'] = $this->language->get('column_name');
			
			$data['column_date_added'] = $this->language->get('column_date_added');
			
			$data['column_action'] = $this->language->get('column_action');
			
			$data['button_add'] = $this->language->get('button_add');
			
			$data['button_edit'] = $this->language->get('button_edit');
			
			$data['button_delete'] = $this->language->get('button_delete');
			
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
			
			if (isset($this->request->post['selected'])) {
				
				$data['selected'] = (array)$this->request->post['selected'];
				
				} else {
				
				$data['selected'] = array();
				
			}
			
			$url = '';
			
			if ($order == 'ASC') {
				
				$url .= '&order=DESC';
				
				} else {
				
				$url .= '&order=ASC';
				
			}
			
			if (isset($this->request->get['page'])) {
				
				$url .= '&page=' . $this->request->get['page'];
				
			}
			
			$data['sort_name'] = $this->url->link('account/purpletree_multivendor/downloads',  'sort=dd.name' . $url, true);
			
			$data['sort_date_added'] = $this->url->link('account/purpletree_multivendor/downloads',  'sort=d.date_added' . $url, true);
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				
				$url .= '&sort=' . $this->request->get['sort'];
				
			}
			
			if (isset($this->request->get['order'])) {
				
				$url .= '&order=' . $this->request->get['order'];
				
			}
			
			$pagination = new Pagination();
			
			$pagination->total = $download_total;
			
			$pagination->page = $page;
			
			$pagination->limit = $this->config->get('config_limit_admin');
			
			$pagination->url = $this->url->link('account/purpletree_multivendor/downloads',  $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($download_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($download_total - $this->config->get('config_limit_admin'))) ? $download_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $download_total, ceil($download_total / $this->config->get('config_limit_admin')));
			
			
			$data['sort'] = $sort;
			
			$data['order'] = $order;
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/downloads_list', $data));
			
		}
		
		protected function getForm() {
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['heading_titlee'] = $this->language->get('heading_titlee');
			
			$data['text_form'] = !isset($this->request->get['download_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			
			$data['text_loading'] = $this->language->get('text_loading');
			
			$data['entry_name'] = $this->language->get('entry_name');
			
			$data['entry_filename'] = $this->language->get('entry_filename');
			
			$data['entry_mask'] = $this->language->get('entry_mask');
			
			$data['help_filename'] = $this->language->get('help_filename');
			
			$data['help_mask'] = $this->language->get('help_mask');
			
			$data['button_save'] = $this->language->get('button_save');
			
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			$data['button_upload'] = $this->language->get('button_upload');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} elseif (isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				
				unset($this->session->data['error_warning']);
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->error['name'])) {
				
				$data['error_name'] = $this->error['name'];
				
				} else {
				
				$data['error_name'] = array();
				
			}
			
			if (isset($this->error['filename'])) {
				
				$data['error_filename'] = $this->error['filename'];
				
				} else {
				
				$data['error_filename'] = '';
				
			}
			
			if (isset($this->error['mask'])) {
				
				$data['error_mask'] = $this->error['mask'];
				
				} else {
				
				$data['error_mask'] = '';
				
			}
			
			
			$url = '';
			
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-product";
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
			
			'href' => $this->url->link('account/purpletree_multivendor/downloads',  $url, true)
			
			);
			
			if (!isset($this->request->get['download_id'])) {
				
				$data['action'] = $this->url->link('account/purpletree_multivendor/downloads/add',  $url, true);
				
				} else {
				
				$data['action'] = $this->url->link('account/purpletree_multivendor/downloads/edit',  '&download_id=' . $this->request->get['download_id'] . $url, true);
				
			}
			
			$data['cancel'] = $this->url->link('account/purpletree_multivendor/downloads',  $url, true);
			
			$this->load->model('localisation/language');
			
			$data['languages'] = $this->model_localisation_language->getLanguages();
			
			if (isset($this->request->get['download_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				
				$download_info = $this->model_purpletree_multivendor_downloads->getDownload($this->request->get['download_id']);
				
			}
			
			if (isset($this->request->get['download_id'])) {
				
				$data['download_id'] = $this->request->get['download_id'];
				
				} else {
				
				$data['download_id'] = 0;
				
			}
			
			if (isset($this->request->post['download_description'])) {
				
				$data['download_description'] = $this->request->post['download_description'];
				
				} elseif (isset($this->request->get['download_id'])) {
				
				$data['download_description'] = $this->model_purpletree_multivendor_downloads->getDownloadDescriptions($this->request->get['download_id']);
				
				} else {
				
				$data['download_description'] = array();
				
			}			
			
			if (isset($this->request->post['filename'])) {
				
				$data['filename'] = $this->request->post['filename'];
				
				} elseif (!empty($download_info)) {
				
				$data['filename'] = $download_info['filename'];
				
				} else {
				
				$data['filename'] = '';
				
			}
			
			if (isset($this->request->post['mask'])) {
				
				$data['mask'] = $this->request->post['mask'];
				
				} elseif (!empty($download_info)) {
				
				$data['mask'] = $download_info['mask'];
				
				} else {
				
				$data['mask'] = '';
				
			}
			
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/downloads_form', $data));
			
		}
		
		protected function validateForm() {
			
			foreach ($this->request->post['download_description'] as $language_id => $value) {
				
				if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
					
					$this->error['name'][$language_id] = $this->language->get('error_name');
					
				}
				
			}
			
			if ((utf8_strlen($this->request->post['filename']) < 3) || (utf8_strlen($this->request->post['filename']) > 128)) {
				
				$this->error['filename'] = $this->language->get('error_filename');
				
			}
			
			if (!is_file(DIR_DOWNLOAD . $this->request->post['filename'])) {
				
				$this->error['filename'] = $this->language->get('error_exists');
				
			}
			
			if ((utf8_strlen($this->request->post['mask']) < 3) || (utf8_strlen($this->request->post['mask']) > 128)) {
				
				$this->error['mask'] = $this->language->get('error_mask');
				
			}
			
			return !$this->error;
			
		}
		
		protected function validateDelete() {
			
			$this->load->model('purpletree_multivendor/downloads');
			
			foreach ($this->request->post['selected'] as $download_id) {
				
				$product_total = $this->model_purpletree_multivendor_downloads->getTotalProductsByDownloadId($download_id);
				
				if ($product_total) {
					
					$this->error['warning'] = sprintf($this->language->get('error_product'), $product_total);
					
				}
				
			}
			
			return !$this->error;
			
		}
		
		public function upload() {
			
			$this->load->language('purpletree_multivendor/downloads');
			
			$json = array();
			if (!$json) {
				
				if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
					
					// Sanitize the filename
					
					$filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));
					
					
					
					// Validate the filename length
					
					if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
						
						$json['error'] = $this->language->get('error_filename');
						
					}
					
					// Allowed file extension types
					
					$allowed = array();
					
					$extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_ext_allowed'));
					
					$filetypes = explode("\n", $extension_allowed);
					foreach ($filetypes as $filetype) {
						
						$allowed[] = trim($filetype);
						
					}
					
					if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
						
						$json['error'] = $this->language->get('error_filetype');
						
					}
					
					// Allowed file mime types
					
					$allowed = array();
					
					$mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));
					
					$filetypes = explode("\n", $mime_allowed);
					
					foreach ($filetypes as $filetype) {
						
						$allowed[] = trim($filetype);
						
					}
					
					if (!in_array($this->request->files['file']['type'], $allowed)) {
						
						$json['error'] = $this->language->get('error_filetype');
						
					}
					
					// Check to see if any PHP files are trying to be uploaded
					
					$content = file_get_contents($this->request->files['file']['tmp_name']);
					
					
					
					if (preg_match('/\<\?php/i', $content)) {
						
						$json['error'] = $this->language->get('error_filetype');
						
					}
					
					// Return any upload error
					
					if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
						
						$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
						
					}
					
					} else {
					
					$json['error'] = $this->language->get('error_upload');
					
				}
				
			}
			
			if (!$json) {
				
				$file = $filename . '.' . token(32);
				
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
				
				$json['filename'] = $file;
				
				$json['mask'] = $filename;
				
				$json['success'] = $this->language->get('text_upload');
				
			}
			
			$this->response->addHeader('Content-Type: application/json');
			
			$this->response->setOutput(json_encode($json));
			
		}
		
		public function autocomplete() {
			
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				
				$this->load->model('purpletree_multivendor/downloads');
				
				$filter_data = array(
				
				'filter_name' => $this->request->get['filter_name'],
				
				'start'       => 0,
				
				'limit'       => 5
				
				);
				
				$results = $this->model_purpletree_multivendor_downloads->getDownloads($filter_data);
				
				
				
				foreach ($results as $result) {
					
					$json[] = array(
					
					'download_id' => $result['download_id'],
					
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					
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