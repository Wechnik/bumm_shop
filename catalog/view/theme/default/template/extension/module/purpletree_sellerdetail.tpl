	<div class="seller_pannel_store pts-seller-detail">
	<div class="store_logo pts-text-center">
		<img class="img-responsive m-auto" src="<?php echo $store_logo; ?>">
	</div>
		<?php if ($purpletree_multivendor_seller_name!=null){ ?>
	<div class="seller-name">
		<h3 class="ptsc-store-sellnamar"><?php echo $seller_name; ?></h3>
	</div>
	<?php  }  ?>

	<?php  if ($seller_review_status) { ?>
	<?php  if ($store_rating['rating']) { ?>
	<div class="rating pts-text-left">
		<?php for($i=1; $i<=5; $i++) { ?>
		<?php  if ($store_rating['rating'] < $i) { ?> <span class="fa fa-stack star-seller"><i class="fa fa-star-o fa-stack-2x"></i></span> <?php } else { ?> <span class="fa fa-stack star-seller"><i class="fa fa-star fa-stack-2x" ></i><i class="fa fa-star-o fa-stack-2x"></i></span> <?php } ?>
		<?php  } ?>(<?php echo number_format($store_rating['rating'], 1); ?>)
	</div>
	<?php } else { ?>
	<?php for($i=1; $i<=5; $i++) { ?>
	<span class="fa fa-stack star-seller"><i class="fa fa-star-o fa-stack-1x" ></i></span>
	<?php  } ?>(<?php echo number_format($store_rating['rating'], 1); ?>)
	<?php  } ?>
	<div class="store-rating">
		<a href="<?php echo $store_review; ?>" target="_blank"><?php echo $text_sellerreview; ?> (<?php echo $store_rating['count']; ?>)</a>
	</div>
	<?php  } ?>
	<?php  if ($purpletree_multivendor_store_social_link!=null) { ?>
	<div class="social-icons d-flex justify-content-between">
		<?php  if ($facebook_link != ''){ ?>
		<a target="_blank" href="<?php echo $facebook_link; ?>"><i class="fa fa-facebook-square ptsc-store-facebo"></i></a> <?php  } ?>
		<?php  if ($twitter_link != ''){ ?>
		<a target="_blank" href="<?php echo $twitter_link ; ?>"><i class="fa fa-tumblr-square"></i></a>
		<?php  } ?>
		<!--<?php  if ($google_link != '') { ?>
		<a  target="_blank" href="<?php echo $google_link; ?>"><i class="fa fa-google-plus-square"></i></a>
		<?php  } ?>-->
		<?php  if ($instagram_link != ''){ ?>
		<a  target="_blank" href="<?php echo $instagram_link; ?>"><i class="fa fa-instagram"></i></a>
		<?php  } ?>
		<?php  if ($pinterest_link != ''){ ?>
		<a target="_blank" href="<?php echo $pinterest_link; ?>"><i class="fa fa-pinterest-square"></i></a>
		<?php  } ?>
		<?php  if ($wesbsite_link != ''){ ?>
		<a target="_blank" href="<?php echo $wesbsite_link; ?>"><i class="fa fa-globe"></i></a>
		<?php  } ?>
		
		<?php  if ($whatsapp_link != '') { ?>
		<a target="_blank" href="<?php echo $whatsapp_link; ?>"><i class="fa fa-whatsapp"></i></a>
		<?php  } ?>
	</div>
	<?php  } ?>
	<div class="seller-info">
		<div class="contact-info">
			<?php  if ($purpletree_multivendor_store_email!=null){ ?>
			<div class="seller-email">
				<div><i class="fa fa-envelope" aria-hidden="true"></i> <?php echo $store_email; ?></div>
			</div>
			<?php  } ?>
			<?php  if ($purpletree_multivendor_store_phone!=null) { ?>
			<div class="seller-phone">
				<div><i class="fa fa-phone" aria-hidden="true"></i> <?php echo $store_phone; ?></div>
			</div>
			<?php  } ?>
			<?php  if ($purpletree_multivendor_store_address!=null){ ?>
			<div class="seller-address">
				<div><i class="fa fa-home" aria-hidden="true"></i><?php echo $store_address; ?><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php echo $store_city; ?><?php echo $store_state; ?><p/><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php echo $store_country; ?><?php echo $store_zipcode; ?><p/></div>
			</div>
			<?php  } ?>
		</div>
		<div class="seller-about">
			<div>
				<a href="<?php echo $store_about; ?>" target="_blank"><?php echo $text_aboutstore; ?>
					<i class="fa fa-angle-right pts-r"></i>
				</a>
			</div>
		</div>
		
		<div class="seller-shipping">
			<div>
				<a href="<?php echo $store_shipping_policy; ?>" target="_blank"><?php echo $text_shippingpolicy; ?>
					<i class="fa fa-angle-right pts-r"></i>
				</a>
			</div>
		</div>
		<div class="seller-return">
			<div>
				<a href="<?php echo $store_return_policy; ?>" target="_blank"><?php echo $text_returnpolicy; ?>
					<i class="fa fa-angle-right pts-r"></i>
				</a>
			</div>
		</div>								
	</div>
	<div class="seller-return pts-text-center">
		<div class=" contact_seller_link">
			<a href="<?php echo $seller_contact; ?>" class="contact_seller" target="_blank"><img src="image/catalog/contact_seller.png" width="20px" height="20px" class="ptsc-store-sellcontactc"> <?php echo $text_sellercontact; ?></a>
		</div>
	</div>	
</div>
			