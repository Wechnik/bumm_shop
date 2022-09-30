<?php
class ControllerCatalogSync1c extends Controller {
	private $error = array();

	public function index() {

		$this->load->language('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/sync_1c');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

            $this->model_catalog_sync_1c->editProducts($this->request->post);

            $url = isset($this->request->get['page']) ? '&page=' . $this->request->get['page'] : '';

                $this->response->redirect($this->url->link('catalog/sync_1c', 'token=' . $this->session->data['token'] . $url, true));

        }


		$this->getList();
	}


	protected function getList() {

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);


		$data['sync_products'] = array();

		$filter_data = array(
			'start'           => ($page - 1) * 20,
			'limit'           => 20
		);

		$product_total = $this->model_catalog_sync_1c->getTotalProducts($filter_data);

		$results = $this->model_catalog_sync_1c->getProducts($filter_data);

		$shop_code_name = [];

		foreach ($results as $result) {

		    $shop_prods = $this->model_catalog_sync_1c->getShopProducts($result['code']);

		    if($shop_prods) {
                foreach ($shop_prods as $shop_prod) {
                    $data['tmp_sync_products'][$result['code']][] = array(
                        '1c_code' => $result['code'],
                        '1c_name'       => $result['name'],
                        'shop_code' => $shop_prod['shop_code'],
                        'shop_name'       => $shop_prod['shop_name'],
                    );

                }
            } else {
                $data['tmp_sync_products'][$result['code']][] = array(
                    '1c_code' => $result['code'],
                    '1c_name'       => $result['name'],
                    'shop_code' => '',
                    'shop_name'       => '',
                );
            }

		}


		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');

		$data['token'] = $this->session->data['token'];


		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = 20;
		$pagination->url = $this->url->link('catalog/sync_1c', 'token=' . $this->session->data['token'] . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * 20) + 1 : 0,
            ((($page - 1) * 20) > ($product_total - 20)) ? $product_total : ((($page - 1) * 20) + 20), $product_total, ceil($product_total / 20));

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/sync_1c', $data));
	}




}
