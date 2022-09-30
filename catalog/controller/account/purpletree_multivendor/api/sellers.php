<?php
class ControllerAccountPurpletreeMultivendorApiSellers extends Controller {
		public function index() {
			$this->load->language('purpletree_multivendor/sellerstore');
			if (!$this->customer->isMobileApiCall()) {
				$json['message'] = $this->language->get('error_permission');
				$json['status'] = 'error';
				$this->response->addHeader('Content-Type: application/json');
				return $this->response->setOutput(json_encode($json));
			}
			$this->load->language('purpletree_multivendor/sellers');
			
			$this->load->model('purpletree_multivendor/sellers');
			
			$this->load->model('tool/image');
			
			$sort = 'seller';
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			}
			
			$filter = '';
			if (isset($this->request->get['search_text'])) {
				$filter = $this->request->get['search_text'];
			}
			
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
				} else {
				$order = 'ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			
			$url = '';
			
			if (isset($this->request->get['limit'])) {
				$limit = (int)$this->request->get['limit'];
				} else {
				$limit = $this->config->get('theme_' . $this->config->get('config_theme') . '_product_limit');
			}
			if($limit == '' || $limit ==0) {
				$limit = 20;
			}
			
			$filter_data_seller = array(
			'sort'               => $sort,
			'order'              => $order,
			'filter'              => $filter,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit	
			);
			
			$seller_totals = $this->model_purpletree_multivendor_sellers->getTotalSellers($filter_data_seller);
			
			$seller_lists = $this->model_purpletree_multivendor_sellers->getSellers($filter_data_seller);
			
			$json['data']['sellers'] = array();
			
			foreach ($seller_lists as $seller_list) {
				if ($seller_list['store_logo']) {
					$json['data']['seller_thumb'] = $this->model_tool_image->resize($seller_list['store_logo'],100 ,100 );
					} else {
					$json['data']['seller_thumb'] = $this->model_tool_image->resize('placeholder.png', 100,100);
				}
				
				$json['data']['seller_address'] = html_entity_decode($seller_list['store_address'], ENT_QUOTES, 'UTF-8');
				$json['data']['seller_country'] = $seller_list['seller_country'];
				$json['data']['seller_name'] = $seller_list['seller'];
				$json['data']['store_name'] = $seller_list['store_name'];
				
				
				$json['data']['products'] = array();
				
				$filter_data = array(
				'start'              => 0,
				'limit'              => 5,
				'seller_id'			=> $seller_list['seller_id']	
				);
				
				$product_total = $this->model_purpletree_multivendor_sellers->getTotalProducts($filter_data);
				
				$results = $this->model_purpletree_multivendor_sellers->getProducts($filter_data);
				
				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], 60, 60);
						} else {
						$image = $this->model_tool_image->resize('placeholder.png', 60, 60);
					}
					
					$json['data']['products'][] = array(
					'thumb'       => $image,
					'product_id'        => $result['product_id']
					);
				}
				
				$json['data']['sellers'][] = array(
				'seller_thumb' => $json['data']['seller_thumb'],
				'seller_name' => $json['data']['store_name'],
				'seller_address' => $json['data']['seller_address'],
				'seller_country' => $json['data']['seller_country'],
                'seller_id' => $seller_list['seller_id'],				
				'product_total' => $product_total,
				'products' => $json['data']['products']
				);
			}		
			
			$json['data']['sorts'] = array();
			
			$json['data']['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'seller-ASC'
			);
			
			$json['data']['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'seller-DESC'
			
			);			
			
			$data['limits'] = array();
			
			$limits = array_unique(array($this->config->get('theme_' . $this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));
			
			sort($limits);
			
			foreach($limits as $value) {
				$json['data']['limits'][] = array(
				'text'  => $value,
				'value' => $value
				);
			}		
			
            $json['data']['pagination']['total'] = $seller_totals;
			$json['data']['pagination']['page'] = $page;
			$json['data']['pagination']['limit'] = $limit;
			$json['data']['results'] = sprintf($this->language->get('text_pagination'), ($seller_totals) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($seller_totals - $limit)) ? $seller_totals : ((($page - 1) * $limit) + $limit), $seller_totals, ceil($seller_totals / $limit));			
			
			$json['data']['sort'] = $sort;
			$json['data']['order'] = $order;
			$json['data']['filter'] = $filter;
			$json['data']['limit'] = $limit;
			
			$currentpage = $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
			$this->session->data['ptsmv_current_page'] = $currentpage;
			
			$json['status'] = 'success';
            $this->response->addHeader('Content-Type: application/json');
		    return $this->response->setOutput(json_encode($json)); 
		}
}