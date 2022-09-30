<?php
class ControllerExtensionModuleCustomTotal extends Controller {
	public function index($setting = array()) {

		// Блок отображается
		if (isset($setting['status']) && (bool)$setting['status'] === true) {

			$this->load->language('extension/module/custom/total');

			$data['heading_total'] = $this->language->get('heading_total');

						$data['totals'] = array();
			
			$result = $this->getTotals();

			foreach ($result['totals'] as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}

			$data['setting'] = $setting;
        $data_query = array();
     $this->load->model('affiliate/affiliate');
        $data['partner'] = '';
    $prod_cats_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $this->session->data['product_id'] . "'")->rows;
      foreach ($prod_cats_id as $prod_cat_id) {
        $aff_centrs_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_centr")->rows;  // print_r($aff_centrs_id); exit;
         foreach ($aff_centrs_id as $aff_centr_id) {
          if (in_array($prod_cat_id['category_id'], explode( ',', $aff_centr_id['category']))) {
               $data['partner'] = '1';
               $data_query[]=array('centr_id' => $aff_centr_id['centr_id']);
         }
        }
        }
      //  $data['city'] = $this->session->data['shipping_address']['city'];
      if (empty($this->session->data['shipping_address']['city'])) $data['city'] = 'Москва'; else $data['city'] = $this->session->data['shipping_address']['city'];  
        $data['affiliate_centr'] = $this->model_affiliate_affiliate->getMaps($data_query,$data['city']);

        $data['affiliate_citys'] = $this->model_affiliate_affiliate->getCity();
        $data['aff_centrs'] = $this->model_affiliate_affiliate->getCityCentrs($data_query,$data['city']);
       return $this->load->view('extension/module/custom/total', $data);

		// Блок отключен
		} else {
   	     return false;
     }

	}

	public function getTotals(){
		
		$this->load->model('extension/extension');

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;
		
		// Because __call can not keep var references so we put them into an array. 			
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);
		
		// Display prices
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					
					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);
		}
		
		return array(
			'total' => $total,
			'totals' => $totals
		);
		
	}

}