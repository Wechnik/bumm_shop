<?php

class ControllerProductSmartfilter extends Controller
{
    public function index()
    {

        $this->load->language('product/category');

        $this->load->model('catalog/category');

        $this->load->model('extension/module/smart_filter');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');
	
	
	    $this->document->addStyle('catalog/view/javascript/jquery/slick-slider/slick.css');
	    $this->document->addStyle('catalog/view/javascript/jquery/slick-slider/slick-theme.css');
	    $this->document->addScript('catalog/view/javascript/jquery/slick-slider/slick.min.js');


        if (isset($this->request->get['car']) && isset($this->request->get['mark']) && isset($this->request->get['model'])) {

            $car = $this->request->get['car'];
            $mark = $this->request->get['mark'];
            $model = $this->request->get['model'];

            $generation = isset($this->request->get['generation']) ? $this->request->get['generation'] : false;

            $metatag_start = $this->config->get('config_filter_metatag_start');
            $metatag_end = $this->config->get('config_filter_metatag_end');

            $car_name = $this->model_extension_module_smart_filter->getCarYear($car);
            $mark_name = $this->model_extension_module_smart_filter->getCarMark($mark);
            $model_name = $this->model_extension_module_smart_filter->getCarModel($model);

            $seo_description = $metatag_start . ' ' . $car_name['car_year'] . ' ' . $mark_name['car_mark'] . ' ' . $model_name['car_model'];
	
	        $generation_name['car_generation'] = false;
            
            if($generation) {

                $generation_name = $this->model_extension_module_smart_filter->getCarGeneration($generation);

                $seo_description .= ' ' . $generation_name['car_generation'];

            }

            $seo_description .= ' ' . $metatag_end;
	           
            $this->document->setTitle($seo_description);
            $this->document->setDescription($seo_description);
            $this->document->setKeywords($car_name['car_year'] . ' ' . $mark_name['car_mark'] . ' ' . $model_name['car_model'] . ' ' . $generation_name['car_generation'] ? $generation_name['car_generation'] : false);

            $prod_ids = $this->model_extension_module_smart_filter->getFilteredProducts($car, $mark, $model, $generation);

            if ($prod_ids) {

                foreach ($prod_ids as $prod_id) {

                    $product_categories = $this->model_extension_module_smart_filter->getProductCategories($prod_id['product_id']);


                    foreach ($product_categories as $product_category) {
                        $cat_info = $this->model_catalog_category->getCategory($product_category);

                        if ($cat_info) {

                            $tmp_path = $this->getPathByCategory($cat_info['category_id']);


                            if ($this->config->get('moneymaker2_catalog_categories_child_images')) {
                                if ($cat_info['image']) {
                                    $cat_image = $this->model_tool_image->resize($cat_info['image'], $this->config->get('moneymaker2_catalog_categories_child_images_width'), $this->config->get('moneymaker2_catalog_categories_child_images_height'));
                                } else {
                                    $cat_image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('moneymaker2_catalog_categories_child_images_width'), $this->config->get('moneymaker2_catalog_categories_child_images_height'));
                                }
                            }

                            $data['categories'] = [];

                            $data['categories'][] = array(
	                            'category_id' => $cat_info['category_id'],
                                'thumb' => $this->config->get('moneymaker2_catalog_categories_child_images') ? $cat_image : false,
                                'name' => $cat_info['name'],
                                'href' => $this->url->link('product/category', 'path=' . $tmp_path),
                            );

                        }


                    }

                }

            }


            $smart_filter['car'] = isset($this->request->get['car']) ? $this->request->get['car'] : false;
            $smart_filter['mark'] = isset($this->request->get['mark']) ? $this->request->get['mark'] : false;
            $smart_filter['model'] = isset($this->request->get['model']) ? $this->request->get['model'] : false;
            $smart_filter['generation'] = isset($this->request->get['generation']) ? $this->request->get['generation'] : false;

            $data['universal_products'] = [];

            $filter_data = array(
                'smart_filter' => $smart_filter,
                'is_universal' => 1,
            );


            $results = $this->model_catalog_product->getProducts($filter_data);


            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
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

                $opt_prices = [];

                foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {


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

                            $opt_prices[] = $opt_price;

                        }


                    }

                }

                if($opt_prices && min($opt_prices) != 0) {

                    $prod_price = min($opt_prices);

                } else {

                    $prod_price = $result['price'];

                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($prod_price ?? $result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }


                $data['universal_products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price' => $price,
                    'base_price' => (isset($result['base_price']) and $result['base_price'] > 0) ? $this->currency->format(1, $result['base_currency_code'], $result['base_price'], true) : '',
                    'base_special' => (isset($result['base_special']) and $result['base_special'] > 0) ? $this->currency->format(1, $result['base_currency_code'], $result['base_special'], true) : '',
                    'special' => $special,
                    'tax' => $tax,
                    'minimum' => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                    'rating' => $rating,
                    'href' => $this->url->link('product/product', 'path=' . $tmp_path . '&product_id=' . $result['product_id'])
                );
            }


        }
	
	    $data['universal_products'] = [];
        

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');


        $this->response->setOutput($this->load->view('product/smart_filter', $data));

    }


    private function getPathByCategory($category_id)
    {
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
            for ($i = $max_level - 1; $i >= 0; --$i) {
                $sql .= ",t$i.category_id";
            }
            $sql .= ") AS path FROM " . DB_PREFIX . "category t0";
            for ($i = 1; $i < $max_level; ++$i) {
                $sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i - 1) . ".parent_id)";
            }
            $sql .= " WHERE t0.category_id = '" . $category_id . "'";

            $query = $this->db->query($sql);

            $path[$category_id] = $query->num_rows ? $query->row['path'] : false;

            $this->cache->set('category.seopath', $path);
        }

        return $path[$category_id];
    }

}
