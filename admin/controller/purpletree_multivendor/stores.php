<?php
class ControllerPurpletreeMultivendorStores extends Controller{
		private $error = array();
		
		public function index(){
			$this->load->language('purpletree_multivendor/stores');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/stores');
			
			$this->getList();
		}
		
		public function edit(){
			//seller area //
			if((isset($this->request->post['seller_area_selection_type'])) && ($this->request->post['seller_area_selection_type'] == 1)){
			     if(!empty($this->request->post['seller_area'])){
			     $this->request->post['seller_area']   = serialize($this->request->post['seller_area']);
			     }
				}else{
				 if(isset($this->request->post['seller_area_selection_type'])){
				 $this->request->post['seller_area'] = 0;
				 }
				}
		    //seller area //
			$this->load->language('purpletree_multivendor/stores');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/stores');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$path = 'ptsseller/';
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
				$store_id=$this->request->get['store_id'];
				$seller_id=$this->model_purpletree_multivendor_stores->getSellerId($store_id);
				$admin_store_id =$this->model_purpletree_multivendor_stores->getAdminStoreId($store_id);
				if(isset($this->request->post['store_video'])){
					$video_url = $this->generateVideoEmbedUrl($this->request->post['store_video']);			
					$this->request->post['store_video'] = $video_url;
					}else{
					$this->request->post['store_video'] = '';
				}
				if($this->request->post['vacation']==1){		
					$productstts = $this->model_purpletree_multivendor_stores->getSellerProduct($this->request->post['seller_id']);
					if($productstts){
						foreach ($productstts as $productstt) {
							$this->model_purpletree_multivendor_stores->updateVacationProduct($productstt['product_id'],$productstt['status'],$this->request->post['seller_id']);
							
							$this->model_purpletree_multivendor_stores->updateProductAccrVacation($productstt['product_id']);
						}
					}
					}else{
					$productsttss = $this->model_purpletree_multivendor_stores->getSellerProductBystatus($this->request->post['seller_id']);
					if($productsttss){
						foreach ($productsttss as $productstts) {
							$this->model_purpletree_multivendor_stores->updateProductAccrVacationn($productstts['product_id']);
						}
					}
					$this->model_purpletree_multivendor_stores->updateVacationProductByOff($this->request->post['seller_id']);
				}
				if($this->config->get('purpletree_multivendor_allow_selleron_category') === 'service_mode'){	
					if(isset($this->request->post['allow_category'])){
						$this->model_purpletree_multivendor_stores->assignCategories($this->request->post['seller_id'], $this->request->post);		
					}	
				}	
				if(isset($this->request->post['multiple_store'])){
				$this->request->post['multi_store']=implode(',',$this->request->post['multiple_store']);
				}
				$this->model_purpletree_multivendor_stores->editStore($this->request->get['store_id'], $this->request->post,$file, $admin_store_id);
				$this->model_purpletree_multivendor_stores->storeTime($this->request->get['store_id'], $this->request->post);
				$this->model_purpletree_multivendor_stores->addHoliday($this->request->get['store_id'], $this->request->post);
				$seller_id_aftersave =$this->model_purpletree_multivendor_stores->getSellerId($store_id);
				$sellers_id = $this->model_purpletree_multivendor_stores->getSellerIdc($this->request->get['store_id']);			 
				$cus_seller_email = $this->model_purpletree_multivendor_stores->getCustomerEmailId($sellers_id);
								
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['filter_storename'])) {
					$url .= '&filter_storename=' . urlencode(html_entity_decode($this->request->get['filter_storename'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_storeemail'])) {
					$url .= '&filter_storeemail=' . urlencode(html_entity_decode($this->request->get['filter_storeemail'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_storestatus'])) {
					$url .= '&filter_storestatus=' . $this->request->get['filter_storestatus'];
				}
				
				
				if (isset($this->request->get['filter_date_added'])) {
					$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				///email///
				
				if(!empty($seller_id)) {
					if($seller_id['store_status'] == 0) {
						if($seller_id_aftersave['store_status'] == 1) {
							$customer_info = $this->model_purpletree_multivendor_stores->getCustomerId($seller_id['seller_id']);
							
							if ($customer_info) {
								$this->load->model('setting/store');
								
								$store_info = $this->model_setting_store->getStore($customer_info['store_id']);
								
								if ($store_info) {
									$store_name = $store_info['name'];
									$store_url = $store_info['url'] . 'index.php?route=account/login';
									} else {
									$store_name = $this->config->get('config_name');
									$store_url = HTTP_CATALOG . 'index.php?route=account/login';
								}
								
								$this->load->model('localisation/language');
								
								$language_info = $this->model_localisation_language->getLanguage($customer_info['language_id']);
								
								if ($language_info) {
									$language_code = $language_info['code'];
									} else {
									$language_code = $this->config->get('config_language');
								}
								
								$language = new Language($language_code);
								$language->load($language_code);
								$language->load('mail/customer');
								
								$this->load->model('purpletree_multivendor/mails');	
								
								$mail_subject_vars=array(
								'_STORE_NAME_'=>$store_name,
								);
								
								$mail_msg_vars=array(
								'_STORE_NAME_'=>$store_name,
								'_SELLER_LOGIN_'=>$store_url,
								);

						$emailTemplate=$this->model_purpletree_multivendor_mails->getEmailTemplate('admin_seller_store_approve_by_admin');

						$subject=$this->model_purpletree_multivendor_mails->replaceVariables($mail_subject_vars,$emailTemplate['new_subject']);
						$message=$this->model_purpletree_multivendor_mails->replaceVariables($mail_msg_vars,$emailTemplate['new_message']);
						$this->model_purpletree_multivendor_mails->sendMail($customer_info['email'],$subject,$message);
							}
						}
					}
				}///end email////
				
				
				$this->response->redirect($this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->getForm();
		}
		
		public function downloadAttachment()
		{
			$file="../ptsseller/".$this->request->get["document"]; //file location  
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
		
		public function getForm(){
			$this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_form'] = !isset($this->request->get['store_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			$data['purpletree_multivendor_allow_live_chat'] = 0;
			if(NULL !== $this->config->get('purpletree_multivendor_allow_live_chat')) {
				$data['purpletree_multivendor_allow_live_chat'] = $this->config->get('purpletree_multivendor_allow_live_chat');
			}
			$data['purpletree_multivendor_subscription_plans'] = $this->config->get('purpletree_multivendor_subscription_plans');
			$data['tab_live_chat'] = $this->language->get('tab_live_chat');
			$data['entry_allow_live_chat'] = $this->language->get('entry_allow_live_chat');
			$data['entry_yes'] = $this->language->get('entry_yes');
			$data['entry_no'] = $this->language->get('entry_no');
			$data['entry_live_chat_code'] = $this->language->get('entry_live_chat_code');
			$data['text_list'] = $this->language->get('text_list');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_none'] = $this->language->get('text_none');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
			$data['text_default'] = $this->language->get('text_default');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			$data['text_attachment'] = $this->language->get('text_attachment');
			$data['text_document'] = $this->language->get('text_document');
			$data['text_no_file'] = $this->language->get('text_no_file');
			$data['text_supported'] = $this->language->get('text_supported');
			$data['tab_categories'] = $this->language->get('tab_categories');
			$data['entry_google_add_link'] = $this->language->get('entry_google_add_link');
			$data['text_store_opening'] = $this->language->get('text_store_opening');
			$data['text_open'] = $this->language->get('text_open');
			$data['text_close'] = $this->language->get('text_close');
			$data['text_sunday'] = $this->language->get('text_sunday');
			$data['text_monday'] = $this->language->get('text_monday');
			$data['text_tuesday'] = $this->language->get('text_tuesday');
			$data['text_wednesday'] = $this->language->get('text_wednesday');
			$data['text_thursday'] = $this->language->get('text_thursday');
			$data['text_friday'] = $this->language->get('text_friday');
			$data['text_saturday'] = $this->language->get('text_saturday');
			$data['text_holiday'] = $this->language->get('text_holiday');
			$data['text_date'] = $this->language->get('text_date');
			$data['text_action'] = $this->language->get('text_action');
			$data['entry_storename'] = $this->language->get('entry_storename');
			$data['button_remove'] = $this->language->get('button_remove');
			//$data['entry_storeemail'] = $this->language->get('entry_storeemail');
			$data['entry_storephone'] = $this->language->get('entry_storephone');
			$data['entry_storelogo'] = $this->language->get('entry_storelogo');
			$data['entry_storebanner'] = $this->language->get('entry_storebanner');
			$data['entry_storebanner_desc'] = $this->language->get('entry_storebanner_desc');
			$data['entry_storestatus'] = $this->language->get('entry_storestatus');
			$data['entry_storeaddress'] = $this->language->get('entry_storeaddress');
			$data['entry_storecity'] = $this->language->get('entry_storecity');
			$data['entry_storepostcode'] = $this->language->get('entry_storepostcode');
			$data['entry_storecountry'] = $this->language->get('entry_storecountry');
			$data['entry_storezone'] = $this->language->get('entry_storezone');
			$data['entry_storedescription'] = $this->language->get('entry_storedescription');
			$data['entry_storeshippingpolicy'] = $this->language->get('entry_storeshippingpolicy');
			$data['entry_storereturn'] = $this->language->get('entry_storereturn');
			$data['entry_storemetakeyword'] = $this->language->get('entry_storemetakeyword');
			$data['entry_storemetadescription'] = $this->language->get('entry_storemetadescription');
			$data['entry_storebankdetail'] = $this->language->get('entry_storebankdetail');
			$data['entry_storetin'] = $this->language->get('entry_storetin');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_storestatus'] = $this->language->get('entry_storestatus');
			$data['entry_store_flat_rate_shipping'] = $this->language->get('entry_store_flat_rate_shipping');
			$data['entry_store_matrix_shipping'] = $this->language->get('entry_store_matrix_shipping');
			$data['entry_store_flexible_shipping'] = $this->language->get('entry_store_flexible_shipping');
			$data['entry_storeshipping'] = $this->language->get('entry_storeshipping');
			$data['entry_storeshipping_charge'] = $this->language->get('entry_storeshipping_charge');
			$data['entry_storeshipping_type'] = $this->language->get('entry_storeshipping_type');
			$data['entry_order_wise'] = $this->language->get('entry_order_wise');
			$data['entry_product_wise'] = $this->language->get('entry_product_wise');
			$data['entry_storeseo'] = $this->language->get('entry_storeseo');
			$data['entry_storeseo_note'] = $this->language->get('entry_storeseo_note');
			$data['entry_sellercommission'] = $this->language->get('entry_sellercommission');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			$data['button_upload'] = $this->language->get('button_upload');
			
			$data['button_manage_products'] = $this->language->get('button_manage_products');
			$data['button_manage_orders'] = $this->language->get('button_manage_orders');
			$data['button_manage_payments'] = $this->language->get('button_manage_payments');
			$data['button_manage_commissions'] = $this->language->get('button_manage_commissions');
			$data['button_manage_reviews'] = $this->language->get('button_manage_reviews');
			
			$data['tab_storedetail'] = $this->language->get('tab_storedetail');
			$data['tab_productlisting'] = $this->language->get('tab_productlisting');
			$data['tab_product_assign'] = $this->language->get('tab_product_assign');
			$data['tab_seller_orders'] = $this->language->get('tab_seller_orders');
			$data['tab_seller_shipping_charge'] = $this->language->get('tab_storeshipping');
			$data['entry_storetimings'] = $this->language->get('entry_storetimings');
			$data['tab_seller_timing_details'] = $this->language->get('tab_seller_timing_details');
			$data['tab_seller_payment'] = $this->language->get('tab_seller_payment');
			$data['tab_seller_commission'] = $this->language->get('tab_seller_commission');
			$data['tab_seller_review'] = $this->language->get('tab_seller_review');
			$data['tab_live_chat'] = $this->language->get('tab_live_chat');
			$data['entry_allow_live_chat'] = $this->language->get('entry_allow_live_chat');
			$data['entry_yes'] = $this->language->get('entry_yes');
			$data['entry_no'] = $this->language->get('entry_no');
			$data['entry_live_chat_code'] = $this->language->get('entry_live_chat_code');
			$data['entry_seller_paypal_id'] = $this->language->get('entry_seller_paypal_id');
			$data['tab_seller_paypal_details'] = $this->language->get('tab_seller_paypal_details');
			$data['help_paypal'] = $this->language->get('help_paypal');
			
			//social
			$data['entry_facebook'] = $this->language->get('entry_facebook');
			$data['entry_twitter'] = $this->language->get('entry_twitter');
			$data['entry_google'] = $this->language->get('entry_google');
			$data['entry_instagram'] = $this->language->get('entry_instagram');
			$data['entry_printerest'] = $this->language->get('entry_printerest');
			$data['entry_website'] = $this->language->get('entry_website');
			$data['entry_whatsapp_number'] = $this->language->get('entry_whatsapp_number');
			$data['entry_whatsapp'] = $this->language->get('entry_whatsapp');
			$data['text_sub_select'] = $this->language->get('text_sub_select');
			$data['entry_google_mapadd'] = $this->language->get('entry_google_mapadd');
			$data['entry_storeimage'] = $this->language->get('entry_storeimage');
			$data['entry_youtube_video'] = $this->language->get('entry_youtube_video');
			$data['text_sort_order'] = $this->language->get('text_sort_order');
			$data['entry_vacation'] = $this->language->get('entry_vacation');
			$data['entry_custom_fields'] = $this->language->get('entry_custom_fields');
			$data['text_selected_sellerarea'] = $this->language->get('text_selected_sellerarea');
			$data['seller_area_selection_type'] = $this->language->get('seller_area_selection_type');
			$data['entry_sellerarea'] = $this->language->get('entry_sellerarea');
			$data['help_sellerarea'] = $this->language->get('help_sellerarea');
			$data['text_all_sellerarea'] = $this->language->get('text_all_sellerarea');
			$data['entry_multi_store']   = $this->language->get('entry_multi_store');
			$data['entry_assign_stores'] = $this->language->get('entry_assign_stores');
			
			
			$data['entry_subscription_plans'] = $this->language->get('entry_subscription_plans');
			$data['button_save'] = $this->language->get('button_save');
			
			$data['token'] = $this->session->data['token'];
			if($this->config->get('purpletree_multivendor_allow_selleron_category') === 'service_mode'){	
				$data['check_category_bar'] = '1';
			}
			if (isset($this->request->get['store_id'])) {
				$data['store_id'] = $this->request->get['store_id'];
				} else {
				$data['store_id'] = 0;
			}
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}		
			
			if (isset($this->error['store_name'])) {
				$data['error_storename'] = $this->error['store_name'];
				} else {
				$data['error_storename'] = '';
			}
			
			if (isset($this->error['store_seo'])) {
				$data['error_storeseo'] = $this->error['store_seo'];
				} else {
				$data['error_storeseo'] = '';
			}
			
			/* if (isset($this->error['store_email'])) {
				$data['error_storeemail'] = $this->error['store_email'];
				} else {
				$data['error_storeemail'] = '';
			} */
			if (isset($this->error['seller_paypal_id'])) {
				$data['error_seller_paypal_id'] = $this->error['seller_paypal_id'];
				} else {
				$data['error_seller_paypal_id'] = '';
			}
			
			if (isset($this->error['store_phone'])) {
				$data['error_storephone'] = $this->error['store_phone'];
				} else {
				$data['error_storephone'] = '';
			}
			
			if (isset($this->error['store_address'])) {
				$data['error_storeaddress'] = $this->error['store_address'];
				} else {
				$data['error_storeaddress'] = '';
			}
			
			if (isset($this->error['store_city'])) {
				$data['error_storecity'] = $this->error['store_city'];
				} else {
				$data['error_storecity'] = '';
			}
			
			if (isset($this->error['store_country'])) {
				$data['error_storecountry'] = $this->error['store_country'];
				} else {
				$data['error_storecountry'] = '';
			}
			
			if (isset($this->error['store_state'])) {
				$data['error_storezone'] = $this->error['store_state'];
				} else {
				$data['error_storezone'] = '';
			}
			
			if (isset($this->error['store_zipcode'])) {
				$data['error_storezipcode'] = $this->error['store_zipcode'];
				} else {
				$data['error_storezipcode'] = '';
			}
			
			if (isset($this->error['store_meta_keywords'])) {
				$data['error_storemetakeyword'] = $this->error['store_meta_keywords'];
				} else {
				$data['error_storemetakeyword'] = '';
			}
			
			if (isset($this->error['store_meta_description'])) {
				$data['error_storemetadescription'] = $this->error['store_meta_description'];
				} else {
				$data['error_storemetadescription'] = '';
			}
			
			if (isset($this->error['store_bank_details'])) {
				$data['error_storebankdetail'] = $this->error['store_bank_details'];
				} else {
				$data['error_storebankdetail'] = '';
			}
			
			if (isset($this->error['store_tin'])) {
				$data['error_storetin'] = $this->error['store_tin'];
				} else {
				$data['error_storetin'] = '';
			}
			
			if (isset($this->error['store_shipping_charge'])) {
				$data['error_storecharge'] = $this->error['store_shipping_charge'];
				} else {
				$data['error_storecharge'] = '';
			} 	
			
			if (isset($this->error['seller_transaction'])) {
				$data['error_sellertransaction'] = $this->error['seller_transaction'];
				} else {
				$data['error_sellertransaction'] = '';
			}
			
			if (isset($this->error['seller_amount'])) {
				$data['error_selleramount'] = $this->error['seller_amount'];
				} else {
				$data['error_selleramount'] = '';
			}
			
			if (isset($this->error['seller_payment'])) {
				$data['error_sellerpaymode'] = $this->error['seller_payment'];
				} else {
				$data['error_sellerpaymode'] = '';
			}
			
			if (isset($this->error['seller_commission'])) {
				$data['error_sellercommission'] = $this->error['seller_commission'];
				} else {
				$data['error_sellercommission'] = '';
			}
			if (isset($this->error['error_file_upload'])) {
				$data['error_file_upload'] = $this->error['error_file_upload'];
				} else {
				$data['error_file_upload'] = '';
			}
			
			$url = '';
			
			///Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-store";
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
			'href' => $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			if (!isset($this->request->get['store_id'])) {
				$data['action'] = $this->url->link('purpletree_multivendor/stores/add', 'token=' . $this->session->data['token'] . $url, true);
				} else {
				$data['action'] = $this->url->link('purpletree_multivendor/stores/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'] . $url, true);
			}
			$data['storepage_layout'] = $this->config->get('purpletree_multivendor_storepage_layout');
			
			$data['cancel'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url, true);
			
			if (isset($this->request->get['store_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$seller_info = $this->model_purpletree_multivendor_stores->getStore($this->request->get['store_id']);
				$seller_info_socail = $this->model_purpletree_multivendor_stores->getStoreSocial($this->request->get['store_id']);
				$store_time = array();
				$store_holiday = array();
				 $store_time = $this->model_purpletree_multivendor_stores->getStoreTime($this->request->get['store_id']);
				 $store_holiday = $this->model_purpletree_multivendor_stores->getStoreHoliday($this->request->get['store_id']);
				$seller_id = $seller_info['seller_id'] ? $seller_info['seller_id'] : '' ;
				$categoryinfo = $this->model_purpletree_multivendor_stores->getCateType($seller_id);
				
			}
			$data['store_holiday'] = array();
			if(!empty($store_holiday)){
			foreach ($store_holiday as $key => $value){
			$data['store_holiday'][] = array(
						'id' => $value['id'],
						'store_id' => $value['store_id'],
						'date' => $value['date']				
						);
			}
			}
			if(!empty($store_time)){
			foreach ($store_time as $key => $value) {
			if($value['day_id'] == 1){
			     $data['sunday_open'] = $value['open_time'];
				 $data['sunday_close'] = $value['close_time'];
				}
			if($value['day_id'] == 2){
				 $data['monday_open'] = $value['open_time'];
				 $data['monday_close'] = $value['close_time'];
				}
			if($value['day_id'] == 3){
				   $data['tuesday_open'] = $value['open_time'];
				   $data['tuesday_close'] = $value['close_time'];
				}
			if($value['day_id'] == 4){
				   $data['wednesday_open'] = $value['open_time'];
				   $data['wednesday_close'] = $value['close_time'];
				}
			if($value['day_id'] == 5){
				   $data['thursday_open'] = $value['open_time'];
				   $data['thursday_close'] = $value['close_time'];
				}
			if($value['day_id'] == 6){
				   $data['friday_open'] = $value['open_time'];
				   $data['friday_close'] = $value['close_time'];
				}
			if($value['day_id'] == 7){
				   $data['saturday_open'] = $value['open_time'];
				   $data['saturday_close'] = $value['close_time'];
				 }
				}
			}
			 if(isset($this->request->post['store_timing'][1]['open'])){
			     $data['sunday_open'] = $this->request->post['store_timing'][1]['open'];
			}elseif(!empty($store_time)){
			     $data['sunday_open'] = $data['sunday_open'];
			}else{
			     $data['sunday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][1]['close'])){
			     $data['sunday_close'] = $this->request->post['store_timing'][1]['close'];
			}elseif(!empty($store_time)){
			     $data['sunday_close'] = $data['sunday_close'];
			}else{
			     $data['sunday_close'] = '';
			}	 
			
			if(isset($this->request->post['store_timing'][2]['open'])){
			     $data['monday_open'] = $this->request->post['store_timing'][2]['open'];
			}elseif(!empty($store_time)){
			      $data['monday_open'] =  $data['monday_open'];
			}else{
			      $data['monday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][2]['close'])){
			     $data['monday_close'] = $this->request->post['store_timing'][2]['close'];
			}elseif(!empty($store_time)){
			     $data['monday_close'] = $data['monday_close'];
			}else{
			     $data['monday_close'] = '';
			}	
				   
			if(isset($this->request->post['store_timing'][3]['open'])){
			     $data['tuesday_open'] = $this->request->post['store_timing'][3]['open'];
			}elseif(!empty($store_time)){
			      $data['tuesday_open'] =  $data['tuesday_open'];
			}else{
			      $data['tuesday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][3]['close'])){
			     $data['tuesday_close'] = $this->request->post['store_timing'][3]['close'];
			}elseif(!empty($store_time)){
			     $data['tuesday_close'] = $data['tuesday_close'];
			}else{
			     $data['tuesday_close'] = '';
			}	
			
			if(isset($this->request->post['store_timing'][4]['open'])){
			     $data['wednesday_open'] = $this->request->post['store_timing'][4]['open'];
			}elseif(!empty($store_time)){
			      $data['wednesday_open'] =  $data['wednesday_open'];
			}else{
			      $data['wednesday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][4]['close'])){
			     $data['wednesday_close'] = $this->request->post['store_timing'][4]['close'];
			}elseif(!empty($store_time)){
			     $data['wednesday_close'] = $data['wednesday_close'];
			}else{
			     $data['wednesday_close'] = '';
			}	
				   
			if(isset($this->request->post['store_timing'][5]['open'])){
			     $data['thursday_open'] = $this->request->post['store_timing'][5]['open'];
			}elseif(!empty($store_time)){
			      $data['thursday_open'] =  $data['thursday_open'];
			}else{
			      $data['thursday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][5]['close'])){
			     $data['thursday_close'] = $this->request->post['store_timing'][5]['close'];
			}elseif(!empty($store_time)){
			     $data['thursday_close'] = $data['thursday_close'];
			}else{
			     $data['thursday_close'] = '';
			}	
			
			if(isset($this->request->post['store_timing'][6]['open'])){
			     $data['friday_open'] = $this->request->post['store_timing'][6]['open'];
			}elseif(!empty($store_time)){
			      $data['friday_open'] =  $data['friday_open'];
			}else{
			      $data['friday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][6]['close'])){
			     $data['friday_close'] = $this->request->post['store_timing'][6]['close'];
			}elseif(!empty($store_time)){
			     $data['friday_close'] = $data['friday_close'];
			}else{
			     $data['friday_close'] = '';
			}	
				 
			if(isset($this->request->post['store_timing'][7]['open'])){
			     $data['saturday_open'] = $this->request->post['store_timing'][7]['open'];
			}elseif(!empty($store_time)){
			      $data['saturday_open'] =  $data['saturday_open'];
			}else{
			      $data['saturday_open'] = '';
			}
			if(isset($this->request->post['store_timing'][7]['close'])){
			     $data['saturday_close'] = $this->request->post['store_timing'][7]['close'];
			}elseif(!empty($store_time)){
			     $data['saturday_close'] = $data['saturday_close'];
			}else{
			     $data['saturday_close'] = '';
			}	
			
			/// vacation
			if (!empty($seller_info)) {
				$data['seller_id'] = $seller_info['seller_id'];
				} else {
				$data['seller_id'] = $this->request->post['seller_id'];
			}
			
			$data['manage_products'] = 	$this->url->link('purpletree_multivendor/sellerproducts', 'token=' . $this->session->data['token'] .'&seller_id='.$data['seller_id']. $url, true);
			
			$data['manage_orders'] = 	$this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] .'&seller_id='.$data['seller_id']. $url, true);
			
			$data['manage_payments'] = 	$this->url->link('purpletree_multivendor/commissioninvoice', 'token=' . $this->session->data['token'] .'&seller_id='.$data['seller_id']. $url, true);
			
			$data['manage_commissions'] = 	 $this->url->link('purpletree_multivendor/sellercommission', 'token=' . $this->session->data['token'] .'&seller_id='.$data['seller_id']. $url, true);
			
			$data['manage_reviews'] = 	$this->url->link('purpletree_multivendor/sellerreviews', 'token=' . $this->session->data['token'] .'&seller_id='.$data['seller_id']. $url, true);
			
			
			$allowed=array();
			$allowedCategories = '';
			if($this->config->get('purpletree_multivendor_allow_categorytype')) {
				$this->load->model('catalog/category');
				$results = $this->model_catalog_category->getCategories();
				foreach ($results as $result) {
					$allowed[] = $result['category_id'];
				}
				} else {
				$allowed = $this->config->get('purpletree_multivendor_allow_category');
			}
			$allowedCategories = '';
			if(!empty($allowed)) {
				$allowedCategories = implode(',',$allowed);
			}
			$filter = array('seller_id'=>$data['seller_id']);
			$catfilter = array(
			'seller_id' => $data['seller_id'],
			'category_type' => $this->config->get('purpletree_multivendor_allow_categorytype'),
			'category_allow' => $allowedCategories,
			);
			$data['products'] = $this->model_purpletree_multivendor_stores->getProductList($catfilter);
			
			$data['payment_list'] = $this->getSellerPaymentList($data['seller_id']);
			
			$data['commission_list'] = $this->getSellerCommissionList($filter);
			$data['type'] = '';
			if($this->config->get('purpletree_multivendor_allow_selleron_category') === 'service_mode'){	
				if (isset($this->request->post['type'])) {
					$data['type'] = $this->request->post['type'];
					}elseif(isset($categoryinfo[0]['type'])) {
					$data['type'] = $categoryinfo[0]['type'];
					} else {
					$data['type'] = '';
				}
				$data['allow_category1'] = array();
				if (isset($this->request->post['allow_category'])) {
					$data['allow_category'] = $this->request->post['allow_category'];
					$data['allow_category1'] = $this->request->post['allow_category'];
					} elseif(!empty($categoryinfo)) {
					$array1 = array();
					foreach ($categoryinfo as $result) {
						$data['allow_category1'][] = $result['category_id'];
					}
					} else {
					$data['allow_category'] = array();
					$data['allow_category1'] = array();
				}
				
				$data['allow_category'] = array();
				$this->load->model('catalog/category');
				$results = $this->model_catalog_category->getCategories();
				if(!empty($results)){
					foreach ($results as $result) {
						if($data['type']) {
							$data['allow_category'][strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))] = $result['category_id'];
							} else {
							if(in_array($result['category_id'],$data['allow_category1'])) {
								$data['allow_category'][strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))] = $result['category_id'];
							}
						}
					}
				}
			}
			if (isset($this->request->post['store_live_chat_enable'])) { 
				$data['store_live_chat_enable'] = $this->request->post['store_live_chat_enable'];
				} elseif (!empty($seller_info)) { 
				$data['store_live_chat_enable'] = $seller_info['store_live_chat_enable'];
				} else { 
				$data['store_live_chat_enable'] = 0;
			}
			if (isset($this->request->post['store_live_chat_code'])) { 
				$data['store_live_chat_code'] = $this->request->post['store_live_chat_code'];
				} elseif (!empty($seller_info)) { 
				$data['store_live_chat_code'] = $seller_info['store_live_chat_code'];
				} else { 
				$data['store_live_chat_code'] = '';
			}	
			///paypal
			if (isset($this->request->post['seller_paypal_id'])) { 
				$data['seller_paypal_id'] = $this->request->post['seller_paypal_id'];
				} elseif (!empty($seller_info)) { 
				$data['seller_paypal_id'] = $seller_info['seller_paypal_id'];
				} else { 
				$data['seller_paypal_id'] = '';
			}
			///paypal
			
			if (isset($this->request->post['seller_name'])) { 
				$data['seller_name'] = $this->request->post['seller_name'];
				} elseif (!empty($seller_info)) { 
				$data['seller_name'] = $seller_info['seller_name'];
				} else { 
				$data['seller_name'] = '';
			}
			
			if (isset($this->request->post['store_seo'])) { 
				$data['store_seo'] = $this->request->post['store_seo'];
				} elseif (!empty($seller_info)) { 
				$data['store_seo'] = $seller_info['store_seo'];
				} else { 
				$data['store_seo'] = '';
			}
			
			if (isset($this->request->post['store_name'])) {
				$data['store_name'] = $this->request->post['store_name'];
				} elseif (!empty($seller_info)) {
				$data['store_name'] = $seller_info['store_name'];
				} else {
				$data['store_name'] = '';
			}
			
			/* if (isset($this->request->post['store_email'])) {
				$data['store_email'] = $this->request->post['store_email'];
				} elseif (!empty($seller_info)) {
				$data['store_email'] = $seller_info['store_email'];
				} else {
				$data['store_email'] = '';
			} */
			
			if (isset($this->request->post['store_phone'])) {
				$data['store_phone'] = $this->request->post['store_phone'];
				} elseif (!empty($seller_info)) {
				$data['store_phone'] = $seller_info['store_phone'];
				} else {
				$data['store_phone'] = '';
			}
			if (isset($this->request->post['multiple_store'])) {
				$data['multi_store_id'] = $this->request->post['multiple_store'];
				} elseif (!empty($seller_info)) {
				$data['multi_store_id'] = explode(',',$seller_info['multi_store_id']);
				} else {
				$data['multi_store_id'] = '';
			}
			
			if (isset($this->request->post['store_description'])) {
				$data['store_description'] = $this->request->post['store_description'];
				} elseif (!empty($seller_info)) {
				$data['store_description'] = $seller_info['store_description'];
				} else {
				$data['store_description'] = '';
			}
			
			if (isset($this->request->post['store_address'])) {
				$data['store_address'] = $this->request->post['store_address'];
				} elseif (!empty($seller_info)) {
				$data['store_address'] = $seller_info['store_address'];
				} else {
				$data['store_address'] = '';
			}
			
			if (isset($this->request->post['store_country'])) {
				$data['store_country'] = $this->request->post['store_country'];
				} elseif (!empty($seller_info)) {
				$data['store_country'] = $seller_info['store_country'];
				} else {
				$data['store_country'] = '';
			}
			
			if (isset($this->request->post['store_state'])) {
				$data['store_state'] = $this->request->post['store_state'];
				} elseif (!empty($seller_info)) {
				$data['store_state'] = $seller_info['store_state'];
				} else {
				$data['store_state'] = '';
			}
			
			if (isset($this->request->post['store_city'])) {
				$data['store_city'] = $this->request->post['store_city'];
				} elseif (!empty($seller_info)) {
				$data['store_city'] = $seller_info['store_city'];
				} else {
				$data['store_city'] = '';
			}
			
			if (isset($this->request->post['store_zipcode'])) {
				$data['store_zipcode'] = $this->request->post['store_zipcode'];
				} elseif (!empty($seller_info)) {
				$data['store_zipcode'] = $seller_info['store_zipcode'];
				} else {
				$data['store_zipcode'] = '';
			}
					// seller area					
			if (isset($this->request->post['seller_area'])) {			    
			    if(isset($this->request->post['seller_area_selection_type']) &&($this->request->post['seller_area_selection_type'] == 1)){
				$data['seller_area_selection_type'] = 1;
				$sellerareas = Unserialize($this->request->post['seller_area']);
				}else{
				 $sellerareas = array();
				$data['seller_area_selection_type'] = 0;
				}
				} elseif (!empty($seller_info)) {
				if(!empty($seller_info['store_area'])){				
				$sellerareas = Unserialize($seller_info['store_area']);
				$data['seller_area_selection_type'] = 1;
				}else{				
				 $sellerareas = array();
				 $data['seller_area_selection_type'] = 0;
				}
				} else {
				$sellerareas = array();
				$data['seller_area_selection_type'] = 0;
			}
			$data['sellerareas'] = array();
			if(!empty($sellerareas)) {
			foreach ($sellerareas as $area_id) {
			$area_info = $this->model_purpletree_multivendor_stores->getSellerAreaByID($area_id);

			if ($area_info) {
				$data['sellerareas'][] = array(
					'area_id' => $area_info['area_id'],
					'name'        => $area_info['name']
				);
			}
		}
		}
	    // seller area	
			if (isset($this->request->post['store_shipping_policy'])) {
				$data['store_shipping_policy'] = $this->request->post['store_shipping_policy'];
				} elseif (!empty($seller_info)) {
				$data['store_shipping_policy'] = $seller_info['store_shipping_policy'];
				} else {
				$data['store_shipping_policy'] = '';
			}
			
			if (isset($this->request->post['store_return_policy'])) {
				$data['store_return_policy'] = $this->request->post['store_return_policy'];
				} elseif (!empty($seller_info)) {
				$data['store_return_policy'] = $seller_info['store_return_policy'];
				} else {
				$data['store_return_policy'] = '';
			}
			
			if (isset($this->request->post['store_meta_keywords'])) {
				$data['store_meta_keywords'] = $this->request->post['store_meta_keywords'];
				} elseif (!empty($seller_info)) {
				$data['store_meta_keywords'] = $seller_info['store_meta_keywords'];
				} else {
				$data['store_meta_keywords'] = '';
			}
			if (isset($this->request->post['google_map_link'])) {
				$data['google_map_link'] = $this->request->post['google_map_link'];
				} elseif (isset($seller_info['google_map_link'])) {
				$data['google_map_link'] = $seller_info['google_map_link'];
				} else {
				$data['google_map_link'] = '';
			}
			if (isset($this->request->post['store_meta_description'])) {
				$data['store_meta_description'] = $this->request->post['store_meta_description'];
				} elseif (!empty($seller_info)) {
				$data['store_meta_description'] = $seller_info['store_meta_descriptions'];
				} else {
				$data['store_meta_description'] = '';
			}
			
			if (isset($this->request->post['store_bank_details'])) {
				$data['store_bank_details'] = $this->request->post['store_bank_details'];
				} elseif (!empty($seller_info)) {
				$data['store_bank_details'] = $seller_info['store_bank_details'];
				} else {
				$data['store_bank_details'] = '';
			}
			
			if (isset($this->request->post['store_tin'])) {
				$data['store_tin'] = $this->request->post['store_tin'];
				} elseif (!empty($seller_info)) {
				$data['store_tin'] = $seller_info['store_tin'];
				} else {
				$data['store_tin'] = '';
			}
			
			if (isset($this->request->post['store_shipping_charge'])) {
				$data['store_shipping_charge'] = $this->request->post['store_shipping_charge'];
				} elseif (!empty($seller_info)) {
				$data['store_shipping_charge'] = $seller_info['store_shipping_charge'];
				} else {
				$data['store_shipping_charge'] = '';
			}
			
			
			if (isset($this->request->post['store_shipping_type'])) {
				$data['store_shipping_type'] = $this->request->post['store_shipping_type'];
				} elseif (!empty($seller_info) && isset($seller_info['store_shipping_type'])) {
				$data['store_shipping_type'] = $seller_info['store_shipping_type'];
				} else {
				$data['store_shipping_type'] = 'pts_flat_rate_shipping';
			}	
			if (isset($this->request->post['store_shipping_order_type'])) {
				$data['store_shipping_order_type'] = $this->request->post['store_shipping_order_type'];
				} elseif (!empty($seller_info) && isset($seller_info['store_shipping_order_type'])) {
				$data['store_shipping_order_type'] = $seller_info['store_shipping_order_type'];
				} else {
				$data['store_shipping_order_type'] = 'pts_product_wise';
			}				
			
			if (isset($this->request->post['store_status'])) {
				$data['store_status'] = $this->request->post['store_status'];
				} elseif (!empty($seller_info)) {
				$data['store_status'] = $seller_info['store_status'];
				} else {
				$data['store_status'] = '';
			}
			
			if (isset($this->request->post['store_commission'])) {
				$data['store_commission'] = $this->request->post['store_commission'];
				} elseif (!empty($seller_info)) {
				$data['store_commission'] = $seller_info['store_commission'];
				} else {
				$data['store_commission'] = '';
			}
			
			if (isset($this->request->post['store_logo'])) {
				$data['store_logo'] = $this->request->post['store_logo'];
				} elseif (!empty($seller_info)) {
				$data['store_logo'] = $seller_info['store_logo'];
				} else {
				$data['store_logo'] = '';
			}
			if (isset($this->request->post['vacation'])) { 
				$data['vacation'] = $this->request->post['vacation'];
				} elseif (isset($seller_info['vacation'])) { 
				$data['vacation'] = $seller_info['vacation'];
				} else { 
				$data['vacation'] = '';
			}
			
			$this->load->model('tool/image');
			
			if (isset($this->request->post['store_logo']) && is_file(DIR_IMAGE . $this->request->post['store_logo'])) {
				$data['thumb'] = $this->model_tool_image->resize($this->request->post['store_logo'], 100, 100);
				} elseif (!empty($seller_info) && is_file(DIR_IMAGE . $seller_info['store_logo'])) {
				$data['thumb'] = $this->model_tool_image->resize($seller_info['store_logo'], 100, 100);
				} else {
				$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			if (isset($this->request->post['store_timings'])) {
				$data['store_timings'] = $this->request->post['store_timings'];
				} elseif (isset($seller_info['store_timings'])) {
				$data['store_timings'] = $seller_info['store_timings'];
				} else {
				$data['store_timings'] = '';
			}
			if (isset($this->request->post['store_video'])) {
				$data['store_video'] = $this->request->post['store_video'];
				} elseif (isset($seller_info['store_video'])) {
				$data['store_video'] = $seller_info['store_video'];
				} else {
				$data['store_video'] = '';
			}		
			if (isset($this->request->post['google_map'])) {
				$data['google_map'] = $this->request->post['google_map'];
				} elseif (isset($seller_info['google_map'])) {
				$data['google_map'] = $seller_info['google_map'];
				} else {
				$data['google_map'] = '';
			}		
			if (isset($this->request->post['store_banner'])) {
				$data['store_banner'] = $this->request->post['store_banner'];
				} elseif (!empty($seller_info)) {
				$data['store_banner'] = $seller_info['store_banner'];
				} else {
				$data['store_banner'] = '';
			}
			if (isset($this->request->post['store_image'])) {
				$data['store_image'] = $this->request->post['store_image'];
				} elseif (!empty($seller_info)) {
				$data['store_image'] = $seller_info['store_image'];
				} else {
				$data['store_image'] = '';
			}
			if (isset($this->request->post['sort_order'])) { 
				$data['sort_order'] = $this->request->post['sort_order'];
				} elseif(isset($seller_info['sort_order'])) { 
				$data['sort_order'] = $seller_info['sort_order'];
				} else { 
				$data['sort_order'] = '';
			}
			if(!empty($seller_info['document'])){
				$data['upload_file_existing'] = $seller_info['document'];
				$data['upload_file_existing_href'] = "ptsseller/".$seller_info['document'];
			} 
			
			$this->load->model('tool/image');
			
			if (isset($this->request->post['store_banner']) && is_file(DIR_IMAGE . $this->request->post['store_banner'])) {
				$data['banner_thumb'] = $this->model_tool_image->resize($this->request->post['store_banner'], 100, 100);
				} elseif (!empty($seller_info) && is_file(DIR_IMAGE . $seller_info['store_banner'])) {
				$data['banner_thumb'] = $this->model_tool_image->resize($seller_info['store_banner'], 100, 100);
				} else {
				$data['banner_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}		
			if (isset($this->request->post['store_image']) && is_file(DIR_IMAGE . $this->request->post['store_image'])) {
				$data['image_thumb'] = $this->model_tool_image->resize($this->request->post['store_banner'], 100, 100);
				} elseif (!empty($seller_info) && is_file(DIR_IMAGE . $seller_info['store_image'])) {
				$data['image_thumb'] = $this->model_tool_image->resize($seller_info['store_image'], 100, 100);
				} else {
				$data['image_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			if(!empty($seller_info['document'])){
				$data['download']=array(
				'name'=> $this->language->get('text_document_name'),
				'href'=> 'ptsseller/'.$seller_info['document']
				);
				} else {
				$data['download']=array(
				'name'=> $this->language->get('text_no_file'),
				'href'=> "#"
				);  
			}
			//social
			if (isset($this->request->post['facebook_link'])) { 
				$data['facebook_link'] = $this->request->post['facebook_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['facebook_link'] = $seller_info_socail['facebook_link'];
				} else { 
				$data['facebook_link'] = '';
			}
			if (isset($this->request->post['twitter_link'])) { 
				$data['twitter_link'] = $this->request->post['twitter_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['twitter_link'] = $seller_info_socail['twitter_link'];
				} else { 
				$data['twitter_link'] = '';
			}
			if (isset($this->request->post['google_link'])) { 
				$data['google_link'] = $this->request->post['google_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['google_link'] = $seller_info_socail['google_link'];
				} else { 
				$data['google_link'] = '';
			}
			if (isset($this->request->post['instagram_link'])) { 
				$data['instagram_link'] = $this->request->post['instagram_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['instagram_link'] = $seller_info_socail['instagram_link'];
				} else { 
				$data['instagram_link'] = '';
			}
			if (isset($this->request->post['pinterest_link'])) { 
				$data['pinterest_link'] = $this->request->post['pinterest_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['pinterest_link'] = $seller_info_socail['pinterest_link'];
				} else { 
				$data['pinterest_link'] = '';
			}
			if (isset($this->request->post['wesbsite_link'])) { 
				$data['wesbsite_link'] = $this->request->post['wesbsite_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['wesbsite_link'] = $seller_info_socail['wesbsite_link'];
				} else { 
				$data['wesbsite_link'] = '';
			}
			if (isset($this->request->post['whatsapp_link'])) { 
				$data['whatsapp_link'] = $this->request->post['whatsapp_link'];
				} elseif (!empty($seller_info_socail)) { 
				$data['whatsapp_link'] = $seller_info_socail['whatsapp_link'];
				} else { 
				$data['whatsapp_link'] = '';
			}	
			//end social
//assign multiple stores
	$stores = array();
	$data['assignstores'] = array();
		
		$data['assignstores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
		);
		$this->load->model('setting/store');
		$stores = $this->model_setting_store->getStores();

		foreach ($stores as $store) {
			$data['assignstores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}

		if(!empty($data['assignstores'])){
			foreach($data['assignstores'] as $storeData){
			if(!empty($data['multi_store_id'])){
				if(in_array($storeData['store_id'],$data['multi_store_id'])){
					$data['assignmstores'][] = array(
						'store_id' => $storeData['store_id'],
						'name'     => $storeData['name'],
						'checked' => 'checked'
					);	
					
				} else {
					$data['assignmstores'][] = array(
						'store_id' => $storeData['store_id'],
						'name'     => $storeData['name'],
						'checked' => ''
					);	
				}
			}
			}
		}
		
$data['use_domain_wise_stores'] = '';
$use_domain_wise_stores = $this->config->get('purpletree_multivendor_multi_store');
	
if($use_domain_wise_stores){	
	$data['use_domain_wise_stores'] = $use_domain_wise_stores;
}
//assign multiple stores
			
		// Custom Fields
		$this->load->model('customer/custom_field');

		$data['custom_fields'] = array();

		$filter_data = array(
			'sort'  => 'cf.sort_order',
			'order' => 'ASC'
		);

		$custom_fields = $this->model_purpletree_multivendor_stores->getCustomFields($filter_data);

		foreach ($custom_fields as $custom_field) {
			$data['custom_fields'][] = array(
				'custom_field_id'    => $custom_field['custom_field_id'],
				'custom_field_value' => $this->model_purpletree_multivendor_stores->getCustomFieldValues($custom_field['custom_field_id']),
				'name'               => $custom_field['name'],
				'value'              => $custom_field['value'],
				'type'               => $custom_field['type'],
				'location'           => $custom_field['location'],
				'sort_order'         => $custom_field['sort_order']
			);
		}
		$this->load->model('customer/customer');
		
		if (isset($data['seller_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$customer_info = $this->model_customer_customer->getCustomer($data['seller_id']);
		}
		if (isset($this->request->post['custom_field'])) {
			$data['account_custom_field'] = $this->request->post['custom_field'];
		} elseif (!empty($customer_info)) {
			$data['account_custom_field'] = json_decode($customer_info['custom_field'], true);
		} else {
			$data['account_custom_field'] = array();
		}
		$this->load->model('tool/upload');
		if(!empty($data['custom_fields'])) {
			foreach ($data['custom_fields'] as $custom_field) {
			if(isset($custom_field['type']) && isset($custom_field['custom_field_id']) &&$custom_field['type'] == 'file' && isset($data['account_custom_field'][$custom_field['custom_field_id']])){ 
			$code = $data['account_custom_field'][$custom_field['custom_field_id']];
					$file =  $this->model_tool_upload->getUploadByCode($code);
						if(!empty($file) && isset($file['name']) && isset($file['filename'])) {
							if ($this->request->server['HTTPS']) {
								$baseurl = $this->config->get('config_ssl') . 'upload/';
							} else {
								$baseurl = $this->config->get('config_url') . 'upload/';
							}
							$data['account_custom_field'][$custom_field['custom_field_id']] = array(
								'file' => $file['name'],
								'value' => $data['account_custom_field'][$custom_field['custom_field_id']],
								'url' => $this->getrealpath($file['filename'],$file['name'])
							);
						}
					}
				}
			}
			$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			
			$this->load->model('localisation/country');
			
			$data['countries'] = $this->model_localisation_country->getCountries();
			$data['subscription_plan'] =  $this->model_purpletree_multivendor_stores->getSellerSubscriptionPlan($data['seller_id']);
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/store_form.tpl', $data));
		}
		
		protected function getList() {
		    $this->document->addStyle('view/javascript/purpletreecss/commonstylesheet.css');
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
				} else {
				$filter_name = null;
			}
			
			/* if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
				} else {
				$filter_email = null;
			} */
			
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
				} else {
				$filter_status = null;
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$filter_date_added = $this->request->get['filter_date_added'];
				} else {
				$filter_date_added = null;
			}
			
			$url = '';
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			/* if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			} */
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
				} else {
				$sort = 'name';
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
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			/* if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			} */
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
			
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-store";
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
			'href' => $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url, true)
			);
			
			
			$data['approve'] = $this->url->link('purpletree_multivendor/stores/approve', 'token=' . $this->session->data['token'] . $url, true);
			$data['disapprove'] = $this->url->link('purpletree_multivendor/stores/disapprove', 'token=' . $this->session->data['token'] . $url, true);
			
			$data['vendors'] = array();
			
			$data['stores'] = array();
			
			
			$filter_data = array(
			'filter_name'              => $filter_name,
			//'filter_email'             => $filter_email,
			'filter_status'            => $filter_status,
			'filter_date_added'        => $filter_date_added,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
			);
			
			$store_total = $this->model_purpletree_multivendor_stores->getTotalStores($filter_data);
			
			$results = $this->model_purpletree_multivendor_stores->getStores($filter_data);
			foreach ($results as $result) {
				
				if (!$this->customer->validateSeller()) {
					$this->load->language('purpletree_multivendor/ptsmultivendor');
					$this->session->data['error_warning'] = $this->language->get('error_license');
					$edit = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'], true);
					} else {
					$edit = $this->url->link('purpletree_multivendor/stores/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $result['id'] . $url, true);
				}
				$cus_seller_email = $this->model_purpletree_multivendor_stores->getCustomerEmailId($result['seller_id']);
				$data['stores'][] = array(
				'store_name'  => $result['store_name'],
				'store_id'  => $result['id'],
				'seller_id'    => $result['seller_id'],
				'seller_url'    => $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['seller_id'] . $url, true),
				'seller_name'           => $result['name'],
				'store_email'          => $cus_seller_email,
				'store_phone'          => $result['store_phone'],
				'store_address'          => $result['store_address'],
				'store_status'         => ($result['store_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'is_removed'         => ($result['is_removed'] ? '<br><span class="label label-danger">'.$this->language->get('entry_removed').'</span>' : ''),
				'store_created_at'     => date($this->language->get('date_format_short'), strtotime($result['store_created_at'])),
				'edit'           => $edit,
				'status'           => $result['status']
				);
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_list'] = $this->language->get('text_list');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
			$data['text_default'] = $this->language->get('text_default');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_confirm'] = $this->language->get('text_confirm');
			$data['text_all'] = $this->language->get('text_all');
			
			$data['column_storename'] = $this->language->get('column_storename');
			$data['column_storeemail'] = $this->language->get('column_storeemail');
			$data['column_storestatus'] = $this->language->get('column_storestatus');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_storephone'] = $this->language->get('column_storephone');
			$data['column_storeaddress'] = $this->language->get('column_storeaddress');
			$data['column_is_removed'] = $this->language->get('column_is_removed');
			
			$data['entry_storename'] = $this->language->get('entry_storename');
			$data['entry_storeemail'] = $this->language->get('entry_storeemail');
			$data['entry_storestatus'] = $this->language->get('entry_storestatus');
			$data['entry_date_added'] = $this->language->get('entry_date_added');
			$data['entry_name'] = $this->language->get('entry_name');
			
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_filter'] = $this->language->get('button_filter');
			$data['button_approve'] = $this->language->get('button_approve');
			$data['button_disapprove'] = $this->language->get('button_disapprove');
			
			$data['token'] = $this->session->data['token'];
			
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
			
			if (isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				
				unset($this->session->data['error_warning']);
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->request->post['selected'])) {
				$data['selected'] = (array)$this->request->post['selected'];
				} else {
				$data['selected'] = array();
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			/* if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			} */
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
			
			if ($order == 'ASC') {
				$url .= '&order=DESC';
				} else {
				$url .= '&order=ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$data['sort_name'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . '&sort=store_name' . $url, true);
			$data['sort_seller_name'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . '&sort=c.name' . $url, true);
			$data['sort_email'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . '&sort=store_email' . $url, true);
			$data['sort_status'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . '&sort=store_status' . $url, true);
			$data['sort_date_added'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . '&sort=store_created_at' . $url, true);
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			/* if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			} */
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$pagination = new Pagination();
			$pagination->total = $store_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($store_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($store_total - $this->config->get('config_limit_admin'))) ? $store_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $store_total, ceil($store_total / $this->config->get('config_limit_admin')));
			
			$data['filter_name'] = $filter_name;
			//$data['filter_email'] = $filter_email;
			$data['filter_status'] = $filter_status;
			$data['filter_date_added'] = $filter_date_added;
			
			$this->load->model('setting/store');
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			$this->response->setOutput($this->load->view('purpletree_multivendor/store_list', $data));
		}
		
		
		public function getSellerPaymentList($seller_id){
			
			$this->load->language('purpletree_multivendor/sellerpayment');
			
			$this->load->model('purpletree_multivendor/sellerpayment');
			
			$data['text_payment'] = $this->language->get('text_payment');
			$data['text_trnasaction'] = $this->language->get('text_trnasaction');
			$data['text_amount'] = $this->language->get('text_amount');
			$data['text_payment_mode'] = $this->language->get('text_payment_mode');
			$data['text_status'] = $this->language->get('text_status');
			$data['text_created_at'] = $this->language->get('text_created_at');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_payment_status'] = $this->language->get('text_payment_status');
			
			return $data;
		}
		
		public function getSellerCommissionList($seller_id){
			
			$this->load->language('purpletree_multivendor/sellercommission');
			
			$this->load->model('purpletree_multivendor/sellercommission');
			
			
			$data['text_total_sale'] = $this->language->get('text_total_sale');
			$data['text_total_commission'] = $this->language->get('text_total_commission');
			$data['text_recvd_amt'] = $this->language->get('text_recvd_amt');
			$data['text_pending_amt'] = $this->language->get('text_pending_amt');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_product_id'] = $this->language->get('text_product_id');
			$data['text_status'] = $this->language->get('text_status');
			$data['text_created_at'] = $this->language->get('text_created_at');
			$data['text_commission'] = $this->language->get('text_commission');
			$data['text_empty'] = $this->language->get('text_empty');
			
			$data['seller_commissions'] = array();
			
			$data['total_commission'] = array();
			$data['total_rcvd_amt'] = array();
			$data['total_sale'] = array();
			$data['total_pending_amt'] = array();
			$data['total_pending_amt_1'] = array();
			$total_sale = $this->model_purpletree_multivendor_sellercommission->getTotalsaleAll($seller_id); 
			if($total_sale['total']){
				$data['total_sale'] = $this->currency->format($total_sale['total'], $total_sale['currency_code'], $total_sale['currency_value']);
			}
			
			
			$total_commission = $this->model_purpletree_multivendor_sellercommission->getTotalcommission($seller_id);
			if($total_commission){
				$data['total_commission'] = $this->currency->format($total_commission, $total_sale['currency_code'], $total_sale['currency_value']);
			}
			$total_rcvd_amt = $this->model_purpletree_multivendor_sellercommission->getTotalrecievedamt($seller_id);
			if($total_rcvd_amt){
				$data['total_rcvd_amt'] = $this->currency->format($total_rcvd_amt, $total_sale['currency_code'], $total_sale['currency_value']);
			}
			if($total_sale['total']){
				$pending_payments =  $this->model_purpletree_multivendor_sellercommission->pendingPayments($seller_id);;
				$totalpaymentss = 0;
				$orderstatus = 0;
				if(null !== $this->config->get('purpletree_multivendor_commission_status')) {
					$orderstatus = $this->config->get('purpletree_multivendor_commission_status');
				}
				if(!empty($pending_payments)) {
					foreach($pending_payments as $paymentsss) {
						//print_r($paymentsss); //die;
						if($paymentsss['seller_order_status'] == $paymentsss['admin_order_status'] && $paymentsss['seller_order_status'] == $orderstatus && $paymentsss['admin_order_status'] == $orderstatus) {
							$totalpaymentss += $paymentsss['total_price'];
						}
					}
				}
				//
				$penpayems = $totalpaymentss - $total_rcvd_amt - $total_commission;
				$data['total_pending_amt'] = $this->currency->format($penpayems, $total_sale['currency_code'], $total_sale['currency_value']);
				$data['total_pending_amt_1'] = ($total_sale['total']-$total_rcvd_amt-$total_commission);
			}
			return $data;
		}
		
		public function seller_order_info(){
			$this->load->model('purpletree_multivendor/stores');
			$this->load->language('purpletree_multivendor/stores');
			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
				} else {
				$order_id = 0;
			}
			
			if (isset($this->request->get['seller_id'])) {
				$seller_id = $this->request->get['seller_id'];
				} else {
				$seller_id = 0;
			}
			
			$order_info = $this->model_purpletree_multivendor_stores->getOrder($order_id,$seller_id);
			
			if ($order_info) {
				
				$this->load->language('sale/order');
				
				$this->document->setTitle($this->language->get('heading_title'));
				
				$data['heading_title'] = $this->language->get('heading_title');
				
				$data['text_ip_add'] = sprintf($this->language->get('text_ip_add'), $this->request->server['REMOTE_ADDR']);
				$data['text_order_detail'] = $this->language->get('text_order_detail');
				$data['text_customer_detail'] = $this->language->get('text_customer_detail');
				$data['text_option'] = $this->language->get('text_option');
				$data['text_store'] = $this->language->get('text_store');
				$data['text_date_added'] = $this->language->get('text_date_added');
				$data['text_payment_method'] = $this->language->get('text_payment_method');
				$data['text_shipping_method'] = $this->language->get('text_shipping_method');
				$data['text_customer'] = $this->language->get('text_customer');
				$data['text_customer_group'] = $this->language->get('text_customer_group');
				$data['text_email'] = $this->language->get('text_email');
				$data['text_telephone'] = $this->language->get('text_telephone');
				$data['text_invoice'] = $this->language->get('text_invoice');
				$data['text_reward'] = $this->language->get('text_reward');
				$data['text_affiliate'] = $this->language->get('text_affiliate');
				$data['text_order'] = sprintf($this->language->get('text_order'), $this->request->get['order_id']);
				$data['text_payment_address'] = $this->language->get('text_payment_address');
				$data['text_shipping_address'] = $this->language->get('text_shipping_address');
				$data['text_comment'] = $this->language->get('text_comment');
				$data['text_account_custom_field'] = $this->language->get('text_account_custom_field');
				$data['text_payment_custom_field'] = $this->language->get('text_payment_custom_field');
				$data['text_shipping_custom_field'] = $this->language->get('text_shipping_custom_field');
				$data['text_browser'] = $this->language->get('text_browser');
				$data['text_ip'] = $this->language->get('text_ip');
				$data['text_forwarded_ip'] = $this->language->get('text_forwarded_ip');
				$data['text_user_agent'] = $this->language->get('text_user_agent');
				$data['text_accept_language'] = $this->language->get('text_accept_language');
				$data['text_history'] = $this->language->get('text_history');
				$data['text_history_add'] = $this->language->get('text_history_add');
				$data['text_loading'] = $this->language->get('text_loading');
				$data['text_refund_heding'] = $this->language->get('text_refund_heding');
				$data['text_refudn_amount'] = $this->language->get('text_refudn_amount');
				$data['button_submit'] = $this->language->get('button_submit');
				
				$data['column_product'] = $this->language->get('column_product');
				$data['column_model'] = $this->language->get('column_model');
				$data['column_quantity'] = $this->language->get('column_quantity');
				$data['column_price'] = $this->language->get('column_price');
				$data['column_total'] = $this->language->get('column_total');
				
				$data['entry_order_status'] = $this->language->get('entry_order_status');
				$data['entry_notify'] = $this->language->get('entry_notify');
				$data['entry_override'] = $this->language->get('entry_override');
				$data['entry_comment'] = $this->language->get('entry_comment');
				
				$data['help_override'] = $this->language->get('help_override');
				
				$data['button_invoice_print'] = $this->language->get('button_invoice_print');
				$data['button_shipping_print'] = $this->language->get('button_shipping_print');
				$data['button_edit'] = $this->language->get('button_edit');
				$data['button_cancel'] = $this->language->get('button_cancel');
				$data['button_generate'] = $this->language->get('button_generate');
				$data['button_reward_add'] = $this->language->get('button_reward_add');
				$data['button_reward_remove'] = $this->language->get('button_reward_remove');
				$data['button_commission_add'] = $this->language->get('button_commission_add');
				$data['button_commission_remove'] = $this->language->get('button_commission_remove');
				$data['button_history_add'] = $this->language->get('button_history_add');
				$data['button_ip_add'] = $this->language->get('button_ip_add');
				
				$data['tab_history'] = $this->language->get('tab_history');
				$data['tab_additional'] = $this->language->get('tab_additional');
				
				$url = '';
				
				if (isset($this->request->get['filter_order_id'])) {
					$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
				}
				
				if (isset($this->request->get['filter_customer'])) {
					$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_order_status'])) {
					$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
				}
				
				if (isset($this->request->get['filter_total'])) {
					$url .= '&filter_total=' . $this->request->get['filter_total'];
				}
				
				if (isset($this->request->get['filter_date_added'])) {
					$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
				}
				
				if (isset($this->request->get['filter_date_modified'])) {
					$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
				}
				
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
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-store";
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
				'href' => $this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true)
				);
				
				$data['shipping'] = $this->url->link('purpletree_multivendor/stores/shipping', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'] .'&seller_id=' .(int)$seller_id, true);
				$data['invoice'] = $this->url->link('purpletree_multivendor/stores/invoice', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'].'&seller_id=' .(int)$seller_id, true);
				$data['edit'] = $this->url->link('purpletree_multivendor/stores/edit', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'].'&seller_id=' .(int)$seller_id, true);
				$data['cancel'] = $this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . '&seller_id=' .(int)$seller_id, true);
				
				$data['token'] = $this->session->data['token'];
				
				$data['order_id'] = $this->request->get['order_id'];
				$data['seller_id'] = $this->request->get['seller_id'];
				
				$data['store_id'] = $order_info['store_id'];
				$seller_store = $this->model_purpletree_multivendor_stores->getStoreDetail($seller_id);
				$data['store_name'] = $seller_store['store_name'];
				
				if ($order_info['store_id'] == 0) {
					$data['store_url'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;
					} else {
					$data['store_url'] = $order_info['store_url'];
				}
				
				$data['store_url'] = HTTPS_CATALOG.'index.php?route=account/purpletree_multivendor/sellerstore/storeview&seller_store_id='.$seller_store['id'];
				
				if ($order_info['invoice_no']) {
					$data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
					} else {
					$data['invoice_no'] = '';
				}
				
				$data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
				
				$data['firstname'] = $order_info['firstname'];
				$data['lastname'] = $order_info['lastname'];
				
				if ($order_info['customer_id']) {
					$data['customer'] = $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $order_info['customer_id'], true);
					} else {
					$data['customer'] = '';
				}
				
				$this->load->model('customer/customer_group');
				
				$customer_group_info = $this->model_customer_customer_group->getCustomerGroup($order_info['customer_group_id']);
				
				if ($customer_group_info) {
					$data['customer_group'] = $customer_group_info['name'];
					} else {
					$data['customer_group'] = '';
				}
				
				$data['email'] = $order_info['email'];
				$data['telephone'] = $order_info['telephone'];
				
				$data['shipping_method'] = $order_info['shipping_method'];
				$data['payment_method'] = $order_info['payment_method'];
				
				// Payment Address
				if ($order_info['payment_address_format']) {
					$format = $order_info['payment_address_format'];
					} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}
				
				$find = array(
				'{firstname}',
				'{lastname}',
				'{company}',
				'{address_1}',
				'{address_2}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
				);
				
				$replace = array(
				'firstname' => $order_info['payment_firstname'],
				'lastname'  => $order_info['payment_lastname'],
				'company'   => $order_info['payment_company'],
				'address_1' => $order_info['payment_address_1'],
				'address_2' => $order_info['payment_address_2'],
				'city'      => $order_info['payment_city'],
				'postcode'  => $order_info['payment_postcode'],
				'zone'      => $order_info['payment_zone'],
				'zone_code' => $order_info['payment_zone_code'],
				'country'   => $order_info['payment_country']
				);
				
				$data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
				
				// Shipping Address
				if ($order_info['shipping_address_format']) {
					$format = $order_info['shipping_address_format'];
					} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}
				
				$find = array(
				'{firstname}',
				'{lastname}',
				'{company}',
				'{address_1}',
				'{address_2}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
				);
				
				$replace = array(
				'firstname' => $order_info['shipping_firstname'],
				'lastname'  => $order_info['shipping_lastname'],
				'company'   => $order_info['shipping_company'],
				'address_1' => $order_info['shipping_address_1'],
				'address_2' => $order_info['shipping_address_2'],
				'city'      => $order_info['shipping_city'],
				'postcode'  => $order_info['shipping_postcode'],
				'zone'      => $order_info['shipping_zone'],
				'zone_code' => $order_info['shipping_zone_code'],
				'country'   => $order_info['shipping_country']
				);
				
				$data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
				
				// Uploaded files
				$this->load->model('sale/order');
				$this->load->model('tool/upload');
				
				$data['products'] = array();
				
				$products = $this->model_purpletree_multivendor_stores->getSellerOrderProducts($this->request->get['order_id'],$this->request->get['seller_id']);
				
				$total_shipping = 0;
				$product_total = 0;
				foreach ($products as $product) {
					$option_data = array();
					
					$options = $this->model_sale_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);
					
					$total_shipping += $product['shipping'];
					
					$product_total += $product['total'];
					
					foreach ($options as $option) {
						if ($option['type'] != 'file') {
							$option_data[] = array(
							'name'  => $option['name'],
							'value' => $option['value'],
							'type'  => $option['type']
							);
							} else {
							$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
							
							if ($upload_info) {
								$option_data[] = array(
								'name'  => $option['name'],
								'value' => $upload_info['name'],
								'type'  => $option['type'],
								'href'  => $this->url->link('tool/upload/download', 'token=' . $this->session->data['token'] . '&code=' . $upload_info['code'], true)
								);
							}
						}
					}
					
					$data['products'][] = array(
					'order_product_id' => $product['order_product_id'],
					'product_id'       => $product['product_id'],
					'name'    	 	   => $product['name'],
					'model'    		   => $product['model'],
					'option'   		   => $option_data,
					'quantity'		   => $product['quantity'],
					'shipping'		   => $this->currency->format($total_shipping, $order_info['currency_code'], $order_info['currency_value']),
					'seller_name'		=> $product['seller_name'],
					'seller_href'		=> $this->url->link('customer/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $product['seller_id'], true),
					'price'    		   => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
					'total'    		   => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
					'href'     		   => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $product['product_id'], true)
					);
				}
				
				$data['vouchers'] = array();
				
				$vouchers = $this->model_sale_order->getOrderVouchers($this->request->get['order_id']);
				
				foreach ($vouchers as $voucher) {
					$data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']),
					'href'        => $this->url->link('sale/voucher/edit', 'token=' . $this->session->data['token'] . '&voucher_id=' . $voucher['voucher_id'], true)
					);
				}
				
				$data['totals'] = array();
				
				$totals = $this->model_purpletree_multivendor_stores->getOrderTotals($this->request->get['order_id'],$this->request->get['seller_id']);
				
				foreach ($totals as $total) {
					if($total['title'] == 'Refunded'){
						$ids = array();
						$return_sellername = "";
						$return_storeurl = "";
						$ids = explode('_',$total['code']);	
						//echo"<pre>"; print_r($ids); die;
						$code1 = $ids[0];
						$r_product_id = $ids[1];
						$seller_idd = $this->request->get['seller_id'];
						$idds = array();
						$idds = array(
						'0' => 'refunded',
						'1' => $seller_idd,
						'2' => $r_product_id	
						);
						$final_code = implode('_',$idds);
						$sellerdd = $this->model_purpletree_multivendor_stores->getsellerInfofororder($seller_idd); 
						$return_sellername  = $sellerdd['seller_name'];
						$return_storeurl = $this->url->link('purpletree_multivendor/stores/edit&store_id='.$sellerdd['store_id'], 'token=' . $this->session->data['token'], true);
						$final_title = $total['title']." "."(".("<a href=".$return_storeurl.">".$return_sellername."</a>").")";
						
						
						}else{
						$final_title = $total['title'];
						$final_code = "";
					}
					$data['totals'][] = array(
					'title' => $final_title,
					'sub_title' => $total['title'],
					'code' => $total['code'],
					'final_code' => $final_code,
					'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
					'amount'  => ltrim($total['value'],$total['value'][0])
					);
				}
				$data['refund_acton']=$this->url->link('purpletree_multivendor/stores/refundupdate', 'token=' . $this->session->data['token']. $url, true);
				$data['comment'] = nl2br($order_info['comment']);
				
				$this->load->model('customer/customer');
				
				$data['reward'] = $order_info['reward'];
				
				$data['reward_total'] = $this->model_customer_customer->getTotalCustomerRewardsByOrderId($this->request->get['order_id']);
				
				$data['affiliate_firstname'] = $order_info['affiliate_firstname'];
				$data['affiliate_lastname'] = $order_info['affiliate_lastname'];
				
				if ($order_info['affiliate_id']) {
					$data['affiliate'] = $this->url->link('marketing/affiliate/edit', 'token=' . $this->session->data['token'] . '&affiliate_id=' . $order_info['affiliate_id'], true);
					} else {
					$data['affiliate'] = '';
				}
				
				$data['commission'] = $this->currency->format($order_info['commission'], $order_info['currency_code'], $order_info['currency_value']);
				
				$this->load->model('marketing/affiliate');
				
				$data['commission_total'] = $this->model_marketing_affiliate->getTotalTransactionsByOrderId($this->request->get['order_id']);
				
				$this->load->model('localisation/order_status');
				
				$order_status_info = $this->model_localisation_order_status->getOrderStatus($order_info['order_status_id']);
				
				if ($order_status_info) {
					$data['order_status'] = $order_status_info['name'];
					} else {
					$data['order_status'] = '';
				}
				
				$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
				
				$data['order_status_id'] = $order_info['order_status_id'];
				
				$data['account_custom_field'] = $order_info['custom_field'];
				
				// Custom Fields
				$this->load->model('customer/custom_field');
				
				$data['account_custom_fields'] = array();
				
				$filter_data = array(
				'sort'  => 'cf.sort_order',
				'order' => 'ASC'
				);
				
				$custom_fields = $this->model_customer_custom_field->getCustomFields($filter_data);
				
				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'account' && isset($order_info['custom_field'][$custom_field['custom_field_id']])) {
						if ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio') {
							$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($order_info['custom_field'][$custom_field['custom_field_id']]);
							
							if ($custom_field_value_info) {
								$data['account_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $custom_field_value_info['name']
								);
							}
						}
						
						if ($custom_field['type'] == 'checkbox' && is_array($order_info['custom_field'][$custom_field['custom_field_id']])) {
							foreach ($order_info['custom_field'][$custom_field['custom_field_id']] as $custom_field_value_id) {
								$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($custom_field_value_id);
								
								if ($custom_field_value_info) {
									$data['account_custom_fields'][] = array(
									'name'  => $custom_field['name'],
									'value' => $custom_field_value_info['name']
									);
								}
							}
						}
						
						if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea' || $custom_field['type'] == 'file' || $custom_field['type'] == 'date' || $custom_field['type'] == 'datetime' || $custom_field['type'] == 'time') {
							$data['account_custom_fields'][] = array(
							'name'  => $custom_field['name'],
							'value' => $order_info['custom_field'][$custom_field['custom_field_id']]
							);
						}
						
						if ($custom_field['type'] == 'file') {
							$upload_info = $this->model_tool_upload->getUploadByCode($order_info['custom_field'][$custom_field['custom_field_id']]);
							
							if ($upload_info) {
								$data['account_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $upload_info['name']
								);
							}
						}
					}
				}
				
				// Custom fields
				$data['payment_custom_fields'] = array();
				
				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'address' && isset($order_info['payment_custom_field'][$custom_field['custom_field_id']])) {
						if ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio') {
							$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($order_info['payment_custom_field'][$custom_field['custom_field_id']]);
							
							if ($custom_field_value_info) {
								$data['payment_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $custom_field_value_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
						
						if ($custom_field['type'] == 'checkbox' && is_array($order_info['payment_custom_field'][$custom_field['custom_field_id']])) {
							foreach ($order_info['payment_custom_field'][$custom_field['custom_field_id']] as $custom_field_value_id) {
								$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($custom_field_value_id);
								
								if ($custom_field_value_info) {
									$data['payment_custom_fields'][] = array(
									'name'  => $custom_field['name'],
									'value' => $custom_field_value_info['name'],
									'sort_order' => $custom_field['sort_order']
									);
								}
							}
						}
						
						if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea' || $custom_field['type'] == 'file' || $custom_field['type'] == 'date' || $custom_field['type'] == 'datetime' || $custom_field['type'] == 'time') {
							$data['payment_custom_fields'][] = array(
							'name'  => $custom_field['name'],
							'value' => $order_info['payment_custom_field'][$custom_field['custom_field_id']],
							'sort_order' => $custom_field['sort_order']
							);
						}
						
						if ($custom_field['type'] == 'file') {
							$upload_info = $this->model_tool_upload->getUploadByCode($order_info['payment_custom_field'][$custom_field['custom_field_id']]);
							
							if ($upload_info) {
								$data['payment_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $upload_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
					}
				}
				
				// Shipping
				$data['shipping_custom_fields'] = array();
				
				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'address' && isset($order_info['shipping_custom_field'][$custom_field['custom_field_id']])) {
						if ($custom_field['type'] == 'select' || $custom_field['type'] == 'radio') {
							$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($order_info['shipping_custom_field'][$custom_field['custom_field_id']]);
							
							if ($custom_field_value_info) {
								$data['shipping_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $custom_field_value_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
						
						if ($custom_field['type'] == 'checkbox' && is_array($order_info['shipping_custom_field'][$custom_field['custom_field_id']])) {
							foreach ($order_info['shipping_custom_field'][$custom_field['custom_field_id']] as $custom_field_value_id) {
								$custom_field_value_info = $this->model_customer_custom_field->getCustomFieldValue($custom_field_value_id);
								
								if ($custom_field_value_info) {
									$data['shipping_custom_fields'][] = array(
									'name'  => $custom_field['name'],
									'value' => $custom_field_value_info['name'],
									'sort_order' => $custom_field['sort_order']
									);
								}
							}
						}
						
						if ($custom_field['type'] == 'text' || $custom_field['type'] == 'textarea' || $custom_field['type'] == 'file' || $custom_field['type'] == 'date' || $custom_field['type'] == 'datetime' || $custom_field['type'] == 'time') {
							$data['shipping_custom_fields'][] = array(
							'name'  => $custom_field['name'],
							'value' => $order_info['shipping_custom_field'][$custom_field['custom_field_id']],
							'sort_order' => $custom_field['sort_order']
							);
						}
						
						if ($custom_field['type'] == 'file') {
							$upload_info = $this->model_tool_upload->getUploadByCode($order_info['shipping_custom_field'][$custom_field['custom_field_id']]);
							
							if ($upload_info) {
								$data['shipping_custom_fields'][] = array(
								'name'  => $custom_field['name'],
								'value' => $upload_info['name'],
								'sort_order' => $custom_field['sort_order']
								);
							}
						}
					}
				}
				
				$data['ip'] = $order_info['ip'];
				$data['forwarded_ip'] = $order_info['forwarded_ip'];
				$data['user_agent'] = $order_info['user_agent'];
				$data['accept_language'] = $order_info['accept_language'];
				
				// Additional Tabs
				$data['tabs'] = array();
				
				if ($this->user->hasPermission('access', 'extension/payment/' . $order_info['payment_code'])) {
					if (is_file(DIR_CATALOG . 'controller/extension/payment/' . $order_info['payment_code'] . '.php')) {
						$content = $this->load->controller('extension/payment/' . $order_info['payment_code'] . '/order');
						} else {
						$content = null;
					}
					
					if ($content) {
						$this->load->language('extension/payment/' . $order_info['payment_code']);
						
						$data['tabs'][] = array(
						'code'    => $order_info['payment_code'],
						'title'   => $this->language->get('heading_title'),
						'content' => $content
						);
					}
				}
				
				$this->load->model('extension/extension');
				
				$extensions = $this->model_extension_extension->getInstalled('fraud');
				
				foreach ($extensions as $extension) {
					if ($this->config->get($extension . '_status')) {
						$this->load->language('extension/fraud/' . $extension);
						
						$content = $this->load->controller('extension/fraud/' . $extension . '/order');
						
						if ($content) {
							$data['tabs'][] = array(
							'code'    => $extension,
							'title'   => $this->language->get('heading_title'),
							'content' => $content
							);
						}
					}
				}
				
				// The URL we send API requests to
				$data['catalog'] = $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG;
				
				// API login
				$this->load->model('user/api');
				
				$api_info = $this->model_user_api->getApi($this->config->get('config_api_id'));
				
				if ($api_info) {
					$data['api_id'] = $api_info['api_id'];
					$data['api_key'] = $api_info['key'];
					$data['api_ip'] = $this->request->server['REMOTE_ADDR'];
					} else {
					$data['api_id'] = '';
					$data['api_key'] = '';
					$data['api_ip'] = '';
				}
				$data['header'] = $this->load->controller('common/header');
				$data['column_left'] = $this->load->controller('common/column_left');
				$data['footer'] = $this->load->controller('common/footer');
				
				$this->response->setOutput($this->load->view('purpletree_multivendor/seller_order_info', $data));
				} else{
				return new Action('error/not_found');
			}
		}
		
		protected function validateForm(){
			if (!$this->user->hasPermission('modify', 'purpletree_multivendor/stores')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			
			//$store_info = $this->model_purpletree_multivendor_stores->getStoreByEmail($this->request->post['store_email']);		
			$sellers_id = $this->model_purpletree_multivendor_stores->getSellerIdc($this->request->get['store_id']);		
			$store_info = $this->model_purpletree_multivendor_stores->getStoreById($sellers_id);
			
			$seller_seo = $this->model_purpletree_multivendor_stores->getStoreSeo($this->request->post['store_seo']);
			$pattern = '/[\'\/~`\!@#\$%\^&\*\(\)\+=\{\}\[\]\|;:"\<\>,\.\?\\\ ]/';
			if (preg_match($pattern, $this->request->post['store_seo'])==true) {
				$this->error['store_seo'] = $this->language->get('error_store_seo');
				} elseif(isset($store_info['id'])){
				$seller_seot = "seller_store_id=".$store_info['id'];
				if(isset($seller_seo['query'])){
					if($seller_seo['query']!=$seller_seot){
						$this->error['store_seo'] = $this->language->get('error_storeseo');
					}
				}
			}
			if ((utf8_strlen(trim($this->request->post['store_name'])) < 5) || (utf8_strlen(trim($this->request->post['store_name'])) > 50)) {
				$this->error['store_name'] = $this->language->get('error_storename');
			}
			$store_info1 = $this->model_purpletree_multivendor_stores->getStoreNameByStoreName($this->request->post['store_name']);
			
			if (isset($this->request->get['store_id'])) {
				if ($store_info1 && ($this->request->get['store_id'] != $store_info1['id'] && strtoupper(trim($this->request->post['store_name']))==strtoupper($store_info1['store_name']))) {
					$this->error['store_name'] = $this->language->get('error_exist_storename');
					$this->error['warning'] = $this->language->get('error_warning');
				}
			}
			/* $EMAIL_REGEX="/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/";
				if (preg_match($EMAIL_REGEX, $this->request->post['store_email'])==false) {
				$this->error['store_email'] = $this->language->get('error_storeemail');
				}
				
				if (!isset($this->request->get['store_id'])) {
				if ($store_info) {
				$this->error['warning'] = $this->language->get('error_exists');
				}
				} else {
				if ($store_info && ($this->request->get['store_id'] != $store_info['id'])) {
				$this->error['warning'] = $this->language->get('error_exists');
				}
			} */
			
			if($this->request->post['store_phone'] != ''){
			if(trim($this->request->post['store_phone']) < 1){
				if ((utf8_strlen(trim($this->request->post['store_phone'])) < 3) || (utf8_strlen(trim($this->request->post['store_phone'])) > 32)) {
					$this->error['store_phone'] = $this->language->get('error_storephone');
				}
			}
			}
			
			if ((utf8_strlen(trim($this->request->post['store_address'])) < 5) || (utf8_strlen(trim($this->request->post['store_address'])) > 201)) {
				$this->error['store_address'] = $this->language->get('error_storeaddress');
			}
			
			if ((utf8_strlen(trim($this->request->post['store_city'])) < 2) || (utf8_strlen(trim($this->request->post['store_city'])) > 128)) {
				$this->error['store_city'] = $this->language->get('error_storecity');
			}
			
			if (empty($this->request->post['store_country'])) {
				$this->error['store_country'] = $this->language->get('error_storecountry');
			}
			
			
			if ($this->request->post['store_state'] == '') {
				$this->error['store_state'] = $this->language->get('error_storezone');
			}
			
			if($this->request->post['store_zipcode'] != ''){
				if(trim($this->request->post['store_zipcode']) >= 1){
					if ((utf8_strlen(trim($this->request->post['store_zipcode'])) < 3) || (utf8_strlen(trim($this->request->post['store_zipcode'])) > 12)) {
						$this->error['store_zipcode'] = $this->language->get('error_storepostcode');
					}
				}
			}
			
			/* if ((utf8_strlen(trim($this->request->post['store_meta_keywords'])) =='') ) {
				$this->error['store_meta_keywords'] = $this->language->get('error_storemetakeywords');
			}
			
			if ((utf8_strlen(trim($this->request->post['store_meta_description'])) =='') ) {
				$this->error['store_meta_description'] = $this->language->get('error_storemetadescription');
			}
			
			if ((utf8_strlen(trim($this->request->post['store_bank_details'])) =='') ) {
				$this->error['store_bank_details'] = $this->language->get('error_storebankdetail');
			} */
			if(!empty($this->request->post['store_shipping_charge'])){
				if(trim($this->request->post['store_shipping_charge']) < 0){
					$this->error['store_shipping_charge'] = $this->language->get('error_storeshippingcharge');
				} 
			}
			
			if ((!empty($this->request->post['remaining_amount']))) {
				if($this->request->post['seller_amount'] < 0){
					$this->error['seller_amount'] = $this->language->get('error_selleramount');
				}
				if(!empty($this->request->post['seller_amount']) && $this->request->post['remaining_amount'] < $this->request->post['seller_amount']){
					$this->error['seller_amount'] = $this->language->get('error_selleramount');
				}
				if($this->request->post['seller_amount']){
					if(empty($this->request->post['seller_transaction'])){
						$this->error['seller_transaction'] = $this->language->get('error_sellertransaction');
					}
					
				}
				
				}elseif(empty($this->request->post['remaining_amount'])){
				if(!empty($this->request->post['seller_amount']) && $this->request->post['remaining_amount'] < $this->request->post['seller_amount']){
					
					$this->error['seller_amount'] = $this->language->get('error_selleramount');
					
				}
			}
			
			if(trim($this->request->post['store_commission']) > 100){
				$this->error['seller_commission'] = $this->language->get('error_commission');	
				}elseif(trim($this->request->post['store_commission']) > 0 ) {
				if( ! filter_var($this->request->post['store_commission'], FILTER_VALIDATE_FLOAT) ){
					$this->error['seller_commission'] = $this->language->get('error_commission');
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
			if($this->request->post['seller_paypal_id'] != ''){
				$EMAIL_REGEX='/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/';
				
				if (preg_match($EMAIL_REGEX, $this->request->post['seller_paypal_id'])==false)	
				{
					$this->error['seller_paypal_id'] = $this->language->get('error_storeemail');
				}
			}
			
			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
			return !$this->error;
		}
		
		public function invoice() {
			$this->load->language('sale/order');
			
			$data['title'] = $this->language->get('text_invoice');
			
			if ($this->request->server['HTTPS']) {
				$data['base'] = HTTPS_SERVER;
				} else {
				$data['base'] = HTTP_SERVER;
			}
			
			$data['direction'] = $this->language->get('direction');
			$data['lang'] = $this->language->get('code');
			
			$data['text_invoice'] = $this->language->get('text_invoice');
			$data['text_order_detail'] = $this->language->get('text_order_detail');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_invoice_no'] = $this->language->get('text_invoice_no');
			$data['text_invoice_date'] = $this->language->get('text_invoice_date');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_telephone'] = $this->language->get('text_telephone');
			$data['text_fax'] = $this->language->get('text_fax');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_website'] = $this->language->get('text_website');
			$data['text_payment_address'] = $this->language->get('text_payment_address');
			$data['text_shipping_address'] = $this->language->get('text_shipping_address');
			$data['text_payment_method'] = $this->language->get('text_payment_method');
			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_comment'] = $this->language->get('text_comment');
			
			$data['column_product'] = $this->language->get('column_product');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');
			
			$this->load->model('purpletree_multivendor/stores');
			
			$this->load->model('setting/setting');
			
			$data['orders'] = array();
			
			$orders = array();
			
			if (isset($this->request->post['selected'])) {
				$orders = $this->request->post['selected'];
				} elseif (isset($this->request->get['order_id'])) {
				$orders[] = $this->request->get['order_id'];
			}
			
			if(isset($this->request->get['seller_id'])){
				$seller_id = $this->request->get['seller_id'];
				} else{
				$seller_id = 0;
			}
			foreach ($orders as $order_id) {
				$order_info = $this->model_purpletree_multivendor_stores->getOrder($order_id,$seller_id);
				
				if ($order_info) {
					$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
					
					if($this->config->get('purpletree_multivendor_seller_invoice')){
						
						$seller_store = $this->model_purpletree_multivendor_stores->getStoreDetail($seller_id);
						
						$order_info['store_name'] = $seller_store['store_name'];
						$store_address = $seller_store['store_address'];
						$store_email = $seller_store['store_email'];
						$store_telephone = $seller_store['store_phone'];
						$store_fax = '';
						} else {
						if ($store_info) {
							$store_address = $store_info['config_address'];
							$store_email = $store_info['config_email'];
							$store_telephone = $store_info['config_telephone'];
							$store_fax = $store_info['config_fax'];
							} else {
							$store_address = $this->config->get('config_address');
							$store_email = $this->config->get('config_email');
							$store_telephone = $this->config->get('config_telephone');
							$store_fax = $this->config->get('config_fax');
						}
					}
					
					if ($order_info['invoice_no']) {
						$invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
						} else {
						$invoice_no = '';
					}
					
					if ($order_info['payment_address_format']) {
						$format = $order_info['payment_address_format'];
						} else {
						$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
					}
					
					$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
					);
					
					$replace = array(
					'firstname' => $order_info['payment_firstname'],
					'lastname'  => $order_info['payment_lastname'],
					'company'   => $order_info['payment_company'],
					'address_1' => $order_info['payment_address_1'],
					'address_2' => $order_info['payment_address_2'],
					'city'      => $order_info['payment_city'],
					'postcode'  => $order_info['payment_postcode'],
					'zone'      => $order_info['payment_zone'],
					'zone_code' => $order_info['payment_zone_code'],
					'country'   => $order_info['payment_country']
					);
					
					$payment_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
					
					if ($order_info['shipping_address_format']) {
						$format = $order_info['shipping_address_format'];
						} else {
						$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
					}
					
					$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
					);
					
					$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']
					);
					
					$shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
					
					$this->load->model('tool/upload');
					
					$product_data = array();
					
					$products = $this->model_purpletree_multivendor_stores->getSellerOrderProducts($order_id,$seller_id);
					
					$total_shipping = 0;
					$product_total = 0;
					
					foreach ($products as $product) {
						$option_data = array();
						
						$total_shipping += $product['shipping'];
						
						$product_total += $product['total'];
						
						$options = $this->model_purpletree_multivendor_stores->getOrderOptions($order_id, $product['order_product_id']);
						
						foreach ($options as $option) {
							if ($option['type'] != 'file') {
								$value = $option['value'];
								} else {
								$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
								
								if ($upload_info) {
									$value = $upload_info['name'];
									} else {
									$value = '';
								}
							}
							
							$option_data[] = array(
							'name'  => $option['name'],
							'value' => $value
							);
						}
						
						$product_data[] = array(
						'name'     => $product['name'],
						'model'    => $product['model'],
						'option'   => $option_data,
						'quantity' => $product['quantity'],
						'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
						'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
						);
					}
					
					$voucher_data = array();
					
					$vouchers = $this->model_purpletree_multivendor_stores->getOrderVouchers($order_id);
					
					foreach ($vouchers as $voucher) {
						$voucher_data[] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
						);
					}
					
					$total_data = array();
					
					$totals = $this->model_purpletree_multivendor_stores->getOrderTotals($order_id,$this->request->get['seller_id']);
					
					foreach ($totals as $total) {
						$total_data[] = array(
						'title' => $total['title'],
						'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value'])
						);
					}
					
					$data['orders'][] = array(
					'order_id'	       => $order_id,
					'invoice_no'       => $invoice_no,
					'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
					'store_name'       => $order_info['store_name'],
					'store_url'        => rtrim($order_info['store_url'], '/'),
					'store_address'    => nl2br($store_address),
					'store_email'      => $store_email,
					'store_telephone'  => $store_telephone,
					'store_fax'        => $store_fax,
					'email'            => $order_info['email'],
					'telephone'        => $order_info['telephone'],
					'shipping_address' => $shipping_address,
					'shipping_method'  => $order_info['shipping_method'],
					'payment_address'  => $payment_address,
					'payment_method'   => $order_info['payment_method'],
					'product'          => $product_data,
					'voucher'          => $voucher_data,
					'total'            => $total_data,
					'comment'          => nl2br($order_info['comment'])
					);
				}
			}
			
			$this->response->setOutput($this->load->view('sale/order_invoice', $data));
		}
		
		public function shipping() {
			$this->load->language('sale/order');
			
			$data['title'] = $this->language->get('text_shipping');
			
			if ($this->request->server['HTTPS']) {
				$data['base'] = HTTPS_SERVER;
				} else {
				$data['base'] = HTTP_SERVER;
			}
			
			$data['direction'] = $this->language->get('direction');
			$data['lang'] = $this->language->get('code');
			
			$data['text_shipping'] = $this->language->get('text_shipping');
			$data['text_picklist'] = $this->language->get('text_picklist');
			$data['text_order_detail'] = $this->language->get('text_order_detail');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_invoice_no'] = $this->language->get('text_invoice_no');
			$data['text_invoice_date'] = $this->language->get('text_invoice_date');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_telephone'] = $this->language->get('text_telephone');
			$data['text_fax'] = $this->language->get('text_fax');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_website'] = $this->language->get('text_website');
			$data['text_contact'] = $this->language->get('text_contact');
			$data['text_shipping_address'] = $this->language->get('text_shipping_address');
			$data['text_payment_address'] = $this->language->get('text_payment_address');
			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_sku'] = $this->language->get('text_sku');
			$data['text_upc'] = $this->language->get('text_upc');
			$data['text_ean'] = $this->language->get('text_ean');
			$data['text_jan'] = $this->language->get('text_jan');
			$data['text_isbn'] = $this->language->get('text_isbn');
			$data['text_mpn'] = $this->language->get('text_mpn');
			$data['text_comment'] = $this->language->get('text_comment');
			
			$data['column_location'] = $this->language->get('column_location');
			$data['column_reference'] = $this->language->get('column_reference');
			$data['column_product'] = $this->language->get('column_product');
			$data['column_weight'] = $this->language->get('column_weight');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			
			$this->load->model('purpletree_multivendor/stores');
			
			$this->load->model('catalog/product');
			
			$this->load->model('setting/setting');
			
			$data['orders'] = array();
			
			$orders = array();
			
			if (isset($this->request->post['selected'])) {
				$orders = $this->request->post['selected'];
				} elseif (isset($this->request->get['order_id'])) {
				$orders[] = $this->request->get['order_id'];
			}
			
			if(isset($this->request->get['seller_id'])){
				$seller_id = $this->request->get['seller_id'];
				} else{
				$seller_id = 0;
			}
			
			foreach ($orders as $order_id) {
				$order_info = $this->model_purpletree_multivendor_stores->getOrder($order_id,$seller_id);
				
				// Make sure there is a shipping method
				if ($order_info && $order_info['shipping_code']) {
					$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
					
					if($this->config->get('purpletree_multivendor_seller_invoice')){
						
						$seller_store = $this->model_purpletree_multivendor_stores->getStoreDetail($seller_id);
						
						$order_info['store_name'] = $seller_store['store_name'];
						$store_address = $seller_store['store_address'];
						$store_email = $seller_store['store_email'];
						$store_telephone = $seller_store['store_phone'];
						$store_fax = '';
						} else {	
						if ($store_info) {
							$store_address = $store_info['config_address'];
							$store_email = $store_info['config_email'];
							$store_telephone = $store_info['config_telephone'];
							$store_fax = $store_info['config_fax'];
							} else {
							$store_address = $this->config->get('config_address');
							$store_email = $this->config->get('config_email');
							$store_telephone = $this->config->get('config_telephone');
							$store_fax = $this->config->get('config_fax');
						}
					}
					
					if ($order_info['invoice_no']) {
						$invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
						} else {
						$invoice_no = '';
					}
					
					if ($order_info['shipping_address_format']) {
						$format = $order_info['shipping_address_format'];
						} else {
						$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
					}
					
					$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
					);
					
					$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']
					);
					
					$shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
					
					$this->load->model('tool/upload');
					
					$product_data = array();
					
					$products = $this->model_purpletree_multivendor_stores->getSellerOrderProducts($order_id,$seller_id);
					
					foreach ($products as $product) {
						$option_weight = '';
						
						$product_info = $this->model_catalog_product->getProduct($product['product_id']);
						
						if ($product_info) {
							$option_data = array();
							
							$options = $this->model_purpletree_multivendor_stores->getOrderOptions($order_id, $product['order_product_id']);
							
							foreach ($options as $option) {
								if ($option['type'] != 'file') {
									$value = $option['value'];
									} else {
									$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
									
									if ($upload_info) {
										$value = $upload_info['name'];
										} else {
										$value = '';
									}
								}
								
								$option_data[] = array(
								'name'  => $option['name'],
								'value' => $value
								);
								
								$product_option_value_info = $this->model_catalog_product->getProductOptionValue($product['product_id'], $option['product_option_value_id']);
								
								if ($product_option_value_info) {
									if ($product_option_value_info['weight_prefix'] == '+') {
										$option_weight += $product_option_value_info['weight'];
										} elseif ($product_option_value_info['weight_prefix'] == '-') {
										$option_weight -= $product_option_value_info['weight'];
									}
								}
							}
							
							$product_data[] = array(
							'name'     => $product_info['name'],
							'model'    => $product_info['model'],
							'option'   => $option_data,
							'quantity' => $product['quantity'],
							'location' => $product_info['location'],
							'sku'      => $product_info['sku'],
							'upc'      => $product_info['upc'],
							'ean'      => $product_info['ean'],
							'jan'      => $product_info['jan'],
							'isbn'     => $product_info['isbn'],
							'mpn'      => $product_info['mpn'],
							'weight'   => $this->weight->format(($product_info['weight'] + $option_weight) * $product['quantity'], $product_info['weight_class_id'], $this->language->get('decimal_point'), $this->language->get('thousand_point'))
							);
						}
					}
					
					$data['orders'][] = array(
					'order_id'	       => $order_id,
					'invoice_no'       => $invoice_no,
					'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
					'store_name'       => $order_info['store_name'],
					'store_url'        => rtrim($order_info['store_url'], '/'),
					'store_address'    => nl2br($store_address),
					'store_email'      => $store_email,
					'store_telephone'  => $store_telephone,
					'store_fax'        => $store_fax,
					'email'            => $order_info['email'],
					'telephone'        => $order_info['telephone'],
					'shipping_address' => $shipping_address,
					'shipping_method'  => $order_info['shipping_method'],
					'product'          => $product_data,
					'comment'          => nl2br($order_info['comment'])
					);
				}
			}
			
			$this->response->setOutput($this->load->view('sale/order_shipping', $data));
		}
		
		public function historylist() {
			$this->load->language('sale/order');
			
			$data['text_no_results'] = $this->language->get('text_no_results');
			
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_notify'] = $this->language->get('column_notify');
			$data['column_comment'] = $this->language->get('column_comment');
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			
			$data['histories'] = array();
			
			$this->load->model('purpletree_multivendor/stores');
			
			$results = $this->model_purpletree_multivendor_stores->getOrderHistories($this->request->get['order_id'],$this->request->get['seller_id'], ($page - 1) * 10, 10);
			
			foreach ($results as $result) {
				$data['histories'][] = array(
				'notify'     => $result['notify'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
				'status'     => $result['status'],
				'comment'    => nl2br($result['comment']),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['created_at']))
				);
			}
			
			$history_total = $this->model_purpletree_multivendor_stores->getTotalOrderHistories($this->request->get['order_id'],$this->request->get['seller_id']);
			
			$pagination = new Pagination();
			$pagination->total = $history_total;
			$pagination->page = $page;
			$pagination->limit = 10;
			$pagination->url = $this->url->link('purpletree_multivendor/stores/historylist', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] .'&seller_id=' . $this->request->get['seller_id'] . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));
			
			$this->response->setOutput($this->load->view('sale/order_history', $data));
		}
		
		public function approve() {
			$this->load->language('purpletree_multivendor/stores');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/stores');
			
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $store_id) {
					$seller_id=$this->model_purpletree_multivendor_stores->getSellerId($store_id);
					$this->model_purpletree_multivendor_stores->approveSeller($store_id);
					
					///email///
					
					if(!empty($seller_id)) {
						if($seller_id['store_status'] == 0) {
							$customer_info = $this->model_purpletree_multivendor_stores->getCustomerId($seller_id['seller_id']);
							
							if ($customer_info) {	
								
								$this->load->model('setting/store');
								
								$store_info = $this->model_setting_store->getStore($customer_info['store_id']);
								
								if ($store_info) {
									$store_name = $store_info['name'];
									$store_url = $store_info['url'] . 'index.php?route=account/login';
									} else {
									$store_name = $this->config->get('config_name');
									$store_url = HTTP_CATALOG . 'index.php?route=account/login';
								}
								
								$this->load->model('localisation/language');
								
								$language_info = $this->model_localisation_language->getLanguage($customer_info['language_id']);
								
								if ($language_info) {
									$language_code = $language_info['code'];
									} else {
									$language_code = $this->config->get('config_language');
								}
								
								$language = new Language($language_code);
								$language->load($language_code);
								$language->load('mail/customer');
								$this->load->model('purpletree_multivendor/mails');	
								
								$mail_subject_vars=array(
								'_STORE_NAME_'=>$store_name,
								);
								
								$mail_msg_vars=array(
								'_STORE_NAME_'=>$store_name,
								'_SELLER_LOGIN_'=>$store_url,
								);

						$emailTemplate=$this->model_purpletree_multivendor_mails->getEmailTemplate('admin_seller_store_approve_by_admin');

						$subject=$this->model_purpletree_multivendor_mails->replaceVariables($mail_subject_vars,$emailTemplate['new_subject']);
						$message=$this->model_purpletree_multivendor_mails->replaceVariables($mail_msg_vars,$emailTemplate['new_message']);
						$this->model_purpletree_multivendor_mails->sendMail($customer_info['email'],$subject,$message);
							} 
						}
					}///end email////
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = null;
				}
				
				/* if (isset($this->request->get['filter_email'])) {
					$filter_email = $this->request->get['filter_email'];
					} else {
					$filter_email = null;
				} */
				
				if (isset($this->request->get['filter_status'])) {
					$filter_status = $this->request->get['filter_status'];
					} else {
					$filter_status = null;
				}
				
				if (isset($this->request->get['filter_date_added'])) {
					$filter_date_added = $this->request->get['filter_date_added'];
					} else {
					$filter_date_added = null;
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->index();
		}
		
		public function disapprove() {
			
			$this->load->language('purpletree_multivendor/stores');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/stores');
			
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $store_id) {
					$this->model_purpletree_multivendor_stores->disapproveSeller($store_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = null;
				}
				
				/* if (isset($this->request->get['filter_email'])) {
					$filter_email = $this->request->get['filter_email'];
					} else {
					$filter_email = null;
				} */
				
				if (isset($this->request->get['filter_status'])) {
					$filter_status = $this->request->get['filter_status'];
					} else {
					$filter_status = null;
				}
				
				if (isset($this->request->get['filter_date_added'])) {
					$filter_date_added = $this->request->get['filter_date_added'];
					} else {
					$filter_date_added = null;
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('purpletree_multivendor/stores', 'token=' . $this->session->data['token'] . $url, true));
			}
			
			$this->index();
		}
		
		public function autocomplete() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				/* if (isset($this->request->get['filter_email'])) {
					$filter_email = $this->request->get['filter_email'];
					} else {
					$filter_email = '';
				} */
				
				$this->load->model('purpletree_multivendor/stores');
				
				$filter_data = array(
				'filter_name'  => $filter_name,
				//'filter_email' => $filter_email,
				'start'        => 0,
				'limit'        => 5
				);
				
				$results = $this->model_purpletree_multivendor_stores->getStores($filter_data);
				
				foreach ($results as $result) {
					$json[] = array(
					'customer_id'       => $result['customer_id'],
					'name'              => strip_tags(html_entity_decode($result['store_name'], ENT_QUOTES, 'UTF-8')),
					//'email'             => $result['store_email']
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
        public function getrealpath($filename,$realfile) {
		if (!is_file(DIR_UPLOAD . $filename) || substr(str_replace('\\', '/', realpath(DIR_UPLOAD . $filename)), 0, strlen(DIR_UPLOAD)) != str_replace('\\', '/', DIR_UPLOAD)) {
			return;
		}

		 $extension = pathinfo($realfile, PATHINFO_EXTENSION);
		 $image_old = $realfile;
		 $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.'));

		if (!is_file(DIR_IMAGE . $image_new)) {
			
			$path = '';

			$directories = explode('/', dirname($image_new));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_UPLOAD . $path)) {
					@mkdir(DIR_UPLOAD . $path, 0777);
				}
			}
				copy(DIR_UPLOAD . $filename, DIR_IMAGE . $image_new);
		}
		
		$image_new = str_replace(' ', '%20', $image_new);  // fix bug when attach image on email (gmail.com). it is automatic changing space " " to +
		
		if ($this->request->server['HTTPS']) {
			return HTTPS_CATALOG . 'image/' . $image_new;
		} else {
			return HTTP_CATALOG . 'image/' . $image_new;
		}
	}
		public function generateVideoEmbedUrl($url){
			$finalUrl = '';
			if(strpos($url, 'facebook.com/') !== false) {
				$finalUrl.=$url;
				}else if(strpos($url, 'vimeo.com/') !== false) {
				$videoId = explode("vimeo.com/",$url);
				if(strpos($videoId, '&') !== false){
					$videoId = explode("&",$videoId)[0];
				}
				$finalUrl.='https://player.vimeo.com/embed/'.$videoId;
				}else if(strpos($url, 'https://player.vimeo.com/embed/') !== false) {
				return $this->request->post['store_video'];
				}else if(strpos($url, 'https://www.youtube.com/embed/') !== false) {
				return $this->request->post['store_video'];
				} else if(strpos($url, 'youtube.com/') !== false) {
				$videoId = explode("v=",$url)[1];
				if(strpos($videoId, '&') !== false){
					$videoId = explode("&",$videoId)[0];
				}
				$finalUrl.='https://www.youtube.com/embed/'.$videoId;
				}else if(strpos($url, 'youtu.be/') !== false){
				$videoId = explode("youtu.be/",$url)[1];
				if(strpos($videoId, '&') !== false){
					$videoId = explode("&",$videoId)[0];
				}
				$finalUrl.='https://www.youtube.com/embed/'.$videoId;
				}else if(strpos($url, 'dailymotion.com/embed/') !== false) {
				return $this->request->post['store_video'];
				} else if(strpos($url, 'dailymotion.com/') !== false) {
				$videoId = explode("dailymotion.com/",$url)[1];
				if(strpos($videoId, '&') !== false){
					$videoId = explode("&",$videoId)[0];
				}
				$finalUrl.='https://www.dailymotion.com/embed/'.$videoId;
				}else if(strpos($url, 'youku.com/') !== false) {
				$videoId = explode("youku.com/",$url)[1];
				if(strpos($videoId, '&') !== false){
					$videoId = explode("&",$videoId)[0];
				}
				$finalUrl.='https://v.youku.com/v_show/'.$videoId;
			} 
			return $finalUrl;
		}
		public function getSubscriptionPlan() {
			$json = array();
			$this->load->language('purpletree_multivendor/stores');
			if (isset($this->request->get['seller_id']) and isset($this->request->get['product_id']) and isset($this->request->get['plan_id'])) {
				
				if (isset($this->request->get['seller_id'])) {
					$seller_id = $this->request->get['seller_id'];
					} else {
					$seller_id = '';
				}
				
				if (isset($this->request->get['product_id'])) {
					$product_id = $this->request->get['product_id'];
					} else {
					$product_id = '';
				}
				
				if (isset($this->request->get['plan_id'])) {
					$plan_id = $this->request->get['plan_id'];
					} else {
					$plan_id = '';
				}
				
				$this->load->model('purpletree_multivendor/stores');
				$data=array();
				$data=array(
				'seller_id'=>$seller_id,
				'product_id'=>$product_id,
				'plan_id'=>$plan_id
				);
				
				$check = $this->model_purpletree_multivendor_stores->checkSubscriptionPlan($data);
				if($check){
					$results = $this->model_purpletree_multivendor_stores->assignSellerProduct($data);
					$json['product_id']=$product_id;
					$json['success']=$this->language->get('text_sub_success');
					} else {
					$json['error']=$this->language->get('text_sub_error');	
				}
				
				
				
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		public function refundupdate() {
			if (isset($this->request->post['code'])) {
				$this->load->model('purpletree_multivendor/stores');
				$this->model_purpletree_multivendor_stores->updateRefund($this->request->post);
			}
			$url = '';
			if(isset($this->request->post['refund_order_id'])){
				$order_id = $this->request->post['refund_order_id'];
				$seller_id = $this->request->post['return_seller_id'];
				$this->response->redirect($this->url->link('purpletree_multivendor/stores/seller_order_info', 'token=' . $this->session->data['token'] . '&order_id=' .$order_id.'&seller_id='.$seller_id . $url, true));
				}else{
				$this->response->redirect($this->url->link('purpletree_multivendor/sellerorders', 'token=' . $this->session->data['token'] . $url, true));
			}      
		}
			// seller area
		public function sellerarea() {
		
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('purpletree_multivendor/stores');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);
            $results = $this->model_purpletree_multivendor_stores->getSellerAreas($filter_data);
			foreach ($results as $result) {
				$json[] = array(
					'area_id' => $result['area_id'],
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
	// end seller area
		
}
?>