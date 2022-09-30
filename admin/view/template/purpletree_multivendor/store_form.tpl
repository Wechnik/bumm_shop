<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="alert alert-success ptsc-storefrm-nodisplay" id="psuccess"><i class="fa fa-check-circle"></i><span id="successmsg"></span> 
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<div class="well">
			<div class="row">
				<div class="col-sm-12">
					<a href="<?php echo $manage_products;?>" target="_blank" class="btn btn-primary" role="button"><?php echo $button_manage_products; ?></a>
					<a href="<?php echo $manage_orders?>" target="_blank" class="btn btn-primary" role="button"><?php echo $button_manage_orders; ?></a>
					<a href="<?php echo $manage_commissions; ?>" target="_blank" class="btn btn-primary" role="button"><?php echo $button_manage_commissions; ?></a>
					<a href="<?php echo $manage_reviews; ?>" target="_blank" class="btn btn-primary" role="button"><?php echo $button_manage_reviews; ?></a>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-storedetail" data-toggle="tab"><?php echo $tab_storedetail; ?></a></li>
						<li><a href="#tab-product-assign" data-toggle="tab"><?php echo $tab_product_assign; ?></a></li>
						
						
						<li><a href="#tab-seller-shipping-charge" data-toggle="tab"><?php echo $tab_seller_shipping_charge; ?></a></li>
						
						<li><a href="#tab-seller-commission" data-toggle="tab"><?php echo $tab_seller_commission; ?></a></li>
						<?php if ($purpletree_multivendor_allow_live_chat) { ?>
							<li><a href="#tab-seller-live-chat" data-toggle="tab"><?php echo $tab_live_chat; ?></a></li>
						<?php } ?>
						<!-- pay-pal -->
						<li><a href="#tab-seller-paypal-details" data-toggle="tab">
						<?php echo $tab_seller_paypal_details; ?></a></li>
						<?php if ($storepage_layout) { ?>
							<li><a href="#tab-seller-timing-details" data-toggle="tab"><?php echo $tab_seller_timing_details; ?></a></li>
						<?php } ?>
						<li class="nav-item"><a href="#tab-vacation"class="nav-link"  data-toggle="tab"><?php echo $entry_vacation; ?></a></li>
						<?php if ($custom_fields) { ?>
						<li class="nav-item"><a href="#tab-customfields"class="nav-link"  data-toggle="tab"><?php echo $entry_custom_fields ; ?></a></li>
						<?php } ?>
						<!-- pay-pal -->
						<?php if (isset($check_category_bar)) { ?>
							<li class="nav-item"><a href="#tab-category-assign" class="nav-link" data-toggle="tab">Assign category</a></li>
						<?php } ?>
						<?php if ($use_domain_wise_stores) { ?>
						<li class="nav-item"><a href="#tab-multiple-store"class="nav-link"  data-toggle="tab"><?php echo $entry_assign_stores; ?></a></li>
						<?php } ?>
					</ul>
					
					<div class="tab-content">
						<div class="tab-pane active" id="tab-storedetail">
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-storename"><?php echo $entry_name; ?></label>
								<div class="col-sm-10">
									<input type="text" name="seller_name" disabled value="<?php echo $seller_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
									<input type="hidden" name="seller_name" value="<?php echo $seller_name; ?>" />
									<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" />
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-storename"><?php echo $entry_storename; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_name" value="<?php echo $store_name; ?>" placeholder="<?php echo $entry_storename; ?>" id="input-storename" class="form-control" />
									<?php if ($error_storename) { ?>
										<div class="text-danger"><?php echo $error_storename; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_storelogo; ?></label>
								<div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									<input type="hidden" name="store_logo" value="<?php echo $store_logo; ?>" id="input-storelogo" />
								</div>
							</div>
							<div class="form-group ">
								<label class="col-sm-2 control-label" for="input-storephone"><?php echo $entry_storephone; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_phone" value="<?php echo $store_phone; ?>" placeholder="<?php echo $entry_storephone; ?>" id="input-storephone" class="form-control" />
									<?php if ($error_storephone) { ?>
										<div class="text-danger"><?php echo $error_storephone; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_storebanner; ?></label>
								<div class="col-sm-10"><a href="" id="banner-thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									<input type="hidden" name="store_banner" value="<?php echo $store_banner; ?>" id="input-storebanner" /> <br>
									<?php echo $entry_storebanner_desc; ?>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-storephone"><?php echo $entry_google_add_link; ?></label>
								<div class="col-sm-10">
									<input type="text" name="google_map_link" value="<?php echo $google_map_link; ?>" placeholder="<?php echo $entry_google_add_link; ?>" id="input-google-map" class="form-control" />
								</div>
							</div>
							<?php if ($storepage_layout) { ?>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_storeimage; ?></label>
									<div class="col-sm-10"><a href="" id="image-thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $image_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="store_image" value="<?php echo $store_image; ?>" id="input-storeimage" /> <br>
										<?php echo $entry_storebanner_desc; ?>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-2 control-label col-form-label" for="input-storephone"><?php echo $entry_youtube_video; ?></label>
									<div class="col-sm-10">
										<input type="text" name="store_video" value="<?php echo $store_video; ?>" placeholder="<?php echo $entry_youtube_video; ?>" id="input-storevideo" class="form-control" />
									</div>
								</div>					
								<div class="form-group row">
									<label class="col-sm-2 control-label col-form-label" for="input-storephone"><?php echo $entry_google_mapadd; ?></label>
									<div class="col-sm-10">
										<input type="text" name="google_map" value="<?php echo $google_map; ?>" placeholder="<?php echo $entry_google_mapadd; ?>" id="input-google-map" class="form-control" />
									</div>
								</div>
							<?php } ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storedescription"><?php echo $entry_storedescription; ?></label>
								<div class="col-sm-10">
									<textarea name="store_description" class="form-control summernote"><?php echo $store_description;?></textarea>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-storeaddress"><?php echo $entry_storeaddress; ?></label>
								<div class="col-sm-10">
									<textarea name="store_address" class="form-control" rows="5"><?php echo $store_address; ?></textarea>
									<?php if ($error_storeaddress) { ?>
										<div class="text-danger"><?php echo $error_storeaddress; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-storecity"><?php echo $entry_storecity; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_city" value="<?php echo $store_city; ?>" placeholder="<?php echo $entry_storecity; ?>" id="input-storecity" class="form-control" />
									<?php if ($error_storecity) { ?>
										<div class="text-danger"><?php echo $error_storecity; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storecountry"><?php echo $entry_storecountry; ?></label>
								<div class="col-sm-10">
									<select name="store_country" id="input-storecountry" onchange="country(this,'<?php echo $store_state; ?>');" class="form-control">
										<option value=""><?php echo $text_select; ?></option>
										<?php foreach ($countries as $country) { ?>
											<?php if ($country['country_id'] == $store_country) { ?>
												<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<?php if (isset($error_storecountry) && $error_storecountry != '') { ?>
										<div class="text-danger"><?php echo $error_storecountry; ?></div>
									<?php } ?>
								</div>
							</div>
							
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-storestate"><?php echo $entry_storezone; ?></label>
								<div class="col-sm-10">
									<select name="store_state" id="input-storestate" class="form-control">
									</select>
									
									
									<?php if (isset($error_storezone) && $error_storezone != '') { ?>
										<div class="text-danger"><?php echo $error_storezone; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storezipcode"><?php echo $entry_storepostcode; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_zipcode" value="<?php echo $store_zipcode; ?>" placeholder="<?php echo $entry_storepostcode; ?>" id="input-storezipcode" class="form-control" />
									<?php if ($error_storezipcode) { ?>
										<div class="text-danger"><?php echo $error_storezipcode; ?></div>
									<?php } ?>
								</div>
							</div>
						<!-- seller area -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sellerarea"><span data-toggle="tooltip" title="<?php echo $help_sellerarea;?>"><?php echo $entry_sellerarea;?></span></label>
								<div class="col-sm-10">
								 <select name="seller_area_selection_type" class="form-control">									
									
								<?php if($seller_area_selection_type == 1) { ?>
								    <option value="0"><?php echo $text_all_sellerarea;?></option>
									<option value="1" selected="selected" ><?php echo $text_selected_sellerarea;?></option>
								<?php } else { ?>
								    <option value="0" selected="selected"><?php echo $text_all_sellerarea;?></option>
									<option value="1"><?php echo $text_selected_sellerarea;?></option>
								 <?php } ?>
								 </select>
								<?php if(isset($seller_area_selection_type)) { ?>
								    <input type="text" name="sellerarea" value="" placeholder="<?php echo $entry_sellerarea;?>" id="input-sellerarea" class="form-control"/>								   
								 <?php } else { ?>
								    <input type="text" name="sellerarea" value="" disabled id="input-sellerarea" class="form-control"/>
								 <?php } ?>
								 
								  <div id="seller-area" class="well well-sm ptsc-storef-heioflow">
								  <?php if(!empty($sellerareas)) { ?>
								  <?php foreach ($sellerareas as $sellerarea) { ?>
									  <div id="seller-area<?php echo $sellerarea['area_id'];?>"><i class="fa fa-minus-circle"></i> <?php echo $sellerarea['name'];?>
										<input type="hidden" name="seller_area[]" value="<?php echo $sellerarea['area_id'] ;?>"/>
								      </div>
									<?php }} ?></div>
								</div>
							  </div>
							  <!-- End seller area -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storeshipping"><?php echo $entry_storeshippingpolicy; ?></label>
								<div class="col-sm-10">
									<textarea name="store_shipping_policy" class="form-control summernote"><?php echo $store_shipping_policy;?></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storereturn"><?php echo $entry_storereturn; ?></label>
								<div class="col-sm-10">
									<textarea name="store_return_policy" class="form-control summernote"><?php echo $store_return_policy;?></textarea>
								</div>
							</div>
							<div class="form-group ">
								<label class="col-sm-2 control-label" for="input-storemetakeyword"><?php echo $entry_storemetakeyword; ?></label>
								<div class="col-sm-10">
									<textarea name="store_meta_keywords" class="form-control" rows="5"><?php echo $store_meta_keywords; ?></textarea>
									<?php if ($error_storemetakeyword) { ?>
										<div class="text-danger"><?php echo $error_storemetakeyword; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group ">
								<label class="col-sm-2 control-label" for="input-storemetadescription"><?php echo $entry_storemetadescription; ?></label>
								<div class="col-sm-10">
									<textarea name="store_meta_description" class="form-control" rows="5"><?php echo $store_meta_description; ?></textarea>
									<?php if ($error_storemetadescription) { ?>
										<div class="text-danger"><?php echo $error_storemetadescription; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group ">
								<label class="col-sm-2 control-label" for="input-storebankdetail"><?php echo $entry_storebankdetail; ?></label>
								<div class="col-sm-10">
									<textarea name="store_bank_details" class="form-control" rows="5"><?php echo $store_bank_details; ?></textarea>
									<?php if ($error_storebankdetail) { ?>
										<div class="text-danger"><?php echo $error_storebankdetail; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storetin"><?php echo $entry_storetin; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_tin" value="<?php echo $store_tin; ?>" placeholder="" id="input-storetin" class="form-control" />
									<?php if ($error_storetin) { ?>
										<div class="text-danger"><?php echo $error_storetin; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storeshipping"><?php echo $entry_storeseo; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_seo" value="<?php echo $store_seo; ?>" placeholder="<?php echo $entry_storeseo; ?>" id="input-storeseo" class="form-control" />
									<?php if ($error_storeseo) { ?>
										<div class="text-danger"><?php echo $error_storeseo; ?></div>
									<?php } ?>
								</div>
								
							</div>
							
							<!--social links-->
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-facebook"><?php echo $entry_facebook; ?></label>
								<div class="col-sm-10">
									<input type="text" name="facebook_link" value="<?php echo $facebook_link; ?>" placeholder="<?php echo $entry_facebook; ?>" id="input-facebook" class="form-control" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-twitter"><?php echo $entry_twitter; ?></label>
								<div class="col-sm-10">
									<input type="text" name="twitter_link" value="<?php echo $twitter_link; ?>" placeholder="<?php echo $entry_twitter; ?>" id="input-twitter" class="form-control" />
								</div>
							</div>
							<!--<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-google"><?php //echo $entry_google; ?></label>
								<div class="col-sm-10">
									<input type="text" name="google_link" value="<?php //echo $google_link; ?>" placeholder="<?php //echo $entry_google; ?>" id="input-google" class="form-control" />
								</div>
							</div>-->
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-inswtagram"><?php echo $entry_instagram; ?></label>
								<div class="col-sm-10">
									<input type="text" name="instagram_link" value="<?php echo $instagram_link; ?>" placeholder="<?php echo $entry_instagram; ?>" id="input-inswtagram" class="form-control" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-printerest"><?php echo $entry_printerest; ?></label>
								<div class="col-sm-10">
									<input type="text" name="pinterest_link" value="<?php echo $pinterest_link; ?>" placeholder="<?php echo $entry_printerest; ?>" id="input-printerest" class="form-control" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-website"><?php echo $entry_website; ?></label>
								<div class="col-sm-10">
									<input type="text" name="wesbsite_link" value="<?php echo $wesbsite_link; ?>" placeholder="<?php echo $entry_website; ?>" id="input-website" class="form-control" />
								</div>
							</div>					
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-whatsapp"><?php echo $entry_whatsapp_number; ?></label>
								<div class="col-sm-10">
									<input type="text" name="whatsapp_link" value="<?php echo $whatsapp_link; ?>" placeholder="<?php echo $entry_whatsapp_number; ?>" id="input-whatsapp" class="form-control" />
								</div>
							</div>						
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-sort_order"><?php echo $text_sort_order; ?></label>
								<div class="col-sm-10">
									<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $text_sort_order; ?>" id="input-whatsapp" class="form-control" />
								</div>
							</div>
							<!--end social links-->
							
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-storetin"><?php echo $entry_storestatus; ?></label>
								<div class="col-sm-10">
									<select name="store_status" class="form-control">
										<?php if($store_status) { ?>
											<option value="0"><?php echo $text_disabled?></option>
											<option value="1" selected><?php echo $text_enabled; ?></option>
											<?php } else { ?>
											<option value="0" selected><?php echo $text_disabled?></option>
											<option value="1"><?php echo $text_enabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storetin"><?php echo $text_document; ?></label> 
								<div class="col-sm-10 ptsc-storef-paddtop">
									<input type="file" name="upload_file" value="" />
									<?php if (isset($upload_file_existing)){ ?>
										<input type="hidden" name="upload_file_exiting" value="<?php echo $upload_file_existing; ?>" />
										<a target="_blank" href ="<?php echo $upload_file_existing_href; ?>"><span><?php echo $upload_file_existing; ?></span></a>
									<?php } ?>
									<div class="text"><?php echo $text_supported; ?></div>							 
									<?php if (isset($error_file_upload) && $error_file_upload !=''){ ?>
										<div class="text-danger"><?php echo $error_file_upload; ?></div>
									<?php } ?>							  
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-product-assign">
							<div class="col-sm-8">
								<div class="well well-sm ptsc-storeff-heioflow">
									<?php if($products) { ?>
										<?php foreach($products as $product) {	?>
											<div class="checkbox">
												<label for="admin_product">
												<input type="checkbox" product-id="<?php echo $product['product_id']; ?>" value="<?php echo $product['product_id']; ?>" name="product_ids[]"> <?php echo $product['name']; ?></label>
											</div>
										<?php } ?>
										<?php } else { ?>
										<?php echo $text_no_results; ?>
									<?php } ?>
								</div>
							</div>
						</div>
						
						<!-- <div class="tab-pane" id="tab-seller-shipping-charge">
							<div class="form-group">
							
							<label class="col-sm-2 control-label" for="input-storeshipping"><?php echo $entry_storeshipping; ?></label>
							<div class="col-sm-10">
							<input type="text" name="store_shipping_charge" value="<?php echo $store_shipping_charge; ?>" placeholder="<?php echo $entry_storeshipping; ?>" id="input-storeshipping" class="form-control" />
							<?php if ($error_storecharge) { ?>
								<div class="text-danger"><?php echo $error_storecharge; ?></div>
							<?php } ?>
							</div>
							</div>
						</div> -->
						
						
						<div class="tab-pane" id="tab-seller-shipping-charge">
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_storeshipping_type; ?></label>
								<div class="col-sm-4">
									<select name="store_shipping_order_type" id="input-storeshipping-type" class="form-control">
										
										<option value="pts_product_wise" <?php if ($store_shipping_order_type == 'pts_product_wise') { ?> selected="selected" <?php } ?>><?php echo $entry_product_wise; ?></option>
										<option value="pts_order_wise" <?php if ($store_shipping_order_type == 'pts_order_wise') { ?> selected="selected" <?php } ?>><?php echo $entry_order_wise; ?></option>
										
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_storeshipping_charge; ?></label>
								<div class="col-sm-4">
									<select name="store_shipping_type" id="input-store-shipping-type" onchange="showFunction()" class="form-control">
										
										<option value="pts_flat_rate_shipping" <?php if ($store_shipping_type == 'pts_flat_rate_shipping') { ?> selected="selected" <?php } ?>><?php echo $entry_store_flat_rate_shipping; ?></option>
										
										<option value="pts_matrix_shipping" <?php if ($store_shipping_type == 'pts_matrix_shipping') { ?> selected="selected" <?php } ?>><?php echo $entry_store_matrix_shipping; ?></option>
										
										<option <?php if ($store_shipping_type == 'pts_flexible_shipping') { ?> selected="selected" <?php } ?> name="store_shipping_type" value="pts_flexible_shipping"><?php echo $entry_store_flexible_shipping; ?></option>
										
									</select>
								</div>
							</div>
							
							
							
							<div class="form-group" id="div1" class="hide">
								<label class="col-sm-2 control-label" for="input-storeshipping"><?php echo $entry_storeshipping; ?></label>
								<div class="col-sm-4">
									<input type="text" name="store_shipping_charge" value="<?php echo $store_shipping_charge; ?>" placeholder="<?php echo $entry_storeshipping; ?>" id="input-storeshipping" class="form-control" />
									<?php if ($error_storecharge) { ?>
										<div class="text-danger"><?php echo $error_storecharge; ?></div>
									<?php } ?>
								</div>
							</div>
						</div>
						
						
						<div class="tab-pane" id="tab-seller-commission">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-storecommission"><?php echo $entry_sellercommission; ?></label>
								<div class="col-sm-10">
									<input type="text" name="store_commission" value="<?php echo $store_commission; ?>" placeholder="<?php echo $entry_sellercommission; ?>" id="input-storecommission" class="form-control" />
									<?php if ($error_sellercommission) { ?>
										<div class="text-danger"><?php echo $error_sellercommission; ?></div>
									<?php } ?>
								</div>
							</div>
						</div>
						<?php if ($purpletree_multivendor_allow_live_chat) { ?>
							<div class="tab-pane" id="tab-seller-live-chat">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-live-chat"><?php echo $entry_allow_live_chat; ?></label>
									<div class="col-sm-6">
										<select name="store_live_chat_enable" id="input-live-chat" class="form-control">
											
											<option value="1" <?php if($store_live_chat_enable) { ?> selected="selected" <?php } ?>><?php echo $entry_yes; ?></option>
											<option value="0" <?php if($store_live_chat_enable == 0) { ?> selected="selected" <?php } ?>><?php echo $entry_no; ?></option>
											
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-live_chat_code"><?php echo $entry_live_chat_code; ?></label>
									<div class="col-sm-6">
										<textarea rows="5" id="input-live_chat_code" name="store_live_chat_code" class="form-control"><?php echo $store_live_chat_code; ?></textarea>
									</div>
								</div>
							</div>
						<?php } ?>
						
						<!-- pay-pal -->
						
						<div class="tab-pane" id="tab-seller-paypal-details">						 
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-seller-paypal-details"><?php echo $entry_seller_paypal_id;?></label>
								<div class="col-sm-4">
									<input type="text" id="input-seller-paypal-details" name="seller_paypal_id" class="form-control" value="<?php echo $seller_paypal_id; ?>" />
									<?php if ($error_seller_paypal_id) { ?>
										<div class="text-danger"><?php echo $error_seller_paypal_id; ?></div>
									<?php } ?>
								</div>
							</div>
						</div>
						<?php if ($storepage_layout) { ?>
							<div class="tab-pane" id="tab-seller-timing-details">	
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-timings"><?php echo $entry_storedescription; ?></label>
									<div class="col-sm-10">
										<textarea name="store_timings" class="form-control summernote"><?php echo $store_timings;?></textarea>
									</div>
								</div>			
							</div>
						<?php } ?>
						
						<!-- pay-pal -->
						<!-- Vacation -->
						<div class="tab-pane" id="tab-vacation">
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-vacation"><?php echo $entry_vacation; ?></label>
								<div class="col-sm-6">
									<select name="vacation" id="input-vacation" class="form-control">
										<option value="1" <?php if ($vacation) { ?> selected="selected" <?php } ?>><?php echo $entry_yes; ?></option>
										<option value="0" <?php if ($vacation==0) { ?> selected="selected" <?php } ?>><?php echo $entry_no; ?></option>                             
									</select>
								</div>
							</div>
							<div class="row">
							<h4 class="ptsc-storef-marglt"><?php echo $text_store_opening; ?></h4>
							</div>
							<div class="form-group row">
							 <label class="col-sm-3 control-label col-form-label" for="input-sunday1"><?php echo $text_open; ?></label>
							 <label class="col-sm-3 control-label col-form-label" for="input-sunday1"><?php echo $text_close; ?></label>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-sunday1o"><?php echo $text_sunday; ?></label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[1][open]" value="<?php echo $sunday_open; ?>" placeholder="" id="input-sunday1o" class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[1][close]" value="<?php echo $sunday_close; ?>" placeholder="" id="input-sunday1c" class="form-control time" />                      
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-monday2o"><?php echo $text_monday; ?></label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[2][open]" value="<?php echo $monday_open; ?>" placeholder="" id="input-monday2o" class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[2][close]" value="<?php echo $monday_close; ?>" placeholder="" id="input-monday2p" class="form-control time" />                      
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-tuesday3o"><?php echo $text_tuesday; ?></label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[3][open]" value="<?php echo $tuesday_open; ?>" placeholder="" id="input-tuesday3o" class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[3][close]" value="<?php echo $tuesday_close; ?>" placeholder="" id="input-tuesday3c" class="form-control time" />                      
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-wednesday4o"><?php echo $text_wednesday; ?></label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[4][open]" value="<?php echo $wednesday_open; ?>" placeholder="" id="input-wednesday4o" class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[4][close]" value="<?php echo $wednesday_close; ?>" placeholder="" id="input-wednesday4c" class="form-control time" />                      
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-thursday5o"><?php echo $text_thursday; ?> </label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[5][open]" value="<?php echo $thursday_open; ?>" placeholder="" id="input-thursday5o" class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[5][close]" value="<?php echo $thursday_close; ?>" placeholder="" id="input-thursday5c" class="form-control time" />                      
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-friday6o"><?php echo $text_friday; ?></label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[6][open]" value="<?php echo $friday_open; ?>" placeholder="" id="input-friday6o" class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[6][close]" value="<?php echo $friday_close; ?>" placeholder="" id="input-friday6c" class="form-control time" />                      
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 control-label col-form-label" for="input-saturday7o"><?php echo $text_saturday; ?></label>
								<div class="col-sm-3">
									<input type="text" name="store_timing[7][open]" value="<?php echo $saturday_open; ?>" placeholder="" id="input-saturday7o"class="form-control time" />                      
								</div>
								<div class="col-sm-3">
									<input type="text" name="store_timing[7][close]" value="<?php echo $saturday_close; ?>" placeholder="" id="input-saturday7c" class="form-control time" />                      
								</div>
													
						</div>
						<div class="row">
							<h4 class="ptsc-storef-marglt"><?php echo $text_holiday; ?></h4>
							</div>
							
				<div class="table-responsive">
                <table id="holiday" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $text_date; ?></td>
                      <td><?php echo $text_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>                 
				   <?php $holiday_row = 0; ?>
				   <?php foreach ($store_holiday as $store_holiday1) { ?>
					<tr id="holiday_row<?php echo $holiday_row; ?>">
						<td class="text-left">
						<input type="text" data-date-format="YYYY-MM-DD" name="input-date-holiday[<?php echo $holiday_row; ?>]" value="<?php echo $store_holiday1['date']; ?>" placeholder="" id="holiday_row<?php echo $holiday_row; ?>"class="form-control date" />
					 </td> 	
					
					 <td class="text-left"><button type="button" onclick="$('#holiday_row<?php echo $holiday_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
					
					  </tr>
					  <?php $holiday_row = $holiday_row + 1 ;?>
					  <?php } ?>					  
					  
						</tbody>
					  
					  <tfoot>
						<tr>
						  <td colspan="1"></td>
						  <td class="text-left"><button type="button" onclick="holiday();" data-toggle="tooltip" title="add holiday" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
						</tr>
					  </tfoot>
					</table>
				  </div>
						</div>
						<!-- CustomFileds -->
					<div class="tab-pane" id="tab-customfields">
						<?php foreach ($custom_fields as $custom_field) { ?>
                      <?php if ($custom_field['location'] == 'account') { ?>
                      <?php if ($custom_field['type'] == 'select') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'radio') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="radio">
								<?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                            <?php } ?>
                          </div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'checkbox') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="checkbox">
                              <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                            <?php } ?>
                          </div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'text') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'textarea') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'file') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                          <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
						  <a target="_blank" href="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]['url']) ? $account_custom_field[$custom_field['custom_field_id']]['url'] : ''); ?>"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]['file']) ? $account_custom_field[$custom_field['custom_field_id']]['file'] : ''); ?></a>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'date') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group date">
                            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'time') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group time">
                            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'datetime') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group datetime">
                            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
					</div>
		<!-- Assign Multiple Store-->
		<?php if ($use_domain_wise_stores) { ?>
				<div class="tab-pane" id="tab-multiple-store">
					<div class="form-group">
						<label class="col-sm-2 control-label">
						<?php echo $entry_multi_store; ?>
						</label>
						<div class="col-sm-10">
						<div class="well well-sm ptsc-storef-heioflow"> 
						  <?php foreach($assignmstores as $store){ ?>
							  <div class="checkbox">
								<label> 
								  <input type="checkbox" name="multiple_store[]" value="<?php echo $store['store_id']; ?>" <?php if($store['checked']=='checked'){ ?> checked="checked" <?php } ?> />
										<?php echo $store['name']; ?>
								 </label>
							  </div>
						<?php } ?>
						</div>
						</div>
					</div>
				</div>
		<?php } ?>
		<!-- Assign Multiple Store-->	
						<?php if (isset($check_category_bar)) { ?>
							<div class="tab-pane card" id="tab-category-assign">
								<div class="col-sm-12">
									<div class="form-group py-1 required row">
										<label class="col-md-3 control-label col-form-label" for="input-name">Allow category</label>
										<div class="col-md-9">
											<select name="type" class="form-control">
												<?php if ($type!=0) { ?>
													<option value="0">Allow selected categories</option>
													<option value="1" selected="selected">Allowed all categories</option>
													<?php } else { ?>
													<option value="0" selected="selected">Allow selected categories</option>
													<option value="1">Allowed all categories</option>
												<?php } ?>
											</select>
											<?php if ($type!=0) { ?>
												<input type="text" name="category" value="" disabled id="input-category" class="form-control" />
												<?php } else { ?>
												<input type="text" name="category" value="" id="input-category" class="form-control" />
											<?php } ?>
											<div id="product-category" class="well well-sm ptsc-storef-heioflow">
												<?php if (!empty($allow_category)) { ?>
													<?php foreach($allow_category as $key=> $product_category) { ?>
														<div id="product-category<?php echo $product_category; ?>"><i class="fa fa-minus-circle"></i> <?php echo $key; ?> 
															<?php if ($type!=0) { ?> <?php } else { ?>
																<input type="hidden" name="allow_category[]" value="y<?php echo $product_category; ?>"/>
															<?php } ?>
														</div>
													<?php } ?>
												<?php } ?>
											</div>
										</div> 
									</div>
								</div>
							</div>
						<?php } ?>		
						<div class="tab-pane" id="tab-seller-payments">
							<div class="well clearfix">
								<div class="col-sm-3"><h4><?php echo $commission_list['text_total_sale']; ?></h4> <?php echo (($commission_list['total_sale'])?$commission_list['total_sale']:0);?></div>
								<div class="col-sm-3"><h4><?php echo $commission_list['text_total_commission']; ?></h4> <?php echo (($commission_list['total_commission'])?$commission_list['total_commission']:0);?></div>
								<div class="col-sm-3"><h4><?php echo $commission_list['text_recvd_amt']; ?></h4> <?php echo (($commission_list['total_rcvd_amt'])?$commission_list['total_rcvd_amt']:0);?></div>
								<div class="col-sm-3"><h4><?php echo $commission_list['text_pending_amt']; ?></h4> <?php echo (($commission_list['total_pending_amt'])?($commission_list['total_pending_amt']):0);?></div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sellertransaction"><?php echo $payment_list['text_trnasaction']; ?></label>
								<div class="col-sm-10">
									<input type="text" name="seller_transaction" value="" placeholder="<?php echo $payment_list['text_trnasaction']; ?>" id="input-sellertransaction" class="form-control" />
									<input type="hidden" name="remaining_amount" value="<?php echo (($commission_list['total_pending_amt_1'])?($commission_list['total_pending_amt_1']):0);?>">
									<?php if ($error_sellertransaction) { ?>
										<div class="text-danger"><?php echo $error_sellertransaction; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-selleramount"><?php echo $payment_list['text_amount']; ?></label>
								<div class="col-sm-10">
									<input type="text" name="seller_amount" value="" placeholder="<?php echo $payment_list['text_amount']; ?>" id="input-selleramount" class="form-control" />
									<?php if ($error_selleramount) { ?>
										<div class="text-danger"><?php echo $error_selleramount; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-paymode"><?php echo $payment_list['text_payment_mode']; ?></label>
								<div class="col-sm-10">
									<input type="text" name="seller_payment" value="" placeholder="<?php echo $payment_list['text_payment_mode']; ?>" id="input-paymode" class="form-control" />
									<?php if ($error_sellerpaymode) { ?>
										<div class="text-danger"><?php echo $error_sellerpaymode; ?></div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<link href="view/javascript/codemirror/lib/codemirror.css" rel="stylesheet" />
	<link href="view/javascript/codemirror/theme/monokai.css" rel="stylesheet" />
	<script type="text/javascript" src="view/javascript/codemirror/lib/codemirror.js"></script> 
	<script type="text/javascript" src="view/javascript/codemirror/lib/xml.js"></script> 
	<script type="text/javascript" src="view/javascript/codemirror/lib/formatting.js"></script> 
	<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
	<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />	 
	<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script> 
	
	<?php if($purpletree_multivendor_subscription_plans==1){ ?>
		<!-- Modal -->
		<div class="modal pts-sidenav fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog"  id="mySidenav">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h2 class="modal-title text-center" id="myModalLabel"><?php echo $entry_subscription_plans; ?></h2>
					</div>
					
					<div class="modal-body">
						<div id="errorplan" class="text-danger"></div>
						<div class="inputgroup">	
							<?php if(!empty($subscription_plan)){
								foreach($subscription_plan as $key=> $values){
								?>
								<div class="radio">
									<span class="plans ptsc-plans">
										
										<label><input type="radio" name="optradio" class="plan" value="<?php echo $values['plan_id'];?>" ><span class="plans ptsc-plans"><?php echo $values['plan_name'];?></span></label>
										
									</span>
									<input type="hidden" name="productID" value="">
								</div>
							<?php } } else { ?>
							<div class="radio">
								<span class="plans ptsc-plans">
									
								<label><?php echo 'Plan not found!';?></span></label>
								
							</span>
							<input type="hidden" name="productID" value="">
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary sub1" id="sub1"><?php echo $button_save; ?></button>
				</div>
				
			</div>
		</div>
	</div>
	<!--/ popup model-->	
	<script>
		$('input[type="checkbox"]').on('change', function(e){
		if(e.target.checked){
		var product_id = $(this).attr('product-id');
		$('#myModal').modal('show');
		$('input[product-id='+product_id+']').prop('checked', false);
		$('input[name="productID"]').val(product_id);
		$('#errorplan').css('display','none');
		}
		});
		
		$('button[id="sub1"]').click(function () {
		var plan_id=$('input[name="optradio"]:checked').val();
		var product_id=$('input[name="productID"]').val();
		
		
		if(plan_id){
		$.ajax({
		url: 'index.php?route=purpletree_multivendor/stores/getSubscriptionPlan&token=<?php echo $token; ?>&seller_id=<?php echo $seller_id; ?>&product_id='+product_id+'&plan_id='+plan_id,
		dataType: 'json',
		success: function(json) {
		if(json['success']){
		$('#myModal').modal('hide');
		$("html, body").animate({ scrollTop: 0 }, "slow");
		$('input[name="productID"]').val("");
		$('input[product-id='+json['product_id']+']').parent().parent().remove();
		$('#psuccess').css('display','block');
		$('#successmsg').html(json['success']);		
		}
		if(json['error']){
		$('#errorplan').css('display','block');
		$('#errorplan').html(json['error']);	
		}
		},
		error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
		}); 
		} else {
		$('#errorplan').css('display','block');
		$('#errorplan').html('Please select Subscription Plan');
		} 
		
		
		});
	</script>
<?php } ?>



<script type="text/javascript"><!--
	$('input[name="chkBestSeller"]').click(function () {
		// function sellerSubscriptionPlan(seller_id,product_id){
		$.ajax({
			url: 'index.php?route=purpletree_multivendor/stores/getSubscriptionPlan&token=<?php echo $token; ?>&seller_id=' + seller_id+'&product_id='+product_id,
			dataType: 'json',
			success: function(json) {
				
				//html = '<option value=""><?php echo $text_select; ?></option>';
				
				$('select[name=\'store_state\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		}); 
	}); 
	
	
	function country(element,zone_id) { 
		$.ajax({
			url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + element.value,
			dataType: 'json',
			beforeSend: function() {
				$('select[name=\'store_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
			},
			complete: function() {
				$('.fa-spin').remove();
			},
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('input[name=\'store_zipcode]\']').parent().parent().addClass('required');
					} else {
					$('input[name=\'store_zipcode\']').parent().parent().removeClass('required');
				}
				
				html = '<option value=""><?php echo $text_select; ?></option>';
				
				if (json['zone'] && json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
						html += '<option value="' + json['zone'][i]['zone_id'] + '"';
						
						if (json['zone'][i]['zone_id'] == zone_id) {
							html += ' selected="selected"';
						}
						
						html += '>' + json['zone'][i]['name'] + '</option>';
					}
					} else {
					html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>'; 
				}
				
				$('select[name=\'store_state\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
	
	$('select[name$=\'store_country\']').trigger('change');
	
	function showFunction() {
	  var shipping_type = document.getElementById("input-store-shipping-type").value;
	  if(shipping_type == 'pts_matrix_shipping'){
		document.getElementById('div1').style.display ='none';
	  }else{
	    document.getElementById('div1').style.display = 'block';
	  }
	}
	$(window).load(function(){
		<?php if ($store_shipping_type == 'pts_matrix_shipping') { ?>
			document.getElementById('div1').style.display ='none';
		<?php } ?>
	})
//--></script>  
<script type="text/javascript"><!--
	$(document).ready(function(){
		var allowedCat = '<?php echo $type; ?>';
		if(allowedCat==0){
			allowedCat = '0';
		}
		if(!allowedCat){
			$('select[name="type"]').val(1);
			$('#input-category').prop('disabled', true);
			
			$('#product-category').empty();
			$.ajax({
				url:'index.php?route=purpletree_multivendor/sellerproducts/assignCategory&token=<?php echo $token; ?>&filter_name=',
				dataType: 'json',
				success: function(json) {
					$.map(json, function(item) {
						$('#product-category').append('<div id="product-category' + item['category_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '<input type="hidden" name="allow_category[]" value="' + item['category_id'] + '" /></div>');
					});
				}
			});
		}
	});
	$('select[name="type"]').on('change', function(){
		var selectid = $(this).val();
		if(selectid=="1"){
			$('#input-category').prop('disabled', true);
			
			$('#product-category').empty();
			$.ajax({
				url:'index.php?route=purpletree_multivendor/sellerproducts/assignCategory&token=<?php echo $token; ?>&filter_name=',
				dataType: 'json',
				success: function(json) {
					$.map(json, function(item) {
						$('#product-category').append('<div id="product-category' + item['category_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '<input type="hidden" name="allow_category[]" value="' + item['category_id'] + '" /></div>');
					});
				}
			});
			
			} else{
			$('#input-category').prop('disabled', false);
			$('#product-category').empty();
			$.ajax({
				url:'index.php?route=extension/module/purpletree_multivendor/getSelectedCategory&token=<?php echo $token; ?>&filter_name=',
				dataType: 'json',
				success: function(json) {
					$.map(json, function(item) {
						$('#product-category').append('<div id="product-category' + item['category_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '<input type="hidden" name="allow_category[]" value="' + item['category_id'] + '" /></div>');
					});
				}
			});
		}
	});
	$('input[name=\'category\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url:'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
			
			$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="allow_category[]" value="' + item['value'] + '" /></div>');
		}
	});
	
	$('#product-category').delegate('.fa-minus-circle', 'click', function() {
		
		var cat_id = $(this).next().val();
		var div_remov = $(this).parent();
		$.ajax({
			url:'index.php?route=purpletree_multivendor/sellerproducts/checkCategoryassign&token=<?php echo $token; ?>&filter_name='+cat_id,
			type: 'GET',
			success: function(result) {
				if(result > 0){
					alert("Assign Categories");
					} else{ 
					div_remov.remove();
				}
			}
		});
	});
	$('button[id^=\'button-custom-field\']').on('click', function() {
	var element = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" class="ptsc-storefrm-nodisplay"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
 	
	if (typeof timer != 'undefined') {
		clearInterval(timer);
	}
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				 url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(element).button('loading'); 
				},
				complete: function() {
					$(element).button('reset');
				},
				success: function(json) {
					$(element).parent().find('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(element).parent().find('input').val(json['code']);
						$(element).parent().find('a').remove();
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500); 
});
$('.date').datetimepicker({
	//language: '<?php echo $datepicker; ?>',
	pickTime: false
});

$('.time').datetimepicker({
	//language: '<?php echo $datepicker; ?>',
	pickDate: false
});

$('.datetime').datetimepicker({
	//language: '<?php echo $datepicker; ?>',
	pickDate: true,
	pickTime: true
});
var holiday_row = '<?php echo $holiday_row; ?>';

function holiday() {	
	html = '<tr id="holiday_row' + holiday_row + '">';
	html += '<td class="text-left">';
	html += '<input type="text" data-date-format="YYYY-MM-DD" name="input-date-holiday[ '+ holiday_row + ']" value="" placeholder="" id="holiday_row' + holiday_row + '"class="form-control date" />';
	html += '</td>';
	html += '<td class="text-left">';
	html += '<button type="button" onclick="$(\'#holiday_row' + holiday_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
	html += '</td>';
	html += '</tr>';
	$('#holiday tbody').append(html);
	$('.date').datetimepicker({
		pickTime: false
	});
	holiday_row++;
}
// seller area 
  $('input[name=\'sellerarea\']').autocomplete({
	  'source': function(request, response) {
		  $.ajax({
			  url: 'index.php?route=purpletree_multivendor/stores/sellerarea&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
			  dataType: 'json',
			  success: function(json) {
				  response($.map(json, function(item) {
					  return {
						  label: item['name'],
						  value: item['area_id']
					  }
				  }));
			  }
		  });
	  },
	  'select': function(item) {
		  $('input[name=\'sellerarea \']').val('');

		  $('#seller-area' + item['value']).remove();

		  $('#seller-area').append('<div id="seller-area' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="seller_area[]" value="' + item['value'] + '" /></div>');
	  }
  });

  $('#seller-area').delegate('.fa-minus-circle', 'click', function() {
	  $(this).parent().remove();
  });
  $('select[name="seller_area_selection_type"]').on('change', function(){
		var selectid = $(this).val();
		if(selectid=="0"){
			$('#input-sellerarea').prop('disabled', true);			
			$('#seller-area').empty();			
			} else{
			$('#input-sellerarea').prop('disabled', false);			
		}
	});
//--></script>
<?php echo $footer; ?> 
