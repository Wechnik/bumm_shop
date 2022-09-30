<?php
class ControllerExtensionModuleCustomBanner extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/custom_banner');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_setting_setting->editSetting('custom_banner', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/custom_banner', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/custom_banner', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['custom_banner_status'])) {
			$data['custom_banner_status'] = $this->request->post['custom_banner_status'];
		} else {
			$data['custom_banner_status'] = $this->config->get('custom_banner_status');
		}

        $this->load->model('tool/image');

        if (isset($this->request->post['custom_banner_status'])) {
            $data['custom_banner_status'] = $this->request->post['custom_banner_status'];
        } else {
            $data['custom_banner_banner_image'] = $this->config->get('custom_banner_banner_image');

            foreach ($data['custom_banner_banner_image'] as $custom_k => $custom_v) {
                if(is_numeric($custom_k)) {
                    if (is_file(DIR_IMAGE . $custom_v['image'])) {
                        $thumb = $custom_v['image'];
                    } else {
                        $thumb = 'no_image.png';
                    }
                    $data['custom_banner_banner_image'][$custom_k]['thumb'] =  $this->model_tool_image->resize($thumb, 100, 100);
                } else {

                    $data['custom_banner_style'] = $custom_v;
                }

            }

        }


        for ($i = 1; $i < 5; $i++ ) {
            $data['custom_banner_banner_image']['image_style'][$i] = $this->model_tool_image->resize('catalog/banner_images/img' . $i . '.jpg', 100, 100);

        }


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_banner', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/custom_banner')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}