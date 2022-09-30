<?php
class ControllerSmartFilterSmartFilter extends Controller {
    private $error = array();

    public function index() {
        $data=$this->load->language('smart_filter/smart_filter');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );
        $data['car_year'] = $this->url->link('smart_filter/car_year', 'token=' . $this->session->data['token'], true);
        $data['car_mark'] = $this->url->link('smart_filter/car_mark', 'token=' . $this->session->data['token'], true);
        $data['car_model'] = $this->url->link('smart_filter/car_model', 'token=' . $this->session->data['token'], true);
        $data['car_generation'] = $this->url->link('smart_filter/car_generation', 'token=' . $this->session->data['token'], true);

        $data['diski_otv'] = $this->url->link('smart_filter/diski_otv', 'token=' . $this->session->data['token'], true);
        $data['diski_diametr'] = $this->url->link('smart_filter/diski_diametr', 'token=' . $this->session->data['token'], true);
        $data['diski_width'] = $this->url->link('smart_filter/diski_width', 'token=' . $this->session->data['token'], true);
        $data['diski_vilet'] = $this->url->link('smart_filter/diski_vilet', 'token=' . $this->session->data['token'], true);
        $data['diski_dia'] = $this->url->link('smart_filter/diski_dia', 'token=' . $this->session->data['token'], true);

        $data['shina_profil'] = $this->url->link('smart_filter/shina_profil', 'token=' . $this->session->data['token'], true);
        $data['shina_diametr'] = $this->url->link('smart_filter/shina_diametr', 'token=' . $this->session->data['token'], true);
        $data['shina_width'] = $this->url->link('smart_filter/shina_width', 'token=' . $this->session->data['token'], true);

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('smart_filter/smart_filter', $data));
    }
    }