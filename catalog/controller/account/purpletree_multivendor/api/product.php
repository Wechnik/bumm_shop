<?php
class ControllerAccountPurpletreeMultivendorApiProduct extends Controller {
		private $error = array();
		public function index() {
			$json=array();
			$isMobileApiCall=true;
			if (!$isMobileApiCall) {
				$json['stauts'] = 'error';
				$json['message'] = $this->language->get('error_permission');
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$this->load->model('catalog/category');
			
			if (isset($this->request->get['path'])) {
				$path = '';
				
				$parts = explode('_', (string)$this->request->get['path']);
				
				$category_id = (int)array_pop($parts);
				
				foreach ($parts as $path_id) {
					if (!$path) {
						$path = $path_id;
						} else {
						$path .= '_' . $path_id;
					}
					
				}
				
				// Set the last category breadcrumb
				$category_info = $this->model_catalog_category->getCategory($category_id);				
				
			}
			
			$this->load->model('catalog/manufacturer');
			
			if (isset($this->request->get['manufacturer_id'])) {
				
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);
			}
			
			if (isset($this->request->get['product_id'])) {
				$product_id = (int)$this->request->get['product_id'];
				
				/******* get seller details to show on product page *******/
				$json['data']['seller_review_status'] = $this->config->get('purpletree_multivendor_seller_review');
				$data['seller_detail'] = array();
				$json['data']['purpletree_multivendor_allow_live_chat'] = 0;
				if(NULL !== $this->config->get('purpletree_multivendor_allow_live_chat')) {
					$json['data']['purpletree_multivendor_allow_live_chat'] = $this->config->get('purpletree_multivendor_allow_live_chat');
				}
				$json['data']['store_live_chat_enable'] =0;
				$json['data']['store_live_chat_code'] ='';
				if($this->config->get('purpletree_multivendor_status')){
					
					$currentpage = $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
					$this->session->data['ptsmv_current_page'] = $currentpage;
					
					$this->load->model('purpletree_multivendor/sellerproduct');
					$this->load->model('purpletree_multivendor/vendor');
					
					$seller_detail = $this->model_purpletree_multivendor_sellerproduct->getSellername($product_id);
					if($seller_detail){
						$seller_detailss = $this->model_purpletree_multivendor_vendor->getStoreDetail($seller_detail['seller_id']);
						
						$json['data']['store_live_chat_enable'] = isset($seller_detailss['store_live_chat_enable'])?$seller_detailss['store_live_chat_enable']:0;
						$json['data']['store_live_chat_code'] ='';
						if(isset($seller_detailss['store_live_chat_code'])) {
							$json['data']['store_live_chat_code'] = $seller_detailss['store_live_chat_code'];					
						}
						$seller_rating = $this->model_purpletree_multivendor_vendor->getStoreRating($seller_detail['seller_id']);
						$json['data']['seller_detail'] = array(
						'seller_name' => $seller_detail['store_name'],
						'store_id' => $seller_detail['id'],
						'seller_rating' => (isset($seller_rating['rating'])?$seller_rating['rating']:'0'),
						'seller_count' => (isset($seller_rating['count'])?$seller_rating['count']:'0'),
						);
					}
				}
				} else {
				$product_id = 0;
			}
			
			$this->load->model('catalog/product');
			
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->load->model('catalog/review');
				
				$json['data']['product_id'] = (int)$this->request->get['product_id'];
				$json['data']['manufacturer'] = $product_info['manufacturer'];
				$json['data']['manufacturers'] =$product_info['manufacturer_id'];
				$json['data']['model'] = $product_info['model'];
				$json['data']['reward'] = $product_info['reward'];
				$json['data']['points'] = $product_info['points'];
				$json['data']['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
				
				if ($product_info['quantity'] <= 0) {
					$json['data']['stock'] = $product_info['stock_status'];
					} elseif ($this->config->get('config_stock_display')) {
					$json['data']['stock'] = $product_info['quantity'];
					} else {
					$json['data']['stock'] = $this->language->get('text_instock');
				}
				
				$this->load->model('tool/image');
				
				if ($product_info['image']) {
					$json['data']['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
					} else {
					$json['data']['popup'] = '';
				}
				
				if ($product_info['image']) {
					$json['data']['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
					} else {
					$json['data']['thumb'] = '';
				}
				
				$json['data']['images'] = array();
				
				$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
				
				foreach ($results as $result) {
					$json['data']['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
					);
				}
				
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$json['data']['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
					$json['data']['price'] = false;
				}
				
				if ((float)$product_info['special']) {
					$json['data']['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
					$json['data']['special'] = false;
				}
				
				if ($this->config->get('config_tax')) {
					$json['data']['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
					$json['data']['tax'] = false;
				}
				
				$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
				
				$data['discounts'] = array();
				
				foreach ($discounts as $discount) {
					$json['data']['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
					);
				}
				
				$data['options'] = array();
				
				foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
					$product_option_value_data = array();
					
					foreach ($option['product_option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
								} else {
								$price = false;
							}
							
							$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
							);
						}
					}
					
					$json['data']['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
					);
				}
				
				if ($product_info['minimum']) {
					$json['data']['minimum'] = $product_info['minimum'];
					} else {
					$json['data']['minimum'] = 1;
				}
				
				$json['data']['review_status'] = $this->config->get('config_review_status');
				
				if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
					$json['data']['review_guest'] = true;
					} else {
					$json['data']['review_guest'] = false;
				}
				
				if ($this->customer->isLogged()) {
					$json['data']['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
					} else {
					$json['data']['customer_name'] = '';
				}
				
				$json['data']['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
				$json['data']['rating'] = (int)$product_info['rating'];
				
				// Captcha
				if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
					$json['data']['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
					} else {
					$json['data']['captcha'] = '';
				}
				
				$json['data']['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
				
				$data['products'] = array();
				
				$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
				
				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
						} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
					}
					
					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
						$price = false;
					}
					
					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
						$special = false;
					}
					
					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
						} else {
						$tax = false;
					}
					
					if ($this->config->get('config_review_status')) {
						$rating = (int)$result['rating'];
						} else {
						$rating = false;
					}
					
					$json['data']['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating
					);
				}
				
				$data['tags'] = array();
				
				if ($product_info['tag']) {
					$tags = explode(',', $product_info['tag']);
					
					foreach ($tags as $tag) {
						$json['data']['tags'][] = array(
						'tag'  => trim($tag)
						);
					}
				}
				
				$json['data']['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);
				
				$this->model_catalog_product->updateViewed($this->request->get['product_id']);
				
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
				} else {
				
				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
				$json['status'] = 'error';
				$json['message'] = 'Product Information not found !';
				
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
		}
}