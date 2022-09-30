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
				<ul class="pts-nav pts-nav-tabs">
					<!--tabs -->
					<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li> 
					<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
				</ul>
				<div class="pts-tab-content">
					<div class="pts-tab-pane active" id="tab-general">
						<ul class="pts-nav pts-nav-tabs" id="language">
							<input type="hidden" name="seller_name" value="<?php echo $seller_name; ?>">
							<?php $active = 'active'; ?>
							<?php foreach ($languages as $language) { ?>
								<li class="<?php echo $active; ?>" ><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a></li>
								<?php $active = ''; ?>
							<?php } ?>
						</ul>
						<div class="pts-tab-content">
							<?php $active = 'active'; ?>
							<?php foreach ($languages as $language) { ?>
								<div class="pts-tab-pane <?php echo $active; ?>" id="language<?php echo $language['language_id']; ?>">
									<div class="pts-form-group required">
										<label class="pts-col-sm-2 pts-control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="pts-form-control" />
											<?php if (isset($error_name[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
										<div class="pts-col-sm-10">
											<textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="pts-form-control summernote"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
										</div>
									</div>
									
									<div class="pts-form-group required">
										<label class="pts-col-sm-2 pts-control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
										<div class="pts-col-sm-10">
											<input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="pts-form-control" />
											<?php if (isset($error_tag[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_tag[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>			  				 			                
								</div>
								<?php $active = ''; ?>
							<?php } ?>
						</div>
						<!-- category option -->
						<?php if($purpletree_multivendor_seller_product_category == 0) { ?>
							<div class="pts-form-group pts-category-dropdown">
								<label class="pts-col-sm-2 pts-control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
								<div class="pts-col-sm-10">
									<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="pts-form-control" />
									<div id="product-category" class="pts-well pts-well-sm ptsc-smproduct-padmarbot">
										<?php foreach ($product_categories as $product_category) { ?>
											<div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
												<input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
											</div>
										<?php } ?>					 
									</div>
								</div>			
							</div>
							<?php } else { ?>
							<div class="pts-form-group required pts-category-dropdown">
								<label class="pts-col-sm-2 pts-control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_categoryy; ?></span></label>
								
								<div class="pts-col-sm-10 ">
									<select  id="input-category" class="pts-form-control">
										<option value=""><?php echo $entry_select_category; ?></option>
										<?php foreach ($product_categories as $product_category) { ?>
											<option value="<?php echo $product_category['category_id']; ?>" <?php if(!empty($parent)) { if($parent['parent_id'] == $product_category['category_id']) { ?> selected="selected" <?php } }?> ><?php echo $product_category['name'] ?></option>
											
										<?php } ?>
									</select>
									<?php if ($error_product_category) { ?>
										<div class="text-danger"><?php echo $error_product_category; ?></div>
									<?php } ?>
								</div>				
							</div>
							<!--Subcategory-->
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label" for="sub-input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $sub_category; ?></span></label>
								
								<div class="pts-col-sm-10">
									<select name="product_category[]" id="sub-input-category" class="pts-form-control">
										<?php if(!empty($childCats)){ ?>
											<?php foreach ($childCats as $product_category1) { ?>
												<option value="<?php echo $product_category1['category_id']; ?>" <?php if(!empty($product_categoryy)) { if($product_categoryy[0] == $product_category1['category_id']) { ?> selected="selected" <?php } }?> ><?php echo $product_category1['name'] ?></option>
											<?php } } else { ?>
											<option value=""><?php echo $none; ?></option>
										<?php } ?>
									</select>
									<?php if ($error_product_category) { ?>
										<div class="text-danger"><?php echo $error_product_category; ?></div>
									<?php } ?>
								</div>				
							</div>
							<!--Subcategory-->
						<?php } ?>
						
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label ptsc-productl-nodisplay"><?php echo $entry_store ?></label>
							<div class="pts-col-sm-10">
								<div class="well well-sm ptsc-product-heigoflow  ptsc-productl-nodisplay"> <?php foreach($stores as $store){ ?>
									<div class="checkbox">
										<label>   <?php if (in_array($store['store_id'], $product_store)) { ?>
											<input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
											<?php echo $store['name']; ?>
											<?php } else {?>
											<input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
											<?php echo $store['name']; ?>
										<?php } ?> </label>
									</div>
								<?php } ?></div>
							</div>
						</div>
						<!--Price-->
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-price"><?php echo $entry_price; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
							</div>
						</div>
						
						<div class="pts-form-group">	
							<label class="pts-col-sm-2 pts-control-label" for="input-price"><?php echo $entry_image;; ?></label>	
							<?php if(isset($img_mag_status)) {?>
								<!--start im tab-->    
								<div class="pts-tab-pane col-md-10 col-md-offset-2 pts-col-md-offset-2 ptsc-sellproduct-smfomzerpadd" id="tab-image">
									
									<!--Drop-->
									<div class="pts-table-responsive">
										<!-- Drop zone -->
										<div id="drop-files" >
											<p><?php echo $ss_lang["drop"]; ?></p>
											<i><?php echo $ss_lang["drop_or"]; ?></i>
											<div id="frm" > 
												<input type="file" id="file-input" multiple="multiple" accept="image/jpeg,image/png,image/gif,image/bmp">
												<label id="byPc" for="file-input"><i class="fa fa-upload" aria-hidden="true"></i><br><?php echo $ss_lang["upl_pc"]; ?></label><button type="button" id="bySer"><label><i class="fa fa-server" aria-hidden="true"></i><br><?php echo $ss_lang["upl_ser"]; ?></label></button><label id="byUrl" for="url-input" ><i class="fa fa-external-link" aria-hidden="true"></i><br><?php echo $ss_lang["upl_link"]; ?></label>
												<div id="url-input"><span><input type="text" ><button class="pts-btn pts-btn-info" type="button"><?php echo $ok; ?></button></span></div>
											</div>  
											
											<!-- begin ssWaterMark -->
											<div class="ssWaterMark">
												<div class="btWm"><?php echo $wm; ?></div> 
												<!--WaterMark-->
												<div class="waterMarkBlock">
													<div class="previweWm"> <canvas id='canvas'></canvas></div>
													<div class="settWm">
														<div class="posBl wm_form-group"> 
															<select  name="wmPos" id="wmPos">
																<option value="lt"><?php echo $lt; ?></option>
																<option value="lb"><?php echo $lb; ?></option>
																<option value="rt"><?php echo $rt; ?></option>
																<option value="rb"><?php echo $rb; ?></option>
																<option value="cn"><?php echo $cn; ?></option>
																<option value="mt"><?php echo $mt; ?></option>
															</select>
															<label for="select" class="input-label"><?php echo $posi; ?></label><i class="bar"></i>
														</div>
														<div class="wm_form-group">
															<input  type="text" name="wmData" id="wmData" value="" placeholder="&nbsp;" />
															<label for="wmData" class="input-label"><?php echo $wm_label; ?></label><i class="bar"></i>
															<div class="color setCol ptsc-sellproduct-smfombgcollll" id="setCol">
																<div class="colorBl" >
																	<div class="colorList">
																		<span class="color simp ptsc-sellproduct-smfombgcolll" ></span><span class="color simp ptsc-sellproduct-smfombgcolllll" ></span><span class="color simp ptsc-sellproduct-smfombgcoll" ></span><span class="color simp ptsc-sellproduct-smfombgcol" ></span>
																		<span class="color anyCol"></span><input value="#a340d4" type="text" name="wmColor" id="wmColor" maxlength="7" />
																	</div>
																</div>
															</div>
														</div>
														<div class="wm_form-range">
															<input  type="range" name="wmSize" id="wmSize" min="1" max="100" step="1" value="48" />
															<label for="wmSize" class="input-label"><?php echo $siz; ?>: <span class="wmRng" >45</span>%</label>
														</div>
														<div class="wm_form-range">
															<input  type="range" name="wmOpc" id="wmOpc" min="1" max="100" step="1" value="48" />
															<label for="wmOpc" class="input-label"><?php echo $opc; ?>: <span class="wmRng" >45</span>%</label>
														</div>
														<div class="wm_form-toggle">
															<input id="wmStatus" type="checkbox"  class="tgl tgl-offOn" />
															<div class="tgl-inf" ><i><?php echo $switch; ?></i></div>
															<label class="tgl-btn" data-tg-off="OFF" data-tg-on="ON" for="wmStatus"></label>
														</div>
													</div>
												</div>
											</div> 
										</div>
										<!-- end ssWaterMark -->
										
										<!-- View zone -->
										<div  id="images" >
											<div  id="list-view"><?php $image_row=0;
												array_unshift($product_images,array("image" =>$image,"thumb" =>$thumb,"sort_order" => 0));
												if($image)foreach ($product_images as $key=> $val) { 
													?><div id="img-<?php echo $key; ?>" class="image old" >
													<span class='previewImg'><img src ='<?php echo $val['thumb']; ?>' /></span>
													<span class="btm_img">
														<i class="fa fa-search-plus" data-toggle="tooltip" title="<?php echo $ss_lang["zoom"]; ?>" aria-hidden="true"></i><i class="fa fa-times" data-toggle="tooltip" title="<?php echo $button_remove; ?>" aria-hidden="true" ></i>
													</span>
													<input name="<?php echo $key!=0?'product_image['.$key.'][image]':'image'; ?>" value="<?php echo $val['image']; ?>" id="input-image<?php echo $key!=0?$key:''; ?>" type="hidden" >
													<?php if($key!=0){ ?><input name="product_image[<?php echo $key; ?>][sort_order]" value="<?php echo $val['sort_order']; ?>"  type="hidden" ><?php } ?>
												</div><?php $image_row=$key+1;} ?></div >
												
										</div >
									</div> 
									
								</div>
								<!-- image-tab end -->
								<?php }else{?>
								<!--Image tab-->
								<div class="pts-tab-pane pts-col-md-10 pts-col-md-offset-2 col-md-offset-2 ptsc-smproduct-padmarbot" id="tab-image">
									<div class="pts-table-responsive">
										<table class="pts-table pts-table-striped pts-table-bordered pts-table-hover pts-left-icon">                 
											<tbody>
												<tr>
													<td class="pts-text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" /></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="pts-table-responsive">
										<table id="images" class="pts-table pts-table-striped pts-table-bordered pts-table-hover pts-left-icon"> 
											<thead>
												<tr>
													<td class="pts-text-left"><?php echo $entry_additional_image; ?></td>
													<td class="pts-text-right"><?php echo $entry_sort_order; ?></td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<?php $image_row = 0; ?>
												<?php foreach ($product_images as $product_image) { ?>
													<tr id="image-pts-row<?php echo $image_row; ?>">
														<td class="pts-text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
														<td class="pts-text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="pts-form-control" /></td>
														<td class="pts-text-left"><button type="button" onclick="$('#image-pts-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>
													</tr>
													<?php $image_row++; ?>
												<?php } ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td class="pts-text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div> 
							<?php } ?>
						</div>
					</div>
					<!--Data Tab-->
					<div class="pts-tab-pane" id="tab-data">
						<ul class="pts-nav pts-nav-tabs" id="language">
							<input type="hidden" name="seller_name" value="<?php echo $seller_name; ?>">
							<?php $active = 'active'; ?>
							<?php foreach ($languages as $language) { ?>
								<li class="<?php echo $active; ?>" ><a href="#languagedata<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a></li>
								<?php $active = ''; ?>
							<?php } ?>
						</ul>
						
						<div class="pts-form-group ">
							<label class="pts-col-sm-2 pts-control-label" for="input-model"><?php echo $entry_model; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="pts-form-control" />               
							</div>
						</div>
						<!--  RESTRICT PRODUCTS BY CUSTOMER GROUP  -->
						<?php if(isset($restrict_products_status)){ ?>
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_customer_group; ?></label>
								<div class="pts-col-sm-10">
									<div class="pts-well pts-well-sm ptsc-product-heigoflow">
										<?php foreach ($customer_groups as $customer_group) { ?>
											<div class="checkbox">
												<label>
													<?php if (in_array($customer_group['customer_group_id'], $product_to_customer_group)) { ?>
														<input type="checkbox" name="product_to_customer_group[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
														<?php echo $customer_group['name']; ?>
														<?php } else { ?>
														<input type="checkbox" name="product_to_customer_group[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
														<?php echo $customer_group['name']; ?>
													<?php } ?>
												</label>
											</div>
										<?php } ?>
									</div>
								</div>
							</div>
						<?php } ?>
						<!--  END RESTRICT PRODUCTS BY CUSTOMER GROUP  -->
						<!-- For Add product, category featured and Featured product to add subscription plan-->
						<!--is_category_featured-->
						<?php if(isset($purpletree_multivendor_subscription_plans) && $purpletree_multivendor_subscription_plans == 1){ ?>
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-product_plan_id"><?php echo $text_assign_sub_plan; ?></label>
								<div class="pts-col-sm-10">
									
									<select name="product_plan_id" id="input-product_plan_id" class="pts-form-control">
										<!--<option value="0" ><?php //echo $text_not_applicable; ?></option> -->
										<?php if(!empty($product_plan_info)){ 
											foreach($product_plan_info as $plans){
											?>				
											<option value="<?php echo $plans['plan_id']; ?>" <?php if($product_plan_id==$plans['plan_id']){ ?> selected <?php } ?> ><?php echo $plans['plan_name']; ?></option>
										<?php }  } else { ?>
										<option value="" selected ><?php echo 'Plan Not Found'; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-featured-product-plan-id"><?php echo $entry_subscription_featured_product; ?></label>
								<div class="pts-col-sm-10">
									
									<select name="featured_product_plan_id" id="input-featured-product-plan-id" class="pts-form-control">
										<option value="0" ><?php echo $text_not_applicable; ?></option>
										<?php if(!empty($product_plan_info)){ 
											foreach($product_plan_info as $plans){
											?>				
											<option value="<?php echo $plans['plan_id']; ?>" <?php if($featured_product_plan_id==$plans['plan_id']){ ?> selected <?php } ?> ><?php echo $plans['plan_name']; ?></option>
										<?php }  } else { ?>
										
										<?php } ?>				
									</select>
									<?php if (!empty($error_featured_product_plan_id)) { ?>
										<div class="text-danger"><?php echo $error_featured_product_plan_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-category-featured-product-plan-id"><?php echo $entry_subscription_category_featured_product; ?></label>
								<div class="pts-col-sm-10">
									
									<select name="category_featured_product_plan_id" id="input-category-featured-product-plan-id" class="pts-form-control">
										<option value="0"><?php echo $text_not_applicable; ?></option>
										<?php if(!empty($product_plan_info)){ 
											foreach($product_plan_info as $plans){
											?>				
											<option value="<?php echo $plans['plan_id']; ?>" <?php if($category_featured_product_plan_id==$plans['plan_id']){ ?> selected <?php } ?> ><?php echo $plans['plan_name']; ?></option>
										<?php }  } else { ?>
										
										<?php } ?>				
									</select>
									<?php if (!empty($error_category_featured_product_plan_id)) { ?>
										<div class="text-danger"><?php echo $error_category_featured_product_plan_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<?php } else { ?>
							<?php if ($purpletree_multivendor_seller_featured_products) { ?>
								<div class="pts-form-group">
									<label class="pts-col-sm-2 pts-control-label" for="input-is_featured"><?php echo $entry_featured_product; ?></label>
									<div class="pts-col-sm-10">
										
										<select name="is_featured" id="input-is_featured" class="pts-form-control">
											<?php if($is_featured){ ?>
												<option value="1" selected ><?php echo $text_yes; ?></option>
												<option value="0"><?php echo $text_no; ?></option>
												<?php } else { ?>
												<option value="1"  ><?php echo $text_yes; ?></option>
												<option value="0" selected><?php echo $text_no; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							<?php } ?>
							<?php if ($purpletree_multivendor_seller_category_featured) { ?>
								<div class="pts-form-group">
									<label class="pts-col-sm-2 pts-control-label" for="input-is_category_featured"><?php echo $entry_category_featured_product; ?></label>
									<div class="pts-col-sm-10">
										
										<select name="is_category_featured" id="input-is_category_featured" class="pts-form-control">
											<?php if($is_category_featured){ ?>
												<option value="1" selected ><?php echo $text_yes; ?></option>
												<option value="0"><?php echo $text_no; ?></option>
												<?php } else { ?>
												<option value="1"  ><?php echo $text_yes; ?></option>
												<option value="0" selected><?php echo $text_no; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							<?php } ?>
						<?php } ?>
						<!--is_category_featured-->
						<!-- End For Add product, category featured and Featured product to add subscription plan -->
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
							<div class="pts-col-sm-10">
								<input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="tab-special"><?php echo $tab_special;?></label>
							<div class="tab-pane pts-col-sm-10 ptsc-smproduct-padmarbot"  id="tab-special">
								
								<div class="table-responsive">
									<table id="special" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<td class="text-left"><?php echo $entry_customer_group; ?></td>
												<td class="text-right"><?php echo $entry_priority; ?></td>
												<td class="text-right"><?php echo $entry_price; ?></td>
												<td class="text-left"><?php echo $entry_date_start; ?></td>
												<td class="text-left"><?php echo $entry_date_end; ?></td>
												<td></td>
											</tr>
										</thead>
										<tbody>
											<?php $special_row = 0; ?>
											<?php foreach ($product_specials as $product_special) { ?>
												<tr id="special-row<?php echo $special_row; ?>">
													<td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
														<?php foreach ($customer_groups as $customer_group) { ?>
															<?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
																<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
																<?php } else { ?>
																<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
															<?php } ?>
														<?php } ?>
													</select></td>
													<td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
													<td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
													<td class="text-left ptsc-product-width"><div class="input-group date">
														<input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
														<span class="input-group-btn">
															<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
														</span></div></td>
														<td class="text-left ptsc-product-width"><div class="input-group date">
															<input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
															<span class="input-group-btn">
																<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
															</span></div></td>
															<td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
												</tr>
												<?php $special_row++; ?>
											<?php } ?>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="5"></td>
												<td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
							<div class="pts-col-sm-10">
								<select name="tax_class_id" id="input-tax-class" class="pts-form-control">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($tax_classes as $tax_class) { ?>
										<?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>			 
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
							<div class="pts-col-sm-10">
								<select name="subtract" id="input-subtract" class="pts-form-control">
									<?php if ($subtract) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
							<div class="pts-col-sm-10">
								<select name="stock_status_id" id="input-stock-status" class="pts-form-control">
									<?php foreach ($stock_statuses as $stock_status) { ?>
										<?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
											<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_shipping; ?></label>
							<div class="pts-col-sm-10">
								<label class="radio-inline">
									<?php if ($shipping) { ?>
										<input type="radio" name="shipping" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="shipping" value="1" />
										<?php echo $text_yes; ?>
									<?php } ?>
								</label>
								<label class="radio-inline">
									<?php if (!$shipping) { ?>
										<input type="radio" name="shipping" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="shipping" value="0" />
										<?php echo $text_no; ?>
									<?php } ?>
								</label>
							</div>
						</div>
						<!--Pts shipping-->
					    <div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-pts_shipping_charge"><?php echo $text_shipping_charge ; ?></label>
						<div class="pts-col-sm-10">
						  <input type="text" name="pts_shipping_charge" value="<?php echo $pts_shipping_charge ; ?>" placeholder="<?php echo $text_shipping_charge ; ?>" id="input-pts_shipping_charge" class="pts-form-control"/>
						</div>
					  </div>
					  <!--End Pts shipping-->
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
							<div class="pts-col-sm-10">
								<input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="pts-form-control" />
								<?php if ($error_keyword) { ?>
									<div class="text-danger"><?php echo $error_keyword; ?></div>
								<?php } ?>
							</div>
						</div>
						<!--Meta tags-->
						<div class="pts-tab-content">
							<?php $active1 = 'active'; ?>
							<?php foreach ($languages as $language) { ?>
								<div class="pts-tab-pane <?php echo $active1; ?>" id="languagedata<?php echo $language['language_id']; ?>">
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
										<div class="pts-col-sm-10">
											<input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="pts-form-control" />
											<?php if (isset($error_meta_title[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
										<div class="pts-col-sm-10">
											<textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="pts-form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
										</div>
									</div>
									<div class="pts-form-group">
										<label class="pts-col-sm-2 pts-control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
										<div class="pts-col-sm-10">
											<textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="pts-form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
											
										</div>
									</div>
								</div>
								<?php $active1 = ''; ?>
							<?php } ?>
						</div>
						<!--End Meta tags--> 
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
							<div class="col-sm-3">
								<div class="pts-input-group date">
									<input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="pts-form-control" />
									<span class="pts-input-group-btn">
										<button class="pts-btn pts-btn-default" type="button"><i class="fa fa-calendar"></i></button>
									</span></div>
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
							<label class="pts-col-sm-2 pts-control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
							<div class="pts-col-sm-10">
								<select name="length_class_id" id="input-length-class" class="pts-form-control">
									<?php foreach ($length_classes as $length_class) { ?>
										<?php if ($length_class['length_class_id'] == $length_class_id) { ?>
											<option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-weight"><?php echo $entry_weight; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
							<div class="pts-col-sm-10">
								<select name="weight_class_id" id="input-weight-class" class="pts-form-control">
									<?php foreach ($weight_classes as $weight_class) { ?>
										<?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-status"><?php echo $entry_status; ?></label>
							<div class="pts-col-sm-10">
								<select name="status" id="input-status" class="pts-form-control">
									<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
								<input type="hidden" id="sellssser_id" value="<?php echo $seller_id; ?>" />
							</div>
						</div>
					</div>
					
				</div>
				<div>
					<div class="pts-pull-left"><a href="<?php echo $back; ?>" class="pts-btn pts-btn-default"><?php echo $button_back; ?></a></div>
					<div class="pts-pull-right">
						<input type="submit" id="submitButton" value="<?php echo $button_continue; ?>" class="upl pts-btn pts-btn-primary" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	// Manufacturer
	$('input[name=\'manufacturer\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/manufacturer&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					json.unshift({
						manufacturer_id: 0,
						name: '<?php echo $text_none; ?>'
					});
					
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['manufacturer_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'manufacturer\']').val(item['label']);
			$('input[name=\'manufacturer_id\']').val(item['value']);
		}
	});
	
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
	
	// Filter
	$('input[name=\'filter\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/filter&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['filter_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter\']').val('');
			
			$('#product-filter' + item['value']).remove();
			
			$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
		}
	});
	
	$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
	
	// Downloads
	$('input[name=\'download\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/download&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['download_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'download\']').val('');
			
			$('#product-download' + item['value']).remove();
			
			$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
		}
	});
	
	$('#product-download').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
	
	// Related
	$('input[name=\'related\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/product&filter_name=' +  encodeURIComponent(request),
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
			$('input[name=\'related\']').val('');
			
			$('#product-related' + item['value']).remove();
			
			$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
		}
	});
	
	$('#product-related').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
//--></script>
<script type="text/javascript"><!--
	var special_row = <?php echo $special_row; ?>;
	
	function addSpecial() {
		html  = '<tr id="special-pts-row' + special_row + '">';
		html += '  <td class="pts-text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="pts-form-control">';
		<?php foreach ($customer_groups as $customer_group) { ?>
			html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
		<?php } ?>
		html += '  </select></td>';
		html += '  <td class="pts-text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-left ptsc-product-width"><div class="pts-input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
		html += '  <td class="pts-text-left ptsc-product-width"><div class="pts-input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
		html += '  <td class="pts-text-left"><button type="button" onclick="$(\'#special-pts-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#special tbody').append(html);
		
		$('.date').datetimepicker({
			pickTime: false
		});
		
		special_row++;
	}
//--></script>
<script type="text/javascript"><!--
	var image_row = <?php echo $image_row; ?>;
	
	function addImage() {
		html  = '<tr id="image-pts-row' + image_row + '">';
		html += '  <td class="pts-text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
		html += '  <td class="pts-text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-left"><button type="button" onclick="$(\'#image-pts-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#images tbody').append(html);
		
		image_row++;
	}
//--></script>
<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});
	
	$('.time').datetimepicker({
		pickDate: false
	});
	
	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});
//--></script>
<script type="text/javascript"><!--
	$('#language a:first').tab('show');
	$('#option a:first').tab('show');
//--></script>
<?php if(isset($img_mag_status)) {?>
	<script type="text/javascript">
		var phpData = <?php
			$ser_year = date('Y');
			echo json_encode(
			array_merge(
			compact(
			'pathImg',
			'image_row',
			'ser_year',
			'button_remove',
			'token',
			'proId'
			),
			$ss_lang
			)
			);
		?>;
		phpData["wmArr"] = <?php echo $wmJson; ?>;
		im_ss(phpData);
	</script>
<?php } ?>
<script type="text/javascript"><!--
	$(document).ready(function () {                       
        $("#input-category").on("change", function (e) {
            var category_id = $("#input-category").val();
			if(category_id == '') {
				$('#sub-input-category').empty().append('<option value="" >None</option>');
				} else {
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/autosubcategory&category_id=' +  category_id,
					
					dataType: 'json',	
					success: function(json) {
						$('#sub-input-category').empty();
						$.each(json,function(k,v){
							$('#sub-input-category').append('<option value="'+ v.subcategory_id +'">'+ v.name +'</option>');
						})
					}
				});
			}
		});
	});
	
//--></script>
<?php echo $footer; ?>
