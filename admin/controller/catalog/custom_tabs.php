<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

class ControllerCatalogCustomTabs extends Controller {
	private $error = array();
	private $category_id = 0;
    private $path = array();

	public function index() {

        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');

        $this->document->addScript('view/javascript/multi-select/src/jquery.multi-select.js');

		$this->load->language('catalog/product');

		$this->document->setTitle('Тексты для товаров');

		$this->load->model('catalog/category');
		$this->load->model('catalog/custom_tabs');

        $data['token'] = $this->session->data['token'];
        $data['ckeditor'] = $this->config->get('config_editor_default');

        $this->load->model('localisation/language');

        $data['config_language_id'] = $this->config->get('config_language_id');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['lang'] = $this->language->get('lang');

        $data['products'] = $this->model_catalog_custom_tabs->getProducts();


        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

            $this->model_catalog_custom_tabs->editCustomTabs($this->request->post);

        }

        if (isset($this->request->get['path'])) {
            $this->path = explode('_', $this->request->get['path']);

            $this->category_id = end($this->path);
        }

        $data['category_accordion_menu'] = '';

        $data['category_accordion_menu'] = $this->loadCategories(0, '', $this->category_id);

        $data['products_tab'] = [];

        $data['products_tab'] = $this->model_catalog_custom_tabs->getTabProductsByCategory($this->category_id);

        $checked_tab_products = $this->model_catalog_custom_tabs->getTabProductsChecked();


        $data['front_names'] = [];

        foreach ($checked_tab_products as $checked_tab_product) {

            $data['checked_tab_products'][$checked_tab_product['product_description_id']][] = $checked_tab_product['product_id'];

            $data['front_names'][$checked_tab_product['product_description_id']] = $checked_tab_product['front_name'];

        }

        $checked_tab_products_description = $this->model_catalog_custom_tabs->getTabProductsCheckedDescription();

        foreach ($checked_tab_products_description as $checked_tab_product_description) {

            $data['checked_tab_products_description'][$checked_tab_product_description['product_description_id']][] = $checked_tab_product_description['product_id'];

        }

        $data['product_product_descriptions'] = [];

        $cust_tubs = $this->model_catalog_custom_tabs->getCustomTabs();

        foreach ($cust_tubs as $cust_tub) {

            $data['product_product_descriptions'][] = [
                'product_description_id' => $cust_tub['id'],
                'name' => $cust_tub['name'],
                'product_product_description_description' =>
                    [
                        $data['config_language_id'] =>
                            ['text' => $cust_tub['text'],]
                    ],
            ];

        }


//        $data['product_product_descriptions'][1] = [
//            'product_description_id' => '1',
//            'name' => 'adfadf',
//            'product_product_description_description' =>
//                [
//                    $data['config_language_id'] =>
//                        ['text' => '111111111',]
//                ],
//        ];
//
//        $data['product_product_descriptions'][2] = [
//            'product_description_id' => '2',
//            'name' => 'adfadf',
//            'product_product_description_description' =>
//                [
//                    $data['config_language_id'] =>
//                        ['text' => '2222222222',]
//                ],
//        ];
//
//        $data['product_product_descriptions'][3] = [
//            'product_description_id' => '3',
//            'name' => 'adfadf',
//            'product_product_description_description' =>
//                [
//                    $data['config_language_id'] =>
//                    ['text' => '3333333333',]
//                ],
//        ];



        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/custom_tabs', $data));

	}

    protected function loadCategories($parent_id, $current_path = '', $cid = '') {
        //$path = explode('_', $current_path);
        //$category_id = array_pop($this->path);
        //$this->getCategoriesFromdb($category_id);

        $results = $this->model_catalog_category->getCategoriesByParentId($parent_id);

        $ret_string = '';
        if ($results) {
            if ($parent_id == 0) {
                $ret_string .= '<ul class="categories_1000">';
            } else {
                $ret_string .= '<ul id="children_' . $parent_id . '" loaded="1">';
            }
        }

        foreach ($results as $result) {
            if (!$current_path) {
                $new_path = $result['category_id'];
            } else {
                $new_path = $current_path . '_' . $result['category_id'];
            }

            $ret_string .= '<li class="cid' . $result['category_id'] . '">';

            $ajax = false;
            if (in_array($result['category_id'], $this->path)) {
                $children = $this->loadCategories($result['category_id'], $new_path, $cid);
            }
            elseif ($result['children']) {
                $children =  '<ul id="children_'.$result['category_id'].'"></ul>';
                $ajax = true;
            }
            else {
                $children = '';
            }
            if ($cid == $result['category_id']) {
                //if ($this->category_id == $result['category_id']) {
                $classactive = 'active';
            } else {
                $classactive = '';
            }


            if ($children) {
                $ret_string .= '<a class="havechild ' . $classactive . ' expand-categ" href="' . $this->url->link('catalog/custom_tabs', 'token=' . $this->session->data['token'] . '&path=' .  $new_path)  . '" category="'.$result['category_id'].'" path="'.$new_path.'">' . $result['name'] . '</a>';
            } else {
                $ret_string .= '<a class="nochild ' . $classactive . '" href="' . $this->url->link('catalog/custom_tabs','token=' . $this->session->data['token'] . '&path=' .  $new_path)  . '">' . $result['name'] . '</a>';
            }

            $ret_string .= $children.'</li>';
        }


        if ($results) $ret_string .= '</ul>';
        return $ret_string;
    }


}
