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
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
				</div>
				<div class="panel-body">
					<div class="pts-well">
						<div class="pts-row">
							<div class="pts-col-sm-4">
								<div class="pts-form-group">
									<label class="pts-control-label" for="input-date-added"><?php echo $entry_date_from; ?></label>
									<div class="input-group date">
										<input type="text" name="filter_date_from" value="<?php echo $filter_date_from; ?>" placeholder="<?php echo $entry_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-date-from" class="pts-form-control" />
										<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
										</span></div>
								</div>
							</div>
							<div class="pts-col-sm-4">
								<div class="pts-form-group">
									<label class="pts-control-label" for="input-date-modified"><?php echo $entry_date_to; ?></label>
									<div class="input-group date">
										<input type="text" name="filter_date_to" value="<?php echo $filter_date_to; ?>" placeholder="<?php echo $entry_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-date-to" class="pts-form-control" />
										<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
										</span></div>
								</div>        
							</div>
							<div class="pts-col-sm-2">
								<label></label>
								<div class="pts-form-group">
									<button type="button" id="button-filter" class="pts-btn pts-btn-primary pts-pull-right ptsc-commison-margin"><i class="fa fa-filter"></i><?php echo $button_filter; ?></button>
								</div>
							</div>
						</div>
					</div>
					<form method="post" action="" enctype="multipart/form-data" id="form-order">
						<div class="pts-table-responsive">
							<table class="pts-table pts-table-bordered pts-table-hover">
								<thead>
									<tr>
										<td class="pts-text-left"><?php echo $text_invoice_id; ?></td>
										<td class="pts-text-left"><?php echo $text_created_at; ?></td>
										<td class="pts-text-left"><?php echo $text_action; ?></td>
									</tr>
								</thead>
								<tbody>
									<?php if ($seller_commissions) { ?>
										<?php foreach ($seller_commissions as $seller_commission) { ?>
											<tr>
												<td class="pts-text-left">#<?php echo $seller_commission['id'] ?> </td>
												<td class="pts-text-left"><?php echo $seller_commission['created_at'] ?></td>
												<td class="pts-text-left"><a href="<?php echo $seller_commission['view'] ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="pts-btn pts-btn-info" target="_blank"><i class="fa fa-eye"></i></a></td>
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
<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/commissioninvoice';
		
		var seller_id = $('input[name=\'seller_id\']').val();
		
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
<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});
//--></script>
<?php echo $footer; ?>