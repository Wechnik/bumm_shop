<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="button" data-toggle="tooltip" title="<?php echo $button_filter; ?>" onclick="$('#filter-product').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg"><i class="fa fa-filter"></i></button>
				<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<button type="button" form="form-product" formaction="<?php echo $delete; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
	<div class="container-fluid"><?php if ($error_warning) { ?>
		<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
    <?php if ($success) { ?>
		<div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i><?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
    <div class="row">
		<div id="filter-product" class="col-md-3 col-md-push-9 col-sm-12 hidden-sm hidden-xs">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-filter"></i> <?php echo $text_filter; ?></h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
						<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label" for="input-model"><?php echo $entry_model; ?></label>
						<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
						<select name="filter_status" id="input-status" class="form-control">
							<option value=""><?php echo $entry_status; ?></option>
							<?php if ($filter_status == '1') { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
							<?php } ?>
							<?php if ($filter_status == '0') { ?>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="0"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select>
					</div>
					<div class="form-group text-right">
						<button type="button" id="button-filter" class="btn btn-default"><i class="fa fa-filter"></i><?php echo $button_filter; ?></button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-9 col-md-pull-3 col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_list; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
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
										<td class="text-left"><?php if ($sort == 'p.model') { ?>
											<a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
											<?php } else { ?>
											<a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
										<?php } ?></td>
										<td class="text-left"><?php if ($sort == 'p.status') { ?>
											<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
											<?php } else { ?>
											<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
										<?php } ?></td>
										<td class="text-right"><?php echo $column_product_detail; ?></td>
										<td class="text-right"><?php echo $column_action; ?></td>
									</tr>
								</thead>
								<tbody>
									
									<?php if ($products) { ?>
										<?php foreach ($products as $product) { ?>
											<tr>
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
												<td class="text-left"><?php echo $product['model']; ?></td>
												<td class="text-left"><?php echo $product['status']; ?></td>
												<td class="text-right"><a href="<?php echo $product['editdetail']; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a></td>
												<td class="text-right"><a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
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
	</div>
	</div>
	<script type="text/javascript"><!--
		$('#button-filter').on('click', function() {
			var url = '';
			
			var filter_name = $('input[name=\'filter_name\']').val();
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			var filter_model = $('input[name=\'filter_model\']').val();
			
			if (filter_model) {
				url += '&filter_model=' + encodeURIComponent(filter_model);
			}
			
			var filter_status = $('select[name=\'filter_status\']').val();
			
			if (filter_status !== '') {
				url += '&filter_status=' + encodeURIComponent(filter_status);
			}
			location = 'index.php?route=purpletree_multivendor/admintemplate&token=<?php echo $token; ?>' + url;
		});
	//--></script> 
	<script type="text/javascript"><!--
		// IE and Edge fix!
		$('button[form=\'form-product\']').on('click', function(e) {
			$('#form-product').attr('action', $(this).attr('formaction'));
		});
		
		$('input[name=\'filter_name\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/admintemplate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
					url: 'index.php?route=purpletree_multivendor/admintemplate/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
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