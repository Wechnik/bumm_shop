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
			  <div class="pull-right">
				<button type="submit" form="form-customer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div class="panel panel-default" >
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
				</div>
				<div class="panel-body">
					<form action="" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
						<div class="pts-tab-content">
							<div class="tab-pane active" id="tab-general">
								<div class="row">
									
									<div class="col-sm-10">
										<div class="pts-tab-content">
											<div class="tab-pane active" id="tab-customer">
												<fieldset>
													<input type="hidden" name="shipping_id" value="<?php echo $shipping_id; ?>"/>
													<!-- country -->
													
													<div class="form-group required">
														<label class="col-sm-2 control-label" for="input-storecountry"><?php echo $entry_shipping_country; ?></label>
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
													
													<div class="form-group required">
														<label class="col-sm-2 control-label" for="input-zip-from"><?php echo $entry_zip_from; ?></label>
														<div class="col-sm-10">
															<input type="text" name="zip_from" value="<?php echo $zip_from; ?>" placeholder="<?php echo $entry_zip_from; ?>" id="input-zip-from" class="form-control" />
															<?php if ($error_zip_from) { ?>
																<div class="text-danger"><?php echo $error_zip_from; ?></div>
															<?php } ?></div>
													</div>
													<div class="form-group required">
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
	</div>
</div>
<?php echo $footer; ?>