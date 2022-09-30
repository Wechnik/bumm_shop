<?php echo $header; ?>
	<div class="container">
		<ul class="pts-breadcrumb breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		<?php if ($error_warning) { ?>
			<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
		<?php } ?>
		<div class="pts-row d-flex row">
		<?php if ($column_right) { ?>
			<?php $class = 'pts-col-sm-9 col-sm-9'; ?>
			<?php $classproducts = 'pts-col-lg-4 pts-col-md-4'; ?>
			<?php } else { ?>
			<?php $class = 'pts-col-sm-12 col-sm-12'; ?>
			<?php $classproducts = 'pts-col-lg-3 pts-col-md-3'; ?>
		<?php } ?>
			<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
				<?php if($storepage_layout) { ?>		
				<div class="pts-row">					
					<div class="pts-col-sm-7">
						<img src="<?php echo $store_banner; ?>" class="img-responsive" alt="Image">
					</div>
					<div class="pts-col-sm-5 ptsvideo"> 
						<iframe src="<?php echo $store_video; ?>" class="ptsc-store-maphww" </iframe>
					</div>
				</div>				  
				<div class="pts-row ptsrow2">
					<div class="pts-col-sm-7 ptsinsidecol">
						<div class="pts-well">
							<div class="pts-col-sm-6">
								<div class="pts-row ptsc-store-imagemb">
									<div class="pts-col-sm-6" >
										<img src="<?php echo $store_logo; ?>" class="img-responsive" alt="Image">
									</div>
									<div class="pts-col-sm-6">
										<h4><?php echo $store_name; ?></h4>
										<?php if($seller_review_status) { ?>
											<?php if ($store_rating['rating']) { ?>
												<div class="rating pts-text-left">
													<?php for ($i = 1; $i <= 5; $i++) { ?>
														<?php if ($store_rating['rating'] < $i) { ?>
															<span class="fa fa-stack star-seller"><i class="fa fa-star-o fa-stack-1x"></i></span>
															<?php } else { ?>
															<span class="fa fa-stack star-seller"><i class="fa fa-star fa-stack-1x"></i></span>
														<?php } ?>
													<?php } ?>(<?php echo number_format($store_rating['rating'],1);?>)
												</div>
												<?php } else { ?>
												<?php for ($i = 1; $i <= 5; $i++) { ?>
													<span class="fa fa-stack star-seller"><i class="fa fa-star-o fa-stack-1x"></i></span>
												<?php } ?>(<?php echo number_format($store_rating['rating'],1);?>)
											<?php } ?>
											<div class="store-rating">
												<a href="<?php echo $store_review;?>" target="_blank"><?php echo $text_sellerreview;?> (<?php echo $store_rating['count']; ?>)</a>
											</div>
										<?php } ?>
									</div>
								</div>
								<div class="pts-row">
									<div class="pts-col-sm-12" >
										<?php if(isset($purpletree_multivendor_store_email)) { ?> <b><?php echo $store_email; ?>:</b>  <?php echo $store_email; ?> <?php } ?><br>	
										<?php if(isset($purpletree_multivendor_store_address)) { ?><b>Address:</b> 	<?php echo $store_address; ?>
										<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php echo $store_city; ?><?php echo $store_state; ?><p/><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php echo $store_country; ?><?php echo $store_zipcode; ?><p/>
										<?php } ?><br>
										<?php if(isset($purpletree_multivendor_store_phone)) { ?><b>Tel. no:</b> <?php echo $store_phone; ?> <?php } ?><br>
										<?php if(isset($purpletree_multivendor_store_social_link)) { ?>
											<div class="social-icons">
												<?php if ($facebook_link != '' ){ ?>
													<a target="_blank" href="<?php echo $facebook_link;?>"><i class="fa fa-facebook-square ptsc-store-facebo"></i></a>
												<?php } ?>
												<?php if($twitter_link!= '' ){ ?>
													<a target="_blank" href="<?php echo $twitter_link;?>"><i class="fa fa-tumblr-square"></i></a>
												<?php } ?>
												<!--<?php //if($google_link!= '' ){ ?>
													<a  target="_blank" href="<?php //echo $google_link;?>"><i class="fa fa-google-plus-square"></i></a>
												<?php //} ?>-->
												<?php if($instagram_link!= '' ){ ?>
													<a  target="_blank" href="<?php echo $instagram_link;?>"><i class="fa fa-instagram"></i></a>
												<?php } ?>
												<?php if($pinterest_link!= '' ){ ?>
													<a target="_blank" href="<?php echo $pinterest_link;?>"><i class="fa fa-pinterest-square"></i></a>
												<?php } ?>
												<?php if($wesbsite_link!= '' ){ ?>
													<a target="_blank" href="<?php echo $wesbsite_link;?>"><i class="fa fa-globe"></i></a>
												<?php } ?>
												<?php if($whatsapp_link != '' ){ ?>
													<a target="_blank" href="<?php echo $whatsapp_link; ?>"><i class="fa fa-whatsapp"></i></a>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="pts-row">
								<div class="pts-col-sm-6">
									<b><h3 class="pts-text-right"><?php echo $text_store_timings; ?></h3></b>
									<div class="pts-text-right">
										<h4><?php echo $store_timings; ?></h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="pts-col-sm-5 ptsstoreimage"> 
						<img src="<?php echo $store_image; ?>" class="img-responsive" alt="Image">  
					</div>
				</div>
				<div class="pts-row">
					<div class="pts-col-sm-7 ptsimage">
						<div class="pts-well" id="ptsabout1">
							<?php echo $store_description; ?>							
						</div>
					</div>
					<div class="pts-col-sm-5 ptsgooglemap"> 
						<iframe src="<?php echo $google_map; ?>" class="ptsc-storeview-heiwid"> </iframe>
					</div>
				</div>
				<?php if($seller_products) { ?>
					<div class="pts-well ptsfilter">
						<div class="pts-row">
							<div class="pts-col-md-4 pts-col-xs-0 pull-left ptsc-store-marlef">
								<h3 class="ptsc-store-proh3"><?php echo 'Product / Services'; ?></h3>
							</div>
							<div class="pts-col-md-2 pts-col-sm-6 hidden-xs">
								
							</div>
							<div class="pts-col-md-3 pts-col-sm-6">
								
							</div>
							<div class="pts-col-md-4 pts-col-xs-6 pts-pull-right">
								<div class="pts-form-group pts-input-group pts-input-group-sm">
									<label class="pts-input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
									<select id="input-sort" class="pts-form-control" onchange="location = this.value;">
										<?php foreach ($sorts as $sorts) { ?>
											<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
												<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="pts-col-md-3 pts-col-xs-6 pts-pull-right ptsc-store-padd">
								<div class="pts-form-group pts-input-group pts-input-group-sm">
									<label class="pts-input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
									<select id="input-limit" class="pts-form-control" onchange="location = this.value;">
										<?php foreach ($limits as $limits) { ?>
											<?php if ($limits['value'] == $limit) { ?>
												<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="pts-row">
						<?php $ccc = 0; ?>
						<?php foreach ($seller_products as $product) { ?>
							<?php if($column_right) { ?>
										<?php if($ccc % 3 == 0) { ?>
											<div class="pts-clearfix"></div>
										<?php } ?>
										<?php } else { ?>
											<?php if($ccc % 4 == 0) { ?>
												<div class="pts-clearfix"></div>
											<?php } ?>
										<?php } ?>
							<div class="product-layout <?php echo $classproducts ?> pts-product-grid pts-col-sm-6 pts-col-xs-12">
								<div class="pts-product-thumb">
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
									<div>
										<div class="pts-caption">
											<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
											<?php if (isset($multivendor_status)) { ?>
												<?php if (isset($show_seller_name)) { ?>
												<?php if ($product['seller_name']) { ?>
													<p><a href="<?php echo $product['seller_link']; ?>"><?php echo $text_seller_label; ?>&nbsp<?php echo $product['seller_name']; ?></a></p>
												 <?php } ?>
												<?php } ?>
												<?php if (isset($show_seller_address)) { ?>
													<?php if ($product['store_address']) { ?>
													<?php if ($product['google_map']) { ?>
													<a href="<?php echo $product['google_map']; ?>"><p><i class ="fa fa-map-marker ptsc-store-addressco"></i>&nbsp<?php echo $product['store_address']; ?></p></a>
													<?php } else { ?>
													<p><i class ="fa fa-map-marker ptsc-store-addressco"></i>&nbsp<?php echo $product['store_address']; ?></p>
												   <?php } ?>
												<?php } ?>
												<?php } ?>
											<?php } ?>
											<?php if ($product['price']) { ?>
												<p class="price">
													<?php if (!$product['special']) { ?>
														<?php echo $product['price']; ?>
														<?php } else { ?>
														<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
													<?php } ?> 
												</p>
											<?php } ?>
										</div>
										<div class="pts-button-group">
											<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="pts-cartbtnn hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
											<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
											<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
									</div>
								</div>
							</div>
							<?php $ccc++; ?>
						<?php } ?>
					</div>
					<div class="pts-row">
						<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
						<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
					</div>
					<?php } else { ?>
					<div class="pts-text-center"><h3><?php echo $text_no_results; ?></h3></div>
				<?php } ?>
				<?php } else { ?>
	               <h1 class="ptsc-store-name"><?php echo $store_name; ?></h1>
				<div class="pts-banner">
					<img class="img-responsive ptsc-quick-deliverb" src="<?php echo $store_banner;?>">
				</div>
				<div class="col-md-12 p-0 pts-form-group">
					<div class="store-navbar">
						<li>
							<a href="<?php echo $allCategory; ?>"><?php echo $text_all; ?></a>
						</li>
						<?php if(isset($storeMenu)){ ?>
							<?php foreach($storeMenu as $key=>$value) {?>
								<li>
									<a href="<?php echo $value['url']; ?>"><?php echo $value['name']; ?></a>
								</li>
							<?php } } ?>
							
					</div>
				</div>
				<div class="pts-row ptsc-store-marlef pts-store-mar-right">
					<div class="store_top_div clearfix">
						<div class="pts-col-sm-3 seller_pannel_store">
							<div class="store_logo pts-text-center">
								<img class="img-responsive m-auto" src="<?php echo $store_logo;?>">
							</div>
							<?php if(isset($purpletree_multivendor_seller_name)){ ?>
								<div class="seller-name">
									<h3 class="ptsc-store-sellnamarr"><?php echo $seller_name; ?></h3>
								</div>
							<?php } ?>
							<?php if($seller_review_status) { ?>
								<?php if ($store_rating['rating']) { ?>
									<div class="rating pts-text-left">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
											<?php if ($store_rating['rating'] < $i) { ?>
												<span class="fa fa-stack star-seller"><i class="fa fa-star-o fa-stack-1x"></i></span>
												<?php } else { ?>
												<span class="fa fa-stack star-seller"><i class="fa fa-star fa-stack-1x"></i></span>
											<?php } ?>
										<?php } ?>(<?php echo number_format($store_rating['rating'],1);?>)
									</div>
									<?php } else { ?>
									<?php for ($i = 1; $i <= 5; $i++) { ?>
										<span class="fa fa-stack star-seller"><i class="fa fa-star-o fa-stack-1x"></i></span>
									<?php } ?>(<?php echo number_format($store_rating['rating'],1);?>)
								<?php } ?>
								<div class="store-rating">
									<a href="<?php echo $store_review;?>" target="_blank"><?php echo $text_sellerreview;?> (<?php echo $store_rating['count']; ?>)</a>
								</div>
							<?php } ?>
							<?php if(isset($purpletree_multivendor_store_social_link)){ ?>
								<div class="social-icons">
									<?php if ($facebook_link != '' ){ ?>
										<a target="_blank" href="<?php echo $facebook_link;?>"><i class="fa fa-facebook-square ptsc-store-facebo"></i></a>
									<?php } ?>
									<?php if($twitter_link!= '' ){ ?>
										<a target="_blank" href="<?php echo $twitter_link;?>"><i class="fa fa-tumblr-square"></i></a>
									<?php } ?>
									<!--<?php// if($google_link!= '' ){ ?>
										<a  target="_blank" href="<?php //echo $google_link;?>"><i class="fa fa-google-plus-square"></i></a>
									<?php //} ?>-->
									<?php if($instagram_link!= '' ){ ?>
										<a  target="_blank" href="<?php echo $instagram_link;?>"><i class="fa fa-instagram"></i></a>
									<?php } ?>
									<?php if($pinterest_link!= '' ){ ?>
										<a target="_blank" href="<?php echo $pinterest_link;?>"><i class="fa fa-pinterest-square"></i></a>
									<?php } ?>
									<?php if($wesbsite_link!= '' ){ ?>
										<a target="_blank" href="<?php echo $wesbsite_link;?>"><i class="fa fa-globe"></i></a>
									<?php } ?>
									<?php if($whatsapp_link != '' ){ ?>
										<a target="_blank" href="<?php echo $whatsapp_link; ?>"><i class="fa fa-whatsapp"></i></a>
									<?php } ?>
								</div>
							<?php } ?>
							<div class="seller-info">
								<div class="contact-info">
									<?php if(isset($purpletree_multivendor_store_email)) { ?>
										<div class="seller-email">
											<div><i class="fa fa-envelope" aria-hidden="true"></i> <?php echo $store_email; ?></div>
										</div>
										<?php } if(isset($purpletree_multivendor_store_phone)) { ?>
										<div class="seller-phone">
											<div><i class="fa fa-phone" aria-hidden="true"></i> <?php echo $store_phone; ?></div>
										</div>
										<?php } if(isset($purpletree_multivendor_store_address)) { ?>
										<div class="seller-address">
											<div><i class="fa fa-home" aria-hidden="true"></i> <?php echo $store_address; ?><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php echo $store_city; ?><?php echo $store_state; ?><p/><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php echo $store_country; ?><?php echo $store_zipcode; ?><p/></div>
										</div>
									<?php } ?>
								</div>
								<div class="seller-about">
									<div>
										<a href="<?php echo $store_about;?>" target="_blank"><?php echo $text_aboutstore;?>
											<i class="fa fa-angle-right pts-r"></i>
										</a>
									</div>
								</div>
								<div class="seller-shipping">
									<div>
										<a href="<?php echo $store_shipping_policy;?>" target="_blank"><?php echo $text_shippingpolicy;?>
											<i class="fa fa-angle-right pts-r"></i>
										</a>
									</div>
								</div>
								<div class="seller-return">
									<div>
										<a href="<?php echo $store_return_policy;?>" target="_blank"><?php echo $text_returnpolicy;?>
											<i class="fa fa-angle-right pts-r"></i>
										</a>
									</div>
								</div>							
							</div>
							<div class="seller-return pts-text-center">
								<div class=" contact_seller_link">
									<a href="<?php echo $seller_contact;?>" class="contact_seller" target="_blank"><img src="image/catalog/contact_seller.png" width="20px" height="20px" class="ptsc-store-sellcontactc"> <?php echo $text_sellercontact;?></a>
								</div>
							</div>
							
						</div>
						<div class="pts-col-sm-9">
							<div class="pts-col-md-12 pts-form-group">
								<?php echo $store_description;?>
							</div>
							<?php if($seller_products) { ?>
								<div class="pts-row">
									<div class="pts-col-md-2 pts-col-sm-6 hidden-xs">
										
									</div>
									<div class="pts-col-md-3 pts-col-sm-6">
										
									</div>
									<div class="pts-col-md-4 pts-col-xs-6 pts-pull-right">
										<div class="pts-form-group pts-input-group pts-input-group-sm">
											<label class="pts-input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
											<select id="input-sort" class="pts-form-control" onchange="location = this.value;">
												<?php foreach ($sorts as $sorts) { ?>
													<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
														<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
														<?php } else { ?>
														<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
													<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="pts-col-md-3 pts-col-xs-6 pts-pull-right ptsc-store-padd">
										<div class="pts-form-group pts-input-group pts-input-group-sm">
											<label class="pts-input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
											<select id="input-limit" class="pts-form-control" onchange="location = this.value;">
												<?php foreach ($limits as $limits) { ?>
													<?php if ($limits['value'] == $limit) { ?>
														<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
														<?php } else { ?>
														<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
													<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
								<div class="pts-row">
									
									<?= $seller_products; ?>

									
									
								</div>
								<div class="pts-row">
									<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
									<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
								</div>
								<?php } else { ?>
								<div class="pts-text-center"><h3><?php echo $text_no_results; ?></h3></div>
							<?php } ?>
						</div>
					</div>
				</div>
                <?php } ?>
			</div>
			<?php echo $content_bottom; ?>
		<?php echo $column_right; ?></div>
	</div>
	
<?php if ($purpletree_multivendor_allow_live_chat) { ?>
	<?php if ($store_live_chat_enable) { ?>
		<?php if ($store_live_chat_code != '') { ?>
		<?php  echo $store_live_chat_code; ?>
		<?php } } } ?>
		<script type="text/javascript">
			if (localStorage.getItem('display') == 'list') {
				$('#list-view').trigger('click');
				} else {
				$('#grid-view').trigger('click');
			}
		</script>
		<script>
	$(window).load(function() {
			$('aside#column-right').addClass('pts-col-sm-3 col-sm-3');
		});
</script>
<link href="catalog/view/javascript/purpletree/css/stylesheet/commonstylesheet.css" type="text/css" rel="stylesheet" />
		<?php echo $footer; ?>								