<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {

        $data['hpmodel']=$this->load->controller('extension/module/hpmodel/hpmodel/getForm', false);

        $this->document->addStyle('catalog/view/javascript/jquery/nice-select/nice-select.css');
        $this->document->addScript('catalog/view/javascript/jquery/nice-select/jquery.nice-select.min.js');

        $this->load->language('module/share_buttons');
        $data['text_share_buttons'] = $this->language->get('text_share_buttons');

		$this->load->language('product/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

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

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
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

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

        $data['product_filters'] = [];

        $this->load->model('extension/module/smart_filter');

        $data['product_filters'] = $this->model_extension_module_smart_filter->getProductFilters($product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			if ($product_info['meta_title']) {
				$this->document->setTitle($product_info['meta_title']);
			} else {
				$this->document->setTitle($product_info['name']);
			}

			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

            $this->document->addStyle('catalog/view/javascript/jquery/slick-slider/slick.css');
            $this->document->addStyle('catalog/view/javascript/jquery/slick-slider/slick-theme.css');
            $this->document->addScript('catalog/view/javascript/jquery/slick-slider/slick.min.js');

//            $this->document->addStyle('catalog/view/theme/moneymaker2/stylesheet/share_buttons.css');
//            $this->document->addScript('catalog/view/theme/moneymaker2/js/addtoany.js');


			if ($product_info['meta_h1']) {
				$data['heading_title'] = $product_info['meta_h1'];
			} else {
				$data['heading_title'] = $product_info['name'];
			}

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['date_modified'] = $product_info['date_modified'];
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
            $add_desc_result = $this->model_catalog_product->getProductsAddDescriptions($product_info['description']);
            $data['additional_description'] = html_entity_decode($add_desc_result['product_short'], ENT_QUOTES, 'UTF-8');
			$data['points'] = $product_info['points'];
			$data['description'] = html_entity_decode($add_desc_result['original'], ENT_QUOTES, 'UTF-8');
			
            if($data['description']) {
                $data['description'] .=$this->model_catalog_product->getAdditionalProductDescription($product_id);
            }

            $additional_product_tab = $this->model_catalog_product->getAdditionalProductTab($product_id);
			
			$data['additional_product_tab'] = isset($additional_product_tab['text']) ? html_entity_decode($additional_product_tab['text'], ENT_QUOTES, 'UTF-8') : false;
			$data['additional_product_tab_name'] = isset($additional_product_tab['front_name']) ? $additional_product_tab['front_name'] : false;
			
			$data['availability_moscow'] = $product_info['availability_moscow']? (int)$product_info['availability_moscow'] : 0;
            $data['availability_novosibirsk'] = $product_info['availability_novosibirsk'] ? (int)$product_info['availability_novosibirsk'] : 0;


//			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
//			} elseif ($this->config->get('config_stock_display')) {
//				$data['stock'] = $product_info['quantity'];
//			} else {
//				$data['stock'] = $this->language->get('text_instock');
//			}

			$this->load->model('tool/image');

            $data['product_stickers'] = [];

            $stickers_settings =  $this->config->get('product_stickers');


            if($product_info['product_stickers'] && $stickers_settings['width'] && $stickers_settings['height']) {

                $data['image_variant'] = $stickers_settings['image_variant'];

                $data['product_stickers'] = [];

                $tmp_stickers = json_decode($product_info['product_stickers'], true);
                foreach ($tmp_stickers as $tmp_sticker) {
                    $stick_data = $this->model_catalog_product->getProductStickers($tmp_sticker);
                    if($stick_data) {
                        if ($stick_data['image']) {
                            $stick_data['image'] = $this->model_tool_image->resize($stick_data['image'], $stickers_settings['width'], $stickers_settings['height']);
                        } else {
                            $stick_data['image'] = false;
                        }

                        $stick_data['description'] = ($stick_data['description']) ? html_entity_decode($stick_data['description'], ENT_QUOTES, 'UTF-8') : false;

                        $data['product_stickers'][] = $stick_data;
                    }

                }
            }

            $sort_order = array();

            foreach ($data['product_stickers'] as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $data['product_stickers']);

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
				$this->document->setOgImage($data['thumb']);
			} else {
				$data['thumb'] = '';
			}

            $data['video_in_product'] = false;
            $data['video_in_product1'] = false;
            $data['video_in_product2'] = false;

            if($product_info['video_in_product']) {
                $data['video_in_product'] = $product_info['video_in_product'];
                $data['video_in_product_image'] = $this->model_tool_image->resize('youtube_play.png', $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
            }

            if($product_info['video_in_product1']) {
                $data['video_in_product1'] = $product_info['video_in_product1'];
                $data['video_in_product_image'] = $this->model_tool_image->resize('youtube_play.png', $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
            }

            if($product_info['video_in_product2']) {
                $data['video_in_product2'] = $product_info['video_in_product2'];
                $data['video_in_product_image'] = $this->model_tool_image->resize('youtube_play.png', $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
            }
            
			$data['product_options_text'] = !empty($product_info['product_options_text']) ? html_entity_decode($product_info['product_options_text'], ENT_QUOTES, 'UTF-8') : false;
			
			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);


            $data['images'][] = array(
                'popup' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                'thumb' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
            );

            foreach ($results as $res_key => $result) {
                $data['images'][] = array(
                    'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                    'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
                );
            }
			
  			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}
			
			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
                    'base_price' => (isset($discount['base_price']) and $discount['base_price'] > 0) ? $this->currency->format(1, $product_info['base_currency_code'], $discount['base_price'], true) : '',
                    'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['options'] = array();

            $product_price = $product_info['special'] > 0  ? $product_info['special'] : $product_info['price'];

            $data['product_base_price'] = (int)$product_price;

            $data['opt_image'] = true;
			$data['prod_max_price'] = false;
			
            $data['options_names'] = '';

            foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
                $product_option_value_data = array();
                $tmp_product_option_value_data = array();

                $opt_prices = [];

                foreach ($option['product_option_value'] as $option_value) {
                    if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                            $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                        } else {
                            $price = false;
                        }

                        $product_option_image = !empty($option_value['loc_image']) ? $option_value['loc_image'] : $option_value['glob_image'];

                        if($product_option_image && !empty($product_option_image)) {
                            $option_image = $this->model_tool_image->resize($product_option_image, 400, 300);
                        } else {
                            $option_image = $this->model_tool_image->resize('no_image.png', 400, 300);
                        }

                        if (!empty($option_value['product_option_description'])) {
                            $option_description = html_entity_decode($option_value['product_option_description'], ENT_QUOTES, 'UTF-8');
                        } else if ($option_value['prod_option_description']) {
                            $option_description = html_entity_decode($option_value['prod_option_description'], ENT_QUOTES, 'UTF-8');
                        } else {
                            $option_description = '';
                        }

                        if($option_value['price'] != 0) {

                            if($option_value['price_prefix'] == '+') {
                                $opt_price = $product_price + $option_value['price'];
                            } else {
                                $opt_price = $product_price - $option_value['price'];
                            }

                        } else {

                            if($option_value['increase'] == 1) {
                                $opt_price = $product_price + $option_value['opt_price'];
                            } else {
                                $opt_price = $product_price - $option_value['opt_price'];
                            }

                        }


						$tmp_product_option_value_data[$opt_price][] = array(
							'product_option_value_id'  => $option_value['product_option_value_id'],
							'option_value_id'          => $option_value['option_value_id'],
                            'base_price'               => (isset($option_value['base_price']) and $option_value['base_price'] > 0) ? $this->currency->format(1, $product_info['base_currency_code'], $option_value['base_price'], true) : '',
                            'opt_base_price'           => (int)$option_value['base_price'],
                            'name'                     => $option_value['name'],
                            'product_option_name'      => $option_value['product_option_name'],
                            'prod_option_description'  => $option_value['prod_option_description'],
                            'availability_moscow'      => $option_value['availability_moscow'] == 1 ? (int)$option_value['availability_moscow'] : false,
                            'availability_novosibirsk' => $option_value['availability_novosibirsk'] == 1 ? (int)$option_value['availability_novosibirsk'] : false,
                            'global'                   => $option_value['global'],
                            'increase'                 => $option_value['increase'],
                            'opt_price'                => $this->currency->format($this->tax->calculate($option_value['opt_price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']),
                            'image'                    => $option_image,
                            'price'                    => $price,
                            'option_price'             => $this->currency->format($this->tax->calculate($opt_price, $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']),
                            'description'              => $option_description,
							'price_prefix'             => $option_value['price_prefix']
						);

                    }
					
                    $opt_prices[] = $opt_price;
                }
				
                foreach ($tmp_product_option_value_data as $opt_values) {
                    foreach ($opt_values as $option_value) {
                        $product_option_value_data[] = array(
                            'product_option_value_id'  => $option_value['product_option_value_id'],
                            'option_value_id'          => $option_value['option_value_id'],
                            'base_price' => $option_value['base_price'],
                            'opt_base_price'           => (int)$option_value['base_price'],
                            'name'                     => $option_value['name'],
                            'product_option_name'      => $option_value['product_option_name'],
                            'prod_option_description'  => $option_value['prod_option_description'],
                            'availability_moscow'      => $option_value['availability_moscow'] == 1 ? (int)$option_value['availability_moscow'] : false,
                            'availability_novosibirsk' => $option_value['availability_novosibirsk'] == 1 ? (int)$option_value['availability_novosibirsk'] : false,
                            'global'                   => $option_value['global'],
                            'increase'                 => $option_value['increase'],
                            'opt_price'                => $option_value['opt_price'],
                            'image'                    => $option_value['image'],
                            'price'                    => $option_value['price'],
                            'option_price'             => $option_value['option_price'],
                            'description'              => $option_value['description'],
                            'price_prefix'             => $option_value['price_prefix']
                        );
                    }
                }


                if ($opt_prices) {
                    $prod_price = min($opt_prices);
                    $data['opt_availability_moscow'] = (int)$tmp_product_option_value_data[$prod_price][0]['availability_moscow'];
                    $data['opt_availability_novosibirsk'] = (int)$tmp_product_option_value_data[$prod_price][0]['availability_novosibirsk'];

                    if (max($opt_prices) != $prod_price) {
                        $data['prod_max_price'] = $this->currency->format($this->tax->calculate(max($opt_prices), $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $data['prod_max_price'] = false;
                    }

                    $data['prod_availabilities'] = array(
                        'opt_availability_moscow' => $data['opt_availability_moscow'],
                        'opt_availability_novosibirsk' => $data['opt_availability_novosibirsk'],
                    );
                } else {
                    $prod_price = $product_info['price'];
                    $data['opt_availability_moscow'] =  0;
                    $data['opt_availability_novosibirsk'] = 0;
                    $data['prod_max_price'] = false;

                    $data['prod_availabilities'] = array(
                        'opt_availability_moscow' => $product_info['opt_availability_moscow'],
                        'opt_availability_novosibirsk' => $product_info['opt_availability_novosibirsk'],
                    );
                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $data['price'] = $this->currency->format($this->tax->calculate($prod_price, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $data['price'] = false;
                }
				
                if(count($product_option_value_data) == 4) {
                    $data['option_class'] = 3;
                } else if (count($product_option_value_data) == 3){
                    $data['option_class'] = 4;
                } else {
                    $data['option_class'] = 2;
                }
				
                $data['options_names'] .= $option['name'] . ', ';

                $data['options'][] = array(
                    'product_option_id'    => $option['product_option_id'],
                    'product_option_value' => $product_option_value_data,
                    'option_id'            => $option['option_id'],
                    'name'                 => $option['name'],
                    'type'                 => $option['type'],
                    'value'                => $option['value'],
                    'required'             => $option['required']
                );
            }

            $data['options_names'] = substr($data['options_names'], 0, -2);

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

            if (isset($product_info['base_price']) and $product_info['base_price'] > 0) {
                $data['base_price'] =  $this->currency->format(1, $product_info['base_currency_code'], $product_info['base_price'], true);
            }
            else {
                $data['base_price'] = '';
            }

            if (isset($product_info['base_special']) and $product_info['base_special'] > 0) {
                $data['base_special'] =  $this->currency->format(1, $product_info['base_currency_code'], $product_info['base_special'], true);
            }
            else {
                $data['base_special'] = '';
            }

            if (isset($product_info['base_currency_code'])) {
                $data['base_currency_code'] = $product_info['base_currency_code'];
            }
            else {
                $data['base_currency_code'] = '';
            }


			$data['similar_products'] = array();

            for( $i=1; $i< 6; $i++) {
                $data['product_tabs_' . $i] = array();
            }

            $product_tabs = $this->model_catalog_product->getProductTabs($this->request->get['product_id']);
            foreach ($product_tabs as $product_tab) {
                $data['product_tabs_' . $product_tab['position']][] = array(
                    'tab_id'  => $product_tab['tab_id'],
                    'name'    => $product_tab['name'],
                    'text'    => html_entity_decode($product_tab['text'], ENT_QUOTES, 'UTF-8')
                );
            }

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {

                $result = $this->load->controller('extension/module/hpmodel/hpmodel/getCategoryBlock', $result);

				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
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

                $add_desc_result = $this->model_catalog_product->getProductsAddDescriptions($result['description']);

                foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {

                    $opt_prices = [];

                    foreach ($option['product_option_value'] as $option_value) {
                        if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {

                            if($option_value['price'] != 0) {

                                if($option_value['price_prefix'] == '+') {
                                    $opt_price = $result['price'] + $option_value['price'];
                                } else {
                                    $opt_price = $result['price'] - $option_value['price'];
                                }

                            } else {

                                if($option_value['increase'] == 1) {
                                    $opt_price = $result['price'] + $option_value['opt_price'];
                                } else {
                                    $opt_price = $result['price'] - $option_value['opt_price'];
                                }

                            }

                        }

                        $opt_prices[] = $opt_price;

                    }

                    if($opt_prices) {

                        $prod_price = min($opt_prices);

                    } else {

                        $prod_price = $result['price'];

                    }

                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($prod_price ?? $result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

				$data['similar_products'][] = array(
                    'base_price'          => (isset($result['base_price']) and $result['base_price'] > 0 ) ? $this->currency->format(1, $result['base_currency_code'], $result['base_price'], true) : '',
                    'base_special'        => (isset($result['base_special']) and $result['base_special'] > 0 ) ? $this->currency->format(1, $result['base_currency_code'], $result['base_special'], true) : '',
                    'product_id'  => $result['product_id'],
                    'hpm_block' => !empty($result['hpm_block']) ? $result['hpm_block'] : '',
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($add_desc_result['out_description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

            $data['related_products'] = array();

            $results = $this->model_catalog_product->getProductRelatedSimilar($this->request->get['product_id']);

            foreach ($results as $result) {

                $result = $this->load->controller('extension/module/hpmodel/hpmodel/getCategoryBlock', $result);

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

                $add_desc_result = $this->model_catalog_product->getProductsAddDescriptions($result['description']);


                /*mmr*/
                $data['moneymaker2_product_related_carousel'] = $this->config->get('moneymaker2_product_related_carousel');
                $data['moneymaker2_product_related_carousel_autoplay'] = $this->config->get('moneymaker2_product_related_carousel_autoplay');
                $data['moneymaker2_stickers_size_catalog'] = $this->config->get('moneymaker2_modules_stickers_size_catalog');
                $moneymaker2_stickers = array();
                if ($special) {
                    if ($this->config->get('moneymaker2_modules_stickers_specials_enabled')) {
                        $moneymaker2_modules_stickers_specials_caption = $this->config->get('moneymaker2_modules_stickers_specials_caption');
                        $moneymaker2_modules_stickers_specials_discount = $this->config->get('moneymaker2_modules_stickers_specials_discount') ? ($this->config->get('moneymaker2_modules_stickers_specials_discount_mode') ? "-".round(100-(($result['special']/$result['price'])*100))."%" : "-".$this->currency->format((($result['special'])-($result['price']))*(-1), $this->session->data['currency'])) : '';
                        $moneymaker2_stickers[] = array(
                            'type' => 'special',
                            'icon' => $this->config->get('moneymaker2_modules_stickers_specials_icon'),
                            'caption' => $this->config->get('moneymaker2_modules_stickers_specials_discount') ? "<b>".$moneymaker2_modules_stickers_specials_discount."</b> ".(isset($moneymaker2_modules_stickers_specials_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_specials_caption[$this->config->get('config_language_id')] : null) : (isset($moneymaker2_modules_stickers_specials_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_specials_caption[$this->config->get('config_language_id')] : null),
                        );
                    }
                }
                if ($result['viewed']) {
                    if ($this->config->get('moneymaker2_modules_stickers_popular_enabled')) {
                        if ($result['viewed']>=$this->config->get('moneymaker2_modules_stickers_popular_limit')) {
                            $moneymaker2_modules_stickers_popular_caption = $this->config->get('moneymaker2_modules_stickers_popular_caption');
                            $moneymaker2_stickers[] = array(
                                'type' => 'popular',
                                'icon' => $this->config->get('moneymaker2_modules_stickers_popular_icon'),
                                'caption' => isset($moneymaker2_modules_stickers_popular_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_popular_caption[$this->config->get('config_language_id')] : null,
                            );
                        }
                    }
                }
                if ($result['rating']) {
                    if ($this->config->get('moneymaker2_modules_stickers_rated_enabled')) {
                        if ($result['rating']>=$this->config->get('moneymaker2_modules_stickers_rated_limit')) {
                            $moneymaker2_modules_stickers_rated_caption = $this->config->get('moneymaker2_modules_stickers_rated_caption');
                            $moneymaker2_stickers[] = array(
                                'type' => 'rated',
                                'icon' => $this->config->get('moneymaker2_modules_stickers_rated_icon'),
                                'caption' => isset($moneymaker2_modules_stickers_rated_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_rated_caption[$this->config->get('config_language_id')] : null,
                            );
                        }
                    }
                }
                if ($result['date_available']) {
                    if ($this->config->get('moneymaker2_modules_stickers_new_enabled')) {
                        if ((round((strtotime(date("Y-m-d"))-strtotime($result['date_available']))/86400))<=$this->config->get('moneymaker2_modules_stickers_new_limit')) {
                            $moneymaker2_modules_stickers_new_caption = $this->config->get('moneymaker2_modules_stickers_new_caption');
                            $moneymaker2_stickers[] = array(
                                'type' => 'new',
                                'icon' => $this->config->get('moneymaker2_modules_stickers_new_icon'),
                                'caption' => isset($moneymaker2_modules_stickers_new_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_new_caption[$this->config->get('config_language_id')] : null,
                            );
                        }
                    }
                }
                if (isset($result[$this->config->get('moneymaker2_modules_stickers_custom1_field')])&&$result[$this->config->get('moneymaker2_modules_stickers_custom1_field')]) {
                    if ($this->config->get('moneymaker2_modules_stickers_custom1_enabled')) {
                        $moneymaker2_modules_stickers_custom1_caption = $this->config->get('moneymaker2_modules_stickers_custom1_caption');
                        $moneymaker2_stickers[] = array(
                            'type' => 'custom1',
                            'icon' => $this->config->get('moneymaker2_modules_stickers_custom1_icon'),
                            'caption' => isset($moneymaker2_modules_stickers_custom1_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_custom1_caption[$this->config->get('config_language_id')] : null,
                        );
                    }
                }
                if (isset($result[$this->config->get('moneymaker2_modules_stickers_custom2_field')])&&$result[$this->config->get('moneymaker2_modules_stickers_custom2_field')]) {
                    if ($this->config->get('moneymaker2_modules_stickers_custom2_enabled')) {
                        $moneymaker2_modules_stickers_custom2_caption = $this->config->get('moneymaker2_modules_stickers_custom2_caption');
                        $moneymaker2_stickers[] = array(
                            'type' => 'custom2',
                            'icon' => $this->config->get('moneymaker2_modules_stickers_custom2_icon'),
                            'caption' => isset($moneymaker2_modules_stickers_custom2_caption[$this->config->get('config_language_id')]) ? $moneymaker2_modules_stickers_custom2_caption[$this->config->get('config_language_id')] : null,
                        );
                    }
                }
                if ($result['quantity'] <= 0) { $moneymaker2_stock = "<span class='stock'><span>" . $result['stock_status'] . "</span></span>"; } else { $moneymaker2_stock = "<span class='stock instock'><!--" . $this->language->get('text_stock') . "--> <span>" . $this->language->get('text_instock') . "</span></span>"; }
                if ($this->config->get('moneymaker2_catalog_products_code_field')&&isset($result[$this->config->get('moneymaker2_catalog_products_code_field')])&&$result[$this->config->get('moneymaker2_catalog_products_code_field')]&&$this->config->get('moneymaker2_product_related_code')) {$moneymaker2_code = "<span class='code'>".$this->language->get('text_model')." <span>".$result[$this->config->get('moneymaker2_catalog_products_code_field')]."</span></span>";} else {$moneymaker2_code = '';}
                $moneymaker2_addtocart_tooltip = '';
                if ($data['moneymaker2_common_cart_outofstock_disabled']&&$result['quantity'] <= 0) {
                    if (!$data['moneymaker2_common_price_detached']) { $moneymaker2_addtocart_tooltip = "<p class='text-muted'>" . $data['button_cart'] . "</p>"; }
                    $moneymaker2_addtocart_tooltip .= "<p>".$moneymaker2_stock."</p>";
                } else if (!$data['moneymaker2_common_price_detached']) {
                    $moneymaker2_addtocart_tooltip .= "<p>".$data['button_cart']."</p>";
                }
                if ($price&&$special) { $moneymaker2_addtocart_tooltip .= "<p>".$data['moneymaker2_text_old_price']." ".$price."</p>"; }

                $moneymaker2_addtocart_class = 'btn ';
                if ($data['moneymaker2_common_cart_outofstock_disabled']&&$result['quantity'] <= 0) {
                    $moneymaker2_addtocart_class .= 'disabled ';
                }
                if (!$special) {
                    $moneymaker2_addtocart_class .= 'btn-primary';
                } else {
                    $moneymaker2_addtocart_class .= 'btn-danger';
                }
                if ($data['moneymaker2_modules_quickorder_enabled']) {
                    $moneymaker2_quickorder_tooltip = '';
                    if ($data['moneymaker2_common_cart_outofstock_disabled']&&$result['quantity'] <= 0) {
                        $moneymaker2_quickorder_tooltip .= "<p class='text-muted'>" . $data['moneymaker2_modules_quickorder_button_title'] . "</p>";
                        $moneymaker2_quickorder_tooltip .= "<p>" . $moneymaker2_stock . "</p>";
                    } else {
                        $moneymaker2_quickorder_tooltip .= "<p>" . $data['moneymaker2_modules_quickorder_button_title'] . "</p>";
                    }
                    $moneymaker2_quickorder_class = 'btn btn-default';
                    if ($data['moneymaker2_common_cart_outofstock_disabled']&&$result['quantity'] <= 0) {
                        $moneymaker2_quickorder_class .= ' disabled';
                    }
                }
                $data['related_products'][] = array(
                    'stickers'              => $moneymaker2_stickers,
                    'stock'                 => $this->config->get('moneymaker2_product_related_stock') ? $moneymaker2_stock : '',
                    'code'                  => $this->config->get('moneymaker2_product_related_code') ? $moneymaker2_code : '',
                    'sold'                  => $data['moneymaker2_common_cart_outofstock_disabled']&&$result['quantity'] <= 0 ? true : false,
                    'quantity'              => $result['quantity'],
                    'sort_order'            => $result['sort_order'],
                    'addtocart_tooltip'     => $moneymaker2_addtocart_tooltip,
                    'addtocart_class'       => $moneymaker2_addtocart_class,
                    'quickorder_tooltip'    => $data['moneymaker2_modules_quickorder_enabled'] ? $moneymaker2_quickorder_tooltip : '',
                    'quickorder_class'      => $data['moneymaker2_modules_quickorder_enabled'] ? $moneymaker2_quickorder_class : '',
                    'quickorder_tax'        => (($this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], 0), $this->session->data['currency']) !== $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], 1), $this->session->data['currency']))&&(!$this->config->get('config_tax'))) ? true : false,
                    /*mmr*/

                    'base_price'          => (isset($result['base_price']) and $result['base_price'] > 0 ) ? $this->currency->format(1, $result['base_currency_code'], $result['base_price'], true) : '',
                    'base_special'        => (isset($result['base_special']) and $result['base_special'] > 0 ) ? $this->currency->format(1, $result['base_currency_code'], $result['base_special'], true) : '',
                    'product_id'  => $result['product_id'],
                    'hpm_block' => !empty($result['hpm_block']) ? $result['hpm_block'] : '',
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($add_desc_result['out_description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price'       => $price,
                    'special'     => $special,
                    'tax'         => $tax,
                    'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }


            $data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

            array_pop($data['breadcrumbs']);

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$data['content_modal_filter'] = $this->load->controller('extension/module/smart_filter');

			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
            $data['content_modal_filter'] = $this->load->controller('extension/module/smart_filter');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'reply_to_review'       => nl2br($result['reply_to_review']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
    public function getOptionDescription() {
        $json = array();

        if ($this->request->post['option_id'] && $this->request->post['option_value_id']) {

            $this->load->model('catalog/product');

            $option_id = $this->request->post['option_id'];
            $option_value_id = $this->request->post['option_value_id'];

            $option_description = $this->model_catalog_product->getOptionDescription($option_id, $option_value_id);

            if($option_description) {
                $json['html'] = html_entity_decode($option_description, ENT_QUOTES, 'UTF-8');

                $json['success'] = 1;

                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));

            } else {
                $json['success'] = 0;

                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
            }
        }
    }
}
