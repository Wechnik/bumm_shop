<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		 <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
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
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<div class="well">
					<div class="row">
						<!--Seller filter  -->
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-store"><?php echo $entry_store; ?></label>	 
								<select name="seller_store" id="input-store" class="form-control">
									<option value=""><?php echo $entry_select_store; ?></option>
									<?php foreach ($seller_stores as $seller_store) { ?>				
										<?php if ($seller_store['seller_id'] == $seller_id) { ?>			
											<option value="<?php echo $seller_store['seller_id']; ?>"selected="selected"
											><?php echo $seller_store['store_name']; ?></option>	
											<?php } else { ?> 	
											<option value="<?php echo $seller_store['seller_id']; ?>"><?php echo  $seller_store['store_name']; ?></option>
										<?php } ?>							
									<?php } ?>
								</select>
							</div>
						</div>
						<!-- seller filter -->
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="input-date-added"><?php echo $entry_date_from; ?></label>
								<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>">
								<div class="input-group date">
									<input type="text" name="filter_date_from" value="<?php echo $filter_date_from; ?>" placeholder="<?php echo $entry_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-date-from" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="input-date-modified"><?php echo $entry_date_to; ?></label>
								<div class="input-group date">
									<input type="text" name="filter_date_to" value="<?php echo $filter_date_to; ?>" placeholder="<?php echo $entry_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-date-to" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>        
						</div>
						<div class="col-sm-2">
							<label></label>
							<div class="form-group">
								<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i><?php echo $button_filter; ?></button>
							</div>
						</div>
					</div>
				</div>
				<form method="post" action="" enctype="multipart/form-data" id="form-order">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left"><?php echo $text_invoice_id; ?></td>
									<td class="text-left"><?php echo $column_store; ?></td>
									<td class="text-left"><?php echo $text_created_at; ?></td>
									<td class="text-left"><?php echo $text_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($seller_commissions) { ?>
									<?php foreach ($seller_commissions as $seller_commission) { ?>
										<tr>
											<td class="text-left">#<?php echo $seller_commission['id']; ?></td>
											<td class="text-left"><?php echo $seller_commission['store_name']; ?></td>
											<td class="text-left"><?php echo $seller_commission['created_at']; ?></td>
											<td class="text-left"><a href="<?php echo $seller_commission['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
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
			url = 'index.php?route=purpletree_multivendor/commissioninvoice&token=<?php echo $token; ?>';
			
			var seller_id = $('select[name=\'seller_store\']').val();
			
			if (seller_id) {
				url += '&seller_id=' + encodeURIComponent(seller_id);
			}
			
			var filter_date_from = $('input[name=\'filter_date_from\']').val();
			
			if (filter_date_from) {
				url += '&filter_date_from=' + encodeURIComponent(filter_date_from);
			}
			
			var filter_date_to = $('input[name=\'filter_date_to\']').val();
			
			if (filter_date_to) {
				url += '&filter_date_to=' + encodeURIComponent(filter_date_to);
			}
			
			location = url;
		});
	//--></script> 
	<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});
	//--></script></div>
	<?php echo $footer; ?>	