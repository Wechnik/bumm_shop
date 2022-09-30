<?php
class ControllerSmartFilterCarMark extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('smart_filter/car_mark');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_mark');

        $this->getList();
    }

    public function add() {
        $this->load->language('smart_filter/car_mark');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_mark');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_smart_filter_car_mark->addCarMark($this->request->post);

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

            $this->response->redirect($this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('smart_filter/car_mark');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_mark');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_smart_filter_car_mark->editCarMark($this->request->get['car_mark_id'], $this->request->post);

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

            $this->response->redirect($this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('smart_filter/car_mark');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('smart_filter/car_mark');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {

            foreach ($this->request->post['selected'] as $car_mark_id) {
                $this->model_smart_filter_car_mark->deleteCarMark($car_mark_id);
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

            $this->response->redirect($this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'car_mark';
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
            'href' => $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('smart_filter/car_mark/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('smart_filter/car_mark/delete', 'token=' . $this->session->data['token'] . $url, true);
        $data['cancel'] = $this->url->link('smart_filter/smart_filter', 'token=' . $this->session->data['token'] . $url, true);
        $data['filters'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $filter_total = $this->model_smart_filter_car_mark->getTotalCarMarks();

        $results = $this->model_smart_filter_car_mark->getCarMarks($filter_data);

        foreach ($results as $result) {
            $data['car_marks'][] = array(
                'id' => $result['id'],
                'car_mark'            => $result['car_mark'],
                'car_sort'      => $result['car_sort'],
                'edit'            => $this->url->link('smart_filter/car_mark/edit', 'token=' . $this->session->data['token'] . '&car_mark_id=' . $result['id'] . $url, true)
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

        $data['car_mark'] = $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . '&sort=car_mark' . $url, true);
        $data['car_sort'] = $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . '&sort=car_sort' . $url, true);

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
        $pagination->url = $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($filter_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($filter_total - $this->config->get('config_limit_admin'))) ? $filter_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $filter_total, ceil($filter_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('smart_filter/car_mark_list', $data));
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
            'href' => $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['car_mark_id'])) {
            $data['action'] = $this->url->link('smart_filter/car_mark/add', 'token=' . $this->session->data['token'] . $url, true);
            $car_mark_id = 0;
        } else {
            $data['action'] = $this->url->link('smart_filter/car_mark/edit', 'token=' . $this->session->data['token'] . '&car_mark_id=' . $this->request->get['car_mark_id'] . $url, true);
            $car_mark_id = $this->request->get['car_mark_id'];
        }

        $data['cancel'] = $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['car_mark_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $car_mark_info = $this->model_smart_filter_car_mark->getCarMark($this->request->get['car_mark_id']);
        }

        $this->load->model('smart_filter/car_model');

        $data['models'] = $this->model_smart_filter_car_model->getCarModels();

        $data['mark_model'] = $this->model_smart_filter_car_mark->getMarkModels($car_mark_id);

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->post['car_mark'])) {
            $data['car_mark'] = $this->request->post['car_mark'];
        } elseif (!empty($car_mark_info)) {
            $data['car_mark'] = $car_mark_info['car_mark'];
        } else {
            $data['car_mark'] = '';
        }

        if (isset($this->request->post['car_sort'])) {
            $data['car_sort'] = $this->request->post['car_sort'];
        } elseif (!empty($car_mark_info)) {
            $data['car_sort'] = $car_mark_info['car_sort'];
        } else {
            $data['car_sort'] = 0;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('smart_filter/car_mark_form', $data));
    }

    protected function validateForm() {

        if (!$this->user->hasPermission('modify', 'smart_filter/car_mark')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['car_mark']) < 1) || (utf8_strlen($this->request->post['car_mark']) > 64)) {
            $this->error['error_name'] = $this->language->get('error_name');
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'smart_filter/car_mark')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

}