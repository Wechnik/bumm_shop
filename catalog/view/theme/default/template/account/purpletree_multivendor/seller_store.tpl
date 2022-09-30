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
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="pts-form-horizontal">
				<fieldset>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storename"><?php echo $entry_name; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="seller_name" disabled value="<?php echo $seller_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="pts-form-control" />
							<input type="hidden" name="seller_name" value="<?php echo $seller_name; ?>" />
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storename"><?php echo $entry_storename; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_name" value="<?php echo $store_name; ?>" placeholder="<?php echo $entry_storename; ?>" id="input-storename" class="pts-form-control" />
							<?php if ($error_storename) { ?>
								<div class="text-danger"><?php echo $error_storename; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_storelogo; ?></label>
						<div class="pts-col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail img-left"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
							<input type="hidden" name="store_logo" value="<?php echo $store_logo; ?>" id="input-storelogo" />
						</div>
					</div>
					<div class="pts-form-group ">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php echo $entry_storephone; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_phone" value="<?php echo $store_phone; ?>" placeholder="<?php echo $entry_storephone; ?>" id="input-storephone" class="pts-form-control" />
							<?php if ($error_storephone) { ?>
								<div class="text-danger"><?php echo $error_storephone; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php echo $entry_facebook; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="facebook_link" value="<?php echo $facebook_link ?>" placeholder="<?php echo $entry_facebook; ?>" id="input-storephone" class="pts-form-control" />
						</div>
					</div>
					
					<!--<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php// echo $entry_google; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="google_link" value="<?php //echo $google_link ?>" placeholder="<?php //echo $entry_google; ?>" id="input-storephone" class="pts-form-control" />
						</div>
					</div>-->	
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php echo $entry_twitter; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="twitter_link" value="<?php echo $twitter_link ?>" placeholder="<?php echo $entry_twitter; ?>" id="input-storephone" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php echo $entry_instagram; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="instagram_link" value="<?php echo $instagram_link ?>" placeholder="<?php echo $entry_instagram; ?>" id="input-storephone" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php echo $entry_printerest; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="pinterest_link" value="<?php echo $pinterest_link ?>" placeholder="<?php echo $entry_printerest; ?>" id="input-storephone" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storephone"><?php echo $entry_website; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="wesbsite_link" value="<?php echo $wesbsite_link ?>" placeholder="<?php echo $entry_website; ?>" id="input-storephone" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-whatsapp"><?php echo $entry_whatsapp_number; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="whatsapp_link" value="<?php echo $whatsapp_link; ?>" placeholder="<?php echo $entry_whatsapp_number; ?>" id="input-whatsapp" class="pts-form-control" />
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-google_add_link"><?php echo $entry_google_add_link; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="google_map_link" value="<?php echo $google_map_link; ?>" placeholder="<?php echo $entry_google_add_link; ?>" id="input-google_add_link" class="pts-form-control" />
						</div>
					</div>
					<?php if ($storepage_layout) { ?>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-whatsapp"><?php echo $entry_youtube_link; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="store_video" value="<?php echo $store_video; ?>" placeholder="<?php echo $entry_youtube_link; ?>" id="input-youtube" class="pts-form-control" />
							</div>
						</div>		
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-whatsapp"><?php echo $entry_google_map; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="google_map" value="<?php echo $google_map; ?>" placeholder="<?php echo $entry_google_map; ?>" id="input-google" class="pts-form-control" />
							</div>
						</div>
					<?php } ?>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_storebanner; ?></label>
						<div class="pts-col-sm-10"><a href="" id="banner-thumb-image" data-toggle="image" class="img-thumbnail img-left"><img src="<?php echo $banner_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
							<input type="hidden" name="store_banner" value="<?php echo $store_banner; ?>" id="input-storebanner" /><br>
							<div class="entry_storebanner_desc"><?php echo $entry_storebanner_desc; ?></div>
						</div>
					</div>
					<?php if ($storepage_layout) { ?>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_store_image; ?></label>
							<div class="pts-col-sm-10"><a href="" id="image-thumb-image" data-toggle="image" class="img-thumbnail img-left"><img src="<?php echo $image_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="store_image" value="<?php echo $store_image; ?>" id="input-storeimage" /><br>
								<?php echo $entry_storeimage_desc; ?>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-storetimes"><?php echo $entry_times; ?></label>
							<div class="pts-col-sm-10">
								<textarea name="store_timings" data-toggle="summernote" id="input-storedescription" class="pts-form-control summernote ckeditor"><?php echo $store_timings; ?></textarea>
							</div>
						</div>
					<?php } ?>
					<div class="pts-form-group ">
						<label class="pts-col-sm-2 pts-control-label" for="input-storedescription"><?php echo $entry_storedescription; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_description" class="pts-form-control summernote"><?php echo $store_description;?></textarea>
							<?php if ($error_storedescription) { ?>
								<div class="text-danger"><?php echo $error_storedescription; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storeaddress"><?php echo $entry_storeaddress; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_address" class="pts-form-control" rows="5"><?php echo $store_address; ?></textarea>
							<?php if ($error_storeaddress) { ?>
								<div class="text-danger"><?php echo $error_storeaddress; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storecity"><?php echo $entry_storecity; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_city" value="<?php echo $store_city; ?>" placeholder="<?php echo $entry_storecity; ?>" id="input-storecity" class="pts-form-control" />
							<?php if ($error_storecity) { ?>
								<div class="text-danger"><?php echo $error_storecity; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storecountry"><?php echo $entry_storecountry; ?></label>
						<div class="pts-col-sm-10">
							<select name="store_country" id="input-storecountry" onchange="country(this.value,'<?php echo $store_state; ?>');" class="pts-form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $store_country) { ?>
										<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
							<?php  if (isset($error_storecountry) && $error_storecountry != '') { ?>
								<div class="text-danger"><?php echo $error_storecountry; ?></div>
							<?php }  ?>
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storestate"><?php echo $entry_storezone; ?></label>
						<div class="pts-col-sm-10">
							<select name="store_state" id="input-storestate" class="pts-form-control">
							</select>
							<?php if (isset($error_storezone) && $error_storezone != '') { ?>
								<div class="text-danger"><?php echo $error_storezone; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group ">
						<label class="pts-col-sm-2 pts-control-label" for="input-storezipcode"><?php echo $entry_storepostcode; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_zipcode" value="<?php echo $store_zipcode; ?>" placeholder="<?php echo $entry_storepostcode; ?>" id="input-storezipcode" class="pts-form-control" />
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
								 
								  <div id="seller-area" class="well well-sm ptsc-product-heigoflow"> 
								  <?php foreach ($sellerareas as $sellerarea) { ?>
									  <div id="seller-area<?php echo $sellerarea['area_id'];?>"><i class="fa fa-minus-circle"></i> <?php echo $sellerarea['name'];?>
										<input type="hidden" name="seller_area[]" value="<?php echo $sellerarea['area_id'] ;?>"/>
								      </div>
									<?php } ?></div>
								</div>
						 </div>
					<!-- End seller area -->
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storeshipping"><?php echo $entry_storeshippingpolicy; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_shipping_policy" class="pts-form-control summernote"><?php echo $store_shipping_policy;?></textarea>
							<?php if ($error_storeshipping) { ?>
								<div class="text-danger"><?php echo $error_storeshipping; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storereturn"><?php echo $entry_storereturn; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_return_policy" class="pts-form-control summernote"><?php echo $store_return_policy;?></textarea>
							<?php if ($error_storereturn) { ?>
								<div class="text-danger"><?php echo $error_storereturn; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group ">
						<label class="pts-col-sm-2 pts-control-label" for="input-storemetakeyword"><?php echo $entry_storemetakeyword; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_meta_keywords" class="pts-form-control" rows="5"><?php echo $store_meta_keywords; ?></textarea>
							<?php if ($error_storemetakeyword) { ?>
								<div class="text-danger"><?php echo $error_storemetakeyword; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group ">
						<label class="pts-col-sm-2 pts-control-label" for="input-storemetadescription"><?php echo $entry_storemetadescription; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_meta_description" class="pts-form-control" rows="5"><?php echo $store_meta_description; ?></textarea>
							<?php if ($error_storemetadescription) { ?>
								<div class="text-danger"><?php echo $error_storemetadescription; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group ">
						<label class="pts-col-sm-2 pts-control-label" for="input-storebankdetail"><?php echo $entry_storebankdetail; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="store_bank_details" class="pts-form-control" rows="5"><?php echo $store_bank_details; ?></textarea>
							<?php if ($error_storebankdetail) { ?>
								<div class="text-danger"><?php echo $error_storebankdetail; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storetin"><?php echo $entry_storetin; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_tin" value="<?php echo $store_tin; ?>" placeholder="" id="input-storetin" class="pts-form-control" />
							<?php if ($error_storetin) { ?>
								<div class="text-danger"><?php echo $error_storetin; ?></div>
							<?php } ?>
						</div>
					</div>
					<!-- <div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storeshipping"><?php echo $entry_storeshipping; ?></label>
						<div class="pts-col-sm-10">
						<input type="text" name="store_shipping_charge" value="<?php echo $store_shipping_charge; ?>" placeholder="<?php echo $entry_storeshipping; ?>" id="input-storeshipping" class="pts-form-control" />
						<?php if ($error_storecharge) { ?>
							<div class="text-danger"><?php echo $error_storecharge; ?></div>
						<?php } ?>
						</div>
					</div> -->
		  <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control">
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
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
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
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
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
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
			  <a target="_blank" href="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]['url']) ? $account_custom_field[$custom_field['custom_field_id']]['url'] : ''); ?>"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]['file']) ? $account_custom_field[$custom_field['custom_field_id']]['file'] : ''); ?></a>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
                <span class="input-group-btn">
                <button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
                <span class="input-group-btn">
                <button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="pts-form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> pts-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="pts-col-sm-2 pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="pts-col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
                <span class="input-group-btn">
                <button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
					<!-- start shipping -->
					
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-newsletter"><?php echo $entry_storeshipping_type; ?></label>
						<div class="pts-col-sm-10">
                            <select name="store_shipping_order_type" id="input-storeshipping-type" class="form-control">
								
								<option value="pts_product_wise" <?php if ($store_shipping_order_type == 'pts_product_wise') { ?> selected="selected" <?php } ?>><?php echo $entry_product_wise; ?></option>
								<option value="pts_order_wise" <?php if ($store_shipping_order_type == 'pts_order_wise') { ?> selected="selected" <?php } ?>><?php echo $entry_order_wise; ?></option>
								
							</select>
						</div>
					</div>
					
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-newsletter"><?php echo $entry_storeshipping_charge; ?></label>
						<div class="pts-col-sm-10">
                            <select name="store_shipping_type" id="input-store-shipping-type" class="form-control">
								
								<option value="pts_flat_rate_shipping" onclick="show2();" <?php if ($store_shipping_type == 'pts_flat_rate_shipping') { ?> selected="selected" <?php } ?>><?php echo $entry_store_flat_rate_shipping; ?></option>
								
								<option value="pts_matrix_shipping" <?php if ($store_shipping_type == 'pts_matrix_shipping') { ?> selected="selected" <?php } ?>  onclick="show1();"><?php echo $entry_store_matrix_shipping; ?></option>
								
								<option <?php if ($store_shipping_type == 'pts_flexible_shipping') { ?> selected="selected" <?php } ?> name="store_shipping_type" value="pts_flexible_shipping" onclick="show2();"><?php echo $entry_store_flexible_shipping; ?></option>
								
							</select>
						</div>
					</div>
					
					<div class="pts-form-group" id="div1" class="hide">
						<label class="pts-col-sm-2 pts-control-label" for="input-storeshipping"><?php echo $entry_storeshipping; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_shipping_charge" value="<?php echo $store_shipping_charge; ?>" placeholder="<?php echo $entry_storeshipping; ?>" id="input-storeshipping" class="pts-form-control" />
							<?php if ($error_storecharge) { ?>
								<div class="text-danger"><?php echo $error_storecharge; ?></div>
							<?php } ?>
						</div>
					</div>
					<!-- end shipping -->
					
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storeshipping"><?php echo $entry_storeseo; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" name="store_seo" value="<?php echo $store_seo; ?>" placeholder="<?php echo $entry_storeseo; ?>" id="input-storeseo" class="pts-form-control" />
							<?php if ($error_storeseo) { ?>
								<div class="text-danger"><?php echo $error_storeseo; ?></div>
							<?php } ?>
						</div>
					</div>
					<?php if ($purpletree_multivendor_allow_live_chat) { ?>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-live-chat"><?php echo $entry_allow_live_chat; ?></label>
							<div class="pts-col-sm-10">
								<select name="store_live_chat_enable" id="input-live-chat" class="pts-form-control">
									
									<option value="1" <?php if($store_live_chat_enable) { ?> selected="selected" <?php } ?>><?php echo $text_yes; ?></option>
									<option value="0" <?php if($store_live_chat_enable == 0) { ?> selected="selected" <?php } ?>><?php echo $text_no; ?></option>
									
								</select>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-live_chat_code"><?php echo $entry_live_chat_code; ?></label>
							<div class="pts-col-sm-10">
								<textarea id="input-live_chat_code" name="store_live_chat_code" class="pts-form-control" rows="5"><?php echo $store_live_chat_code; ?></textarea>
							</div>
						</div>
					<?php } ?>
					<!-- paypal -->
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-seller-paypal-id">
						<?php echo $entry_seller_paypal_id; ?></label>
						<div class="pts-col-sm-10">
							<input type="text" id="input-seller-paypal-id" name="seller_paypal_id" class="pts-form-control" value="<?php echo $seller_paypal_id; ?>" />
							<?php if($error_seller_paypal_id){ ?>
								<div class="text-danger"><?php echo $error_seller_paypal_id; ?></div>
							<?php } ?>
						</div>
					</div>
					<!-- End paypal -->
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-vacation-type"><?php echo $entry_vacation; ?></label>
						<div class="pts-col-sm-10">
							<select name="vacation" id="input-vacation-type" class="pts-form-control">
								<option value="1"<?php if($vacation) { ?> selected="selected" <?php } ?>><?php echo $text_yes; ?></option>
								<option value="0"<?php if($vacation ==0){ ?> selected="selected" <?php } ?>><?php echo $text_no; ?></option>
							</select>
						</div>
					</div>
					<div class="pts-row">
							<h4 class="ptsc-store-marglt"><?php echo $text_store_opening; ?></h4>
							</div>
							<div class="pts-form-group pts-row <?php if(!empty( $column_right)){ ?> pts-store-time-heading1 <?php }else{  ?> pts-store-time-heading <?php } ?>">
							 <label class="pts-col-sm-3 pts-control-label pts-col-form-label" for="input-sunday1"><?php echo $text_open; ?></label>
							 <label class="pts-col-sm-3 pts-control-label pts-col-form-label" for="input-sunday1"><?php echo $text_close; ?></label>
							</div>
							<div class="pts-form-group pts-row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-sunday1o"><?php echo $text_sunday; ?></label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[1][open]" value="<?php echo $sunday_open; ?>" placeholder="" id="input-sunday1o" class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[1][close]" value="<?php echo $sunday_close; ?>" placeholder="" id="input-sunday1c" class="pts-form-control time" />                      
								</div>
							</div>
							<div class="pts-form-group row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-monday2o"><?php echo $text_monday; ?></label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[2][open]" value="<?php echo $monday_open; ?>" placeholder="" id="input-monday2o" class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[2][close]" value="<?php echo $monday_close; ?>" placeholder="" id="input-monday2p" class="pts-form-control time" />                      
								</div>
							</div>
							<div class="pts-form-group pts-row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-tuesday3o"><?php echo $text_tuesday; ?></label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[3][open]" value="<?php echo $tuesday_open; ?>" placeholder="" id="input-tuesday3o" class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[3][close]" value="<?php echo $tuesday_close; ?>" placeholder="" id="input-tuesday3c" class="pts-form-control time" />                      
								</div>
							</div>
							<div class="pts-form-group pts-row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-wednesday4o"><?php echo $text_wednesday; ?></label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[4][open]" value="<?php echo $wednesday_open; ?>" placeholder="" id="input-wednesday4o" class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[4][close]" value="<?php echo $wednesday_close; ?>" placeholder="" id="input-wednesday4c" class="pts-form-control time" />                      
								</div>
							</div>
							<div class="pts-form-group pts-row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-thursday5o"><?php echo $text_thursday; ?> </label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[5][open]" value="<?php echo $thursday_open; ?>" placeholder="" id="input-thursday5o" class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[5][close]" value="<?php echo $thursday_close; ?>" placeholder="" id="input-thursday5c" class="pts-form-control time" />                      
								</div>
							</div>
							<div class="pts-form-group pts-row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-friday6o"><?php echo $text_friday; ?></label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[6][open]" value="<?php echo $friday_open; ?>" placeholder="" id="input-friday6o" class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[6][close]" value="<?php echo $friday_close; ?>" placeholder="" id="input-friday6c" class="pts-form-control time" />                      
								</div>
							</div>
							<div class="pts-form-group pts-row">
								<label class="pts-col-sm-2 pts-control-label pts-col-form-label" for="input-saturday7o"><?php echo $text_saturday; ?></label>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[7][open]" value="<?php echo $saturday_open; ?>" placeholder="" id="input-saturday7o"class="pts-form-control time" />                      
								</div>
								<div class="pts-col-sm-3">
									<input type="text" name="store_timing[7][close]" value="<?php echo $saturday_close; ?>" placeholder="" id="input-saturday7c" class="pts-form-control time" />                      
								</div>
													
						</div>
						<div class="pts-row">
							<h4 class="ptsc-store-marglt"><?php echo $text_holiday; ?></h4>
							</div>
							
				<div class="pts-table-responsive">
                <table id="holiday" class="pts-table pts-table-striped pts-table-bordered pts-table-hover">
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
						<td class="pts-text-left">
						<input type="text" data-date-format="YYYY-MM-DD" name="input-date-holiday[<?php echo $holiday_row; ?>]" value="<?php echo $store_holiday1['date']; ?>" placeholder="" id="holiday_row<?php echo $holiday_row; ?>"class="pts-form-control date" />
					 </td> 	
					
					 <td class="pts-text-left"><button type="button" onclick="$('#holiday_row<?php echo $holiday_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
					
					  </tr>
					  <?php $holiday_row = $holiday_row + 1 ;?>
					  <?php } ?>
					  
						</tbody>
					  
					  <tfoot>
						<tr>
						  <td colspan="1"></td>
						  <td class="pts-text-left"><button type="button" onclick="holiday();" data-toggle="tooltip" title="add holiday" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>
						</tr>
					  </tfoot>
					</table>
				  </div>
					<div class="pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-storetin"><?php echo $text_document; ?></label> 
						<div class="col-sm-10 ptsc-store-padd">
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
				</fieldset>
				<div class="buttons clearfix">
					<div class="pts-pull-left"><a href="<?php echo $back; ?>" class="pts-btn pts-btn-default"><?php echo $button_back; ?></a></div>
					<div class="pts-pull-right">
						<input type="submit" value="<?php echo $button_continue; ?>" class="pts-btn pts-btn-primary pts-storeinfo" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	function country(element,zone_id) { 
		$.ajax({
			url: 'index.php?route=account/account/country&country_id=' + element,
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
	function show1(){
		document.getElementById('div1').style.display ='none';
	}
	function show2(){
		document.getElementById('div1').style.display = 'block';
	}
	$(window).load(function(){
		<?php if ($store_shipping_type == 'pts_matrix_shipping') { ?>
			document.getElementById('div1').style.display ='none';
			country('<?php echo $store_country; ?>','<?php echo $store_state; ?>');
		<?php } ?>
	})
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var element = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" class="ptsc-productl-nodisplay "><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	if (typeof timer != 'undefined') {
		clearInterval(timer);
	}
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
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
var holiday_row = <?php echo $holiday_row; ?>;
function holiday() {	
	html = '<tr id="holiday_row' + holiday_row + '">';
	html += '<td class="pts-text-left">';
	html += '<input type="text" data-date-format="YYYY-MM-DD" name="input-date-holiday[' + holiday_row + ']" value="" placeholder="" id="holiday_row' + holiday_row + '"class="pts-form-control date" />';
	html += '</td>';
	html += '<td class="pts-text-left">';
	html += '<button type="button" onclick="$(\'#holiday_row' + holiday_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button>';
	html += '</td>';
	html += '</tr>';
	$('#holiday tbody').append(html);
	$('.date').datetimepicker({
		pickTime: false
	});
	holiday_row++;
}
// seller area 
  $('input[name=\'sellerarea\']').autocompletepts({
	  'source': function(request, response) {
		  $.ajax({
			  url: 'index.php?route=account/purpletree_multivendor/sellerstore/sellerarea&filter_name=' + encodeURIComponent(request),
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
</script>
<?php echo $footer; ?>