<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-contact').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
								<label class="control-label" for="input-product"><?php echo $text_customer_name; ?></label>
								<input type="text" name="filter_customer_name" value="<?php echo $filter_customer_name; ?>" placeholder="<?php echo $text_customer_name; ?>" id="input-product" class="form-control" />
							</div>
							<div class="form-group">
								<label class="control-label" for="input-author"><?php echo $text_seller_name; ?></label>
								<input type="text" name="filter_seller_name" value="<?php echo $filter_seller_name; ?>" placeholder="<?php echo $text_seller_name; ?>" id="input-author" class="form-control" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $text_email; ?></label>
								<input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $text_email; ?>" id="input-author" class="form-control" />
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
					
					<div class="colorcoding">
						<div class="sellercolor">
							<div class="bluecolor"> </div>
							<?php echo $text_seller_to_customer ?>
						</div>
						<div class="sellercolor ptsc-sellercont-margtop"> 
							<div class="greencolor"></div>
							<?php echo $text_customer_to_seller ?>
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
									<td class="text-left"><?php echo '<i class="fa fa-arrows-h ptsc-sellcont-forntsize"></i>'; ?></td>
									<td class="text-left"><?php echo $text_customer_name; ?></td>
									<td class="text-left"><?php echo $text_email; ?></td>
									<td class="text-left"><?php echo $text_description; ?></td>
									<td class="text-left"><?php echo $text_date_added; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($sellercontacts) { ?>
									<?php foreach ($sellercontacts as $sellercontact) { ?>
										<?php $x=$sellercontact['contact_from']?'To':'From'; ?>
										<?php $y=$sellercontact['contact_from']?'<i class="fa fa-arrow-right"></i>':'<i class="fa fa-arrow-left"></i>'; ?>
										<tr class="<?php echo ' '.$x; ?>">
											<td class="text-center"><?php if (in_array($sellercontact['id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $sellercontact['id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $sellercontact['id']; ?>" />
											<?php } ?></td>
											<td class="text-left"><?php echo $sellercontact['seller_name']; ?></td>
											<td class="text-left"><?php echo $y;?> </td>
											<td class="text-left"><?php echo $sellercontact['customer_name']; ?></td>
											<td class="text-left"><?php echo $sellercontact['customer_email']; ?></td>
											<td class="text-left"><?php echo $sellercontact['customer_message']; ?></td>
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
			url = 'index.php?route=purpletree_multivendor/sellercontacts&token=<?php echo $token; ?>';
			
			var filter_customer_name = $('input[name=\'filter_customer_name\']').val();
			
			if (filter_customer_name) {
				url += '&filter_customer_name=' + encodeURIComponent(filter_customer_name);
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
	<style type="text/css">
		.To{background-color: #e6ffe6;}
		.From{background-color: #e6e6ff !important;}
		.bluecolor {
		background: #e6ffe6;
		}	
		.greencolor {
	    background: #e6e6ff;
		}
		.sellercolor div {
		width: 42px;
		height: 15px;
		float: left;
		margin-right: 10px;
		margin-top: 2px;
		border:1px solid #000;
		
		}
		
	</style>	