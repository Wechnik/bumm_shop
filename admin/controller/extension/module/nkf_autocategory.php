<?php
class ControllerExtensionModuleNkfAutoCategory extends Controller {
    private $error = array();

    public function index() {
        $this->checkTables();

        $this->load->model('extension/module/nkf_autocategory');


        $this->load->language('extension/module/nkf_autocategory');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('nkf_autocategory', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }


        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_use_like'] = $this->language->get('entry_use_like');
        $data['entry_attr_delimiter'] = $this->language->get('entry_attr_delimiter');

        $data['button_run'] = $this->language->get('button_run');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['token'] = $this->session->data['token'];

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
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/nkf_autocategory', 'token=' . $this->session->data['token'] , true)
        );

        $data['action'] = $this->url->link('extension/module/nkf_autocategory', 'token=' . $this->session->data['token'] , true);
        $data['run'] = $this->url->link('extension/module/nkf_autocategory/run', 'token=' . $this->session->data['token'] , true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);


        if (isset($this->request->post['nkf_autocategory_status'])) {
            $data['nkf_autocategory_status'] = $this->request->post['nkf_autocategory_status'];
        } else {
            $data['nkf_autocategory_status'] = $this->config->get('nkf_autocategory_status');
        }

        if (isset($this->request->post['nkf_autocategory_use_like'])) {
            $data['nkf_autocategory_use_like'] = $this->request->post['nkf_autocategory_use_like'];
        } else {
            $data['nkf_autocategory_use_like'] = $this->config->get('nkf_autocategory_use_like');
        }

        if (isset($this->request->post['nkf_autocategory_attr_delimiter'])) {
            $data['nkf_autocategory_attr_delimiter'] = $this->request->post['nkf_autocategory_attr_delimiter'];
        } else {
            $data['nkf_autocategory_attr_delimiter'] = $this->config->get('nkf_autocategory_attr_delimiter');
        }
        if ($data['nkf_autocategory_attr_delimiter']=='')
            $data['nkf_autocategory_attr_delimiter']=',';

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/nkf_autocategory', $data));
    }


    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/nkf_autocategory')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function run() {
        $this->load->model('extension/module/nkf_autocategory');
        $this->load->language('extension/module/nkf_autocategory');
        if (true) {// ($this->validate()) {
            $i=$this->model_extension_module_nkf_autocategory->run();
            $this->session->data['success'] = sprintf($this->language->get('text_success_run'),$i);
        }
        $this->index();
    }




    public function run_ajax() {
        $this->load->model('extension/module/nkf_autocategory');
        $this->load->language('extension/module/nkf_autocategory');
        if ($this->validate() && isset($this->request->get['category_id']) && $this->request->get['category_id']>0) {
            $this->model_extension_module_nkf_autocategory->edit($this->request->get['category_id'], $this->request->post);
            $i=$this->model_extension_module_nkf_autocategory->run($this->request->get['category_id']);
            $json['result'] = sprintf($this->language->get('text_success_run'),$i);
        } else {
            if (!isset($this->request->get['category_id']) || $this->request->get['category_id']==0)
                $json['result']='У вас не достаточно прав!';
            else
                $json['result']='Категория не создана. Сначала сохраните категорию.';
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));



    }


    public function install()
    {
        $this->checkTables();
    }

    private function checkTables() {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "nkf_autocategory` (
            `nkf_autocategory_id` int(11) NOT NULL AUTO_INCREMENT,
            `autocategory_group_id` int(11) NOT NULL,
            `category_id` int(11) NOT NULL,
            `attribute_id` int(11) NOT NULL,
            `attribute_not` int(11) NOT NULL,
            `attribute_use_from_to` int(11) NOT NULL,
            `attribute_value` varchar(255) NOT NULL,
            `attribute_value_from` decimal(15,4) NOT NULL,
            `attribute_value_to` decimal(15,4) NOT NULL,
            `price_from` decimal(15,4),
            `price_to` decimal(15,4),
            `is_special` int(11) NOT NULL,
            `manufacturer_id` int(11) NOT NULL,
            `fcategory_id` int(11) NOT NULL,
            `in_name` varchar(255) NOT NULL,
            PRIMARY KEY (`nkf_autocategory_id`),
            KEY `category_id` (`category_id`)
          ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;");

        $query = $this->db->query("DESC `".DB_PREFIX."nkf_autocategory` attribute_not");
        if (!$query->num_rows) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "nkf_autocategory` ADD `attribute_not` int(11) NOT NULL");
        }
    }

    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "nkf_autocategory`");
    }


    public function manufacturer_autocomplete() {
        $this->load->model('extension/module/nkf_autocategory');

        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->model('catalog/manufacturer');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start'       => 0,
                'limit'       => 5
            );

            $results = $this->model_extension_module_nkf_autocategory->getManufacturers($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'manufacturer_id' => $result['manufacturer_id'],
                    'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
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


}