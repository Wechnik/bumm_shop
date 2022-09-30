<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header"> 
		<div class="container-fluid">
			<div class="pull-right">
			<a href="<?php echo $print_commission_invoice; ?>" data-toggle="tooltip" title="<?php echo $button_print; ?>" class="btn btn-primary" target="_blank"></i><?php echo $button_print; ?></a>
		</div>
		<h1><?php echo $heading_title;?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
	<?php if (isset($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-user"></i><?php echo $text_commission; ?></h3>
		</div>
		<div class="panel-body">
			<!----------------->
			<div class="ptsc-subscrip-pagebreak">
				<h1><?php echo $invoice_number_text; ?><?php echo $invoice_number; ?></h1>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td colspan="2"><?php echo $text_order_detail; ?></td>
							<td class="text-right"><?php echo $text_created_at; ?>: <?php echo $created_at; ?>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><address>
									<strong><?php echo $store_name; ?></strong><br />
									<?php echo $store_address; ?>
								</address>
								<b><?php echo $text_telephone; ?></b> <?php echo $store_telephone; ?><br />
								<b><?php echo $text_email; ?></b><?php echo $store_email; ?><br />
								<b><?php echo $text_website; ?></b> <a href="<?php echo $store_url; ?>"><?php echo $store_url; ?></a><br />
								</td>
								<td colspan="2"><address>
									<strong><?php echo $sellerdetails['store_name']; ?></strong><br />
									<?php echo $sellerdetails['store_address']; ?>&nbsp
									<?php echo $sellerdetails['store_city']; ?>&nbsp
									<?php echo $seller_country; ?>&nbsp
									<?php echo $sellerdetails['store_zipcode']; ?>
								</address>
								<b><?php echo $text_telephone; ?></b> <?php echo $sellerdetails['store_phone']; ?><br />
								<b><?php echo $text_email; ?></b> <?php echo $sellerdetails['store_email']; ?><br />
								<?php if ($seller_vatnumber != '' ) { ?>
									<b><?php echo $seller_vatname; ?></b><?php echo $seller_vatnumber; ?><br /> 
								<?php } ?> 
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td><?php echo $order_id_text; ?></td>
								<td><b><?php echo $column_product; ?></b></td>
								<td class="text-right"><b><?php echo $column_quantity; ?></b></td>
								<td class="text-right"><b><?php echo $column_product_price; ?></b></td>
								<td class="text-right"><b><?php echo $column_commission_percent; ?></b></td>
								<td class="text-right"><b><?php echo $fixed_text; ?></b></td>
								<td class="text-right"><b><?php echo $commision_product; ?></b></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($orders as $order) { ?>
								<tr>
									<td class="text-right"><?php echo $order['order_id']; ?></td>
									<td><?php echo $order['product']['name']; ?>
										<?php foreach ($order['product']['option'] as $option) { ?> 
											<br/>
											&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
										<?php } ?></td>
										
										<td class="text-right"><?php echo $order['product']['quantity']; ?></td>
										<td class="text-right"><?php echo $order['product']['price_total']; ?></td>
										<td class="text-right"><?php echo $order['commission_percent']; ?></td>
										<td class="text-right"><?php echo $order['commission_fixed']; ?></td>
										<td class="text-right"><?php echo $order['total_commission']; ?></td>
								</tr>
							<?php } ?>
						</tbody>
						<tfoot>
							<tr>		
								<td class="text-right" colspan="5"></td>          
								<td class=""><?php echo $shipping_text; ?></td>
								<td class="text-right"><?php echo $total_shipping_commission; ?></td>
							</tr>
							<tr>		
								<td class="text-right" colspan="5"></td>          
								<td class=" pts-text-bold"><?php echo $commision_product; ?></td>
								<td class="text-right pts-text-bold"><?php echo $total_commissionn; ?></td>
							</tr>
						</tfoot>
					</table>
					
					<table class="table table-bordered">
						<tbody class="ptsc-commission-tabshadow">
							<tr class="ptsc-commission-tpaynoborder">
								<td colspan="2"><h3 class="h3-payment"><?php echo $text_payment; ?></h3></td>
							</tr>
							<tr>	
								<td class="text-left payment-td">
									
									<b class="b-payment"><?php echo $text_totla_payable_amount; ?></b>: <?php echo $total_pay_amountt; ?><br>
									<b class="b-payment"><?php echo $payment_status; ?></b>: <?php echo $invoice_status; ?><br>
									<!-----link------>
									<?php  ?>
										<a href="<?php echo $pay_offline; ?>" class="ptsc-commission-offlpaddlef"><?php echo $transaction_history; ?> </a>
										<?php if($invoice_status_id != 2) { ?>
										<!------end------>
										<?php if($paypal['buttonshow']){ ?>
										<?php if(isset($paypal['testmode'])){ ?>										
										    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i><?php echo $paypal['text_testmode']; ?></div>
										<?php } ?>
										
											<div class="b-payment">
												<a href="<?php echo $pay_offline; ?>" class="btn btn-primary ptsc-commission-offlfloat"> <b><?php echo $button_pay_offline; ?></b> </a>
												<!---------------Start Code PayPal------------------------->
												<?php if($paypal['hosted_button_id']){ ?>
													<form class="ptsc-commission-hpaypalflpad" name="_xclick" action="<?php echo $paypal['action']; ?>" method="post">
														<input type="hidden" name="cmd" value="_xclick"/>
														<input type="hidden" name="return" value="<?php echo $paypal['return_url']; ?>"/>
														<input type="hidden" name="notify_url" value="<?php echo $paypal['notify_url']; ?>"/>
														<input type="hidden" name="currency_code" value="<?php echo $paypal['curency']; ?>"/>	 
														<input type="hidden" name="business" value="<?php echo $paypal['hosted_button_id']; ?>"/>
														<input type="hidden" name="item_name" value="<?php echo $paypal['item_name']; ?>"/>
														<input type="hidden" name="item_number" value="1"/>
														<input type="hidden" name="amount" value="<?php echo $paypal['amount']; ?>"/>
														<input type="hidden" name="first_name" value="<?php echo $paypal['first_name']; ?>"/>
														<input type="hidden" name="last_name" value="<?php echo $paypal['last_name']; ?>"/>
														<input type="hidden" name="address1" value="<?php echo $paypal['address']; ?>"/>
														<input type="hidden" name="custom" value="<?php echo $paypal['invoice_id']; ?>"/>
														<input type="hidden" name="city" value="<?php echo $paypal['city']; ?>"/>
														<input type="hidden" name="state" value="<?php echo $paypal['state']; ?>"/>
														<input type="hidden" name="zip" value="<?php echo $paypal['zip']; ?>"/>
														<input type="hidden" name="country" value="<?php echo $paypal['country']; ?>"/>
														<input type="hidden" name="night_phone_a" value="<?php echo $paypal['mobile']; ?>"/>
														<input type="hidden" name="email" value="<?php echo $paypal['store_email']; ?>"/>
														<input class="ptsc-commission-paypalwid" type="image" src="<?php echo $paypal['paypalbutton']; ?>" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" />
													</form>
												<?php } ?>
											</div>
										<?php } } ?>
										
								</td>
							</tr>
						</tbody>
					</table>
					<?php if ($purpletree_multivendor_footer_text != '' ) { ?>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td><?php echo $purpletree_multivendor_footer_text; ?>			  
									</td>
								</tr>
							</tbody>
						</table>
					<?php } ?>
				</div>
				<!----------------->
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
<script>
	
	function changeStatus() {
		var x = document.getElementById("status").value;
		var y="Disable";
		if(x==1){
			var y="Enable";
		}
		document.getElementById("change_status").innerHTML = y +" all products";
		document.getElementById("status_value").value = x;
		
	}
</script>