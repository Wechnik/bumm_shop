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
			  <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
    </div>
  </div>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="pts-form-horizontal">
				<ul class="pts-nav pts-nav-tabs">
					<!--tabs -->
					<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo 'General'; ?></a></li>
					<?php if ($coupon_id) { ?>
						<li><a href="#tab-history" data-toggle="tab"><?php echo 'History'; ?></a></li>
					<?php } ?>
				</ul>
				<div class="pts-tab-content">
					<div class="pts-tab-pane active" id="tab-general">
						<div class="pts-tab-content">	
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-sort-order"><?php echo $entry_name; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-sort-order" class="pts-form-control" />
								</div>
							</div>			  
						</div>        
						<div class="pts-tab-content">	
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-sort-order"><?php echo $entry_code; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="code" value="<?php echo $code; ?>" placeholder="<?php echo $entry_code; ?>" id="input-sort-order" class="pts-form-control" />
								</div>
							</div>			  
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-type"><span data-toggle="tooltip" title="<?php echo $help_type; ?>"><?php echo $entry_type; ?></span></label>
							<div class="pts-col-sm-10">
								<select name="type" id="input-type" class="pts-form-control">
									<?php if ($type == 'P') { ?>
										<option value="P" selected="selected"><?php echo $text_percent; ?></option>
										<?php } else { ?>
										<option value="P"><?php echo $text_percent; ?></option>
									<?php } ?>
									<?php if ($type == 'F') { ?>
										<option value="F" selected="selected"><?php echo $text_amount; ?></option>
										<?php } else { ?>
										<option value="F"><?php echo $text_amount; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="pts-tab-content">	
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-sort-order"><?php echo $entry_discount; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="discount" value="<?php echo $discount; ?>" placeholder="<?php echo $entry_discount; ?>" id="input-sort-order" class="pts-form-control" />
								</div>
							</div>			  
						</div>		
						<div class="pts-tab-content">	
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-sort-order"><?php echo $entry_total; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="total" value="<?php echo $total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-sort-order" class="pts-form-control" />
								</div>
							</div>			  
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label"><span data-toggle="tooltip" title="<?php echo $help_logged; ?>"><?php echo $entry_logged; ?></span></label>
							<div class="pts-col-sm-10">
								<label class="pts-radio-inline">
									<?php if ($logged) { ?>
										<input type="radio" name="logged" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="logged" value="1" />
										<?php echo $text_yes; ?>
									<?php } ?>
								</label>
								<label class="pts-radio-inline">
									<?php if (!$logged) { ?>
										<input type="radio" name="logged" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="logged" value="0" />
										<?php echo $text_no; ?>
									<?php } ?>
								</label>
							</div>
						</div>	
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_shipping; ?></label>
							<div class="pts-col-sm-10">
								<label class="pts-radio-inline">
									<?php if ($shipping) { ?>
										<input type="radio" name="shipping" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="shipping" value="1" />
										<?php echo $text_yes; ?>
									<?php } ?>
								</label>
								<label class="pts-radio-inline">
									<?php if (!$shipping) { ?>
										<input type="radio" name="shipping" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="shipping" value="0" />
										<?php echo $text_no; ?>
									<?php } ?>
								</label>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product; ?></span></label>
							<div class="pts-col-sm-10">
								<input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="pts-form-control" />
								<div id="coupon-product" class="pts-well pts-well-sm ptsc-coupon-heiover">
									<?php foreach ($coupon_product as $coupon_product) { ?>
										<div id="coupon-product<?php echo $coupon_product['product_id']; ?>"><i class="pts-fa pts-fa-minus-circle"></i> <?php echo $coupon_product['name']; ?>
											<input type="hidden" name="coupon_product[]" value="<?php echo $coupon_product['product_id']; ?>" />
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
							<div class="pts-col-sm-10">
								<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="pts-form-control" />
								<div id="coupon-category" class="pts-well pts-well-sm ptsc-coupon-heiover">
									<?php foreach ($coupon_category as $coupon_category) { ?>
										<div id="coupon-category<?php echo $coupon_category['category_id']; ?>"><i class="pts-fa fa-minus-circle"></i> <?php echo $coupon_category['name']; ?>
											<input type="hidden" name="coupon_category[]" value="<?php echo $coupon_category['category_id']; ?>" />
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
							<div class="pts-col-sm-3">
								<div class="pts-input-group date">
									<input type="text" name="date_start" value="<?php echo $date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="pts-form-control" />
									<span class="pts-input-group-btn">
										<button type="button" class="pts-btn btn-default"><i class="pts-fa fa-calendar"></i></button>
									</span></div>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
							<div class="pts-col-sm-3">
								<div class="pts-input-group date">
									<input type="text" name="date_end" value="<?php echo $date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="pts-form-control" />
									<span class="pts-input-group-btn">
										<button type="button" class="pts-btn btn-default"><i class="pts-fa fa-calendar"></i></button>
									</span></div>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-uses-total"><span data-toggle="tooltip" title="<?php echo $help_uses_total; ?>"><?php echo $entry_uses_total; ?></span></label>
							<div class="pts-col-sm-10">
								<input type="text" name="uses_total" value="<?php echo $uses_total; ?>" placeholder="<?php echo $entry_uses_total; ?>" id="input-uses-total" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-uses-customer"><span data-toggle="tooltip" title="<?php echo $help_uses_customer; ?>"><?php echo $entry_uses_customer; ?></span></label>
							<div class="pts-col-sm-10">
								<input type="text" name="uses_customer" value="<?php echo $uses_customer; ?>" placeholder="<?php echo $entry_uses_customer; ?>" id="input-uses-customer" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-status"><?php echo $entry_status; ?></label>
							<div class="pts-col-sm-10">
								<select name="status" id="input-status" class="pts-form-control">
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
					</div>	          
					<?php if ($coupon_id) { ?>
						<div class="pts-tab-pane" id="tab-history">
							<fieldset>
								<div id="history"></div>
							</fieldset>
						</div>
					<?php } ?>
				</div>
				<div class="buttons clearfix ptsc-coupon-clear">
					<div class="pts-pull-left"><a href="<?php echo $back; ?>" class="pts-btn pts-btn-default"><?php echo $button_back; ?></a></div>
					<div class="pts-pull-right">
						<input type="submit" value="<?php echo $button_continue; ?>" class="pts-btn pts-btn-primary" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('input[name=\'product\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/product&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'product\']').val('');
			
			$('#coupon-product' + item['value']).remove();
			
			$('#coupon-product').append('<div id="coupon-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="coupon_product[]" value="' + item['value'] + '" /></div>');	
		}
	});
	$('#coupon-product').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
	$('input[name=\'category\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/category&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['category_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'category\']').val('');
			
			$('#coupon-category' + item['value']).remove();
			
			$('#coupon-category').append('<div id="coupon-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="coupon_category[]" value="' + item['value'] + '" /></div>');
		}	
	});
	
	$('#coupon-category').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
</script> 
<script type="text/javascript">
	$('.date').datetimepicker({
		pickTime: false
	});
	
	$('.time').datetimepicker({
		pickDate: false
	});
	
	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});
</script>

<?php echo $footer; ?>