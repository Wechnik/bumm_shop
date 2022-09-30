<?php 
class ControllerExtensionTotalPrepaymentDetailed extends Controller {
	private $error = array(); 
	 
	public function index() { 
		$this->load->language('extension/total/prepayment_detailed');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('prepayment_detailed', $this->request->post);
		
			$this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_hint'] = $this->language->get('text_hint');
		$data['text_module_help'] = $this->language->get('text_module_help');
		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_condition'] = $this->language->get('entry_condition');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$data['entry_turn_on_prepayment_when'] = $this->language->get('entry_turn_on_prepayment_when');
		$data['entry_turn_on_prepayment_for_shipping'] = $this->language->get('entry_turn_on_prepayment_for_shipping');
		$data['entry_turn_on_prepayment_for_payment_method'] = $this->language->get('entry_turn_on_prepayment_for_payment_method');
		$data['entry_for_total_items_price'] = $this->language->get('entry_for_total_items_price');
		$data['entry_count_as'] = $this->language->get('entry_count_as');
		$data['entry_prepayment_comment'] = $this->language->get('entry_prepayment_comment');
		
		$data['entry_from'] = $this->language->get('entry_from');
		$data['entry_to'] = $this->language->get('entry_to');
		$data['entry_prepayment_amount_fixed_selection'] = $this->language->get('entry_prepayment_amount_fixed_selection');
		$data['entry_prepayment_by_shipping'] = $this->language->get('entry_prepayment_by_shipping');
		$data['entry_prepayment_by_total_price'] = $this->language->get('entry_prepayment_by_total_price');
		
		$data['entry_prepayment_percent_part'] = $this->language->get('entry_prepayment_percent_part');
		$data['entry_prepayment_percent_part_shipping'] = $this->language->get('entry_prepayment_percent_part_shipping');
		$data['entry_prepayment_percent_part_total_price'] = $this->language->get('entry_prepayment_percent_part_total_price');
		$data['entry_confirm_remove_filter'] = $this->language->get('entry_confirm_remove_filter');
		
		$data['entry_shipping_validation_tip'] = $this->language->get('entry_shipping_validation_tip');
		$data['entry_payment_method_validation_tip'] = $this->language->get('entry_payment_method_validation_tip');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_filter'] = $this->language->get('button_add_filter');
		$data['button_remove'] = $this->language->get('button_remove');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

   		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_total'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true)
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/total/prepayment_detailed', 'token=' . $this->session->data['token'], true)
   		);

        $data['action'] = $this->url->link('extension/total/prepayment_detailed', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true);

		
		$data['filters'] = array();
		
		if (isset($this->request->post['prepayment_detailed_filter'])) {
			$data['filters'] = $this->request->post['prepayment_detailed_filter'];
		} elseif ($this->config->get('prepayment_detailed_filter')) { 
			$data['filters'] = $this->config->get('prepayment_detailed_filter');
		}	
		
		$data['totals'] = $this->getTotalExtensions();

        $data['prepayment_detailed_sort_order'] = $this->processModuleSetting("prepayment_detailed_sort_order");
        $data['prepayment_detailed_status'] = $this->processModuleSetting("prepayment_detailed_status");

		
// installed shipping methods
		$this->load->model('extension/extension');
		$shippings = $this->model_extension_extension->getInstalled('shipping');
		$shippings_files = glob(DIR_APPLICATION . 'controller/extension/shipping/*.php');
		
		if ($shippings_files) {
			foreach ($shippings_files as $file) {
				$shipping = basename($file, '.php');
				$this->load->language('extension/shipping/' . $shipping);
				if (in_array($shipping, $shippings)) {
					$data['shippings'][] = array(
						'hname' => $this->language->get('heading_title'),
						'fname' => $shipping
					);
					$data['shipping_codes'][] = $shipping;
				}
			}
		}
//

// installed payment methods
		$this->load->model('extension/extension');
		$payment_methods = $this->model_extension_extension->getInstalled('payment');
		$payment_methods_files = glob(DIR_APPLICATION . 'controller/extension/payment/*.php');

		if ($payment_methods_files) {
			foreach ($payment_methods_files as $file) {
				$payment_method = basename($file, '.php');

                $this->load->language('extension/payment/' . $payment_method);

				if (in_array($payment_method, $payment_methods)) {
					$data['payment_methods'][] = array(
						'hname' => $this->language->get('heading_title'),
						'fname' => $payment_method
					);

					$data['payment_method_codes'][] = $payment_method;
				}
			}
		}
//


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/total/prepayment_detailed', $data));
	}
	
	private function processModuleSetting($settingName) {
		if (isset($this->request->post[$settingName])) {
			$data[$settingName] = $this->request->post[$settingName];
		} else {
			$data[$settingName] = $this->config->get($settingName);
		}

        return $data[$settingName];

	}
	
	private function validate() {
        if (!$this->user->hasPermission('modify', 'extension/total/prepayment_detailed')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	private function getTotalExtensions() {
		$this->load->model('extension/extension');
		
		$extensions = $this->model_extension_extension->getInstalled('total');
		
		foreach ($extensions as $key => $value) {
			if (!file_exists(DIR_APPLICATION . 'controller/extension/total/' . $value . '.php')) {
				$this->model_setting_extension->uninstall('total', $value);
				
				unset($extensions[$key]);
			}
		}
		
		$totals = array();
				
		$files = glob(DIR_APPLICATION . 'controller/extension/total/*.php');

		if ($files) {
			foreach ($files as $file) {
				$extension = basename($file, '.php');
				
				$this->language->load('extension/total/' . $extension);

				if ($this->config->get($extension . '_status') && $extension != "prepayment_detailed") {
					$totals[] = array(
						'name' => $this->language->get('heading_title'),
						'code' => $extension
					);
				}
			}
		}
			
		return $totals;
	}
}
?>