<?php  if(isset($newsellerpanel)){ ?>
<nav id="column-left">
  <div id="navigation"><span class="fa fa-bars"></span> <?php echo $text_selleroption; ?></div>
  <ul id="menu">
<?php  if($logged){ ?>
	<?php   if(isset($isSeller['store_status']) &&($isSeller['store_status'])){ ?>
    <li id="pts-seller-panel-dashboardicon"><a href="<?php echo $dashboardicons; ?>"><?php if(isset($dashboard_iconss)) { ?><i class="fa fa-dashboard fw"></i><?php } else{?>
		<div class="invert sellerAccountImg1"></div>
	<?php }?>
        <div class="menu-icons"> 
         <?php echo $text_dashboard_icon; ?>
        </div>
    </a>
    </li>
	<li id="pts-seller-panel-dashboard"><a href="<?php echo $dashboard; ?>">
		<?php if(isset($summary_icons)) {?><img src="image/catalog/dashboardicon/shipping-icon-0.png"  class="invert sellerAccountImg1"/>
	<?php } else{?>
		<div class="invert sellerAccountImg1"></div>
	<?php }?>
        <div class="menu-icons"> 
		 <?php echo $text_dashboard; ?>
		</div>
	</a>
    </li>
	<?php  if(isset($password)){ ?>
	<li id="pts-seller-panel-password">
	   <a href="<?php echo $password; ?>">
			<?php if(isset($pass_icons)) { ?>
				  <i class="fa fa-user fw"></i>
		         <?php } else{?>
			     <div class="invert sellerAccountImg1"></div>
		    <?php }?>
	             <div class="menu-icons"> 
	                <?php echo $text_password; ?>
	             </div>
        </a>
    </li>
	<?php  } ?>
	<li id="pts-seller-panel-sellerstore">
        <a href="<?php echo $sellerstore; ?>">
		    <?php if(isset($store_information_icons)) { ?>
			    <img src="image/catalog/dashboardicon/shop.png"  class="invert sellerAccountImg1"/>
			    <?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	       <?php }?>
                <div class="menu-icons"> 
                   <?php echo $text_sellerstore; ?>
               </div>
        </a>
    </li>
	<li id="pts-seller-panel-sellerproduct">
	     <a href="#collapse1" data-toggle="collapse" class="parent collapsed">
            <?php if(isset($sales_icons)) { ?>
	     	   <i class="fa fa-shopping-cart fw"></i>
               <?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	        <?php }?>
                <div class="menu-icons"> 
	     	       <?php echo $text_sales; ?>
	     	    </div>
	     </a>
	<ul id="collapse1" class="collapse">
	<li id="pts-seller-panel-sellerorder"><a href="<?php echo $sellerorder; ?>"> <?php echo $text_sellerorder; ?></a>
    </li>
	<li id="pts-seller-panel-sellerpayment"><a href="<?php echo $sellerpayment; ?>"><?php echo $text_sellerpayment; ?></a>
    </li>
	<li id="pts-seller-panel-sellercommission"><a href="<?php echo $sellercommission; ?>"> <?php echo $text_sellercommission; ?></a>
    </li>
	<li id="pts-seller-panel-commissioninvoice"><a href="<?php echo $commissioninvoice; ?>"> <?php echo $text_commissioninvoice; ?></a>
    </li>
	<li id="pts-seller-panel-seller-product-returns"><a href="<?php echo $seller_product_returns; ?>"> <?php echo $text_seller_returns; ?></a>
    </li>
	<li id="pts-seller-panel-sellercoupons"><a href="<?php echo $sellercoupons; ?>"> <?php echo $text_sellercoupons; ?></a>
    </li>
    </ul>
    </li>
	<li id="pts-seller-panel-sellerproduct">
	<a href="#collapse2" data-toggle="collapse" class="parent collapsed">
		<?php if(isset($catalog_icons)) {?>
		<i class="fa fa-tags fw"></i>
		<?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	       <?php }?>
                <div class="menu-icons"> 
                	<?php echo $text_catalog; ?>
                </div>
    </a>
	
	<ul id="collapse2" class="collapse">
	<li id="pts-seller-panel-sellerproductt"><a href="<?php echo $sellerproduct; ?>"><?php echo $text_sellerproduct; ?></a></li>
	<li id="pts-seller-panel-attribute-link"><a href="<?php echo $attribute_link; ?>"> <?php echo $text_attribute; ?></a>
    </li>
	<li id="pts-seller-panel-attribute-groups-link"><a href="<?php echo $attribute_groups_link; ?>"> <?php echo $text_attribute_groups; ?></a>
    </li>
	<li id="pts-seller-panel-options-link"><a href="<?php echo $options_link; ?>"> <?php echo $text_options; ?></a>
    </li>
	<?php  if($purpletree_multivendor_seller_product_template == 1){ ?>
	<li id="pts-seller-panel-seller-template-product"><a href="<?php echo $seller_template_product; ?>"> <?php echo $text_seller_template_product; ?></a>
    </li>
	<?php } ?>
	<li id="pts-seller-panel-downloadsitems"><a href="<?php echo $downloadsitems; ?>"> <?php echo $text_downloads; ?></a>
    </li>
	</ul>
    </li>
	<li id="pts-seller-panel-shipping">
		<a href="<?php echo $shipping; ?>">
           <?php if(isset($shipping_rates_icons)) { ?>
		       <img src="image/catalog/dashboardicon/shipping.png"  class="invert sellerAccountImg1"/>
		       <?php } else{?>
		       <div class="invert sellerAccountImg1"></div>
	       <?php }?>
                <div class="menu-icons"> 
                  <?php echo $text_shipping; ?>
                </div>
        </a>
    </li>
	<li id="pts-seller-panel-bulkproductupload">
		 <a href="<?php echo $bulkproductupload; ?>">
		 	<?php if(isset($upload_icons)) { ?>
		 		<img src="image/catalog/dashboardicon/icon-prepaid.png"  class="invert sellerAccountImg1"/> 
		 		<?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	        <?php }?>
                <div class="menu-icons"> 
                	<?php echo $text_bulkproductupload; ?>
                </div> 
        </a>
    </li>
	<li id="pts-seller-panel-sellerenquiry">
		<a href="<?php echo $sellerenquiry; ?>">
			<?php if(isset($enquiries_icons)) { ?>
				<img src="image/catalog/dashboardicon/enquiry.png"  class="invert sellerAccountImg1"/>
				<?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	        <?php }?>
                <div class="menu-icons"> 
                  <?php echo $text_sellerenquiry; ?>
                </div>
        </a>
    </li>
	<li id="pts-seller-panel-sellerenquiries">
		<a href="<?php echo $sellerenquiries; ?>">
			<?php if(isset($messages_icons)) { ?>
			   <img src="image/catalog/dashboardicon/Adminmessages.png"  class="invert sellerAccountImg1"/> 
			   <?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	        <?php }?>
                <div class="menu-icons"> 
			       <?php echo $text_seller_enquiries; ?>
			    </div>
		</a>
    </li>
	<li id="pts-seller-panel-sellerreview">
		<a href="<?php echo $sellerreview; ?>">
			<?php if(isset($reviews_icons)) { ?>
			     <img src="image/catalog/dashboardicon/review-icon-2.png"  class="invert sellerAccountImg1"/>
			     <?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	        <?php }?>
                <div class="menu-icons">
			      <?php echo $text_sellerreview; ?>
			    </div>
	    </a>
    </li> 
	<?php  if($seller_blog_status){ ?> 
	<li id="pts-seller-panel-sellerblogpost">
		<a href="<?php echo $sellerblogpost; ?>">
			<?php if(isset($blog_icons)) { ?>
				 <img src="image/catalog/dashboardicon/blog.png"  class="invert sellerAccountImg1"/>
				 <?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	        <?php }?>
                <div class="menu-icons">
                  <?php echo $text_blog_post; ?>
                </div>
        </a>
    </li>
	<li id="pts-seller-panel-sellerblogcomment">
		  <a href="<?php echo $sellerblogcomment; ?>">
		  	 <?php if(isset($blog_comments_icons)) { ?>
		  	 	 <img src="image/catalog/dashboardicon/blog-comment.png"  class="invert sellerAccountImg1"/>
		  	 	 <?php } else{?>
		        <div class="invert sellerAccountImg1"></div>
	         <?php }?>
                <div class="menu-icons">
		  	 	  <?php echo $text_blog_comment; ?>
		  	 	</div>

		   </a>
    </li>
	<?php  } ?>
		<?php  if(isset($subscriptionplan)){ ?>
		<li id="pts-seller-panel-subscriptionplan">
			<a href="<?php echo $subscriptionplan; ?>">
				<?php if(isset($plan_icons)) { ?>
			      <img src="image/catalog/dashboardicon/subscription.png"  class="invert sellerAccountImg1"/>
			      <?php } else{?>
		          <div class="invert sellerAccountImg1"></div>
	           <?php }?>
                  <div class="menu-icons">
			         <?php echo $text_subscription; ?>
			      </div>
			</a>
		</li>
		<li id="pts-seller-panel-subscriptions">
			<a href="<?php echo $subscriptions; ?>">
				<?php if(isset($Sub_invoice_icons)) { ?>
					<img src="image/catalog/dashboardicon/subscription.png"  class="invert sellerAccountImg1"/>
					<?php } else{?>
		          <div class="invert sellerAccountImg1"></div>
	            <?php }?>
                  <div class="menu-icons">
					 <?php echo $text_subscriptions; ?>
				  </div>
			</a>
		</li>
	  <?php  } ?> 
	<li id="pts-seller-panel-removeseller">
		<a onclick="return confirm('Are you sure?')" href="<?php echo $removeseller; ?>">
            <?php if(isset($remove_as_seller_icons)) { ?>
			   <i class="fa fa-sign-out"></i> 
			   <?php } else{?>
		          <div class="invert sellerAccountImg1"></div>
	            <?php }?>
                  <div class="menu-icons">
			         <?php echo $text_removeseller; ?>
			      </div>
	    </a>
	</li>
	<?php  if(isset($logout)){ ?>
		<li id="pts-seller-panel-logout">
			<a href="<?php echo $logout; ?>">
				<?php if(isset($log_icons)) { ?>
					<i class="fa fa-sign-out"></i> 
					<?php } else{?>
		            <div class="invert sellerAccountImg1"></div>
	            <?php }?>
	                <div class="menu-icons">
					  <?php echo $text_logout; ?>
				    </div>
			</a>
		</li>	
	<?php  } ?>
	<?php  } else { ?>
		<?php  if($isSeller['is_removed']) { ?>
		<li id="pts-seller-panel-becomeseller">
			<a href="<?php echo $becomeseller; ?>">
				<i class="fa fa-user fw"></i> 
				<?php echo $text_becomeseller; ?></a>
		</li>	
		<?php  } else { ?>
		<li id="pts-seller-panel-approval">			
			<a javascript="void(0)">
				<?php  if(isset($admin_approval_icons)) { ?>
			         <i class="fa fa fa-upload fw"></i>
			         <?php } else{?>
		             <div class="invert sellerAccountImg1"></div>
	            <?php }?>
	                <div class="menu-icons"> 
			           <?php echo $text_approval; ?>
			        </div>
		    </a>
		   <li id="pts-seller-panel-sellerstore">
		   	  <a href="<?php echo $sellerstore; ?>">
		   	  	<?php  if(isset($store_information_icons)) { ?>
		   	      <img src="image/catalog/dashboardicon/shop.png"  class="invert sellerAccountImg1"/>
		   	       <?php } else{?>
		             <div class="invert sellerAccountImg1"></div>
	            <?php }?>
	                <div class="menu-icons"> 
		   	          <?php echo $text_sellerstore; ?>
		   	        </div>
		   	  </a>
		   </li>	
		</li>	
		<?php  } ?>
		<?php  if(isset($logout)){ ?>
		<li id="pts-seller-panel-logout">
			<a href="<?php echo $logout; ?>">
				<?php if(isset($log_icons)) { ?>
			       <i class="fa fa-sign-out"></i> 
			         <?php } else{?>
		             <div class="invert sellerAccountImg1"></div>
	            <?php }?>
	                <div class="menu-icons">
			          <?php echo $text_logout; ?>
			        </div>
			</a>
		</li>	
	<?php  } ?>
	<?php  } ?>
	<?php  } ?> 
  </ul>
  <script>
  	$('#button-menu').on('click', function(e) {
		e.preventDefault();
		
		$('#column-left').toggleClass('active');
	});
 	// Set last page opened on the menu
	$('#menu a[href]').on('click', function() {
		sessionStorage.setItem('menu', $(this).attr('href'));
	});

	if (!sessionStorage.getItem('menu')) {
		$('#menu #dashboard').addClass('active');
	} else {
		// Sets active and open to selected page in the left column menu.
		$('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parent().addClass('active');
	}
	
	$('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li > a').removeClass('collapsed');
	
	$('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('ul').addClass('in');
	
	$('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li').addClass('active');
 </script>
 </nav>
 <?php } ?>