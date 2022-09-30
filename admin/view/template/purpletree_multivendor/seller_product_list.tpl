<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" data-toggle="tooltip" id="button-approve" title="<?php echo $button_approve; ?>" class="btn btn-success" formaction="<?php echo $approve; ?>" form="form-product"><?php echo $button_approve; ?></button>
				
				<button type="submit" data-toggle="tooltip" id="button-unassign" title="<?php echo $button_unassign; ?>" class="btn btn-danger" formaction="<?php echo $unassign; ?>" form="form-product"><?php echo $button_unassign; ?></button>
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
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							</div>
							<div class="form-group">
								<label class="control-label" for="input-model"><?php echo $entry_model; ?></label>
								<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-price"><?php echo $entry_price; ?></label>
								<input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
							</div>
							<div class="form-group">
								<label class="control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
								<input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
								<select name="filter_status" id="input-status" class="form-control">
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
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $column_approved; ?></label>
								<select name="filter_approval" id="input-status" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php if ($filter_approval) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
									<?php } ?>
									<?php if (!$filter_approval && !is_null($filter_approval)) { ?>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="0"><?php echo $text_no; ?></option>
									<?php } ?>
								</select>
								<input type="hidden" name="seller_id" value="<?php echo $seller_id;?>">
							</div>
							<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
					<div><div class="sellercolor"> <div class="greencolor"></div><?php echo $seller_vacation_product; ?> </div></div>
				</div>
				<form action="" method="post" enctype="multipart/form-data" id="form-product">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-center"><?php echo $column_image; ?></td>
									<td class="text-left"><?php if ($sort == 'pd.name') { ?>
										<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php echo $column_seller_name; ?></td>
									<td class="text-left"><?php if ($sort == 'p.model') { ?>
										<a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php if ($sort == 'p.price') { ?>
										<a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php if ($sort == 'p.quantity') { ?>
										<a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'p.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php echo $column_approved; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($products) { ?>
									<?php foreach ($products as $product) { ?>
										<tr <?php if ($product['vacation'] !=0) { ?> class="greencolorr"  <?php } ?>>
											<td class="text-center"><?php if (in_array($product['product_id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
											<?php } ?></td>
											<td class="text-center"><?php if ($product['image']) { ?>
												<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
												<?php } else { ?>
												<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
											<?php } ?></td>
											<td class="text-left"><?php echo $product['name']; ?></td>
											<td class="text-left"><?php echo $product['seller_name']; ?></td>
											<td class="text-left"><?php echo $product['model']; ?></td>
											<td class="text-right"><?php if ($product['special']) { ?>
												<span class="ptsc-sellprod-textdecor"><?php echo $product['price']; ?></span><br/>
												<div class="text-danger"><?php echo $product['special']; ?></div>
												<?php } else { ?>
												<?php echo $product['price']; ?>
											<?php } ?></td>
											<td class="text-right"><?php if ($product['quantity'] <= 0) { ?>
												<span class="label label-warning"><?php echo $product['quantity']; ?></span>
												<?php } elseif ($product['quantity'] <= 5) { ?>
												<span class="label label-danger"><?php echo $product['quantity']; ?></span>
												<?php } else { ?>
												<span class="label label-success"><?php echo $product['quantity']; ?></span>
											<?php } ?></td>
											<td class="text-left"><?php echo $product['status']; ?></td>
											<td class="text-left"><?php echo $product['is_approved']; ?></td>
											<td class="text-right"><a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
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
		$('#button-approve, #button-unassign').on('click', function(e) {
			
			if(confirm('<?php echo $text_confirm; ?>')) {
				$('#form-product').attr('action', this.getAttribute('formAction'));   
			}
			else { 
				return false;
			}
		});
		
		$('#button-filter').on('click', function() {
			var url = 'index.php?route=purpletree_multivendor/sellerproducts&token=<?php echo $token; ?>';
			var seller_id = $('input[name=\'seller_id\']').val();
			
			if (seller_id) {
				url += '&seller_id=' + encodeURIComponent(seller_id);
			}	
			var filter_name = $('input[name=\'filter_name\']').val();
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			var filter_model = $('input[name=\'filter_model\']').val();
			
			if (filter_model) {
				url += '&filter_model=' + encodeURIComponent(filter_model);
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
			
			var filter_approval = $('select[name=\'filter_approval\']').val();
			
			if (filter_approval != '*') {
				url += '&filter_approval=' + encodeURIComponent(filter_approval);
			}
			
			location = url;
		});
	//--></script>
	<script type="text/javascript"><!--
		$('input[name=\'filter_name\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/sellerproducts/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
		
		$('input[name=\'filter_model\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/sellerproducts/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
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
	//--></script></div>
	<?php echo $footer; ?>	