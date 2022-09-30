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
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="pts-form-horizontal">





									
									<div class="pts-form-group required">
										<label class="pts-col-sm-2 pts-control-label" for="input-name1"><?php echo $entry_name; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="product_description[1][name]" value="<?php echo isset($product_description[1]) ? $product_description[1]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name1" class="pts-form-control" />
											<?php if (isset($error_name[1])) { ?>
												<div class="text-danger"><?php echo $error_name[1]; ?></div>
											<?php } ?>
										</div>
									</div>
									
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-description1"><?php echo $entry_description; ?></label>
										<div class="pts-col-sm-10">
											<textarea name="product_description[1][description]" placeholder="<?php echo $entry_description; ?>" id="input-description1" class="pts-form-control summernote"><?php echo isset($product_description[1]) ? $product_description[1]['description'] : ''; ?></textarea>
										</div>
									</div>
									
									<div class="pts-form-group ">
										<label class="pts-col-sm-2 pts-control-label" for="input-model"><?php echo $entry_model; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="pts-form-control" />
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-sku"><span data-toggle="tooltip" title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
										<div class="pts-col-sm-10">
											<input type="text" name="sku" value="<?php echo $sku; ?>" placeholder="<?php echo $entry_sku; ?>" id="input-sku" class="pts-form-control" />
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-price"><?php echo $entry_price; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="pts-input-quantity"><?php echo $entry_quantity; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="pts-input-quantity" class="pts-form-control" />
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-length"><?php echo $entry_dimension; ?></label>
										<div class="pts-col-sm-10">
											<div class="pts-row">
												<div class="pts-col-sm-4">
													<input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="pts-form-control" />
												</div>
												<div class="pts-col-sm-4">
													<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="pts-form-control" />
												</div>
												<div class="pts-col-sm-4">
													<input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="pts-form-control" />
												</div>
											</div>
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-weight"><?php echo $entry_weight; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="pts-form-control" />
										</div>
									</div>
									<div class="pts-form-group">
										<div class="pts-col-sm-2"><?php echo $entry_image; ?></div>
										<div class="pts-col-sm-10">
											<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
										</div>
									</div>
				
				
										<div class="pts-form-group">
											<label class="col-sm-2 control-label"
											       for="input-manufacturer"><?php echo $entry_manufacturer; ?></label>
											<div class="col-sm-10">
												<select id="input-manufacturer" name="manufacturer_id" class="form-control">
													<option value="0" selected="selected"><?php echo $text_none; ?></option>
													<?php foreach ($manufacturers as $manufacturer) { ?>
														<?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
															<option value="<?php echo $manufacturer['manufacturer_id']; ?>"
															        selected="selected"><?php echo $manufacturer['name']; ?></option>
														<?php } else { ?>
															<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
														<?php } ?>
													<?php } ?>
												</select>
											</div>
										</div>
				
										<div class="pts-form-group pts-category-dropdown">
											<label class="pts-col-sm-2 pts-control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
											<div class="pts-col-sm-10">
												<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="pts-form-control" />
												<div id="product-category" class="pts-well pts-well-sm ptsc-product-heigoflow">
													<?php foreach ($product_categories as $product_category) { ?>
														<div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
															<input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
														</div>
													<?php } ?>
												</div>
											</div>
										</div>
				
				
				
				
				
										<div class="pts-form-group">
											<label class="col-sm-2 control-label">Текста для таба</label>
											<div class="col-sm-10">
												<div class="well well-sm"
												     style="min-height: 150px;max-height: 300px;overflow: auto;">
													<table class="table table-striped">
														<?php foreach ($product_product_descriptions as $product_product_description) { ?>
															<tr>
																<td class="checkbox">
																	<label>
																		<?php if (in_array($product_product_description['product_description_id'], $checked_tab_products)) { ?>
																			<input type="checkbox"
																			       name="product_tab_select[<?php echo $product_product_description['product_description_id']; ?>]"
																			       value="<?php echo $product_product_description['front_name']; ?>"
																			       checked="checked"/>
																			<?php echo $product_product_description['name']; ?>
																		<?php } else { ?>
																			<input type="checkbox"
																			       name="product_tab_select[<?php echo $product_product_description['product_description_id']; ?>]"
																			       value="<?php echo $product_product_description['front_name']; ?>"/>
																			<?php echo $product_product_description['name']; ?>
																		<?php } ?>
																	</label>
																</td>
															</tr>
														<?php } ?>
													</table>
												</div>
												<a onclick="$(this).parent().find(':checkbox').prop('checked', true);">Выделить все</a>
												/
												<a onclick="$(this).parent().find(':checkbox').prop('checked', false);">Снять выделение</a>
											</div>
										</div>
										
				
									<div class="pts-form-group">
										<label class="col-sm-2 control-label" for="input-category">Текст для после
											описания</label>
										<div class="col-sm-10">
											<div class="well well-sm"
											     style="min-height: 150px;max-height: 300px;overflow: auto;">
												<table class="table table-striped">
													<?php foreach ($product_product_descriptions as $product_product_description) { ?>
														<tr>
															<td class="checkbox">
																<label>
																	<?php if (in_array($product_product_description['product_description_id'], $checked_tab_products_description)) { ?>
																		<input type="checkbox"
																		       name="product_tab_select_description[]"
																		       value="<?php echo $product_product_description['product_description_id']; ?>"
																		       checked="checked"/>
																		<?php echo $product_product_description['name']; ?>
																	<?php } else { ?>
																		<input type="checkbox"
																		       name="product_tab_select_description[]"
																		       value="<?php echo $product_product_description['product_description_id']; ?>"/>
																		<?php echo $product_product_description['name']; ?>
																	<?php } ?>
																</label>
															</td>
														</tr>
													<?php } ?>
												</table>
											</div>
											<a onclick="$(this).parent().find(':checkbox').prop('checked', true);">Выделить все</a>
											/
											<a onclick="$(this).parent().find(':checkbox').prop('checked', false);">Снять выделение</a>
										</div>
									</div>
									



					
				<div class="buttons clearfix">
					<div class="pts-pull-left"><a href="<?php echo $back; ?>" class="pts-btn pts-btn-default"><?php echo $button_back; ?></a></div>
					<div class="pts-pull-right">
						<input type="submit" value="<?php echo $button_continue; ?>" class=" upl pts-btn pts-btn-primary" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
	<script>
		
		// Category
		$('input[name=\'category\']').autocompletepts({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/category&filter_name=' +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['category_id']
							}
						}));
					}
				});
			},
			'select': function(item) {
				$('input[name=\'category\']').val('');
				
				$('#product-category' + item['value']).remove();
				
				$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
			}
		});
		
		$('#product-category').delegate('.fa-minus-circle', 'click', function() {
			$(this).parent().remove();
		});
	
	</script>
<?php echo $footer; ?>