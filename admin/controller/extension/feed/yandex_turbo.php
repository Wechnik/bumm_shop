<?php
class ControllerExtensionFeedYandexTurbo extends Controller {
	private $error = array();
	protected
		$ymlLimit = 30000,
		$rssPackLimit = 1000,
        $modpath = 'extension/feed/yandex_turbo';

	public function index()
	{
		$this->load->language($this->modpath);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
        $this->load->model($this->modpath);
        $modname = str_replace('/', '_', $this->modpath);
        $model = &$this->{"model_$modname"};

        $data['success'] = isset($this->session->data['success']) ? $this->session->data['success'] : '';
        $data['error']   = isset($this->session->data['error']) ? $this->session->data['error'] : '';

        unset($this->session->data['success'], $this->session->data['error']);

        $settingKeys = array(
            'yandex_turbo_status', 'yandex_turbo_typePrefix', 'yandex_turbo_delivery', 'yandex_turbo_pickup',
            'yandex_turbo_manufacturer_warranty', 'yandex_turbo_adult', 'yandex_turbo_striptags', 'yandex_turbo_vendor',
            'yandex_turbo_attributes', 'yandex_turbo_echo', 'yandex_turbo_qty0' 
        );

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            foreach ($settingKeys as $k) {
                if (!isset($this->request->post[$k])) $this->request->post[$k] = 0;
            }

			$selected = $this->request->post['categories'];

			unset($this->request->post['categories']);

			$model->deleteCategories();

			foreach ($selected as $id => $v) {
				$model->addCategory(array('category_id' => $id));
			}

			$this->model_setting_setting->editSetting('yandex_turbo', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link($this->modpath, 'token=' . $this->session->data['token'] . '&type=feed', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_yandex_category'] = $this->language->get('entry_yandex_category');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_data_feed_rss'] = $this->language->get('entry_data_feed_rss');
		$data['entry_data_feed_yml'] = $this->language->get('entry_data_feed_yml');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_categories'] = $this->language->get('entry_categories');        

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_category_add'] = $this->language->get('button_category_add');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['tab_general'] = $this->language->get('tab_general');

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
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/feed/yandex_turbo', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/feed/yandex_turbo', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true);

		$data['token'] = $this->session->data['token'];

        $data['base_feed_url'] = HTTPS_CATALOG . "index.php?route={$this->modpath}";
        $data['addtocart_url'] = HTTPS_CATALOG . "index.php?route={$this->modpath}/addtocart&id={offer_id}";
        $data['base_xml_url']  = HTTPS_CATALOG . 'yandex-turbo';

        foreach ($settingKeys as $k) {
            if (isset($this->request->post[$k])) $data[$k] = $this->request->post[$k];
            else {
                $val = $this->config->get($k);

                if (in_array($k, array('yandex_turbo_delivery', 'yandex_turbo_pickup'))) $data[$k] = $val === null ? true : $val;
                else $data[$k] = $val ? $val : '';
            }
        }

		$selected = $model->getCategories();
		foreach ($selected as $item) $data['selected'][ $item['category_id'] ] = $item;   
 
		$categories = $this->getCategories(0);

		$names = array();
		foreach ($categories as $r) $names[] = $r['name'];
		array_multisort($names, SORT_ASC, $categories);
		$data['categories'] = $categories;

		$data['totalProducts'] = $data['totalArticles'] = 0;
		$cids = array(); 
		foreach ($selected as $yandex_turbo_category) $cids[] = $yandex_turbo_category['category_id'];

		$filter_data = array(
			'filter_category_id' => $cids,
			'filter_filter'      => false
		);

		$data['totalProducts'] = $model->totalProducts($filter_data);
        $data['totalPages'] = ceil($data['totalProducts'] / $this->ymlLimit);

		$data['totalArticles'] = $model->totalArticles();
		$data['totalRSSLinks'] = (int) ceil($data['totalArticles'] / $this->rssPackLimit);

        $data['product'] = $model->product(); // Товар для примера
        if (!$data['product']) $data['product'] = array('typePrefix' => 'Камеры', 'vendor' => 'Canon', 'model' => 'Canon EOS 5D');

        if (!empty($data['yandex_turbo_vendor'])) $data['product']['vendor'] = $data['yandex_turbo_vendor'];

        if (isset($this->request->post['yandex_turbo_attributes'])) {
            $data['yandex_turbo_attributes'] = $this->request->post['yandex_turbo_attributes'];
        } else {
            $data['yandex_turbo_attributes'] = $this->config->get('yandex_turbo_attributes');

            if ($data['yandex_turbo_attributes'] === NULL) $data['yandex_turbo_attributes'] = 1;
        }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/feed/yandex_turbo', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/feed/yandex_turbo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {
		$this->load->model('extension/feed/yandex_turbo');

		$this->model_extension_feed_yandex_turbo->install();
	}

	public function uninstall() {
		$this->load->model('extension/feed/yandex_turbo');

		$this->model_extension_feed_yandex_turbo->uninstall();
	}


	public function category() {
		$this->load->language('extension/feed/yandex_turbo');

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_loading'] = $this->language->get('text_loading');
		
		$data['column_category'] = $this->language->get('column_category');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['yandex_turbo_categories'] = array();

		$filter_data = array(
			'start'           => ($page - 1) * 10,
			'limit'           => 10
		);
		
		$this->load->model('extension/feed/yandex_turbo');
	
		$results = $this->model_extension_feed_yandex_turbo->getCategories($filter_data);

		foreach ($results as $result) {
			$data['yandex_turbo_categories'][] = array(
				'category_id'             => $result['category_id'],
				'category'                => $result['category']
			);
		}

		$category_total = $this->model_extension_feed_yandex_turbo->getTotalCategories();

		$pagination = new Pagination();
		$pagination->total = $category_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('extension/feed/yandex_turbo/category', 'token=' . $this->session->data['token'] . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$this->data = $data;
		$this->template = 'extension/feed/yandex_turbo_category.tpl';

		$this->response->setOutput($this->render());


	}

	public function addCategory() {
		$this->load->language('extension/feed/yandex_turbo');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (!empty($this->request->post['category_id'])) {
			$this->load->model('extension/feed/yandex_turbo');

			$this->model_extension_feed_yandex_turbo->addCategory($this->request->post);

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function removeCategory() {
		$this->load->language('extension/feed/yandex_turbo');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$this->load->model('extension/feed/yandex_turbo');

			$this->model_extension_feed_yandex_turbo->deleteCategory($this->request->post['category_id']);

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->getCategories(0, $filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getCategories($parent_id = 0) {
		$category_data = $this->cache->get('category.' . (int)$this->config->get('config_language_id') . '.' . (int)$parent_id);
	
		if (!$category_data) {
			$category_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$category_data[] = array(
					'category_id' => $result['category_id'],
					'name'        => $this->getPath($result['category_id'], $this->config->get('config_language_id')),
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				$category_data = array_merge($category_data, $this->getCategories($result['category_id']));
			}	
	
			$this->cache->set('category.' . (int)$this->config->get('config_language_id') . '.' . (int)$parent_id, $category_data);
		}
		
		return $category_data;
	}

	public function getPath($category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getPath($query->row['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}

}
