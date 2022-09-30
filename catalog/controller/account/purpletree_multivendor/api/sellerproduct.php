<?php
class ControllerAccountPurpletreeMultivendorApiSellerproduct extends Controller{
		private $error = array();
		private $json = array();
		public function index(){
			$this->load->language('purpletree_multivendor/api');
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
			
			$this->load->language('purpletree_multivendor/sellerproduct');	
			$this->load->model('purpletree_multivendor/sellerproduct');
			
			$json = $this->getList();
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}	
		
		public function add() {
			$this->load->language('purpletree_multivendor/api');
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
			$this->load->language('purpletree_multivendor/sellerproduct');		
			$this->load->model('purpletree_multivendor/sellerproduct');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_purpletree_multivendor_sellerproduct->addProduct($this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
                $json['status'] = 'success';
			    $json['message'] = $this->language->get('text_success');
			}
			
			$json = $this->getForm();
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		public function edit() {
			
			$this->load->language('purpletree_multivendor/api');
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
			$this->load->language('purpletree_multivendor/sellerproduct');		
			$this->load->model('purpletree_multivendor/sellerproduct');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_purpletree_multivendor_sellerproduct->editProduct($this->request->get['product_id'],$this->request->post);
				
				$this->session->data['success'] = $this->language->get('text_success');
				$json['status'] = 'success';
				$json['message'] = $this->language->get('text_success');
			}
			
			$json = $this->getForm();		
			
			
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		public function copy() {
			$this->load->language('purpletree_multivendor/api');
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			$json['status'] = 'error';
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
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$this->load->model('purpletree_multivendor/sellerproduct');
			
			if (isset($this->request->post['selected'])) {
				
				foreach ($this->request->post['selected'] as $product_id) {
					$seller_id = $this->customer->getId();
					$this->model_purpletree_multivendor_sellerproduct->copyProduct($product_id, $seller_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
			    $json['status'] = 'success';
			    $json['message'] = $this->language->get('text_success');
			}
			$json = $this->getForm();
			$this->response->addHeader('Content-Type: application/json');
			return $this->response->setOutput(json_encode($json));
		}
		
		protected function getForm() {
			
			$json['data']['text_form'] = !isset($this->request->get['product_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			
			
			if (isset($this->error['warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['warning'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['name'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['name'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['meta_title'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['meta_title'];
				return $json;
				} else {
				$json['message'] = '';			
			}
			
			
			if (isset($this->error['model'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['model'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->error['keyword'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['keyword'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			$seller_id = $this->customer->getId();
			
			if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$product_info = $this->model_purpletree_multivendor_sellerproduct->getProduct($this->request->get['product_id'],$seller_id);
			}
			
			$this->load->model('localisation/language');
			
			$json['data']['languages'] = $this->model_localisation_language->getLanguages();
			
			
			
			$json['data']['related_approval'] = $this->config->get('purpletree_multivendor_allow_related_product');
			$json['data']['limit_approval'] = $this->config->get('purpletree_multivendor_product_limit');
			
			$json['data']['seller_id'] = $seller_id;
			$json['data']['seller_name'] = $this->customer->getFirstName()." ".$this->customer->getLastName();
			
			$json['data']['is_approved'] = (isset($product_info['is_approved'])?$product_info['is_approved']:'');
			
			if (isset($this->request->post['product_description'])) {
				$json['data']['product_description'] = $this->request->post['product_description'];
				} elseif (isset($this->request->get['product_id'])) {
				$json['data']['product_description'] = $this->model_purpletree_multivendor_sellerproduct->getProductDescriptions($this->request->get['product_id']);
			} 
			
			
			
			if (isset($this->request->post['model'])) {
				$json['data']['model'] = $this->request->post['model'];
				} elseif (!empty($product_info)) {
				$json['data']['model'] = $product_info['model'];
			} 
			
			if (isset($this->request->post['sku'])) {
				$json['data']['sku'] = $this->request->post['sku'];
				} elseif (!empty($product_info)) {
				$json['data']['sku'] = $product_info['sku'];
			} 
			
			if (isset($this->request->post['upc'])) {
				$json['data']['upc'] = $this->request->post['upc'];
				} elseif (!empty($product_info)) {
				$json['data']['upc'] = $product_info['upc'];
			} 
			
			if (isset($this->request->post['ean'])) {
				$json['data']['ean'] = $this->request->post['ean'];
				} elseif (!empty($product_info)) {
				$json['data']['ean'] = $product_info['ean'];
			} 
			
			if (isset($this->request->post['jan'])) {
				$json['data']['jan'] = $this->request->post['jan'];
				} elseif (!empty($product_info)) {
				$json['data']['jan'] = $product_info['jan'];
			}
			
			if (isset($this->request->post['isbn'])) {
				$json['data']['isbn'] = $this->request->post['isbn'];
				} elseif (!empty($product_info)) {
				$json['data']['isbn'] = $product_info['isbn'];
			} 
			
			if (isset($this->request->post['mpn'])) {
				$json['data']['mpn'] = $this->request->post['mpn'];
				} elseif (!empty($product_info)) {
				$json['data']['mpn'] = $product_info['mpn'];
			} 
			
			if (isset($this->request->post['location'])) {
				$json['data']['location'] = $this->request->post['location'];
				} elseif (!empty($product_info)) {
				$json['data']['location'] = $product_info['location'];
			} 
			
			$this->load->model('setting/store');
			
			$json['data']['stores'] = array();
			
			$json['data']['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
			);
			
			$stores = $this->model_setting_store->getStores();
			
			foreach ($stores as $store) {
				$json['data']['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
				);
			}
			
			if (isset($this->request->post['product_store'])) {
				$json['data']['product_store'] = $this->request->post['product_store'];
				} elseif (isset($this->request->get['product_id'])) {
				$json['data']['product_store'] = $this->model_purpletree_multivendor_sellerproduct->getProductStores($this->request->get['product_id']);
			}
			if (isset($this->request->post['keyword'])) {
				$json['data']['keyword'] = $this->request->post['keyword'];
				} elseif (!empty($product_info)) {
				$json['data']['keyword'] = $product_info['keyword'];
			} 
			
			if (isset($this->request->post['shipping'])) {
				$json['data']['shipping'] = $this->request->post['shipping'];
				} elseif (!empty($product_info)) {
				$json['data']['shipping'] = $product_info['shipping'];
			} 
			
			if (isset($this->request->post['price'])) {
				$json['data']['price'] = $this->request->post['price'];
				} elseif (!empty($product_info)) {
				$json['data']['price'] = $product_info['price'];
			} 
			
			$this->load->model('localisation/tax_class');
			
			$json['data']['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
			
			if (isset($this->request->post['tax_class_id'])) {
				$json['data']['tax_class_id'] = $this->request->post['tax_class_id'];
				} elseif (!empty($product_info)) {
				$json['data']['tax_class_id'] = $product_info['tax_class_id'];
			}
			
			if (isset($this->request->post['date_available'])) {
				$json['data']['date_available'] = $this->request->post['date_available'];
				} elseif (!empty($product_info)) {
				$json['data']['date_available'] = ($product_info['date_available'] != '0000-00-00') ? $product_info['date_available'] : '';
			} 
			
			if (isset($this->request->post['quantity'])) {
				$json['data']['quantity'] = $this->request->post['quantity'];
				} elseif (!empty($product_info)) {
				$json['data']['quantity'] = $product_info['quantity'];
			} 
			
			if (isset($this->request->post['minimum'])) {
				$json['data']['minimum'] = $this->request->post['minimum'];
				} elseif (!empty($product_info)) {
				$json['data']['minimum'] = $product_info['minimum'];
			} 
			
			if (isset($this->request->post['subtract'])) {
				$json['data']['subtract'] = $this->request->post['subtract'];
				} elseif (!empty($product_info)) {
				$json['data']['subtract'] = $product_info['subtract'];
			} 
			
			if (isset($this->request->post['sort_order'])) {
				$json['data']['sort_order'] = $this->request->post['sort_order'];
				} elseif (!empty($product_info)) {
				$json['data']['sort_order'] = $product_info['sort_order'];
			} 
			
			$this->load->model('localisation/stock_status');
			
			$json['data']['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();
			
			if (isset($this->request->post['stock_status_id'])) {
				$json['data']['stock_status_id'] = $this->request->post['stock_status_id'];
				} elseif (!empty($product_info)) {
				$json['data']['stock_status_id'] = $product_info['stock_status_id'];
			} 
			
			if (isset($this->request->post['status'])) {
				$json['data']['status'] = $this->request->post['status'];
				} elseif (!empty($product_info)) {
				$json['data']['status'] = $product_info['status'];
			} 
			
			if (isset($this->request->post['weight'])) {
				$json['data']['weight'] = $this->request->post['weight'];
				} elseif (!empty($product_info)) {
				$json['data']['weight'] = $product_info['weight'];
			} 
			
			$this->load->model('localisation/weight_class');
			
			$json['data']['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();
			
			if (isset($this->request->post['weight_class_id'])) {
				$json['data']['weight_class_id'] = $this->request->post['weight_class_id'];
				} elseif (!empty($product_info)) {
				$json['data']['weight_class_id'] = $product_info['weight_class_id'];
			} 
			
			if (isset($this->request->post['length'])) {
				$json['data']['length'] = $this->request->post['length'];
				} elseif (!empty($product_info)) {
				$json['data']['length'] = $product_info['length'];
			} 
			
			if (isset($this->request->post['width'])) {
				$json['data']['width'] = $this->request->post['width'];
				} elseif (!empty($product_info)) {
				$json['data']['width'] = $product_info['width'];
			} 
			
			if (isset($this->request->post['height'])) {
				$json['data']['height'] = $this->request->post['height'];
				} elseif (!empty($product_info)) {
				$json['data']['height'] = $product_info['height'];
			} 
			
			$this->load->model('localisation/length_class');
			
			$json['data']['length_classes'] = $this->model_localisation_length_class->getLengthClasses();
			
			if (isset($this->request->post['length_class_id'])) {
				$json['data']['length_class_id'] = $this->request->post['length_class_id'];
				} elseif (!empty($product_info)) {
				$json['data']['length_class_id'] = $product_info['length_class_id'];
			}
			$this->load->model('catalog/manufacturer');
			
			if (isset($this->request->post['manufacturer_id'])) {
				$json['data']['manufacturer_id'] = $this->request->post['manufacturer_id'];
				} elseif (!empty($product_info)) {
				$json['data']['manufacturer_id'] = $product_info['manufacturer_id'];
			} 
			
			if (isset($this->request->post['manufacturer'])) {
				$json['data']['manufacturer'] = $this->request->post['manufacturer'];
				} elseif (!empty($product_info)) {
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);
				
				if ($manufacturer_info) {
					$json['data']['manufacturer'] = $manufacturer_info['name'];
				} 
			} 
			
			
			// Categories
			$this->load->model('catalog/category');
			
			if (isset($this->request->post['product_category'])) {
				$categories = $this->request->post['product_category'];
				} elseif (isset($this->request->get['product_id'])) {
				$categories = $this->model_purpletree_multivendor_sellerproduct->getProductCategories($this->request->get['product_id']);
			} 
			
			//$json['data']['product_categories'] = array();
			
			if(!empty($categories)) {
				foreach ($categories as $category_id) {
					$category_info = $this->model_purpletree_multivendor_sellerproduct->getCategory($category_id);
					
					if ($category_info) {
						$json['data']['product_categories'][] = array(
						'category_id' => $category_info['category_id'],
						'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
						);
					}
				}
			}
			// Filters
			$this->load->model('catalog/filter');
			
			if (isset($this->request->post['product_filter'])) {
				$filters = $this->request->post['product_filter'];
				} elseif (isset($this->request->get['product_id'])) {
				$filters = $this->model_purpletree_multivendor_sellerproduct->getProductFilters($this->request->get['product_id']);
			} 
			
			//$json['data']['product_filters'] = array();
			if(!empty($filters)) {
				foreach ($filters as $filter_id) {
					$filter_info = $this->model_catalog_filter->getFilter($filter_id);
					
					if ($filter_info) {
						$json['data']['product_filters'][] = array(
						'filter_id' => $filter_info['filter_id'],
						'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
						);
					}
				}
			}
			// Attributes
			$this->load->model('catalog/attribute');
			
			if (isset($this->request->post['product_attribute'])) {
				$product_attributes = $this->request->post['product_attribute'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_attributes = $this->model_purpletree_multivendor_sellerproduct->getProductAttributes($this->request->get['product_id']);
			} 
			
			
			
			//$json['data']['product_attributes'] = array();
			if(!empty($product_attributes)) {
				foreach ($product_attributes as $product_attribute) {
					$attribute_info = $this->model_catalog_attribute->getAttribute($product_attribute['attribute_id']);
					
					if ($attribute_info) {
						$json['data']['product_attributes'][] = array(
						'attribute_id'                  => $product_attribute['attribute_id'],
						'name'                          => $attribute_info['name'],
						'product_attribute_description' => $product_attribute['product_attribute_description']
						);
					}
				}
			}
			// Options
			$this->load->model('catalog/option');
			
			if (isset($this->request->post['product_option'])) {
				$product_options = $this->request->post['product_option'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_options = $this->model_purpletree_multivendor_sellerproduct->getProductOptions($this->request->get['product_id']);
			} 
			
			//$json['data']['product_options'] = array();
			if(!empty($product_options)) {
				foreach ($product_options as $product_option) {
					$product_option_value_data = array();
					
					if (isset($product_option['product_option_value'])) {
						foreach ($product_option['product_option_value'] as $product_option_value) {
							$product_option_value_data[] = array(
							'product_option_value_id' => $product_option_value['product_option_value_id'],
							'option_value_id'         => $product_option_value['option_value_id'],
							'quantity'                => $product_option_value['quantity'],
							'subtract'                => $product_option_value['subtract'],
							'price'                   => $product_option_value['price'],
							'price_prefix'            => $product_option_value['price_prefix'],
							'points'                  => $product_option_value['points'],
							'points_prefix'           => $product_option_value['points_prefix'],
							'weight'                  => $product_option_value['weight'],
							'weight_prefix'           => $product_option_value['weight_prefix']
							);
						}
					}
				}
				$json['data']['product_options'][] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => isset($product_option['value']) ? $product_option['value'] : '',
				'required'             => $product_option['required']
				);
			}
			
			//$json['data']['option_values'] = array();
			if(isset($json['data']['product_options']) && !empty($json['data']['product_options'])){
				foreach ($json['data']['product_options'] as $product_option) {
					if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
						if (!isset($json['data']['option_values'][$product_option['option_id']])) {
							$json['data']['option_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
						}
					}
				}
			}
			$this->load->model('purpletree_multivendor/customer_group');
			
			$json['data']['customer_groups'] = $this->model_purpletree_multivendor_customer_group->getCustomerGroups();
			
			if (isset($this->request->post['product_discount'])) {
				$product_discounts = $this->request->post['product_discount'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_discounts = $this->model_purpletree_multivendor_sellerproduct->getProductDiscounts($this->request->get['product_id']);
			} 
			
			//$json['data']['product_discounts'] = array();
			if(!empty($product_options)) {
				foreach ($product_discounts as $product_discount) {
					$json['data']['product_discounts'][] = array(
					'customer_group_id' => $product_discount['customer_group_id'],
					'quantity'          => $product_discount['quantity'],
					'priority'          => $product_discount['priority'],
					'price'             => $product_discount['price'],
					'date_start'        => ($product_discount['date_start'] != '0000-00-00') ? $product_discount['date_start'] : '',
					'date_end'          => ($product_discount['date_end'] != '0000-00-00') ? $product_discount['date_end'] : ''
					);
				}
			}
			if (isset($this->request->post['product_special'])) {
				$product_specials = $this->request->post['product_special'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($this->request->get['product_id']);
			} 
			
			//$json['data']['product_specials'] = array();
			if(!empty($product_options)) {
				foreach ($product_specials as $product_special) {
					$json['data']['product_specials'][] = array(
					'customer_group_id' => $product_special['customer_group_id'],
					'priority'          => $product_special['priority'],
					'price'             => $product_special['price'],
					'date_start'        => ($product_special['date_start'] != '0000-00-00') ? $product_special['date_start'] : '',
					'date_end'          => ($product_special['date_end'] != '0000-00-00') ? $product_special['date_end'] :  ''
					);
				}
			}
			// Image
			if (isset($this->request->post['image'])) {
				$json['data']['image'] = $this->request->post['image'];
				} elseif (!empty($product_info)) {
				$json['data']['image'] = $product_info['image'];
			}
			
			$this->load->model('tool/image');
			
			if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
				$json['data']['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
				} elseif (!empty($product_info) && is_file(DIR_IMAGE . $product_info['image'])) {
				$json['data']['thumb'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
				} else {
				$json['data']['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			$json['data']['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			
			// Images
			if (isset($this->request->post['product_image'])) {
				$product_images = $this->request->post['product_image'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_images = $this->model_purpletree_multivendor_sellerproduct->getProductImages($this->request->get['product_id']);
			} 
			
			//$json['data']['product_images'] = array();
			if(!empty($product_images)) {
				foreach ($product_images as $product_image) {
					if (is_file(DIR_IMAGE . $product_image['image'])) {
						$image = $product_image['image'];
						$thumb = $product_image['image'];
						} else {
						$image = '';
						$thumb = 'no_image.png';
					}
					
					$json['data']['product_images'][] = array(
					'image'      => $image,
					'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
					'sort_order' => $product_image['sort_order']
					);
				}
			}
			// Downloads
			$this->load->model('catalog/download');
			
			if (isset($this->request->post['product_download'])) {
				$product_downloads = $this->request->post['product_download'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_downloads = $this->model_purpletree_multivendor_sellerproduct->getProductDownloads($this->request->get['product_id']);
			} 
			
			//$json['data']['product_downloads'] = array();
			if(!empty($product_downloads)) {
				foreach ($product_downloads as $download_id) {
					$download_info = $this->model_catalog_download->getDownload($download_id);
					
					if ($download_info) {
						$json['data']['product_downloads'][] = array(
						'download_id' => $download_info['download_id'],
						'name'        => $download_info['name']
						);
					}
				}
			}
			if (isset($this->request->post['product_related'])) {
				$products = $this->request->post['product_related'];
				} elseif (isset($this->request->get['product_id'])) {
				$products = $this->model_purpletree_multivendor_sellerproduct->getProductRelated($this->request->get['product_id']);
			} 
			
			//$json['data']['product_relateds'] = array();
			if(!empty($products)) {
				foreach ($products as $product_id) {
					$related_info = $this->model_purpletree_multivendor_sellerproduct->getProduct($product_id);
					
					if ($related_info) {
						$json['data']['product_relateds'][] = array(
						'product_id' => $related_info['product_id'],
						'name'       => $related_info['name']
						);
					}
				}
			}
			if (isset($this->request->post['points'])) {
				$json['data']['points'] = $this->request->post['points'];
				} elseif (!empty($product_info)) {
				$json['data']['points'] = $product_info['points'];
			} 
			
			if (isset($this->request->post['product_reward'])) {
				$json['data']['product_reward'] = $this->request->post['product_reward'];
				} elseif (isset($this->request->get['product_id'])) {
				$json['data']['product_reward'] = $this->model_purpletree_multivendor_sellerproduct->getProductRewards($this->request->get['product_id']);
			}		
			
			//print_r($json); die;
			
			$json['status'] = 'success';
			return $json;
		}
		
		public function delete() {
			$json['status'] = 'error';
			$json['message'] = $this->language->get('no_data');
			$this->load->language('purpletree_multivendor/api');
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
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->load->model('purpletree_multivendor/sellerproduct');		
			
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $product_id) {
					$this->model_purpletree_multivendor_sellerproduct->deleteProduct($product_id);
				}
				
				$json['status'] = 'success';
				$json['message'] = $this->language->get('text_success');
				$json = $this->getList();
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		protected function getList(){
			
			$json['data']['text_all'] = $this->language->get('text_all');
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
				} else {
				$filter_name = null;
			}
			
			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
				} else {
				$filter_model = null;
			}
			
			if (isset($this->request->get['filter_price'])) {
				$filter_price = $this->request->get['filter_price'];
				} else {
				$filter_price = null;
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$filter_quantity = $this->request->get['filter_quantity'];
				} else {
				$filter_quantity = null;
			}
			
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
				} else {
				$filter_status = null;
			}
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
				} else {
				$sort = 'pd.name';
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
			
			if (isset($this->error['warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['warning'];
				return $json;
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->session->data['success'])) {
				$json['status'] = 'success';
				$json['message'] = $this->session->data['success'];
				return $json;
				
				unset($this->session->data['success']);
				} else {
				$json['message'] = '';
			}
			
			if (isset($this->session->data['error_warning'])) {
				$json['status'] = 'error';
				$json['message'] = $this->error['warning'];
				return $json;
				
				unset($this->session->data['error_warning']);
				} else {
				$json['message'] = '';
			}
			$json['data']['products'] = array();
			
			$filter_data = array(
			'filter_name'	  => $filter_name,
			'filter_model'	  => $filter_model,
			'filter_price'	  => $filter_price,
			'filter_quantity' => $filter_quantity,
			'filter_status'   => $filter_status,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin'),
			'seller_id'		  => $this->customer->getId()	
			);
			
			$product_total = $this->model_purpletree_multivendor_sellerproduct->getTotalSellerProducts($filter_data);
			$seller_id = $this->customer->getId();	
			$results = $this->model_purpletree_multivendor_sellerproduct->getSellerProducts($filter_data);
			
			$this->load->model('tool/image');
			
			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], 40, 40);
					} else {
					$image = $this->model_tool_image->resize('no_image.png', 40, 40);
				}
				
				$special = false;
				
				$product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($result['product_id']);
				
				foreach ($product_specials  as $product_special) {
					if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
						$special = $product_special['price'];
						
						break;
					}
				}
				$json['data']['products'][] = array(
				'product_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $result['price'],				
				'special'    => $special,
				'quantity'   => $result['quantity'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'is_approved'     => $result['is_approved'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
				);
				$json['status'] = 'success';
			}
			
			if (isset($this->request->post['selected'])) {
				$json['data']['selected'] = (array)$this->request->post['selected'];
				} else {
				$json['data']['selected'] = array();
			}
			$json['data']['pagination']['total'] = $product_total;
			$json['data']['pagination']['page'] = $page;
			$json['data']['pagination']['limit'] = $this->config->get('config_limit_admin');
			
			$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));
			
			$json['data']['filter_name'] = $filter_name;
			$json['data']['filter_model'] = $filter_model;
			$json['data']['filter_price'] = $filter_price;
			$json['data']['filter_quantity'] = $filter_quantity;
			$json['data']['filter_status'] = $filter_status;
			
			$json['data']['sort'] = $sort;
			$json['data']['order'] = $order;
			
			
			return $json;
		}
		
		protected function validateForm() {
			foreach ($this->request->post['product_description'] as $language_id => $value) {
				if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
				
				if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
					$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
				}
			}
			
			
			if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
				$this->error['model'] = $this->language->get('error_model');
			}
			
			if (utf8_strlen($this->request->post['keyword']) > 0) {
				$this->load->model('catalog/url_alias');
				
				$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);
				
				if ($url_alias_info && isset($this->request->get['product_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['product_id']) {
					$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
				}
				
				if ($url_alias_info && !isset($this->request->get['product_id'])) {
					$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
				}
			}
			
			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
			return !$this->error;
		}
		
		public function autocomplete() {
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
			$json['data'] = array();
			
			if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
				
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				if (isset($this->request->get['filter_model'])) {
					$filter_model = $this->request->get['filter_model'];
					} else {
					$filter_model = '';
				}
				
				if (isset($this->request->get['limit'])) {
					$limit = $this->request->get['limit'];
					} else {
					$limit = 5;
				}
				
				$seller_id = $this->customer->getId();		
				
				$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit,
				'seller_id' => $seller_id
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getProducts($filter_data);
				
				foreach ($results as $result) {
					$option_data = array();
					
					$product_options = $this->model_purpletree_multivendor_sellerproduct->getProductOptions($result['product_id']);
					
					foreach ($product_options as $product_option) {
						$option_info = $this->model_purpletree_multivendor_sellerproduct->getOptions($product_option['option_id']);
						
						if ($option_info) {
							$product_option_value_data = array();
							
							foreach ($product_option['product_option_value'] as $product_option_value) {
								$option_value_info = $this->model_purpletree_multivendor_sellerproduct->getOptionValue($product_option_value['option_value_id']);
								
								if ($option_value_info) {
									$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
									);
								}
							}
							
							$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							//'name'                 => $option_info['name'],
							//'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
							);
						}
					}
					
					$json['data'][] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function manufacturer() {
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
			
			$json['data'] = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getManufacturers($filter_data);
				
				foreach ($results as $result) {
					$json['data'][] = array(
					'manufacturer_id' => $result['manufacturer_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
			}
			
			$sort_order = array();
			if(!empty($json['data'])) {
				foreach ($json['data'] as $key => $value) {
					$sort_order[$key] = $value['name'];
				}
			}
			
			array_multisort($sort_order, SORT_ASC, $json['data']);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function category() {
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
			$json['data'] = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				//$data11['category_type'] = $this->config->get('purpletree_multivendor_allow_categorytype');
				// $data11['category_allow'] = implode(',',$this->config->get('purpletree_multivendor_allow_category'));
				$allowed=array();
				if($this->config->get('purpletree_multivendor_allow_categorytype')) {
					$this->load->model('catalog/category');
					$results = $this->model_catalog_category->getCategories();
					foreach ($results as $result) {
						$allowed[] = $result['category_id'];
					}
					} else {
					$allowed =$this->config->get('purpletree_multivendor_allow_category');
				}
				$category_allowss = '';
				if(!empty($allowed)) {
					$category_allowss = implode(',',$allowed);
				}
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5,
				'category_type' => ($this->config->get('purpletree_multivendor_allow_categorytype')),
				'category_allow' => $category_allowss,
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getCategories($filter_data);
				
				foreach ($results as $result) {
					$json['data'][] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
					$json['status'] = 'success';
				    $json['message'] = '';
				}
			}
			
			$sort_order = array();
			if(!empty($json['data'])) {
				foreach ($json['data'] as $key => $value) {
					$sort_order[$key] = $value['name'];
				}
			}
			array_multisort($sort_order, SORT_ASC, $json['data']);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function filter() {
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
			$json['data'] = array();
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				
				$filters = $this->model_purpletree_multivendor_sellerproduct->getFilters($filter_data);
				
				foreach ($filters as $filter) {
					$json['data'][]= array(
					'filter_id' => $filter['filter_id'],
					'name'      => strip_tags(html_entity_decode($filter['group'] . ' &gt; ' . $filter['name'], ENT_QUOTES, 'UTF-8'))
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
			}
			
			$sort_order = array();
			if(!empty($json['data'])) {
				foreach ($json['data'] as $key => $value) {
					$sort_order[$key] = $value['name'];
				}
			}
			array_multisort($sort_order, SORT_ASC, $json['data']);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function download() {
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
			$json['data'] = array();
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5,
				'seller_id'		  => $this->customer->getId()
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getDownloads($filter_data);
				
				foreach ($results as $result) {
					$json['data'][] = array(
					'download_id' => $result['download_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
			}
			
			$sort_order = array();
			if(!empty($json['data'])) {
				foreach ($json['data'] as $key => $value) {
					$sort_order[$key] = $value['name'];
				}
			}
			
			array_multisort($sort_order, SORT_ASC, $json['data']);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function product() {
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
			$json['data'] = array();
			if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
				$this->load->model('catalog/product');
				$this->load->model('catalog/option');
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				if (isset($this->request->get['filter_model'])) {
					$filter_model = $this->request->get['filter_model'];
					} else {
					$filter_model = '';
				}
				
				if (isset($this->request->get['limit'])) {
					$limit = $this->request->get['limit'];
					} else {
					$limit = 5;
				}
				
				$seller_id = $this->customer->getId();
				
				$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit,
				'seller_id'        => $seller_id
				);
				
				$this->load->model('purpletree_multivendor/sellerproduct');
				$results = $this->model_purpletree_multivendor_sellerproduct->getProducts($filter_data);
				
				foreach ($results as $result) {
					$option_data = array();
					
					$product_options = $this->model_catalog_product->getProductOptions($result['product_id']);
					
					foreach ($product_options as $product_option) {
						$option_info = $this->model_catalog_option->getOption($product_option['option_id']);
						
						if ($option_info) {
							$product_option_value_data = array();
							
							foreach ($product_option['product_option_value'] as $product_option_value) {
								$option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);
								
								if ($option_value_info) {
									$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
									);
								}
							}
							
							$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
							);
						}
					}
					
					$json['data'] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function attribute() {
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
			$json['data'] = array();
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getAttributes($filter_data);
				
				
				
				foreach ($results as $result) {
					$json['data'][] = array(
					'attribute_id'    => $result['attribute_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'attribute_group' => $result['attribute_group']
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
				
			}
			
			$sort_order = array();
			if(!empty($json['data'])) {
				foreach ($json['data'] as $key => $value) {
					$sort_order[$key] = $value['name'];
				}
			}
			
			array_multisort($sort_order, SORT_ASC, $json['data']);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function option() {
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
			$json['data'] = array();
			if (isset($this->request->get['filter_name'])) {
				$this->load->language('catalog/option');
				
				$this->load->model('catalog/option');
				
				$this->load->model('tool/image');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				
				$options = $this->model_catalog_option->getOptions($filter_data);
				
				foreach ($options as $option) {
					$option_value_data = array();
					
					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
						$option_values = $this->model_catalog_option->getOptionValues($option['option_id']);
						
						foreach ($option_values as $option_value) {
							if (is_file(DIR_IMAGE . $option_value['image'])) {
								$image = $this->model_tool_image->resize($option_value['image'], 50, 50);
								} else {
								$image = $this->model_tool_image->resize('no_image.png', 50, 50);
							}
							
							$option_value_data[] = array(
							'option_value_id' => $option_value['option_value_id'],
							'name'            => strip_tags(html_entity_decode($option_value['name'], ENT_QUOTES, 'UTF-8')),
							'image'           => $image
							);
						}
						
						$sort_order = array();
						
						foreach ($option_value_data as $key => $value) {
							$sort_order[$key] = $value['name'];
						}
						
						array_multisort($sort_order, SORT_ASC, $option_value_data);
					}
					
					$type = '';
					
					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
						$type = $this->language->get('text_choose');
					}
					
					if ($option['type'] == 'text' || $option['type'] == 'textarea') {
						$type = $this->language->get('text_input');
					}
					
					if ($option['type'] == 'file') {
						$type = $this->language->get('text_file');
					}
					
					if ($option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
						$type = $this->language->get('text_date');
					}
					
					$json['data'][] = array(
					'option_id'    => $option['option_id'],
					'name'         => strip_tags(html_entity_decode($option['name'], ENT_QUOTES, 'UTF-8')),
					'category'     => $type,
					'type'         => $option['type'],
					'option_value' => $option_value_data
					);
					$json['status'] = 'success';
					$json['message'] = '';
				}
			}
			
			$sort_order = array();
			if(!empty($json['data'])){
				foreach ($json['data'] as $key => $value) {
					$sort_order[$key] = $value['name'];
				}
			}
			array_multisort($sort_order, SORT_ASC, $json['data']);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
}
?>