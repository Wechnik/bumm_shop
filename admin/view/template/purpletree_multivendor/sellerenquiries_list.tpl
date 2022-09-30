<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $send_all_message; ?>" data-toggle="tooltip" title="<?php echo $text_sendtoall; ?>" class="btn btn-success"><?php echo $text_sendtoall; ?></a>
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
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-product"><?php echo $text_seller_name; ?></label>
								<input type="text" name="filter_seller_name" value="<?php echo $filter_seller_name; ?>" placeholder="<?php echo $text_seller_name; ?>" id="input-product" class="form-control" />
							</div>
							<div class="form-group">
								<label class="control-label" for="input-author"><?php echo $text_store_name; ?></label>
								<input type="text" name="filter_store_name" value="<?php echo $filter_store_name; ?>" placeholder="<?php echo $text_store_name; ?>" id="input-author" class="form-control" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $text_email; ?></label>
								<input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $text_email; ?>" id="input-author" class="form-control" />
							</div>
							<div class="form-group">
								<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
							</div>
						</div>
					</div>
				</div>
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-contact">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php echo $text_seller_name; ?></td>
									<td class="text-left"><?php echo $text_store_name; ?></td>
									<td class="text-left"><?php echo $text_email; ?></td>
									<td class="text-left"><?php echo $text_description; ?></td>
									<td class="text-left"><?php echo $text_date_added; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($sellerenquiries) { ?>
									<?php foreach ($sellerenquiries as $sellercontact) { ?>
										<tr>
											<td class="text-center"><?php if (in_array($sellercontact['id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $sellercontact['id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $sellercontact['id']; ?>" />
											<?php } ?></td>
											<td class="text-left"><?php echo $sellercontact['seller_name']; ?></td>
											<td class="text-left"><?php echo $sellercontact['store_name']; ?></td>
											<td class="text-left"><?php echo $sellercontact['email']; ?></td>
											<td class="text-left"><?php echo $sellercontact['message']; ?></td>
											<td class="text-left"><?php echo $sellercontact['date_added']; ?></td>
											<td class="text-right"><a href="<?php echo $sellercontact['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
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
			url = 'index.php?route=purpletree_multivendor/sellerenquiries&token=<?php echo $token; ?>';
			
			var filter_store_name = $('input[name=\'filter_store_name\']').val();
			
			if (filter_store_name) {
				url += '&filter_store_name=' + encodeURIComponent(filter_store_name);
			}
			
			var filter_seller_name = $('input[name=\'filter_seller_name\']').val();
			
			if (filter_seller_name) {
				url += '&filter_seller_name=' + encodeURIComponent(filter_seller_name);
			}
			
			var filter_email = $('input[name=\'filter_email\']').val();
			
			if (filter_email) {
				url += '&filter_email=' + encodeURIComponent(filter_email);
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
	