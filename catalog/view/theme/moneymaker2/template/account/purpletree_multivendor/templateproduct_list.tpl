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
							<label class="pts-control-label" for="input-name"><?php echo $entry_name; ?></label>
							<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="pts-form-control" />
						</div>
						<div class="pts-form-group ptsnewcss">
							<label class="pts-control-label" for="input-model"><?php echo $entry_model; ?></label>
							<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-price"><?php echo $entry_price; ?></label>
							<input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
						</div>
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
							<input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-col-sm-4">
						<div class="pts-form-group">
							<label class="pts-control-label" for="input-status"><?php echo $entry_status; ?></label>
							<select name="filter_status" id="input-status" class="pts-form-control">
								<option value="*"><?php echo $text_all; ?></option>
								<?php if($filter_status =='1'){ ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
								<?php } ?>
								<?php if($filter_status =='0'){ ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<button type="button" id="pts-button-filter" class="pts-btn pts-btn-primary pts-pull-right ptsc-temppro-filtermar"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
					</div>
				</div>
			</div>
			<form action="" method="post" enctype="multipart/form-data" id="form-product">
				<div class="pts-table-responsive">
					<table class="pts-table pts-table-bordered pts-table-hover">
						<thead>
							<tr>                  
								<td class="pts-text-center"><?php echo $column_image; ?></td>
								<td class="pts-text-left"><?php echo $column_name; ?></td>
								<td class="pts-text-left"><?php echo $column_model; ?></td>   
								<td class="pts-text-left"><?php echo $column_price; ?></td> 
								<td class="pts-text-left"><?php echo $column_quantity; ?></td> 				  
								<td class="pts-text-left"><?php echo $column_status; ?></td>            
								<td class="pts-text-left"><?php echo $entry_stock_status; ?></td>            
								<td class="pts-text-right"><?php echo $column_action; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php if($products){ ?>
								<?php foreach($products as $key=>$values){ ?>
									<?php if(isset($categories[$key])) { ?>
										<tr>
											<td class="pts-text-left" colspan="8"><h4><?php echo $categories[$key]; ?></h4></td>
										</tr>
										<?php } else { ?>
										<tr>
											<td class="pts-text-left" colspan="8"><h4><?php echo $text_no_category; ?></h4></td>
										</tr>
									<?php } ?>
									<?php if(isset($values)){ ?>
										<?php foreach($values as $value){ ?>
											<tr  <?php if($value['statusid'] == 1){ ?> class="ptsc-temppro-bcolor"  <?php } ?> >
												<td class="pts-text-center"> <?php if($value['image']){ ?>
													<img src="<?php echo $value['image']; ?>" alt="<?php echo $value['name']; ?>" class="img-thumbnail" />
													<?php } else { ?>
													<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
												<?php } ?></td>
												<td class="pts-text-left"><?php echo $value['name']; ?></td>
												<td class="pts-text-left"><?php echo $value['model']; ?></td> 
												<td class="pts-text-left"><?php echo $value['price']; ?></td>
												<td class="pts-text-left"><?php echo $value['quantity']; ?></td> 
												<td class="pts-text-left"><?php echo $value['status']; ?></td>               
												<td class="pts-text-left"><?php echo $value['stock_status']; ?></td>               
												
												<td id="ptsproduct<?php echo $value['product_id']; ?>" class="pts-text-right">
													
													<a  href="<?php echo $value['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>
													<?php if($value['statusid'] == 1){ ?>
														<a  href="<?php echo $value['delete']; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-trash-o fas fa-trash-alt"></i></a>
													<?php } ?>
												</td>
											</tr>
										<?php } ?>
									<?php } ?>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="pts-text-center" colspan="11"><?php echo $text_no_results; ?></td>
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
		var url = 'index.php?route=account/purpletree_multivendor/sellertemplateproduct';
		
		var filter_name = $('input[name=\'filter_name\']').val();
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
		
		var filter_price = $('input[name=\'filter_price\']').val();
		
		if (filter_price) {
			url += '&filter_price=' + encodeURIComponent(filter_price);
		}
		
		var filter_quantity = $('input[name=\'filter_quantity\']').val();
		
		if (filter_quantity) {
			url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
		}
		
		var filter_status = $('select[name=\'filter_status\']').val();
		
		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status);
		}
		
		var filter_model = $('input[name=\'filter_model\']').val();
		
		if (filter_model != '*') {
			url += '&filter_model=' + encodeURIComponent(filter_model);
		}
		
		location = url;
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_name\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellertemplateproduct/autocomplete&filter_name=' +  encodeURIComponent(request),
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
			$('input[name=\'filter_name\']').val(item['label']);
		}
	});
	$('input[name=\'filter_model\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellertemplateproduct/autocomplete&filter_model=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['model'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_model\']').val(item['label']);
		}
	});
//--></script>
<?php echo $footer; ?>