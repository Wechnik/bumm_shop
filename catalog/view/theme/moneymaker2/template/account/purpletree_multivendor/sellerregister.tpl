<?php echo $header; ?>
<div id="content">
  <div class="container-fluid"><br>
    <br>
    <div class="row">
				<div class="<?php echo $setdivclass; ?> col-sm-offset-3 col-sm-6">
				 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
			<form action="" method="post" name="sellerregForm" id="regForm" enctype="multipart/form-data" class="form-horizontal">
						<h2 class="pts-text-center"> <?php echo $text_seller_register_page; ?></h2>
						<hr class="ptsc-sregister-sellregtxtt">
						<div class="head_steps text-center">
							<span class="step step-one ">
								
								<div class="step-icon"><i class="fa fa-pencil fa-edit"></i>
									<div class="arrow"></div>
								</div>
								<p> <?php echo $text_personal_details; ?></p>
							</span>
							<span class="step step-two">
								<div class="step-icon"><i class="fa fa-user-o fa-user"></i>
									<div class="arrow"></div>
								</div>
								
								<p> <?php echo $text_seller_information1; ?></p>
							</span>
							<span class="step step-three">
								<div class="step-icon"><i class="fa fa-credit-card"></i>
								</div>
								<p> <?php echo $text_payment_details1; ?></p>
							</span>
						</div>
						<div class="pts-well seller-rgistration-form">
							<div class="pts-col-md-12">
								<div class=" pts-col-md-5 pts-pull-left-1 p-0 ">
									<p class="new-seller-login-here"><span class="pts-login-seller"><i class="fa fa-user"></i>  <?php echo $text_new_customer_register; ?></span> <a href="<?php echo $sellerlogin; ?>" class="ptsc-sregister-sellog"> <?php echo $text_seller_login1; ?></a><span></span></p>
								</div>
								<div class=" pts-col-md-5 pts-pull-right-1 p-0">
									<div class="ptsc-sregister-overflow">
										<div class="ptsnewpadddd ptsc-subpl-florig">
											<button type="button" id="prevBtn" class="pts-btn pts-btn-sm pts-btn-default" onclick="nextPrev(-1)"><?php echo $btn_prev; ?></button>
											<button type="button" id="nextBtn" class="pts-btn pts-btn-sm pts-btn-primary" onclick="nextPrev(1)"><?php echo $btn_next; ?></button>
										</div>
									</div>
								</div>
							</div>
							<hr class="ptsc-sellregister-martopbot">
							<!--personal data-->
							<div class="tab">
								<?php if ( $loggedcus==''){  ?>
									<div class="pts-row ptsc-productl-nodisplay">
										<div class="pts-form-group required <?php if (count($customer_groups) > 1 ){ ?> ptsc-productl-blodisplay <?php } else {  ?> ptsc-productl-nodisplay <?php  }  ?>">
											<label class="col-sm-2 pts-control-label"><?php echo $entry_customer_group; ?></label>
											<div class="col-sm-10"><?php foreach ( $customer_groups as $customer_group){  ?>
												<?php if ( $customer_group['customer_group_id'] == $customer_group_id ){ ?>
													<div class="radio">
														<label>
															<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
														<?php echo $customer_group['name']; ?></label>
													</div>
													<?php } else {  ?>
													<div class="radio">
														<label>
															<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
														<?php echo $customer_group['name']; ?></label>
													</div>
												<?php  }  ?>
											<?php  }  ?></div>
										</div>
									</div>
									<div class="pts-row ">
										<div class="pts-col-md-6 pts-form-group required">
											<label class="pts-control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
											<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="pts-form-control" />
											<?php if ( $error_firstname ){ ?>
												<div class="text-danger"><?php echo $error_firstname; ?></div>
											<?php  }  ?> 
										</div>
										<div class="pts-col-md-6 pts-form-group required">
											<label class="pts-control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
											<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="pts-form-control" />
											<?php if ( $error_lastname ){ ?>
												<div class="text-danger"><?php echo $error_lastname; ?></div>
											<?php  }  ?>
										</div>
									</div>
									
									<div class="pts-form-group required">
										<label class="pts-control-label" for="input-email"><?php echo $entry_email; ?></label>
										<input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="pts-form-control" />
										<?php if ( $error_email ){ ?>
											<div class="text-danger"><?php echo $error_email; ?></div>
										<?php  }  ?>
									</div>
									
									<div class="pts-form-group required">
										<label class="pts-control-label" for="input-password"><?php echo $entry_password; ?></label>
										<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="password" class="pts-form-control" />
										<?php if ( $error_password ){ ?>
											<div class="text-danger"><?php echo $error_password; ?></div>
										<?php  }  ?>
									</div>
									
									<div class="pts-form-group required">
										<label class="pts-control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
										<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="confirm" class="pts-form-control" />
										<?php if ( $error_confirm ){ ?>
											<div class="text-danger"><?php echo $error_confirm; ?></div>
										<?php  }  ?>
									</div>
									
									<div class="pts-form-group required">
										<label class="pts-control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
										<input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="pts-form-control" />
										<?php if ( $error_telephone ){ ?>
											<div class="text-danger"><?php echo $error_telephone; ?></div>
										<?php  }  ?>
									</div>									
									<div class="pts-form-group p-0">
									 <?php foreach ($custom_fields as $custom_field) { ?>
									 <?php if ($custom_field['type'] == 'select') { ?>
									  <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
									 
										 <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
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
									 <?php } ?>
									<?php } ?>
									
									 <?php if ($custom_field['type'] == 'radio') { ?>
									  <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
										  <div> <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<div class="radio"><?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
											  <label>
												<input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } else { ?>
											  <label>
												<input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } ?> </div>
											<?php } ?></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									 <?php if ($custom_field['type'] == 'checkbox') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
								   
										  <div> <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<div class="checkbox"><?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
											  <label>
												<input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } else { ?>
											  <label>
												<input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } ?> </div>
											<?php } ?> </div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									 <?php if ($custom_field['type'] == 'text') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'textarea') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									   <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group custom-field <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
									  <label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
									<textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storeaddress ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $store_address; ?><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
										</div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'file') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
										  <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
										  <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" />
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'date') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <div class="input-group date">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									   <?php if ($custom_field['type'] == 'time') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <div class="input-group time">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'datetime') { ?>
									   <?php if ($custom_field['step_location'] == 'one') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										<div class="col-sm-10">
										  <div class="input-group datetime">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?> </div>
									  </div>
									  <?php } ?>
									<?php } ?>
									<?php } ?>
								</div>							
									<?php echo $captcha; ?>
									<?php if ( $text_agree ){ ?>
										<div class="required">
											<?php echo $text_agree; ?>
											<?php if ( $agree ){ ?>			  
												<input  required type="checkbox" name="agree" value="1" checked="checked" class="ptsc-sregister-marig" />
												<?php } else {  ?>
												<input  required  type="checkbox" name="agree" value="1" />		
											<?php  }  ?>	
										</div>			  
									<?php  }  ?>
								<?php  }  ?>
								
							</div>
							<!--end personal data-->
							
							<!--seller data-->
							<div class="tab">
								<div class="pts-form-group required">				
									<label class="pts-control-label" for="store_name"><?php echo $entry_storename; ?></label>
									<input required type="text" name="store_name" value="<?php echo $store_name; ?>" placeholder="<?php echo $entry_storename; ?>" id="store_name" class="pts-form-control" />		 
									<?php if ( $error_sellerstore ){ ?>
										<div class="text-danger"><?php echo $error_sellerstore; ?></div>
									<?php  }  ?>
									
								</div>
								
								
								<div class="pts-form-group">
									<label class="pts-control-label" for="input-storephone"><?php echo $entry_storephone; ?></label>
									<input type="text" name="store_phone" value="<?php echo $store_phone; ?>" placeholder="<?php echo $entry_storephone; ?>" id="input-storephone" class="pts-form-control" />		 
								</div>
								<!-- </div> -->
								
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-6">
										<label class="pts-control-label" for="store-logo"><?php echo $entry_storelogo; ?></label>
										<input type="file" name="store_logo" id="store-logo" class="filechangepts" accept="image/gif, image/jpeg, image/png" value="">	
										
									</div>
									<div class="pts-form-group pts-col-md-6">
										<label class="pts-control-label" for="store-banner"><?php echo $entry_storebanner; ?></label>
										<input type="file" name="store_banner" id="store-banner" class="filechangepts" accept="image/gif, image/jpeg, image/png" value="">			
									</div>
								</div>
								
								<div class="pts-form-group">
									<label class="pts-control-label" for="input-storeaddress"><?php echo $entry_storeaddress; ?></label>
									<textarea name="store_address" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storeaddress; ?>"><?php echo $store_address; ?></textarea>
								</div>
								
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-6">
										<label class="pts-control-label" for="input-storecountry"><?php echo $entry_storecountry; ?></label>
										<select name="store_country" id="input-storecountry" onchange="country(this,'<?php echo $store_state; ?>');" class="pts-form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ( $countries as $country){  ?>
												<?php if ( $country['country_id'] == $store_country ){ ?>
													<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
													<?php } else {  ?>
													<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
												<?php  }  ?>
											<?php  }  ?>
										</select>
										
									</div>
									
									
									<div class="pts-form-group pts-col-md-6">
										<label class="pts-control-label" for="store-storestate"><?php echo $entry_storezone; ?></label>						
										<select name="store_state" id="input-storestate" class="pts-form-control">
										</select>		             
									</div>
								</div>
								
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-6">
										<label class="pts-control-label" for="input-sellercity"><?php echo $entry_storecity; ?></label>
										<input type="text" name="store_city" value="<?php echo $store_city; ?>" placeholder="<?php echo $entry_storecity; ?>" id="input-sellercity" class="pts-form-control" />	 
									</div>
									<div class="pts-form-group pts-col-md-6">
										<label class="pts-control-label" for="input-storepostcode"><?php echo $entry_storepostcode; ?></label>
										<input type="text" name="store_zipcode" value="<?php echo $store_zipcode; ?>" placeholder="<?php echo $entry_storepostcode; ?>" id="input-storepostcode" class="pts-form-control" />
									</div>
								</div>
						<!-- seller area -->
							<div class="pts-form-group">
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
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-storeshipping"><?php echo $entry_storeshippingpolicy; ?></label>
									<textarea name="store_shipping_policy" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storeshippingpolicy; ?>" id="input-storeshipping"><?php echo $store_shipping_policy; ?></textarea>
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-return-policy"><?php echo $entry_storereturn; ?></label>
									<textarea name="store_return_policy" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storereturn; ?>" id="input-return-policy"><?php echo $store_return_policy; ?></textarea>
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-storeaddress"><?php echo $entry_storemetakeyword; ?></label>
										<textarea name="store_meta_keywords" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storemetakeyword; ?>" id="input-storeaddress"><?php echo $store_meta_keywords; ?></textarea>
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-meta-description"><?php echo $entry_storemetadescription; ?></label>
									<textarea name="store_meta_description" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storemetadescription; ?>" id="input-meta-description"><?php echo $store_meta_description; ?></textarea>					
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-storeseo"><?php echo $entry_storeseo; ?></label>	
										<input type="text" name="store_seo" value="<?php echo $store_seo; ?>" placeholder="<?php echo $entry_storeseo; ?>" id="input-storeseo" class="pts-form-control" />
										<?php if ( $error_store_seo ){ ?>
											<div class="text-danger"><?php echo $error_store_seo; ?></div>
										<?php } ?>
									</div>
								</div>
								
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-facebook"><?php echo $entry_facebook; ?></label>	
										<input type="text" name="input-facebook" placeholder="<?php echo $entry_facebook; ?>" id="input-storeseo" class="pts-form-control" />
									</div>
								</div>
							<!--<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-google"><?php //echo $entry_google; ?></label>	
										<input type="text" name="google_link" placeholder="<?php //echo $entry_google; ?>" id="input-google" class="pts-form-control" />
									</div>
								</div>-->
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-twitter"><?php echo $entry_twitter; ?></label>	
										<input type="text" name="twitter_link" placeholder="<?php echo $entry_twitter; ?>" id="input-twitter" class="pts-form-control" />
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-instagram"><?php echo $entry_instagram; ?></label>	
										<input type="text" name="instagram_link" placeholder="<?php echo $entry_instagram; ?>" id="input-instagram" class="pts-form-control" />
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-pinterest"><?php echo $entry_printerest; ?></label>	
										<input type="text" name="pinterest_link" placeholder="<?php echo $entry_printerest; ?>" id="input-pinterest" class="pts-form-control" />
									</div>
								</div>
								<div class="pts-row">	
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-wesbsite"><?php echo $entry_website; ?></label>	
										<input type="text" name="wesbsite_link" placeholder="<?php echo $entry_website; ?>" id="input-wesbsite" class="pts-form-control" />
									</div>
								</div>
								<div class="pts-row">				
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-whatsapp_link"><?php echo $entry_whatsapp_number; ?></label>	
										<input type="text" name="whatsapp_link" value="" placeholder="<?php echo $entry_whatsapp_number; ?>" id="input-whatsapp_link" class="pts-form-control" />
									</div>
								</div>
							   <div class="pts-row">
								<div class="pts-form-group ">
									 <?php foreach ($custom_fields as $custom_field) { ?>
									 <?php if ($custom_field['type'] == 'select') { ?>
									  <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
									 
										 <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
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
									 <?php } ?>
									<?php } ?>									
									 <?php if ($custom_field['type'] == 'radio') { ?>
									  <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
										  <div> <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<div class="radio"><?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
											  <label>
												<input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } else { ?>
											  <label>
												<input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } ?> </div>
											<?php } ?></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									 <?php if ($custom_field['type'] == 'checkbox') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
								   
										  <div> <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<div class="checkbox"><?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
											  <label>
												<input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } else { ?>
											  <label>
												<input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } ?> </div>
											<?php } ?> </div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									 <?php if ($custom_field['type'] == 'text') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'textarea') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									   <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group custom-field <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
									  <label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
									<textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storeaddress ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $store_address; ?><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
										</div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'file') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
										  <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
										  <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" />
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'date') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <div class="input-group date">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									   <?php if ($custom_field['type'] == 'time') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <div class="input-group time">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'datetime') { ?>
									   <?php if ($custom_field['step_location'] == 'two') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										<div class="col-sm-10">
										  <div class="input-group datetime">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?> </div>
									  </div>
									  <?php } ?>
									<?php } ?>
									<?php } ?>
								</div>	
								</div>	
								<?php if ( $purpletree_multivendor_allow_live_chat ){ ?>
									<div class="pts-row">
										<div class="pts-form-group pts-col-md-6">							
											<label class="pts-control-label" for="input-live-chat"><?php echo $entry_allow_live_chat; ?></label>
											<select name="store_live_chat_enable" id="input-live-chat" class="pts-form-control">			  
												<option value="1" <?php if ( $store_live_chat_enable ){ ?> selected="selected" <?php  }  ?>><?php echo $text_yes; ?></option>
												<option value="0" <?php if ( $store_live_chat_enable == 0 ){ ?> selected="selected" <?php  }  ?>><?php echo $text_no; ?></option>			 
											</select>
										</div>
										<div class="pts-form-group pts-col-md-6">
											<label class="pts-control-label" for="input-live_chat_code"><?php echo $entry_live_chat_code; ?></label>
											<textarea id="input-live_chat_code" name="store_live_chat_code" class="pts-form-control" rows="5"><?php echo $store_live_chat_code; ?></textarea>
										</div>
									</div>
								<?php  }  ?>				
							</div>
							<!--end store data-->
							
							
							<!--payment data-->
							<div class="tab">
								<div class="pts-form-group">
									<label class="pts-control-label" for="input-storebankdetail"><?php echo $entry_storebankdetail; ?></label>
									<textarea name="store_bank_details" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storebankdetail1; ?>"><?php echo $store_bank_details; ?></textarea>
									
								</div>
								
								<div class="pts-form-group">					
									<label class="pts-control-label" for="input-storetin"><?php echo $entry_storetin; ?></label> <input type="text" name="store_tin" value="<?php echo $store_tin; ?>" placeholder="<?php echo $entry_storetin1; ?>" id="input-storetin" class="pts-form-control" />
									
								</div>
								<!-- paypal -->
								<div class="pts-row">
									<div class="pts-form-group pts-col-md-12">
										<label class="pts-control-label" for="input-seller-paypal-id"><?php echo $entry_seller_paypal_id; ?>
										</label>
										<input type="text" id="input-seller-paypal-id" name="seller_paypal_id" class="pts-form-control" value="<?php echo $seller_paypal_id; ?>" />
										<?php if($error_seller_paypal_id){ ?>
											<div class="text-danger"><?php echo $error_seller_paypal_id; ?></div>
										<?php } ?>
									</div>
								</div>
								<!-- End paypal -->
							
							 <div class="pts-row">
								<div class="pts-form-group">
									 <?php foreach ($custom_fields as $custom_field) { ?>
									 <?php if ($custom_field['type'] == 'select') { ?>
									  <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
									 
										 <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
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
									 <?php } ?>
									<?php } ?>									
									 <?php if ($custom_field['type'] == 'radio') { ?>
									  <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
										  <div> <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<div class="radio"><?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
											  <label>
												<input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } else { ?>
											  <label>
												<input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } ?> </div>
											<?php } ?></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									 <?php if ($custom_field['type'] == 'checkbox') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
								   
										  <div> <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
											<div class="checkbox"><?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
											  <label>
												<input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } else { ?>
											  <label>
												<input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
												<?php echo $custom_field_value['name']; ?></label>
											  <?php } ?> </div>
											<?php } ?> </div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									 <?php if ($custom_field['type'] == 'text') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-control" />
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'textarea') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									   <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group custom-field <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
									  <label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
									<textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" class="pts-form-control" rows="5" placeholder="<?php echo $entry_storeaddress ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $store_address; ?><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
										</div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'file') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label"><?php echo $custom_field['name']; ?></label>
										  <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
										  <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" />
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'date') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <div class="input-group date">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									   <?php if ($custom_field['type'] == 'time') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="pts-form-group pts-col-md-12 p-0 <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="pts-control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										  <div class="input-group time">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?>
									  </div>
									  <?php } ?>
									  <?php } ?>
									  <?php if ($custom_field['type'] == 'datetime') { ?>
									   <?php if ($custom_field['step_location'] == 'three') { ?>
									  <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field <?php if ($custom_field['required'] == '1') { echo "required"; } ?>" data-sort="<?php echo $custom_field['sort_order']; ?>">
										<label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										<div class="col-sm-10">
										  <div class="input-group datetime">
											<input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
											<span class="input-group-btn">
											<button type="button" class="pts-btn pts-btn-sm pts-btn-default"><i class="fa fa-calendar"></i></button>
											</span></div>
										  <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
										  <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
										  <?php } ?> </div>
									  </div>
									  <?php } ?>
									<?php } ?>
									<?php } ?>
								</div>	
								</div>
								</div>
							<!--end payment data-->			
							<div class="pts-form-group pts-text-right">
								<div class="ptsc-sregister-overflow">
									<div class="float:right;">
										<button type="button" id="prevBtn1" class="pts-btn pts-btn-sm pts-btn-default" onclick="nextPrev(-1)"><?php echo $btn_prev; ?></button>
										<button type="button" id="nextBtn1" class="pts-btn pts-btn-sm pts-btn-primary" onclick="nextPrev(1)"><?php echo $btn_next; ?></button>
									</div>
								</div>
							</div>				
							<!-- Circles which indicates the steps of the form: -->
						</div>
				<div>
					<span class="step"></span>
					<span class="step"></span>
					<span class="step"></span>
					<span class="step"></span>
				</div>
			</form>
		</div>
	</div>	
	</div>	
	</div>	
<!--seller registration form-->
<script type="text/javascript">
	<?php if ( $loggedcus=='' ){ ?>
		var currentTabpts = 0; // Current tab is set to be the first tab (0)
		showTabpts(currentTabpts); // Display the crurrent tab
		<?php } else {  ?>
		var currentTabpts = 1; // Current tab is set to be the first tab (0)
		showTabpts(currentTabpts); // Display the crurrent tab
	<?php  }  ?>
	
	
	function showTabpts(n) {
		// This function will display the specified tab of the form...
		var x = document.getElementsByClassName("tab");
		x[n].style.display = "block";
		//... and fix the Previous/Next buttons:
		if (n == 0) {
			$('.step.step-one').addClass('finish');
			$('.step.step-two').removeClass('finish');
			$('.step.step-three').removeClass('finish');
			document.getElementById("prevBtn").style.display = "none";
			document.getElementById("prevBtn1").style.display = "none";
			} else {
			<?php if ( $loggedcus=='' ){ ?>
				document.getElementById("prevBtn").style.display = "inline";
				document.getElementById("prevBtn1").style.display = "inline";
				<?php } else {  ?>
				if (n == 1) {
					document.getElementById("prevBtn").style.display = "none";
					document.getElementById("prevBtn1").style.display = "none";
					} else {
					document.getElementById("prevBtn").style.display = "inline";
					document.getElementById("prevBtn1").style.display = "inline";
				}
			<?php  }  ?>
			
		}
		if (n == 1) {
			$('.step.step-one').addClass('finish');
			$('.step.step-two').addClass('finish');
			$('.step.step-three').removeClass('finish');
		}
		if (n == (x.length - 1)) {
			document.getElementById("nextBtn").innerHTML = "<?php echo $btn_submit1; ?>";
			document.getElementById("nextBtn1").innerHTML = "<?php echo $btn_submit1; ?>";
			} else {
			document.getElementById("nextBtn").innerHTML = "<?php echo $btn_next; ?>";
			document.getElementById("nextBtn1").innerHTML = "<?php echo $btn_next; ?>";
		}
		//... and run a function that will display the correct step indicator:
		fixStepIndicator(n)
	}
	
	function nextPrev(n) {
		// This function will figure out which tab to display
		var x = document.getElementsByClassName("tab");
		// Exit the function if any field in the current tab is invalid:
		if (n == 1 && !validateForm()) return false;
		// Hide the current tab:
		x[currentTabpts].style.display = "none";
		// Increase or decrease the current tab by 1:
		currentTabpts = currentTabpts + n;
		// if you have reached the end of the form...
		if (currentTabpts >= x.length) {
			// ... the form gets submitted:
			document.getElementById("regForm").submit();
			return false;
		}
		// Otherwise, display the correct tab:
		showTabpts(currentTabpts);
	}
	
	function validateForm() {
		// This function deals with validation of the form fields
		//var valid = true;
		//x = document.getElementsByClassName("tab");
		// y = x[currentTabpts].getElementsByTagName("input");
		
		valid = false;
		// Wait for the DOM to be ready
		// Initialize form validation on the registration form.
		// It has the name attribute "registration"
		// alert('in');
		$("#regForm").validate({
			// Specify validation rules
			rules: {
				// The key name on the left side is the name attribute
				// of an input field. Validation rules are defined
				// on the right side
				firstname: "required",
				lastname: "required",
				email: {
					required: true,
					// Specify that email should be validated
					// by the built-in "email" rule
					email: true
				},
				password: {
					required: true,
					minlength: 5
				},
				confirm: {
					equalTo: "#password"
				},
				
				telephone: {
					required: true,
					//number: true
				}
				
				
			},
			// Specify validation error messages
			messages: {
				firstname: "<?php echo $error_enter_firstname; ?>",
				lastname: "<?php echo $error_enter_lastname; ?>",
				password: {
					required: "<?php echo $error_enter_password; ?>",
					minlength: "<?php echo $error_enter_password_lenght; ?>"
				},
				email: "<?php echo $error_enter_email_address; ?>",
				confirm: "<?php echo $error_enter_confirm_password; ?>",
				//telephone: "Enter valide telephone no.",
				
				
			},
			// Make sure the form is submitted to the destination defined
			// in the "action" attribute of the form when valid
		});
		
		if ($('#regForm').valid()) {
			valid = true;
		}
		
		// If the valid status is true, mark the step as finished and valid:
		if (valid) {
			//document.getElementsByClassName("step")[currentTabpts].className += " finish";
		}
		return valid; // return the valid status
	}
	
	function fixStepIndicator(n) {
		// This function removes the "active" class of all steps...
		var i, x = document.getElementsByClassName("step");
		for (i = 0; i < x.length; i++) {
			x[i].className = x[i].className.replace(" active", "");
		}
		//... and adds the "active" class on the current step:
		x[n].className += " active";
	}
	
</script>
<script type="text/javascript"><!--
	function country(element,zone_id) { 
		$.ajax({
			url: 'index.php?route=account/account/country&country_id=' + element.value,
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
					html += '<option value="0"><?php echo $text_none; ?></option>';
				}
				
				$('select[name=\'store_state\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
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
//--></script>
<script type="text/javascript"><!--
	// Sort the custom fields
	$('#account .form-group[data-sort]').detach().each(function() {
		if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
			$('#account .form-group').eq($(this).attr('data-sort')).before(this);
		}
		
		if ($(this).attr('data-sort') > $('#account .form-group').length) {
			$('#account .form-group:last').after(this);
		}
		
		if ($(this).attr('data-sort') == $('#account .form-group').length) {
			$('#account .form-group:last').after(this);
		}
		
		if ($(this).attr('data-sort') < -$('#account .form-group').length) {
			$('#account .form-group:first').before(this);
		}
	});
	
	$('input[name=\'customer_group_id\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=account/purpletree_multivendor/sellerregister/customfield&customer_group_id=' + this.value,
			dataType: 'json',
			success: function(json) {
				/* $('.custom-field').hide();
				$('.custom-field').removeClass('required');
				
				for (i = 0; i < json.length; i++) {
					custom_field = json[i];
					
					$('#custom-field' + custom_field['custom_field_id']).show();
					
					if (custom_field['required']) {
						$('#custom-field' + custom_field['custom_field_id']).addClass('required');
					}
				} */
			},
			error: function(xhr, ajaxOptions, thrownError) {
				//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
	
	$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
	$('.filechangepts').on('change', function(e) {
	var ext = this.value.match(/\.([^\.]+)$/)[1];
	  switch (ext) {
		case 'jpg':
		case 'jpeg':
		case 'JPG':
		case 'JPEG':
		case 'png':
		case 'PNG':
		case 'gif':
		case 'GIF':
		  break;
		default:
		  alert('File Type Not allowed');
		  this.value = '';
	  }
	});
	$('button[id^=\'button-custom-field\']').on('click', function() {
		var element = this;
		
		$('#form-upload').remove();
		
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" class="ptsc-productl-nodisplay"><input type="file" name="file" /></form>');
		
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
							$(element).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
						}
						
						if (json['success']) {
							alert(json['success']);
							
							$(element).parent().find('input').val(json['code']);
							$(element).parent().find('span').remove();
							$(element).parent().find('input').after("<span>"+json['filename']+"</span>");
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		}, 500);
	});
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
//--></script>
<style>
#button-menu {
	display:none;
}
</style>
<link href="catalog/view/javascript/purpletree/css/stylesheet/commonstylesheet.css" type="text/css" rel="stylesheet" />
<?php echo $footer; ?> 