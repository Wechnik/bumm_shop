<?php
class ControllerExtensionThemeMoneymaker2 extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/theme/moneymaker2');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('../catalog/view/theme/moneymaker2/stylesheet/animate.min.css');
		$this->document->addStyle('view/javascript/jquery/colpick.moneymaker2/colpick.css');
		$this->document->addScript('view/javascript/jquery/colpick.moneymaker2/colpick.js');

		$this->document->addStyle('view/javascript/jquery/bootstrap-slider.moneymaker2/bootstrap-slider.min.css');
		$this->document->addScript('view/javascript/jquery/bootstrap-slider.moneymaker2/bootstrap-slider.min.js');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (isset($this->request->post['moneymaker2_product_points'])) {
					foreach ($this->request->post['moneymaker2_product_points'] as $key => $value) {
							$this->request->post['moneymaker2_product_points'][$key]['categories'] = explode('::', substr($this->request->post['moneymaker2_product_points'][$key]['categories'], 1, -1));
					}
			}
			if (isset($this->request->post['moneymaker2_categories_advantages'])) {
					foreach ($this->request->post['moneymaker2_categories_advantages'] as $key => $value) {
							$this->request->post['moneymaker2_categories_advantages'][$key]['categories'] = explode('::', substr($this->request->post['moneymaker2_categories_advantages'][$key]['categories'], 1, -1));
					}
			}
			if (isset($this->request->post['moneymaker2_header_categories_panel_description_categories'])) {
					$this->request->post['moneymaker2_header_categories_panel_description_categories'] = explode('::', substr($this->request->post['moneymaker2_header_categories_panel_description_categories'], 1, -1));
				}
			if (isset($this->request->post['moneymaker2_product_tabs'])) {
					foreach ($this->request->post['moneymaker2_product_tabs'] as $key => $value) {
							$this->request->post['moneymaker2_product_tabs'][$key]['categories'] = explode('::',substr($this->request->post['moneymaker2_product_tabs'][$key]['categories'],1,-1));
					}
			}
			if (isset($this->request->post['moneymaker2_modules_promos'])) {
				foreach ($this->request->post['moneymaker2_modules_promos'] as $key => $value) {
					$this->request->post['moneymaker2_modules_promos'][$key]['categories'] = explode('::', substr($this->request->post['moneymaker2_modules_promos'][$key]['categories'], 1, -1));
				}
			}
			if (isset($this->request->post['moneymaker2_common_categories_icons_keys'])&&isset($this->request->post['moneymaker2_common_categories_icons_values'])) {
				$moneymaker2_common_categories_icons_values = explode('::', substr($this->request->post['moneymaker2_common_categories_icons_values'],1,-1) );
				$moneymaker2_common_categories_icons_keys = explode('::', substr($this->request->post['moneymaker2_common_categories_icons_keys'],1,-1) );
				foreach ($moneymaker2_common_categories_icons_values as $key => $value) {
					$moneymaker2_common_categories_icons[$moneymaker2_common_categories_icons_keys[$key]] = $moneymaker2_common_categories_icons_values[$key];
				}
				$this->request->post['moneymaker2_common_categories_icons'] = $moneymaker2_common_categories_icons;
				$this->request->post['moneymaker2_common_categories_icons_keys'] = false;
				$this->request->post['moneymaker2_common_categories_icons_values'] = false;
			}
			if (isset($this->request->post['moneymaker2_common_informations_icons_keys'])&&isset($this->request->post['moneymaker2_common_informations_icons_values'])) {
				$moneymaker2_common_informations_icons_values = explode('::', substr($this->request->post['moneymaker2_common_informations_icons_values'],1,-1) );
				$moneymaker2_common_informations_icons_keys = explode('::', substr($this->request->post['moneymaker2_common_informations_icons_keys'],1,-1) );
				foreach ($moneymaker2_common_informations_icons_values as $key => $value) {
					$moneymaker2_common_informations_icons[$moneymaker2_common_informations_icons_keys[$key]] = $moneymaker2_common_informations_icons_values[$key];
				}
				$this->request->post['moneymaker2_common_informations_icons'] = $moneymaker2_common_informations_icons;
				$this->request->post['moneymaker2_common_informations_icons_keys'] = false;
				$this->request->post['moneymaker2_common_informations_icons_values'] = false;
			}

			$this->model_setting_setting->editSetting('moneymaker2', $this->request->post, $this->request->get['store_id']);
			$this->session->data['success'] = $this->language->get('text_success');
			if(isset($this->request->post['apply']) and $this->request->post['apply'])
				$this->response->redirect($this->url->link('extension/theme/moneymaker2', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], true));
			else
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=theme', true));
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=theme', true));
		}

		$text_strings = array(
			'heading_title',

			'text_edit',
			'text_enabled',
			'text_disabled',

			//'text_product',
			'text_image',
			'text_general',
			//'entry_status',
			'entry_product_limit',
			'entry_product_description_length',
			'entry_directory',
			'entry_image_category',
			'entry_image_thumb',
			'entry_image_popup',
			'entry_image_product',
			'entry_image_additional',
			'entry_image_related',
			'entry_image_compare',
			'entry_image_wishlist',
			'entry_image_cart',
			'entry_image_location',
			'help_product_limit',
			'help_product_description_length',
			//'button_save',
			//'button_cancel',

			'text_select',
			'text_yes',
			'text_no',
			'text_select_all',
			'text_unselect_all',

			'entry_status',
			'entry_mode',
			'entry_text',
			'entry_header',
			'entry_title',
			'entry_description',
			'entry_tooltip',
			'entry_image',
			'entry_image_bg_properties',
			'entry_icon',
			'entry_icon_hidden_help',
			'entry_color',
			'entry_style',
			'entry_style_help',
			'entry_opacity',
			'entry_glowing',
			'entry_button_title',
			'entry_caption',
			'entry_display_caption',
			'entry_divider',
			'entry_optional',
			'entry_px',
			'entry_width',
			'entry_height',
			'entry_size',
			'entry_links',
			'entry_quicklinks',
			'entry_display_button',
			'entry_sort_order',
			'entry_category',
			'entry_categories',
			'entry_telephone',
			'entry_columns',
			'entry_screen_xlarge',
			'entry_screen_large',
			'entry_screen_medium',
			'entry_screen_small',
			'entry_screen_xsmall',
			'entry_screen_xxsmall',
			'entry_screen_xxxsmall',
			'entry_caption_hidden',
			'entry_on_screen_xlg',
			'entry_on_screen_lg',
			'entry_on_screen_lg_md',
			'entry_on_screen_lg_md_sm',
			'entry_static',
			'entry_hover',
			'entry_click',
			'entry_active',
			'entry_specials',
			'entry_popular',
			'entry_new',
			'entry_rated',
			'entry_discount',
			'entry_difference',
			'entry_percentage',
			'entry_limit',
			'entry_delay',
			'entry_days',
			'entry_seconds',
			'entry_background',
			'entry_rating',
			'entry_views',
			'entry_custom',
			'entry_field',
			'entry_list',
			'entry_grid',
			'entry_instock',
			'entry_other',
			'entry_layout',
			'entry_options',
			'entry_categories_options',
			'entry_products_options',
			'entry_cart',
			'entry_search',
			'entry_menu',
			'entry_top_menu',
			'entry_categories_menu',
			'entry_categories_panel',
			'entry_display_image',
			'entry_display_images',
			'entry_display_charts',
			'entry_display_model',
			'entry_display_brand',
			'entry_display_availability',
			'entry_display_rating',
			'entry_display_description',
			'entry_display_description_buttons',
			'entry_display_attributes_buttons',
			'entry_display_weight',
			'entry_display_dimensions',
			'entry_display_product_code',
			'entry_display_header_product_code',
			'entry_display_attributes_product_code',
			'entry_display_map',
			'entry_products',
			'entry_dropdowns',
			'entry_in_dropdown',
			'entry_animation',
			'entry_animation_in',
			'entry_animation_out',
			'entry_add_banner',
			'entry_compare',
			'entry_delimiter',
			'entry_chart_line',
			'entry_chart_bar',
			'entry_attribute',
			'entry_unit',
			'entry_stock_status',
			'entry_stock_status_color',
			'entry_product_code',
			'entry_product_code_field',
			'entry_photogallery',
			'entry_main_points',
			'entry_manufacturer',
			'entry_tabs',
			'entry_image_size',
			'entry_logo_size',
			'entry_advanced',
			'entry_input_mask',
			'entry_phone_mask_help',
			'entry_socials',
			'entry_target_blank',
			'entry_logo',
			'entry_contacts',
			'entry_copyrights',
			'entry_year_foundation',
			'entry_address',
			'entry_code',
			'entry_custom_css',
			//'entry_custom_js',
			'entry_sender',
			'entry_recipient',
			'entry_related',
			'entry_native',
			'entry_bestseller',
			'entry_featured',
			'entry_latest',
			'entry_special',
			'entry_manufacturers',
			'entry_font_color',
			'entry_multilanguage',
			'entry_informations',
			'entry_showeditor_help',
			'entry_file_updated',
			'entry_file_not_opened',
			'entry_file_not_writable',
			'entry_file_not_found',
			'entry_file_unchanged',
			'entry_border_strip',
			'entry_themes',
			'entry_themes_help',
			'entry_primary_color',
			'entry_computed_colors',
			'entry_computed_colors_help',
			'entry_computed_color_primary_help',
			'entry_computed_color_darken_15_help',
			'entry_computed_color_darken_10_help',
			'entry_computed_color_darken_5_help',
			'entry_computed_color_darken_30_help',
			'entry_computed_color_darken_17_help',
			'entry_computed_color_lighten_20_help',
			'entry_computed_color_lighten_17_help',
			'entry_computed_color_lighten_25_help',
			'entry_fullscreen_slideshow',
			'entry_symbols',
			'entry_sidebars',
			'entry_responsive',
			'entry_standart',
			'entry_social_bookmarking',
			'entry_products_carousel',
			'entry_home_page',
			'entry_pages',
			'entry_decrease_size',
			'entry_information',
			'entry_separate_block',

			'entry_tab_common',
			'entry_tab_common_help',

			'entry_tab_product',
			'entry_tab_product_help',
			'entry_product_metatitles_enabled',
			'entry_product_metatitles_enabled_help',
			'entry_product_gallery_moved',
			'entry_product_gallery_round',
			'entry_product_gallery_thumbs_round',
			'entry_product_thumbs',
			'entry_product_main_points_help',
			'entry_product_points_stock_default',
			'entry_product_points_stock_default_help',
			'entry_product_points_add_point_help',
			'entry_product_options_hide',
			'entry_product_tabs_help',
			'entry_product_tabs_display',
			'entry_product_tabs_display_help',
			'entry_product_tabs_headers',
			'entry_product_tabs_headers_help',
			'entry_product_tabs_attributes_responsive',
			'entry_product_tabs_attributes_display_code',
			'entry_product_tabs_reviews_indexed',
			'entry_product_tabs_add_help',
			'entry_product_related_help',

			'entry_common_buy',
			'entry_common_wishlist',
			'entry_common_compare',
			'entry_common_sidebars_responsive_help',
			'entry_common_cart_outofstock_disabled',
			'entry_common_cart_outofstock_disabled_help',
			'entry_common_price_detached',
			'entry_common_price_detached_help',
			'entry_common_dropdown_hover',
			'entry_common_browser_warned',
			'entry_common_browser_warned_help',
			'entry_common_scrolltop',
			'entry_common_agree_warning',
			'entry_common_minify',
			'entry_common_minify_help',
			'entry_common_categories_help',
			'entry_common_custom_icons',
			'entry_common_categories_icons_help',
			'entry_common_products_help',
			'entry_common_products_title_overflow',
			'entry_common_products_title_overflow_help',
			'entry_common_products_title_overflow_gradient',
			'entry_common_products_title_overflow_2lines',
			'entry_common_products_title_overflow_3lines',
			'entry_common_products_title_overflow_4lines',
			'entry_common_informations_help',

			'entry_tab_header',
			'entry_header_help',
			'entry_header_alert',
			'entry_header_alert_help',
			'entry_header_strip_expanded',
			'entry_header_strip_language',
			'entry_header_strip_currency',
			'entry_header_strip_fixed',
			'entry_header_strip_fixed_help',
			'entry_header_strip_toggle_search',
			'entry_header_strip_toggle_cart',
			'entry_header_strip_toggle_language',
			'entry_header_strip_font_color_help',
			'entry_header_logo_help',
			'entry_header_logo_custom',
			'entry_header_contacts_help',
			'entry_header_contacts_phone_help',
			'entry_header_contacts_phone_highlight',
			'entry_header_contacts_caption_help',
			'entry_header_categories_help',
			'entry_header_categories_list_help',
			'entry_header_categories_caption_help',
			'entry_header_categories_mode_help',
			'entry_header_categories_showparents',
			'entry_header_categories_showchilds',
			'entry_header_categories_add_banner_help',
			'entry_header_categories_banners_sort_order_help',
			'entry_header_categories_banners_outer_sort_order_help',
			'entry_header_categories_panel_help',
			'entry_header_categories_panel_expanded',
			'entry_header_categories_panel_fixed_help',
			'entry_header_categories_panel_mode_help',
			'entry_header_categories_panel_description_help',
			'entry_header_cart_help',
			'entry_header_cart_custom',
			'entry_header_search_help',
			'entry_header_search_moved',
			'entry_header_search_moved_help',
			'entry_header_search_ajax',
			'entry_header_search_ajax_price',
			'entry_header_menu_help',
			'entry_header_menu_links_enabled',
			'entry_header_menu_links_top_enabled',
			'entry_header_menu_links_dropdown_help',

			'entry_tab_footer',
			'entry_footer_help',
			'entry_footer_display_information',
			'entry_footer_display_customer',
			'entry_footer_display_extras',
			'entry_footer_display_account',
			'entry_footer_display_copyrights',
			'entry_footer_display_powered',

			'entry_tab_catalog',
			'entry_tab_catalog_help',
			'entry_catalog_layout_default',
			'entry_catalog_layout_switcher',
			'entry_catalog_categories_metatitles_enabled',
			'entry_catalog_categories_metatitles_enabled_help',
			'entry_catalog_categories_display_image',
			'entry_catalog_categories_image_round',
			'entry_catalog_categories_display_images',
			'entry_catalog_categories_display_icons',
			'entry_catalog_categories_move_description',
			'entry_catalog_categories_advantages',
			'entry_catalog_categories_advantages_help',
			'entry_catalog_categories_advantages_add_help',
			'entry_catalog_contacts_help',
			'entry_catalog_contacts_call_title',
			'entry_catalog_contacts_mail_title',
			'entry_catalog_contacts_link_title',
			'entry_catalog_contacts_map_help',
			'entry_catalog_contacts_map_key',
			'entry_catalog_contacts_map_key_help',
			'entry_catalog_compare_charts_price_display',
			'entry_catalog_compare_chart_display_code',
			'entry_catalog_compare_chart_decimal_delimiter_help',
			'entry_catalog_compare_chart_add',
			'entry_catalog_compare_chart_add_help',
			'entry_catalog_compare_chart_functions',
			'entry_catalog_compare_chart_sort_help',

			'entry_tab_modules',
			'entry_tab_modules_help',

			'entry_tab_sticker',
			'entry_tab_stickers',
			'entry_modules_native_help',
			'entry_modules_stickers_help',
			'entry_modules_stickers_specials_help',
			'entry_modules_stickers_popular_help',
			'entry_modules_stickers_rated_help',
			'entry_modules_stickers_new_help',
			'entry_modules_customstickers_help',
			'entry_modules_promostickers_help',

			'entry_tab_promo',
			'entry_modules_promo_help',
			'entry_modules_promo_add_help',

			'entry_tab_quickorder',
			'entry_modules_quickorder_help',
			'entry_modules_quickorder_fill_email',
			'entry_modules_quickorder_fill_email_help',
			'entry_modules_quickorder_display_thumb',
			'entry_modules_quickorder_display_catalog',
			'entry_modules_quickorder_display_popupcart',
			'entry_modules_quickorder_display_checkoutcart',
			'entry_modules_goal_google',
			'entry_modules_quickorder_goal_google_help',
			'entry_modules_goal_yandex',
			'entry_modules_quickorder_goal_yandex_help',
			'entry_modules_goal_yandex_counter',

			'entry_tab_callback',
			'entry_modules_callback_help',
			'entry_modules_callback_goal_google_help',
			'entry_modules_callback_goal_yandex_help',

			'entry_tab_newsletter',
			'entry_modules_newsletter_help',
			'entry_tab_popup',
			'entry_modules_popup_help',
			'entry_tab_timer',
			'entry_modules_timer_help',
			'entry_tab_snow',
			'entry_modules_snow_help',

			'entry_tab_help',
			'entry_help_text',

			'button_apply',
			'button_save',
			'button_cancel',
			'button_add',
			'button_remove',
			'button_view',
			'button_close',
			'button_link',

			'tab_data',
			//'tab_image',
		);

		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['product_limit'])) {
			$data['error_product_limit'] = $this->error['product_limit'];
		} else {
			$data['error_product_limit'] = '';
		}

		if (isset($this->error['product_description_length'])) {
			$data['error_product_description_length'] = $this->error['product_description_length'];
		} else {
			$data['error_product_description_length'] = '';
		}

		if (isset($this->error['image_category'])) {
			$data['error_image_category'] = $this->error['image_category'];
		} else {
			$data['error_image_category'] = '';
		}

		if (isset($this->error['image_thumb'])) {
			$data['error_image_thumb'] = $this->error['image_thumb'];
		} else {
			$data['error_image_thumb'] = '';
		}

		if (isset($this->error['image_popup'])) {
			$data['error_image_popup'] = $this->error['image_popup'];
		} else {
			$data['error_image_popup'] = '';
		}

		if (isset($this->error['image_product'])) {
			$data['error_image_product'] = $this->error['image_product'];
		} else {
			$data['error_image_product'] = '';
		}

		if (isset($this->error['image_additional'])) {
			$data['error_image_additional'] = $this->error['image_additional'];
		} else {
			$data['error_image_additional'] = '';
		}

		if (isset($this->error['image_related'])) {
			$data['error_image_related'] = $this->error['image_related'];
		} else {
			$data['error_image_related'] = '';
		}

		if (isset($this->error['image_compare'])) {
			$data['error_image_compare'] = $this->error['image_compare'];
		} else {
			$data['error_image_compare'] = '';
		}

		if (isset($this->error['image_wishlist'])) {
			$data['error_image_wishlist'] = $this->error['image_wishlist'];
		} else {
			$data['error_image_wishlist'] = '';
		}

		if (isset($this->error['image_cart'])) {
			$data['error_image_cart'] = $this->error['image_cart'];
		} else {
			$data['error_image_cart'] = '';
		}

		if (isset($this->error['image_location'])) {
			$data['error_image_location'] = $this->error['image_location'];
		} else {
			$data['error_image_location'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		// loading languages
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		// loading articles
		$this->load->model('catalog/information');
		$data['informations'] = $this->model_catalog_information->getInformations();

		// loading categories
		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(0);

		// loading attributes
		$this->load->model('catalog/attribute');
		$data['attributes'] = $this->model_catalog_attribute->getAttributes();
		$this->load->model('catalog/attribute_group');
		$data['attribute_groups'] = $this->model_catalog_attribute_group->getAttributeGroups();

		// loading stock statuses
		$this->load->model('localisation/stock_status');
		$data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		$data['config_email'] = $this->config->get('config_email');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_theme'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=theme', true)
		);

		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/theme/moneymaker2', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], true)
		);

		$data['action'] = $this->url->link('extension/theme/moneymaker2', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=theme', true);

		if (isset($this->request->get['store_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$setting_info = $this->model_setting_setting->getSetting('moneymaker2', $this->request->get['store_id']);
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['moneymaker2_header_contacts'])) {
			$results = $this->request->post['moneymaker2_header_contacts'];
		} elseif (isset($setting_info['moneymaker2_header_contacts'])) {
			$results = $setting_info['moneymaker2_header_contacts'];
		} else {
			$results = array();
		}
		$data['moneymaker2_header_contacts'] = array();
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
			$data['moneymaker2_header_contacts'][] = array(
				'image' => $image,
				'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
				'text' => $result['text'],
				'mode'  => $result['mode'],
				'icon'  => $result['icon'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['moneymaker2_header_banners'])) {
			$results = $this->request->post['moneymaker2_header_banners'];
		} elseif (isset($setting_info['moneymaker2_header_banners'])) {
			$results = $setting_info['moneymaker2_header_banners'];
		} else {
			$results = array();
		}
		$data['moneymaker2_header_banners'] = array();
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
			$data['moneymaker2_header_banners'][] = array(
				'image' => $image,
				'icon' => $result['icon'],
				'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
				'text' => $result['text'],
				'name' => $result['name'],
				'style'  => $result['style'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_header_panelbanners'])) {
			$results = $this->request->post['moneymaker2_header_panelbanners'];
		} elseif (isset($setting_info['moneymaker2_header_panelbanners'])) {
			$results = $setting_info['moneymaker2_header_panelbanners'];
		} else {
			$results = array();
		}
		$data['moneymaker2_header_panelbanners'] = array();
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
			$data['moneymaker2_header_panelbanners'][] = array(
				'image' => $image,
				'icon' => $result['icon'],
				'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
				'text' => $result['text'],
				'name' => $result['name'],
				'style'  => $result['style'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
				'sort_order_outer'  => $result['sort_order_outer'],
			);
		}

		if (isset($this->request->post['moneymaker2_header_panellinks'])) {
			$results = $this->request->post['moneymaker2_header_panellinks'];
		} elseif (isset($setting_info['moneymaker2_header_panellinks'])) {
			$results = $setting_info['moneymaker2_header_panellinks'];
		} else {
			$results = array();
		}
		$data['moneymaker2_header_panellinks'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_header_panellinks'][] = array(
				'icon' => $result['icon'],
				'caption' => $result['caption'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_header_links'])) {
			$results = $this->request->post['moneymaker2_header_links'];
		} elseif (isset($setting_info['moneymaker2_header_links'])) {
			$results = $setting_info['moneymaker2_header_links'];
		} else {
			$results = array();
		}
		$data['moneymaker2_header_links'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_header_links'][] = array(
				'icon' => $result['icon'],
				'caption' => $result['caption'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_footer_contacts'])) {
			$results = $this->request->post['moneymaker2_footer_contacts'];
		} elseif (isset($setting_info['moneymaker2_footer_contacts'])) {
			$results = $setting_info['moneymaker2_footer_contacts'];
		} else {
			$results = array();
		}
		$data['moneymaker2_footer_contacts'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_footer_contacts'][] = array(
				'caption' => $result['caption'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_footer_links'])) {
			$results = $this->request->post['moneymaker2_footer_links'];
		} elseif (isset($setting_info['moneymaker2_footer_links'])) {
			$results = $setting_info['moneymaker2_footer_links'];
		} else {
			$results = array();
		}
		$data['moneymaker2_footer_links'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_footer_links'][] = array(
				'caption' => $result['caption'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_footer_socials'])) {
			$results = $this->request->post['moneymaker2_footer_socials'];
		} elseif (isset($setting_info['moneymaker2_footer_socials'])) {
			$results = $setting_info['moneymaker2_footer_socials'];
		} else {
			$results = array();
		}
		$data['moneymaker2_footer_socials'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_footer_socials'][] = array(
				'icon' => $result['icon'],
				'caption' => $result['caption'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_product_points'])) {
			$results = $this->request->post['moneymaker2_product_points'];
		} elseif (isset($setting_info['moneymaker2_product_points'])) {
			$results = $setting_info['moneymaker2_product_points'];
		} else {
			$results = array();
		}
		$data['moneymaker2_product_points'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_product_points'][] = array(
				'icon' => $result['icon'],
				'categories' => isset($result['categories'])&&$result['categories'] ? $result['categories'] : array(0),
				'text' => $result['text'],
				'name' => $result['name'],
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_product_tabs'])) {
			$results = $this->request->post['moneymaker2_product_tabs'];
		} elseif (isset($setting_info['moneymaker2_product_tabs'])) {
			$results = $setting_info['moneymaker2_product_tabs'];
		} else {
			$results = array();
		}
		$data['moneymaker2_product_tabs'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_product_tabs'][] = array(
				'categories' => isset($result['categories'])&&$result['categories'] ? $result['categories'] : array(0),
				'link'          => $result['link'],
				'name' => $result['name'],
				'sort_order'  => $result['sort_order'],
			);
		}


		if (isset($this->request->post['moneymaker2_categories_advantageslinks'])) {
			$results = $this->request->post['moneymaker2_categories_advantageslinks'];
		} elseif (isset($setting_info['moneymaker2_categories_advantageslinks'])) {
			$results = $setting_info['moneymaker2_categories_advantageslinks'];
		} else {
			$results = array();
		}
		$data['moneymaker2_categories_advantageslinks'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_categories_advantageslinks'][] = array(
				'icon' => $result['icon'],
				'caption' => $result['caption'],
				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

		if (isset($this->request->post['moneymaker2_modules_promos'])) {
			$results = $this->request->post['moneymaker2_modules_promos'];
		} elseif (isset($setting_info['moneymaker2_modules_promos'])) {
			$results = $setting_info['moneymaker2_modules_promos'];
		} else {
			$results = array();
		}
		$data['moneymaker2_modules_promos'] = array();
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
			$data['moneymaker2_modules_promos'][] = array(
				'image'					=> $image,
				'thumb'					=> $this->model_tool_image->resize($thumb, 100, 100),
				'categories'		=> isset($result['categories'])&&$result['categories'] ? $result['categories'] : array(0),
				'sort_order'		=> $result['sort_order'],
				'text'					=> $result['text'],
				'title'					=> $result['title'],
				'link'					=> $result['link'],
				'description'		=> $result['description'],
			);
		}

		if (isset($this->request->post['moneymaker2_categories_advantages'])) {
			$results = $this->request->post['moneymaker2_categories_advantages'];
		} elseif (isset($setting_info['moneymaker2_categories_advantages'])) {
			$results = $setting_info['moneymaker2_categories_advantages'];
		} else {
			$results = array();
		}
		$data['moneymaker2_categories_advantages'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_categories_advantages'][] = array(
				'icon' => $result['icon'],
				'categories' => isset($result['categories'])&&$result['categories'] ? $result['categories'] : array(0),
				'name' => $result['name'],
				'link' => $result['link'],
				'style' => $result['style'],
			);
		}

		if (isset($this->request->post['moneymaker2_catalog_compare_charts'])) {
			$results = $this->request->post['moneymaker2_catalog_compare_charts'];
		} elseif (isset($setting_info['moneymaker2_catalog_compare_charts'])) {
			$results = $setting_info['moneymaker2_catalog_compare_charts'];
		} else {
			$results = array();
		}
		$data['moneymaker2_catalog_compare_charts'] = array();
		foreach ($results as $result) {
			$data['moneymaker2_catalog_compare_charts'][] = array(
				'mode'					=> $result['mode'],
				'fns'						=> $result['fns'],
				'delimiter'			=> $result['delimiter'],
				'attribute'			=> $result['attribute'],
				'unit'					=> $result['unit'],
			);
		}

		if (isset($this->request->post['moneymaker2_common_themes_image_src'])) {
			$data['moneymaker2_common_themes_image_src'] = $this->request->post['moneymaker2_common_themes_image_src'];
		} elseif (isset($setting_info['moneymaker2_common_themes_image_src'])) {
			$data['moneymaker2_common_themes_image_src'] = $setting_info['moneymaker2_common_themes_image_src'];
		} else {
			$data['moneymaker2_common_themes_image_src'] = '';
		}
		if (isset($this->request->post['moneymaker2_common_themes_image_src']) && is_file(DIR_IMAGE . $this->request->post['moneymaker2_common_themes_image_src'])) {
			$data['moneymaker2_common_themes_thumb'] = $this->model_tool_image->resize($this->request->post['moneymaker2_common_themes_image_src'], 100, 100);
		} elseif (isset($setting_info['moneymaker2_common_themes_image_src']) && is_file(DIR_IMAGE . $setting_info['moneymaker2_common_themes_image_src'])) {
			$data['moneymaker2_common_themes_thumb'] = $this->model_tool_image->resize($setting_info['moneymaker2_common_themes_image_src'], 100, 100);
		} else {
			$data['moneymaker2_common_themes_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['moneymaker2_header_cart_image_src'])) {
			$data['moneymaker2_header_cart_image_src'] = $this->request->post['moneymaker2_header_cart_image_src'];
		} elseif (isset($setting_info['moneymaker2_header_cart_image_src'])) {
			$data['moneymaker2_header_cart_image_src'] = $setting_info['moneymaker2_header_cart_image_src'];
		} else {
			$data['moneymaker2_header_cart_image_src'] = '';
		}
		if (isset($this->request->post['moneymaker2_header_cart_image_src']) && is_file(DIR_IMAGE . $this->request->post['moneymaker2_header_cart_image_src'])) {
			$data['moneymaker2_header_cart_thumb'] = $this->model_tool_image->resize($this->request->post['moneymaker2_header_cart_image_src'], 100, 100);
		} elseif (isset($setting_info['moneymaker2_header_cart_image_src']) && is_file(DIR_IMAGE . $setting_info['moneymaker2_header_cart_image_src'])) {
			$data['moneymaker2_header_cart_thumb'] = $this->model_tool_image->resize($setting_info['moneymaker2_header_cart_image_src'], 100, 100);
		} else {
			$data['moneymaker2_header_cart_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['moneymaker2_modules_callback_image_src'])) {
			$data['moneymaker2_modules_callback_image_src'] = $this->request->post['moneymaker2_modules_callback_image_src'];
		} elseif (isset($setting_info['moneymaker2_modules_callback_image_src'])) {
			$data['moneymaker2_modules_callback_image_src'] = $setting_info['moneymaker2_modules_callback_image_src'];
		} else {
			$data['moneymaker2_modules_callback_image_src'] = '';
		}
		if (isset($this->request->post['moneymaker2_modules_callback_image_src']) && is_file(DIR_IMAGE . $this->request->post['moneymaker2_modules_callback_image_src'])) {
			$data['moneymaker2_modules_callback_thumb'] = $this->model_tool_image->resize($this->request->post['moneymaker2_modules_callback_image_src'], 100, 100);
		} elseif (isset($setting_info['moneymaker2_modules_callback_image_src']) && is_file(DIR_IMAGE . $setting_info['moneymaker2_modules_callback_image_src'])) {
			$data['moneymaker2_modules_callback_thumb'] = $this->model_tool_image->resize($setting_info['moneymaker2_modules_callback_image_src'], 100, 100);
		} else {
			$data['moneymaker2_modules_callback_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		if (isset($this->request->post['moneymaker2_modules_newsletter_image_src'])) {
			$data['moneymaker2_modules_newsletter_image_src'] = $this->request->post['moneymaker2_modules_newsletter_image_src'];
		} elseif (isset($setting_info['moneymaker2_modules_newsletter_image_src'])) {
			$data['moneymaker2_modules_newsletter_image_src'] = $setting_info['moneymaker2_modules_newsletter_image_src'];
		} else {
			$data['moneymaker2_modules_newsletter_image_src'] = '';
		}
		if (isset($this->request->post['moneymaker2_modules_newsletter_image_src']) && is_file(DIR_IMAGE . $this->request->post['moneymaker2_modules_newsletter_image_src'])) {
			$data['moneymaker2_modules_newsletter_thumb'] = $this->model_tool_image->resize($this->request->post['moneymaker2_modules_newsletter_image_src'], 100, 100);
		} elseif (isset($setting_info['moneymaker2_modules_newsletter_image_src']) && is_file(DIR_IMAGE . $setting_info['moneymaker2_modules_newsletter_image_src'])) {
			$data['moneymaker2_modules_newsletter_thumb'] = $this->model_tool_image->resize($setting_info['moneymaker2_modules_newsletter_image_src'], 100, 100);
		} else {
			$data['moneymaker2_modules_newsletter_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['moneymaker2_product_limit'])) {
			$data['moneymaker2_product_limit'] = $this->request->post['moneymaker2_product_limit'];
		} elseif (isset($setting_info['moneymaker2_product_limit'])) {
			$data['moneymaker2_product_limit'] = $setting_info['moneymaker2_product_limit'];
		} else {
			$data['moneymaker2_product_limit'] = 15;
		}		
		
		if (isset($this->request->post['moneymaker2_status'])) {
			$data['moneymaker2_status'] = $this->request->post['moneymaker2_status'];
		} elseif (isset($setting_info['moneymaker2_status'])) {
			$data['moneymaker2_status'] = $setting_info['moneymaker2_status'];
		} else {
			$data['moneymaker2_status'] = '';
		}
		
		if (isset($this->request->post['moneymaker2_product_description_length'])) {
			$data['moneymaker2_product_description_length'] = $this->request->post['moneymaker2_product_description_length'];
		} elseif (isset($setting_info['moneymaker2_product_description_length'])) {
			$data['moneymaker2_product_description_length'] = $setting_info['moneymaker2_product_description_length'];
		} else {
			$data['moneymaker2_product_description_length'] = 100;
		}

		if (isset($this->request->post['theme_moneymaker2_directory'])) {
			$data['theme_moneymaker2_directory'] = $this->request->post['theme_moneymaker2_directory'];
		} elseif (isset($setting_info['theme_moneymaker2_directory'])) {
			$data['theme_moneymaker2_directory'] = $setting_info['theme_moneymaker2_directory'];
		} else {
			$data['theme_moneymaker2_directory'] = 'moneymaker2';
		}

		$data['directories'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);

		foreach ($directories as $directory) {
			$data['directories'][] = basename($directory);
		}

		if (isset($this->request->post['moneymaker2_image_category_width'])) {
			$data['moneymaker2_image_category_width'] = $this->request->post['moneymaker2_image_category_width'];
		} elseif (isset($setting_info['moneymaker2_image_category_width'])) {
			$data['moneymaker2_image_category_width'] = $setting_info['moneymaker2_image_category_width'];
		} else {
			$data['moneymaker2_image_category_width'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_category_height'])) {
			$data['moneymaker2_image_category_height'] = $this->request->post['moneymaker2_image_category_height'];
		} elseif (isset($setting_info['moneymaker2_image_category_height'])) {
			$data['moneymaker2_image_category_height'] = $setting_info['moneymaker2_image_category_height'];
		} else {
			$data['moneymaker2_image_category_height'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_thumb_width'])) {
			$data['moneymaker2_image_thumb_width'] = $this->request->post['moneymaker2_image_thumb_width'];
		} elseif (isset($setting_info['moneymaker2_image_thumb_width'])) {
			$data['moneymaker2_image_thumb_width'] = $setting_info['moneymaker2_image_thumb_width'];
		} else {
			$data['moneymaker2_image_thumb_width'] = 400;
		}
		
		if (isset($this->request->post['moneymaker2_image_thumb_height'])) {
			$data['moneymaker2_image_thumb_height'] = $this->request->post['moneymaker2_image_thumb_height'];
		} elseif (isset($setting_info['moneymaker2_image_thumb_height'])) {
			$data['moneymaker2_image_thumb_height'] = $setting_info['moneymaker2_image_thumb_height'];
		} else {
			$data['moneymaker2_image_thumb_height'] = 400;
		}
		
		if (isset($this->request->post['moneymaker2_image_popup_width'])) {
			$data['moneymaker2_image_popup_width'] = $this->request->post['moneymaker2_image_popup_width'];
		} elseif (isset($setting_info['moneymaker2_image_popup_width'])) {
			$data['moneymaker2_image_popup_width'] = $setting_info['moneymaker2_image_popup_width'];
		} else {
			$data['moneymaker2_image_popup_width'] = 650;
		}
		
		if (isset($this->request->post['moneymaker2_image_popup_height'])) {
			$data['moneymaker2_image_popup_height'] = $this->request->post['moneymaker2_image_popup_height'];
		} elseif (isset($setting_info['moneymaker2_image_popup_height'])) {
			$data['moneymaker2_image_popup_height'] = $setting_info['moneymaker2_image_popup_height'];
		} else {
			$data['moneymaker2_image_popup_height'] = 650;
		}
		
		if (isset($this->request->post['moneymaker2_image_product_width'])) {
			$data['moneymaker2_image_product_width'] = $this->request->post['moneymaker2_image_product_width'];
		} elseif (isset($setting_info['moneymaker2_image_product_width'])) {
			$data['moneymaker2_image_product_width'] = $setting_info['moneymaker2_image_product_width'];
		} else {
			$data['moneymaker2_image_product_width'] = 260;
		}
		
		if (isset($this->request->post['moneymaker2_image_product_height'])) {
			$data['moneymaker2_image_product_height'] = $this->request->post['moneymaker2_image_product_height'];
		} elseif (isset($setting_info['moneymaker2_image_product_height'])) {
			$data['moneymaker2_image_product_height'] = $setting_info['moneymaker2_image_product_height'];
		} else {
			$data['moneymaker2_image_product_height'] = 260;
		}
		
		if (isset($this->request->post['moneymaker2_image_additional_width'])) {
			$data['moneymaker2_image_additional_width'] = $this->request->post['moneymaker2_image_additional_width'];
		} elseif (isset($setting_info['moneymaker2_image_additional_width'])) {
			$data['moneymaker2_image_additional_width'] = $setting_info['moneymaker2_image_additional_width'];
		} else {
			$data['moneymaker2_image_additional_width'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_additional_height'])) {
			$data['moneymaker2_image_additional_height'] = $this->request->post['moneymaker2_image_additional_height'];
		} elseif (isset($setting_info['moneymaker2_image_additional_height'])) {
			$data['moneymaker2_image_additional_height'] = $setting_info['moneymaker2_image_additional_height'];
		} else {
			$data['moneymaker2_image_additional_height'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_related_width'])) {
			$data['moneymaker2_image_related_width'] = $this->request->post['moneymaker2_image_related_width'];
		} elseif (isset($setting_info['moneymaker2_image_related_width'])) {
			$data['moneymaker2_image_related_width'] = $setting_info['moneymaker2_image_related_width'];
		} else {
			$data['moneymaker2_image_related_width'] = 260;
		}
		
		if (isset($this->request->post['moneymaker2_image_related_height'])) {
			$data['moneymaker2_image_related_height'] = $this->request->post['moneymaker2_image_related_height'];
		} elseif (isset($setting_info['moneymaker2_image_related_height'])) {
			$data['moneymaker2_image_related_height'] = $setting_info['moneymaker2_image_related_height'];
		} else {
			$data['moneymaker2_image_related_height'] = 260;
		}
		
		if (isset($this->request->post['moneymaker2_image_compare_width'])) {
			$data['moneymaker2_image_compare_width'] = $this->request->post['moneymaker2_image_compare_width'];
		} elseif (isset($setting_info['moneymaker2_image_compare_width'])) {
			$data['moneymaker2_image_compare_width'] = $setting_info['moneymaker2_image_compare_width'];
		} else {
			$data['moneymaker2_image_compare_width'] = 260;
		}
		
		if (isset($this->request->post['moneymaker2_image_compare_height'])) {
			$data['moneymaker2_image_compare_height'] = $this->request->post['moneymaker2_image_compare_height'];
		} elseif (isset($setting_info['moneymaker2_image_compare_height'])) {
			$data['moneymaker2_image_compare_height'] = $setting_info['moneymaker2_image_compare_height'];
		} else {
			$data['moneymaker2_image_compare_height'] = 260;
		}
		
		if (isset($this->request->post['moneymaker2_image_wishlist_width'])) {
			$data['moneymaker2_image_wishlist_width'] = $this->request->post['moneymaker2_image_wishlist_width'];
		} elseif (isset($setting_info['moneymaker2_image_wishlist_width'])) {
			$data['moneymaker2_image_wishlist_width'] = $setting_info['moneymaker2_image_wishlist_width'];
		} else {
			$data['moneymaker2_image_wishlist_width'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_wishlist_height'])) {
			$data['moneymaker2_image_wishlist_height'] = $this->request->post['moneymaker2_image_wishlist_height'];
		} elseif (isset($setting_info['moneymaker2_image_wishlist_height'])) {
			$data['moneymaker2_image_wishlist_height'] = $setting_info['moneymaker2_image_wishlist_height'];
		} else {
			$data['moneymaker2_image_wishlist_height'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_cart_width'])) {
			$data['moneymaker2_image_cart_width'] = $this->request->post['moneymaker2_image_cart_width'];
		} elseif (isset($setting_info['moneymaker2_image_cart_width'])) {
			$data['moneymaker2_image_cart_width'] = $setting_info['moneymaker2_image_cart_width'];
		} else {
			$data['moneymaker2_image_cart_width'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_cart_height'])) {
			$data['moneymaker2_image_cart_height'] = $this->request->post['moneymaker2_image_cart_height'];
		} elseif (isset($setting_info['moneymaker2_image_cart_height'])) {
			$data['moneymaker2_image_cart_height'] = $setting_info['moneymaker2_image_cart_height'];
		} else {
			$data['moneymaker2_image_cart_height'] = 70;
		}
		
		if (isset($this->request->post['moneymaker2_image_location_width'])) {
			$data['moneymaker2_image_location_width'] = $this->request->post['moneymaker2_image_location_width'];
		} elseif (isset($setting_info['moneymaker2_image_location_width'])) {
			$data['moneymaker2_image_location_width'] = $setting_info['moneymaker2_image_location_width'];
		} else {
			$data['moneymaker2_image_location_width'] = 268;
		}
		
		if (isset($this->request->post['moneymaker2_image_location_height'])) {
			$data['moneymaker2_image_location_height'] = $this->request->post['moneymaker2_image_location_height'];
		} elseif (isset($setting_info['moneymaker2_image_location_height'])) {
			$data['moneymaker2_image_location_height'] = $setting_info['moneymaker2_image_location_height'];
		} else {
			$data['moneymaker2_image_location_height'] = 50;
		}


		$config_data = array(
			'moneymaker2_name',

			'moneymaker2_common_sidebars_responsive',
			'moneymaker2_common_buy_hide',
			'moneymaker2_common_wishlist_hide',
			'moneymaker2_common_wishlist_caption',
			'moneymaker2_common_compare_hide',
			'moneymaker2_common_compare_caption',
			'moneymaker2_common_css_enabled',
			'moneymaker2_common_css',
			//'moneymaker2_common_js_enabled',
			//'moneymaker2_common_js',
			'moneymaker2_common_cart_outofstock_disabled',
			'moneymaker2_common_price_detached',
			'moneymaker2_common_dropdown_hover',
			'moneymaker2_common_browser_warned',
			'moneymaker2_common_scrolltop',
			'moneymaker2_common_scrolltop_text',
			'moneymaker2_common_agree_warning',
			'moneymaker2_common_minify',
			'moneymaker2_common_themes_color_primary',
			'moneymaker2_common_themes_color_darken_15',
			'moneymaker2_common_themes_color_darken_10',
			'moneymaker2_common_themes_color_darken_5',
			'moneymaker2_common_themes_color_darken_30',
			'moneymaker2_common_themes_color_darken_17',
			'moneymaker2_common_themes_color_lighten_20',
			'moneymaker2_common_themes_color_lighten_17',
			'moneymaker2_common_themes_color_lighten_25',
			'moneymaker2_common_themes_colors_changed',
			'moneymaker2_common_themes_bg_mode',
			'moneymaker2_common_themes_bg_color',
			'moneymaker2_common_themes_bg_fixation',
			'moneymaker2_common_themes_bg_position',
			'moneymaker2_common_themes_bg_repeat',

			'moneymaker2_common_categories_icons_enabled',
			'moneymaker2_common_categories_icons',
			'moneymaker2_common_products_title_overflow',
			'moneymaker2_common_informations_icons_enabled',
			'moneymaker2_common_informations_icons',

			'moneymaker2_header_alert',
			'moneymaker2_header_alert_bg_color',
			'moneymaker2_header_alert_text',
			'moneymaker2_header_strip_expanded',
			'moneymaker2_header_strip_language',
			'moneymaker2_header_strip_currency',
			'moneymaker2_header_strip_fixed',
			'moneymaker2_header_strip_toggle_cart',
			'moneymaker2_header_strip_toggle_search',
			'moneymaker2_header_strip_toggle_language',
			'moneymaker2_header_strip_bg_color',
			'moneymaker2_header_strip_bg_transparency',
			'moneymaker2_header_strip_font_color',
			'moneymaker2_header_strip_sl_font_color',

			'moneymaker2_header_categorystrip_bg_color',
			'moneymaker2_header_categorystrip_bg_transparency',
			'moneymaker2_header_categorystrip_font_color',
			'moneymaker2_header_categorystrip_sl_font_color',

			'moneymaker2_header_logo_custom',
			'moneymaker2_header_logo_custom_icon',
			'moneymaker2_header_logo_custom_color1',
			'moneymaker2_header_logo_custom_color2',
			'moneymaker2_header_logo_custom_header',
			'moneymaker2_header_logo_custom_header_color',
			'moneymaker2_header_logo_custom_caption',
			'moneymaker2_header_logo_custom_caption_color',
			'moneymaker2_header_contacts_icon',
			'moneymaker2_header_contacts_phone',
			'moneymaker2_header_contacts_phone_highlight',
			'moneymaker2_header_contacts_phone_highlight_color',
			'moneymaker2_header_contacts_title',
			'moneymaker2_header_categories_menu_hide',
			'moneymaker2_header_categories_menu_hidechilds',
			'moneymaker2_header_categories_menu_caption',
			'moneymaker2_header_categories_menu_mod',
			'moneymaker2_header_categories_panel',
			'moneymaker2_header_categories_panel_expanded',
			'moneymaker2_header_categories_panel_fixed',
			'moneymaker2_header_categories_menu_icons',
			'moneymaker2_header_categories_menu_hideparents',

			'moneymaker2_header_categories_menu_hidethumbs',
			'moneymaker2_header_categories_menu_thumbs_width',
			'moneymaker2_header_categories_menu_thumbs_height',
			'moneymaker2_header_categories_menu_columns',
			'moneymaker2_header_categories_panel_mod',
			'moneymaker2_header_categories_panel_hideparents',
			'moneymaker2_header_categories_panel_hidechilds',
			'moneymaker2_header_categories_panel_hidethumbs',
			'moneymaker2_header_categories_panel_icons',
			'moneymaker2_header_categories_panel_child_icons',
			'moneymaker2_header_categories_panel_thumbs_width',
			'moneymaker2_header_categories_panel_thumbs_height',
			'moneymaker2_header_categories_panel_columns',
			'moneymaker2_header_categories_panel_description',
			'moneymaker2_header_categories_panel_description_limit',
			'moneymaker2_header_categories_panel_description_categories',
			//'moneymaker2_header_cart_caption_hide',
			'moneymaker2_header_strip_cart',
			'moneymaker2_header_cart_custom',
			'moneymaker2_header_cart_effect',
			'moneymaker2_header_cart_effect_color',
			'moneymaker2_header_cart_caption',
			'moneymaker2_header_cart_image',
			'moneymaker2_header_cart_text',
			'moneymaker2_header_cart_link_enabled',
			'moneymaker2_header_cart_link_icon',
			'moneymaker2_header_cart_link_title',
			'moneymaker2_header_cart_link',
			//'moneymaker2_header_search_caption_hide',
			'moneymaker2_header_strip_search',
			'moneymaker2_header_search_moved',
			'moneymaker2_header_search_ajax',
			'moneymaker2_header_search_ajax_image',
			'moneymaker2_header_search_ajax_image_height',
			'moneymaker2_header_search_ajax_image_width',
			'moneymaker2_header_search_ajax_price',
			'moneymaker2_header_search_ajax_code',
			'moneymaker2_header_search_ajax_code_field',
			//'moneymaker2_header_menu_caption_hide',
			'moneymaker2_header_strip_menu',
			'moneymaker2_header_menu_links_enabled',
			'moneymaker2_header_menu_links_top_enabled',
			'moneymaker2_header_menu_links_caption',

			'moneymaker2_footer_information_hide',
			'moneymaker2_footer_customer_hide',
			'moneymaker2_footer_extras_hide',
			'moneymaker2_footer_account_hide',
			'moneymaker2_footer_strip_bg_color',
			'moneymaker2_footer_top_bg_color',
			'moneymaker2_footer_bottom_bg_color',
			'moneymaker2_footer_links_font_color',
			'moneymaker2_footer_text_font_color',
			'moneymaker2_footer_text_font_color_h5',
			'moneymaker2_footer_text_font_color_border',

			'moneymaker2_footer_contacts_enabled',
			'moneymaker2_footer_contacts_title',
			'moneymaker2_footer_contacts_icon',
			'moneymaker2_footer_links_enabled',
			'moneymaker2_footer_links_title',
			'moneymaker2_footer_links_icon',
			'moneymaker2_footer_text1_enabled',
			'moneymaker2_footer_text1_title',
			'moneymaker2_footer_text1_icon',
			'moneymaker2_footer_text1',
			'moneymaker2_footer_text2_enabled',
			'moneymaker2_footer_text2_title',
			'moneymaker2_footer_text2_icon',
			'moneymaker2_footer_text2',
			'moneymaker2_footer_copyrights_hide',
			'moneymaker2_footer_powered_hide',
			'moneymaker2_footer_powered_custom_enabled',
			'moneymaker2_footer_powered_custom_text',
			'moneymaker2_footer_powered_custom_title',
			'moneymaker2_footer_powered_custom_year',
			'moneymaker2_footer_socials_enabled',
			'moneymaker2_footer_socials_target_blank',

			'moneymaker2_product_metatitles_enabled',
			'moneymaker2_product_socials_yandex_enabled',
			'moneymaker2_product_socials_addthis_enabled',
			'moneymaker2_product_code',
			'moneymaker2_product_attributes_code',
			'moneymaker2_product_code_caption',
			'moneymaker2_product_gallery_moved',
			'moneymaker2_product_gallery_round',
			'moneymaker2_product_gallery_thumbs_round',
			'moneymaker2_product_gallery_animation',
			'moneymaker2_product_gallery_animation_in',
			'moneymaker2_product_thumbs_limit',
			'moneymaker2_product_points_size',
			'moneymaker2_product_points_stock',
			'moneymaker2_product_points_stock_default',
			'moneymaker2_product_points_stock_icon',
			'moneymaker2_product_points_stock_color',
			'moneymaker2_product_points_stock_caption',
			'moneymaker2_product_points_manufacturer',
			'moneymaker2_product_points_manufacturer_image_width',
			'moneymaker2_product_points_manufacturer_image_height',
			'moneymaker2_product_points_manufacturer_caption',
			'moneymaker2_product_options_hide',
			'moneymaker2_product_options_hide_limit',
			'moneymaker2_product_tabs_hide',
			'moneymaker2_product_tabs_headers',
			'moneymaker2_product_tabs_headers_text',
			'moneymaker2_product_tabs_description_buttons',
			'moneymaker2_product_tabs_attributes_buttons',
			'moneymaker2_product_tabs_attributes_responsive',
			'moneymaker2_product_tabs_attributes_weight',
			'moneymaker2_product_tabs_attributes_dimensions',
			'moneymaker2_product_tabs_reviews_indexed',
			'moneymaker2_product_related_carousel',
			'moneymaker2_product_related_carousel_autoplay',
			'moneymaker2_product_related_stock',
			'moneymaker2_product_related_code',
			'moneymaker2_product_related_description',

			'moneymaker2_catalog_layout_default',
			'moneymaker2_catalog_layout_switcher_hide',
			'moneymaker2_catalog_categories_metatitles_enabled',
			'moneymaker2_catalog_categories_images_hide',
			'moneymaker2_catalog_categories_images_round',
			'moneymaker2_catalog_categories_child_images',
			'moneymaker2_catalog_categories_child_images_width',
			'moneymaker2_catalog_categories_child_images_height',
			'moneymaker2_catalog_categories_child_icons',
			'moneymaker2_catalog_categories_move_description',
			'moneymaker2_catalog_categories_advantages_enabled',
			'moneymaker2_catalog_home_advantages_enabled',
			'moneymaker2_catalog_advantages_small',
			'moneymaker2_catalog_home_advantages_header',
			'moneymaker2_catalog_home_advantages_icon',
			'moneymaker2_catalog_home_advantages_text',
			'moneymaker2_catalog_products_grid_stock_hide',
			'moneymaker2_catalog_products_list_stock_hide',
			'moneymaker2_catalog_products_stock_color',
			'moneymaker2_catalog_products_grid_code_hide',
			'moneymaker2_catalog_products_list_code_hide',
			'moneymaker2_catalog_products_grid_description',
			'moneymaker2_catalog_products_list_description',
			'moneymaker2_catalog_products_code_field',
			'moneymaker2_catalog_manufacturer_logo_width',
			'moneymaker2_catalog_manufacturer_logo_height',
			'moneymaker2_catalog_contacts_quicklinks',
			'moneymaker2_catalog_contacts_call_title',
			'moneymaker2_catalog_contacts_mail_title',
			'moneymaker2_catalog_contacts_link_title',
			'moneymaker2_catalog_contacts_link',
			'moneymaker2_catalog_contacts_multilink',
			'moneymaker2_catalog_contacts_map',
			'moneymaker2_catalog_contacts_map_key',
			'moneymaker2_catalog_contacts_map_custom',
			'moneymaker2_catalog_contacts_map_custom_code',
			'moneymaker2_catalog_compare_images_hide',
			'moneymaker2_catalog_compare_model_hide',
			'moneymaker2_catalog_compare_brand_hide',
			'moneymaker2_catalog_compare_availability_hide',
			'moneymaker2_catalog_compare_rating_hide',
			'moneymaker2_catalog_compare_description_hide',
			'moneymaker2_catalog_compare_weight_hide',
			'moneymaker2_catalog_compare_dimensions_hide',
			'moneymaker2_catalog_compare_charts_enabled',
			'moneymaker2_catalog_compare_charts_price_enabled',
			'moneymaker2_catalog_compare_charts_columns',
			'moneymaker2_catalog_compare_charts_code',
			'moneymaker2_catalog_compare_charts_code_field',
			'moneymaker2_catalog_compare_charts_decimal_delimiter',

			'moneymaker2_modules_categories_icons',
			'moneymaker2_modules_featured_carousel',
			'moneymaker2_modules_featured_carousel_autoplay',
			'moneymaker2_modules_featured_stock',
			'moneymaker2_modules_featured_code',
			'moneymaker2_modules_featured_description',
			'moneymaker2_modules_latest_carousel',
			'moneymaker2_modules_latest_carousel_autoplay',
			'moneymaker2_modules_latest_stock',
			'moneymaker2_modules_latest_code',
			'moneymaker2_modules_latest_description',
			'moneymaker2_modules_bestseller_carousel',
			'moneymaker2_modules_bestseller_carousel_autoplay',
			'moneymaker2_modules_bestseller_stock',
			'moneymaker2_modules_bestseller_code',
			'moneymaker2_modules_bestseller_description',
			'moneymaker2_modules_special_carousel',
			'moneymaker2_modules_special_carousel_autoplay',
			'moneymaker2_modules_special_stock',
			'moneymaker2_modules_special_code',
			'moneymaker2_modules_special_description',
			'moneymaker2_modules_advantages_home',
			'moneymaker2_modules_stickers_mode',
			'moneymaker2_modules_stickers_background',
			'moneymaker2_modules_stickers_transparency',
			'moneymaker2_modules_stickers_size_catalog',
			'moneymaker2_modules_stickers_size_product',
			'moneymaker2_modules_stickers_specials_enabled',
			'moneymaker2_modules_stickers_specials_icon',
			'moneymaker2_modules_stickers_specials_color',
			'moneymaker2_modules_stickers_specials_caption',
			'moneymaker2_modules_stickers_specials_discount',
			'moneymaker2_modules_stickers_specials_discount_mode',
			'moneymaker2_modules_stickers_popular_enabled',
			'moneymaker2_modules_stickers_popular_icon',
			'moneymaker2_modules_stickers_popular_color',
			'moneymaker2_modules_stickers_popular_caption',
			'moneymaker2_modules_stickers_popular_limit',
			'moneymaker2_modules_stickers_rated_enabled',
			'moneymaker2_modules_stickers_rated_icon',
			'moneymaker2_modules_stickers_rated_color',
			'moneymaker2_modules_stickers_rated_caption',
			'moneymaker2_modules_stickers_rated_limit',
			'moneymaker2_modules_stickers_new_enabled',
			'moneymaker2_modules_stickers_new_icon',
			'moneymaker2_modules_stickers_new_color',
			'moneymaker2_modules_stickers_new_caption',
			'moneymaker2_modules_stickers_new_limit',
			'moneymaker2_modules_stickers_custom1_enabled',
			'moneymaker2_modules_stickers_custom1_icon',
			'moneymaker2_modules_stickers_custom1_color',
			'moneymaker2_modules_stickers_custom1_caption',
			'moneymaker2_modules_stickers_custom1_field',
			'moneymaker2_modules_stickers_custom2_enabled',
			'moneymaker2_modules_stickers_custom2_icon',
			'moneymaker2_modules_stickers_custom2_color',
			'moneymaker2_modules_stickers_custom2_caption',
			'moneymaker2_modules_stickers_custom2_field',
			'moneymaker2_modules_stickers_promo_enabled',
			'moneymaker2_modules_stickers_promo_icon',
			'moneymaker2_modules_stickers_promo_color',
			'moneymaker2_modules_stickers_promo_caption',

			'moneymaker2_modules_promo_enabled',
			'moneymaker2_modules_promo_style',

			'moneymaker2_modules_quickorder_enabled',
			'moneymaker2_modules_quickorder_hide_email',
			'moneymaker2_modules_quickorder_recipient',
			'moneymaker2_modules_quickorder_display_thumb',
			'moneymaker2_modules_quickorder_display_catalog',
			'moneymaker2_modules_quickorder_display_popupcart',
			'moneymaker2_modules_quickorder_display_checkoutcart',
			'moneymaker2_modules_quickorder_clear_cart',
			'moneymaker2_modules_quickorder_image_width',
			'moneymaker2_modules_quickorder_image_height',
			'moneymaker2_modules_quickorder_button_title',
			'moneymaker2_modules_quickorder_button_tooltip',
			'moneymaker2_modules_quickorder_phone_mask_enabled',
			'moneymaker2_modules_quickorder_phone_mask',
			'moneymaker2_modules_quickorder_goal_google',
			'moneymaker2_modules_quickorder_goal_yandex',
			'moneymaker2_modules_quickorder_goal_yandex_counter',

			'moneymaker2_modules_callback_enabled',
			'moneymaker2_modules_callback_sender',
			'moneymaker2_modules_callback_recipient',
			'moneymaker2_modules_callback_header',
			'moneymaker2_modules_callback_caption',
			'moneymaker2_modules_callback_image',
			'moneymaker2_modules_callback_thumbs_width',
			'moneymaker2_modules_callback_thumbs_height',
			'moneymaker2_modules_callback_goal_google',
			'moneymaker2_modules_callback_goal_yandex',
			'moneymaker2_modules_callback_goal_yandex_counter',

			'moneymaker2_modules_newsletter_enabled',
			'moneymaker2_modules_newsletter_header',
			'moneymaker2_modules_newsletter_caption',
			'moneymaker2_modules_newsletter_image',
			'moneymaker2_modules_newsletter_thumbs_width',
			'moneymaker2_modules_newsletter_thumbs_height',

			'moneymaker2_modules_popup',
			'moneymaker2_modules_popup_link',
			'moneymaker2_modules_popup_limit',
			'moneymaker2_modules_popup_delay',

			'moneymaker2_modules_timer',
			'moneymaker2_modules_timer_discount',
			'moneymaker2_modules_timer_discount_mode',
			'moneymaker2_modules_snow',
			'moneymaker2_date',
		);

		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$data[$conf] = $this->request->post[$conf];
			} elseif (isset($setting_info[$conf])) {
				$data[$conf] = $setting_info[$conf];
			} else {
				$data[$conf] = '';
			}
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$data['moneymaker2_permission'] = $this->user->hasPermission('modify', 'extension/theme/moneymaker2');
		$data['moneymaker2_store_id'] = $this->request->get['store_id'];
		$this->load->model('setting/store');
		$stores = $this->model_setting_store->getStores();
		foreach ($stores as $store) {
			$store_data[$store['store_id']] = array(
				'name'   => $store['name'],
			);
		}
		if ($data['moneymaker2_store_id']==0) {
			$data['moneymaker2_store_name'] = $this->config->get('config_name');
		} else {
			$data['moneymaker2_store_name'] = isset($store_data[$data['moneymaker2_store_id']]['name']) ? $store_data[$data['moneymaker2_store_id']]['name'] : null;
		}
		$this->response->setOutput($this->load->view('extension/theme/moneymaker2', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/theme/moneymaker2')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['moneymaker2_product_limit']) {
			$this->error['product_limit'] = $this->language->get('error_limit');
		}

		if (!$this->request->post['moneymaker2_product_description_length']) {
			$this->error['product_description_length'] = $this->language->get('error_limit');
		}

		if (!$this->request->post['moneymaker2_image_category_width'] || !$this->request->post['moneymaker2_image_category_height']) {
			$this->error['image_category'] = $this->language->get('error_image_category');
		}

		if (!$this->request->post['moneymaker2_image_thumb_width'] || !$this->request->post['moneymaker2_image_thumb_height']) {
			$this->error['image_thumb'] = $this->language->get('error_image_thumb');
		}

		if (!$this->request->post['moneymaker2_image_popup_width'] || !$this->request->post['moneymaker2_image_popup_height']) {
			$this->error['image_popup'] = $this->language->get('error_image_popup');
		}

		if (!$this->request->post['moneymaker2_image_product_width'] || !$this->request->post['moneymaker2_image_product_height']) {
			$this->error['image_product'] = $this->language->get('error_image_product');
		}

		if (!$this->request->post['moneymaker2_image_additional_width'] || !$this->request->post['moneymaker2_image_additional_height']) {
			$this->error['image_additional'] = $this->language->get('error_image_additional');
		}

		if (!$this->request->post['moneymaker2_image_related_width'] || !$this->request->post['moneymaker2_image_related_height']) {
			$this->error['image_related'] = $this->language->get('error_image_related');
		}

		if (!$this->request->post['moneymaker2_image_compare_width'] || !$this->request->post['moneymaker2_image_compare_height']) {
			$this->error['image_compare'] = $this->language->get('error_image_compare');
		}

		if (!$this->request->post['moneymaker2_image_wishlist_width'] || !$this->request->post['moneymaker2_image_wishlist_height']) {
			$this->error['image_wishlist'] = $this->language->get('error_image_wishlist');
		}

		if (!$this->request->post['moneymaker2_image_cart_width'] || !$this->request->post['moneymaker2_image_cart_height']) {
			$this->error['image_cart'] = $this->language->get('error_image_cart');
		}

		if (!$this->request->post['moneymaker2_image_location_width'] || !$this->request->post['moneymaker2_image_location_height']) {
			$this->error['image_location'] = $this->language->get('error_image_location');
		}

		return !$this->error;
	}
}
