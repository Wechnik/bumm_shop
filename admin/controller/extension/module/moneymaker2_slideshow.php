<?php
class ControllerExtensionModuleMoneymaker2Slideshow extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/moneymaker2_slideshow');

		$this->document->setTitle($this->language->get('heading_title'));
		//$this->document->addStyle('../catalog/view/theme/moneymaker2/stylesheet/animate.css');

		$this->load->model('extension/module');
		$this->load->model('tool/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('moneymaker2_slideshow', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->post['apply']) and $this->request->post['apply'])
				$this->response->redirect($this->url->link('extension/module/moneymaker2_slideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true));
			else
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));

		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_banner'] = $this->language->get('entry_banner');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['text_select'] = $this->language->get('text_select');
		$data['entry_button_style'] = $this->language->get('entry_button_style');
		$data['entry_style_help'] = $this->language->get('entry_style_help');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_optional'] = $this->language->get('entry_optional');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_button'] = $this->language->get('entry_button');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_fullscreen'] = $this->language->get('entry_fullscreen');
		$data['entry_fullscreen_help'] = $this->language->get('entry_fullscreen_help');
		$data['entry_fullscreen_bottom'] = $this->language->get('entry_fullscreen_bottom');
		$data['entry_fullscreen_bottom_help'] = $this->language->get('entry_fullscreen_bottom_help');
		$data['entry_tilt3d'] = $this->language->get('entry_tilt3d');
		$data['entry_tilt3d_help'] = $this->language->get('entry_tilt3d_help');
		$data['entry_parallax'] = $this->language->get('entry_parallax');
		$data['entry_parallax_help'] = $this->language->get('entry_parallax_help');
		$data['entry_parallax_speed'] = $this->language->get('entry_parallax_speed');
		$data['entry_parallax_invert'] = $this->language->get('entry_parallax_invert');
		$data['entry_parallax_invert_help'] = $this->language->get('entry_parallax_invert_help');
		$data['entry_parallax_height'] = $this->language->get('entry_parallax_height');
		$data['entry_parallax_height_help'] = $this->language->get('entry_parallax_height_help');
		$data['button_view'] = $this->language->get('button_view');
		$data['button_link'] = $this->language->get('button_link');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_close'] = $this->language->get('button_close');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_banners'] = $this->language->get('entry_banners');
		$data['entry_banners_hidden_xs'] = $this->language->get('entry_banners_hidden_xs');
		$data['entry_button_title'] = $this->language->get('entry_button_title');
		$data['entry_text_position'] = $this->language->get('entry_text_position');
		$data['entry_text_style'] = $this->language->get('entry_text_style');
		$data['entry_text_width'] = $this->language->get('entry_text_width');
		$data['entry_items_help'] = $this->language->get('entry_items_help');
		$data['entry_screen_large'] = $this->language->get('entry_screen_large');
		$data['entry_screen_medium'] = $this->language->get('entry_screen_medium');
		$data['entry_screen_small'] = $this->language->get('entry_screen_small');
		$data['entry_screen_xsmall'] = $this->language->get('entry_screen_xsmall');
		$data['entry_screen_xxsmall'] = $this->language->get('entry_screen_xxsmall');
		$data['entry_screen_xxxsmall'] = $this->language->get('entry_screen_xxxsmall');
		$data['entry_animation'] = $this->language->get('entry_animation');
		$data['entry_animation_in'] = $this->language->get('entry_animation_in');
		$data['entry_animation_out'] = $this->language->get('entry_animation_out');
		$data['entry_examples'] = $this->language->get('entry_examples');
		$data['entry_autoplay'] = $this->language->get('entry_autoplay');
		$data['entry_autoplay_timeout'] = $this->language->get('entry_autoplay_timeout');
		$data['entry_navigation'] = $this->language->get('entry_navigation');
		$data['entry_navigation_zone'] = $this->language->get('entry_navigation_zone');
		$data['entry_navigation_zone_help'] = $this->language->get('entry_navigation_zone_help');
		$data['entry_pagination'] = $this->language->get('entry_pagination');
		$data['entry_style'] = $this->language->get('entry_style');
		$data['entry_multilanguage'] = $this->language->get('entry_multilanguage');
		$data['entry_minimize'] = $this->language->get('entry_minimize');
		$data['entry_title_spacing'] = $this->language->get('entry_title_spacing');
		$data['entry_text_spacing'] = $this->language->get('entry_text_spacing');
		$data['entry_background'] = $this->language->get('entry_background');
		$data['entry_transparency_hover'] = $this->language->get('entry_transparency_hover');
		$data['entry_border_style'] = $this->language->get('entry_border_style');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		// loading languages
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/moneymaker2_slideshow', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/moneymaker2_slideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/moneymaker2_slideshow', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/moneymaker2_slideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->get['module_id'])&&$this->request->get['module_id']) {
			$data['module_id'] = true;
		} else {
			$data['module_id'] = false;
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
/*
		if (isset($this->request->post['banner_id'])) {
			$data['banner_id'] = $this->request->post['banner_id'];
		} elseif (!empty($module_info)) {
			$data['banner_id'] = $module_info['banner_id'];
		} else {
			$data['banner_id'] = '';
		}

		$this->load->model('design/banner');

		$data['banners'] = $this->model_design_banner->getBanners();

				*/

		//$data['banners_images'] = $this->model_design_banner->getBannerImages('');

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '';
		}

		if (isset($this->request->post['fullwidth'])) {
			$data['fullwidth'] = $this->request->post['fullwidth'];
		} elseif (!empty($module_info)) {
			$data['fullwidth'] = $module_info['fullwidth'];
		} else {
			$data['fullwidth'] = '';
		}
		if (isset($this->request->post['parallax_invert'])) {
			$data['parallax_invert'] = $this->request->post['parallax_invert'];
		} elseif (!empty($module_info)) {
			$data['parallax_invert'] = isset($module_info['parallax_invert']) ? $module_info['parallax_invert'] : '';
		} else {
			$data['parallax_invert'] = '';
		}
		if (isset($this->request->post['fullwidth_bottom'])) {
			$data['fullwidth_bottom'] = $this->request->post['fullwidth_bottom'];
		} elseif (!empty($module_info)) {
			$data['fullwidth_bottom'] = $module_info['fullwidth_bottom'];
		} else {
			$data['fullwidth_bottom'] = '';
		}
		if (isset($this->request->post['tilt3d'])) {
			$data['tilt3d'] = $this->request->post['tilt3d'];
		} elseif (!empty($module_info)) {
			$data['tilt3d'] = isset($module_info['tilt3d']) ? $module_info['tilt3d'] : '';
		} else {
			$data['tilt3d'] = '';
		}
		if (isset($this->request->post['parallax'])) {
			$data['parallax'] = $this->request->post['parallax'];
		} elseif (!empty($module_info)) {
			$data['parallax'] = $module_info['parallax'];
		} else {
			$data['parallax'] = '';
		}
		if (isset($this->request->post['autoplay'])) {
			$data['autoplay'] = $this->request->post['autoplay'];
		} elseif (!empty($module_info)) {
			$data['autoplay'] = $module_info['autoplay'];
		} else {
			$data['autoplay'] = '';
		}
		if (isset($this->request->post['autoplay_timeout'])) {
			$data['autoplay_timeout'] = $this->request->post['autoplay_timeout'];
		} elseif (!empty($module_info)) {
			$data['autoplay_timeout'] = $module_info['autoplay_timeout'];
		} else {
			$data['autoplay_timeout'] = '';
		}
		if (isset($this->request->post['navigation'])) {
			$data['navigation'] = $this->request->post['navigation'];
		} elseif (!empty($module_info)) {
			$data['navigation'] = $module_info['navigation'];
		} else {
			$data['navigation'] = '';
		}
		if (isset($this->request->post['navigation_zone'])) {
			$data['navigation_zone'] = $this->request->post['navigation_zone'];
		} elseif (!empty($module_info)) {
			$data['navigation_zone'] = isset($module_info['navigation_zone']) ? $module_info['navigation_zone'] : '';
		} else {
			$data['navigation_zone'] = '';
		}
		if (isset($this->request->post['pagination'])) {
			$data['pagination'] = $this->request->post['pagination'];
		} elseif (!empty($module_info)) {
			$data['pagination'] = $module_info['pagination'];
		} else {
			$data['pagination'] = '';
		}
		if (isset($this->request->post['animation'])) {
			$data['animation'] = $this->request->post['animation'];
		} elseif (!empty($module_info)) {
			$data['animation'] = $module_info['animation'];
		} else {
			$data['animation'] = '';
		}
		if (isset($this->request->post['animation_in'])) {
			$data['animation_in'] = $this->request->post['animation_in'];
		} elseif (!empty($module_info)) {
			$data['animation_in'] = $module_info['animation_in'];
		} else {
			$data['animation_in'] = '';
		}
		if (isset($this->request->post['transparency_hover'])) {
			$data['transparency_hover'] = $this->request->post['transparency_hover'];
		} elseif (!empty($module_info)) {
			$data['transparency_hover'] = isset($module_info['transparency_hover']) ? $module_info['transparency_hover'] : '';
		} else {
			$data['transparency_hover'] = '';
		}
		if (isset($this->request->post['background_style'])) {
			$data['background_style'] = $this->request->post['background_style'];
		} elseif (!empty($module_info)) {
			$data['background_style'] = isset($module_info['background_style']) ? $module_info['background_style'] : '';
		} else {
			$data['background_style'] = '';
		}
		if (isset($this->request->post['border_style'])) {
			$data['border_style'] = $this->request->post['border_style'];
		} elseif (!empty($module_info)) {
			$data['border_style'] = isset($module_info['border_style']) ? $module_info['border_style'] : 'light';
		} else {
			$data['border_style'] = '';
		}
				/*
		if (isset($this->request->post['animation_out'])) {
			$data['animation_out'] = $this->request->post['animation_out'];
		} elseif (!empty($module_info)) {
			$data['animation_out'] = $module_info['animation_out'];
		} else {
			$data['animation_out'] = '';
		}
*/


		if (isset($this->request->post['parallax_speed'])) {
			$data['parallax_speed'] = $this->request->post['parallax_speed'];
		} elseif (!empty($module_info)) {
			$data['parallax_speed'] = $module_info['parallax_speed'];
		} else {
			$data['parallax_speed'] = '3';
		}
		if (isset($this->request->post['parallax_heights'])) {
			$data['parallax_heights'] = $this->request->post['parallax_heights'];
		} elseif (!empty($module_info)) {
			$data['parallax_heights'] = $module_info['parallax_heights'];
		} else {
			$data['parallax_heights'] = array("lg" => 495, "md" => 415, "sm" => 340, "xsm" => 270, "xxsm" => 235, "xxxsm" => 170);
		}
		if (isset($this->request->post['hidden_xs'])) {
			$data['hidden_xs'] = $this->request->post['hidden_xs'];
		} elseif (!empty($module_info)) {
			$data['hidden_xs'] = isset($module_info['hidden_xs']) ? $module_info['hidden_xs'] : '';
		} else {
			$data['hidden_xs'] = '';
		}
		if (isset($this->request->post['items'])) {
			$data['items'] = $this->request->post['items'];
		} elseif (!empty($module_info)) {
			$data['items'] = $module_info['items'];
		} else {
			$data['items'] = array("lg" => 1, "md" => 1, "sm" => 1, "xsm" => 1, "xxsm" => 1, "xxxsm" => 1);
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

				/*
		if (isset($this->request->post['banners_settings'])) {
			$data['banners_settings'] = $this->request->post['banners_settings'];
		//} elseif (!empty($module_info)) {
		} elseif (!empty($module_info)&&isset($module_info['banners_settings'])) {
			$data['banners_settings'] = $module_info['banners_settings'];
		} else {
			$data['banners_settings'] = '';
		}
*/

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);


		if (isset($this->request->post['banners_settings'])) {
				$results = $this->request->post['banners_settings'];
		} elseif (!empty($module_info)&&isset($module_info['banners_settings'])) {
				$results = $module_info['banners_settings'];
		} else {
				$results = array();
		}

		$data['banners_settings'] = array();
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
			$data['banners_settings'][] = array(
				'image' => $image,
				//'thumb' => $this->model_tool_image->resize($thumb, $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height')),
				'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
				'position' => $result['position'],
				'text_width' => $result['text_width'],
				'title' => $result['title'],
				'text' => $result['text'],
				'btn_title' => $result['btn_title'],

				'btn_style'  => $result['btn_style'],
				'minimize'  => isset($result['minimize']) ? $result['minimize'] : '',
				'title_spacing'  => isset($result['title_spacing']) ? $result['title_spacing'] : '',
				'text_spacing'  => isset($result['text_spacing']) ? $result['text_spacing'] : '',
				'text_style'  => $result['text_style'],

				'link'  => $result['link'],
				'multilink'  => isset($result['multilink']) ? $result['multilink'] : '',
				'sort_order'  => $result['sort_order'],
			);
		}

/*if (isset($this->request->post['banners_settings'])) {
				$results = $this->request->post['banners_settings'];
		} elseif ($this->config->get('banners_settings')) {
				$results = $this->config->get('banners_settings');
		} else {
				$results = array();
		}

		$data['banners_settings'] = array();
		foreach ($results as $result) {

				$data['banners_settings'][] = array(
						'text' => $result['text'],
						//'name' => $result['name'],
						'style'  => $result['style'],
						//'icon'  => $result['icon'],
						'link'  => $result['link'],
						'sort_order'  => $result['sort_order'],
				);
		}*/



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/moneymaker2_slideshow.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/moneymaker2_slideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}
