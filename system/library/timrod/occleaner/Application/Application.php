<?php

namespace TimRod\Occleaner\Application;

class Application extends \Controller
{
    protected $app_name = '';
    protected $app_name_prefix = 'timrod';
    protected $app_code = '';
    protected $route = '';
    protected $version = '2.1.33';

    protected $scripts = array();
    protected $styles = array();

    protected $menu = array();
    protected $active_menu_item = '';

    protected $global_url_params = array();
    protected $error = array();
    protected $js_data = array();
    protected $lck = '';

    protected $module_settings = array();

    protected $app_settings = array(
        'license' => false,
    );

    public function __construct($registry)
    {
        parent::__construct($registry);        

        $this->configure();
        $this->autoloader();
        $this->afterConfigure();

        $this->setJSData('module_route', $this->route);
        $this->setJSData('token_string', $this->getTokenString());

        $this->lck = $this->config->get('module_' . $this->app_code . '_lck');
    }

    // Configure application
    public function setApplicationName($name)
    {
        $this->app_name = $name;
        $this->app_code = $this->app_name_prefix . '_' . $this->app_name;
        $this->route = 'extension/module/' . $this->app_code;
    }

    protected function setGlobalUrlParams($params = array())
    {
        $this->global_url_params = $params;
    }

    protected function setJSData($key, $value)
    {
        $this->js_data[$key] = $value;
    }

    protected function addScript($href)
    {
        $this->scripts[] = $href;
    }

    protected function addStyle($href)
    {
        $this->styles[] = $href;
    }

    protected function setModuleSettings(array $data = array())
    {
        $this->module_settings = $data;
    }

    protected function setApplicationSettings(array $data = array())
    {
        foreach ($this->app_settings as $key => $value) {
            $this->app_settings[$key] = isset($data[$key]) ? $data[$key] : $value;
        }
    }

    protected function addMenuLink($item)
    {
        $this->menu[] = array(
            'active' => false,
            'type' => 'link',
            'code' => isset($item['code']) ? $item['code'] : '',
            'icon' => isset($item['icon']) ? $item['icon'] : '',
            'title' => isset($item['title']) ? $item['title'] : '',
            'method' => isset($item['method']) ? $item['method'] : ''
        );
    }

    protected function addMenuDivider()
    {
        $this->menu[] = array('type' => 'divider');
    }

    protected function activeMenuItem($code)
    {
        $this->active_menu_item = $code;
    }

    protected function afterConfigure()
    {
    }

    protected function configure()
    {
    }

    protected function saveModuleSettings()
    {
        $this->load->model('setting/setting');

        $module_settings = array();

        foreach ($this->module_settings as $key => $value) {
            if (isset($this->request->post[$key])) {
                $module_settings[$key] = $this->request->post[$key];
            } elseif ($this->config->get($key) !== null) {
                $module_settings[$key] = $this->config->get($key);
            } else {
                $module_settings[$key] = $value;
            }
        }

        $this->model_setting_setting->editSetting('module_' . $this->app_code, $module_settings);
    }

    protected function getModuleSettings()
    {
        $module_settings = array();

        foreach ($this->module_settings as $key => $value) {
            if (isset($this->request->post[$key])) {
                $module_settings[$key] = $this->request->post[$key];
            } elseif ($this->config->get($key) !== null) {
                $module_settings[$key] = $this->config->get($key);
            } else {
                $module_settings[$key] = $value;
            }
        }

        return $module_settings;
    }

    protected function view($template = '', $content_data = array())
    {
        $data['header'] = $this->getHeader();
        $data['menu'] = $this->getMenu();
        $data['footer'] = $this->getFooter();
        $data['js_data'] = $this->js_data;

        if ($this->checkLicenseKey($this->lck)) {
            $data['content'] = $template ? $this->load->view($this->route . '/' . $template, $content_data) : $this->render('content');
        } else {
            $data['content'] = $this->getLicensePage();
        }

        return $this->render('app', $data);
    }

    protected function output($template = '', $content_data = array())
    {
        $this->response->setOutput($this->view($template, $content_data));
    }

    public function index()
    {
        $this->load->language($this->route);

        $this->document->setTitle($this->language->get('heading_title'));

        $js_path = 'view/javascript/' . $this->app_code . '/application';

        $this->document->addScript($js_path . '/jquery-confirm/jquery-confirm.min.js');
        $this->document->addStyle($js_path . '/jquery-confirm/jquery-confirm.min.css');

        $this->document->addScript($js_path . '/noty/noty.min.js');
        $this->document->addStyle($js_path . '/noty/noty.css');
        $this->document->addStyle($js_path . '/noty/metroui.css');

        $this->document->addScript($js_path . '/ionrangeslider/ion.rangeSlider.min.js');
        $this->document->addStyle($js_path . '/ionrangeslider/ion.rangeSlider.min.css');

        $this->document->addScript($js_path . '/clipboard/clipboard.min.js');

        $this->document->addScript($js_path . '/nprogress/nprogress.js');
        $this->document->addStyle($js_path . '/nprogress/nprogress.css');

        $this->document->addScript($js_path . '/data.js');
        $this->document->addScript($js_path . '/node.js');
        $this->document->addScript($js_path . '/event.js');
        $this->document->addScript($js_path . '/plugins.js');
        $this->document->addScript($js_path . '/utils.js');

        $this->document->addStyle($js_path . '/app.css');
        $this->document->addScript($js_path . '/app.js');

        $this->document->addStyle('https://fonts.googleapis.com/icon?family=Material+Icons');

        foreach ($this->styles as $href) {
            $this->document->addStyle($href);
        }

        foreach ($this->scripts as $href) {
            $this->document->addScript($href);
        }

        $data['application'] = $this->view();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('/' . $this->route, $data));
    }

    private function getHeader()
    {
        $this->load->language($this->route);

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_close'] = $this->language->get('text_close');
        $data['close_app'] = $this->url->link('extension/extension', $this->getTokenString() . '&type=module', true);

        return $this->render('header', $data);
    }

    private function getMenu()
    {
        $data['menu'] = array();

        foreach ($this->menu as $item) {

            if ($item['type'] === 'link') {
                $data['menu'][] = array(
                    'type' => 'link',
                    'active' => $item['code'] === $this->active_menu_item,
                    'icon' => $item['icon'],
                    'title' => $item['title'],
                    'link' =>  $this->url->link($this->route . '/' . $item['method'], $this->getTokenString() . $this->getGlobalUrlParams(), true),
                );
            }

            if ($item['type'] === 'divider') {
                $data['menu'][] = array(
                    'type' => 'divider',
                );
            }
        }

        return $this->render('menu', $data);
    }

    private function getFooter()
    {
        $data = array();

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } elseif (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['throw'])) {
            $data['error_throw'] = $this->error['throw'];
        } elseif (isset($this->session->data['throw'])) {
            $data['error_throw'] = $this->session->data['throw'];

            unset($this->session->data['throw']);
        } else {
            $data['error_throw'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        return $this->render('footer', $data);
    }

    private function getLicensePage()
    {
        $data = $this->load->language($this->route);

        $data['activate'] = $this->url->link($this->route . '/activateLicense', $this->getTokenString(), true);
        $data['input_name_lck'] = 'module_' . $this->app_code . '_lck';

        return $this->render('license', $data);
    }

    public function activateLicense()
    {
        $this->load->language($this->route);
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateLicensePage()) {
            $input_name_lck = 'module_' . $this->app_code . '_lck';
            $this->module_settings[$input_name_lck] = $this->request->post[$input_name_lck];
            $this->lck = $this->request->post[$input_name_lck];
            $this->saveModuleSettings();
            $this->session->data['success'] = $this->language->get('text_success_activated');
        }

        foreach ($this->menu as $item) {
            if (isset($item['code']) && $this->active_menu_item === $item['code']) {
                $method = $item['method'];
                $this->$method();
            }
        }
    }

    protected function validateLicensePage()
    {
        if (!$this->user->hasPermission('modify', $this->route)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->checkLicenseKey($this->request->post['module_' . $this->app_code . '_lck'])) {
            $this->error['warning'] = $this->language->get('error_lck');
        }

        return !$this->error;
    }

    protected function getUrlParams($params = array())
    {
        $url = '';

        foreach ($params as $param) {
            if (isset($this->request->get[$param])) {
                $url .= '&' . $param . '=' . $this->request->get[$param];
            }
        }

        return $url;
    }

    protected function getGlobalUrlParams($params = array())
    {
        return $this->getUrlParams($this->global_url_params);
    }

    protected function getTokenString()
    {
        return VERSION < '3.0.0.0' ? 'token=' . $this->session->data['token'] : 'user_token=' . $this->session->data['user_token'];
    }

    private function render($template, $data = array())
    {
        $file = DIR_SYSTEM . 'library/timrod/' . $this->app_name . '/Application/template/' . $template . '.tpl';

        if (is_file($file)) {
            extract($data);

            ob_start();

            require($file);

            return ob_get_clean();
        }

        throw new \Exception('Error: Could not load template ' . $file . '!');
        exit();
    }

    protected function checkLicenseKey($k)
    {
        $host = str_replace('www.', '', $this->request->server['HTTP_HOST']);
        $pref = array('timrod', $this->app_name);
        $valid = array('ca956c43c9ca6b2ea5aa8b70bb060943');

        foreach ($pref as $p) {
            $valid[] = md5($p . '_' . $host);
        }

        return $this->app_settings['license'] ? in_array($k, $valid) : true;
    }

    public function install()
    {
        if (count($this->module_settings)) {
            $this->saveModuleSettings();
        }
    }

    private function autoloader()
    {
        $dirLibrary = DIR_SYSTEM . 'library/' . $this->app_name_prefix . '/' . $this->app_name;

        $autoloaders = array(
            $dirLibrary . '/vendor/autoload.php',
            $dirLibrary . '/autoload.php',
        );

        foreach ($autoloaders as $file) {
            if (file_exists($file)) {                
                include_once($file);
            }
        }
    }
}
