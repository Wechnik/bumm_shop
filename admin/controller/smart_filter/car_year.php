<?php
class ControllerSmartFilterCarYear extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('smart_filter/car_year');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_year');

        $this->getList();
    }

    public function add() {
        $this->load->language('smart_filter/car_year');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_year');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_smart_filter_car_year->addCarYear($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('smart_filter/car_year');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_year');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_smart_filter_car_year->editCarYear($this->request->get['car_year_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('smart_filter/car_year');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_year');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {

            foreach ($this->request->post['selected'] as $car_year_id) {
                $this->model_smart_filter_car_year->deleteCarYear($car_year_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'car_year';
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

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_smart'),
            'href' => $this->url->link('smart_filter/smart_filter', 'token=' . $this->session->data['token'], true)
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('smart_filter/car_year/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('smart_filter/car_year/delete', 'token=' . $this->session->data['token'] . $url, true);
        $data['cancel'] = $this->url->link('smart_filter/smart_filter', 'token=' . $this->session->data['token'] . $url, true);
        $data['filters'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $filter_total = $this->model_smart_filter_car_year->getTotalCarYears();

        $results = $this->model_smart_filter_car_year->getCarYears($filter_data);

        foreach ($results as $result) {
            $data['car_years'][] = array(
                'id' => $result['id'],
                'car_year'            => $result['car_year'],
                'car_sort'      => $result['car_sort'],
                'edit'            => $this->url->link('smart_filter/car_year/edit', 'token=' . $this->session->data['token'] . '&car_year_id=' . $result['id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['car_year'] = $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . '&sort=car_year' . $url, true);
        $data['car_sort'] = $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . '&sort=car_sort' . $url, true);

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $filter_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($filter_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($filter_total - $this->config->get('config_limit_admin'))) ? $filter_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $filter_total, ceil($filter_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('smart_filter/car_year_list', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['filter_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

        $data['entry_group'] = $this->language->get('entry_group');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_filter_add'] = $this->language->get('button_filter_add');
        $data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['error_name'])) {
            $data['error_name'] = $this->error['error_name'];
        } else {
            $data['error_name'] = array();
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['car_year_id'])) {
            $data['action'] = $this->url->link('smart_filter/car_year/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('smart_filter/car_year/edit', 'token=' . $this->session->data['token'] . '&car_year_id=' . $this->request->get['car_year_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['car_year_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $car_year_info = $this->model_smart_filter_car_year->getCarYear($this->request->get['car_year_id']);
        }

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->post['car_year'])) {
            $data['car_year'] = $this->request->post['car_year'];
        } elseif (!empty($car_year_info)) {
            $data['car_year'] = $car_year_info['car_year'];
        } else {
            $data['car_year'] = '';
        }

        if (isset($this->request->post['car_sort'])) {
            $data['car_sort'] = $this->request->post['car_sort'];
        } elseif (!empty($car_year_info)) {
            $data['car_sort'] = $car_year_info['car_sort'];
        } else {
            $data['car_sort'] = 0;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('smart_filter/car_year_form', $data));
    }

    protected function validateForm() {

        if (!$this->user->hasPermission('modify', 'smart_filter/car_year')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

            if ((utf8_strlen($this->request->post['car_year']) < 1) || (utf8_strlen($this->request->post['car_year']) > 64)) {
                $this->error['error_name'] = $this->language->get('error_name');
            }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'smart_filter/car_year')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

}