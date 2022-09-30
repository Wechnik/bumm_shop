<?php
class ControllerExtensionModuleProductStickers extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/product_stickers');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module/product_stickers');
        $this->load->model('tool/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

            $this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('product_stickers', $this->request->post);

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
			'href' => $this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true)
		);

        $data['add'] = $this->url->link('extension/module/product_stickers/add', 'token=' . $this->session->data['token'], true);
        $data['delete'] = $this->url->link('extension/module/product_stickers/delete', 'token=' . $this->session->data['token'], true);
        $data['save'] = $this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['product_stickers_status'])) {
			$data['product_stickers_status'] = $this->request->post['product_stickers_status'];
		} else {
			$data['product_stickers_status'] = $this->config->get('product_stickers_status');
		}

        $data['product_stickers'] = [];

        $data['product_stickers'] = $this->model_extension_module_product_stickers->getProductStickers();

        foreach ($data['product_stickers'] as $product_sticker_k => $product_sticker) {

            if (is_file(DIR_IMAGE . $product_sticker['image'])) {
                $data['product_stickers'][$product_sticker_k]['image'] = $this->model_tool_image->resize($product_sticker['image'], 40, 40);
            } else {
                $data['product_stickers'][$product_sticker_k]['image'] = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $data['product_stickers'][$product_sticker_k]['description'] = strip_tags(html_entity_decode($product_sticker['description'], ENT_QUOTES, 'UTF-8'));


        }

        $stickers_settings =  $this->config->get('product_stickers');

        $data['product_stickers_conf']['width'] = $stickers_settings['width'];
        $data['product_stickers_conf']['height'] = $stickers_settings['height'];
        $data['product_stickers_conf']['image_variant'] = $stickers_settings['image_variant'];

        $data['token'] = $this->session->data['token'];


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/product_stickers_list', $data));

	}


    public function add() {

        $this->document->setTitle('Редактирование описания');

        $this->load->model('extension/module/product_stickers');
        $this->load->model('tool/image');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

            $this->model_extension_module_product_stickers->addProductSticker($this->request->post['product_stickers']);

            $this->response->redirect($this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true));
        }

        $this->getForm();
    }


	public function edit() {

            $this->document->setTitle('Редактирование описания');

            $this->load->model('extension/module/product_stickers');
            $this->load->model('tool/image');

            if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

                $this->model_extension_module_product_stickers->editProductSticker($this->request->get['product_sticker'], $this->request->post['product_stickers']);

                $this->response->redirect($this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true));
            }

            $this->getForm();



    }


    public function delete() {

        $this->document->setTitle('Редактирование описания');

        $this->load->model('extension/module/product_stickers');
        $this->load->model('tool/image');

        if (isset($this->request->post['selected'])) {
            foreach ($this->request->post['selected'] as $product_sticker_id) {
                $this->model_catalog_category->deleteProductStickers($product_sticker_id);
            }

            $this->response->redirect($this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true));
        }

        $this->getList();
    }

    protected function getForm() {

        $this->load->language('extension/module/product_stickers');

        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');

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
            'href' => $this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true)
        );



        if (isset($this->request->get['product_sticker']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $product_sticker = $this->model_extension_module_product_stickers->getProductSticker($this->request->get['product_sticker']);
        }



        if (isset($this->request->post['product_stickers']['name'])) {
            $data['product_stickers']['name'] = $this->request->post['product_stickers']['name'];
        } elseif (!empty($product_sticker)) {
            $data['product_stickers']['name'] = $product_sticker['name'];
        } else {
            $data['product_stickers']['name'] = '';
        }

        $data['heading_title'] = $data['product_stickers']['name'];

        if (isset($this->request->post['product_stickers']['description'])) {
            $data['product_stickers']['description'] = $this->request->post['product_stickers']['description'];
        } elseif (!empty($product_sticker)) {
            $data['product_stickers']['description'] = $product_sticker['description'];
        } else {
            $data['product_stickers']['description'] = '';
        }


        if (isset($this->request->post['product_stickers']['sort_order'])) {
            $data['product_stickers']['sort_order'] = $this->request->post['product_stickers']['sort_order'];
        } elseif (!empty($product_sticker)) {
            $data['product_stickers']['sort_order'] = $product_sticker['sort_order'];
        } else {
            $data['product_stickers']['sort_order'] = 0;
        }

        if (isset($this->request->post['product_stickers']['status'])) {
            $data['product_stickers']['status'] = $this->request->post['product_stickers']['status'];
        } elseif (!empty($product_sticker)) {
            $data['product_stickers']['status'] = $product_sticker['status'];
        } else {
            $data['product_stickers']['status'] = true;
        }


        if (isset($this->request->post['product_stickers']['image'])) {
            $data['product_stickers']['image'] = $this->request->post['product_stickers']['image'];
        } elseif (!empty($product_sticker)) {
            $data['product_stickers']['image'] = $product_sticker['image'];
        } else {
            $data['product_stickers']['image'] = '';
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        if (isset($this->request->post['product_stickers']['image']) && is_file(DIR_IMAGE . $this->request->post['product_stickers']['image'])) {
            $data['product_stickers']['thumb'] = $this->model_tool_image->resize($this->request->post['product_stickers']['image'], 100, 100);
        } elseif (!empty($product_sticker) && is_file(DIR_IMAGE . $product_sticker['image'])) {
            $data['product_stickers']['thumb'] = $this->model_tool_image->resize($product_sticker['image'], 100, 100);
        } else {
            $data['product_stickers']['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }



        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/product_stickers_form', $data));

    }


}