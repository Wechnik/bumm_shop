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
				<div class="pts-col-sm-2">
					<label class="pts-control-label"></label>
					<div class="pts-form-group">
						<button type="button" id="pts-button-filter" class="pts-btn pts-btn-primary pts-pull-right ptsc-commison-margin"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
				</div>
			</div>				
			<?php if ($seller_commissions) { ?>
				<div class="pts-table-responsive">
					<table class="pts-table pts-table-bordered pts-table-hover">
						<thead>
							<tr>
								<td class="pts-text-left"><?php echo $text_order_id; ?></td>
								<td class="pts-text-left"><?php echo $text_product_id; ?></td>
								<td class="pts-text-left"><?php echo $text_product_price; ?></td>
								<td class="pts-text-left"><?php echo $text_commission; ?></td>
								<td class="pts-text-left"><?php echo $text_created_at; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($seller_commissions as $seller_commission) { ?>
								<tr>
									<td class="pts-text-left"><?php echo $seller_commission['order_id']; ?></td>
									<td class="pts-text-left"><?php echo $seller_commission['product_name']; ?></td> 
									<td class="pts-text-left"><?php echo $seller_commission['price']; ?></td>
									<td class="pts-text-left"><?php echo $seller_commission['commission']; ?></td>
									<td class="pts-text-left"><?php echo $seller_commission['created_at']; ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
				<div class="pts-row">
					<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
					<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				</div>
				<?php } else { ?>
				<p><?php echo $text_empty; ?></p>
			<?php } ?>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#pts-button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/sellercommission';
		
		var filter_order_status = $('select[name=\'filter_order_status\']').val();
		
		if (filter_order_status != '*') {
			url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
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
<script type="text/javascript">
	<!--
	$('.date').datetimepicker({
		pickTime: false
	});
//--></script>
<?php echo $footer; ?>