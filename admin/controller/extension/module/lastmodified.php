<?php
class ControllerExtensionModuleLastModified extends Controller {
    private $error = array();

    public function index() {
        //$this->language->load('extension/module/lastmodified');
        $this->load->language('extension/module/lastmodified');
        
        $this->document->setTitle($this->language->get('heading_title'));
       // $this->document->addScript('view/javascript/jquery/ui/i18n/jquery.ui.datepicker-ru.js'); // RU
        
        $this->load->model('setting/setting');
        
        $this->load->model('extension/module');
                 
        $data['heading_title'] = $this->language->get('heading_title'); 
        $data['tab_product'] = $this->language->get('tab_product');
        $data['tab_category'] = $this->language->get('tab_category');
        $data['tab_information'] = $this->language->get('tab_information');
		$data['tab_home'] = $this->language->get('tab_home');   		
        $data['text_select_all'] = $this->language->get('text_select_all'); 
        $data['text_unselect_all'] = $this->language->get('text_unselect_all');   
        $data['text_category'] = $this->language->get('text_category');
		$data['text_product'] = $this->language->get('text_product');   
        $data['text_date_time'] = $this->language->get('text_date_time');
		$data['text_date_time_home'] = $this->language->get('text_date_time_home');
        $data['text_save'] = $this->language->get('text_save');
        $data['text_success'] = $this->language->get('text_success');
        $data['text_informations'] = $this->language->get('text_informations');       
          $data['button_save'] = $this->language->get('button_save');
          $data['text_button_cancel'] = $this->language->get('text_button_cancel'); 
          $data['button_cancel'] = $this->language->get('button_cancel'); 
        $data['entry_date_start'] = $this->language->get('entry_date_start');
        $data['entry_time_start'] = $this->language->get('entry_time_start');
        $data['entry_time_finish'] = $this->language->get('entry_time_finish');
        $data['error_warning'] = $this->language->get('error_warning');
		
		$data['text_edit'] = $this->language->get('text_edit');
  
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		}

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
          );
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
          );  
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('extension/module/lastmodified', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
          );
          
       // $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
  
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
      
        $data['action'] = $this->url->link('extension/module/lastmodified/update', 'token=' . $this->session->data['token'], 'SSL');
        
        $this->load->model('catalog/category');
        $data['categories'] = $this->model_catalog_category->getCategories(0);
		
        $this->load->model('catalog/information');
        $data['informations'] = $this->model_catalog_information->getInformations();	
		
        $this->template = 'extension/module/lastmodified.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
       
$data['header'] = $this->load->controller('common/header');
$data['column_left'] = $this->load->controller('common/column_left');
$data['footer'] = $this->load->controller('common/footer');
		
        //$this->response->setOutput($this->render());
$this->response->setOutput($this->load->view('extension/module/lastmodified.tpl', $data));

    }
    
    public function update() {
        //$this->language->load('extension/module/lastmodified');
         $this->load->language('extension/module/lastmodified');
        $this->document->setTitle($this->language->get('heading_title'));
  
        $this->load->model('extension/module/lastmodified');
  
    if (($this->request->server['REQUEST_METHOD'] == 'POST')&& $this->validate()) {
	
	$this->session->data['success'] = $this->language->get('text_success');
        
  		if (isset($this->request->post['formproduct'])) {
			$this->model_extension_module_lastmodified->formproduct($this->request->post);
      $this->response->redirect($this->url->link('extension/module/lastmodified', 'token=' . $this->session->data['token'], 'SSL'));
		}
		if (isset($this->request->post['formcategory'])) {
			$this->model_extension_module_lastmodified->formcategory($this->request->post);				
			$this->response->redirect($this->url->link('extension/module/lastmodified', 'token=' . $this->session->data['token'], 'SSL'));
		}        
		if (isset($this->request->post['forminfo'])) {
			$this->model_extension_module_lastmodified->forminfo($this->request->post);				
			$this->response->redirect($this->url->link('extension/module/lastmodified', 'token=' . $this->session->data['token'], 'SSL'));
		}
		if (isset($this->request->post['formhome'])) {
			$this->model_extension_module_lastmodified->formhome($this->request->post);				
		//$this->model_module_lastmodified->formhome($this->request->post);				
			$this->response->redirect($this->url->link('extension/module/lastmodified', 'token=' . $this->session->data['token'], 'SSL'));
		}
    }
        $this->index();
        }
        
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/lastmodified')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}
?>