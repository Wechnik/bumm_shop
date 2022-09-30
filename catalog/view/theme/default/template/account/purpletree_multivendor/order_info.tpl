<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <div class="pts-pull-right"><a href="<?php echo $invoice; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="pts-btn pts-btn-info"><i class="fa fa-print"></i></a> <a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="pts-btn pts-btn-info"><i class="fa fa-truck"></i></a>
			  <?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			  </div>
    </div>
  </div>
			<div class="pts-row">
				<div class="pts-col-md-6">
					<div class="pts-panel pts-panel-default">
						<div class="pts-panel-heading">
							<h3 class="pts-panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_order_detail; ?></h3>
						</div>
						<table class="pts-table">
							<tbody>
								<tr>
									<td class="ptsc-orderinfo-width"><button data-toggle="tooltip" title="<?php echo $text_store; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-shopping-cart fa-fw"></i></button></td>
									<td><a href="<?php echo $store_url; ?>" target="_blank"><?php echo $store_name; ?></a></td>
								</tr>
								<tr>
									<td><button data-toggle="tooltip" title="<?php echo $text_date_added; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
									<td><?php echo $date_added; ?></td>
								</tr>
								<tr>
									<td><button data-toggle="tooltip" title="<?php echo $text_payment_method; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-credit-card fa-fw"></i></button></td>
									<td><?php echo $payment_method; ?></td>
								</tr>
								<?php if ($shipping_method) { ?>
									<tr>
										<td><button data-toggle="tooltip" title="<?php echo $text_shipping_method; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-truck fa-fw"></i></button></td>
										<td><?php echo $shipping_method; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pts-col-md-6">
					<div class="pts-panel pts-panel-default">
						<div class="pts-panel-heading">
							<h3 class="pts-panel-title"><i class="fa fa-user"></i> <?php echo $text_customer_detail; ?></h3>
						</div>
						<table class="pts-table">
							<tr>
								<td class="ptsc-orderinfo-width"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
								<td><?php if ($customer) { ?>
									<?php echo $firstname; ?> <?php echo $lastname; ?>
									<?php } else { ?>
									<?php echo $firstname; ?> <?php echo $lastname; ?>
								<?php } ?></td>
							</tr>
							<tr>
								<td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
								<td><?php echo $customer_group; ?></td>
							</tr>
							<tr>
								<td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
								<td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
							</tr>
							<tr>
								<td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="pts-btn pts-btn-info pts-btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
								<td><?php echo $telephone; ?></td>
							</tr>
						</table>
					</div>
				</div>
				
			</div>
			<div class="pts-panel pts-panel-default">
				<div class="pts-panel-heading">
					<h3 class="pts-panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
				</div>
				<div class="pts-panel-body">
					<table class="pts-table pts-table-bordered">
						<thead>
							<tr>
								<td class="pts-text-left ptsc-cuscontact-widthh"><?php echo $text_payment_address; ?></td>
								<?php if ($shipping_method) { ?>
									<td class="pts-text-left ptsc-cuscontact-widthh"><?php echo $text_shipping_address; ?></td>
								<?php } ?>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="pts-text-left"><?php echo $payment_address; ?></td>
								<?php if ($shipping_method) { ?>
									<td class="pts-text-left"><?php echo $shipping_address; ?></td>
								<?php } ?>
							</tr>
						</tbody>
					</table>
					<table class="pts-table pts-table-bordered">
						<thead>
							<tr>
								<td class="pts-text-left"><?php echo $column_product; ?></td>
								<td class="pts-text-left"><?php echo $column_model; ?></td>
								<td class="pts-text-right"><?php echo $column_quantity; ?></td>
								<td class="pts-text-right"><?php echo $column_price; ?></td>
								<td class="pts-text-right"><?php echo $column_total; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($products as $product) { ?>
								<tr>
									<td class="pts-text-left"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
										<?php foreach ($product['option'] as $option) { ?>
											<br />
											<?php if ($option['type'] != 'file') { ?>
												&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
												<?php } else { ?>
												&nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
											<?php } ?>
										<?php } ?></td>
										<td class="pts-text-left"><?php echo $product['model']; ?></td>
										<td class="pts-text-right"><?php echo $product['quantity']; ?></td>
										<td class="pts-text-right"><?php echo $product['price']; ?></td>
										<td class="pts-text-right"><?php echo $product['total']; ?></td>
								</tr>
							<?php } ?>
							<?php foreach ($vouchers as $voucher) { ?>
								<tr>
									<td class="pts-text-left"><a href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a></td>
									<td class="pts-text-left"></td>
									<td class="pts-text-right">1</td>
									<td class="pts-text-right"><?php echo $voucher['amount']; ?></td>
									<td class="pts-text-right"><?php echo $voucher['amount']; ?></td>
								</tr>
							<?php } ?>
							<?php foreach ($totals as $total) { ?>
								<tr>
									<td colspan="4" class="pts-text-right"><?php echo $total['title']; ?></td>
									<td class="pts-text-right"><?php echo $total['text']; ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
					<?php if ($comment) { ?>
						<table class="pts-table pts-table-bordered">
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
			<div class="pts-panel pts-panel-default">
				<div class="pts-panel-heading">
					<h3 class="pts-panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></h3>
				</div>
				<div class="pts-panel-body">
					<ul class="pts-nav pts-nav-tabs">
						<li class="active"><a href="#pts-tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
						<?php foreach ($tabs as $tab) { ?>
							<li><a href="#tab-<?php echo $tab['code']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
						<?php } ?>
					</ul>
					<div class="pts-tab-content">
						<div class="pts-tab-pane active" id="pts-tab-history">
							<div id="history"></div>
							<br />
							<?php if($manage_order) { ?>
								<fieldset>
									<legend><?php echo $text_history_add; ?></legend>
									<form class="pts-form-horizontal">
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
											<div class="pts-col-sm-10">
												<select <?php if($purpletree_multivendor_commission_status == $admin_order_status_id): ?> disabled <?php else: ?> name="order_status_id" <?php endif; ?> id="input-order-status" class="pts-form-control">
													<?php foreach ($order_statuses as $order_statuses) { ?>
														<?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
															<option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
															<?php } else { ?>
															<option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
														<?php } ?>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-override"><span data-toggle="tooltip" title="<?php echo $help_override; ?>"><?php echo $entry_override; ?></span></label>
											<div class="pts-col-sm-10">
												<input type="checkbox" <?php if($purpletree_multivendor_commission_status == $admin_order_status_id): ?> disabled <?php else: ?> name="override" <?php endif; ?> value="1" id="input-override" />
											</div>
										</div>
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-notify"><?php echo $entry_notify; ?></label>
											<div class="pts-col-sm-10">
												<input type="checkbox" <?php if($purpletree_multivendor_commission_status == $admin_order_status_id): ?> disabled <?php else: ?> name="notify" <?php endif; ?> value="1" id="input-notify" />
											</div>
										</div>
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-comment"><?php echo $entry_comment; ?></label>
											<div class="pts-col-sm-10">
												<textarea <?php if($purpletree_multivendor_commission_status == $admin_order_status_id): ?> disabled <?php else: ?> name="comment" <?php endif; ?> rows="8" id="input-comment" class="pts-form-control"></textarea>
											</div>
										</div>
									</form>
								</fieldset>
								<div class="pts-text-right">
									<button <?php if($purpletree_multivendor_commission_status == $admin_order_status_id): ?> disabled <?php endif; ?> id="pts-button-history" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button>
								</div>
							<?php } ?>
						</div>
						<div class="pts-tab-pane" id="tab-additional">
							<?php if ($account_custom_fields) { ?>
								<div class="pts-table-responsive">
									<table class="pts-table pts-table-bordered">
										<thead>
											<tr>
												<td colspan="2"><?php echo $text_account_custom_field; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($account_custom_fields as $custom_field) { ?>
												<tr>
													<td><?php echo $custom_field['name']; ?></td>
													<td><?php echo $custom_field['value']; ?></td>
												</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							<?php } ?>
							<?php if ($payment_custom_fields) { ?>
								<div class="pts-table-responsive">
									<table class="pts-table pts-table-bordered">
										<thead>
											<tr>
												<td colspan="2"><?php echo $text_payment_custom_field; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($payment_custom_fields as $custom_field) { ?>
												<tr>
													<td><?php echo $custom_field['name']; ?></td>
													<td><?php echo $custom_field['value']; ?></td>
												</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							<?php } ?>
							<?php if ($shipping_method && $shipping_custom_fields) { ?>
								<div class="pts-table-responsive">
									<table class="pts-table pts-table-bordered">
										<thead>
											<tr>
												<td colspan="2"><?php echo $text_shipping_custom_field; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($shipping_custom_fields as $custom_field) { ?>
												<tr>
													<td><?php echo $custom_field['name']; ?></td>
													<td><?php echo $custom_field['value']; ?></td>
												</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							<?php } ?>
						</div>
					</div>
					<?php foreach ($tabs as $tab) { ?>
						<div class="pts-tab-pane" id="tab-<?php echo $tab['code']; ?>"><?php echo $tab['content']; ?></div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$(document).delegate('#button-invoice', 'click', function() {
		$.ajax({
			url: 'index.php?route=sale/order/createinvoiceno&order_id=<?php echo $order_id; ?>',
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
					$('#content > .pts-container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['invoice_no']) {
					$('#invoice').html(json['invoice_no']);
					
					$('#button-invoice').replaceWith('<button disabled="disabled" class="pts-btn pts-btn-success pts-btn-xs"><i class="fa fa-cog"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	
	$(document).delegate('#button-reward-add', 'click', function() {
		$.ajax({
			url: 'index.php?route=sale/order/addreward&order_id=<?php echo $order_id; ?>',
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
					$('#content > .pts-container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#content > .pts-container-fluid').prepend('<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('#button-reward-add').replaceWith('<button id="button-reward-remove" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="pts-btn pts-btn-danger pts-btn-xs"><i class="fa fa-minus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	
	$(document).delegate('#button-reward-remove', 'click', function() {
		$.ajax({
			url: 'index.php?route=sale/order/removereward&order_id=<?php echo $order_id; ?>',
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
					$('#content > .pts-container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#content > .pts-container-fluid').prepend('<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('#button-reward-remove').replaceWith('<button id="button-reward-add" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="pts-btn pts-btn-success pts-btn-xs"><i class="fa fa-plus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	
	$(document).delegate('#button-commission-add', 'click', function() {
		$.ajax({
			url: 'index.php?route=sale/order/addcommission&order_id=<?php echo $order_id; ?>',
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
					$('#content > .pts-container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#content > .pts-container-fluid').prepend('<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('#button-commission-add').replaceWith('<button id="button-commission-remove" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="pts-btn pts-btn-danger pts-btn-xs"><i class="fa fa-minus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	
	$(document).delegate('#button-commission-remove', 'click', function() {
		$.ajax({
			url: 'index.php?route=sale/order/removecommission&order_id=<?php echo $order_id; ?>',
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
					$('#content > .pts-container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#content > .pts-container-fluid').prepend('<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('#button-commission-remove').replaceWith('<button id="button-commission-add" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="pts-btn pts-btn-success pts-btn-xs"><i class="fa fa-plus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	
	
	$('#history').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();
		
		$('#history').load(this.href);
	});
	
	$('#history').load('index.php?route=account/purpletree_multivendor/sellerorder/historylist&order_id=<?php echo $order_id; ?>');
	<?php if($purpletree_multivendor_commission_status != $admin_order_status_id): ?>
	$('#pts-button-history').on('click', function() {	
		$.ajax({
			url: 'index.php?route=account/purpletree_multivendor/sellerorder/history&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
			type: 'post',
			dataType: 'json',
			data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&override=' + ($('input[name=\'override\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
			cache: false,
			beforeSend: function() {
				$('#pts-button-history').button('loading');
			},
			complete: function() {
				$('#pts-button-history').button('reset');
			},
			success: function(json) {
				$('.alert').remove();
				
				if (json['error']) {
					$('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				
				if (json['success']) {
					$('#history').load('index.php?route=account/purpletree_multivendor/sellerorder/historylist&order_id=<?php echo $order_id; ?>');
					
					$('#history').before('<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('textarea[name=\'comment\']').val('');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	<?php endif; ?>
	function addOrderInfo(){
		var status_id = $('select[name="order_status_id"]').val();
		
		$.ajax({
			url: 'index.php?route=extension/openbay/addorderinfo&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
			type: 'post',
			dataType: 'html',
			data: $(".openbay-data").serialize()
		});
	}
//--></script> 
<?php echo $footer; ?>