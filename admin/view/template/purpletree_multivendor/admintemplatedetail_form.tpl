<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		<?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
			<h1><?php echo $heading_detailform; ?></h1>
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
			<div class="alert alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default card">
			<div class="panel-heading">
				<h3 class="panel-title card-header"><i class="fa fa-credit-card"></i><?php echo $heading_detail11; ?></h3> 
			</div>
			<div class="panel-body card-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product">
					<input type="hidden" name="template_id" class="form-control" value="<?php echo $template_id; ?>"/>
					<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
					<div class="row">
						<div class="col-sm-12 form-group row required">
							<div class="col-sm-3">
								<label class="control-label col-form-label"><?php echo $text_select_seller; ?></label>
							</div>
							<input type="hidden" name="seller_id_filter" value="" class="form-control" />
							<div class="col-sm-9">
								<input name="store_name" placeholder="<?php echo $text_select_seller; ?>" type="text" class="form-control" value=""<?php echo $store_name; ?>"/>
								<?php if ($store_name_error) { ?>
										<div class="text-danger"><?php echo $store_name_error; ?></div>
								<?php } ?>
								</div>
								</div>
								<div class="col-sm-12 form-group row required">
								<div class="col-sm-3">
									<label class="control-label col-form-label"><?php echo $text_quantity; ?></label>
								</div>
								<div class="col-sm-9">
									<input name="quantity" placeholder="<?php echo $text_quantity; ?>" type="text" class="form-control" value="<?php echo $quantity ?>"/>
									<?php if ($quantity_error) { ?>
										<div class="text-danger"><?php echo $quantity_error; ?></div>
									<?php } ?>
								</div>
							</div>							
							<div class="col-sm-12 form-group row required">
								<div class="col-sm-3">
									<label class="control-label col-form-label"><?php echo $text_price; ?></label>
								</div>
								<div class="col-sm-9">
									<input name="price" placeholder="<?php echo $text_price; ?>" type="text" class="form-control" value="<?php echo $price; ?>"/>
									<?php if ($price_error) { ?>
										<div class="text-danger"><?php echo $price_error; ?></div>
									<?php } ?>
								</div>
							</div>
							
							<div class="col-sm-12 form-group  row">
								<div class="col-sm-3">
									<label class="control-label col-form-label"><?php echo $text_stock_status; ?></label>
								</div>
								<div class="col-sm-9">
									<select name="stock_status_id" id="input-stock-status" class="form-control">
										<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == stock_status_id) { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>							
							<div class="col-sm-12 form-group  row">
								<div class="col-sm-3">
									<label class="control-label col-form-label"><?php echo $text_subtract_stock; ?></label>
								</div>
								<div class="col-md-9">
									<select name="subtract" id="input-subtract" class="form-control">
										<?php if ($subtract) { ?>
											<option value="1" selected="selected"><?php echo $text_yes; ?></option>
											<option value="0"><?php echo $text_no; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_yes; ?></option>
											<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>				
							<div class="col-sm-12 form-group  row">
								<div class="col-sm-3">
									<label class="control-label col-form-label"><?php echo $entry_status; ?></label>
								</div>
								<div class="col-sm-9">
									<select name="status" id="input-status" class="form-control">
										<?php if ($status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-12 text-right">
									<input type="submit" class="btn btn-primary" value="Save" />
								</div>
							</div>	
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		var store_name = $('input[name=\'store_name\']').val();
		
		if (store_name) {
			url += '&store_name=' + encodeURIComponent(store_name);
		}
	</script>
	<script type="text/javascript"><!--
		$('input[name=\'store_name\']').autocomplete({
			
			'source': function(request, response) {
				
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/admintemplate/autosellerstore&token=<?php echo $token; ?>&store_name=' +  encodeURIComponent(request),
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
<?php echo $footer; ?>