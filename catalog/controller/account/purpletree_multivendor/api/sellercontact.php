<?php
class ControllerAccountPurpletreeMultivendorApiSellercontact extends Controller {
		private $error = array();
		
		protected function validatemessage() {
			if(!$this->customer->validateSeller()) {
				$this->error['error_warning'] = $this->language->get('error_license');
			}
			if ((utf8_strlen($this->request->post['customer_message']) < 10) || (utf8_strlen($this->request->post['customer_message']) > 3000)) {
				$this->error['customer_message'] = $this->language->get('error_enquiry');
			}
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');
				
				if ($captcha) {
					$this->error['captcha'] = $captcha;
				}
			}
			return !$this->error;
		}
		protected function validate() {
			if(!$this->customer->validateSeller()) {
				$this->error['error_warning'] = $this->language->get('error_license');
			}
			
			if (!isset($requestjson1['customer_name']) || (utf8_strlen($this->request->post['customer_name']) < 3) || (utf8_strlen($this->request->post['customer_name']) > 32)) {
				$this->error['customer_name'] = $this->language->get('error_name');
			}
			$EMAIL_REGEX='/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/';
			if (!isset($requestjson1['customer_email']) || preg_match($EMAIL_REGEX, $this->request->post['customer_email'])==false) {
				$this->error['customer_email'] = $this->language->get('error_email');
			}
			
			if (!isset($requestjson1['customer_message']) || (utf8_strlen($this->request->post['customer_message']) < 10) || (utf8_strlen($this->request->post['customer_message']) > 3000)) {
				$this->error['customer_message'] = $this->language->get('error_enquiry');
			}
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');
				
				if ($captcha) {
					$this->error['captcha'] = $captcha;
				}
			}
			
			return !$this->error;
		}
		public function customerContactlist(){
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('customer_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$this->load->model('purpletree_multivendor/sellercontact');
			$this->load->language('purpletree_multivendor/sellercontact');
			
			
			
			if($this->customer->isLogged()){
				
				if (isset($this->request->get['page'])) {
					$page = $this->request->get['page'];
					} else {
					$page = 1;
				}	
				
				if (isset($this->request->get['limit'])) {
					$limit = (int)$this->request->get['limit'];
					} else {
					$limit = 10;
				}
				$customer_id = $this->customer->getId();	
				
				$filter_data = array(
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit,
				'customer_id' 		=> $customer_id
				);
				$contact_total = $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomers122($filter_data);
				
				$results1 = $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomers1($filter_data); 
				
				$json['data']['sellercontacts'] = array();
				if(!empty($results1)) {
					foreach($results1 as $re) {
						$seller_id 	= $re['seller_id'];
						$customernnaaa = $this->model_purpletree_multivendor_sellercontact->getCustomer($seller_id);
						$results2 	= $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomerschat($customer_id,$seller_id);
						//$message = array();
						//$contact_from = array();
						if(!empty($results2)) {
							foreach($results2 as $result){
								$json['data']['sellercontacts'][$seller_id] = array(
								'id' 			 =>  $result['id'],
								'message' 		 =>  nl2br($result['customer_message']),
								'seller_id' 	 =>  $result['seller_id'],
								'customer_id' 	 =>  $customer_id,
								'contact_from' 	 =>  $result['contact_from'],
								'customer_name'  => $customernnaaa['firstname'].' '. $customernnaaa['lastname'],
								'customer_email'  => $customernnaaa['email'],
								'date_added' 	 => date($this->language->get('date_format_short'), strtotime($result['created_at']))							
								);
								$json['status'] = 'success';
								$json['message'] = '';
							}
						}
					}
				}
				
				$json['data']['config_contactseller']=$this->config->get('purpletree_multivendor_seller_contact');
				
			}
			$json['data']['pagination']['total'] = $contact_total;
			$json['data']['pagination']['page'] = $page;
			$json['data']['pagination']['limit'] = $limit;
			
			$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($contact_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($contact_total - $limit)) ? $contact_total : ((($page - 1) * $limit) + $limit), $contact_total, ceil($contact_total / $limit));
			
			
			if (isset($this->session->data['success'])) {
				$json['status'] = 'success';
				$json['message'] = $this->session->data['success'];
				return $json;
				
				unset($this->session->data['success']);
				} else {
				$json['message'] = '';
			}
			
			$json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		
		public function sellercontactlist(){
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_approved');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json)); 
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 
			$json['data']['contact_mode'] = $this->config->get('purpletree_multivendor_seller_contact');
			$this->load->model('purpletree_multivendor/sellercontact');
			$this->load->language('purpletree_multivendor/sellercontact');
			
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}	
			
			if (isset($this->request->get['limit'])) {
				$limit = (int)$this->request->get['limit'];
				} else {
				$limit = 10;
			}
			$seller_id = $this->customer->getId();
			
			
			$filter_data = array(
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit,
			'seller_id' 		=> $seller_id
			);
			
			$contact_total = $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomers1111($filter_data);
			$results1 = $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomers($filter_data);
			$json['data']['sellercontacts'] = array();
			if(!empty($results1)) {
				foreach($results1 as $re) {
					$custid 	= $re['customer_id'];
					$customernnaaa = $this->model_purpletree_multivendor_sellercontact->getCustomer($custid);
					$results2 	= $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomerschat($custid,$seller_id);
					$message = array();
					$contact_from = array();
					if(!empty($results2)) {
						foreach($results2 as $result){
							if($result['customer_id'] == '0') {
								$nameeee = "Guest";
								$emailll = "Guest";
								} else {
								$nameeee = $customernnaaa['firstname'].' '. $customernnaaa['lastname'];
								$emailll = $customernnaaa['email'];
							}
							$json['data']['sellercontacts'][] = array(
							'id' 			 =>  $result['id'],
							'message' 		 =>  nl2br($result['customer_message']),
							'customer_id' 	 =>  $result['customer_id'],
							'contact_from' 	 =>  $result['contact_from'],
							'customer_name'  =>  $nameeee,
							'customer_email'  => $emailll,
							'date_added' 	 => date($this->language->get('date_format_short'), strtotime($result['created_at']))							
							);
							
						}
					}
				}
			}
			$json['data']['config_contactseller']	=	$this->config->get('purpletree_multivendor_seller_contact');
			
			$json['data']['pagination']['total'] = $contact_total;
			$json['data']['pagination']['page'] = $page;
			$json['data']['pagination']['limit'] = $limit; 
			
			$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($contact_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($contact_total - $limit)) ? $contact_total : ((($page - 1) * $limit) + $limit), $contact_total, ceil($contact_total / $limit)); 
			
			
			if (isset($this->session->data['success'])) {
				$json['status'] = 'success';
				$json['message'] = $this->session->data['success'];
				unset($this->session->data['success']);
				} else {
				$json['message'] = '';
			}
			
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
			
		}
		
		
		public function reply() {
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_logged');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('seller_not_approved');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json)); 
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			//$data['customer_message'] = '';
			
			if ($this->customer->isLogged()) {
				$json['data']['loggedin'] = '1';
				} else {
				$json['data']['loggedin'] = '0';
			}
			
			$json['data']['contact_mode'] = $this->config->get('purpletree_multivendor_seller_contact');
			
			
			
			$this->load->language('purpletree_multivendor/sellercontact');		
			$this->load->model('purpletree_multivendor/sellercontact');
			
			
			if(!isset($this->request->get['id'])){
				$json['status'] = 'error';
				$json['message'] = $this->language->get('customer_id_not_set');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));		
			}
			$customerid = $this->model_purpletree_multivendor_sellercontact->getCustomerid($this->request->get['id']);
			$json['data']['customer_id'] = $customerid;
			$seller_id = $this->customer->getId();
			if($customerid == $seller_id) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_customer_id');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$json['data']['customer'] = $this->customer->getId();	
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatemessage()) {
				if(!$this->request->get['customer_id']) {			  
					$json['status'] = 'error';
					$json['message'] = $this->language->get('alert_customer_id');
					$this->response->addHeader('Content-Type: application/json');
					return $this->response->setOutput(json_encode($json));			 
				}
				$customerid = $this->request->post['customer_id'];
				$customer = $this->model_purpletree_multivendor_sellercontact->getCustomer($customerid);
				$selllleeerr = $this->model_purpletree_multivendor_sellercontact->getCustomer($seller_id);
				$dataa = array(
				'customer_id' 	 => $customerid,
				'seller_id'		 => $seller_id,
				'customer_name'  => $selllleeerr['firstname'].' '. $selllleeerr['lastname'],
				'customer_email'  => $selllleeerr['email'],
				'customer_message'  => $this->request->post['customer_message'],
				'contact_from'   => 1
				);
				$this->model_purpletree_multivendor_sellercontact->addContact($dataa);
				
				$ptsmv_current_page='';
				$message = $this->request->post['customer_message'];
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				$mail->setTo($customer['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($customer['firstname'], ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $customer['firstname']), ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($message);
				$mail->send();
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				//unset($this->session->data['ptsmv_current_page']);
				
				//$this->response->redirect($this->url->link('account/purpletree_multivendor/sellercontact/sellercontactlist'));
				} else {
				if (isset($this->request->post['customer_message'])) {
					$json['data']['customer_message'] = $this->request->post['customer_message'];
				} 
			}
			if (isset($this->session->data['success'])) {
				$json['status'] = 'success';
				$json['message'] = $this->session->data['success'];
				unset($this->session->data['success']);
			} 
			
			
			
			if (isset($this->error['customer_message'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['customer_message'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (isset($this->error['error_warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['error_warning'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			} 		
			
			$customer_detal=array();
			$json['data']['customer_id']=$customerid;
			$json['data']['sellercontacts'] = array();
			$results2 	= $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomerschat122($seller_id,$customerid);
			$message = array();
			$contact_from = array();
			$date_added = array();
			if(!empty($results2)) {
				foreach($results2 as $result){
					$json['data']['sellercontacts'][] = array(
					'contact_from'     => $result['contact_from'],
					'customer_id'     => $result['customer_id'],
					'customer_name'     => $result['customer_name'],
					'customer_email'     => $result['customer_email'],
					'customer_messages'       => nl2br($result['customer_message']),
					'date_added' => date($this->language->get('date_format_short'), strtotime($result['created_at'])),
					);
				}
			}		
			$json['status'] = 'success';
            $this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		public function customerReply() {
			
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}	
			if ($this->customer->isLogged()) {
				$json['data']['loggedin'] = '1';
				} else {
				$json['data']['loggedin'] = '0';
			}
			$json['data']['contact_mode'] = $this->config->get('purpletree_multivendor_seller_contact');
			
			if($this->config->get('purpletree_multivendor_seller_contact')==1){
				if (!$this->customer->isLogged()) {
					$json['status'] = 'error';
					$json['message'] = $this->language->get('seller_not_logged');
					$this->response->addHeader('Content-Type: application/json');
					return $this->response->setOutput(json_encode($json));
				}
			}
			$this->load->model('purpletree_multivendor/sellercontact');
			if(isset($this->request->get['seller_id'])) {
				$seller_id = $this->request->get['seller_id'];
				} elseif(isset($this->request->get['id'])) {
				$seller_id = $this->model_purpletree_multivendor_sellercontact->getSellerId($this->request->get['id']);
				} else {
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));	
			}
			$customerid = $this->customer->getId();
			if($customerid == $seller_id) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_seller_id');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$this->load->language('purpletree_multivendor/sellercontact');		
			
			//$data['id'] = $this->request->get['id'];	
			if (!$this->customer->isLogged()) {
				if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
					//$seller_id = $this->request->post['seller_id'];
					$sellerr = $this->model_purpletree_multivendor_sellercontact->getCustomer($seller_id);
					//$customerrr = $this->model_purpletree_multivendor_sellercontact->getCustomer($customerid);
					$dataa = array(
					'customer_id' 	 => $customerid,
					'seller_id'		 => $seller_id,
					'customer_name'  => $this->request->post['customer_name'],
					'customer_email'  => $this->request->post['customer_email'],
					'customer_message'  => $this->request->post['customer_message'],
					'contact_from'   => 0
					);
					$this->model_purpletree_multivendor_sellercontact->addContact($dataa);
					$ptsmv_current_page='';
					$message = $this->request->post['customer_message'];
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					
					$mail->setTo($sellerr['email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($sellerr['firstname'], ENT_QUOTES, 'UTF-8'));
					$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $sellerr['firstname']), ENT_QUOTES, 'UTF-8'));
					$mail->setHtml($message);
					$mail->send();
					
					$this->session->data['success'] = $this->language->get('text_success');
					
					} else {
					if (isset($this->request->post['customer_message'])) {
						$json['data']['customer_message'] = $this->request->post['customer_message'];
					} 
					if (isset($this->request->post['customer_name'])) {
						$json['data']['customer_name'] = $this->request->post['customer_name'];
					} 
					
					if (isset($this->request->post['customer_email'])) {
						$json['data']['customer_email'] = $this->request->post['customer_email'];
					} 
				}
				
				} else {
				if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatemessage()) {
					//$seller_id = $this->request->post['seller_id'];
					$sellerr = $this->model_purpletree_multivendor_sellercontact->getCustomer($seller_id);
					$customerrr = $this->model_purpletree_multivendor_sellercontact->getCustomer($customerid);
					$dataa = array(
					'customer_id' 	 => $customerid,
					'seller_id'		 => $seller_id,
					'customer_name'  => $customerrr['firstname'].' '. $customerrr['lastname'],
					'customer_email'  => $customerrr['email'],
					'customer_message'  => $this->request->post['customer_message'],
					'contact_from'   => 0
					);
					$this->model_purpletree_multivendor_sellercontact->addContact($dataa);
					$ptsmv_current_page='';
					$message = $this->request->post['customer_message'];
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					
					$mail->setTo($sellerr['email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($sellerr['firstname'], ENT_QUOTES, 'UTF-8'));
					$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $sellerr['firstname']), ENT_QUOTES, 'UTF-8'));
					$mail->setHtml($message);
					$mail->send();
					
					$this->session->data['success'] = $this->language->get('text_success');
					
					} else {
					if (isset($this->request->post['customer_message'])) {
						$json['data']['customer_message'] = $this->request->post['customer_message'];
					} 
				}
			}
			
			if (isset($this->session->data['success'])) {
				$json['status'] = 'success';
				$json['message'] = $this->session->data['success'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				
				unset($this->session->data['success']);
				} else {
				$json['message'] = '';
			}	
			
			
			if (isset($this->error['error_warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['error_warning'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			if (isset($this->error['customer_message'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['customer_message'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			if (isset($this->error['customer_name'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['customer_name'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['customer_email'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['customer_email'];
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			$json['data']['seller_id']=$seller_id;
			$json['data']['sellercontacts'] = array();
			if ($this->customer->isLogged()) {
				$customer_id = $customerid;
				$results2 	= $this->model_purpletree_multivendor_sellercontact->getSellerContactCustomerschat11($seller_id,$customer_id);
				$message = array();
				$contact_from = array();
				$date_added = array();
				if(!empty($results2)) {
					foreach($results2 as $result){
						$json['data']['sellercontacts'][] = array(
						'contact_from'     => $result['contact_from'],
						'customer_id'     => $result['customer_id'],
						'customer_name'     => $result['customer_name'],
						'customer_email'     => $result['customer_email'],
						'customer_messages'       =>  nl2br($result['customer_message']),
						'date_added' => date($this->language->get('date_format_short'), strtotime($result['created_at']))
						);
					}
				}
			}
			
			$json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
}