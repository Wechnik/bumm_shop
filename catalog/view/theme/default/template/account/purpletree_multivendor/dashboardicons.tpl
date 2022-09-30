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
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>	 -->			
			   </div>
			  <?php } ?>
    </div>
  </div>
			
			<div class="pts-row">
				<div class="pts-col-md-12 col-xs-12 ">
					<div class="col-md-12 col-xs-12 account-bg">
						<div class="pts-col-md-4 pts-col-xs-12">
							<!-- <h4 class="<?php if($direction =='rtl') { ?>pts-text-right <?php } else {?> pts-text-left <?php } ?>" style=""><?php echo $text_Seller_Account; ?></h4> -->

							<!-- <hr class="heading-bar"> -->

							<a href="<?php echo $sellerorder; ?>">
								<?php if(isset($orders_icons)) { ?>
								<img src="image/catalog/dashboardicon/shipping-icon-0.png"  class="sellerAccountImg"/>
                                <?php } else {?>
                                	<div class="sellerAccountImg"></div>
							  <?php } ?>
							     
								 <div class="text-icons"><?php echo $text_Orders; ?> </div>

								<?php if(!$totalorders==0) { ?>
									<span class="<?php if(isset($orders_icons)) { ?> pts-counting-1 <?php } else {?> pts-counting-2 <?php } ?>"><?php echo $totalorders; ?></span>
								<?php } ?>
							</a><br>

							<!-- <a href="<?php echo $adminmessages; ?>">
                               <?php if(isset($messages_icons)) { ?>
								<img src="image/catalog/dashboardicon/Adminmessages.png" class="sellerAccountImg"/>
							<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
							  <div class="text-icons"><?php echo $text_sellerenquiries; ?></div>
							  <?php if(!$totaladminmessages==0) { ?>
								<span class="<?php if(isset($messages_icons)) { ?> pts-counting-1 <?php } else {?> pts-counting-2 <?php } ?>"><?php echo $totaladminmessages;?></span>
							<?php } ?></a><br> -->

							<a href="<?php echo $sellerenquiry; ?>">
								 <?php if(isset($enquiries_icons)) { ?>
								 	<img src="image/catalog/dashboardicon/enquiry.png" class="sellerAccountImg"/>
								 	<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
                              <div class="text-icons">
							  <?php echo $text_Customer_Enquiries; ?>
                              </div>
							  <?php if(!$totalenqures==0) { ?>
								<span class="<?php if(isset($enquiries_icons)) { ?> pts-counting-1 <?php } else {?> pts-counting-2 <?php } ?>"><?php echo $totalenqures;?></span>
							<?php } ?>
							</a><br>

							<?php if(isset($subscriptionplan)){ ?>
								<a href="<?php echo $subscriptionplan; ?>">
                                    <?php if(isset($plan_icons)) { ?>
									<img src="image/catalog/dashboardicon/subscription.png"  class="sellerAccountImg"/>
									<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
								<div class="text-icons"><?php echo $text_Subscription_plan; ?>
							   </div>
							</a>
									<br>

							<?php } ?>
							<a href="<?php echo $sellerreview; ?>">
                                 <?php if(isset($reviews_icons)) { ?>
								<img src="image/catalog/dashboardicon/review-icon-2.png" class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>

							 <div class="text-icons">
							 	<?php echo $text_reviews; ?>
                             </div>
							 </a><br>

							<!-- <a href="<?php echo $downloadsitems; ?>">
                                <?php if(isset($downloads_icons)) { ?>
								<img src="image/catalog/dashboardicon/manage-downloads.png"  class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
							   <div class="text-icons">

								<?php echo $text_Manage_Downloads; ?>
							</div>
						</a><br> -->
							
						</div>

						<div class="pts-col-md-4 pts-col-xs-12">


							<!-- <h4 class="<?php if($direction =='rtl') { ?>pts-text-right <?php } else {?> pts-text-left <?php } ?>"><?php echo $text_Seller_Store; ?></h4>
							<hr class="heading-bar"> -->

							<!-- <a href="<?php echo $sellerview; ?>">
                                 <?php if(isset($view_store_icons)) { ?>
								<img src="image/catalog/dashboardicon/view1.png"  class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
							   <div class="text-icons">
							   	<?php echo $text_View_Store; ?>
							</div>
						</a><br> -->

							<!-- <a href="<?php echo $sellerstore; ?>">
								<?php if(isset($store_information_icons)) { ?>
								<img src="image/catalog/dashboardicon/shop.png" class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
							   <div class="text-icons">
							   	<?php echo $text_Store_information; ?>
							   </div>
							</a><br> -->		
							
							<?php if(isset($seller_blog_status)){ ?>
								<a href="<?php echo $sellerblogpost; ?>">
									<?php if(isset($blog_icons)) { ?>
										<img src="image/catalog/dashboardicon/blog.png"  class="sellerAccountImg"/>
										<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									<div class="text-icons">
										<?php echo $text_blog_post; ?>
								   </div>
							</a><br>
								<a href="<?php echo $sellerblogcomment; ?>">
									<?php if(isset($blog_comments_icons)) { ?>
										<img src="image/catalog/dashboardicon/blog-comment.png"  class="sellerAccountImg"/>
										<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									<div class="text-icons">

										<?php echo $text_blog_comment; ?>
									</div></a><br>

							<?php } ?>
							<a href="<?php echo $sellerproduct; ?>">
								<?php if(isset($products_icons)) { ?>
								    <img src="image/catalog/dashboardicon/myfinacle1.png" class="sellerAccountImg"/>
								    <?php } else {?>
								    <div class="sellerAccountImg"></div>
							    <?php } ?>
									  <div class="text-icons"><?php echo $text_Manage_products; ?>
									  </div>
							</a><br>

							<?php if(!$purpletree_multivendor_seller_product_template==0) { ?>
								<a href="<?php echo $seller_template_product; ?>">
									<?php if(isset($product_temp_icons)) { ?>
										<img src="image/catalog/dashboardicon/myfinacle1.png" class="sellerAccountImg"/>
										<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
										<?php echo $text_seller_template_product; ?></div>
									</a><br>
							<?php } ?>

							<!-- <a href="<?php echo $bulkproductupload; ?>">
								<?php if(isset($upload_icons)) { ?>
								<img src="image/catalog/dashboardicon/icon-prepaid.png" class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_Bulk_product_upload; ?>
									  </div>
									</a><br> -->

						</div>
						<div class="pts-col-md-4 pts-col-xs-12">

							<!-- <h4 class="<?php if($direction =='rtl') { ?>pts-text-right <?php } else {?> pts-text-left <?php } ?>"> <?php echo $text_Seller_Payments; ?></h4>
							<hr class="heading-bar"> -->

							<a href="<?php echo $sellerpayment; ?>">
								<?php if(isset($payments_icons)) { ?>
								<img src="image/catalog/dashboardicon/payment.png"  class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_Payments; ?>
									  </div>
									</a><br>

<!-- 
							<a href="<?php echo $sellercommission; ?>">
								<?php if(isset($commissions_icons)) { ?>
									<img src="image/catalog/dashboardicon/commission.png"  class="sellerAccountImg"/>
									<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_Commisions; ?>
									  </div>
									</a><br>

							<a href="<?php echo $commissioninvoice; ?>">
								<?php if(isset($comm_invoices_icons)) { ?>
								<img src="image/catalog/dashboardicon/Stocks-3_7-512.png"  class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_commissioninvoice; ?>
									  </div>
									</a><br>

							<a href="<?php echo $shipping; ?>">
								<?php if(isset($shipping_rates_icons)) { ?>
								<img src="image/catalog/dashboardicon/shipping.png"  class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons"><?php echo $text_shiiping_rate; ?>
									</div>
								</a><br>

							<a href="<?php echo $seller_product_returns; ?>">
								<?php if(isset($returns_icons)) { ?>
								<img src="image/catalog/dashboardicon/return.png"  class="sellerAccountImg"/>
							<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_seller_returns; ?>
									  </div>
									</a><br>
							<?php if(isset($subscriptionplan)){ ?>
								<?php if(isset($subscriptions)){ ?>
									<a href="<?php echo $subscriptions; ?>">
										<?php if(isset($sub_invoice_icons)) { ?>
										<img src="image/catalog/dashboardicon/invoice.png"  class="sellerAccountImg"/>
										<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_Subscription_Invoice; ?>
									  </div>
									</a><br>
								<?php } ?>
							<?php } ?>
							<a href="<?php echo $sellercoupons; ?>">
								<?php if(isset($seller_coupons_icons)) { ?>
								<img src="image/catalog/dashboardicon/coupons.png"  class="sellerAccountImg"/>
								<?php } else {?>
								<div class="sellerAccountImg"></div>
							  <?php } ?>
									  <div class="text-icons">
									  	<?php echo $text_sellercoupons; ?>
									  </div>
									  </a><br> -->


									  <?php if($stripe_status) { ?>
					<!--- Stripe connect---->	
							<?php echo $a_href; ?>
							<img src="image/catalog/dashboardicon/stripe.png"  class="sellerAccountImg"/>
							<div class="sellerAccountImg icons-text"><?php echo $text_stripe_connect; ?></div><?php echo $a; ?><br>
						<?php } ?>

                        	<!--- Stripe connect---->		
                        
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
</div>
</div>
<?php echo $footer; ?>