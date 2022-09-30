<?php

class ControllerExtensionModuleHpmodelHpmodel extends Controller {
    private $type;    
    
    public function product_variant_type_table($product_id) {
        $data = array();
        
        $this->load->model('extension/module/hpmodel');

        $parent = $this->model_extension_module_hpmodel->getParent($product_id);
        if (!$parent) return;
                    
        $this->load->model('tool/image');
        $this->load->model('catalog/product');
        
        if (empty($this->types)) $this->types = $this->model_extension_module_hpmodel->getTypes();
        if (empty($parent['type_id']) || empty($this->types[$parent['type_id']])) return;
        
        $language_id = (int)$this->config->get('config_language_id');
        $type = $this->types[$parent['type_id']];

        if (!empty($type['setting']['redirect']) && $product_id != $parent['parent_id']) {
            $this->response->redirect($this->url->link('product/product', 'product_id=' . $parent['parent_id'], 'SSL') . (!empty($type['setting']['hash']) ? '#' . $product_id : ''), 301);
        }
            
        $type['setting']['child_image_width'] = !empty($type['setting']['product_image_width']) ? $type['setting']['product_image_width'] : 100;
        $type['setting']['child_image_height'] = !empty($type['setting']['product_image_height']) ? $type['setting']['product_image_height'] : 100;
        $type['setting']['limit'] = 0;
        $type['setting']['product_columns'] = !empty($type['setting']['product_columns']) ? $type['setting']['product_columns'] : array();
        $type['setting']['product_attributes'] = !empty($type['setting']['product_attributes']) ? $type['setting']['product_attributes'] : array();
        $type['setting']['replace_image'] = !empty($type['setting']['replace_image']) ? $type['setting']['replace_image'] : false;
        
        $childs = $this->model_extension_module_hpmodel->getChilds($parent['parent_id'], 0, $parent['type_id']);
        
        $data['products'] = $this->prepareProducts($type['setting'], $childs, $parent);

        if (count($data['products']) <= 1) {
            if (isset($data['products'][0]) && $data['products'][0]['product_id'] != $product_id) {
                $this->request->get['product_id'] = $data['products'][0]['product_id'];
            }
            return;
        }
        
        if (!empty($type['setting']['hidden_if_next'])) {
            $no_stock = true;
            foreach ($data['products'] as $product) {
                if ($product['product_id'] == $product_id) {
                    if ($product['quantity'] > 0) $no_stock = false;
                    break;
                }
            }
            if ($no_stock) {
                foreach ($data['products'] as $product) {
                    if ($product['quantity'] > 0) {
                        $product_id = $product['product_id'];
                        break;
                    }
                }
            }
        }
        
        $data['product_id'] = $product_id;
        $data['selected_product_id'] = $product_id;
        $data['title_name'] = !empty($type['setting']['product_title'][$language_id]) ? html_entity_decode($type['setting']['product_title'][$language_id], ENT_QUOTES, 'UTF-8') : '';

        $data['custom_css'] = !empty($type['setting']['custom_css']) ? $type['setting']['custom_css'] : false;
        $data['custom_js'] = !empty($type['setting']['custom_js']) ? $type['setting']['custom_js'] : false;
        
        $data['selector'] = !empty($type['setting']['product_selector']) ? $type['setting']['product_selector'] : false;
        $data['position'] = !empty($type['setting']['product_position']) ? $type['setting']['product_position'] : false;
        
        $data['hash'] = !empty($type['setting']['hash']) ? $type['setting']['hash'] : false;
        $data['name_as_title'] = !empty($type['setting']['product_name_as_title']) ? $type['setting']['product_name_as_title'] : false;
        $data['name_a'] = !empty($type['setting']['after_title']) ? $type['setting']['after_title'] : false;
        
        $data['replace_h1'] = !empty($type['setting']['replace_h1']) ? $type['setting']['replace_h1'] : false;
        $data['replace_image'] = !empty($type['setting']['replace_image']) ? $type['setting']['replace_image'] : false;
        $data['replace_desc'] = !empty($type['setting']['replace_desc']) ? $type['setting']['replace_desc'] : false;
        $data['replace_att'] = !empty($type['setting']['replace_att']) ? $type['setting']['replace_att'] : false;
        $data['variant'] = $type['setting']['product_variant'];
        $data['selector'] = !empty($type['setting']['product_selector']) ? $type['setting']['product_selector'] : false;
        $data['position'] = !empty($type['setting']['product_position']) ? $type['setting']['product_position'] : false;
        
        $data['path'] = !empty($this->request->get['path']) ? '&path='.$this->request->get['path'] : '';
        
        $data['text_select'] = $this->language->get('text_select');
        
        $result = array();

        if (floatval(VERSION) >= 2.2) {
            $data['config'] = $this->load->view('extension/module/hpmodel/config', $data);

            $result['html'] = $this->load->view('extension/module/hpmodel/hpmodel', $data);
        } else {
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/hpmodel/config.tpl')) {
                $data['config'] = $this->load->view($this->config->get('config_template') . '/template/extension/module/hpmodel/config.tpl', $data);
            } else {
                $data['config'] = $this->load->view('default/template/extension/module/hpmodel/config.tpl', $data);
            }
            
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/hpmodel/hpmodel.tpl')) {
                $result['html'] = $this->load->view($this->config->get('config_template') . '/template/extension/module/hpmodel/hpmodel.tpl', $data);
            } else {
                $result['html'] = $this->load->view('default/template/extension/module/hpmodel/hpmodel.tpl', $data);
            }
        }
        
        return $result;
    }
    
    public function getForm() {
        if (!empty($this->request->post['hpmodel_orig']) || !isset($this->request->get['product_id'])) return;
        return $this->product_variant_type_table((int)$this->request->get['product_id']);
    }
    
    private function prepareProducts($setting, $childs, $parent) {
        $products = array();
                
        $product_ids = array();
        foreach ($childs as $child) {
            $product_ids[] = $child['product_id']; 
        }
        $products_data = $this->model_extension_module_hpmodel->getProducts($product_ids);
        
        if (!isset($setting['product_columns'])) $setting['product_columns'] = array();        
        
        $attributes_id = array();
        foreach ($setting['product_columns'] as $key => $column) {
            if ($column == 'attribute' && !empty($setting['product_attributes'][$key])) $attributes_id[$key] = $setting['product_attributes'][$key];
        }
        
        if (!empty($setting['after_title']) && $setting['after_title'] == 'attribute' && !empty($setting['after_title_attribute'])) {
            $attributes_id['at'] = $setting['after_title_attribute'];
        }
                
        foreach ($products_data as $product_info) {
            $view = array();
            $view_text = array();
            
            if (!empty($setting['hidden_if_null']) && $product_info['quantity'] < 1) continue;
            
            if ($attributes_id) {
                $attributes = $this->model_extension_module_hpmodel->getProductAttributes($product_info['product_id'], $attributes_id);
            } else {
                $attributes = array();
            }
            
            $product_info['after_title'] = !empty($setting['after_title']) && !empty($product_info[$setting['after_title']]) ? $product_info[$setting['after_title']] : '';
            
            if (!empty($product_info['discount'])) $product_info['price'] = $product_info['discount'];
            
            foreach ($setting['product_columns'] as $key => $column) {
                if (empty($column) || $column == 'none') {
                    continue;
                }
                
                $value = isset($product_info[$column]) ? $product_info[$column] : '';
                $value_text = $value;

                switch ($column) {
                    case 'attribute':
                        if (!empty($attributes_id[$key]) && !empty($attributes[$attributes_id[$key]])) {
                            $value = $attributes[$attributes_id[$key]];
                            $column .= '-' . $attributes_id[$key];
                        } else {  
                            $value = false;
                        }
                        $value_text = $value;
                        break;
                    case 'col_weight':
                        $value = (float)$product_info['weight'];
                        $value_text = $value;
                        break;
                    case 'col_size':
                        $value = (float)$product_info['length'].'x'.(float)$product_info['width'].'x'.(float)$product_info['height'];
                        $value_text = $value;
                        break;
                    case 'name_exp_last':
                        $name_arr = explode(' ', $product_info['name']);
                        $value = array_pop($name_arr);
                        $value_text = $value;
                        break;
                    case 'price':
                        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                            if ((float)$product_info['special']) {
                                $value = '<span class="hprice-old">' . $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) . '</span> <span class="hprice-new">' . $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) . '</span>';
                            } else {
                                $value = '<span class="hprice">' . $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) . '</span>';
                            }
                            $value_text = $this->currency->format($this->tax->calculate((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                        } else {
                            $value = false;
                            $value_text = false;
                        }
                        break;
                    case 'image':
                        $view = array();
                        $text = implode(', ', $view_text);
                        $thumb_image = !empty($product_info['image']) ? $product_info['image'] : 'no_image.png';
                        $value = '<img src="' . $this->model_tool_image->resize($thumb_image, $setting['child_image_width'], $setting['child_image_height']) . '" alt="' . ($text ? $text : $product_info['name']) . '" ' . ($text ? 'data-toggle="tooltip" title="'.$text.'"' : 'title="'.$product_info['name'].'"') . ' />';
                        $value_text = false;                            
                        break;
                }

                if ($value) {
                    $view[$column] = $value;
                    if (!empty($setting['after_title']) && $setting['after_title'] == $column) $product_info['after_title'] = $value;
                }
                if ($value_text) $view_text[$column] = $value_text;
            }


            if (!$view) continue;
            
            $product_info['view_text'] = $view_text ? implode(' ', $view_text) : $product_info['name'];
            
            if (!empty($attributes_id['at'])) $product_info['after_title'] = !empty($attributes[$attributes_id['at']]) ? $attributes[$attributes_id['at']] : '';
            
            $product_info['price_value'] = $product_info['price'];
            $product_info['special_value'] = $product_info['special'];
            
            $product_info['view'] = $view;
            
            if (!empty($setting['redirect']) && $product_info['product_id'] != $parent['parent_id']) {
                $product_info['href'] = $this->url->link('product/product', 'product_id=' . $parent['parent_id'] . (!empty($this->request->get['path']) ? '&path='.$this->request->get['path'] : '')) . '#' . $product_info['product_id'];
            } else {
                $product_info['href'] = $this->url->link('product/product', 'product_id=' . $product_info['product_id'] . (!empty($this->request->get['path']) ? '&path='.$this->request->get['path'] : ''));
            }
            $product_info['href_real'] = $this->url->link('product/product', 'product_id=' . $product_info['product_id'] . (!empty($this->request->get['path']) ? '&path='.$this->request->get['path'] : ''));
            
            $product_info['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            $product_info['special'] = (float)$product_info['special'] ? $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) : false;
            
            if (!empty($setting['replace_image'])) {
                if (!$product_info['product_image']) $product_info['product_image'] = 'no_image.png';
                if (version_compare(VERSION, '3.0', '>=')) {
                    $product_info['thumb'] = $this->model_tool_image->resize($product_info['product_image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $product_info['thumb'] = $this->model_tool_image->resize($product_info['product_image'], $this->config->get($this->config->get('config_theme') . '_image_product_width') ? $this->config->get($this->config->get('config_theme') . '_image_product_width') : $this->config->get('config_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height') ? $this->config->get($this->config->get('config_theme') . '_image_product_height') : $this->config->get('config_image_product_height'));
                }
            }

            $products[] = $product_info;
            if ((int)$setting['limit'] && count($products) >= $setting['limit']) break;
        }

        return $products;
    }
    
    public function getCategoryBlock($product_info) {
        $data = array();
        
        if (!isset($product_info['product_id'])) return $product_info;
        
        $this->load->model('extension/module/hpmodel');

        $parent = $this->model_extension_module_hpmodel->getParent($product_info['product_id']);
        if (!$parent) return $product_info;
        
        $this->load->model('catalog/product');
        
        if (empty($this->types)) $this->types = $this->model_extension_module_hpmodel->getTypes();
        if (empty($parent['type_id']) || empty($this->types[$parent['type_id']]) || empty($this->types[$parent['type_id']]['setting']['category_show'])) return $product_info;
        
        $language_id = (int)$this->config->get('config_language_id');
        $type = $this->types[$parent['type_id']];

        $type['setting']['child_image_width'] = !empty($type['setting']['category_image_width']) ? $type['setting']['category_image_width'] : 50;
        $type['setting']['child_image_height'] = !empty($type['setting']['category_image_height']) ? $type['setting']['category_image_height'] : 50;
        $type['setting']['limit'] = !empty($type['setting']['category_limit']) ? (int)$type['setting']['category_limit'] : 0;
        $type['setting']['product_columns'] = !empty($type['setting']['category_columns']) ? $type['setting']['category_columns'] : array();
        $type['setting']['product_attributes'] = !empty($type['setting']['category_attributes']) ? $type['setting']['category_attributes'] : array();
        $type['setting']['replace_image'] = !empty($type['setting']['category_replace_image']) ? $type['setting']['category_replace_image'] : false;
        
        $childs = $this->model_extension_module_hpmodel->getChilds($parent['parent_id'], 0, $parent['type_id']);
        
        $data['products'] = $this->prepareProducts($type['setting'], $childs, $parent);
        
        $has_main_product = false;
        foreach ($data['products'] as $product) {
            if ($product['product_id'] == $product_info['product_id']) {
                $has_main_product = true;
                break;
            }
        }
        //if (isset($data['products'][0]) && !$has_main_product) {
        //    $product_info = $this->model_catalog_product->getProduct($data['products'][0]['product_id']);
        //}
        if (count($data['products']) <= 1) {
            return $product_info;
        }
        
        $product_id = $product_info['product_id'];
        if (!empty($type['setting']['hidden_if_next'])) {
            $no_stock = true;
            foreach ($data['products'] as $product) {
                if ($product['product_id'] == $product_id) {
                    if ($product['quantity'] > 0) $no_stock = false;
                    break;
                }
            }
            if ($no_stock) {
                foreach ($data['products'] as $product) {
                    if ($product['quantity'] > 0) {
                        $product_info = $this->model_catalog_product->getProduct($product['product_id']);
                        break;
                    }
                }
            }
        }
        
        $data['product_id'] = $product_info['product_id'];
        $data['title'] = !empty($type['setting']['category_title'][$language_id]) ? html_entity_decode($type['setting']['category_title'][$language_id], ENT_QUOTES, 'UTF-8') : '';
        $data['replace_h1'] = !empty($type['setting']['category_replace_h1']) ? $type['setting']['category_replace_h1'] : false;
        $data['replace_image'] = !empty($type['setting']['category_replace_image']) ? $type['setting']['category_replace_image'] : false;
        $data['variant'] = $type['setting']['category_variant'];

        if (!empty($type['setting']['replace_image'])) {
            $image = $product_info['image'];
            if (!$image) $image = 'no_image.png';
            if (version_compare(VERSION, '3.0', '>=')) {
                $data['thumb'] = $this->model_tool_image->resize($image, $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            } else {
                $data['thumb'] = $this->model_tool_image->resize($image, $this->config->get($this->config->get('config_theme') . '_image_product_width') ? $this->config->get($this->config->get('config_theme') . '_image_product_width') : $this->config->get('config_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height') ? $this->config->get($this->config->get('config_theme') . '_image_product_height') : $this->config->get('config_image_product_height'));
            }
        }
        
        $data['text_select'] = $this->language->get('text_select');
        
        if (floatval(VERSION) >= 2.2) {
            $product_info['hpm_block'] = $this->load->view('extension/module/hpmodel/category_block', $data);
        } else {
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/hpmodel/category_block.tpl')) {
                $product_info['hpm_block'] = $this->load->view($this->config->get('config_template') . '/template/extension/module/hpmodel/category_block.tpl', $data);
            } else {
                $product_info['hpm_block'] = $this->load->view('default/template/extension/module/hpmodel/category_block.tpl', $data);
            }
        }        
        return $product_info;
    }
    
    
    public function get_product_data() {
        $json = array();
        
        $data_class = !empty($this->request->get['class']) ? explode('|', $this->request->get['class']) : array();
        $product_id = !empty($this->request->get['id']) ? $this->request->get['id'] : 0;
        
        if (!$product_id) return;
        
        if (in_array('option', $data_class)) {
            $data = array();
            
            $data['product_id'] = $product_id;
            $data['options'] = array();

            $this->load->model('catalog/product');
            $this->load->model('tool/image');

            foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
                $product_option_value_data = array();

                foreach ($option['product_option_value'] as $option_value) {
                    if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                            $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                        } else {
                            $price = false;
                        }

                        $product_option_value_data[] = array(
                            'product_option_value_id' => $option_value['product_option_value_id'],
                            'option_value_id'         => $option_value['option_value_id'],
                            'name'                    => $option_value['name'],
                            'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
                            'price'                   => $price,
                            'price_prefix'            => $option_value['price_prefix']
                        );
                    }
                }

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
            
            
            if (floatval(VERSION) >= 2.2) {
                $json['option'] = $this->load->view('extension/module/hpmodel/pd_option', $data);
            } else {
                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/hpmodel/pd_option.tpl')) {
                    $json['option'] = $this->load->view($this->config->get('config_template') . '/template/extension/module/hpmodel/pd_option.tpl', $data);
                } else {
                    $json['option'] = $this->load->view('default/template/extension/module/hpmodel/pd_option.tpl', $data);
                }
            }                    
        }
        
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
