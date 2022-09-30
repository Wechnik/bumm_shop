<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			<div class="errordiv">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
    </div>
    <div class="successdiv">
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
	</div>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <div class="pts-pull-right">	
			  <?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div>
				<div class="pts-well">
					<div class="pts-row">
						<div class="pts-col-sm-4">
							<div class="pts-form-group ptsnewcss">
								<label class="pts-control-label" for="input-return-id"><?php echo $entry_return_id; ?></label>
								<input type="text" name="filter_return_id" value="<?php echo $filter_return_id; ?>" placeholder="<?php echo $entry_return_id; ?>" id="input-return-id" class="pts-form-control" />
							</div>
							<div class="pts-form-group ptsnewcss">
								<label class="pts-control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
								<input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-col-sm-4">
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-product"><?php echo $entry_product; ?></label>
								<input type="text" name="filter_product" value="<?php echo $filter_product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="pts-form-control" />
							</div>
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-return-status"><?php echo $entry_return_status; ?></label>
								<select name="filter_return_status_id" id="input-return-status" class="pts-form-control">
									<option value=""><?php echo $text_all; ?></option>
									<?php foreach ($return_statuses as $return_status) { ?>
										<?php if ($return_status['return_status_id'] == $filter_return_status_id) { ?>
											<option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>                
											<?php } else { ?>                  
											<option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>                
										<?php } ?>
									<?php } ?>
									
								</select>
							</div>
						</div>
						
						<div class="pts-col-sm-4">
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
								<div class="pts-input-group date d-flex ptsc-commison-display">
									<input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="  <?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="pts-pts-form-control ptsc-quick-deliverb"/>
									<span class="pts-input-group-pts-btn">
										<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>				
							</div>
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-date-modified"><?php echo $entry_date_modified; ?></label>
								<div class="pts-input-group date d-flex ptsc-commison-display">
									<input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" placeholder="  <?php echo $entry_date_modified; ?>" data-date-format="YYYY-MM-DD" id="input-date-modified" class="pts-pts-form-control ptsc-quick-deliverb"/>
									<span class="pts-input-group-pts-btn">
										<button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
							</div>
							
						</div>			
						<div class="pts-form-group">
							<button type="button" id="pts-button-filter" class="pts-btn pts-btn-primary pts-pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>			
					</div>		  
				</div>
				<form action="" method="post" enctype="multipart/form-data" id="form-product">
					<div class="pts-table-responsive">
						<table class="pts-table pts-table-bordered pts-table-hover">
							<thead>
								<tr>                      
									<td class="pts-text-right"><?php if ($sort == 'r.return_id') { ?> 
										<a href="<?php echo $sort_return_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_return_id; ?></a>  
										<?php } else { ?> 
									<a href="<?php echo $sort_return_id; ?>"><?php echo $column_return_id; ?></a> <?php } ?></td>
									<td class="pts-text-right"><?php if ($sort == 'r.order_id') { ?> <a href="<?php echo $sort_order_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>  <?php } else { ?> <a href="<?php echo $sort_order_id; ?>"><?php echo $column_order_id; ?></a> <?php } ?></td>
									<td class="pts-text-left"><?php if ($sort == 'customer') { ?> <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>  <?php } else { ?> <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a> <?php } ?></td>
									<td class="pts-text-left"><?php if ($sort == 'r.product') { ?> <a href="<?php echo $sort_product; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product; ?></a>  <?php } else { ?> <a href="<?php echo $sort_product; ?>"><?php echo $column_product; ?></a> <?php } ?></td>
									<td class="pts-text-left"><?php if ($sort == 'r.model') { ?> <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>  <?php } else { ?> <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a> <?php } ?></td>
									<td class="pts-text-left"><?php if ($sort == 'status') { ?> <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>  <?php } else { ?> <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a> <?php } ?></td>
									<td class="pts-text-left"><?php if ($sort == 'r.date_added') { ?> <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>  <?php } else { ?> <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a> <?php } ?></td>
									<td class="pts-text-left"><?php if ($sort == 'r.date_modified') { ?> <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>  <?php } else { ?> <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a> <?php } ?></td>
									<td class="pts-text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								
								<?php if ($returns) { ?>
									<?php foreach ($returns as $return) { ?>
										<tr>
											<td class="pts-text-right"><?php echo $return['return_id']; ?></td>
											<td class="pts-text-right"><?php echo $return['order_id']; ?></td>
											<td class="pts-text-left"><?php echo $return['customer']; ?></td>
											<td class="pts-text-left"><?php echo $return['product']; ?></td>
											<td class="pts-text-left"><?php echo $return['model']; ?></td>
											<td class="pts-text-left"><?php echo $return['return_status']; ?></td>
											<td class="pts-text-left"><?php echo $return['date_added']; ?></td>
											<td class="pts-text-left"><?php echo $return['date_modified']; ?></td>
											<td class="pts-text-right"><a href="<?php echo $return['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="pts-text-center" colspan="10"><?php echo $text_no_results; ?></td>
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
<script type="text/javascript"><!--
	$('#pts-button-filter').on('click', function() {
		url = 'index.php?route=account/purpletree_multivendor/product_returns';
		
		var filter_return_id = $('input[name=\'filter_return_id\']').val();
		
		if (filter_return_id) {
			url += '&filter_return_id=' + encodeURIComponent(filter_return_id);
		}
		
		var filter_order_id = $('input[name=\'filter_order_id\']').val();
		
		if (filter_order_id) {
			url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
		}		
		
		var filter_product = $('input[name=\'filter_product\']').val();
		
		if (filter_product) {
			url += '&filter_product=' + encodeURIComponent(filter_product);
		}	
		
		var filter_return_status_id = $('select[name=\'filter_return_status_id\']').val();
		
		if (filter_return_status_id !== '') {
			url += '&filter_return_status_id=' + encodeURIComponent(filter_return_status_id);
		}	
		
		var filter_date_added = $('input[name=\'filter_date_added\']').val();
		
		if (filter_date_added) {
			url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
		}
		
		var filter_date_modified = $('input[name=\'filter_date_modified\']').val();
		
		if (filter_date_modified) {
			url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
		}
		
		location = url;
	});
//--></script> 
<script type="text/javascript"><!--
	$('input[name=\'filter_product\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/product_returns/autocomplete&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_product\']').val(item['label']);
		}	
	});
	
	
//--></script> 
<script type="text/javascript">
	<!--
	$('.date').datetimepicker({
		pickTime: false
	});
//--></script>

<?php echo $footer; ?>