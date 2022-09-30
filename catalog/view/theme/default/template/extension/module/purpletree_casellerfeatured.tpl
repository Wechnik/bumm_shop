<h3 class="pts-h3"><?php echo $heading_title; ?></h3>
<div class="row">
	<div id="carousel_seller_featured" class="owl-carousel">
		<?php foreach ($products as $product) { ?>
			<div class="item text-center">
				<div class="pts-product-layout ptsc-cfeatured-modumar">
					<div class="pts-product-thumb transition">
						<div class="image"><a data-hpm-href="1" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
						<div class="pts-caption ptsc-cfeatured-modumihei">
							<h4><a data-hpm-href="1" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                            <?php echo !empty($product['hpm_block']) ? $product['hpm_block'] : ''; ?>
							<p><?php echo $product['description']; ?></p>
							<?php if ($product['rating']) { ?>
								<div class="rating">
									<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
										<?php } ?>
									<?php } ?>
								</div>
							<?php } ?>
							<?php if ($multivendor_status) { ?>
								<?php if ($show_seller_name) { ?>
								<?php if ($product['seller_name']) { ?>
									<p><a href="<?php echo $product['seller_link']; ?>"><?php echo $text_seller_label; ?>&nbsp<?php echo $product['seller_name']; ?></a></p>
								 <?php } ?>
								<?php } ?>
								<?php if ($show_seller_address) { ?>
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
									<?php if ($product['tax']) { ?>
										<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
									<?php } ?>
								</p>
							<?php } ?>
						</div>
						<div class="pts-button-group">
							<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
							<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
							<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
						</div>
					</div>
				</div>
			</div>
		<?php } ?>
	</div>
</div>
<script type="text/javascript"><!--
	$(document).ready(function(){
		$("#carousel_seller_featured").owlCarousel({
			items:4,
			margin:10,
			autoPlay: 3000,
			navigation: true,
			navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
			pagination: true,
			responsiveClass:true,
			responsive:{
				0:{
					items:1,
				},
				768:{
					items:3,
					margin:20,
				},
				1024:{
					items:4,
					margin:20,
				}
			},
		});
	});
--></script>