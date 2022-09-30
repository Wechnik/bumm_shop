<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<?php if ($seller_id) { ?>
				<div class="pull-right">
					<button type="submit" disabled= "disabled" title="<?php echo $generate_invoice; ?>" id="button-commission-invoice" form="form-order" formaction="<?php echo $commission_invoice; ?>" data-toggle="tooltip" title="<?php echo $button_commission_invoice_print; ?>" class="btn btn-info"><?php echo $generate_invoice; ?></button> 
					<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
				</div>
			<?php } else{ ?>
			<div class="pull-right">					
					<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
				</div>
			<?php } ?>
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
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?>
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
				<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<div class="well">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-store"><?php echo $entry_store; ?></label>	 
								<select name="seller_store" id="input-store" class="form-control">
									<option value=""><?php echo $entry_select_store; ?></option>
									<?php foreach ($seller_stores as $seller_store) { ?>
										<?php if ($seller_store['seller_id'] == $seller_id) { ?>
											<option value="<?php echo $seller_store['seller_id']; ?>"selected="selected"
											><?php echo $seller_store['store_name']; ?></option>	
											<?php } else { ?> 	
											<option value="<?php echo $seller_store['seller_id']; ?>"><?php echo  $seller_store['store_name']; ?></option>
										<?php } ?>							
									<?php } ?>
								</select>
							</div>
						</div>			  
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="input-date-added"><?php echo $entry_date_from; ?></label>
								<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>">
								<div class="input-group date">
									<input type="text" name="filter_date_from" value="<?php echo $filter_date_from; ?>" placeholder="<?php echo $entry_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-date-from" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="input-date-modified"><?php echo $entry_date_to; ?></label>
								<div class="input-group date">
									<input type="text" name="filter_date_to" value="<?php echo $filter_date_to; ?>" placeholder="<?php echo $entry_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-date-to" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>        
						</div>
						<div class="col-sm-2">
							<label></label>
							<div class="form-group">
								<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i><?php echo $button_filter; ?></button>
							</div>
						</div>
					</div>
					<div><div slass ="ptsc-commission-fontbold" ><?php echo $help_store; ?></div><div class="sellercolor"> <div class="greencolor"></div><?php echo $help_Invoice; ?> </div></div>
				</div>
				<form method="post" action="<?php echo $commission_invoice; ?>" enctype="multipart/form-data" id="form-order">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td id='log'></td>
									<td class="text-left"><?php echo $text_order_id; ?></td>
									<td class="text-left"><?php echo $text_product_id; ?></td>
									<td class="text-left"><?php echo $text_product_price; ?></td>
									<td class="text-left"><?php echo $text_store_name; ?></td>
									<td class="text-left"><?php echo $text_commission_percent; ?></td>
									<td class="text-left"><?php echo $text_commission_fixed; ?></td>
									<td class="text-left"><?php echo $text_commission_shipping; ?></td>
									<td class="text-left"><?php echo $text_commission; ?></td>
									<td class="text-left"><?php echo $text_created_at; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($seller_commissions) { ?>
									<?php foreach ($seller_commissions as $seller_commission) { ?>
										<tr <?php if ($seller_commission['invoice_status'] == 1 or $generated_invoice_order_id == $seller_commission['order_id']) { ?> class = "bluecolor"<?php } ?>>
											<td class="text-center ff">
												<input data-order-id="<?php echo $seller_commission['order_id']; ?>"
												class="inputcheckbx inputcheckbx_<?php echo $seller_commission['order_id']; ?>" type="checkbox" 
												<?php if ($seller_commission['invoice_status'] == 1 or $generated_invoice_order_id == $seller_commission['order_id']) { ?> disabled= "disabled" 
												<?php } ?> name="selected[<?php echo $seller_commission['id']; ?>]" value=" <?php echo $seller_commission['order_id']; ?>" id="order_<?php echo $seller_commission['id']; ?>" />
											</td>
											<td class="text-left">#<?php echo $seller_commission['order_id']; ?></td>
											<td class="text-left"><?php echo $seller_commission['product_name']; ?></td>  
											<td class="text-left"><?php echo $seller_commission['price']; ?></td>		
											<td class="text-left"><a href="<?php echo $seller_commission['store_url']; ?>"><?php echo $seller_commission['store_name']; ?></a></td>
											<td class="text-left"><?php echo $seller_commission['commission_percent']; ?></td>
											<td class="text-left"><?php echo $seller_commission['commission_fixed']; ?></td>
											<td class="text-left"><?php echo $seller_commission['commission_shipping']; ?></td>
											<td class="text-left"><?php echo $seller_commission['commission']; ?></td>
											<td class="text-left"><?php echo $seller_commission['created_at']; ?></td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
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
		$( document ).ready(function() {
			$(".inputcheckbx" ).on( "click", function() {
				if($(this).is(':checked')){
					var order_id = $(this).attr('data-order-id');
					$(".inputcheckbx_"+order_id).each(function(k,v) {
						$('#'+v.id).prop('checked', true);	
					});
					} else {
					var order_id = $(this).attr('data-order-id');
					$(".inputcheckbx_"+order_id).each(function(k,v) {
						$('#'+v.id).prop('checked', false);	
					});
				}
			});
		});
		
		
		$('#button-filter').on('click', function() {
			url = 'index.php?route=purpletree_multivendor/sellercommission&token=<?php echo $token; ?>';
			
			var seller_id = $('select[name=\'seller_store\']').val();
			
			if (seller_id) {
				url += '&seller_id=' + encodeURIComponent(seller_id);
			}
			
			var filter_date_from = $('input[name=\'filter_date_from\']').val();
			
			if (filter_date_from) {
				url += '&filter_date_from=' + encodeURIComponent(filter_date_from);
			}
			
			var filter_date_to = $('input[name=\'filter_date_to\']').val();
			
			if (filter_date_to) {
				url += '&filter_date_to=' + encodeURIComponent(filter_date_to);
			}
			
			location = url;
		});
		$('.selecteddd').on('change', function() {
			$('#button-commission-invoice').prop('disabled', true);
			
			var selected = $('input[name^=\'selected\']:checked');
			
			if (selected.length) {
				$('#button-commission-invoice').prop('disabled', false);
			}
		});
		$('input[name^=\'selected\']').on('change', function() {
			$('#button-commission-invoice').prop('disabled', true);
			
			var selected = $('input[name^=\'selected\']:checked');
			
			if (selected.length) {
				$('#button-commission-invoice').prop('disabled', false);
			}
		});
	//--></script> 
	<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
	//--></script></div>
	<?php echo $footer; ?>	