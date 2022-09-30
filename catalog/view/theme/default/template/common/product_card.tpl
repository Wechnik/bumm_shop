<?php foreach ($products as $product) { ?>
	<div class="product-layout <?php if($page == 'seller') { ?> col-md-4 product-seller-page<?php } ?>  product-grid ">
		<div class="product-thumb">
			<div class="image">
				<?php if ($product['rating']) { ?>
					<div class="rating">
						<?php for ($i = 5; $i >= 1; $i--) { ?>
							<?php if ($product['rating'] < $i) { ?>
								<i class="fa fa-star"></i>
							<?php } else { ?>
								<i class="fa fa-star active"></i>
							<?php } ?>
						<?php } ?>
					</div>
				<?php } ?>
				<a data-hpm-href="1" href="<?php echo $product['href']; ?>">
					<img src="<?php echo $product['thumb']; ?>"
					     alt="<?php echo $product['name']; ?>"
					     title="<?php echo $product['name']; ?>" class="img-responsive"/>
				</a>
			</div>
			<div class="bottom flex fl-wrap fl-ai-center">
				<div class="caption">
					<a data-hpm-href="1"
					   href="<?php echo $product['href']; ?>"<?php if ($product['special']) { ?> class="text-special"<?php } ?>>
						<?php echo $product['name']; ?>
					</a>
				</div>
				<div class="price-detached">
					<?php if ($product['price']) { ?>
						<span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?>
										<span class="price-new">
		                                            <b>
		                                                <?php echo $product['special']; ?>
		                                            </b>
		                                        </span>
										<span class="price-old">
		                                    <?php echo $product['price']; ?>
		                                </span>
									<?php } ?>
                                </span>
					<?php } ?>
					<?php if ($product['tax']) { ?>
						<br/>
						<span class="price-tax text-muted">
                            <?php echo $text_tax; ?><?php echo $product['tax']; ?>
                        </span>
					<?php } ?>
				</div>
				<div class="btn-group btn-group-sm">
					<button type="button" class="btn btn-default wishlist-button" data-placement="bottom" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></button>
				</div>
			</div>
		</div>
	</div>

<?php } ?>