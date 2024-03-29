<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" data-toggle="tooltip" id="button-approve" title="<?php echo $button_approve; ?>" formaction="<?php echo $approve; ?>" class="btn btn-success" ><?php echo $button_approve; ?></button>
				<button type="submit" data-toggle="tooltip" id="button-disapprove" title="<?php echo $button_disapprove; ?>" formaction="<?php echo $disapprove; ?>" class="btn btn-danger" ><?php echo $button_disapprove; ?></button>
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
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="input-name"><?php echo $entry_storename; ?></label>
								<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_storename; ?>" id="input-name" class="form-control" />
							</div>
						</div>
						<div class="col-sm-3">	
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $entry_storestatus; ?></label>
								<select name="filter_status" id="input-status" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php if ($filter_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
									<?php if (!$filter_status && !is_null($filter_status)) { ?>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
								<div class="input-group date">
									<input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>              
						</div>
						<div class="col-sm-3 ptsc-storeli-martop">
							<div class="form-group">                 
								<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
							</div>
						</div>
					</div>
				</div>
				<form action="" method="post" enctype="multipart/form-data" id="form-store">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php if ($sort == 'store_name') { ?>
										<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_storename; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_name; ?>"><?php echo $column_storename; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'store_email') { ?>
										<a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_storeemail; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_email; ?>"><?php echo $column_storeemail; ?></a>
									<?php } ?></td>
									<td class="text-left">
										<?php echo $column_storephone; ?>
									</td>
									<td class="text-left">
										<?php echo $column_storeaddress; ?>
									</td>
									<td class="text-left"><?php if ($sort == 'c.name') { ?>
										<a href="<?php echo $sort_seller_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_seller_name; ?>"><?php echo $column_name; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'c.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_storestatus; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $column_storestatus; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'c.date_added') { ?>
										<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($stores) { ?>
									<?php foreach ($stores as $store) { ?>
										<?php if ($store['status']==1) { ?>
											<tr>
												<td class="text-center"><?php if (in_array($store['store_id'], $selected)) { ?>
													<input type="checkbox" name="selected[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="selected[]" value="<?php echo $store['store_id']; ?>" />
												<?php } ?></td>
												<td class="text-left"><?php echo $store['store_name']; ?><?php echo $store['is_removed']; ?></td>
												<td class="text-left"><?php echo $store['store_email']; ?></td>
												<td class="text-left"><?php echo $store['store_phone']; ?></td>
												<td class="text-left"><?php echo $store['store_address']; ?></td>
												<td class="text-left"><a href="<?php echo $store['seller_url']; ?>"><?php echo $store['seller_name']; ?></a></td>
												<td class="text-left"><?php echo $store['store_status']; ?></td>
												<td class="text-left"><?php echo $store['store_created_at']; ?></td>
												<td class="text-right">
												<a href="<?php echo $store['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
											</tr>
										<?php } } ?>
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
		$('#button-approve, #button-disapprove').on('click', function(e) {
			
			if(confirm('<?php echo $text_confirm; ?>')) {
				$('#form-store').attr('action', this.getAttribute('formAction'));   
			}
			else { 
				return false;
			}
		});
		$('#button-filter').on('click', function() {
			url = 'index.php?route=purpletree_multivendor/stores&token=<?php echo $token; ?>';
			
			var filter_name = $('input[name=\'filter_name\']').val();
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			/*var filter_email = $('input[name=\'filter_email\']').val();
				
				if (filter_email) {
				url += '&filter_email=' + encodeURIComponent(filter_email);
			}*/
			
			var filter_customer_group_id = $('select[name=\'filter_customer_group_id\']').val();
			
			if (filter_customer_group_id != '*') {
				url += '&filter_customer_group_id=' + encodeURIComponent(filter_customer_group_id);
			}	
			
			var filter_status = $('select[name=\'filter_status\']').val();
			
			if (filter_status != '*') {
				url += '&filter_status=' + encodeURIComponent(filter_status); 
			}	
			
			var filter_approved = $('select[name=\'filter_approved\']').val();
			
			if (filter_approved != '*') {
				url += '&filter_approved=' + encodeURIComponent(filter_approved);
			}	
			
			var filter_ip = $('input[name=\'filter_ip\']').val();
			
			if (filter_ip) {
				url += '&filter_ip=' + encodeURIComponent(filter_ip);
			}
			
			var filter_date_added = $('input[name=\'filter_date_added\']').val();
			
			if (filter_date_added) {
				url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
			}
			
			location = url;
		});
	//--></script> 
	<script type="text/javascript"><!--
		$('input[name=\'filter_name\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/stores/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
				$('input[name=\'filter_name\']').val(item['label']);
			}	
		});
		
		/*$('input[name=\'filter_email\']').autocomplete({
			'source': function(request, response) {
			$.ajax({
			url: 'index.php?route=purpletree_multivendor/stores/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
			response($.map(json, function(item) {
			return {
			label: item['email'],
			value: item['customer_id']
			}
			}));
			}
			});
			},
			'select': function(item) {
			$('input[name=\'filter_email\']').val(item['label']);
			}	
		});*/
	//--></script> 
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
	//--></script></div>
	<?php echo $footer; ?> 
		