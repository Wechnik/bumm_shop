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
			<div class="">
				<div class="pts-row">
					<div class="pts-col-sm-12 pts-col-xs-12 ">
						<?php if(isset($multiple_subscription_plan)){ ?>
							<?php if(!$multiple_subscription_plan){ ?>
								<?php if(isset($sellerplan)){ ?>
									<div class="pts-col-sm-12 pts-col-xs-12  pts-welll ptsc-subscr-planmtop">
										<div class="pts-col-sm-12  pts-col-xs-12 pts-current-plan p-0">
											<h4><b> <label class="pts-text-blue"><?php echo $heading_current_plan; ?></label> </b></h4>
										</div>
										<div class="pts-col-sm-12 pts-col-xs-12  p-0">
											<div class="pts-col-sm-3 pts-col-xs-6"><p><b><?php echo $column_sellected_plan; ?>: </b></p></div>
											<div class="pts-col-sm-9 pts-col-xs-6 pts-text-left"><?php echo $sellerplan['plan_name']; ?></div>
										</div>
										<div class="pts-col-sm-6 pts-col-xs-12 p-0">
											
											<div class="pts-col-sm-12 pts-col-xs-12  p-0">	
												<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $column_start_date; ?>: </b></p></div>
												<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"><?php echo $sellerplan['start_date']; ?></div>
											</div>
											<div class="pts-col-sm-12 pts-col-xs-12 p-0">
												<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $column_end_date; ?>: </b></p></div>
												<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"><?php echo $sellerplan['end_date']; ?></div>
											</div>	
											
										</div>
										<div class="pts-col-sm-6 pts-col-xs-12 p-0">	
											
											<div class="pts-col-sm-12 pts-col-xs-12 p-0">
												<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $column_allowed_products; ?>: </b></div>
													<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"> <?php echo $sellerplan['no_of_product']; ?></div>
												</div>	
												<div class="pts-col-sm-12 pts-col-xs-12 p-0">
													<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $column_used_products; ?>: </b></div>
														<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"><?php echo $seller_used_product; ?></div>
													</div>
												</div>
												
												<div class="pts-col-sm-12 pts-col-xs-12 p-0">	
													<div class="pts-col-sm-6 pts-col-xs-12 p-0">
														<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $text_subscription_status; ?>: </b></div>
															<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"> <?php echo $sellerplan['subscription_status']; ?></div>
														</div>	
														<div class="pts-col-sm-6 pts-col-xs-12 p-0">
															<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $text_invoive_status; ?>: </b></div>
																<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"><?php echo $sellerplan['invoice_status']; ?></div>
															</div>
														</div>
														<!--------------->
														<div class="pts-col-sm-12 pts-col-xs-12 p-0">	
															<div class="pts-col-sm-6 pts-col-xs-12 p-0">
																<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $text_featured_products; ?> </b></div>
																	<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"> <?php echo $sellerplan['total_featured_product'].'/'.$sellerplan['featured_product']; ?></div>
																</div>	
																<div class="pts-col-sm-6 pts-col-xs-12 p-0">
																	<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $text_featured_store; ?> </b></div>
																		<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"><?php echo $sellerplan['featured_store']; ?></div>
																	</div>
																</div>
																<div class="pts-col-sm-12 pts-col-xs-12 p-0">	
																	<div class="pts-col-sm-6 pts-col-xs-12 p-0">
																		<div class="pts-col-sm-6 pts-col-xs-6"><p><b><?php echo $text_category_featured_products; ?> </b></div>
																			<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"> <?php echo $sellerplan['total_category_featured_prodcut'].'/'.$sellerplan['category_featured_prodcut']; ?></div>
																		</div>	
																		<div class="pts-col-sm-6 pts-col-xs-12 p-0">
																			<div class="pts-col-sm-6 pts-col-xs-6"><p><b> </b></div>
																				<div class="pts-col-sm-6 pts-col-xs-6 pts-text-left"></div>
																			</div>
																		</div>
																		
																		<!--------------->
																	</div>
																<?php } } } ?>
																<div class="pts-clearfix"></div>
																<h1 class="pts-subscription-plan pts-col-sm-12"><?php echo $title_subscription_plans; ?>
																	<div class="hidden-xs pts-pull-right">
																		<div class="pts-btn-group pts-btn-group-sm">
																			<button type="button" id="sub-list-view" class="pts-btn pts-btn-default" data-toggle="tooltip" title="" data-original-title="<?php echo $text_list ?>">
																				<i class="fa fa-th-list">
																				</i>
																			</button>
																			<button type="button" id="sub-grid-view" class="pts-btn pts-btn-default active" data-toggle="tooltip" title="" data-original-title="<?php echo $text_gide ?>">
																				<i class="fa fa-th">
																				</i>
																			</button>
																		</div>
																	</div>
																</h1>
																<div class="sub-grid">			
																	<?php $coutn = 0; ?>
																	<?php  if(isset($subscriptions)){ ?>
																		<?php foreach($subscriptions as $subscription){ ?>
																			<?php /*if($coutn == 3) {  $coutn = 0;?>
																				<div class="pts-clearfix"></div>
																			<?php } */ ?>
																			<?php if($subscription['status']){ ?>
																				
																				<div class="pts-col-sm-6 pts-col-xs-12 pts-col-md-6 pts-col-lg-4 subsgridd">			
																					<div class=" pts-col-sm-12 plan deactive_plan plan1 pts-col-xs-12 <?php echo $subscription['active_plan'];?> pts-text-left ptsc-subscr-plannamoverpos">
																						<div class="pts-col-sm-12  pts-col-xs-12 plan-name ptsc-subscr-plannam">
																							<h4 class=" ribbon active-plan-text active-plans-text <?php if($subscription['active']=='Inactive'){ echo ' pts-btn-dangerrr ribbondanger text-inactive'; } ?>"><?php echo $subscription['active']; ?>
																							</h4>
																							<h3 class = "pts-text-center"><b class="ptsc-subscr-plannamsiz"> <?php echo $subscription['plan_name']; ?> </b></h3>				
																							
																						</div>
																						<div class="pts-col-sm-12 plan-list pts-col-xs-12 pts-text-left p-0">
																							<div class="pts-col-sm-12  pts-col-xs-12 pts-text-left">
																								<ul>
																									<li><?php echo $column_no_of_products; ?>: <span class = "pts-pull-right"><?php echo $subscription['no_of_product']; //echo $column_products; ?></span></li>
																									<li><?php echo $column_joining_fees; ?>: <span class = "pts-pull-right"><?php echo $subscription['joining_fee']; ?></span></li>
																									<li><?php echo $column_subscription_fees; ?>: <span class = "pts-pull-right"><?php echo $subscription['subscription_price']; ?><?php //echo $column_days; ?></span></li>
																									<li><?php echo $column_validity; ?>: <span class = "pts-pull-right"><?php echo $subscription['validity']; ?></span></li>
																									<li><?php echo $text_featured_products; ?><span class = "pts-pull-right">:<?php echo $subscription['featured_products']; ?></span></li>
																									<li><?php echo $text_category_featured_products; ?>:<span class = "pts-pull-right"><?php echo $subscription['category_featured_prodcuts']; ?></li>
																										<li><?php echo $text_featured_store; ?>:<span class = "pts-pull-right"><?php echo $subscription['featured_store']; ?></span></li>
																									</ul>
																								</div>
																							</div>
																							
																							
																							<div class="pts-col-sm-12 ptsc-store-proh3">
																								<div class="pts-row">	
																									<?php if(!$subscription['active']){ ?>
																										<div class="pts-pull-right">
																											<a href="<?php echo $subscription['subscribe'];?>" class="pts-btn pts-btn-primary invoices-btn posrel" > <?php echo $button_subscribe; ?></a>
																										</div>
																										<?php } else { ?>
																										<div class="pts-pull-left">
																											<a href="<?php echo $subscription['subscribe'];?>" class="pts-btn pts-btn-primary invoices-btn posrel" > <?php echo $button_renew; ?></a>
																										</div>
																										<?php 
																											if ($subscription['active']){
																											?>
																											<div class="pts-pull-right">
																												<a  href="<?php echo $subscription['invoice'];?>" class="pts-btn pts-btn-primary invoices-btn posrel" ><?php echo $text_invoices;?></a>	
																											</div>
																										<?php } ?>
																									<?php } ?>
																								</div>
																								<div class="pts-col-sm-12 pts-text-center">
																									<a class="" title="<?php echo $button_view_all; ?>" href="#" class="viewmore" data-toggle="modal" data-target="#myModala<?php echo $subscription['plan_id']; ?>"><?php echo $button_view_all;?></a>
																								</div>						
																							</div>
																							
																						</div>
																						<!-- Modal plan a -->
																						<div class="modal fade" id="myModala<?php echo $subscription['plan_id'];?>" role="dialog">
																							<div class="modal-dialog popup-model">
																								<!-- Modal content-->
																								<div class="modal-content hieght-fixed">
																									<div class="modal-header">
																										<button type="button" class="close" data-dismiss="modal">&times;</button>
																										<h4 class="modal-title"><?php echo $column_description; ?></h4>
																									</div>
																									<div class="modal-body">
																										<p><?php echo $subscription['plan_description']; ?> </p>
																									</div>
																								</div>
																								
																							</div>
																						</div>
																						
																					</div>
																					<?php
																					} 
																					$coutn ++; 
																				} 
																			} ?>
																	</div>
																	<div class="sub-list"> 
																		<?php  if(isset($subscriptions)){ ?>
																			<?php foreach($subscriptions as $subscription){ ?>
																				<?php if($subscription['status']){ ?>
																					<div class="pts-col-sm-12 deactive_plan  pts-col-xs-12 <?php echo $subscription['active_plan'];?>">
																						<div class="pts-col-sm-12 plan plan1 pts-col-xs-12 pts-text-left ">
																							<div class="pts-col-sm-12  pts-col-xs-12 plan-name ptsc-subscr-plannam">
																								<h4><b> <?php echo $subscription['plan_name']; ?> <label class="pts-pull-right active-plan-text <?php if($subscription['active']=='Inactive'){ echo ' pts-btn-dangerrr '; } ?>"><?php echo $subscription['active']; ?></label></b></h4>
																							</div>
																							<div class="pts-col-sm-5 plan-list pts-col-xs-12 pts-text-left p-0">
																								<div class="pts-col-sm-12  pts-col-xs-12 pts-text-left">
																									<ul>
																										<li><?php echo $column_no_of_products; ?>: <span class = "pts-pull-right"><?php echo $subscription['no_of_product']; //echo $column_products; ?></span></li>
																										<li><?php echo $column_joining_fees; ?>: <span class = "pts-pull-right"><?php echo $subscription['joining_fee']; ?></span></li>
																										<li><?php echo $column_subscription_fees; ?>: <span class = "pts-pull-right"><?php echo $subscription['subscription_price']; ?><?php //echo $column_days; ?></span></li>
																										<li><?php echo $column_validity; ?>: <span class = "pts-pull-right"><?php echo $subscription['validity']; ?></span></li>
																										<li><?php echo $text_featured_products; ?><span class = "pts-pull-right">:<?php echo $subscription['featured_products']; ?></span></li>
																										<li><?php echo $text_category_featured_products; ?>:<span class = "pts-pull-right"><?php echo $subscription['category_featured_prodcuts']; ?></li>
																											<li><?php echo $text_featured_store; ?>:<span class = "pts-pull-right"><?php echo $subscription['featured_store']; ?></span></li>
																										</ul>
																									</div>
																								</div>
																								<form action="" method="post" enctype="multipart/form-data" class="pts-form-horizontal">
																									<div class="pts-col-sm-7 pts-col-xs-12 pts-text-left">
																										<p class="ptsc-subscr-shdesc"> <?php echo $subscription['plan_short_description']; ?> 
																											<a href="#" class="viewmore" data-toggle="modal" data-target="#myModala1<?php echo $subscription['plan_id']; ?>"><?php echo $button_view_all; ?></a><p>
																												<div class="pts-text-right pts-form-group">
																													<div class="pts-row">	
																														<?php if(!$subscription['active']){ ?>
																															<div class="pts-col-sm-3 pts-col-sm-offset-8">
																																<a href="<?php echo $subscription['subscribe'];?>" class="pts-btn pts-btn-primary" > <?php echo $button_subscribe; ?></a>
																															</div>
																															<?php } else { ?>
																															<div class="pts-col-sm-3 pts-col-sm-offset-3">
																																<a href="<?php echo $subscription['subscribe'];?>" class="pts-btn pts-btn-primary" > <?php echo $button_renew; ?></a>
																															</div>
																														<?php } ?>
																													</div>
																												</div>
																											</div>
																											<?php 
																												if ($subscription['active']){
																												?>
																												<a href="<?php echo $subscription['invoice'];?>" class="pts-btn pts-btn-primary-sm invoices-btn" ><?php echo $text_invoices;?></a>	
																											<?php } ?>
																										</form>
																									</div>
																									<!-- Modal plan a -->
																									<div class="modal fade" id="myModala1<?php echo $subscription['plan_id'];?>" role="dialog">
																										<div class="modal-dialog popup-model">
																											<!-- Modal content-->
																											<div class="modal-content hieght-fixed">
																												<div class="modal-header">
																													<button type="button" class="close" data-dismiss="modal">&times;</button>
																													<h4 class="modal-title"><?php echo $column_description; ?></h4>
																												</div>
																												<div class="modal-body">
																													<p><?php echo $subscription['plan_description']; ?> </p>
																												</div>
																											</div>
																											
																										</div>
								</div>
								
							</div>
							<?php
							} 
						} 
					} ?>
			</div>
		</div>
	</div>
</div>
					<!----------------end subscription plan ------------------------->
</div>
</div>
</div>
<script>
	$( document ).ready(function() {
		
		$("#sub-grid-view").on("click", function() {
			$(".sub-grid").show();
			$(".sub-list").hide();
		});
		$("#sub-list-view").on("click", function() {
			$(".sub-list").show();
			$(".sub-grid").hide();
		});
	}); 
	window.onload = (event) => {
		$(".sub-list").hide();
	};
</script>
<?php echo $footer; ?>											