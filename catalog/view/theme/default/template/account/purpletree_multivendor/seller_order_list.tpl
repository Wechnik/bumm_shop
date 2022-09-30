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
			<div class="pts-well">
				<div class="pts-row">
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-date-added"><?php echo $entry_date_from; ?></label>
							<div class="pts-input-group date">
								<input type="text" name="filter_date_from" value="<?php echo $filter_date_from; ?>" placeholder="<?php echo $entry_date_from; ?>" data-date-format="YYYY-MM-DD" id="input-date-from" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
						</div>
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-date-modified"><?php echo $entry_date_to; ?></label>
							<div class="pts-input-group date">
								<input type="text" name="filter_date_to" value="<?php echo $filter_date_to; ?>" placeholder="<?php echo $entry_date_to; ?>" data-date-format="YYYY-MM-DD" id="input-date-to" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
						</div>        
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
							<select name="filter_order_status" id="input-order-status" class="pts-form-control">
								<option value="*" ><?php echo $text_all; ?></option>
								<?php if ($filter_order_status == '0') { ?>
									<option value="0" selected="selected"><?php echo $text_missing; ?></option>
									<?php } else { ?>
									<option value="0"><?php echo $text_missing; ?></option>
								<?php } ?>
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $filter_order_status) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-admin-order-status"><?php echo $entry_admin_order_status; ?></label>
							<select name="filter_admin_order_status" id="input-admin-order-status" class="pts-form-control">
								<option value="*" ><?php echo $text_all; ?></option>
								<?php if ($filter_admin_order_status == '0') { ?>
									<option value="0" selected="selected"><?php echo $text_missing; ?></option>
									<?php } else { ?>
									<option value="0"><?php echo $text_missing; ?></option>
								<?php } ?>
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $filter_admin_order_status) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				<div class="pts-row">
					<div class="pts-col-sm-10">
						<?php if(!empty($filter_date_from) || !empty($filter_date_to) || !empty($filter_order_status)) { ?>
							<div class="pts-col-sm-4"><?php echo $entry_total_sale; ?> <b><?php echo $total_sale; ?></b></div>
							<div class="pts-col-sm-4"><?php echo $entry_total_pay; ?> <b><?php echo $total_pay; ?></b><p><small><?php echo $for_completed_orders; ?></small></p></div>
							<div class="pts-col-sm-4"><?php echo $entry_total_commission; ?> <b><?php echo $total_commission; ?></b><p><small><?php echo $for_completed_orders; ?></small></p></div>
						<?php } ?>
					</div>
					<div class="pts-col-sm-2">
						<button type="button" id="pts-button-filter" class="pts-btn pts-btn-primary pts-pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
				</div>
			</div>
			<div class="pts-table-responsive">
				<table class="pts-table pts-table-bordered pts-table-hover">
					<thead>
						<tr>
							<td class="pts-text-left"><?php echo $column_order_id; ?></td>
							<td class="pts-text-left"><?php echo $column_customer; ?></td>
							<td class="pts-text-left"><?php echo $column_status; ?></td>
							<td class="pts-text-left"><?php echo $column_admin_status; ?></td>
							<td class="pts-text-left"><?php echo $column_commissions; ?></td>
							<td class="pts-text-left"><?php echo $column_total; ?></td>
							<td class="pts-text-left"><?php echo $column_date_added; ?></td>
							<td class="pts-text-left"><?php echo $column_date_modified; ?></td>
							<td class="pts-text-left"><?php echo $column_action; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php if ($seller_orders) { ?>
							<?php foreach ($seller_orders as $order) { ?>
								<tr <?php if ($order['seen']) { ?> class="pts-neworder" <?php } ?>>
									<td class="pts-text-left"><?php echo $order['order_id']; ?></td>
									<td class="pts-text-left"><?php echo $order['customer']; ?></td>
									<td class="pts-text-left"><?php echo $order['order_status']; ?></td>
									<td class="pts-text-left"><?php echo $order['admin_order_status']; ?></td>
									<td class="pts-text-left"><?php echo $order['commission']; ?></td>
									<td class="pts-text-left"><?php echo $order['total']; ?></td>
									<td class="pts-text-left"><?php echo $order['date_added']; ?></td>
									<td class="pts-text-left"><?php echo $order['date_modified']; ?></td>
									<td class="pts-text-left"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="pts-btn pts-btn-info"><i class="fa fa-eye"></i></a></td>
								</tr>
							<?php } ?>
							<?php } else { ?>
							<tr>
								<td class="pts-text-center" colspan="9"><?php echo $text_no_results; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
			<div class="pts-row">
				<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
				<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#pts-button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/sellerorder';
		
		var filter_order_status = $('select[name=\'filter_order_status\']').val();
		var filter_admin_order_status = $('select[name=\'filter_admin_order_status\']').val();
		
		if (filter_order_status != '*') {
			url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
		}
		
		if (filter_admin_order_status != '*') {
			url += '&filter_admin_order_status=' + encodeURIComponent(filter_admin_order_status);
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