<?php

class ControllerExtensionFeedContentWatch extends Controller {
    private $error = array ();

    public function index() {
        $this->load->language('extension/feed/content_watch');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('content_watch',$this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension','token='.$this->session->data['token'].'&type=feed',true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_api_key'] = $this->language->get('text_api_key');
        $data['text_title'] = $this->language->get('text_title');
        $data['text_setting_sizes'] = $this->language->get('text_setting_sizes');
        $data['text_default'] = $this->language->get('text_default');

        $data['entry_google_category'] = $this->language->get('entry_google_category');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['entry_data_feed'] = $this->language->get('entry_data_feed');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['text_test_api'] = $this->language->get('text_test_api');
        $data['text_show_range'] = $this->language->get('text_show_range');
        $data['text_show_button'] = $this->language->get('text_show_button');

        $data['button_import'] = $this->language->get('button_import');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_category_add'] = $this->language->get('button_category_add');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->error['error_api'])) {
            $data['error_api'] = $this->error['error_api'];
        } else {
            $data['error_api'] = '';
        }

        $data['breadcrumbs'] = array ();

        $data['breadcrumbs'][] = array (
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard','token='.$this->session->data['token'],true)
        );

        $data['breadcrumbs'][] = array (
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension','token='.$this->session->data['token'].'&type=feed',true)
        );

        $data['breadcrumbs'][] = array (
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/feed/content_watch','token='.$this->session->data['token'],true)
        );

        $data['action'] = $this->url->link('extension/feed/content_watch','token='.$this->session->data['token'],true);

        $data['cancel'] = $this->url->link('extension/extension','token='.$this->session->data['token'].'&type=feed',true);

        $data['token'] = $this->session->data['token'];

        $data['data_feed'] = HTTP_CATALOG.'index.php?route=extension/feed/content_watch';
        $data['default_range']=array (
            0=>79,
            1=>90
        );

        if (isset($this->request->post['content_watch_api_key'])) {
            $data['content_watch_api_key'] = $this->request->post['content_watch_api_key'];
        } elseif ($this->config->get('content_watch_api_key')) {
            $data['content_watch_api_key'] = $this->config->get('content_watch_api_key');
        } else {
            $data['content_watch_api_key'] = '';
        }

        if (isset($this->request->post['content_watch_show_range'])) {
            $data['content_watch_show_range'] = $this->request->post['content_watch_show_range'];
        } elseif ($this->config->get('content_watch_show_range')) {
            $data['content_watch_show_range'] = $this->config->get('content_watch_show_range');
        } else {
            $data['content_watch_show_range'] = '';
        }

        if (isset($this->request->post['content_watch_range_0'])) {
            $data['content_watch_range_0'] =(int)$this->request->post['content_watch_range_0'];
        } elseif ($this->config->get('content_watch_range_0')) {
            $data['content_watch_range_0'] = (int)$this->config->get('content_watch_range_0');
        } else {
            $data['content_watch_range_0'] =  $data['default_range'][0];
        }

        if (isset($this->request->post['content_watch_range_1'])) {
            $data['content_watch_range_1'] = (int)$this->request->post['content_watch_range_1'];
        } elseif ($this->config->get('content_watch_range_1')) {
            $data['content_watch_range_1'] = (int)$this->config->get('content_watch_range_1');
        } else {
            $data['content_watch_range_1'] =  $data['default_range'][1];
        }

        if (isset($this->request->post['content_watch_test_api'])) {
            $data['content_watch_test_api'] = $this->request->post['content_watch_test_api'];
        } elseif ($this->config->get('content_watch_test_api')) {
            $data['content_watch_test_api'] = $this->config->get('content_watch_test_api');
        } else {
            $data['content_watch_test_api'] = false;
        }

        if (isset($this->request->post['content_watch_show_button'])) {
            $data['content_watch_show_button'] = $this->request->post['content_watch_show_button'];
        } elseif ($this->config->get('content_watch_show_button')) {
            $data['content_watch_show_button'] = $this->config->get('content_watch_show_button');
        } else {
            $data['content_watch_show_button'] = false;
        }


        if (isset($this->request->post['content_watch_status'])) {
            $data['content_watch_status'] = $this->request->post['content_watch_status'];
        } else {
            $data['content_watch_status'] = $this->config->get('content_watch_status');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/feed/content_watch',$data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify','extension/feed/content_watch')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if(!isset($this->request->post['content_watch_api_key']) OR empty($this->request->post['content_watch_api_key']) OR $this->checkKey($this->request->post['content_watch_api_key'])){
            $this->error['error_api']=$this->language->get('error_api');
        }

        return !$this->error;
    }

    public function checkText() {
        if (isset($this->request->post['text'])) {

            $text = $this->request->post['text'];
            if(isset($this->request->post['ignore'])){
                $post_data = array (
                    'key'       => $this->config->get('content_watch_api_key'),
                    'text'      => $text,
                    'ignore'    =>$this->request->post['ignore'],
                    'test'      => $this->config->get('content_watch_test_api')
                );
            }else{
                $post_data = array (
                    'key'  => $this->config->get('content_watch_api_key'),
                    'text' => $text,
                    'test' => $this->config->get('content_watch_test_api')
                );
            }


            $curl = curl_init();
            curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
            curl_setopt($curl,CURLOPT_POST,true);
            curl_setopt($curl,CURLOPT_POSTFIELDS,$post_data);
            curl_setopt($curl,CURLOPT_URL,'https://content-watch.ru/public/api/');
            $return = json_decode(trim(curl_exec($curl)),true);
            curl_close($curl);

            $defaults = array (
                'text'      => '',
                'percent'   => '100.0',
                'highlight' => array (),
                'matches'   => array ()
            );

            if (!isset($return['error'])) {
                $json['error']= 'Ошибка запроса';

            } elseif (!empty($return['error'])) {

                $json['error']= 'Возникла ошибка: '.$return['error'];
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));

            } else {

                $defaults = array (
                    'text'      => '',
                    'percent'   => '100.0',
                    'highlight' => array (),
                    'matches'   => array ()
                );

                $json= array_merge($defaults,$return);
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
            }
        }else{
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode(false));
        }


    }

    public function checkKey($key){
        $post_data = array (
            'action' => 'GET_BALANCE',
            'key'    => $key
        );

        $curl = curl_init();
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_POST,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$post_data);
        curl_setopt($curl,CURLOPT_URL,'https://content-watch.ru/public/api/');
        $json = json_decode(trim(curl_exec($curl)),true);
        curl_close($curl);
        return $json['error'];
    }
    public function getBalance() {
        $post_data = array (
            'action' => 'GET_BALANCE',
            'key'    => $this->config->get('content_watch_api_key')
        );

        $curl = curl_init();
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_POST,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$post_data);
        curl_setopt($curl,CURLOPT_URL,'https://content-watch.ru/public/api/');
        $json = json_decode(trim(curl_exec($curl)),true);
        curl_close($curl);
        if ($json) {
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode(false));
        }

    }


}
