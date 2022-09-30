<?php
class ControllerExtensionPaymentPtsStripe extends Controller {
	public function index() {
		if ($this->config->get('pts_stripe_debug')) {
				 $this->log->write('init Purpletre Stripe payment method');
		 }
		
		$this->load->language('extension/payment/pts_stripe');

		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		if ($order_info) {
			$data['business'] = $this->config->get('pp_adaptive_email');
			$data['item_name'] = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

			$data['products'] = array();

			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
						
						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}
				$pts_amount= number_format((float)$product['price'], 2, '.', '')*100;
				$data['stripe_data'][] = array(
					'name'     		=> $product['name'],
					'images'   => [HTTPS_SERVER.'image/'.$product['image']],
					'amount'    => $pts_amount,
					'currency'   => $order_info['currency_code'],
					'quantity' => $product['quantity'],
				);

				$data['products'][] = array(
					'name'     => $product['name'],
					'model'    => $product['model'],
					'price'    => $this->currency->format($product['price'], $order_info['currency_code'], false, false),
					'quantity' => $product['quantity'],
					'option'   => $option_data,
					'weight'   => $product['weight']
				);
			}
		/* 	if(isset($this->session->data['shipping_method'])){
				if($this->session->data['shipping_method']['cost']>0){
			$pts_shipping= number_format((float)$this->session->data['shipping_method']['cost'], 2, '.', '')*100;
			$data['stripe_data'][] = array(
					'name'     		=> 'Shipping',
					'description'   => $this->session->data['shipping_method']['title'],
					'amount'    	=> $pts_shipping,
					'currency'  	=> $order_info['currency_code'],
					'quantity' 		=> $product['quantity'],
				);
				}
			} */
			$data['discount_amount_cart'] = 0;

			$total = $order_info['total'] - $this->cart->getSubTotal();

			if ($total > 0) {
				$pts_shipping= number_format((float)$total, 2, '.', '')*100;
				$data['stripe_data'][] = array(
					'name'      => $this->language->get('text_total'),
					'amount'    => $pts_shipping,
					'currency'  => $order_info['currency_code'],
					'quantity'  => 1,
				);
			} else {
				$data['discount_amount_cart'] -= $total;
			}

			$data['currency_code'] = $order_info['currency_code'];
			$data['first_name'] = $order_info['payment_firstname'];
			$data['last_name'] = $order_info['payment_lastname'];
			$data['address1'] = $order_info['payment_address_1'];
			$data['address2'] = $order_info['payment_address_2'];
			$data['city'] = $order_info['payment_city'];
			$data['zip'] = $order_info['payment_postcode'];
			$data['country'] = $order_info['payment_iso_code_2'];
			$data['email'] = $order_info['email'];
			$data['invoice'] = $this->session->data['order_id'] . ' - ' . $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
			$data['lc'] = $this->session->data['language'];
			$data['return'] = $this->url->link('checkout/success','payment=stripe',true);
			$data['notify_url'] = $this->url->link('extension/payment/pts_stripe/callback', '', true);
			$data['cancel_return'] = $this->url->link('checkout/checkout', '', true);

			if (!$this->config->get('pp_adaptive_transaction')) {
				$data['paymentaction'] = 'authorization';
			} else {
				$data['paymentaction'] = 'sale';
			}

			$data['custom'] = $this->session->data['order_id'];
			// echo "<pre>";
// print_r($data);
// die;
//api
	$data['button_confirm']      = $this->language->get('button_confirm');
	$data['text_loading']      = $this->language->get('text_loading');
	$stripe_status = $this->config->get('pts_stripe_status');
	if($stripe_status){
	$pay_lib_root=DIR_SYSTEM.'library/purpletree_multivendor/stripe_payment/';
	require_once($pay_lib_root.'stripe/stripe-php/init.php');
	require_once($pay_lib_root.'autoload.php');

		$payment_mode = $this->config->get('pts_stripe_payment_mode');
		if ($this->config->get('pts_stripe_debug')) {
				$pmt_mode='Test';
			if($payment_mode){
				$pmt_mode='Live';
			}
			$this->log->write('Payment Mode' .$pmt_mode);
		}
		$stripe = array();
		if($payment_mode){
			$stripe = array(
			  "secret_key"      => $this->config->get('pts_stripe_secret_key_live'),
			  "publishable_key" => $this->config->get('pts_stripe_publish_key_live')
			);
		} else {
			$stripe = array(
			  "secret_key"      => $this->config->get('pts_stripe_secret_key_test'),
			  "publishable_key" => $this->config->get('pts_stripe_publish_key_test')
			);
		}
		if ($this->config->get('pts_stripe_debug')) {
			$this->log->write('Secret Key: ' .$stripe['secret_key']);
			$this->log->write('Publishable Key: ' .$stripe['publishable_key']);
		}
	if(!empty($stripe['secret_key'])){
		try {
		\Stripe\Stripe::setApiKey($stripe['secret_key']);

	$name=$order_info['firstname'].' '.$order_info['lastname'];
	$customer =	\Stripe\Customer::create([
		  'name' => $name,
		  'phone' => $order_info['telephone'],
		  'email' => $order_info['email'],
		  'description' => 'Customer information',
		  'address' => [
		  'line1' => $order_info['payment_address_1'],
		  'line2' => $order_info['payment_address_2'],
		  'city' => $order_info['payment_city'],
		  'state' => $order_info['payment_zone'],
		  'country' => $order_info['payment_country'],
		  'postal_code' => $order_info['payment_postcode'] 
		  ],
		]);

		$session = \Stripe\Checkout\Session::create([
		  'payment_method_types' => ['card'],
		  'line_items' => [$data['stripe_data']],
		  'metadata' => ['order_id' => $this->session->data['order_id']],
		  'success_url' => $this->url->link('extension/payment/pts_stripe/callback', '', true),
		  'cancel_url' => $this->url->link('checkout/checkout'),
		  'customer_email' => $order_info['email'],
		]);
		} 
		catch(Exception $e) {
			if ($this->config->get('pts_stripe_debug')) {
				  $this->log->write('Message:' .$e->getMessage());
			}
		}
	}
	try{	
	$this->session->data['payment_intent']='';
	if(isset($session['payment_intent'])){
	$this->session->data['payment_intent']=$session['payment_intent'];
	if ($this->config->get('pts_stripe_debug')) {
			 $this->log->write('Payment intent:' .$this->session->data['payment_intent']);
		}
	}
	
		$data['session_id']='';
	if(isset($session['id'])){
	$data['session_id']=$session['id'];
		if ($this->config->get('pts_stripe_debug')) {
			 $this->log->write('Session Id:' .$session['id']);
		}
	}
	
	if(!$this->session->data['payment_intent']){
		throw new Exception("Payment intent is not found");
	}
	
	if(!$data['session_id']){
		throw new Exception("Session Id is not found");
	}
	if($payment_mode){
		    $data['secret_key']=$this->config->get('pts_stripe_secret_key_live');
	        $data['publishable_key']=$this->config->get('pts_stripe_publish_key_live');
			}else{
			$data['secret_key']=$this->config->get('pts_stripe_secret_key_test');
	        $data['publishable_key']=$this->config->get('pts_stripe_publish_key_test');
	 }

	} 
	catch(Exception $e){
		if ($this->config->get('pts_stripe_debug')) {
				  $this->log->write('Message:' .$e->getMessage());
		 }
	}
	}
//api
	return $this->load->view('extension/payment/pts_stripe', $data);
		}
	}

	public function callback() {

		if ($this->config->get('pts_stripe_debug')) {
			$this->log->write('Redirect to callback method');
		}
		try{
		$pay_lib_root=DIR_SYSTEM.'library/purpletree_multivendor/stripe_payment/';
		require_once($pay_lib_root.'stripe/stripe-php/init.php');
		require_once($pay_lib_root.'autoload.php');
		} 
		
		catch(Exception $e){
		if ($this->config->get('pts_stripe_debug')) {
				  $this->log->write('Message:' .$e->getMessage());
		 }
		}			

		$payment_mode = $this->config->get('pts_stripe_payment_mode');
		if ($this->config->get('pts_stripe_debug')) {
				$pmt_mode='Test';
			if($payment_mode){
				$pmt_mode='Live';
			}
			$this->log->write('Payment Mode' .$pmt_mode);
		}
		$stripe = array();
		if($payment_mode){
			$stripe = array(
			  "secret_key"      => $this->config->get('pts_stripe_secret_key_live'),
			  "publishable_key" => $this->config->get('pts_stripe_publish_key_live')
			);
		} else {
			$stripe = array(
			  "secret_key"      => $this->config->get('pts_stripe_secret_key_test'),
			  "publishable_key" => $this->config->get('pts_stripe_publish_key_test')
			);
		}
	try{
		\Stripe\Stripe::setApiKey($stripe['secret_key']);
		
		$intent = \Stripe\PaymentIntent::retrieve($this->session->data['payment_intent']);
		$charges = $intent->charges->data;
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$order_id=$this->session->data['order_id'];

		if(!empty($charges)){

			switch($charges[0]['status']) {
					case 'succeeded':
						$order_status_id = $this->config->get('pts_stripe_completed_status_id');
						break;	
				}
				$this->model_checkout_order->addOrderHistory($order_id, $order_status_id);
				if($charges[0]['status']=='succeeded'){
	
				$this->invoiceGenerate($this->session->data['order_id']);

			
		$this->load->model('extension/payment/pts_stripe');
		$comm_data= $this->model_extension_payment_pts_stripe->getCommissionData($this->session->data['order_id']);

		if(!empty($comm_data)){
				if ($this->config->get('pts_stripe_debug')) {
				$this->log->write($comm_data);
			}
			foreach($comm_data as $data){
			$invoice_id = $this->model_extension_payment_pts_stripe->getInvoieId($data['order_id'],$data['seller_id']);	
			
			 $invoiceData = $this->model_extension_payment_pts_stripe->getInvoieData($invoice_id);	

			 $accountId = $this->model_extension_payment_pts_stripe->getStripeAccountID($data['seller_id']);
			 $messageseller='';
			 $pay_amount= number_format((float)$invoiceData['total_pay_amount'], 2, '.', '')*100;
			if ($this->config->get('pts_stripe_debug')) {
				$this->log->write('accountId:' .$accountId);
				$this->log->write('pay_amount:' .$this->session->data['currency'].$pay_amount);
			}
			try {
				$payout = \Stripe\Payout::create([
				  'amount' => $pay_amount,
				  'currency' => $this->session->data['currency'],
				], [
				  'stripe_account' => $accountId,
				]);	 
				}
		catch(Exception $e){
			if ($this->config->get('pts_stripe_debug')) {
				$this->log->write('Message:' .$e->getMessage());
			 }
			$messageseller.=$e->getMessage(); 
		}
				$status = 'Pending';
				$status_id=1;
				$msg='Seller Payment is pending';
				if(isset($payout['status'])){
				 if($payout['status']=='paid'){
					$status_id=2;
					$status='Complete';
					$msg='Seller Payment is Complete';
					} 
				} 
				$payoutId='';
				if(isset($payout['id'])){
					$payoutId=$payout['id'];
				}
				$messageseller.=$msg;
				 $transData=array(
							'invoice_id'		=> $invoice_id,
							'seller_id'			=> $data['seller_id'],
							'transaction_id'	=> $payoutId,
							'amount'			=> $invoiceData['total_pay_amount'],
							'payment_mode'		=> 'Online',
							'status'			=> $status,
							'status_id'			=> $status_id,
							'comment'			=> $messageseller,
							); 
							if ($this->config->get('pts_stripe_debug')) {
				$this->log->write($transData);
			}
				$this->model_extension_payment_pts_stripe->saveTranDetail($transData);
				$this->model_extension_payment_pts_stripe->saveTranHistory($transData); 
			}
				}
				}
				$this->response->redirect($this->url->link('checkout/success'));
			} else {
				$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'));
				$this->response->redirect($this->url->link('checkout/success'));
			}
	} 
	catch(Exception $e){
			if ($this->config->get('pts_stripe_debug')) {
					  $this->log->write('Message:' .$e->getMessage());
			 }
	}
}

public function invoiceGenerate($order_id=''){
		$this->load->model('extension/payment/pts_stripe');
		$comm_data= $this->model_extension_payment_pts_stripe->getCommissionData($order_id);

		if(!empty($comm_data)){
			foreach($comm_data as $commissionData){
				$commisionss[$commissionData['id']]=$commissionData['order_id'];
			}
		}
					try {
					$commisioninvoiceids = array();
					$so_id = array();
					$uniqueSoId=array();
					$total_price =array();
					$total_commission=array();
					if(!empty($commisionss)) {
						foreach ($commisionss as $commisionid => $order_id) {
							$commisionssss = $this->model_extension_payment_pts_stripe->getCommissionsforinvoide($commisionid);
							$so_id[] = array('seller_id'=> $commisionssss['seller_id'],
							'order_id'=> $commisionssss['order_id']
							);
							$total_commission[$commisionssss['seller_id']][]=$commisionssss['commission'];
						}
						$uniqueSoId=array_unique($so_id,SORT_REGULAR);
						foreach($uniqueSoId as $vvvv){
							$total_price[$vvvv['seller_id']][]= $this->model_extension_payment_pts_stripe->getCommissionTotal($vvvv['order_id'],$vvvv['seller_id']);
						}
						
						$t_comm=array();
						if(!empty($total_commission)){
							foreach($total_commission as $vk=>$vv){
								$t_commission=0;
								foreach($vv as $vkk=>$vvv){
									$t_commission+=$vvv;	
								}
								$t_comm[$vk]=$t_commission;	
							}
						}
						
						$t_total=array();
						if(!empty($total_price)){
							foreach($total_price as $vk1=>$vv1){
								$t_tot=0;
								foreach($vv1 as $vkk2=>$vvv2){
									$t_tot+=$vvv2;	
								}
								$t_total[$vk1]=$t_tot;	
							}
							
						}
						if(!empty($t_comm)){
							foreach($t_comm as $seller_idd=>$seller_commm){
								$total_price=$t_total[$seller_idd];
								$total_pay_amount=$total_price-$seller_commm;
								
								$linkid[$seller_idd] = $this->model_extension_payment_pts_stripe->savelinkid($total_price,$seller_commm,$total_pay_amount);
							}
						}
						foreach ($commisionss as $commisionid => $order_id) {
							$commisionsss = $this->model_extension_payment_pts_stripe->getCommissionsforinvoide($commisionid);
							
							if(!empty($commisionsss)) {
								if($commisionsss['order_id'] == $order_id && $commisionsss['invoice_status'] == 0) {
									$linkidd=$linkid[$commisionsss['seller_id']];
									$this->model_extension_payment_pts_stripe->saveCommisionInvoice($commisionsss,$linkidd);

								}
							} 
						}
					}
					} catch (Exception $e) {
					$this->error['warning'] = $e->getMessage();
				}
}

}
?>