<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-purpletree-multivendor" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
			</div>
		<?php } ?>
		<div class="alert alert-success alertseucess ptsc-storefrm-nodisplay"></div>
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-purpletree-multivendor" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $text_general; ?></a></li>
						<li><a class="tab-seller" href="#tab-seller" data-toggle="tab"><?php echo $text_seller; ?></a></li>
						<li><a href="#tab-subscription" data-toggle="tab"><?php echo $text_subscription; ?></a></li>
						<li><a href="#tab-hyperlocal" data-toggle="tab"><?php echo $entry_seller_areaheading; ?></a></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="purpletree_multivendor_status" id="input-status" class="form-control">
										<?php if ($purpletree_multivendor_status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group required hidden">
								<div class="col-sm-8">
									<input type="hidden" name="purpletree_multivendor_process_data" value="<?php echo $purpletree_multivendor_process_data; ?>" class="form-control" id="setlicensee" />
									<?php /* if(isset($process_data_error)) { ?>
										<div class="text-danger"><?php echo $process_data_error; ?></div>
									<?php } */ ?>
									<input type="hidden" name="purpletree_multivendor_validate_text" value="<?php echo $purpletree_multivendor_validate_text; ?>">
									<input type="hidden" name="purpletree_multivendor_live_validate_text" value="<?php echo $purpletree_multivendor_live_validate_text ; ?>">
									
									<input type="hidden" name="purpletree_multivendor_encypt_text" value="<?php echo $purpletree_multivendor_encypt_text; ?>">
								</div>
								<div class="col-sm-10 col-sm-offset-2">
									
									<button type="button" class="btn btn-primary ptsc-mv-licebtnpadd" id="getLicensee"> <?php echo $button_get_license; ?></button>
								</div>
							</div>
							
							<div id="licenseModal" class="modal pts-modal">
								<!-- Modal content -->
								<div class="modal-content ptsc-modal-content">
									<div class="row">
										<div class="col-lg-12 liceform">
											<span class="close ptsc-close">&times;</span>
											
											<div class="alert alert-danger ptsc-storefrm-nodisplay" id="modal_lic_error">
											</div>
											<div class="form-group ptsc-mv-licemargt" name="Licencekeyval1">
												
												<div class="col-lg-8 ptsc-mv-enter_lice">
													
													<label class="control-label" for="input-name"><?php echo $enter_license_key1; ?></label>
													<input name="" id="licenskey1" value="" placeholder="<?php echo $enter_license_key1; ?>" class="form-control" autocomplete="off" type="text" name="Licencekeyval" /><ul class="dropdown-menu"></ul>
												</div>
												<div class="col-lg-2">
													<label class="control-label ptsc-mv-okbtncol" for="input-name">.</label>
													<input value="<?php echo $button_ok; ?>" class="btn btn-primary okbtn" type="button" onclick="savelicc()"/>
													
												</div>
												<div class="col-lg-12 ptsc-mv-dontliceleftt">
													<input value="<?php echo $dont_have_lisence_key; ?>" class="btn btn-primary licencekey2 ptsc-mv-dontlicemart" type="button" onclick="dontlice()"/>	
												</div>
											</div>
											
											<div class="orderdiv ptsc-storefrm-nodisplay">
												<label class="control-label" for="input-name"><?php echo $entry_order_id; ?></label>
												<input name="order_id" id="order_id" value="" placeholder="<?php echo $entry_order_id; ?>" id="input-name" class="form-control" autocomplete="off" type="text"><ul class="dropdown-menu" ></ul>
												
												<div class="form-group">
													<label class="control-label" for="input-name"><?php echo $entry_email_id; ?></label>
													<input name="email_id" id="email_id" value="" placeholder="<?php echo $entry_email_id; ?>" id="input-name" class="form-control" autocomplete="off" type="text"><ul class="dropdown-menu"></ul>
												</div>
												<div class="form-group">
													<input value="<?php echo $button_submit; ?>" class="btn btn-primary getlicbtn ptsc-upgrdatabas-padd" type="button" onclick="getlicense()"/>
													
												</div>
											</div>
											
										</div>
									</div>
								</div>
								
							</div>
							
							
							<div class="row">
								<div class="col-sm-12">
									<div class="clearfix">
										<div class="col-sm-12">
											<h3><?php echo $vendor_heading; ?></h3>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_commission_status; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_commission_status" class="form-control">
														<?php foreach($order_statuses as $status): ?>
														<option <?php  if ($purpletree_multivendor_commission_status == $status['order_status_id']): ?> selected="selected" <?php elseif($purpletree_multivendor_commission_status == '' && $status['name'] == 'Complete'): ?> selected="selected" <?php endif; ?> value="<?php echo $status['order_status_id'] ?>"><?php echo $status['name'] ?></option>
														<?php endforeach; ?>
													</select>
													<?php if (isset($commission_status_error) && $commission_status_error != ''): ?>
													<div class="text-danger"><?php echo $commission_status_error; ?></div>
													<?php endif; ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-refund"><?php echo $entry_refund_status; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_refund_status" class="form-control" id = "input-refund">
														<?php foreach ($return_actions as $actions) { ?>
															<option <?php if($purpletree_multivendor_refund_status == $actions['return_action_id']) { ?> selected="selected" 
															<?php } elseif($purpletree_multivendor_refund_status == '' && $actions['name'] == 'Refunded') { ?> selected="selected" <?php } ?> value="<?php echo $actions['return_action_id']; ?>"><?php echo $actions['name']; ?></option>
														<?php } ?>
													</select>
													<?php if(isset($commission_status_error)) { ?>
														<div class="text-danger"><?php echo $commission_status_error; ?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $text_purpletreeshipping_type; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_shippingtype" class="form-control">
														<?php if($purpletree_multivendor_shippingtype) { ?>
															<option value="0"><?php echo $text_purpletreeshipping;?></option>
															<option value="1" selected="selected"><?php echo $text_purpletreeshipping_geozone;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_purpletreeshipping;?></option>
															<option value="1"><?php echo $text_purpletreeshipping_geozone;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_commission; ?></label>
												<div class="col-md-9">
													<input type="text" name="purpletree_multivendor_commission" class="form-control" value="<?php echo (isset($purpletree_multivendor_commission)?$purpletree_multivendor_commission:''); ?>"/>
													<?php if(isset($commission_error)) { ?>
														<div class="text-danger"><?php echo $commission_error; ?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<!--fix global commission-->
										  <div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label col-form-label" for="input-fix-commissionn"><?php echo $text_fix_commission ; ?></label>
												<div class="col-md-9">
													<input type="number" min="0" name="purpletree_multivendor_fix_commission" class="form-control" value="<?php echo (isset($purpletree_multivendor_fix_commission)?$purpletree_multivendor_fix_commission:''); ?>" id = "input-fix-commissionn"/>
												</div>
											</div>
										</div>
										<!-- End fix global commission-->
										<!--Shipping Commission-->
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_shipping_commission; ?></label>
												<div class="col-md-9">
													<input type="text" name="purpletree_multivendor_shipping_commission" class="form-control" value="<?php echo (isset($purpletree_multivendor_shipping_commission)?$purpletree_multivendor_shipping_commission:''); ?>"/>
													<?php if (isset($shipping_commission_error)) { ?>
														<div class="text-danger"><?php echo $shipping_commission_error; ?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<!--Shipping Commission-->
										<!--Seller group config-->
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_manage_order; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_manage_order" class="form-control">
														<?php if($purpletree_multivendor_seller_manage_order) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo  $commission_from_seller_group; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_group" class="form-control">
														<?php if ($purpletree_multivendor_seller_group) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>	
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-md-3 control-label " for="input-name"><?php echo $Commission_invoice_footer_text; ?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $Commission_invoice_footer_text; ?>" name="purpletree_multivendor_footer_text" class="form-control" value="<?php echo $purpletree_multivendor_footer_text; ?>"/>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-allow_order_status"><?php echo $entry_allow_order_status; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_allow_order_status[]" class="form-control ptsc-mv-selldasheig"id="input-allow_order_status" multiple>
														
														
														<?php foreach ($allow_order_statuse3 as $order_status) { ?>
														<?php if ($order_status['selected'] == 'selected') { ?>
														<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
														
													    <?php } else { ?>
														<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>																				
														
													<?php }  ?>
													<?php }  ?>
													</select>
												</div>
											</div>
										</div>
										<!-- start dashboard icons section -->

										<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label"for="input-allow_icons_status">
												<?php echo $entry_seller_dashboard_icon; ?>
												</label>
												<div class="col-md-9">
                                            
	                                               <select name="purpletree_multivendor_icons_status[]" class="form-control ptsc-mv-selldasheig" id="input-allow_order_status" multiple>
	                                               	

		                                         <?php foreach ($allow_icon_statuse as $key=>$allow_icon_status) { ?>
														
		                                        <option value="<?php echo $allow_icon_status['id']; ?>" <?php if($allow_icon_status['selected']=='selected') {?>  selected="selected" <?php } ?> ><?php echo $allow_icon_status['value']; ?></option>

		                                    
			                                  <?php }  ?>
		                                	</select>

												</div>
 											</div>
										</div>
									<!-- End dashboard icons section -->
										 		<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-customer_manage_order"><?php echo $entry_customer_manage_order; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_customer_manage_order" class="form-control"id="input-customer_manage_order">
														<?php if ($purpletree_multivendor_customer_manage_order) { ?>
														<option value="0"><?php echo $text_no; ?></option>
														<option value="1" selected="selected"><?php echo $text_yes; ?></option>
														<?php } else { ?>
														<option value="0" selected="selected"><?php echo $text_no; ?></option>
														<option value="1"><?php echo $text_yes; ?></option>
														<?php }  ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-seller_approv"><?php echo $entry_seller_approval; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_approval" class="form-control" id="input-seller_approv">
														<?php if($purpletree_multivendor_seller_approval) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_product_approval; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_product_approval" class="form-control">
														<?php if($purpletree_multivendor_product_approval) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_allow_category; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_allow_categorytype" class="form-control">
														<?php if($purpletree_multivendor_allow_categorytype): ?>
														<option value="0"><?php echo $text_selected_categories; ?></option>
														<option value="1" selected="selected"><?php echo $text_allowed_categories; ?></option>
														<?php else: ?>
														<option value="0" selected="selected"><?php echo $text_selected_categories; ?></option>
														<option value="1"><?php echo $text_allowed_categories; ?></option>
														<?php endif; ?>
													</select>
													<?php if($purpletree_multivendor_allow_categorytype): ?>
													<input type="text" name="category" value="" disabled id="input-category" class="form-control" />
													<?php else: ?>
													<input type="text" name="category" value="" id="input-category" class="form-control" />
													<?php endif; ?>
													<div id="product-category" class="well well-sm ptsc-storef-heioflow">
													<?php if($purpletree_multivendor_allow_category){ ?>
															<?php if(!empty($purpletree_multivendor_allow_category)) { ?>
																<?php foreach($purpletree_multivendor_allow_category as $key => $product_category){ ?>
																	<div id="product-category<?php echo $product_category; ?>"><i class="fa fa-minus-circle"></i> <?php echo $key; ?> 
																		<?php if($purpletree_multivendor_allow_categorytype){ ?> <?php } else { ?>
																			<input type="hidden" name="purpletree_multivendor_allow_category[]" value="<?php echo $product_category; ?>"/>
																		<?php } ?>
																	</div>
																<?php } ?>
															<?php } ?>
														<?php } ?>
													</div>
												</div> 
											</div>
										</div>
										<!-- product category -->
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_product_category; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_product_category" class="form-control">
														<?php if($purpletree_multivendor_seller_product_category) { ?>
															<option value="0"><?php echo $text_multiple;?></option>
															<option value="1" selected="selected"><?php echo $text_single;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_multiple;?></option>
															<option value="1"><?php echo $text_single;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<!-- product category -->
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-seller-login"><?php echo $entry_seller_login; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_login" class="form-control" id="input-seller-login">
														<?php if($purpletree_multivendor_seller_login) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_allow_live_chat; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_allow_live_chat" class="form-control">
														<?php if ($purpletree_multivendor_allow_live_chat) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $allow_browse_sellers; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_browse_sellers" class="form-control">
														<?php if ($purpletree_multivendor_browse_sellers) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<!--Hide user menu-->
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-hide-user-menu"><?php echo $text_hide_user_menu; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_hide_user_menu" class="form-control" id="input-hide-user-menu">
														<?php if ($purpletree_multivendor_hide_user_menu) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>							</select>
												</div>
											</div>
										</div>	
										<!--End Hide user menu--> 
					<!--Start domain wise store--> 
					<div class="col-sm-12">
							<div class="form-group py-1 required row">
								<label class="col-md-3 control-label col-form-label" for="input-hide-user-menu"><?php echo $text_multiple_store; ?></label>
								<div class="col-md-9">
									<select name="purpletree_multivendor_multi_store" class="form-control" id="input-hide-user-menu">
									<?php if($purpletree_multivendor_multi_store) { ?>
										<option value="0"><?php echo $text_no; ?></option>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
									<?php } else { ?>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<option value="1"><?php echo $text_yes; ?></option>
									<?php } ?>							
									</select>
								</div>
							</div>
						</div>	
					<!--End domain wise store--> 
									</div>
								</div>
							</div>
						</div>	
						<div class="tab-pane fade in" id="tab-seller">
							<div class="row">
								<div class="col-sm-12">
									<div class="clearfix">
										<div class="col-sm-12">
											<h3><?php echo $seller_product_heading; ?></h3>
										</div>
										<!-- Start Quick order -->
										<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-seller_info_success"><?php echo $entry_seller_info_success; ?></label>
												<div class="col-md-9">
													<select id = "input-seller_info_success" name="purpletree_multivendor_seller_info_on_order_sucess" class="form-control">
														<?php if ($purpletree_multivendor_seller_info_on_order_sucess) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>									
										 <div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input_seller_name"><?php echo $entry_show_seller_name; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_show_seller_name" class="form-control" id="input_seller_name">														
														<?php if ($purpletree_multivendor_show_seller_name) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>	
										<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input_seller_address"><?php echo $entry_show_seller_address; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_show_seller_address" class="form-control" id="input_seller_address">														
														<?php if ($purpletree_multivendor_show_seller_address) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>	
										<!-- End Quick order -->
										<!-- seller product view -->
										<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-products-view"><?php echo $entry_products_view; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_products_view" class="form-control" id="input-products-view">														
														<?php if ($purpletree_multivendor_products_view) { ?>
															<option value="0"><?php echo $text_list; ?></option>
															<option value="1" selected="selected"><?php echo $text_grid; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_list; ?></option>
															<option value="1"><?php echo $text_grid; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<!--End seller product view-->
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input_hide_seller"><?php echo $entry_hide_seller_detail; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_hide_seller_detail" class="form-control" id="input_hide_seller">
														<?php if ($purpletree_multivendor_hide_seller_detail) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>							
													</select>
												</div>
											</div>
										</div>
										<!--Allow seller to show sellers on category page-->	
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-allow-seller"><?php echo $text_allow_selleron_category; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_allow_selleron_category" class="form-control" id="input-allow-seller">
														<?php if ($purpletree_multivendor_allow_selleron_category == "service_mode") { ?>
															<option value="0"><?php echo $text_normal_mode; ?></option>
															<option value="1"><?php echo $text_category_mode; ?></option>
															<option value="service_mode" selected="selected"><?php echo $text_service_mode; ?></option>
															<?php } elseif ($purpletree_multivendor_allow_selleron_category==1) { ?>
															<option value="0"><?php echo $text_normal_mode; ?></option>
															<option value="1" selected="selected"><?php echo $text_category_mode; ?></option>
															<option value="service_mode"><?php echo $text_service_mode; ?></option>
															<?php } else { ?>		
															<option value="0" selected="selected"><?php echo $text_normal_mode; ?></option>
															<option value="1"><?php echo $text_category_mode; ?></option>
															<option value="service_mode"><?php echo $text_service_mode; ?></option>
														<?php } ?>			
													</select>
												</div>
											</div>
										</div> 
										<!--Hide Seller Product Tabs-->				 
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-hide-product_tab"><?php echo $text_hide_seller_product_tab; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_hide_seller_product_tab" class="form-control" id="input-hide-product_tab">
														<?php if ($purpletree_multivendor_hide_seller_product_tab) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>							
													</select>
												</div>
											</div>
										</div>    
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-hide-user-menu"><?php echo $entry_storepage_layout; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_storepage_layout" class="form-control" id="input-storepage-layout">
														<?php if ($purpletree_multivendor_storepage_layout) { ?>
															<option value="0"><?php echo $text_layout_one; ?></option>
															<option value="1" selected="selected"><?php echo $text_layout_two; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_layout_one; ?></option>
															<option value="1"><?php echo $text_layout_two; ?></option>
														<?php } ?>							
													</select>
												</div>
											</div>
										</div>                  
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-hide-user-menu"><?php echo $text_allow_seller_to_reply_customer; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_allow_seller_to_reply" class="form-control" id="input-hide-user-menu">
														<?php if ($purpletree_multivendor_allow_seller_to_reply) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>							
													</select>
												</div>
											</div>
										</div> 				 
										<!-- End Hide Seller Product Tabs--> 
										<!-- Seller product template--> 
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-hide-user-menu"><?php echo $text_seller_product_template; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_product_template" class="form-control" id="input-hide-user-menu">
														<?php if ($purpletree_multivendor_seller_product_template) { ?>
															<option value="0"><?php echo $text_no; ?></option>
															<option value="1" selected="selected"><?php echo $text_yes; ?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes; ?></option>
														<?php } ?>							
													</select>
												</div>
											</div>
										</div>	
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_allow_related; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_allow_related_product" class="form-control">
														<?php if($purpletree_multivendor_allow_related_product) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>					
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_featured_enabled_hide_edit; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_featured_enabled_hide_edit" class="form-control">
														<?php if($purpletree_multivendor_featured_enabled_hide_edit) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>					
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_featured_product; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_featured_products" class="form-control">
														<?php if($purpletree_multivendor_seller_featured_products) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>					
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_category_featured_product; ?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_seller_category_featured" class="form-control">
														<?php if($purpletree_multivendor_seller_category_featured) { ?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $entry_limit_purchase; ?></label>
												<div class="col-md-9">
													<input type="text" name="purpletree_multivendor_product_limit" class="form-control" value="<?php echo (isset($purpletree_multivendor_product_limit)?$purpletree_multivendor_product_limit:''); ?>"/>
													<?php if(isset($product_limit_error)) { ?>
														<div class="text-danger"><?php echo $product_limit_error; ?></div>
													<?php } ?>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						<div class="row">
							<div class="col-sm-12">
								<div class="clearfix">
									<div class="col-sm-12">
										<h3><?php echo $seller_review_heading; ?></h3>
									</div>
									<div class="col-sm-12">
										<div class="form-group required">
											<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_review; ?></label>
											<div class="col-md-9">
												<select name="purpletree_multivendor_seller_review" class="form-control">
													<?php if($purpletree_multivendor_seller_review) { ?>
														<option value="0"><?php echo $text_no;?></option>
														<option value="1" selected="selected"><?php echo $text_yes;?></option>
														<?php } else { ?>
														<option value="0" selected="selected"><?php echo $text_no;?></option>
														<option value="1"><?php echo $text_yes;?></option>
													<?php } ?>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="clearfix">
									<div class="col-sm-12">
										<h3><?php echo $seller_contact_heading; ?></h3>
									</div>
									<div class="col-sm-12">
										<div class="form-group required">
											<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_contact; ?></label>
											<div class="col-md-9">
												<select name="purpletree_multivendor_seller_contact" class="form-control">
													<?php if ($purpletree_multivendor_seller_contact) { ?>
														<option value="0"><?php echo $text_seller_general; ?></option>
														<option value="1" selected="selected"><?php echo $text_seller_logedin; ?></option>
														<?php } else { ?>
														<option value="0" selected="selected"><?php echo $text_seller_general; ?></option>
														<option value="1"><?php echo $text_seller_logedin; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!----- Start seller Blog setting ---------->
						<div class="row">
							<div class="col-sm-12">
								<div class="clearfix">
									<div class="col-sm-12">
										<h3><?php echo $seller_blog_heading; ?></h3>
									</div>
									<div class="col-sm-12">
										<div class="form-group required">
											<label class="col-md-3 control-label " for="input-blog"><?php echo $entry_seller_sort_by; ?></label>
											<div class="col-md-9">
												<select name="purpletree_multivendor_seller_blog_order" class="form-control" id = "input-blog">
													<?php if ($purpletree_multivendor_seller_blog_order) { ?>
														<option value="0"><?php echo $text_sort_order; ?></option>
														<option value="1" selected="selected"><?php echo $text_create_date_order; ?></option>
														<?php } else { ?>
														<option value="0" selected="selected"><?php echo $text_sort_order; ?></option>
														<option value="1"><?php echo $text_create_date_order; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!----- End seller Blog setting ---------->
						<div class="row">
							<div class="col-sm-12">
								<div class="clearfix">
									<div class="col-sm-12">
										<h3><?php echo $seller_store_heading; ?></h3>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<label class="col-md-2 control-label " for="input-name"><?php echo $entry_seller_store; ?></label>
											<div class="col-md-10">
												<label class="checkbox-inline"><input type="checkbox" value="1" name="purpletree_multivendor_seller_name" <?php echo $purpletree_multivendor_seller_name ? 'checked="checked"' : '' ?> > <?php echo $text_store_seller_name; ?></label>
												<label class="checkbox-inline"><input type="checkbox" value="1" name="purpletree_multivendor_store_email" <?php echo $purpletree_multivendor_store_email ? 'checked="checked"' : '' ?> > <?php echo $text_store_email; ?></label>
												
												<label class="checkbox-inline"><input type="checkbox" value="1" name="purpletree_multivendor_store_phone" <?php echo $purpletree_multivendor_store_phone ? 'checked="checked"' : '' ?> > <?php echo $text_store_phone; ?></label>
												
												<label class="checkbox-inline"><input type="checkbox" value="1" name="purpletree_multivendor_store_address" <?php echo $purpletree_multivendor_store_address ? 'checked="checked"' : '' ?> > <?php echo $text_store_address; ?></label>
												<!-- /////    Store social link   ////// -->		                         
												<label class="checkbox-inline"><input type="checkbox" value="1" name="purpletree_multivendor_store_social_link" <?php echo $purpletree_multivendor_store_social_link ? 'checked="checked"' : '' ?> > <?php echo $text_store_social_link; ?></label>
												<!--  ////  Store social link end ////// -->
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label class="col-md-3 control-label " for="input-name"><?php echo $entry_seller_invoice; ?></label>
									<div class="col-md-9">
										<div class="radio">
											<label><input type="radio" name="purpletree_multivendor_seller_invoice" value="1" checked>&nbsp;<?php echo $text_yes;?></label>
											<label><input type="radio" name="purpletree_multivendor_seller_invoice" <?php echo (($purpletree_multivendor_seller_invoice=="0")?'checked':''); ?> value="0">&nbsp;<?php echo $text_no;?></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
					<!----- Subcription plan---------->
					<div class="tab-pane fade in" id="tab-subscription">
						<div class="row">
							<div class="col-sm-12">
								<div class="clearfix">
									<div class="col-sm-12">
										<h3><?php echo $heading_subscription_plan; ?></h3>
									</div>
									<div class="col-sm-12">
										<div class="form-group required">
											<label class="col-md-3 control-label " for="input-name"><?php echo $enable_subscription_plans_txt; ?></label>
											<div class="col-md-9">
												<select name="purpletree_multivendor_subscription_plans" class="subscriptionchange form-control">
													<?php if($purpletree_multivendor_subscription_plans){ ?>
														<option value="0"><?php echo $text_no;?></option>
														<option value="1" selected="selected"><?php echo $text_yes;?></option>
														<?php } else {?>
														<option value="0" selected="selected"><?php echo $text_no;?></option>
														<option value="1"><?php echo $text_yes;?></option>
													<?php } ?>
												</select>
											</div>
										</div>
									</div>
									<div class="subscription <?php if($purpletree_multivendor_subscription_plans){ } else { ?>  ptsc-storefrm-nodisplay <?php } ?>" >
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $enable_subscription_price_txt;?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_subscription_price" class="form-control">
														<?php if($purpletree_multivendor_subscription_price){?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no; ?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $enable_joining_fees_txt;?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_joining_fees" class="form-control">
														<?php if($purpletree_multivendor_joining_fees){?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-md-3 control-label " for="input-name"><?php echo $paypal_hosted_button_id;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $paypal_hosted_button_id;?>" name="purpletree_multivendor_paypal_email" class="form-control" value="<?php echo $purpletree_multivendor_paypal_email;?>"/>
													<?php if(isset($error_paypal_email)){ ?>
														<div class="text-danger"><?php echo $error_paypal_email;?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $tax_name_txt;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $tax_name_txt;?>" name="purpletree_multivendor_tax_name" class="form-control" value="<?php echo $purpletree_multivendor_tax_name;?>"/>
													<?php if(isset($tax_name_error)){ ?>
														<div class="text-danger"><?php echo $tax_name_error;?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $tax_value_txt;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $tax_value_txt;?>" name="purpletree_multivendor_tax_value" class="form-control" value="<?php echo $purpletree_multivendor_tax_value;?>"/>
													<?php if(isset($tax_value_error)){ ?>
														<div class="text-danger"><?php echo $tax_value_error;?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $reminder_one_days_before_to_be_sent_txt;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $reminder_one_days_before_to_be_sent_txt;?>" name="purpletree_multivendor_reminder_one_days" class="form-control" value="<?php echo $purpletree_multivendor_reminder_one_days;?>"/>
													<?php if(isset($error_reminder_one_days)){ ?>
														<div class="text-danger"><?php echo $error_reminder_one_days;?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $reminder_two_days_before_to_be_sent_txt;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $reminder_two_days_before_to_be_sent_txt;?>" name="purpletree_multivendor_reminder_two_days" class="form-control" value="<?php echo $purpletree_multivendor_reminder_two_days;?>"/>
													<?php if(isset($error_reminder_two_days)){ ?>
														<div class="text-danger"><?php echo $error_reminder_two_days;?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $reminder_three_days_before_to_be_sent_txt;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $reminder_three_days_before_to_be_sent_txt;?>" name="purpletree_multivendor_reminder_three_days" class="form-control" value="<?php echo $purpletree_multivendor_reminder_three_days;?>"/>
													<?php if(isset($error_reminder_three_days)){?>
														<div class="text-danger"><?php echo $error_reminder_three_days; ?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label" for="input-name"><?php echo $grace_period_txt;?></label>
												<div class="col-md-9">
													<input type="text" placeholder="<?php echo $grace_period_txt;?>" name="purpletree_multivendor_grace_period" class="form-control" value="<?php echo $purpletree_multivendor_grace_period;?>"/>
													<?php if(isset($error_grace_period )){?>
														<div class="text-danger"><?php echo $error_grace_period;?></div>
													<?php } ?>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group required">
												<label class="col-md-3 control-label " for="input-name"><?php echo $enable_multiple_active_plan;?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_multiple_subscription_plan_active" class="form-control">
														<?php if($purpletree_multivendor_multiple_subscription_plan_active){?>
															<option value="0"><?php echo $text_no;?></option>
															<option value="1" selected="selected"><?php echo $text_yes;?></option>
															<?php } else { ?>
															<option value="0" selected="selected"><?php echo $text_no;?></option>
															<option value="1"><?php echo $text_yes;?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-md-3 control-label" for="input-currency"><?php echo $text_default_currency_for_paypal;?></label>			
												<div class="col-md-9">
													<select name="purpletree_multivendor_paypal_currency" id="input-currency" class="form-control">
														<?php foreach ($paypalcurrencies as $currencies) { ?>
															<?php if ($currencies['code'] == $purpletree_multivendor_paypal_currency) { ?>
																<option value="<?php echo $currencies['code']; ?>" selected="selected"><?php echo $currencies['title']; ?></option>
																<?php } else { ?>
																<option value="<?php echo $currencies['code']; ?>"><?php echo $currencies['title']; ?></option>
															<?php } ?>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
						</div>
					</div>
					<!----end subscription plan---------->
					<div class="tab-pane fade in" id="tab-hyperlocal">
						<div class="row">
						   <!--Start Hyper Local -->              
										<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-name"><?php echo $entry_seller_areaheading;?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_hyperlocal_status" class="form-control HyperLocalchange" id="input-customer_manage_order">
														<?php if ($purpletree_multivendor_hyperlocal_status) { ?>
														<option value="0"><?php echo $text_no;?></option>
														<option value="1" selected="selected"><?php echo $text_yes;?></option>
														<?php } else { ?>
														<option value="0" selected="selected"><?php echo $text_no;?></option>
														<option value="1"><?php echo $text_yes;?></option>
														<?php  }  ?>
													</select>
												</div>
											</div>
										</div>
										<div class="HypeLocal <?php if ($purpletree_multivendor_hyperlocal_status) { ?> <?php } else { ?> ptsc-storefrm-nodisplay <?php  }  ?>" >
										<div class="col-sm-12">
											<div class="form-group py-1 row">
												<label class="col-md-3 control-label col-form-label" for="input-name"><?php echo $entry_header_popup;?></label>
												<div class="col-md-9">
												<input type="text" placeholder="<?php echo $entry_header_popup;?>" name="purpletree_multivendor_hp_heading" class="form-control" value="<?php echo $purpletree_multivendor_hp_heading;?>"/>
												</div>
											</div>
										</div>
									</div>	
									<div class="col-sm-12">
											<div class="form-group py-1 required row">
												<label class="col-md-3 control-label col-form-label" for="input-area_selection"><?php echo $entry_area_selection;?></label>
												<div class="col-md-9">
													<select name="purpletree_multivendor_area_status" class="form-control" id="input-area_selection">
														<?php if ($purpletree_multivendor_area_status) { ?>
														<option value="0"><?php echo $text_no;?></option>
														<option value="1" selected="selected"><?php echo $text_yes;?></option>
														<?php } else { ?>
<option value="0" selected="selected"><?php echo $text_no;?></option>
														<option value="1"><?php echo $text_yes;?></option>
														<?php  }  ?>
													</select>
												</div>
											</div>
										</div>
										
										<div class="col-sm-12 col-sm-offset-2 offset-md-2">					   
										  
										     <a href="<?php echo $seller_area_link;?>" class="btn btn-primary  ptsc-mv-sellarealink"><?php echo $entry_seller_area_link;?></a>
										   
										</div>
										<!--end Hyper Local -->	
				</form>
			</div>			
		</div>
		<div class="panel-footer text-center ptsc-mv-version">
				<?php echo $version; ?>
		</div>
	</div>
</div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var allowedCat = '<?php echo $purpletree_multivendor_allow_categorytype; ?>';
		if(!allowedCat){
			$('select[name="purpletree_multivendor_allow_categorytype"]').val(1);
			$('#input-category').prop('disabled', true);
			
			$('#product-category').empty();
			$.ajax({
				url:'index.php?route=purpletree_multivendor/sellerproducts/assignCategory&token=<?php echo $token; ?>&filter_name=',
				dataType: 'json',
				success: function(json) {
					$.map(json, function(item) {
						$('#product-category').append('<div id="product-category' + item['category_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '<input type="hidden" name="purpletree_multivendor_allow_category[]" value="' + item['category_id'] + '" /></div>');
					});
				}
			});
		}
	});
	$('.subscriptionchange').on('change', function(){
		var selectid = $(this).val();
		if(selectid == "1") {
			$('.subscription').css('display','block');
			} else {
			$('.subscription').css('display','none');
		}
	})
	$('select[name="purpletree_multivendor_allow_categorytype"]').on('change', function(){
		var selectid = $(this).val();
		if(selectid=="1"){
			$('#input-category').prop('disabled', true);
			
			$('#product-category').empty();
			$.ajax({
				url:'index.php?route=purpletree_multivendor/sellerproducts/assignCategory&token=<?php echo $token; ?>&filter_name=',
				dataType: 'json',
				success: function(json) {
					$.map(json, function(item) {
						$('#product-category').append('<div id="product-category' + item['category_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '</div>');
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
						$('#product-category').append('<div id="product-category' + item['category_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '<input type="hidden" name="purpletree_multivendor_allow_category[]" value="' + item['category_id'] + '" /></div>');
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
			
			$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="purpletree_multivendor_allow_category[]" value="' + item['value'] + '" /></div>');
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
					alert("<?php echo $text_assign_categories; ?>");
					} else{ 
					div_remov.remove();
				}
			}
		});
	});
</script>
<style>	
	<!-- body {font-family: Arial, Helvetica, sans-serif;} -->
	body {font-family: Arial, Helvetica, sans-serif;}		
</style>
<script>
	var modal = document.getElementById('licenseModal');
	var btn = document.getElementById("getLicensee");
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
		modal.style.display = "block";
		// $('#modal_lic_error').html('');
		$('#modal_lic_error').css('display','none');
	}
	span.onclick = function() {
		modal.style.display = "none";
		$('.orderdiv').css('display','none');
	}
	
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
<script>
	function savelicc(){
		var licenskey1 = $('#licenskey1').val();
		if (licenskey1 == "") {
			$('#modal_lic_error').html("<?php echo $error_Enter_license_key; ?>");
			$('#modal_lic_error').css('display','block');
			$('.alertseucess').css('display','none');
			} else {
			$('.alertseucess').text("<?php echo $text_license_key_changed; ?>");
			$('.alertseucess').css('display','block');
			$('#setlicensee').val(licenskey1);
			$('.orderdiv').css('display','none');
			$('.close').click();
		}
	}
	function dontlice(){
		$('.orderdiv').css('display','block');
	}
	function getlicense(order_id,Email_id){
		$('.getlicbtn').addClass('disabled');
		$('.getlicbtn').val("<?php echo $please_wait; ?>");
		var order_id = document.getElementById('order_id').value;
		var email_id = document.getElementById('email_id').value;
		if (!order_id.match(/^\d+/)) {
			$('#modal_lic_error').html("<?php echo $error_order_id; ?>");
			$('#modal_lic_error').css('display','block');
			$('.getlicbtn').removeClass('disabled');
			$('.getlicbtn').val("<?php echo $button_submit; ?>");
			return false;
		} 
		var atpos = email_id.indexOf("@");
		var dotpos = email_id.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email_id.length) {
			$('#modal_lic_error').html("<?php echo $error_email_id; ?>");
			$('#modal_lic_error').css('display','block');
			$('.getlicbtn').removeClass('disabled');
			$('.getlicbtn').val("<?php echo $button_submit; ?>")
			return false;
		}
		$.ajax ({
            url: "https://process.purpletreesoftware.com/processorder.php",
            data:'order_id='+order_id+'&email_id='+email_id+'&module=purpletree_multivendor_oc',
			type: 'POST',
			dataType: "json",
            success: function( result ) {
				$('.getlicbtn').removeClass('disabled');
				$('.getlicbtn').val("<?php echo $button_submit; ?>")
				if(result.status == 'success') {
					$('#setlicensee').val(result.process_data);
					$('.orderdiv').css('display','none');
					$('.alertseucess').text("License key has been Changed. Click on Save button to save changes");
					$('.alertseucess').css('display','block');
					$('.close').click();
					} else {
					$('#modal_lic_error').html(result.msg);
					$('#modal_lic_error').css('display','block');
				}
			}
		});
	}
	$('.HyperLocalchange').on('change', function(){
		var selectid = $(this).val();
		if(selectid == "1") {
			$('.HypeLocal').css('display','block');
			} else {
			$('.HypeLocal').css('display','none');
		}
	})
</script>
<?php echo $footer; ?>