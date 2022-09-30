<?php
class ControllerAccountPurpletreeMultivendorApiSellerstore extends Controller{
		private $error = array(); 
		
		public function index(){
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
			$this->load->language('purpletree_multivendor/sellerstore');
			$store_id = (isset($store_detail['id'])?$store_detail['id']:'');
			$this->load->model('purpletree_multivendor/vendor');
			
			$store_detail = $this->customer->isSeller();
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$path = 'admin/ptsseller/';
				$file = "";
				if (!is_dir($path)) {
					@mkdir($path, 0777);
				}
				if(is_dir($path)){
					
					$allowed_file=array('gif','png','jpg','pdf','doc','docx','zip');
					$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($_FILES['upload_file']['name'], ENT_QUOTES, 'UTF-8')));
                    $extension = pathinfo($filename, PATHINFO_EXTENSION);
                    if($filename != '') {
                        if(in_array($extension,$allowed_file) ) {
                            $file = md5(mt_rand()).'-'.$filename;
                            $directory  = $path;
							
                            move_uploaded_file($_FILES['upload_file']['tmp_name'], $directory.'/'.$file);
						}     
					}				
					
				}
				
				$this->model_purpletree_multivendor_vendor->editStore($store_id, $this->request->post,$file);
				
				$this->session->data['success'] = $this->language->get('text_success');
				$json['status'] = 'success';
				$json['message'] =  $this->language->get('text_success');
			}
			
			if (isset($store_id)) {
				$json['data']['store_id'] = $store_id;
				} else {
				$json['data']['store_id'] = 0;
			}
			
			if (isset($this->error['warning'])) {
				$json['message'] = $this->error['warning'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->session->data['success'])) {
				$json['message'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_name'])) {
				$json['message'] = $this->error['store_name'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			} 
			
			if (isset($this->error['store_seo'])) {
				$json['message'] = $this->error['store_seo'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			if (isset($this->error['error_file_upload'])) {
				$json['message'] = $this->error['error_file_upload'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_email'])) {
				$json['message'] = $this->error['store_email'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_phone'])) {
				$json['message'] = $this->error['store_phone'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			if (isset($this->error['store_description'])) {			
				$json['message'] = $this->error['store_description'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_address'])) {
				$json['message'] = $this->error['store_address'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_city'])) {
				$json['message'] = $this->error['store_city'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_country'])) {
				$json['message'] = $this->error['store_country'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['error_storezone'])) {
				$json['message'] = $this->error['error_storezone'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_zipcode'])) {
				$json['message'] = $this->error['store_zipcode'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_shipping'])) {
				$json['message'] = $this->error['store_shipping'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_return'])) {
				$json['message'] = $this->error['store_return'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_meta_keywords'])) {
				$json['message'] = $this->error['store_meta_keywords'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_meta_description'])) {
				$json['message'] = $this->error['store_meta_description'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_bank_details'])) {
				$json['message'] = $this->error['store_bank_details'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_tin'])) {
				$json['message'] = $this->error['store_tin'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['store_shipping_charge'])) {
				$json['message'] = $this->error['store_shipping_charge'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			
			
			if (isset($store_id) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$seller_info = $this->model_purpletree_multivendor_vendor->getStore($store_id);
			}
			
			if (!empty($seller_info)) {
				$json['data']['seller_id'] = $seller_info['seller_id'];
				} else {
				$json['data']['seller_id'] = $this->customer->getId();
			}
			
			if (isset($this->request->post['seller_name'])) { 
				$json['data']['seller_name'] = $this->request->post['seller_name'];
				} elseif (!empty($seller_info)) { 
				$json['data']['seller_name'] = $seller_info['seller_name'];
			}			
			
			if (isset($this->request->post['store_seo'])) { 
				$json['data']['store_seo'] = $this->request->post['store_seo'];
				} elseif (!empty($seller_info)) { 
				$json['data']['store_seo'] = $seller_info['store_seo'];
			} 
			
			if (isset($this->request->post['store_name'])) {
				$json['data']['store_name'] = $this->request->post['store_name'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_name'] = $seller_info['store_name'];
			} 
			
			
			if (isset($this->request->post['store_email'])) {
				$json['data']['store_email'] = $this->request->post['store_email'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_email'] = $seller_info['store_email'];
			} 
			
			if (isset($this->request->post['store_phone'])) {
				$json['data']['store_phone'] = $this->request->post['store_phone'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_phone'] = $seller_info['store_phone'];
			} 
			
			if (isset($this->request->post['store_description'])) {
				$json['data']['store_description'] = $this->request->post['store_description'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_description'] = $seller_info['store_description'];
			} 
			
			if (isset($this->request->post['store_address'])) {
				$json['data']['store_address'] = $this->request->post['store_address'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_address'] = $seller_info['store_address'];
			} 
			
			if (isset($this->request->post['store_country'])) {
				$json['data']['store_country'] = $this->request->post['store_country'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_country'] = $seller_info['store_country'];
			}
			
			if (isset($this->request->post['store_state'])) {
				$json['data']['store_state'] = $this->request->post['store_state'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_state'] = $seller_info['store_state'];
			} 
			
			if (isset($this->request->post['store_city'])) {
				$json['data']['store_city'] = $this->request->post['store_city'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_city'] = $seller_info['store_city'];
			} 
			
			if (isset($this->request->post['store_zipcode'])) {
				$json['data']['store_zipcode'] = $this->request->post['store_zipcode'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_zipcode'] = $seller_info['store_zipcode'];
			} 
			
			if (isset($this->request->post['store_shipping_policy'])) {
				$json['data']['store_shipping_policy'] = $this->request->post['store_shipping_policy'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_shipping_policy'] = $seller_info['store_shipping_policy'];
			} 
			
			if (isset($this->request->post['store_return_policy'])) {
				$json['data']['store_return_policy'] = $this->request->post['store_return_policy'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_return_policy'] = $seller_info['store_return_policy'];
			} 
			
			if (isset($this->request->post['store_meta_keywords'])) {
				$json['data']['store_meta_keywords'] = $this->request->post['store_meta_keywords'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_meta_keywords'] = $seller_info['store_meta_keywords'];
			} 
			
			if (isset($this->request->post['store_meta_description'])) {
				$json['data']['store_meta_description'] = $this->request->post['store_meta_description'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_meta_description'] = $seller_info['store_meta_descriptions'];
			} 
			
			if (isset($this->request->post['store_bank_details'])) {
				$json['data']['store_bank_details'] = $this->request->post['store_bank_details'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_bank_details'] = $seller_info['store_bank_details'];
			} 
			
			if (isset($this->request->post['store_tin'])) {
				$json['data']['store_tin'] = $this->request->post['store_tin'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_tin'] = $seller_info['store_tin'];
			} 
			
			if (isset($this->request->post['store_shipping_type'])) {
				$json['data']['store_shipping_type'] = $this->request->post['store_shipping_type'];
				} elseif (!empty($seller_info) && isset($seller_info['store_shipping_type'])) {
				$json['data']['store_shipping_type'] = $seller_info['store_shipping_type'];
				} else {
				$json['data']['store_shipping_type'] = 'pts_flat_rate_shipping';
			}	
			if (isset($this->request->post['store_shipping_order_type'])) {
				$json['data']['store_shipping_order_type'] = $this->request->post['store_shipping_order_type'];
				} elseif (!empty($seller_info) && isset($seller_info['store_shipping_order_type'])) {
				$json['data']['store_shipping_order_type'] = $seller_info['store_shipping_order_type'];
				} else {
				$json['data']['store_shipping_order_type'] = 'pts_product_wise';
			}				
			
			if (isset($this->request->post['store_shipping_charge'])) {
				$json['data']['store_shipping_charge'] = $this->request->post['store_shipping_charge'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_shipping_charge'] = $seller_info['store_shipping_charge'];
			} 
			
			if (isset($this->request->post['store_status'])) {
				$json['data']['store_status'] = $this->request->post['store_status'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_status'] = $seller_info['store_status'];
			} 
			
			if (isset($this->request->post['store_logo'])) {
				$json['data']['store_logo'] = $this->request->post['store_logo'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_logo'] = $seller_info['store_logo'];
			} 
			if (isset($this->request->post['store_live_chat_enable'])) { 
				$json['data']['store_live_chat_enable'] = $this->request->post['store_live_chat_enable'];
				} elseif (!empty($seller_info)) { 
				$json['data']['store_live_chat_enable'] = $seller_info['store_live_chat_enable'];
				} else { 
				$json['data']['store_live_chat_enable'] = 0;
			}
			if (isset($this->request->post['store_live_chat_code'])) { 
				$json['data']['store_live_chat_code'] = $this->request->post['store_live_chat_code'];
				} elseif (!empty($seller_info)) { 
				$json['data']['store_live_chat_code'] = $seller_info['store_live_chat_code'];	
			} 	
			
			$this->load->model('tool/image');
			
			if (isset($this->request->post['store_logo']) && is_file(DIR_IMAGE . $this->request->post['store_logo'])) {
				$json['data']['thumb'] = $this->model_tool_image->resize($this->request->post['store_logo'], 100, 100);
				} elseif (!empty($seller_info) && is_file(DIR_IMAGE . $seller_info['store_logo'])) {
				$json['data']['thumb'] = $this->model_tool_image->resize($seller_info['store_logo'], 100, 100);
				} else {
				$json['data']['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			if (isset($this->request->post['store_banner'])) {
				$json['data']['store_banner'] = $this->request->post['store_banner'];
				} elseif (!empty($seller_info)) {
				$json['data']['store_banner'] = $seller_info['store_banner'];
			} 
			
			$this->load->model('tool/image');
			
			if (isset($this->request->post['store_banner']) && is_file(DIR_IMAGE . $this->request->post['store_banner'])) {
				$json['data']['banner_thumb'] = $this->model_tool_image->resize($this->request->post['store_banner'], 100, 100);
				} elseif (!empty($seller_info) && is_file(DIR_IMAGE . $seller_info['store_banner'])) {
				$json['data']['banner_thumb'] = $this->model_tool_image->resize($seller_info['store_banner'], 100, 100);
				} else {
				$json['data']['banner_thumb'] = $this->model_tool_image->resize('catalog/purpletree_banner.jpg', 100, 100);
			}
			
			$json['data']['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			
			$this->load->model('localisation/country');
			
			$json['data']['countries'] = $this->model_localisation_country->getCountries();
			
			
			
			// Start download document file of store
			//$data['upload_file'] = $seller_info['document'];
			/**Start Document upload of became seller **/ 
			if(!empty($seller_info['document'])){
				$json['data']['upload_file_existing'] = $seller_info['document'];
				$json['data']['upload_file_existing_href'] = "admin/ptsseller/".$seller_info['document'];
			}      	
			// End download document file of store
			$json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		public function downloadAttachment()
		{
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
			$file="ptsseller/".$this->request->get["document"]; //file location 
			
			if(file_exists($file)) {
				
				header('Content-Description: File Transfer');
				header('Content-Type: application/octet-stream');
				header('Content-Disposition: attachment; filename='.basename($file));
				header('Content-Transfer-Encoding: binary');
				header('Expires: 0');
				header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
				header('Pragma: public');
				
				header('Content-Length: ' . filesize($file));
				ob_clean();
				flush();
				readfile($file);
				exit();
			}
		}	
		
		public function becomeseller(){
			if (!$this->customer->isMobileApiCall()) {
				$json['message'] = $this->language->get('error_permission');
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$this->load->language('purpletree_multivendor/sellerstore');
			
			$this->load->model('purpletree_multivendor/vendor');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateSeller()) {
				
				$file ='';
				$store_id = $this->model_purpletree_multivendor_vendor->becomeSeller($this->customer->getId(), $this->request->post,$file);
				////Start seller mail////getCustomer
				$this->load->model('account/customer'); 
				$this->load->model('account/customer_group'); 
				$datacust = $this->model_account_customer->getCustomer($this->customer->getId());				
				
				$this->load->language('mail/customer');
				$this->load->language('account/ptsregister');
				if (isset($datacust['customer_group_id'])) {
					$customer_group_id = $datacust['customer_group_id'];
					} else {
					$customer_group_id = $this->config->get('config_customer_group_id');
				}
                $customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);
				$subject = sprintf($this->language->get('text_subject_seller'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
				
				$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";
				
				if($this->config->get('purpletree_multivendor_seller_approval') == 1){
					$message .= $this->language->get('text_admin') . "\n\n";
				}
				if (!$customer_group_info['approval']) {
					$message .= $this->language->get('text_login') . "\n";
					} else {
					$message .= $this->language->get('text_approval') . "\n";
				}
				
				
				$message .= $this->url->link('account/login', '', true) . "\n\n";
				$message .= $this->language->get('text_thanks') . "\n";
				$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
				
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				$mail->setTo($datacust['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
				$mail->setSubject($subject);
				$mail->setText($message);
				$mail->send();
				////End Seller Mail////
				
				////Start Admin Mail////
				if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
					$message  = $this->language->get('text_signup_seller') . "\n\n";
					$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
					$message .= $this->language->get('text_firstname') . ' ' . $datacust['firstname'] . "\n";
					$message .= $this->language->get('text_lastname') . ' ' . $datacust['lastname'] . "\n";
					$message .= $this->language->get('text_email') . ' '  .  $datacust['email'] . "\n";
					$message .= $this->language->get('text_telephone') . ' ' . $datacust['telephone'] . "\n";
					
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					
					$mail->setTo($this->config->get('config_email'));
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
					$mail->setSubject(html_entity_decode($this->language->get('text_new_Seller'), ENT_QUOTES, 'UTF-8'));
					$mail->setText($message);
					$mail->send();
					
					// Send to additional alert emails if new account email is enabled
					$emails = explode(',', $this->config->get('config_alert_email'));
					
					foreach ($emails as $email) {
						if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
							$mail->setTo($email);
							$mail->send();
						}
					}
				}
				////End Admin Mail////
				if($store_id){
					if($this->config->get('purpletree_multivendor_seller_approval')){
						$this->session->data['success'] = $this->language->get('text_approval');
						//$this->response->redirect($this->url->link('account/account'));
						} else {
						$this->session->data['success'] = $this->language->get('text_seller_success');
						//$this->response->redirect($this->url->link('account/account'));
					}
					} else {
					//$this->response->redirect($this->url->link('account/account'));
				}
			}		
			if (isset($this->request->post['become_seller'])) {
				$json['data']['become_seller'] = $this->request->post['become_seller'];
			} 
			else {
				$json['data']['become_seller'] = '';
			}
			
			if (isset($this->request->post['seller_storename'])) {
				$json['data']['seller_storename'] = $this->request->post['seller_storename'];
			} 
			else {
				$json['data']['seller_storename'] = '';
			}
			if (isset($this->error['seller_store'])) {
				$json['message'] = $this->error['seller_store'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['error_warning'])) {
				$json['message'] = $this->error['error_warning'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if(isset($this->error['warning1']))
			{
				$json['message'] = $this->error['warning1'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			else {
				$json['message']= '';
			}
			$isSeller = $this->customer->isSeller();
			if($isSeller){
				if($isSeller['is_removed']){
					//$json['data']['action'] = $this->url->link('extension/api/purpletree_multivendor/sellerstore/reseller', '', true);
					$json['data']['is_removed'] = 1;
				}
				} else {
				
			}
			
			if (isset($this->request->post['become_seller'])) {
				$json['data']['become_seller'] = $this->request->post['become_seller'];
				} else {
				$json['data']['become_seller'] = '';
			}
			
			if (isset($this->request->post['store_name'])) {
				$json['data']['store_name'] = $this->request->post['store_name'];
				} else {
				$json['data']['store_name'] = '';
			}
			
			$json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		public function reseller(){
			
			$json['status'] = 'error';
			$json['message'] = 'No Data';
			$this->load->language('purpletree_multivendor/sellerstore');
			if (!$this->customer->isMobileApiCall()) {
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = 'Seller Not Logged In';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				
			}
			$this->load->model('purpletree_multivendor/vendor');
			if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
				
				$store_id = $this->model_purpletree_multivendor_vendor->reseller($this->customer->getId(), $this->request->post);
				if($store_id){
					if($this->config->get('purpletree_multivendor_seller_approval')){
						$this->session->data['success'] = $this->language->get('text_approval');
						} else {
						$this->session->data['success'] = $this->language->get('text_seller_success');
						$json['status'] = 'success';
						$json['message'] = $this->session->data['success'];
						$this->response->addHeader('Content-Type: application/json');
						return $this->response->setOutput(json_encode($json));
					}
					} else {
					$json['status'] = 'success';
					$this->response->addHeader('Content-Type: application/json');
					return $this->response->setOutput(json_encode($json));
				}
			}
			$json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
			
		}
		public function storeview(){
			
			$this->load->language('purpletree_multivendor/storeview');
			
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = 'Seller Not Logged In';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = 'Not Seller Login';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			$this->load->model('purpletree_multivendor/vendor');
			
			$this->load->model('purpletree_multivendor/sellerproduct');
			
			if (isset($this->request->get['filter'])) {
				$filter = $this->request->get['filter'];
				} else {
				$filter = '';
			}
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
				} else {
				$sort = 'p.sort_order';
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
			
			if (isset($this->request->get['limit'])) {
				$limit = (int)$this->request->get['limit'];
				} else {
				$limit = $this->config->get('theme_' . $this->config->get('config_theme') . '_product_limit');
			}
			$category_id=0;
			if(!empty($this->request->get['category']))
			{
				$category_id=$this->request->get['category'];
			}
			
			$json['data']['seller_products'] = array();
			
			$json['data']['toatl_seller_products'] = array();
			
			if(isset($this->request->get['seller_store_id'])){
				$sellerstore = $this->request->get['seller_store_id'];
				} else {
				$sellerstore_d = $this->customer->isSeller();
				$sellerstore = $sellerstore_d['id'];
			}
			
			$store_detail = $this->model_purpletree_multivendor_vendor->getStore($sellerstore);
			
			if($store_detail  and ($store_detail['store_status']==1)){
				$json['data']['store_rating'] = $this->model_purpletree_multivendor_vendor->getStoreRating($store_detail['seller_id']);
				
				$json['data']['purpletree_multivendor_store_email'] = $this->config->get('purpletree_multivendor_store_email');
				$json['data']['purpletree_multivendor_store_phone'] = $this->config->get('purpletree_multivendor_store_phone');
				$json['data']['purpletree_multivendor_store_address'] = $this->config->get('purpletree_multivendor_store_address');
				
				$json['data']['store_name'] = $store_detail['store_name'];
				$json['data']['seller_name'] = $store_detail['seller_name'];
				$json['data']['store_email'] = $store_detail['store_email'];
				$json['data']['store_phone'] = $store_detail['store_phone'];
				$json['data']['store_tin'] = $store_detail['store_tin'];
				$json['data']['store_zipcode'] = $store_detail['store_zipcode'];
				$json['data']['store_description'] = html_entity_decode($store_detail['store_description'], ENT_QUOTES, 'UTF-8');
				$json['data']['store_address'] = html_entity_decode($store_detail['store_address'], ENT_QUOTES, 'UTF-8');
				
				$json['data']['seller_review_status'] = $this->config->get('purpletree_multivendor_seller_review');
				
				$this->load->model('tool/image');
				
				if (is_file(DIR_IMAGE . $store_detail['store_logo'])) {
					$json['data']['store_logo'] = $this->model_tool_image->resize($store_detail['store_logo'], 150, 150);
					} else {
					$json['data']['store_logo'] = $this->model_tool_image->resize('no_image.png', 150, 150);
				}
				
				if (is_file(DIR_IMAGE . $store_detail['store_banner'])) {
					$json['data']['store_banner'] = $this->model_tool_image->resize($store_detail['store_banner'], 900, 300);
					} else {
					$json['data']['store_banner'] = $this->model_tool_image->resize('catalog/purpletree_banner.jpg', 900, 300);
				}
				
				$store_detail = array(
				'seller_id' => $store_detail['seller_id'],
				'category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit,
				'status'              => 1,
				'is_approved'              => 1
				);
				
				$store_detail['status'] = 1;
				$store_detail['is_approved'] = 1;
				$seller_products = $this->model_purpletree_multivendor_sellerproduct->getSellerProducts($store_detail);
				$toatl_seller_products = $this->model_purpletree_multivendor_sellerproduct->getTotalSellerProducts($store_detail);
				if($seller_products){
					foreach($seller_products as $seller_product){
						
						if (is_file(DIR_IMAGE . $seller_product['image'])) {
							$image = $this->model_tool_image->resize($seller_product['image'], 150, 150);
							} else {
							$image = $this->model_tool_image->resize('no_image.png', 150, 150);
						}
						
						$price = $this->currency->format($this->tax->calculate($seller_product['price'], $seller_product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						
						$product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($seller_product['product_id']);
						
						$special = false;
						
						foreach ($product_specials  as $product_special) {
							if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
								$special = $this->currency->format($this->tax->calculate($product_special['price'], $seller_product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
								break;
							}
						}
						
						$json['data']['seller_products'][] = array(
						'product_id' => $seller_product['product_id'],
						'name' => $seller_product['name'],
						'price' => $price,
						'image' => $image,
						'special'    => $special,
						'minimum'     => $seller_product['minimum'] > 0 ? $seller_product['minimum'] : 1,
						'description' => utf8_substr(strip_tags(html_entity_decode($seller_product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length'))  . '..'
						);
					}
				}
				
				$json['data']['limits'] = array();
				
				$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));
				
				sort($limits);
				
				foreach($limits as $value) {
					$json['data']['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'seller_store_id'  => $sellerstore
					);
				}
				$json['data']['pagination']['total'] = $toatl_seller_products;
				$json['data']['pagination']['page'] = $page;
				$json['data']['pagination']['limit'] = $limit;
				
				$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($toatl_seller_products) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($toatl_seller_products - $limit)) ? $toatl_seller_products : ((($page - 1) * $limit) + $limit), $toatl_seller_products, ceil($toatl_seller_products / $limit));
				
				$json['data']['sort'] = $sort;
				$json['data']['order'] = $order;
				$json['data']['limit'] = $limit;
				
				
			}
		    $json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));		
		}
		
		public function storedesc() { 
			$json['status'] = 'error';
			$json['message'] = 'No Data';
			if (!$this->customer->isMobileApiCall()) { 
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}		
			if (!$this->customer->isLogged()) {
				$json['status'] = 'error';
				$json['message'] = 'Seller Not Logged In';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$json['status'] = 'error';
				$json['message'] = 'Seller Not Approved';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}		
			
			if(!$this->customer->validateSeller()) {		
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_license');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$this->load->language('purpletree_multivendor/storeview');
			
			$this->load->model('purpletree_multivendor/vendor');
			
			if (isset($this->request->get['seller_store_id'])) {
				$store_id = (int)$this->request->get['seller_store_id'];
				} else {
				$store_id = 0;
			}
			
			$store_info = $this->model_purpletree_multivendor_vendor->getStore($store_id);
			
			if ($store_info) {
				if(isset($this->request->get['path'])) {
					if(( null !== $this->request->get['path']) && $this->request->get['path']=="shippingpolicy"){
						$json['data']['store_policy'] = html_entity_decode($store_info['store_shipping_policy'], ENT_QUOTES, 'UTF-8') . "\n";
						$json['status'] = 'success';
						$json['message'] = '';
						} elseif((null !== $this->request->get['path']) && $this->request->get['path']=="returnpolicy"){				
						$json['data']['store_policy'] = html_entity_decode($store_info['store_return_policy'], ENT_QUOTES, 'UTF-8') . "\n";
						$json['status'] = 'success';
						$json['message'] = '';
						} elseif((null !== $this->request->get['path']) && $this->request->get['path']=="aboutstore"){
						
						$json['data']['store_policy'] = html_entity_decode($store_info['store_description'], ENT_QUOTES, 'UTF-8') . "\n";
						$json['status'] = 'success';
						$json['message'] = '';
					}
					} else {
					$json['status'] = 'error';
					$json['message'] = 'path must be defined';
				}
			}
			//$json['status'] = 'success';
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		private function validateSeller(){
			
			$this->load->model('purpletree_multivendor/vendor');
			if(!$this->customer->validateSeller()) {
				$this->error['error_warning'] = $this->language->get('error_license');
			}
			
			if($this->request->post['become_seller']){ 
				
				if ((utf8_strlen(trim($this->request->post['seller_storename'])) < 5) || (utf8_strlen(trim($this->request->post['seller_storename'])) > 50)) {
					$this->error['seller_store'] = $this->language->get('error_storename');
				}
				
				if(!empty($this->request->files['upload_file']['name']))
				{
					$allowed_file=array('gif','png','jpg','pdf','doc','docx','zip');
					$filename = $this->request->files['upload_file']['name'];
					
					$extension = pathinfo($filename,PATHINFO_EXTENSION);
					
					if(!in_array($extension ,$allowed_file)) {
						
						$this->error['warning1'] = $this->language->get('error_supported_file');
					}
				}
			}
			return !$this->error;
		}
		
		private function validateForm(){
			
			$seller_seo = $this->model_purpletree_multivendor_vendor->getStoreSeo($this->request->post['store_seo']);
			
			$store_info = $this->model_purpletree_multivendor_vendor->getStoreByEmail($this->request->post['store_email']);
			
			$pattern = '/[\'\/~`\!@#\$%\^&\*\(\)\+=\{\}\[\]\|;:"\<\>,\.\?\\\ ]/';
			if (preg_match($pattern, $this->request->post['store_seo'])==true) {
				$this->error['store_seo'] = $this->language->get('error_store_seo');
				} elseif ((utf8_strlen($this->request->post['store_seo']) < 3) || (utf8_strlen(trim($this->request->post['store_seo'])) > 150)) {
				$this->error['store_seo'] = $this->language->get('error_storeseoempty');
				} elseif(isset($store_info['id'])){
				$seller_seot = "seller_store_id=".$store_info['id'];
				if(isset($seller_seo['query'])){
					if($seller_seo['query']!=$seller_seot){
						$this->error['store_seo'] = $this->language->get('error_storeseo');
					}
				}
			}
			if(!empty($_FILES['upload_file']['name'])) {
				$allowed_file=array('gif','png','jpg','pdf','doc','docx','zip');
				$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($_FILES['upload_file']['name'], ENT_QUOTES, 'UTF-8')));
				$extension = pathinfo($filename, PATHINFO_EXTENSION);
				if(!in_array($extension,$allowed_file) ) {
					$this->error['error_file_upload'] = $this->language->get('error_supported_file');
				}
			}
			if ((utf8_strlen(trim($this->request->post['store_name'])) < 5) || (utf8_strlen(trim($this->request->post['store_name'])) > 50)) {
				$this->error['store_name'] = $this->language->get('error_storename');
			}
			$EMAIL_REGEX='/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/';
			
			if (preg_match($EMAIL_REGEX, $this->request->post['store_email'])==false)	
			{
				$this->error['store_email'] = $this->language->get('error_storeemail');
			}
			$store_detail = $this->customer->isSeller();
			
			if (!isset($store_info['id'])) {
				if ($store_info) {
					$this->error['warning'] = $this->language->get('error_exists');
				}
				} else { 
				if ($store_info && ($store_detail['id'] != $store_info['id'])) {
					$this->error['warning'] = $this->language->get('error_exists');
				}
			}
			if(trim($this->request->post['store_phone']) < 1){
				if ((utf8_strlen(trim($this->request->post['store_phone'])) < 10) || (utf8_strlen(trim($this->request->post['store_phone'])) > 12)) {
					$this->error['store_phone'] = $this->language->get('error_storephone');
				}
			}
			
			if ((utf8_strlen(trim($this->request->post['store_address'])) < 5) || (utf8_strlen(trim($this->request->post['store_address'])) > 101)) {
				$this->error['store_address'] = $this->language->get('error_storeaddress');
			}
			
			if ((utf8_strlen(trim($this->request->post['store_city'])) < 3) || (utf8_strlen(trim($this->request->post['store_city'])) > 50)) {
				$this->error['store_city'] = $this->language->get('error_storecity');
			}
			
			if (empty($this->request->post['store_country'])) {
				$this->error['store_country'] = $this->language->get('error_storecountry');
			}
			
			if (empty($this->request->post['store_state'])) {
				$this->error['error_storezone'] = $this->language->get('error_storezone');
			}
			
			if(trim($this->request->post['store_zipcode']) >= 1){
				if ((utf8_strlen(trim($this->request->post['store_zipcode'])) < 3) || (utf8_strlen(trim($this->request->post['store_zipcode'])) > 12)) {
					$this->error['store_zipcode'] = $this->language->get('error_storepostcode');
				}
			}
			
			if ((utf8_strlen(trim($this->request->post['store_meta_keywords'])) =='') ) {
				$this->error['store_meta_keywords'] = $this->language->get('error_storemetakeywords');
			}
			
			if ((utf8_strlen(trim($this->request->post['store_meta_description']))=='') ) {
				$this->error['store_meta_description'] = $this->language->get('error_storemetadescription');
			}
			
			if ((utf8_strlen(trim($this->request->post['store_bank_details'])) =='') ) {
				$this->error['store_bank_details'] = $this->language->get('error_storebankdetail');
			}
			
			if(trim($this->request->post['store_shipping_charge']) < 0){
				$this->error['store_shipping_charge'] = $this->language->get('error_storeshippingcharge');
			}
			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			return !$this->error;
		}
		
		public function removeseller(){
			
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
			
			$this->load->language('purpletree_multivendor/storeview');
			
			$seller_id = $this->customer->getId();
			
			$this->load->model('purpletree_multivendor/vendor');
			
			$result = $this->model_purpletree_multivendor_vendor->removeSeller($seller_id);		
			
		    $json['status'] = 'success';
		    $json['message'] = $this->language->get('text_remove_account_success');
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
			
		}
		
		
		public function sellerreview() { 
			
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			if (!$this->customer->isMobileApiCall()) { 
				$json['status'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$json['data']['customer_id'] = $this->customer->getId();
			
			$this->load->language('purpletree_multivendor/sellerreview');
			
			$this->load->model('purpletree_multivendor/sellerreview');
			
			if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateReview()) {
				
				$this->model_purpletree_multivendor_sellerreview->addReview($this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			
			if (isset($this->request->get['limit'])) {
				$limit = (int)$this->request->get['limit'];
				} else {
				$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			}
			
			if (isset($this->request->get['seller_id'])) {
				$seller_id = (int)$this->request->get['seller_id'];
				} else {
				$seller_id = 0;
			}
			
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
			}
			
			if (isset($this->error['review_title'])) {
				$json['message'] = $this->error['review_title'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['rating'])) {
				$json['message'] = $this->error['rating'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			
			if (isset($this->error['review_description'])) {
				$json['message'] = $this->error['review_description'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			if (isset($this->error['no_can_review'])) {
				$json['message'] = $this->error['no_can_review'];
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				$json['message'] = '';
			}
			
			if(isset($this->request->get['seller_id'])){
				$json['data']['seller_id'] = $seller_id;
				$this->load->model('purpletree_multivendor/sellerreview');
				if(!$this->model_purpletree_multivendor_sellerreview->canReview($datasend = array('seller_id' =>$seller_id,'customer_id' =>$this->customer->getId()))) {
					$json['data']['warning'] = $this->language->get('no_can_review');
				}
				if (isset($this->request->get['limit'])) {
					$limit = (int)$this->request->get['limit'];
					} else {
					$limit = 20;
				} 	
				
				$filter_data = array(
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit,
				'seller_id' 		=> $seller_id,
				'customer_id'		=> $json['data']['customer_id']
				);
				
				$review_total = $this->model_purpletree_multivendor_sellerreview->getTotalSellerReview($filter_data);
				
				if (isset($this->request->post['review_title'])) { 
					$json['data']['review_title'] = $this->request->post['review_title'];
					} else { 
					$json['data']['review_title'] = '';
				}
				
				if (isset($this->request->post['review_description'])) { 
					$json['data']['review_description'] = $this->request->post['review_description'];
					} else { 
					$json['data']['review_description'] = '';
				}
				
				if (isset($this->request->post['seller_id'])) { 
					$json['data']['seller_id'] = $this->request->post['seller_id'];
					} else { 
					$json['data']['seller_id'] = (isset($this->request->get['seller_id'])?$this->request->get['seller_id']:'');
				}
				
				$results = $this->model_purpletree_multivendor_sellerreview->getSellerReview($filter_data);
				
				$this->model_purpletree_multivendor_sellerreview->checkReview($filter_data);
				
				
				$json['data']['reviews'] = array();
				if ($results) {
					foreach($results as $result){
						$json['data']['reviews'][] = array(
						'customer_name'     => $result['customer_name'],
						'seller_id'     => $result['seller_id'],
						'review_title'     => $result['review_title'],
						'review_description'       => nl2br($result['review_description']),
						'rating'     => (int)$result['rating'],
						'date_added' => date($this->language->get('date_format_short'), strtotime($result['created_at']))
						);
						
						
					}
				}
				$json['data']['pagination']['total'] = $review_total;
				$json['data']['pagination']['page'] = $page;
				$json['data']['pagination']['limit'] = $limit;
				$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($review_total - $limit)) ? $review_total : ((($page - 1) * $limit) + $limit), $review_total, ceil($review_total / $limit));
				} else{
				if($this->customer->isSeller()){
					
					
					$seller_id = $this->customer->getId();
					
					$filter_data = array(
					'start'              => ($page - 1) * $limit,
					'limit'              => $limit,
					'seller_id' 		=> $seller_id,
					'shown'				=> '1'
					);
					
					$review_total = $this->model_purpletree_multivendor_sellerreview->getTotalSellerReview($filter_data);
					
					$results = $this->model_purpletree_multivendor_sellerreview->getSellerReview($filter_data);
					
					$json['data']['reviews'] = array();
					
					
					if ($results) {
						foreach($results as $result){
							$json['data']['reviews'][] = array(
							'customer_name'     => $result['customer_name'],
							'review_title'     => $result['review_title'],
							'review_description'       => nl2br($result['review_description']),
							'rating'     => (int)$result['rating'],
							'status'     => (($result['status'])?$this->language->get('text_approved'):$this->language->get('text_notapproved')),
							'date_added' => date($this->language->get('date_format_short'), strtotime($result['created_at']))
							);
						}
					}
					$json['data']['pagination']['total'] = $review_total;
					$json['data']['pagination']['page'] = $page;
					$json['data']['pagination']['limit'] = $limit;
					$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($review_total - $limit)) ? $review_total : ((($page - 1) * $limit) + $limit), $review_total, ceil($review_total / $limit));
					$json['status'] = 'success';
					
					
					
				}
			}
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		private function validateReview(){
			
			if ((utf8_strlen($this->request->post['review_title']) < 3) ) {
				$this->error['review_title'] = $this->language->get('error_title');
			}
			
			if ((empty($this->request->post['rating'])) ) {
				$this->error['rating'] = $this->language->get('error_rating');
			}
			
			if ((utf8_strlen($this->request->post['review_description']) < 5) ) {
				$this->error['review_description'] = $this->language->get('error_description_length');
				} elseif(empty($this->request->post['review_description'])){
				$this->error['review_description'] = $this->language->get('error_description');
			}
			
			$this->load->model('purpletree_multivendor/sellerreview');
			
			if(!$this->model_purpletree_multivendor_sellerreview->canReview($this->request->post)) {
				$this->error['no_can_review'] = $this->language->get('no_can_review');
			}
			
			return !$this->error;
}
}
?>