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
			  <div class="pts-pull-right">
					<a href="<?php echo $url; ?>" data-toggle="tooltip" title="<?php echo $button_upload; ?>"><input id="pts_button_upload" type="button" value="<?php echo $button_upload; ?>" class="pts-btn pts-btn-primary" class="button_add ptsc-shipping-add" ></a>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_filter; ?>" onclick="$('#filter-seller').toggleClass('hidden-sm hidden-xs');" class="pts-btn pts-btn-default hidden-md hidden-lg"><i class="fa fa-filter"></i></button>
					<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus"></i></a>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-seller').submit() : false;"><i class="fa fa-trash-o"></i></button>
					<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
				</div>
    </div>
  </div>
			<div class="">
				<div class="pts-row pts-well ptsc-shipping-marlr" >
					<div class="pts-col-sm-4">
						<!-- country -->						
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-shipping-country"><?php echo $entry_shipping_country; ?></label>                       
							<select name="filter_shipping_country" id="input-shippingcountry" class="pts-form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $shipping_country) { ?>
										<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>					  
						<!-- country -->  
						<!--  <div class="form-group">
							<label class="control-label" for="input-shipping-country"><?php echo $entry_shipping_country; ?></label>
							<input type="text" name="filter_shipping_country" value="<?php //echo $filter_shipping_country; ?>" placeholder="<?php //echo $entry_shipping_country; ?>" id="input-email" class="form-control" />
						</div> -->
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-weight-from"><?php echo $entry_weight_from; ?></label>
							<input type="text" name="filter_weight_from" value="<?php echo $filter_weight_from; ?>" placeholder="<?php echo $entry_weight_from; ?>" id="input-weight-from" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-col-sm-4">
						
						<div class="pts-form-group">
							<label class="control-label" for="input-zip-from"><?php echo $entry_zip_from; ?></label>
							<input type="text" name="filter_zip_from" value="<?php echo $filter_zip_from; ?>" placeholder="<?php echo $entry_zip_from; ?>" id="input-zip-from" class="pts-form-control" />
						</div>
						
						<div class="pts-form-group">
							<label class="control-label" for="input-weight-to"><?php echo $entry_weight_to; ?></label>
							<input type="text" name="filter_weight_to" value="<?php echo $filter_weight_to; ?>" placeholder="<?php echo $entry_weight_to; ?>" id="input-weight-to" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="control-label" for="input-zip-to"><?php echo $entry_zip_to; ?></label>
							<input type="text" name="filter_zip_to" value="<?php echo $filter_zip_to; ?>" placeholder="<?php echo $entry_zip_to; ?>" id="input-zip-to" class="pts-form-control" />
						</div>
						<div class="pts-form-group">
							<label class="control-label" for="input-price"><?php echo $entry_price; ?></label>
							<input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
						</div>
						
					</div>
					<div class="col-lg-12 ptsc-shipping-filtermar">
						<button type="button" id="button-filter" class="pts-btn pts-btn-primary pts-pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
					
				</div>
				
				<div>
					<div class="panel panel-default ptsc-geo-margin">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
						</div>
						<div class="panel-body">
							<div class="pts-table-responsive">
								<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-seller">
									<table class="pts-table pts-table-bordered pts-table-hover">
										<thead>
											<tr>
												<td class="pts-text-center ptsc-attr-tab-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
												<td class="pts-text-left"><?php echo $column_shipping_country; ?></td>
												
												<td class="pts-text-left"><?php echo $column_zip_from; ?></td>
												
												<td class="pts-text-left"><?php echo $column_zip_to; ?></td> 
												
												
												<td class="pts-text-left"><?php echo $column_weight_from; ?></td>
												
												<td class="pts-text-left"><?php echo $column_weight_to; ?></td>
												<td class="pts-text-left"><?php echo $column_price; ?></td>
												<!-- <td class="text-right"><?php echo $column_max_days; ?></td> -->
												<td class="pts-text-right"><?php echo $column_action; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php if ($sellers) { ?>
												<?php foreach ($sellers as $seller) { ?>
													<tr>
														<td class="pts-text-center"><?php if(in_array($seller['seller_id'],$selected)) { ?>
															<input type="checkbox" name="selected[]" value="<?php echo $seller['shipping_id']; ?>" checked="checked" />
															<?php } else { ?>
															<input type="checkbox" name="selected[]" value="<?php echo $seller['shipping_id']; ?>" />
														<?php } ?>
														</td>
														<td class="pts-text-left"><?php echo $seller['shipping_country']; ?></td>
														<td class="pts-text-left"><?php echo $seller['zipcode_from']; ?></td>
														<td class="pts-text-left"><?php echo $seller['zipcode_to']; ?></td>
														
														<td class="pts-text-left"><?php echo $seller['weight_from']; ?></td>
														<td class="pts-text-left"><?php echo $seller['weight_to']; ?></td>
														<td class="pts-text-left"><?php echo $seller['shipping_price']; ?></td>
														<!-- <td class="text-left"><?php echo $seller['max_days']; ?></td> -->
														<td class="pts-text-right">
															<div class="btn-group ptsc-subscr-planmwidth">
																<a href="<?php echo $seller['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil"></i></a>
																<a onclick="checkdata(event)" href="<?php echo $seller['deletes']; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-trash-o"></i></a>                     
															</div>
														</td>
													</tr>
												<?php } ?>
												<?php } else { ?>
												<tr>
													<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
												</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							</form>
							<div class="row">
								<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
								<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('.table-responsive').on('shown.bs.dropdown', function (e) {
		var t = $(this),
		m = $(e.target).find('.dropdown-menu'),
		tb = t.offset().top + t.height(),
		mb = m.offset().top + m.outerHeight(true),
		d = 20;
		if (t[0].scrollWidth > t.innerWidth()) {
			if (mb + d > tb) {
				t.css('padding-bottom', ((mb + d) - tb));
			}
			} else {
			t.css('overflow', 'visible');
		}
		}).on('hidden.bs.dropdown', function () {
		$(this).css({'padding-bottom': '', 'overflow': ''});
	});
//--></script>

<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/shipping';
		
		var filter_shipping_country = $('select[name=\'filter_shipping_country\']').val();
		if (filter_shipping_country !== '') {
			url += '&filter_shipping_country=' + encodeURIComponent(filter_shipping_country);
		}
		var filter_zip_from = $('input[name=\'filter_zip_from\']').val();
		if (filter_zip_from) {
			url += '&filter_zip_from=' + encodeURIComponent(filter_zip_from);
		}
		var filter_zip_to = $('input[name=\'filter_zip_to\']').val();
		if (filter_zip_to) {
			url += '&filter_zip_to=' + encodeURIComponent(filter_zip_to);
		}
		var filter_price = $('input[name=\'filter_price\']').val();
		if (filter_price) {
			url += '&filter_price=' + encodeURIComponent(filter_price); 
		}
		var filter_weight_from = $('input[name=\'filter_weight_from\']').val();
		if (filter_weight_from) {
			url += '&filter_weight_from=' + encodeURIComponent(filter_weight_from);
		}
		var filter_weight_to = $('input[name=\'filter_weight_to\']').val();
		if (filter_weight_to) {
			url += '&filter_weight_to=' + encodeURIComponent(filter_weight_to);
		}
		location = url;
	});
//--></script>
<script>
	function checkdata(e){			
		if (confirm("<?php echo $text_confirm; ?>")) {
			
			} else {
			e.preventDefault();
		}	  
	}
</script>
<?php echo $footer; ?>