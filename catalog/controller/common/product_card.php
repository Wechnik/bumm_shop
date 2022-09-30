<?php
class ControllerCommonProductCard extends Controller {
	public function index($params)
    {

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $this->load->model('catalog/review');

        $this->load->model('account/wishlist');

        $this->load->model('purpletree_multivendor/sellerproduct');

        $data['text_reviews'] = '';

        $data['page'] = $params['page'];
        $data['products'] = [];
        
        foreach ($params['products'] as $result) {
		
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
	
	        $prod_price = $opt_prices ? min($opt_prices) : $result['price'];
	
	        if ($result['image']) {
		        $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
	        } else {
		        $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
	        }
	
	        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
		        $price = $this->currency->format($this->tax->calculate($prod_price, $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
	        } else {
		        $price = false;
	        }
	
	        if($params['page'] == 'seller') {
		        $product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($result['product_id']);
		
		        $special = false;
		
		        foreach ($product_specials  as $product_special) {
			        if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
				        $special = $this->currency->format($this->tax->calculate($product_special['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				        break;
			        }
		        }
	        } else {
		        if ((float)$result['special']) {
			        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
		        } else {
			        $special = false;
		        }
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
	
	        $tmp_url = isset($this->request->get['path']) ? '&path=' . $this->request->get['path'] : false;
	        
	        $data['products'][] = array(
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
		        'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $tmp_url)
	        );
        }

        if (isset($this->session->data['compare'])) {
            $data['compare_list'] = $this->session->data['compare'];
        } else {
            $data['compare_list'] = false;
        }

        if ($this->customer->isLogged()) {
            $wishlist = $this->model_account_wishlist->getWishlist();
            foreach ($wishlist as $key => $value) {
                $wishlist_id[] = $value['product_id'];
            }
            if ($wishlist_id) {
                $data['wishlist_list'] = $wishlist_id;
            }
        } else {
            if (isset($_COOKIE['wishlist_products'])) {
                $data['wishlist_list'] = $_COOKIE['wishlist_products'];
            }
        }
        
        return $this->load->view('common/product_card', $data);

	}

}
