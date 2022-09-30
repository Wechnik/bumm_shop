<?php
class ControllerExtensionModuleSmartFilter extends Controller {
    public function index() {
        $this->load->language('extension/module/smart_filter');

        $this->document->addStyle('catalog/view/javascript/jquery/nice-select/nice-select.css');
        $this->document->addScript('catalog/view/javascript/jquery/nice-select/jquery.nice-select.min.js');

        $data['heading_title'] = $this->language->get('heading_title');

        $this->load->model('extension/module/smart_filter');

        $this->load->model('catalog/product');
        $this->load->model('catalog/category');

        $data['categories'] = array();

        $data['all_car_years'] = $this->model_extension_module_smart_filter->getAllCarYears();
        $data['mark_id'] = 0;
        $data['marks'] = $data['models'] = $data['generations'] = array();
        $data['car_year'] = isset($this->request->get['car'])?$this->request->get['car']:'';
        $data['mark_id'] = isset($this->request->get['mark'])?$this->request->get['mark']:'';
        $data['model_id'] = isset($this->request->get['model'])?$this->request->get['model']:'';
        $data['generation_id'] = isset($this->request->get['generation']) ? $this->request->get['generation']:'';

        if (!isset($this->request->get['car']) && !isset($this->request->get['mark']) && !isset($this->request->get['model']) && !isset($this->request->get['generation'])) {

            $data['car'] = false;

            $top_categories = $this->model_catalog_category->getCategories(0, false);

            foreach ($top_categories as $top_category) {

                if ($top_category['image']) {
                    $top_category_image = $this->model_tool_image->resize($top_category['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $top_category_image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                $children_data = array();

                $children = $this->model_catalog_category->getCategories($top_category['category_id'], false);

                foreach ($children as $child) {

                    if ($child['image']) {
                        $child_category_image = $this->model_tool_image->resize($child['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                    } else {
                        $child_category_image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                    }

                    $children_data[] = array(
                        'name'  => $child['name'],
                        'translate_name'  => $this->translate->getLat($child['name']),
                        'thumb'  => $child_category_image,
                        'href'  => $this->url->link('product/category', 'path=' . $top_category['category_id'] . '_' . $child['category_id'])
                    );
                }

                // Level 1
                $data['categories'][] = array(
                    'name'     => $top_category['name'],
                    'translate_name'  => $this->translate->getLat($top_category['name']),
                    'thumb'     => $top_category_image,
                    'children' => $children_data,
                    'href'     => $this->url->link('product/category', 'path=' . $top_category['category_id'])
                );
            }

            $data['smart_page'] = false;


        } else if (isset($this->request->get['car']) && isset($this->request->get['mark']) && isset($this->request->get['model'])) {

            $data['car'] = $this->request->get['car'];
            $data['mark'] = $this->model_extension_module_smart_filter->getCarMark($this->request->get['mark'])['car_mark'];
            $data['marks'] = $this->model_extension_module_smart_filter->getMarkByYear($data['car_year']);
            $data['models'] = $this->model_extension_module_smart_filter->getModelByYearMark($data['car_year'], $data['mark_id']);
            $data['generations'] = $this->model_extension_module_smart_filter->getGenerationByYearMarkModel($data['car_year'], $data['mark_id'], $data['model_id']);

            $data['model'] = $this->model_extension_module_smart_filter->getCarModel($this->request->get['model'])['car_model'];
            $data['generation'] = isset($this->request->get['generation']) ? $this->model_extension_module_smart_filter->getCarGeneration($this->request->get['generation'])['car_generation'] : false;

            $prod_ids = $this->model_extension_module_smart_filter->getFilteredProducts($this->request->get['car'], $this->request->get['mark'], $this->request->get['model'], ($this->request->get['generation']) ?? false);

            if ($prod_ids) {
                $data['categories'] = [];
                foreach ($prod_ids as $prod_id) {
                    $product_categories = $this->model_extension_module_smart_filter->getProductMainCategories($prod_id['product_id']);

                    $data_cat = $this->model_catalog_category->getCategory($product_categories['category_id']);
	
//	                echo '<pre>'; print_r($data_cat); die;
	
	
	                foreach ($product_categories as $product_category) {
                        $data_product = $this->model_catalog_product->getProduct($prod_id['product_id']);
                        
                        if ($data_cat['image']) {
                            $cat_image = $this->model_tool_image->resize($data_cat['image'], 600, 400);
                        } else {
	                        $cat_image = $this->model_tool_image->resize('placeholder.png', 600, 400);
                        }
                        
                        if ($data_product['image']) {
                            $image = $this->model_tool_image->resize($data_product['image'], 600, 400);
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', 600, 400);
                        }
                        
                        if ($data_product['preview']) {
                            $preview = $this->model_tool_image->resize($data_product['preview'], 600, 400);
                        } else {
                            $preview = $this->model_tool_image->resize('placeholder.png', 600, 400);
                        }

                        if ((float)$data_product['special']) {
                            $special = $this->currency->format($this->tax->calculate($data_product['special'], $data_product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                        } else {
                            $special = false;
                        }

                        if ($this->config->get('config_tax')) {
                            $tax = $this->currency->format((float)$data_product['special'] ? $data_product['special'] : $data_product['price'], $this->session->data['currency']);
                        } else {
                            $tax = false;
                        }

                        if ($this->config->get('config_review_status')) {
                            $rating = (int)$data_product['rating'];
                        } else {
                            $rating = false;
                        }


                        $cat_path = $this->getPathByCategory($product_categories['category_id']);
	                    
                        $data['categories'][$data_cat['filter_sort_order'] . '-' . $data_cat['category_id']]['categories'] = [
                            'category_id' => $data_cat['category_id'],
                            'cat_name' => $data_cat['name'],
                            'cat_image' => $cat_image,
                            'cat_href' => $this->url->link('product/category', 'path=' . $cat_path),
                            'cat_tab_name' => $this->translate->getLat($data_cat['name']),
                        ];
                        
                        $opt_prices = [];

                        foreach ($this->model_catalog_product->getProductOptions($data_product['product_id']) as $option) {


                            foreach ($option['product_option_value'] as $option_value) {
                                if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {


                                    if($option_value['price'] != 0) {

                                        if($option_value['price_prefix'] == '+') {
                                            $opt_price = $data_product['price'] + $option_value['price'];
                                        } else {
                                            $opt_price = $data_product['price'] - $option_value['price'];
                                        }

                                    } else {

                                        if($option_value['increase'] == 1) {
                                            $opt_price = $data_product['price'] + $option_value['opt_price'];
                                        } else {
                                            $opt_price = $data_product['price'] - $option_value['opt_price'];
                                        }

                                    }

                                    $opt_prices[] = $opt_price;

                                }

                            }

                        }

                        if($opt_prices && min($opt_prices) != 0) {

                            $prod_price = min($opt_prices);

                        } else {

                            $prod_price = $data_product['price'];

                        }


                        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                            $price = $this->currency->format($this->tax->calculate($prod_price, $data_product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                        } else {
                            $price = false;
                        }


                        $data['categories'][$data_cat['filter_sort_order'] . '-' . $data_cat['category_id']]['cat_prods'][$data_product['product_id']] = array(
                            'product_id'  => $data_product['product_id'],
                            'thumb'       => $image,
                            'preview'       => $preview,
                            'name'        => $data_product['name'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($data_product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                            'price'       => $price,
                            'base_price'          => (isset($data_product['base_price']) and $data_product['base_price'] > 0 ) ? $this->currency->format(1, $data_product['base_currency_code'], $data_product['base_price'], true) : '',
                            'base_special'        => (isset($data_product['base_special']) and $data_product['base_special'] > 0 ) ? $this->currency->format(1, $data_product['base_currency_code'], $data_product['base_special'], true) : '',
                            'special'     => $special,
                            'tax'         => $tax,
                            'minimum'     => ($data_product['minimum'] > 0) ? $data_product['minimum'] : 1,
                            'rating'      => $rating,
                            'href'        => $this->url->link('product/product', 'product_id=' . $data_product['product_id'])
                        );



                    }
                }
            }
            $data['smart_page'] = true;

        }
        
        krsort($data['categories']);

        return $this->load->view('extension/module/smart_filter', $data);
    }

    public function get_mark() {

        $year_marks = [];

        if(isset($this->request->post['car_year_id'])) {

            $this->load->model('extension/module/smart_filter');

            $year_marks = $this->model_extension_module_smart_filter->getMarkByYear($this->request->post['car_year_id']);

        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($year_marks));

        return $year_marks;

    }

    public function get_model() {

        $models = [];

        if(isset($this->request->post['car_year_id']) && isset($this->request->post['car_mark_id'])) {

            $car_year_id = $this->request->post['car_year_id'];
            $car_mark_id = $this->request->post['car_mark_id'];

            $this->load->model('extension/module/smart_filter');

            $models = $this->model_extension_module_smart_filter->getModelByYearMark($car_year_id, $car_mark_id);

        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($models));

        return $models;

    }

    public function get_generation() {

        $generations = [];

        if(isset($this->request->post['car_year_id']) && isset($this->request->post['car_mark_id']) && isset($this->request->post['car_model_id'])) {

            $car_year_id = $this->request->post['car_year_id'];
            $car_mark_id = $this->request->post['car_mark_id'];
            $car_model_id = $this->request->post['car_model_id'];

            $this->load->model('extension/module/smart_filter');

            $generations = $this->model_extension_module_smart_filter->getGenerationByYearMarkModel($car_year_id, $car_mark_id, $car_model_id);

        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($generations));

        return $generations;

    }


    private function getPathByCategory($category_id) {
        $category_id = (int)$category_id;
        if ($category_id < 1) return false;

        static $path = null;
        if (!isset($path)) {
            $path = $this->cache->get('category.seopath');
            if (!isset($path)) $path = array();
        }

        if (!isset($path[$category_id])) {
            $max_level = 10;

            $sql = "SELECT CONCAT_WS('_'";
            for ($i = $max_level-1; $i >= 0; --$i) {
                $sql .= ",t$i.category_id";
            }
            $sql .= ") AS path FROM " . DB_PREFIX . "category t0";
            for ($i = 1; $i < $max_level; ++$i) {
                $sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i-1) . ".parent_id)";
            }
            $sql .= " WHERE t0.category_id = '" . $category_id . "'";

            $query = $this->db->query($sql);

            $path[$category_id] = $query->num_rows ? $query->row['path'] : false;

            $this->cache->set('category.seopath', $path);
        }

        return $path[$category_id];
    }

}