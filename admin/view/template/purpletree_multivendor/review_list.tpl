<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-review').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-product"><?php echo $text_customer_name; ?></label>
								<input type="text" name="filter_customer_name" value="<?php echo $filter_customer_name; ?>" placeholder="<?php echo $text_customer_name; ?>" id="input-product" class="form-control" />
							</div>
							<div class="form-group">
								<label class="control-label" for="input-author"><?php echo $text_title; ?></label>
								<input type="text" name="filter_title" value="<?php echo $filter_title; ?>" placeholder="<?php echo $text_title; ?>" id="input-author" class="form-control" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $text_status; ?></label>
								<select name="filter_status" id="input-status" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php if ($filter_status) { ?>
										<option value="1" selected="selected"><?php echo $text_approved; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_approved; ?></option>
									<?php } ?>
									<?php if (!$filter_status && !is_null($filter_status)) { ?>
										<option value="0" selected="selected"><?php echo $text_notapproved; ?></option>
										<?php } else { ?>
										<option value="0"><?php echo $text_notapproved; ?></option>
									<?php } ?>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label" for="input-date-added"><?php echo $text_date_added; ?></label>
								<div class="input-group date">
									<input type="text" name="filter_created_at" value="<?php echo $filter_created_at; ?>" placeholder="<?php echo $text_date_added; ?>" data-date-format="YYYY-MM-DD" id="created_at" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
									<input type="hidden" name="seller_id" value="<?php echo $seller_id;?>">
							</div>
							<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
				</div>
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-review">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php if ($sort == 'c.customer_name') { ?>
										<a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_customer_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_customer; ?>"><?php echo $text_customer_name; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'c.customer_name') { ?>
										<a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_seller_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_customer; ?>"><?php echo $text_store_name; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'r.author') { ?>
										<a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_title; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_title; ?>"><?php echo $text_title; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php if ($sort == 'r.rating') { ?>
										<a href="<?php echo $sort_rating; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_rating; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_rating; ?>"><?php echo $text_rating; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'r.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_status; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $text_status; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'r.date_added') { ?>
										<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_date_added; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_date_added; ?>"><?php echo $text_date_added; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($reviews) { ?>
									<?php foreach ($reviews as $review) { ?>
										<tr>
											<td class="text-center"><?php if (in_array($review['id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $review['id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $review['id']; ?>" />
											<?php } ?></td>
											<td class="text-left"><?php echo $review['customer_name']; ?></td>
											<td class="text-left"><?php echo $review['store_name']; ?></td>
											<td class="text-left"><?php echo $review['review_title']; ?></td>
											<td class="text-right"><?php echo $review['rating']; ?></td>
											<td class="text-left"><?php echo $review['status']; ?></td>
											<td class="text-left"><?php echo $review['date_added']; ?></td>
											<td class="text-right"><a href="<?php echo $review['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
										</tr>
									<?php } ?>
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
	<script type="text/javascript"><!--
		$('#button-filter').on('click', function() {
			url = 'index.php?route=purpletree_multivendor/sellerreviews&token=<?php echo $token; ?>';
			
			var seller_id = $('input[name=\'seller_id\']').val();
			
			if (seller_id) {
				url += '&seller_id=' + encodeURIComponent(seller_id);
			}
			
			var filter_customer_name = $('input[name=\'filter_customer_name\']').val();
			
			if (filter_customer_name) {
				url += '&filter_customer_name=' + encodeURIComponent(filter_customer_name);
			}
			
			var filter_title = $('input[name=\'filter_title\']').val();
			
			if (filter_title) {
				url += '&filter_title=' + encodeURIComponent(filter_title);
			}
			
			var filter_status = $('select[name=\'filter_status\']').val();
			
			if (filter_status != '*') {
				url += '&filter_status=' + encodeURIComponent(filter_status); 
			}		
			
			var filter_created_at = $('input[name=\'filter_created_at\']').val();
			
			if (filter_created_at) {
				url += '&filter_created_at=' + encodeURIComponent(filter_created_at);
			}
			
			location = url;
		});
	//--></script> 
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
	//--></script></div>
	<?php echo $footer; ?>	