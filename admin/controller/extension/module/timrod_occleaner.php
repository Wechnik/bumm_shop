<?php

include_once(DIR_SYSTEM . 'library/timrod/occleaner/Application/Application.php');

use Timrod\Occleaner\Application\Application;
use Timrod\Occleaner\Analyzer;
use Timrod\Occleaner\TaskStorage;
use Timrod\Occleaner\Utils;

class ControllerExtensionModuleTimRodOccleaner extends Application
{
    public function configure()
    {
        $this->setApplicationName('occleaner');

        $this->setApplicationSettings([
            'license' => true,
        ]);

        $this->setModuleSettings([
            'module_timrod_occleaner_status' => 1,
            'module_timrod_occleaner_lck' => '',
            'module_timrod_occleaner_welcome_dialog_status' => 1,
            'module_timrod_occleaner_toolbar_status' => 1,
            'module_timrod_occleaner_performance_request' => 50,
            'module_timrod_occleaner_performance_database' => 50,
            'module_timrod_occleaner_performance_data' => 50,
            'module_timrod_occleaner_performance_filesystem' => 50,
            'module_timrod_occleaner_performance_exclude' => '',
            'module_timrod_occleaner_security_redirect' => 'home',
            'module_timrod_occleaner_protect_url_status' => 0,
            'module_timrod_occleaner_protect_url_key' => 'key',
            'module_timrod_occleaner_protect_url_value' => 'value',
            'module_timrod_occleaner_grecaptchav2_status' => 0,
            'module_timrod_occleaner_grecaptchav2_key' => '',
            'module_timrod_occleaner_grecaptchav2_secret' => '',
            'module_timrod_occleaner_ip_blocking_status' => 0,
            'module_timrod_occleaner_ip_blocking_white_list' => [],
            'module_timrod_occleaner_debug_mode' => 0,
        ]);

        $this->addStyle('view/stylesheet/timrod_occleaner/timrod_occleaner.css');
        $this->addScript('view/javascript/timrod_occleaner/timrod_occleaner.js');

        $this->setGlobalUrlParams([]);

        $this->load->language($this->route);

        $this->addMenuLink([
            'code' => 'page_system_junk',
            'icon' => 'folder',
            'title' => $this->language->get('menu_system_junk'),
            'method' => 'getPageSystemJunk'
        ]);

        $this->addMenuLink([
            'code' => 'page_images_junk',
            'icon' => 'image',
            'title' => $this->language->get('menu_images_junk'),
            'method' => 'getPageImagesJunk'
        ]);

        $this->addMenuLink([
            'code' => 'page_filesystem_junk',
            'icon' => 'snippet_folder',
            'title' => $this->language->get('menu_filesystem_junk'),
            'method' => 'getPageFilesystemJunk'
        ]);

        $this->addMenuLink([
            'code' => 'page_database_junk',
            'icon' => 'list_alt',
            'title' => $this->language->get('menu_database_junk'),
            'method' => 'getPageDatabaseJunk'
        ]);

        $this->addMenuLink([
            'code' => 'page_module_data',
            'icon' => 'extension',
            'title' => $this->language->get('menu_module_data'),
            'method' => 'getPageModuleData'
        ]);

        $this->addMenuDivider();

        $this->addMenuLink([
            'code' => 'page_settings',
            'icon' => 'settings_applications',
            'title' => $this->language->get('menu_settings'),
            'method' => 'getPageSettings'
        ]);

        $this->addMenuLink([
            'code' => 'page_security',
            'icon' => 'security',
            'title' => $this->language->get('menu_security'),
            'method' => 'getPageSecurity'
        ]);

        $this->addMenuLink([
            'code' => 'page_module_info',
            'icon' => 'info',
            'title' => $this->language->get('menu_module_info'),
            'method' => 'getPageModuleInfo'
        ]);

        $this->activeMenuItem('page_system_junk');

        $http = ($this->request->server['HTTPS']) ? 'https://' : 'http://';
        $this->setJSData('http_host', $http . $this->request->server['HTTP_HOST']);
        $this->setJSData('text_welcome_dialog_title', $this->language->get('text_welcome_dialog_title'));
        $this->setJSData('text_welcome_dialog_ok', $this->language->get('text_welcome_dialog_ok'));
        $this->setJSData('text_welcome_dialog_content', $this->language->get('text_welcome_dialog_content'));
        $this->setJSData('module_timrod_occleaner_welcome_dialog_status', $this->config->get('module_timrod_occleaner_welcome_dialog_status'));
    }

    public function afterConfigure()
    {
        $this->analyzer = new Analyzer($this->registry);
    }

    public function getPageSystemJunk()
    {
        $options = array(
            'task' => 'system_cache',
            'menu_item' => 'page_system_junk',
            'method' => 'getPageSystemJunk',
        );

        $this->getPageItemList($options);
    }

    public function getPageImagesJunk()
    {
        $options = array(
            'task' => 'unused_images',
            'menu_item' => 'page_images_junk',
            'method' => 'getPageImagesJunk',
        );

        $this->getPageItemList($options);
    }

    public function getPageFilesystemJunk()
    {
        $options = array(
            'task' => 'empty_folders',
            'menu_item' => 'page_filesystem_junk',
            'method' => 'getPageFilesystemJunk',
        );

        $this->getPageItemList($options);
    }

    public function getPageDatabaseJunk()
    {
        $options = array(
            'task' => 'unused_options',
            'menu_item' => 'page_database_junk',
            'method' => 'getPageDatabaseJunk',
        );

        $this->getPageItemList($options);
    }

    private function getPageItemList($options = array())
    {
        $method = $options['method'];
        $menu_item = $options['menu_item'];

        $data = array();

        if (VERSION < '3.0.0.0') {
            $data = $this->load->language($this->route);
        } else {
            $this->load->language($this->route);
        }

        if (isset($this->request->get['task'])) {
            $task = $this->request->get['task'];
        } else {
            $task = $options['task'];
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'id';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['search'])) {
            $search = $this->request->get['search'];
        } else {
            $search = '';
        }

        if (isset($this->request->get['list_type'])) {
            $list_type = $this->request->get['list_type'];
        } else {
            $list_type = 'default';
        }

        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = '20';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $task_category = Utils::getTaskCategory($task);

        $data['task'] = $task;

        // Get data
        $filter_data = array(
            'search' => $search,
            'list_type' => $list_type,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $limit,
            'limit' => $limit,
        );

        $taskStorage = new TaskStorage($task, $this->registry);
        $taskStorage->filter($filter_data);

        $total_info = $taskStorage->getTotal();
        $item_list_info = $taskStorage->getList();

        // Pagination
        $total = $total_info['count'];

        $url = $this->getUrlParams(['sort', 'order', 'search', 'list_type', 'limit', 'task']);
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link($this->route . '/' . $method, $this->getTokenString() . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf(
            $this->language->get('text_pagination'),
            ($total) ? (($page - 1) * $limit) + 1 : 0,
            ((($page - 1) * $limit) > ($total - $limit)) ? $total : ((($page - 1) * $limit) + $limit),
            $total,
            ceil($total / $limit)
        );

        // Header
        $data['header_buttons'] = [];

        switch ($task_category) {
            case 'system_junk':
            case 'filesystem_junk':
                $data['header_buttons'] = ['btn_scan', 'btn_ignore', 'btn_delete', 'btn_delete_all'];
                break;
            case 'images_junk':
                $data['header_buttons'] = ['btn_select_all', 'btn_scan', 'btn_ignore', 'btn_delete', 'btn_delete_all'];
                break;
            case 'database_junk':
                if ($task === 'expired_sessions') {
                    $data['header_buttons'] = ['btn_delete', 'btn_delete_all'];
                } else {
                    $data['header_buttons'] = ['btn_scan', 'btn_ignore', 'btn_delete', 'btn_delete_all'];
                }
                break;
        }

        if ($list_type === 'ignore') {
            if ($task_category === 'images_junk') {
                $data['header_buttons'] = ['btn_select_all', 'btn_notignore'];
            } else {
                $data['header_buttons'] = ['btn_notignore'];
            }
        }

        $data['page_title'] = $this->language->get('page_' . $task);

        $url = $this->getUrlParams(['page', 'sort', 'order', 'search', 'list_type', 'limit', 'task']);
        $data['delete'] = $this->url->link($this->route . '/delete', $this->getTokenString() . $url, true);
        $data['ignore'] = $this->url->link($this->route . '/ignore', $this->getTokenString() . $url, true);
        $data['notignore'] = $this->url->link($this->route . '/notIgnore', $this->getTokenString() . $url, true);

        $data['task_list_header'] = $this->load->view($this->route . '/page_task_list_header', $data);

        // Toolbar
        $data['task_list'] = Utils::getTaskListByCategory($task_category);
        $data['list_type'] = $list_type;
        $data['last_scan'] = $taskStorage->getLastScan();
        $data['search'] = $search;
        $data['limit'] = $limit;

        $total_count = $total_info['count'];
        $total_size = isset($total_info['size']) ? $total_info['size'] : 0;

        switch ($task_category) {
            case 'system_junk':
            case 'filesystem_junk':
            case 'images_junk':
                $data['total_info'] = sprintf('%s: %s', $this->language->get('text_total_size'), $total_size);
                break;
            case 'database_junk':
                $data['total_info'] = sprintf('%s: %s', $this->language->get('text_total_count'), $total_count);
                break;
        }

        $data['tb_disabled'] = [];

        if ($task === 'expired_sessions') {
            $data['tb_disabled'] = ['list_type', 'search'];
        }

        $data['task_list_toolbar'] = $this->load->view($this->route . '/page_task_list_toolbar', $data);

        // Item List
        $data['list'] = $item_list_info['list'];

        $url = $this->getUrlParams(['page', 'search', 'list_type', 'limit', 'task']);

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_reset'] = $this->url->link($this->route . '/' . $method, $this->getTokenString() . '&sort=id&order=ASC' . $url, true);
        $data['sort_filename'] = $this->url->link($this->route . '/' . $method, $this->getTokenString() . '&sort=filename' . $url, true);
        $data['sort_item_id'] = $this->url->link($this->route . '/' . $method, $this->getTokenString() . '&sort=item_id' . $url, true);
        $data['sort_name'] = $this->url->link($this->route . '/' . $method, $this->getTokenString() . '&sort=name' . $url, true);
        $data['sort_size'] = $this->url->link($this->route . '/' . $method, $this->getTokenString() . '&sort=size' . $url, true);

        $data['sort'] = $sort;
        $data['order'] = $order;

        $list_template = '';

        switch ($task_category) {
            case 'system_junk':
            case 'filesystem_junk':
                $list_template = 'page_task_list_item_table_files';
                break;
            case 'images_junk':
                $list_template = 'page_task_list_item_grid_images';
                break;
            case 'database_junk':
                if ($task === 'expired_sessions') {
                    $list_template = 'page_task_list_item_table_db_2';
                } else {
                    $list_template = 'page_task_list_item_table_db_1';
                }
                break;
        }

        $data['item_list'] = $this->load->view($this->route . '/' . $list_template, $data);

        $this->activeMenuItem($menu_item);
        $this->output('page_task_list', $data);
    }

    public function getPageModuleData()
    {
        $data = array();

        if (VERSION < '3.0.0.0') {
            $data = $this->load->language($this->route);
        } else {
            $this->load->language($this->route);
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $task = 'module_data';

        $result = $this->analyzer->scan($task);

        $data['list'] = array();

        foreach (Utils::getTaskListByCategory($task) as $type) {
            $data['list'][] = array(
                'type' => $type,
                'title' => $this->language->get('text_md_data_' . $type),
                'db' => isset($result[$type]['db']) ? $result[$type]['db'] : 0,
                'files' => isset($result[$type]['files']) ? $result[$type]['files'] : 0,
                'size' => isset($result[$type]['size']) ? $result[$type]['size'] : 0,
            );
        }

        $data['task'] = $task;
        $data['delete'] = $this->url->link($this->route . '/delete', $this->getTokenString(), true);

        $this->activeMenuItem('page_module_data');
        $this->output('page_module_data', $data);
    }

    public function getPageSettings()
    {
        $data = array();

        if (VERSION < '3.0.0.0') {
            $data = $this->load->language($this->route);
        } else {
            $this->load->language($this->route);
        }

        $data = array_merge($data, $this->getModuleSettings());

        $url = $this->getUrlParams();

        $data['action'] = $this->url->link($this->route . '/saveSettings', $this->getTokenString() . $url, true);

        $this->activeMenuItem('page_settings');
        $this->output('page_settings', $data);
    }

    public function getPageSecurity()
    {
        $data = array();

        if (VERSION < '3.0.0.0') {
            $data = $this->load->language($this->route);
        } else {
            $this->load->language($this->route);
        }

        $data = array_merge($data, $this->getModuleSettings());

        $url = $this->getUrlParams();

        $errors = array(
            'protect_url_key',
            'protect_url_value',
            'grecaptchav2_key',
            'grecaptchav2_secret',
            'ip_blocking_white_list',
        );

        foreach ($errors as $name) {
            if (isset($this->error[$name])) {
                $data['error_' . $name] = $this->error[$name];
            } else {
                $data['error_' . $name] = '';
            }
        }

        $data['action'] = $this->url->link($this->route . '/saveSecurity', $this->getTokenString() . $url, true);
        $data['your_current_ip'] = Utils::getClientIp();

        $http = ($this->request->server['HTTPS']) ? 'https://' : 'http://';
        $protect_url_key = $data['module_timrod_occleaner_protect_url_key'];
        $protect_url_value = $data['module_timrod_occleaner_protect_url_value'];
        $data['secure_link'] = $http . $this->request->server['HTTP_HOST'] . '/admin/?' . $protect_url_key . '=' . $protect_url_value;

        $remember_hash = md5('trusted_' . $this->request->server['HTTP_USER_AGENT']);
        $data['trusted_browser'] = isset($this->request->cookie['timrod_occleaner_trusted_browser']) && $this->request->cookie['timrod_occleaner_trusted_browser'] === $remember_hash;

        $this->activeMenuItem('page_security');
        $this->output('page_security', $data);
    }

    public function saveSettings()
    {
        $this->load->language($this->route);

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePageSettings()) {
            $this->saveModuleSettings();
            $this->session->data['success'] = $this->language->get('text_success_settings_saved');
        }

        $this->getPageSettings();
    }

    public function saveSecurity()
    {
        $this->load->language($this->route);

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePageSecurity()) {
            $this->saveModuleSettings();
            $this->session->data['success'] = $this->language->get('text_success_settings_saved');
        }

        $this->getPageSecurity();
    }

    public function getPageModuleInfo()
    {
        $data = array();

        if (VERSION < '3.0.0.0') {
            $data = $this->load->language($this->route);
        } else {
            $this->load->language($this->route);
        }

        $data['version'] = $this->version;
        $data['oc_version'] = VERSION;
        $data['php_version'] = phpversion();

        $this->activeMenuItem('page_module_info');
        $this->output('page_module_info', $data);
    }

    protected function validatePageSettings()
    {
        if (!$this->user->hasPermission('modify', $this->route)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->checkLicenseKey($this->request->post['module_timrod_occleaner_lck'])) {
            $this->error['warning'] = $this->language->get('error_lck');
        }

        return !$this->error;
    }

    protected function validatePageSecurity()
    {
        if (!$this->user->hasPermission('modify', $this->route)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ($this->request->post['module_timrod_occleaner_protect_url_status']) {
            if (!preg_match('/^[a-zA-Z0-9_]+$/', $this->request->post['module_timrod_occleaner_protect_url_key'])) {
                $this->error['protect_url_key'] = $this->language->get('error_input_name_1');
                $this->error['warning'] = $this->language->get('error_form');
            }

            if (!preg_match('/^[a-zA-Z0-9_]+$/', $this->request->post['module_timrod_occleaner_protect_url_value'])) {
                $this->error['protect_url_value'] = $this->language->get('error_input_name_1');
                $this->error['warning'] = $this->language->get('error_form');
            }
        }

        if ($this->request->post['module_timrod_occleaner_grecaptchav2_status']) {
            if (utf8_strlen($this->request->post['module_timrod_occleaner_grecaptchav2_key']) < 1) {
                $this->error['grecaptchav2_key'] = $this->language->get('error_input_empty');
                $this->error['warning'] = $this->language->get('error_form');
            }

            if (utf8_strlen($this->request->post['module_timrod_occleaner_grecaptchav2_secret']) < 1) {
                $this->error['grecaptchav2_secret'] = $this->language->get('error_input_empty');
                $this->error['warning'] = $this->language->get('error_form');
            }
        }

        if ($this->request->post['module_timrod_occleaner_ip_blocking_status']) {
            if (count($this->request->post['module_timrod_occleaner_ip_blocking_white_list']) < 2) {
                $this->error['ip_blocking_white_list'] = $this->language->get('error_list_empty');
                $this->error['warning'] = $this->language->get('error_form');
            }
        }

        return !$this->error;
    }

    public function delete()
    {
        $selected = isset($this->request->post['selected']) ? $this->request->post['selected'] : false;
        $task = isset($this->request->post['task']) ? $this->request->post['task'] : false;

        if ($selected && $this->hasPermission()) {
            try {
                $result = $this->analyzer->delete($task, $selected);

                if ($result === 'done') {
                    $this->session->data['success'] = $this->language->get('text_success_data_deleted');
                } elseif ($result) {
                    $this->session->data['success'] = $this->language->get('text_success_cleared') . $result;
                }
            } catch (Throwable $e) {
                $this->error['warning'] = $this->language->get('error_throw_message');
                $this->error['throw'] = $e->getMessage();
            }
        }

        $this->redirect($task);
    }

    public function ignore()
    {
        $selected = isset($this->request->post['selected']) ? $this->request->post['selected'] : false;
        $task = isset($this->request->post['task']) ? $this->request->post['task'] : false;

        if ($selected && $this->hasPermission()) {
            try {
                if ($result = $this->analyzer->ignore($task, $selected)) {
                    $this->session->data['success'] = $this->language->get('text_success_ignore') . $result;
                }
            } catch (Throwable $e) {
                $this->error['warning'] = $this->language->get('error_throw_message');
                $this->error['throw'] = $e->getMessage();
            }
        }

        $this->redirect($task);
    }

    public function notIgnore()
    {
        $selected = isset($this->request->post['selected']) ? $this->request->post['selected'] : false;
        $task = isset($this->request->post['task']) ? $this->request->post['task'] : false;

        if ($selected && $this->hasPermission()) {
            try {
                if ($result = $this->analyzer->notIgnore($task, $selected)) {
                    $this->session->data['success'] = $this->language->get('text_success_not_ignore') . $result;
                }
            } catch (Throwable $e) {
                $this->error['warning'] = $this->language->get('error_throw_message');
                $this->error['throw'] = $e->getMessage();
            }
        }

        $this->redirect($task);
    }

    protected function hasPermission()
    {
        if (!$this->user->hasPermission('modify', $this->route)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function redirect($task)
    {
        if (Utils::getTaskCategory($task) === 'system_junk') {
            $this->getPageSystemJunk();
        }

        if (Utils::getTaskCategory($task) === 'images_junk') {
            $this->getPageImagesJunk();
        }

        if (Utils::getTaskCategory($task) === 'filesystem_junk') {
            $this->getPageFilesystemJunk();
        }

        if (Utils::getTaskCategory($task) === 'database_junk') {
            $this->getPageDatabaseJunk();
        }

        if ($task === 'module_data') {
            $this->getPageModuleData();
        }
    }

    public function scanning()
    {
        $json = array('return' => '');

        try {
            $task = isset($this->request->get['task']) ? $this->request->get['task'] : '';
            $json = $this->analyzer->scan($task);
        } catch (Throwable $e) {
            $json['status'] = 'error';
            $json['error_message'] = $e->getMessage();
            $this->session->data['error'] = $this->language->get('error_throw_message');
            $this->session->data['throw'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function rememberBrowser()
    {
        $json = array();

        try {
            if ($this->user->hasPermission('modify', $this->route)) {
                $remember_hash = md5('trusted_' . $this->request->server['HTTP_USER_AGENT']);
                $trusted = isset($this->request->cookie['timrod_occleaner_trusted_browser']) && $this->request->cookie['timrod_occleaner_trusted_browser'] === $remember_hash;

                if ($trusted) {
                    setcookie('timrod_occleaner_trusted_browser', '', 2147483647);
                } else {
                    setcookie('timrod_occleaner_trusted_browser', $remember_hash, 2147483647);
                }
                $json['status'] = 'done';
            } else {
                $json['status'] = 'error';
                $this->session->data['error'] = $this->language->get('error_permission');
            }
        } catch (Throwable $e) {
            $json['status'] = 'error';
            $this->session->data['error'] = $this->language->get('error_throw_message');
            $this->session->data['throw'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function hideWelcomeDialog()
    {
        $json = array();

        try {
            if ($this->user->hasPermission('modify', $this->route)) {
                $this->config->set('module_timrod_occleaner_welcome_dialog_status', 0);
                $this->saveModuleSettings();
            }
            $json['status'] = 'done';
        } catch (Throwable $e) {
            $json['status'] = 'error';
            $this->session->data['error'] = $this->language->get('error_throw_message');
            $this->session->data['throw'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function deleteAll()
    {
        $json = array('return' => '');

        try {
            if ($this->hasPermission()) {
                $task = isset($this->request->get['task']) ? $this->request->get['task'] : '';

                $json = $this->analyzer->deleteAll($task);

                if ($json['status'] === 'done') {
                    $size = $json['size'] ? ': ' . $json['size'] : '';
                    $this->session->data['success'] = $this->language->get('text_success_cleared') . $size;
                }
            } else {
                $json['status'] = 'error';
                $this->session->data['error'] = $this->language->get('error_permission');
            }
        } catch (Throwable $e) {
            $json['status'] = 'error';
            $this->session->data['error'] = $this->language->get('error_throw_message');
            $this->session->data['throw'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function getToolbar()
    {
        $data = array();

        if (VERSION < '3.0.0.0') {
            $data = $this->load->language($this->route);
            $data['refresh_modifications'] = $this->url->link('extension/modification/refresh', $this->getTokenString(), true);
        } else {
            $this->load->language($this->route);
            $data['refresh_modifications'] = $this->url->link('marketplace/modification/refresh', $this->getTokenString(), true);
        }

        $data['goto_occleaner'] = $this->url->link($this->route, $this->getTokenString(), true);
        $data['version'] = $this->version;

        if ($this->checkLicenseKey($this->lck)) {
            $this->response->setOutput($this->load->view($this->route . '/toolbar', $data));
        } else {
            $this->response->setOutput(sprintf('<li><a>%s</a></li>', $this->language->get('error_activation')));
        }
    }

    public function install()
    {
        parent::install();

        $installer = new Timrod\Occleaner\Installer\Installer($this->registry);
        $installer->install();
    }

    public function uninstall()
    {
        $installer = new Timrod\Occleaner\Installer\Installer($this->registry);
        $installer->uninstall();
    }
}

// Controller - End