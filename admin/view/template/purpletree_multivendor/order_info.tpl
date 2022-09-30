<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<?php if ($paypalpayouts == '1') { ?>
				 <button type="button" data-toggle="tooltip" title="Update Paypal Payout Status" class="btn btn-info btnpaypalpayout"><i class="fa fa-eye"></i></button>
				<?php } ?>
				<a href="<?php echo $sellerinvoice1; ?>" target="_blank" data-toggle="tooltip" title="Print Seller Invoice" class="btn btn-info"><i class="fa fa-print"></i></a>
			<a href="<?php echo $invoice; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></a> <a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a> <a href="<?php echo $edit; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a> -->
				<?php }?>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div> 
	</div>
	<div class="container-fluid msgdiv">
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_order_detail; ?></h3>
					</div>
					<table class="table">
						<tbody>
							<tr>
								<td class="ptsc-vendorlis-width"><button data-toggle="tooltip" title="<?php echo $text_store; ?>" class="btn btn-info btn-xs"><i class="fa fa-shopping-cart fa-fw"></i></button></td>
								<td><a href="<?php echo $store_url; ?>" target="_blank"><?php echo $store_name; ?></a></td>
							</tr>
							<tr>
								<td><button data-toggle="tooltip" title="<?php echo $text_date_added; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
								<td><?php echo $date_added; ?></td>
							</tr>
							<tr>
								<td><button data-toggle="tooltip" title="<?php echo $text_payment_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-credit-card fa-fw"></i></button></td>
								<td><?php echo $payment_method; ?></td>
							</tr>
							<?php if ($shipping_method) { ?>
								<tr>
									<td><button data-toggle="tooltip" title="<?php echo $text_shipping_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-truck fa-fw"></i></button></td>
									<td><?php echo $shipping_method; ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_customer_detail; ?></h3>
					</div>
					<table class="table">
						<tr>
							<td class="ptsc-vendorlis-width"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
							<td><?php if ($customer) { ?>
								<a href="<?php echo $customer; ?>" target="_blank"><?php echo $firstname; ?> <?php echo $lastname; ?></a>
								<?php } else { ?>
								<?php echo $firstname; ?> <?php echo $lastname; ?>
							<?php } ?></td>
						</tr>
						<tr>
							<td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
							<td><?php echo $customer_group; ?></td>
						</tr>
						<tr>
							<td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
							<td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
						</tr>
						<tr>
							<td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
							<td><?php echo $telephone; ?></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-cog"></i> <?php echo $text_option; ?></h3>
					</div>
					<table class="table">
						<tbody>
							<tr>
								<td><?php echo $text_invoice; ?></td>
								<td id="invoice" class="text-right"><?php echo $invoice_no; ?></td>
								<td class="text-center ptsc-vendorlis-width"><?php if (!$invoice_no) { ?>
									<button id="button-invoice" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>
									<?php } else { ?>
									<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-refresh"></i></button>
								<?php } ?></td>
							</tr>
							<tr>
								<td><?php echo $text_reward; ?></td>
								<td class="text-right"><?php echo $reward; ?></td>
								<td class="text-center"><?php if ($customer && $reward) { ?>
									<?php if (!$reward_total) { ?>
										<button id="button-reward-add" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
										<?php } else { ?>
										<button id="button-reward-remove" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>
									<?php } ?>
									<?php } else { ?>
									<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
								<?php } ?></td>
							</tr>
							<tr>
								<td><?php echo $text_affiliate; ?>
									<?php if ($affiliate) { ?>
										(<a href="<?php echo $affiliate; ?>"><?php echo $affiliate_firstname; ?> <?php echo $affiliate_lastname; ?></a>)
									<?php } ?></td>
									<td class="text-right"><?php echo $commission; ?></td>
									<td class="text-center"><?php if ($affiliate) { ?>
										<?php if (!$commission_total) { ?>
											<button id="button-commission-add" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
											<?php } else { ?>
											<button id="button-commission-remove" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>
										<?php } ?>
										<?php } else { ?>
										<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
									<?php } ?></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="text-left ptsc-subscrip-width"><?php echo $text_payment_address; ?></td>
							<?php if ($shipping_method) { ?>
								<td class="text-left ptsc-subscrip-width"><?php echo $text_shipping_address; ?></td>
							<?php } ?>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-left"><?php echo $payment_address; ?></td>
							<?php if($shipping_method) { ?>
								<td class="text-left"><?php echo $shipping_address; ?></td>
							<?php } ?>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="text-left"><?php echo $column_product; ?></td>
							<td class="text-left"><?php echo $column_model; ?></td>
							<td class="text-right"><?php echo $column_quantity; ?></td>
							<td class="text-right"><?php echo $column_price; ?></td>
							<td class="text-right"><?php echo $column_total; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($products as $product) { ?>
							<tr>
								<td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
									<?php foreach ($product['option'] as $option) { ?>
										<br />
										<?php if ($option['type'] != 'file') { ?>
											&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
											<?php } else { ?>
											&nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
										<?php } ?>
									<?php } ?>
									<br />
									<?php if(!empty($product['seller_name'])) { ?>
										<small> <?php echo $text_seller_label; ?>:  <?php echo $product['seller_name']; ?> | <?php echo $text_seller_label_status; ?><a target="_blank" id="pts_order_satatus" href="index.php?route=purpletree_multivendor/stores/seller_order_info&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&seller_id=<?php echo $product['seller_id']; ?>"> <?php echo ((!empty($product['seller_order_status']['status']))?$product['seller_order_status']['status']:''); ?></a></small>
									<?php } ?>
								</td>
								<td class="text-left"><?php echo $product['model']; ?></td>
								<td class="text-right"><?php echo $product['quantity']; ?></td>
								<td class="text-right"><?php echo $product['price']; ?></td>
								<td class="text-right"><?php echo $product['total']; ?></td>
							</tr>
						<?php } ?>
						<?php foreach ($vouchers as $voucher) { ?>
							<tr>
								<td class="text-left"><a href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a></td>
								<td class="text-left"></td>
								<td class="text-right">1</td>
								<td class="text-right"><?php echo $voucher['amount']; ?></td>
								<td class="text-right"><?php echo $voucher['amount']; ?></td>
							</tr>
						<?php } ?>
						<?php  foreach ($totals as $total) { ?>
							<?php  if($total['code'] == 'shipping') { ?>
								<?php  foreach ($shipping_totals as $shipping_total) { ?>
									<tr>
										<td colspan="4" class="text-right"><?php echo $shipping_total['title']; ?>
											<?php  if($shipping_total['seller_id'] != '0') { ?>
												<a href="<?php echo $shipping_total.seller_link; ?>"> (<?php echo $shipping_total['seller_name']; ?>) </a>
											<?php }  ?>
										</td>
										<td class="text-right"><?php echo $shipping_total['text']; ?>
										</td>
									</tr>
								<?php }  ?>
							<?php }  ?>
							<tr>
								
							</td>
							<?php  if($total['sub_title'] == "Refunded") { ?>
								<td colspan="4" class="text-right"><?php echo $total['title']; ?></td>		 
								<td class="text-right"><?php echo $total['text']; ?> <button id ="refund_button"  type="button" return_code ="<?php echo $total['code']; ?>" return_value ="<?php echo $total['amount']; ?>" refund_order_id ="<?php echo $order_id; ?>" class="btn  btn-primary btn-xs" ><i class="fa fa-upload"></i></button></td>
								<?php } else { ?>		  
								<td colspan="4" class="text-right"><?php echo $total['title']; ?></td>
								<td class="text-right"><?php echo $total['text']; ?>
								<?php } ?>
							</tr>
						<?php } ?>
					</tbody>
				</table>
				<?php if ($comment) { ?>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td><?php echo $text_comment; ?></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><?php echo $comment; ?></td>
							</tr>
						</tbody>
					</table>
				<?php } ?>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="refund_Modal">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title text-center"><?php echo $text_refund_heding; ?></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<form action="<?php echo $refund_acton; ?>" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="refund_value"><?php echo $text_refudn_amount; ?>:</label>
							<input type="hidden" class="form-control" id="refund_code" value="" name="code">
							<input type="hidden" class="form-control" id="refund_order_id" value="" name="refund_order_id">
							<input type="text" class="form-control" id="refund_value" value="" name="refund_value">
						</div>
						<button type="submit" class="btn btn-primary"><?php echo $button_submit; ?></button>			
					</form>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<!--<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>-->
				</div>
				
			</div>
		</div>
	</div>
	
	<script>  
		$(document).on("click", "#refund_button", function () {
			
			$('#refund_Modal').modal('show');
			$('#refund_code').val($(this).attr('return_code'));
			$('#refund_value').val($(this).attr('return_value'));
			$('#refund_order_id').val($(this).attr('refund_order_id'));
		});
	</script>  
	<script type="text/javascript"><!--
		$(document).delegate('#button-ip-add', 'click', function() {
			$.ajax({
				url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
				type: 'post',
				data: 'ip=<?php echo $api_ip; ?>',
				dataType: 'json',
				beforeSend: function() {
					$('#button-ip-add').button('loading');
				},
				complete: function() {
					$('#button-ip-add').button('reset');
				},
				success: function(json) {
					$('.alert').remove();
					
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
					
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
		
		$(document).delegate('#button-invoice', 'click', function() {
			$.ajax({
				url: 'index.php?route=sale/order/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				dataType: 'json',
				beforeSend: function() {
					$('#button-invoice').button('loading');
				},
				complete: function() {
					$('#button-invoice').button('reset');
				},
				success: function(json) {
					$('.alert').remove();
					
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					}
					
					if (json['invoice_no']) {
						$('#invoice').html(json['invoice_no']);
						
						$('#button-invoice').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
		
		$(document).delegate('#button-reward-add', 'click', function() {
			$.ajax({
				url: 'index.php?route=sale/order/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				type: 'post',
				dataType: 'json',
				beforeSend: function() {
					$('#button-reward-add').button('loading');
				},
				complete: function() {
					$('#button-reward-add').button('reset');
				},
				success: function(json) {
					$('.alert').remove();
					
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
						
						$('#button-reward-add').replaceWith('<button id="button-reward-remove" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
		
		$(document).delegate('#button-reward-remove', 'click', function() {
			$.ajax({
				url: 'index.php?route=sale/order/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				type: 'post',
				dataType: 'json',
				beforeSend: function() {
					$('#button-reward-remove').button('loading');
				},
				complete: function() {
					$('#button-reward-remove').button('reset');
				},
				success: function(json) {
					$('.alert').remove();
					
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
						
						$('#button-reward-remove').replaceWith('<button id="button-reward-add" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
		
		$(document).delegate('#button-commission-add', 'click', function() {
			$.ajax({
				url: 'index.php?route=sale/order/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				type: 'post',
				dataType: 'json',
				beforeSend: function() {
					$('#button-commission-add').button('loading');
				},
				complete: function() {
					$('#button-commission-add').button('reset');
				},
				success: function(json) {
					$('.alert').remove();
					
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
						
						$('#button-commission-add').replaceWith('<button id="button-commission-remove" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
		
		$(document).delegate('#button-commission-remove', 'click', function() {
			$.ajax({
				url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				type: 'post',
				dataType: 'json',
				beforeSend: function() {
					$('#button-commission-remove').button('loading');
				},
				complete: function() {
					$('#button-commission-remove').button('reset');
				},
				success: function(json) {
					$('.alert').remove();
					
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
						
						$('#button-commission-remove').replaceWith('<button id="button-commission-add" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
				$('body').delegate('.btnpaypalpayout', 'click', function(e) {
		e.preventDefault();
			$.ajax({
				url: 'index.php?route=purpletree_multivendor/sellerorders/curlpaypaypal&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				type: 'get',
				dataType: 'json',
				beforeSend: function() {
					$('.btnpaypalpayout').button('loading');
				},
				complete: function() {
					$('.btnpaypalpayout').button('reset');
				},
				success: function(json) {
					$('.alert-dismissible').remove();
					console.log(json);
					if (json['error']) {
						$('.msgdiv').before('<div class="container-fluid alert"><div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
					}
					
					if (json['success']) {
						//$('.msgdiv').load('index.php?route=sale/order/history&user_token={{ user_token }}&order_id={{ order_id }}');
						
						$('.msgdiv').before('<div class="container-fluid alert"><div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
		var token = '';
		
		// Login to the API
		$.ajax({
			url: '<?php echo $catalog; ?>index.php?route=api/login',
			type: 'post',
			dataType: 'json',
			data: 'key=<?php echo $api_key; ?>',
			crossDomain: true,
			success: function(json) {
				$('.alert').remove();
				
				if (json['error']) {
					if (json['error']['key']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
					
					if (json['error']['ip']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
					}
				}
				
				if (json['token']) {
					token = json['token'];
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		
		function changeStatus(){
			var status_id = $('select[name="order_status_id"]').val();
			
			$('#openbay-info').remove();
			
			$.ajax({
				url: 'index.php?route=extension/openbay/getorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
				dataType: 'html',
				success: function(html) {
					$('#history').after(html);
				}
			});
		}
		
		function addOrderInfo(){
			var status_id = $('select[name="order_status_id"]').val();
			
			$.ajax({
				url: 'index.php?route=extension/openbay/addorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
				type: 'post',
				dataType: 'html',
				data: $(".openbay-data").serialize()
			});
		}
		
		$(document).ready(function() {
			changeStatus();
		});
		
		$('select[name="order_status_id"]').change(function(){
			changeStatus();
		});
	//--></script> 
</div>
<?php echo $footer; ?> 
