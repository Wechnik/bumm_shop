<?php
class ControllerExtensionModulePurpletreeSellerblog extends Controller {
		public function index() { 
			$this->load->language('extension/module/purpletree_sellerblog');
			
			$data['heading_title'] = $this->language->get('heading_title');
			$this->document->addStyle('catalog/view/javascript/purpletree/jquery/owl-carousel/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/owl-carousel/owl.carousel.min.js');
			$direction = $this->language->get('direction');
		 if ($direction=='rtl'){
			$this->document->addStyle('catalog/view/javascript/purpletree/bootstrap/css/bootstrap.min-a.css');
			$this->document->addStyle('catalog/view/theme/default/stylesheet/purpletree/custom-a.css'); 
			}else{
			$this->document->addStyle('catalog/view/javascript/purpletree/bootstrap/css/bootstrap.min.css'); 
			$this->document->addStyle('catalog/view/theme/default/stylesheet/purpletree/custom.css'); 
			}
			
			$data['text_readmore'] = $this->language->get('text_readmore');
			
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			
			$this->load->model('extension/module/purpletree_sellerblog');
			
			$this->load->model('tool/image');
			
			$data['pts_blogs'] = array();
			$data['view_all'] = $this->language->get('view_all');
			$data['allblog'] = $this->url->link('account/purpletree_multivendor/blog_post/allblog','', true);
			$results = $this->model_extension_module_purpletree_sellerblog->getPurpletreeBlog($this->config->get('purpletree_sellerblog_limit'));
			$image_height = 150;
			$image_width = 150;
			if ($this->config->get('purpletree_sellerblog_height')) {
			  $image_height = $this->config->get('purpletree_sellerblog_height');
			}
			if ($this->config->get('purpletree_sellerblog_width')) {
			  $image_width = $this->config->get('purpletree_sellerblog_width');
			}
			if ($results) {
				foreach ($results as $result) {
                    $result = $this->load->controller('extension/module/hpmodel/hpmodel/getCategoryBlock', $result);
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $image_width, $image_height);
						} else {
						$image = $this->model_tool_image->resize('placeholder.png', $image_width, $image_height);
					}
					
					$data['pts_blogs'][] = array(
					'blog_post_id'  => $result['blog_post_id'],
					'thumb'       => $image,
					'title'        => $result['title'],
					'description' => substr(utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')), 0, 20) . '...',
					'date'     => date('d M', strtotime($result['created_at'])),
					'href'        => $this->url->link('account/purpletree_multivendor/blog_post', 'blog_post_id=' . $result['blog_post_id'])
					);
				}
				$this->document->addStyle('catalog/view/javascript/purpletree/css/stylesheet/commonstylesheet.css');
				return $this->load->view('extension/module/purpletree_sellerblog', $data);
			}
		}
}