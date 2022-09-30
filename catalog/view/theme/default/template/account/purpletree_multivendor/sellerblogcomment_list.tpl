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
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-comment').submit() : false;"><i class="fa fa-trash-o"></i></button>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div class="">
				<div class="panel panel-default" >
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
					</div>
					<div class="panel-body">
						<div class="pts-well">
							<div class="pts-row">
								<div class="pts-col-sm-12">
									<div class="pts-col-sm-4">
										<div class="pts-form-group">
											<label class="pts-control-label" for="input-product"><?php echo $entry_post; ?></label>
											<input type="text" name="filter_post" value="<?php echo $filter_post; ?>" placeholder="<?php echo $entry_post; ?>" id="input-post" class="pts-form-control" />
										</div>
									</div>
									<div class="pts-col-sm-2">
										<div class="pts-form-group">
											<label class="pts-control-label" for="input-status"><?php echo $entry_status; ?></label>
											<select name="filter_status" id="input-status" class="pts-form-control">
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
									<div class="pts-col-sm-3">
										<div class="pts-form-group">
											<label class="pts-control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
											<div class="input-group date">
												<input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="pts-form-control" />
												<span class="input-group-btn">
													<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
												</span></div>
										</div>
									</div>
									<div class="pts-col-sm-3 text-right">
										<button type="button" id="button-filter" class="pts-btn pts-btn-primary ptsc-blog-martop"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
									</div>
								</div>
							</div>
						</div>
						<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-comment">
							<div class="pts-table-responsive">
								<table class="pts-table pts-table-bordered pts-table-hover">
									<thead>
										<tr>
											<td class="text-center ptsc-attr-tab-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
											<td class="pts-text-left"><?php echo $column_post; ?></td>
											<td class="pts-text-left"><?php echo $column_name; ?></td>
											<td class="pts-text-center"><?php echo $column_email; ?></td>
											<td class="pts-text-left"><?php echo $column_status; ?></td>
											<td class="pts-text-left"><?php echo $column_date_added; ?></td>
											<td class="pts-text-right"><?php echo $column_action; ?></td>
										</tr>
									</thead>
									<tbody>
										<?php if ($comments) { ?>
											<?php foreach ($comments as $comment) { ?>
												<tr>
													<td class="text-center"><?php if (in_array($comment['comment_id'], $selected)) { ?>
														<input type="checkbox" name="selected[]" value="<?php echo $comment['comment_id']; ?>" checked="checked" />
														<?php } else { ?>
														<input type="checkbox" name="selected[]" value="<?php echo $comment['comment_id']; ?>" />
													<?php } ?></td>
													<td class="pts-text-left"><?php echo $comment['post']; ?></td>
													<td class="pts-text-left"><?php echo $comment['name']; ?></td>
													<td class="pts-text-right"><?php echo $comment['email_id']; ?></td>
													<td class="pts-text-left"><?php echo $comment['status']; ?></td>
													<td class="pts-text-left"><?php echo $comment['date_added']; ?></td>
													<td class="pts-text-right"><a href="<?php echo $comment['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
												</tr>
											<?php } ?>
											<?php } else { ?>
											<tr>
												<td class="pts-text-center" colspan="7"><?php echo $text_no_results; ?></td>
											</tr>
										<?php } ?>
									</tbody>
								</table>
							</div>
						</form>
						<div class="pts-row">
							<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
							<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/sellerblogcomment';
		
		var filter_post = $('input[name=\'filter_post\']').val();
		
		if (filter_post) {
			url += '&filter_post=' + encodeURIComponent(filter_post);
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
</div>
<?php echo $footer; ?>