<?php
class ControllerPurpletreeMultivendorSelleremail extends Controller {
		private $error = array();
		
		public function index() {		
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');				
			}
			
			$this->load->language('purpletree_multivendor/selleremail');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/selleremail');
			
			$this->getList();
		}
		
		public function resetTemplate() {
		    //echo "<pre>"; print_r($this->request->get); die;
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true));
			}
			$this->load->language('purpletree_multivendor/selleremail');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/selleremail');
			//echo "<pre>"; print_r($this->request->post); die;
			if (($this->request->server['REQUEST_METHOD'] == 'POST')  && $this->validateForm() ) {
				
				$this->model_purpletree_multivendor_selleremail->resetSelleremail($this->request->get['id']);
				
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
				
				$this->response->redirect($this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getForm();
			}
		public function edit() {
			if (!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true));
			}
			$this->load->language('purpletree_multivendor/selleremail');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/selleremail');
			//echo "<pre>"; print_r($this->request->post); die;
			if (($this->request->server['REQUEST_METHOD'] == 'POST')  && $this->validateForm() ) {
				
				$this->model_purpletree_multivendor_selleremail->editSelleremail($this->request->get['id'], $this->request->post);
				
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
				
				$this->response->redirect($this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getForm();
		}
		
		
		protected function getList() {
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			$url = '';
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$data['selleremails'] = array();
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-email";
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
			'href' => $this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true)
			);
			$filter_data = array(			
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
			);
			$results = $this->model_purpletree_multivendor_selleremail->getSelleremail($filter_data);
			$total_results = $this->model_purpletree_multivendor_selleremail->getTotalSelleremail($filter_data);
			foreach ($results as $result) {
				
				$data['selleremails'][] = array(
				 'title' => $result['title'],
				 'subject'        => $result['new_subject'],
				 'type'        => $result['type'],				
				  'edit'        => $this->url->link('purpletree_multivendor/selleremail/edit', 'token=' . $this->session->data['token'] . '&id=' . $result['id'] . $url, true)			
				 );
			 } 
			
			if (isset($this->error['warning'])) {
				 $data['error_warning'] = $this->error['warning'];
				}elseif (isset($this->session->data['error_warning'])) {
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
			
			$url = '';
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$url = '';
			$pagination = new Pagination();
			$pagination->total = $total_results;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($total_results) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_results - $this->config->get('config_limit_admin'))) ? $total_results : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_results, ceil($total_results / $this->config->get('config_limit_admin')));
			
			$data['column_email_type'] = $this->language->get('column_email_type');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_email_subject'] = $this->language->get('column_email_subject');
			$data['column_action'] = $this->language->get('column_action');
			$data['text_list'] = $this->language->get('text_list');
			$data['heading_title'] = $this->language->get('heading_title');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['text_no_results'] = $this->language->get('text_no_results');
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/selleremail_list', $data));
		}
		
		protected function getForm() {
		$data['text_form'] = $this->language->get('text_edit');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			
			
			if (isset($this->error['name'])) {
				$data['error_name'] = $this->error['name'];
				} else {
				$data['error_name'] = array();
			}
			
			
			
			if (isset($this->error['no_of_product'])) {
				$data['error_no_of_product'] = $this->error['no_of_product'];
				} else {
				$data['error_no_of_product'] = '';
			}
			
            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_description'] = $this->language->get('entry_description');
            $data['heading_title'] = $this->language->get('heading_title');
            $data['button_reset'] = $this->language->get('button_reset');
            $data['text_available_variables'] = $this->language->get('text_available_variables');
            $data['button_save'] = $this->language->get('button_save');
            $data['reset_warning'] = $this->language->get('reset_warning');
            $data['button_cancel'] = $this->language->get('button_cancel');
			
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-email";
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
			'href' => $this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true)
			);
			$this->load->language('purpletree_multivendor/selleremail');
			
			if (isset($this->request->get['id'])) {
				$data['action'] = $this->url->link('purpletree_multivendor/selleremail/edit', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, true);
				$data['action1'] = $this->url->link('purpletree_multivendor/selleremail/resetTemplate', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, true);
			}
			
			
			$data['cancel'] = $this->url->link('purpletree_multivendor/selleremail', 'token=' . $this->session->data['token'] . $url, true);
			
			
			$data['token'] = $this->session->data['token'];
			
			$this->load->model('localisation/language');
			
			$data['languages'] = $this->model_localisation_language->getLanguages();
			
			if (isset($this->request->post['email'])) {
				$data['email'] = $this->request->post['email'];
				} elseif (isset($this->request->get['id'])) {
				$data['email'] = $this->model_purpletree_multivendor_selleremail->getemail($this->request->get['id']);
				} else {
				$data['email'] = array();
			}			
			//echo "<pre>"; print_r($data['email']);	
			//die;
			
			$data['ver']=VERSION;
			if($data['ver']=='3.1.0.0_b'){
				$this->document->addScriptpts('view/javascript/ckeditor/ckeditor.js');
				$this->document->addScriptpts('view/javascript/ckeditor/adapters/jquery.js');
			}
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/selleremail_form', $data)); 
		}
		
		protected function validateForm() {
			/* foreach ($this->request->post['subscription'] as $language_id => $value) {
				if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
				
			}*/
			
			return !$this->error; 
		}		
}