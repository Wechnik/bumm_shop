<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
			<div class="pull-right float-right">
            <a href="<?php echo $addnewcustomer['href']; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
			<?php if ($helpcheck) { ?>
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a> -->				
			<?php } ?>				
            </div>
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
								<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							</div>
							<?php if(isset($purpletree_multivendor_subscription_plans)){ ?>
								<div class="form-group">
									<label class="control-label" for="input-subscribed-status"><?php echo $entry_subscription_status; ?></label>
									<select name="filter_subscribed_status" id="input-subscribed-status" class="form-control">
										
										<option value="*"><?php echo $text_all; ?></option>
										<option <?php if ($filter_subscribed_status == '1'){ ?> selected="selected" <?php } ?> value="1" ><?php echo $entry_subscribed; ?></option>
										<option <?php if ($filter_subscribed_status == '0') {?> selected="selected" <?php } ?> value="0"><?php echo $entry_not_subscribed; ?></option>
										
										
									</select>
								</div>
							<?php } ?>
						</div>
						
						<div class="col-sm-3">	
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
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
								<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
								<input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
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
							<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
				</div>
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php if ($sort == 'name') { ?>
										<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'c.email') { ?>
										<a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'c.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php echo $column_store_name; ?></td>
									<td class="text-left"><?php if ($sort == 'c.date_added') { ?>
										<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($vendors) { ?>
									<?php foreach ($vendors as $vendor) { ?>
										<?php if ($vendor['status_id']==1) { ?>
											<tr>
												<td class="text-center"><?php if (in_array($vendor['seller_id'], $selected)) { ?>
													<input type="checkbox" name="selected[]" value="<?php echo $vendor['seller_id']; ?>" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="selected[]" value="<?php echo $vendor['seller_id']; ?>" />
												<?php } ?></td>
												<td class="text-left"><?php echo $vendor['name']; ?></td>
												<td class="text-left"><?php echo $vendor['email']; ?></td>
												<td class="text-left"><?php echo $vendor['status']; ?></td>
												<td class="text-left"><?php echo $vendor['store_name']; ?></td>
												<td class="text-left"><?php echo $vendor['date_added']; ?></td>
												<td class="text-right">                   
													<?php if (isset($purpletree_multivendor_subscription_plans)) { ?>
														<?php if ($vendor['hasPlan'] == '') { ?>
															<a href="<?php echo $vendor['plan']; ?>" data-toggle="tooltip" title="<?php echo $entry_add_susbcription; ?>" class="btn btn-default"><i class="fa fa-plus"></i></a>
															<?php } else { ?>
															<a href="<?php echo $vendor['plan1']; ?>" data-toggle="tooltip" title="<?php echo $entry_view_susbcription; ?>" class="btn btn-success"><i class="fa fa-eye"></i></a>
														<?php } ?>
													<?php } ?>
													<a href="<?php echo $vendor['send_message']; ?>" data-toggle="tooltip" title="<?php echo $button_send_massage; ?>" class="btn btn-primary"><i class="fa fa-comments-o pts_sms" ></i></a>
													<a href="<?php echo $vendor['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
													<a href="<?php echo $vendor['delete']; ?>" id="confirm-for-delete" data-toggle="tooltip"  title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
												</td>               
											</tr>
										<?php } } ?>
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
	<script type="text/javascript">
		
		/* $('#confirm-for-delete').click(function (e) { if(!confirm('Do you want to delete?')){ e.preventDefault(); } }); */
		
	</script>
	<script type="text/javascript"><!--
		$('#button-filter').on('click', function() {
			url = 'index.php?route=purpletree_multivendor/vendor&token=<?php echo $token; ?>';
			
			var filter_name = $('input[name=\'filter_name\']').val();
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			var filter_email = $('input[name=\'filter_email\']').val();
			
			if (filter_email) {
				url += '&filter_email=' + encodeURIComponent(filter_email);
			}	
			
			var filter_status = $('select[name=\'filter_status\']').val();
			
			if (filter_status != '*') {
				url += '&filter_status=' + encodeURIComponent(filter_status); 
			}	
			var filter_subscribed_status = $('select[name=\'filter_subscribed_status\']').val();
			
			if (filter_subscribed_status != '*') {
				url += '&filter_subscribed_status=' + encodeURIComponent(filter_subscribed_status); 
			}	
			var filter_approved = $('select[name=\'filter_approved\']').val();
			
			if (filter_approved != '*') {
				url += '&filter_approved=' + encodeURIComponent(filter_approved);
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
					url: 'index.php?route=purpletree_multivendor/vendor/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
		
		$('input[name=\'filter_email\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/vendor/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
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
		});
	//--></script> 
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
	//--></script></div>
	<?php echo $footer; ?> 
		