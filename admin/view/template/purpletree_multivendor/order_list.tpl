<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" id="button-seller-invoice" form="form-order" formaction="<?php echo $sellerinvoice; ?>" formtarget="_blank" data-toggle="tooltip" title="Print Seller Invoice" class="btn btn-info"><i class="fa fa-print"></i></button>
				<button type="submit" id="button-shipping" form="form-order" formaction="<?php echo $shipping; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></button>
				<button type="submit" id="button-invoice" form="form-order" formaction="<?php echo $invoice; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></button>
				<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
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
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<div class="well">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-date-added"><?php echo $entry_date_from; ?></label>
								<input type="hidden" name="seller_id" value="<?php echo $seller_id;?>">
								<div class="input-group date">
									<input type="text" name="filter_date_from" value="<?php echo $filter_date_from; ?>" placeholder="<?php echo $entry_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-date-from" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>
							<div class="form-group">
								<label class="control-label" for="input-date-modified"><?php echo $entry_date_to; ?></label>
								<div class="input-group date">
									<input type="text" name="filter_date_to" value="<?php echo $filter_date_to; ?>" placeholder="<?php echo $entry_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-date-to" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div> 
						</div>			         
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
								<select name="filter_order_status" id="input-order-status" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php if ($filter_order_status == '0') { ?>
										<option value="0" selected="selected"><?php echo $text_missing; ?></option>
										<?php } else { ?>
										<option value="0"><?php echo $text_missing; ?></option>
									<?php } ?>
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $filter_order_status) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label" for="input-admin-order-status"><?php echo $entry_admin_order_status; ?></label>
								<select name="filter_admin_order_status" id="input-order-status" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php if ($filter_admin_order_status == '0') { ?>
										<option value="0" selected="selected"><?php echo $text_missing; ?></option>
										<?php } else { ?>
										<option value="0"><?php echo $text_missing; ?></option>
									<?php } ?>
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $filter_admin_order_status) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-sm-4" >
							<div class="form-group catdivdropp">
								<input type="hidden" name="seller_id_filter" value="<?php echo $seller_id_filter; ?>" class="form-control" />
								<label class="control-label" for="input-name"><?php echo $entry_seller_store; ?></label>
								<input type="text" name="store_name" value="<?php echo $store_name; ?>" placeholder="<?php echo $entry_seller_store; ?>" id="input-name" class="form-control" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-10">
							<?php if(!empty($filter_date_from) || !empty($filter_date_to) || !empty($filter_order_status)) { ?>
								<div class="row">
									<div class="col-sm-3">
										<div class="amount-box">
											<?php echo $entry_total_sale; ?><br /><h4><?php echo $total_sale; ?></h4>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="amount-box">
											<?php echo $entry_total_pay; ?><br /><h4><?php echo $total_pay; ?></h4>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="amount-box">
											<?php echo $entry_total_paid; ?><br /><h4><?php echo $total_paid; ?></h4>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="amount-box">
											<?php echo $entry_total_commission; ?><br /><h4><?php echo $total_commission; ?></h4>
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
						<div class="col-sm-2">
							<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
				</div>
				<form method="post" action="" enctype="multipart/form-data" id="form-order">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php echo $column_order_id; ?></td>
									<td class="text-left"><?php echo $column_customer; ?></td>
									<td class="text-left" width="60%">
										<table class="ptsc-orderlist-tabwidth">
											<td class="ptsc-orderlist-cnamwid"><?php echo $column_name; ?></td>
											<td class="ptsc-orderlist-snamwidth"><?php echo $column_store; ?></td>
											<td class="ptsc-orderlist-statuwidth"><?php echo $column_status; ?></td>
											<td class="ptsc-orderlist-shipwidth"><?php echo $column_shipping; ?></td>
											
										</table>
									</td>
									<td class="text-left"><?php echo $column_admin_status; ?></td>
									<td class="text-left"><?php echo $column_commissions; ?></td>
									<td class="text-left"><?php echo $column_total; ?></td>
									<td class="text-left"><?php echo $column_date_added; ?></td>
									<td class="text-left"><?php echo $column_date_modified; ?></td>
									<td class="text-left"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($orders) { ?>
									<?php foreach ($orders as $order) { ?>
										<tr>
											<td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
											<?php } ?>
											<input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
											<td class="text-left"><?php echo $order['order_id']; ?></td>
											<td class="text-left"><?php echo $order['customer']; ?></td>
											<td class="text-left pts-table_order_list ptsc-orderlist-olipadd">
												<table class="ptsc-orderlist-tabwidth">
													<?php foreach($order['order_status'] as $status) { ?>
														
														<tr>
															<td class="ptsc-orderlist-spaddwid">
																<table>
																	<?php foreach($status['product'] as $product) { ?>
																		<tr>
																			<td><?php echo $product['product_name']; ?></td> 
																		</tr>
																	<?php } ?>
																</table>
															</td>
															<td class="ptsc-orderlist-snamwidth"><a href="<?php echo $status['store_url']; ?>"><?php echo $status['store_name'] ; ?></a></td>
															<td class="ptsc-orderlist-statuwidth"><?php echo $status['order_status'] ; ?></td>
															<td class="ptsc-orderlist-shipwidth"><?php echo $status['shipping'] ; ?></td>
														</tr>
													<?php } ?>
												</table>
											</td>
											<td class="text-left"><?php echo $order['admin_order_status']; ?></td>
											<td class="text-left"><?php echo $order['commission']; ?></td>
											<td class="text-left"><?php echo $order['total']; ?></td>
											<td class="text-left"><?php echo $order['date_added']; ?></td>
											<td class="text-left"><?php echo $order['date_modified']; ?></td>
											<td class="text-left"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"><!--
		$('#button-filter').on('click', function() {
			url = 'index.php?route=purpletree_multivendor/sellerorders&token=<?php echo $token; ?>';
			var seller_id = $('input[name=\'seller_id\']').val();
			
			if (seller_id) {
				url += '&seller_id=' + encodeURIComponent(seller_id);
			}	
			var filter_order_status = $('select[name=\'filter_order_status\']').val();
			var filter_admin_order_status = $('select[name=\'filter_admin_order_status\']').val();
			
			if (filter_order_status != '*') {
				url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
			}
			if (filter_admin_order_status != '*') {
				url += '&filter_admin_order_status=' + encodeURIComponent(filter_admin_order_status);
			}
			
			var filter_date_from = $('input[name=\'filter_date_from\']').val();
			
			if (filter_date_from) {
				url += '&filter_date_from=' + encodeURIComponent(filter_date_from);
			}
			
			var filter_date_to = $('input[name=\'filter_date_to\']').val();
			
			if (filter_date_to) {
				url += '&filter_date_to=' + encodeURIComponent(filter_date_to);
			}
			
			var seller_id_filter = $('input[name=\'seller_id_filter\']').val();
			
			if (seller_id_filter) {
				url += '&seller_id_filter=' + encodeURIComponent(seller_id_filter);
			}
			
			var store_name = $('input[name=\'store_name\']').val();
			
			if (store_name) {
				url += '&store_name=' + encodeURIComponent(store_name);
			}
			
			location = url;
		});
	//--></script> 
	<script type="text/javascript"><!--
		$('input[name=\'filter_customer\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['customer_id']
							}
						}));
					}
				});
			},
			'select': function(item) {
				$('input[name=\'filter_customer\']').val(item['label']);
			}
		});
	//--></script> 
	<script type="text/javascript"><!--
		$('input[name^=\'selected\']').on('change', function() {
			$('#button-shipping, #button-invoice').prop('disabled', true);
			
			var selected = $('input[name^=\'selected\']:checked');
			
			if (selected.length) {
				$('#button-invoice').prop('disabled', false);
			}
			if (selected.length) {
				$('#button-seller-invoice').prop('disabled', false);
			}
			
			for (i = 0; i < selected.length; i++) {
				if ($(selected[i]).parent().find('input[name^=\'shipping_code\']').val()) {
					$('#button-shipping').prop('disabled', false);
					
					break;
				}
			}
		});
		
		$('#button-shipping, #button-invoice, #button-seller-invoice').prop('disabled', true);
		
		$('input[name^=\'selected\']:first').trigger('change');
		
		// IE and Edge fix!
		$('#button-shipping, #button-invoice').on('click', function(e) {
			$('#form-order').attr('action', this.getAttribute('formAction'));
		});
		
		$('#button-delete').on('click', function(e) {
			$('#form-order').attr('action', this.getAttribute('formAction'));
			
			if (confirm('<?php echo $text_confirm; ?>')) {
				$('#form-order').submit();
				} else {
				return false;
			}
		});
	//--></script> 
	<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
	//--></script>
	
	<script type="text/javascript"><!--
		$('input[name=\'store_name\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/sellerorders/autosellerstore&token=<?php echo $token; ?>&store_name=' +  encodeURIComponent(request),
					
					dataType: 'json',	
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['vendor_id']
							}
						}));
					}
				});
			},
			'select': function(item) {
				$('input[name=\'store_name\']').val(item['label']);
				$('input[name=\'seller_id_filter\']').val(item['value']);
			}	
		});
		
		
	//--></script> 
</div>
<?php echo $footer; ?> 