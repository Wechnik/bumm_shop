<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-customer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
	<div class="container-fluid"> <?php if ($error_warning) { ?>
		<!--  <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div> -->
	<?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
		</div>
		<div class="panel-body">
			<form action="" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
				<div class="tab-content">
					<div class="tab-pane active" id="tab-general">
						<div class="row">
							<input type="hidden" name="shipping_id" value="<?php echo $shipping_id; ?>" />
							<div class="col-sm-10">
								<div class="tab-content">
									<div class="tab-pane active" id="tab-customer">
										<fieldset>					
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-filter_name"><?php echo $entry_seller_name; ?></label>
												<div class="col-sm-10 catdivdrop">
													<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" class="form-control" />
													<input type="text" name="filter_name" value="<?php if ($seller_id or $seller_id=='0') { ?><?php echo $filter_name; ?><?php } ?>" placeholder="<?php echo $entry_seller_name; ?>" id="input-name" class="form-control" />
													<?php if ($error_filter_name) { ?>
														<div class="text-danger"><?php echo $error_filter_name; ?></div>
													<?php } ?></div>
											</div>
											
											<!-- country -->
											
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-shipping-country"><?php echo $entry_shipping_country; ?></label>
												<div class="col-sm-10">
													<select name="shipping_country" id="input-shippingcountry" class="form-control"> 
														<option value=""><?php echo $text_select; ?></option>
														<?php foreach ($countries as $country) { ?>
															<?php if ($country['country_id'] == $shipping_country) { ?>
																<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
																<?php } else { ?>
																<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
															<?php } ?>
														<?php } ?>
													</select>
													<?php if ($error_shipping_country ) { ?>
														<div class="text-danger"><?php echo $error_shipping_country; ?></div>
													<?php } ?>
												</div>
											</div>
											
											<!-- country -->
											
											<div class="form-group ">
												<label class="col-sm-2 control-label" for="input-zip-from"><?php echo $entry_zip_from; ?></label>
												<div class="col-sm-10">
													<input type="text" name="zip_from" value="<?php echo $zip_from; ?>" placeholder="<?php echo $entry_zip_from; ?>" id="input-zip-from" class="form-control" />
													<?php if ($error_zip_from) { ?>
														<div class="text-danger"><?php echo $error_zip_from; ?></div>
													<?php } ?></div>
											</div>
											<div class="form-group ">
												<label class="col-sm-2 control-label" for="input-zip-to"><?php echo $entry_zip_to; ?></label>
												<div class="col-sm-10">
													<input type="text" name="zip_to" value="<?php echo $zip_to; ?>" placeholder="<?php echo $entry_zip_to; ?>" id="input-zip-to" class="form-control" />
													<?php if ($error_zip_to) { ?>
														<div class="text-danger"><?php echo $error_zip_to; ?></div>
													<?php } ?></div>
											</div>
											
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-weight-from"><?php echo $entry_weight_from; ?></label>
												<div class="col-sm-10">
													<input type="text" name="weight_from" value="<?php echo $weight_from; ?>" placeholder="<?php echo $entry_weight_from; ?>" id="input-weight-from" class="form-control" />
													<?php if ($error_weight_from) { ?>
														<div class="text-danger"><?php echo $error_weight_from; ?></div>
													<?php } ?></div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-weight-to"><?php echo $entry_weight_to; ?></label>
												<div class="col-sm-10">
													<input type="text" name="weight_to" value="<?php echo $weight_to; ?>" placeholder="<?php echo $entry_weight_to; ?>" id="input-weight-to" class="form-control" />
													<?php if ($error_weight_to) { ?>
														<div class="text-danger"><?php echo $error_weight_to; ?></div>
													<?php } ?></div>
											</div>
											<div class="form-group required">
												<label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
												<div class="col-sm-10">
													<input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
													<?php if ($error_price) { ?>
														<div class="text-danger"><?php echo $error_price; ?></div>
													<?php } ?></div>
											</div>
										</fieldset>
										
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</form>
		</div>
	</div>
	</div>
	<script type="text/javascript"><!--
		$('input[name=\'filter_name\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/shipping/autocompleteseller&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
				$('input[name=\'seller_id\']').val('');
				
			},
			'select': function(item) {
				$('input[name=\'filter_name\']').val(item['label']);
				$('input[name=\'seller_id\']').val(item['value']);
			}	
		});
		
		
	//--></script> 
</div>
<?php echo $footer; ?> 
