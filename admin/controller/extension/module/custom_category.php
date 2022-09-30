<?php
class ControllerExtensionModuleCustomCategory extends Controller {
	private $error = array();

	public function index() {

        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');

		$this->load->language('extension/module/custom_category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		$this->load->model('catalog/category');
        $this->load->model('tool/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('custom_category', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

        $data['categories'] = $this->model_catalog_category->getCategories();

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
				'href' => $this->url->link('extension/module/custom_category', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/custom_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/custom_category', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/custom_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$data['custom_categories'] = [];


		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);

            if(!empty($module_info['custom_category'])) {

                foreach ($module_info['custom_category'] as $custom_category_k => $custom_category_v) {


                    if (!empty($module_info) && is_file(DIR_IMAGE . $custom_category_v['image'])) {
                        $thumb = $this->model_tool_image->resize($custom_category_v['image'], 100, 100);
                    } else {
                        $thumb = $this->model_tool_image->resize('no_image.png', 100, 100);
                    }


                    $data['custom_categories'][] = [
                        'name' => $custom_category_v['name'],
                        'width' => $custom_category_v['width'],
                        'height' => $custom_category_v['height'],
                        'category_id' => $custom_category_v['category_id'],
                        'show_image' => $custom_category_v['show_image'],
                        'status' => $custom_category_v['status'],
                        'image' => $custom_category_v['image'],
                        'sort' => $custom_category_v['sort'],
                        'thumb' => $thumb,
                    ];

                }

            }

		}



        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info)) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }

        if (isset($this->request->post['quantity'])) {
            $data['quantity'] = $this->request->post['quantity'];
        } elseif (!empty($module_info)) {
            $data['quantity'] = $module_info['quantity'];
        } else {
            $data['quantity'] = 0;
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info)) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = 1;
        }



        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);



//        if (isset($this->request->post['custom_category_description'])) {
//            $data['custom_category_description'] = $this->request->post['custom_category_description'];
//        } elseif (isset($this->request->get['category_id'])) {
//            $data['custom_category_description'] = $module_info['custom_category'];
//        } else {
//            $data['custom_category_description'] = array();
//        }


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_category', $data));
	}

}