<?php
class ControllerProductStatSeoPage extends Controller {
	public function index() {

		$this->load->language('product/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

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
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);


				$this->document->setTitle('Магнитолы в стиле Тесла на OS Android 10.1');

				$data['heading_title'] = 'Магнитолы в стиле Тесла на OS Android 10.1';


//            $this->document->setKeywords();

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => 'Штатные головные устройства в стиле Tesla',
				'href' => $this->url->link('product/stat_seo_page')
			);


            $data['description'] = 'На многих современных автомобилях невозможно заменить штатную аудио систему по причине того что на нее завязаны многие незаменимые функции автомобиля, такие как управление климат-контролем, управление штатным усилителем, бортовой компьютер, ну или хотя бы отображение температуры на улице. Штатные мультимедийные системы в стиле Тесла, или как еще называют магнитолы с вертикальным экраном, являются единственным возможным решением. Эти устройства можно установить в автомобиль не делая вмешательств в штатную систему, не нужно ничего пилить, резать, переделывать... При этом у вас будут сохранены все важные функции автомобиля, в том числе штатная камера заднего вида, система кругового обзора, или кнопки управления климатом на руле.';
            $data['additional_description'] = 'Штатные магнитолы в стиле Tesla, или как их еще называют Tesla Style, Tesla Screen, отличное решение для замены штатной аудиосистемы. Поддержка Can-шины автомобиля, вывод данных на экран, управление климат-контролем на дисплее магнитолы и многое другое.';

            $this->document->setDescription('Штатные магнитолы в стиле Tesla, или как их еще называют Tesla Style, Tesla Screen, отличное решение для замены штатной аудиосистемы. Поддержка Can-шины автомобиля, вывод данных на экран, управление климат-контролем на дисплее магнитолы и многое другое.');

			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['products'] = array();
                    $filter_data = array(
                        'filter_category_id' => false,
                        'filter_filter'      => $filter,
                        'smart_filter'      => false,
                        'stat_seo_page' => 1,
                        'sort'               => $sort,
                        'order'              => $order,
                        'start'              => ($page - 1) * $limit,
                        'limit'              => $limit
                    );

                    $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

                    $results = $this->model_catalog_product->getProducts($filter_data);

                    foreach ($results as $result) {
                        if ($result['image']) {
                            $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
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

                        $data['products'][$result['product_id']] = array(
                            'product_id'  => $result['product_id'],
                            'thumb'       => $image,
                            'name'        => $result['name'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($add_desc_result['out_description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                            'price'       => $price,
                            'base_price'          => (isset($result['base_price']) and $result['base_price'] > 0 ) ? $this->currency->format(1, $result['base_currency_code'], $result['base_price'], true) : '',
                            'base_special'        => (isset($result['base_special']) and $result['base_special'] > 0 ) ? $this->currency->format(1, $result['base_currency_code'], $result['base_special'], true) : '',
                            'special'     => $special,
                            'tax'         => $tax,
                            'minimum'     => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                            'rating'      => $rating,
                            'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
                        );
                    }


			$url = '';

            if(isset($this->request->get['car']) && isset($this->request->get['mark']) && isset($this->request->get['model'])) {
                $url .= '&car=' . $this->request->get['car'];
                $url .= '&mark=' . $this->request->get['mark'];
                $url .= '&model=' . $this->request->get['model'];
                if(isset($this->request->get['generation'])) {
                    $url .= '&generation=' . $this->request->get['generation'];
                }
            }

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/stat_seo_page', 'sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/stat_seo_page', 'sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/stat_seo_page', 'sort=p.model&order=DESC' . $url)
			);

			$url = '';

            if(isset($this->request->get['car']) && isset($this->request->get['mark']) && isset($this->request->get['model'])) {
                $url .= '&car=' . $this->request->get['car'];
                $url .= '&mark=' . $this->request->get['mark'];
                $url .= '&model=' . $this->request->get['model'];
                if(isset($this->request->get['generation'])) {
                    $url .= '&generation=' . $this->request->get['generation'];
                }
            }

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/stat_seo_page', 'limit=' . $value)
				);
			}

			$url = '';

            if(isset($this->request->get['car']) && isset($this->request->get['mark']) && isset($this->request->get['model'])) {
                $url .= '&car=' . $this->request->get['car'];
                $url .= '&mark=' . $this->request->get['mark'];
                $url .= '&model=' . $this->request->get['model'];
                if(isset($this->request->get['generation'])) {
                    $url .= '&generation=' . $this->request->get['generation'];
                }
            }

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/stat_seo_page', 'page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('product/stat_seo_page', '', true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/stat_seo_page', '', true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/stat_seo_page', 'page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/stat_seo_page', 'page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/stat_seo_page', $data));

	}
}
