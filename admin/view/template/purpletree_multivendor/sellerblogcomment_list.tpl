<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-comment').submit() : false;"><i class="fa fa-trash-o"></i></button>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
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
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="form-group catdivdroppp">
									<input type="hidden" name="filter_seller_id" value="<?php echo $filter_seller_id; ?>" class="form-control" />
									<label class="control-label" for="input-name"><?php echo $entry_seller_store; ?></label>
									
									<input type="text" name="filter_store_name" value="<?php echo $filter_store_name; ?>" placeholder="<?php echo $entry_seller_store; ?>" id="input-name" class="form-control" />				
								</div>
							</div>
							
							<div class="col-sm-3">
								<div class="form-group">
									<label class="control-label" for="input-product"><?php echo $entry_post; ?></label>
									<input type="text" name="filter_post" value="<?php echo $filter_post; ?>" placeholder="<?php echo $entry_post; ?>" id="input-post" class="form-control" />
								</div>				
							</div>
							
							<div class="col-sm-2">
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
									<label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
									<div class="input-group date">
										<input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
										<span class="input-group-btn">
											<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										</span></div>
								</div>
							</div>
							<div class="col-sm-1">
							<button type="button" id="button-filter" class="btn btn-primary ptsc-sellerblog-margtopp"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
				</div>
			</div>
			<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-comment">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><?php echo $column_post; ?></td>
								<td class="text-left"><?php echo $column_name; ?></td>
								<td class="text-center"><?php echo $column_email; ?></td>
								<td class="text-center"><?php echo $column_seller_store; ?></td>
								<td class="text-left"><?php echo $column_status; ?></td>
								<td class="text-left"><?php echo $column_date_added; ?></td>
								<td class="text-right"><?php echo $column_action; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php if(!empty($comments)) { ?>
								<?php foreach ($comments as $comment) { ?>
									<tr>
										<td class="text-center"><?php if (in_array($comment['comment_id'], $selected)) { ?>
											<input type="checkbox" name="selected[]" value="<?php echo $comment['comment_id']; ?>" checked="checked" />
											<?php } else { ?>
											<input type="checkbox" name="selected[]" value="<?php echo $comment['comment_id']; ?>" />
										<?php } ?></td>
										<td class="text-left"><?php echo $comment['post']; ?></td>
										<td class="text-left"><?php echo $comment['name']; ?></td>
										<td class="text-right"><?php echo $comment['email_id']; ?></td>
										<td class="text-right"><?php echo $comment['seller_store']; ?></td>
										<td class="text-left"><?php echo $comment['status']; ?></td>
										<td class="text-left"><?php echo $comment['date_added']; ?></td>
										<td class="text-right"><a href="<?php echo $comment['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
									</tr>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
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
		url = 'index.php?route=purpletree_multivendor/sellerblogcomment&token=<?php echo $token; ?>';
		
		var filter_post = $('input[name=\'filter_post\']').val();
		
		if (filter_post) {
			url += '&filter_post=' + encodeURIComponent(filter_post);
		}
		
		
		
		var filter_store_name = $('input[name=\'filter_store_name\']').val();
		
		if (filter_store_name) {
			url += '&filter_store_name=' + encodeURIComponent(filter_store_name);
			var filter_seller_id = $('input[name=\'filter_seller_id\']').val();
			
			if (filter_seller_id) {
				url += '&filter_seller_id=' + encodeURIComponent(filter_seller_id);
			}
		}
		
		var filter_status = $('select[name=\'filter_status\']').val();
		
		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status); 
		}		
		
		var filter_date_added = $('input[name=\'filter_date_added\']').val();
		
		if (filter_date_added) {
			url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
		}
		
		location = url;
	});
//--></script> 
<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_store_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=purpletree_multivendor/sellerblogpost/autosellerstore&token=<?php echo $token; ?>&filter_store_name=' +  encodeURIComponent(request),
				
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
			$('input[name=\'filter_store_name\']').val(item['label']);
			$('input[name=\'filter_seller_id\']').val(item['value']);
		}	
	});
	
	
//--></script> 

</div>
<?php echo $footer; ?>