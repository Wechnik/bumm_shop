<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<?php if (isset($product_page)) { ?>
					<a class="btn btn-info" href="<?php echo $product_page; ?>"
				                                       target="_blank" data-toggle="tooltip"
				                                       title="<?php echo $button_view; ?>"><i class="fa fa-eye"></i>
					</a>
				<?php } ?>
				<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>"
				        class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
				   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
					
					<?php if(in_array('name', $user_groups_fields)) { ?>
						<div class="form-group required">
							<label class="col-sm-2 control-label"
							       for="input-name1"><?php echo $entry_name; ?></label>
							<div class="col-sm-10">
								<input type="text"
								       name="product_description[1][name]"
								       value="<?php echo isset($product_description[1]) ? $product_description[1]['name'] : ''; ?>"
								       placeholder="<?php echo $entry_name; ?>"
								       id="input-name1"
								       class="form-control"/>
								<?php if (isset($error_name[1])) { ?>
									<div class="text-danger"><?php echo $error_name[1]; ?></div>
								<?php } ?>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('description', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"
							       for="input-description1"><?php echo $entry_description; ?></label>
							<div class="col-sm-10">
                                <textarea
                                        name="product_description[1][description]"
                                        placeholder="<?php echo $entry_description; ?>"
                                        id="input-description1"
                                        data-lang="<?php echo $lang; ?>"
                                        class="form-control summernote"><?php echo isset($product_description[1]) ? $product_description[1]['description'] : ''; ?></textarea>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('model', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"
							       for="input-model"><?php echo $entry_model; ?></label>
							<div class="col-sm-10">
								<input type="text" name="model" value="<?php echo $model; ?>"
								       placeholder="<?php echo $entry_model; ?>" id="input-model"
								       class="form-control"/>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('sku', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip"
							                                                            title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
							<div class="col-sm-10">
								<input type="text" name="sku" value="<?php echo $sku; ?>"
								       placeholder="<?php echo $entry_sku; ?>" id="input-sku" class="form-control"/>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('price', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"
							       for="input-price"><?php echo $entry_price; ?></label>
							<div class="col-sm-10">
								<input type="text" name="price" value="<?php echo $price; ?>"
								       placeholder="<?php echo $entry_price; ?>" id="input-price"
								       class="form-control"/>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('quantity', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"
							       for="input-quantity"><?php echo $entry_quantity; ?></label>
							<div class="col-sm-10">
								<input type="text" name="quantity" value="<?php echo $quantity; ?>"
								       placeholder="<?php echo $entry_quantity; ?>" id="input-quantity"
								       class="form-control"/>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('sizes', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"
							       for="input-length"><?php echo $entry_dimension; ?></label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-4">
										<input type="text" name="length" value="<?php echo $length; ?>"
										       placeholder="<?php echo $entry_length; ?>" id="input-length"
										       class="form-control"/>
									</div>
									<div class="col-sm-4">
										<input type="text" name="width" value="<?php echo $width; ?>"
										       placeholder="<?php echo $entry_width; ?>" id="input-width"
										       class="form-control"/>
									</div>
									<div class="col-sm-4">
										<input type="text" name="height" value="<?php echo $height; ?>"
										       placeholder="<?php echo $entry_height; ?>" id="input-height"
										       class="form-control"/>
									</div>
								</div>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('weight', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"
							       for="input-weight"><?php echo $entry_weight; ?></label>
							<div class="col-sm-10">
								<input type="text" name="weight" value="<?php echo $weight; ?>"
								       placeholder="<?php echo $entry_weight; ?>" id="input-weight"
								       class="form-control"/>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('manufacturer', $user_groups_fields)) { ?>
						<div class="form-group">
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
					<?php } ?>
					
					<?php if(in_array('main_category', $user_groups_fields)) { ?>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_main_category; ?></label>
							<div class="col-sm-10">
								<select id="main_category_id" name="main_category_id" class="form-control">
									<option value="0" selected="selected"><?php echo $text_none; ?></option>
									<?php foreach ($categories as $category) { ?>
										<?php if ($category['category_id'] == $main_category_id) { ?>
											<option value="<?php echo $category['category_id']; ?>"
											        selected="selected"><?php echo $category['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('tab_text', $user_groups_fields)) { ?>
						<div class="form-group">
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
								<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a>
								/
								<a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
							</div>
						</div>
					<?php } ?>
					
					<?php if(in_array('text_after_description', $user_groups_fields)) { ?>
						<div class="form-group">
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
								<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a>
								/
								<a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
							</div>
						</div>
					<?php } ?>
					
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript"><!--
		ckeditorInit('input-description1', getURLVar('token'));
		ckeditorInit('input-additional-description1', getURLVar('token'));
		//--></script>

</div>


<?php echo $footer; ?>
