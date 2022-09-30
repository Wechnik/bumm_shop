<?php
	class ControllerCommonCart extends Controller {
		public function index() {
			$this->load->language('common/cart');
			
			// Totals
			$this->load->model('extension/extension');
			
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			
			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();
				
				$results = $this->model_extension_extension->getExtensions('total');
				
				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}
				
				array_multisort($sort_order, SORT_ASC, $results);
				
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						
						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}
				
				$sort_order = array();
				
				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				
				array_multisort($sort_order, SORT_ASC, $totals);
			}
			
			$data['count_cart_products'] = $this->cart->countProducts();
			
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_cart'] = $this->language->get('text_cart');
			$data['text_checkout'] = $this->language->get('text_checkout');
			$data['text_recurring'] = $this->language->get('text_recurring');
			$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
			$data['text_loading'] = $this->language->get('text_loading');
			
			$data['button_remove'] = $this->language->get('button_remove');
			
			$this->load->model('tool/image');
			$this->load->model('tool/upload');
			
			
			/*mmr*/
			$data['text_items_count'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
			$data['text_items'] = $this->currency->format($total, $this->session->data['currency']);
			$data['moneymaker2_modules_quickorder_enabled'] = $this->config->get('moneymaker2_modules_quickorder_enabled');
			if ($data['moneymaker2_modules_quickorder_enabled']) {
				$data['moneymaker2_modules_quickorder_button_title'] = $this->config->get('moneymaker2_modules_quickorder_button_title');
				$data['moneymaker2_modules_quickorder_button_title'] = isset($data['moneymaker2_modules_quickorder_button_title'][$this->config->get('config_language_id')]) ? $data['moneymaker2_modules_quickorder_button_title'][$this->config->get('config_language_id')] : null;
				$data['moneymaker2_modules_quickorder_display_popupcart'] = $this->config->get('moneymaker2_modules_quickorder_display_popupcart');
			}
			$data['moneymaker2_header_cart_custom'] = $this->config->get('moneymaker2_header_cart_custom');
			if ($data['moneymaker2_header_cart_custom']&&$this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0)<1) {
				$data['moneymaker2_header_cart_caption'] = $this->config->get('moneymaker2_header_cart_caption');
				$data['text_items'] = isset($data['moneymaker2_header_cart_caption'][$this->config->get('config_language_id')]) ? "<span class='cart-effect'>".$data['moneymaker2_header_cart_caption'][$this->config->get('config_language_id')]."</span>" : '';
				$data['moneymaker2_header_cart_text'] = $this->config->get('moneymaker2_header_cart_text');
				$data['moneymaker2_header_cart_text'] = isset($data['moneymaker2_header_cart_text'][$this->config->get('config_language_id')]) ? html_entity_decode($data['moneymaker2_header_cart_text'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : null;
				$data['moneymaker2_header_cart_image'] = $this->config->get('moneymaker2_header_cart_image');
				if ($data['moneymaker2_header_cart_image']) {
					$moneymaker2_header_cart_image = is_file(DIR_IMAGE . $this->config->get('moneymaker2_header_cart_image_src')) ? $this->model_tool_image->resize($this->config->get('moneymaker2_header_cart_image_src'), 210, 210) : $this->model_tool_image->resize('no_image.png', 210, 210);
					$data['moneymaker2_header_cart_image'] = $moneymaker2_header_cart_image;
				}
				$data['moneymaker2_header_cart_link_enabled'] = $this->config->get('moneymaker2_header_cart_link_enabled');
				$data['moneymaker2_header_cart_link'] = $this->config->get('moneymaker2_header_cart_link');
				if ($data['moneymaker2_header_cart_link_enabled']&&$data['moneymaker2_header_cart_link']) {
					$data['moneymaker2_header_cart_link_icon'] = $this->config->get('moneymaker2_header_cart_link_icon');
					$data['moneymaker2_header_cart_link_title'] = $this->config->get('moneymaker2_header_cart_link_title');
					$data['moneymaker2_header_cart_link_title'] = isset($data['moneymaker2_header_cart_link_title'][$this->config->get('config_language_id')]) ? $data['moneymaker2_header_cart_link_title'][$this->config->get('config_language_id')] : '';
					$data['moneymaker2_header_cart_link'] = $this->url->link('information/information', 'information_id=' . $this->config->get('moneymaker2_header_cart_link'));
				}
			};
			/*mmr*/
			
			$data['products'] = array();
			
			
			foreach ($this->cart->getProducts() as $product) {
				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}
				
				$option_data = array();
				
				foreach ($product['option'] as $option) {
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
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
						'type'  => $option['type']
					);
				}
				
				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
					
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
				} else {
					$price = false;
					$total = false;
				}
				
				$data['products'][] = array(
					'cart_id'   => $product['cart_id'],
					'thumb'     => $image,
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
					'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
					'quantity'  => $product['quantity'],
					'price'     => $price,
					'total'     => $total,
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}
			
			// Gift Voucher
			$data['vouchers'] = array();
			
			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
					);
				}
			}
			
			$data['totals'] = array();
			
			foreach ($totals as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
				);
			}
			
			$data['cart'] = $this->url->link('checkout/cart');
			$data['checkout'] = $this->url->link('checkout/checkout', '', true);
			
			/*mmr*/
			$data['moneymaker2_header_strip_cart'] = $this->config->get('moneymaker2_header_strip_cart');
			$data['moneymaker2_header_strip_cart'] = isset($data['moneymaker2_header_strip_cart']) ? $data['moneymaker2_header_strip_cart'] : 1;
			switch ($data['moneymaker2_header_strip_cart']) {
				case 1: $data['moneymaker2_header_strip_cart_class'] = "hidden-lg hidden-md hidden-sm"; break;
				case 2: $data['moneymaker2_header_strip_cart_class'] = "hidden-lg hidden-md hidden-sm visible-xlg"; break;
				case 3: $data['moneymaker2_header_strip_cart_class'] = "hidden-md hidden-sm"; break;
				case 4: $data['moneymaker2_header_strip_cart_class'] = "hidden-sm"; break;
				case 5: $data['moneymaker2_header_strip_cart_class'] = ""; break;
			}
			/*mmr*/
			
			
			return $this->load->view('common/cart', $data);
		}
		
		public function popup_cart() {
			$this->load->language('common/cart');
			
			// Totals
			$this->load->model('extension/extension');
			
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			
			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();
				
				$results = $this->model_extension_extension->getExtensions('total');
				
				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}
				
				array_multisort($sort_order, SORT_ASC, $results);
				
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						
						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}
				
				$sort_order = array();
				
				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				
				array_multisort($sort_order, SORT_ASC, $totals);
			}
			
			$data['count_cart_products'] = $this->cart->countProducts();
			
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_cart'] = $this->language->get('text_cart');
			$data['text_checkout'] = $this->language->get('text_checkout');
			$data['text_recurring'] = $this->language->get('text_recurring');
			$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
			$data['text_loading'] = $this->language->get('text_loading');
			
			$data['button_remove'] = $this->language->get('button_remove');
			
			$this->load->model('tool/image');
			$this->load->model('tool/upload');
			
			
			/*mmr*/
			$data['text_items_count'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
			$data['text_items'] = $this->currency->format($total, $this->session->data['currency']);
			$data['moneymaker2_modules_quickorder_enabled'] = $this->config->get('moneymaker2_modules_quickorder_enabled');
			if ($data['moneymaker2_modules_quickorder_enabled']) {
				$data['moneymaker2_modules_quickorder_button_title'] = $this->config->get('moneymaker2_modules_quickorder_button_title');
				$data['moneymaker2_modules_quickorder_button_title'] = isset($data['moneymaker2_modules_quickorder_button_title'][$this->config->get('config_language_id')]) ? $data['moneymaker2_modules_quickorder_button_title'][$this->config->get('config_language_id')] : null;
				$data['moneymaker2_modules_quickorder_display_popupcart'] = $this->config->get('moneymaker2_modules_quickorder_display_popupcart');
			}
			$data['moneymaker2_header_cart_custom'] = $this->config->get('moneymaker2_header_cart_custom');
			if ($data['moneymaker2_header_cart_custom']&&$this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0)<1) {
				$data['moneymaker2_header_cart_caption'] = $this->config->get('moneymaker2_header_cart_caption');
				$data['text_items'] = isset($data['moneymaker2_header_cart_caption'][$this->config->get('config_language_id')]) ? "<span class='cart-effect'>".$data['moneymaker2_header_cart_caption'][$this->config->get('config_language_id')]."</span>" : '';
				$data['moneymaker2_header_cart_text'] = $this->config->get('moneymaker2_header_cart_text');
				$data['moneymaker2_header_cart_text'] = isset($data['moneymaker2_header_cart_text'][$this->config->get('config_language_id')]) ? html_entity_decode($data['moneymaker2_header_cart_text'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : null;
				$data['moneymaker2_header_cart_image'] = $this->config->get('moneymaker2_header_cart_image');
				if ($data['moneymaker2_header_cart_image']) {
					$moneymaker2_header_cart_image = is_file(DIR_IMAGE . $this->config->get('moneymaker2_header_cart_image_src')) ? $this->model_tool_image->resize($this->config->get('moneymaker2_header_cart_image_src'), 210, 210) : $this->model_tool_image->resize('no_image.png', 210, 210);
					$data['moneymaker2_header_cart_image'] = $moneymaker2_header_cart_image;
				}
				$data['moneymaker2_header_cart_link_enabled'] = $this->config->get('moneymaker2_header_cart_link_enabled');
				$data['moneymaker2_header_cart_link'] = $this->config->get('moneymaker2_header_cart_link');
				if ($data['moneymaker2_header_cart_link_enabled']&&$data['moneymaker2_header_cart_link']) {
					$data['moneymaker2_header_cart_link_icon'] = $this->config->get('moneymaker2_header_cart_link_icon');
					$data['moneymaker2_header_cart_link_title'] = $this->config->get('moneymaker2_header_cart_link_title');
					$data['moneymaker2_header_cart_link_title'] = isset($data['moneymaker2_header_cart_link_title'][$this->config->get('config_language_id')]) ? $data['moneymaker2_header_cart_link_title'][$this->config->get('config_language_id')] : '';
					$data['moneymaker2_header_cart_link'] = $this->url->link('information/information', 'information_id=' . $this->config->get('moneymaker2_header_cart_link'));
				}
			};
			/*mmr*/
			
			$data['products1'] = array();
			
			
			foreach ($this->cart->getProducts() as $product) {
				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}
				
				$option_data = array();
				
				foreach ($product['option'] as $option) {
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
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
						'type'  => $option['type']
					);
				}
				
				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
					
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
				} else {
					$price = false;
					$total = false;
				}
				
				$data['products1'][] = array(
					'cart_id'   => $product['cart_id'],
					'thumb'     => $image,
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
					'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
					'quantity'  => $product['quantity'],
					'price'     => $price,
					'total'     => $total,
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}
			
			// Gift Voucher
			$data['vouchers1'] = array();
			
			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
					);
				}
			}
			
			$data['totals1'] = array();
			
			foreach ($totals as $total) {
				$data['totals1'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
				);
			}
			
			$data['cart'] = $this->url->link('checkout/cart');
			$data['checkout'] = $this->url->link('checkout/checkout', '', true);
			
			/*mmr*/
			$data['moneymaker2_header_strip_cart'] = $this->config->get('moneymaker2_header_strip_cart');
			$data['moneymaker2_header_strip_cart'] = isset($data['moneymaker2_header_strip_cart']) ? $data['moneymaker2_header_strip_cart'] : 1;
			switch ($data['moneymaker2_header_strip_cart']) {
				case 1: $data['moneymaker2_header_strip_cart_class'] = "hidden-lg hidden-md hidden-sm"; break;
				case 2: $data['moneymaker2_header_strip_cart_class'] = "hidden-lg hidden-md hidden-sm visible-xlg"; break;
				case 3: $data['moneymaker2_header_strip_cart_class'] = "hidden-md hidden-sm"; break;
				case 4: $data['moneymaker2_header_strip_cart_class'] = "hidden-sm"; break;
				case 5: $data['moneymaker2_header_strip_cart_class'] = ""; break;
			}
			/*mmr*/
			
			return $this->load->view('common/popup_cart', $data);
		}
		
		public function info() {
			$this->response->setOutput($this->popup_cart());
		}
		
		public function popup_info() {
			$this->response->setOutput($this->popup_cart());
		}
	}
