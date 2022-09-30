<?php echo $header; ?>
<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?> smart-filter-homepage">
            <?php echo $content_top; ?>
            <?php if ($universal_products) { ?>
                <div class="h2 text-center">Универсальные товары</div>
                <div class="row">
                    <?php if ($moneymaker2_product_related_carousel) { ?>
                    <div class="owl-carousel owl-moneymaker2 owl-moneymaker2-products owl-moneymaker2-products-related">
                        <?php } ?>
                        <?php foreach ($universal_products as $key => $product) { ?>


                            <div class="product-layout <?php if ($moneymaker2_catalog_default_view) { ?>product-list<?php } else { ?>product-grid<?php } ?>">
                                <div class="product-thumb">
                                    <div class="image">
                                        <?php if ($product['stickers']) { ?>
                                            <div class="stickers">
                                                <?php foreach ($product['stickers'] as $sticker) { ?>
                                                    <div class="sticker text-left sticker-<?php echo $sticker['type']; ?>">
                    <span class="fa-stack fa-<?php echo $moneymaker2_stickers_size_catalog; ?>" <?php if (!$moneymaker2_stickers_mode) { ?>data-toggle="tooltip" data-placement="right" title="<?php echo strip_tags($sticker['caption']); ?>"<?php } ?>>
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-<?php echo $sticker['icon']; ?> fa-stack-1x fa-inverse"></i>
                    </span><?php if ($moneymaker2_stickers_mode) { ?><div class="tooltip right in"><div class="tooltip-arrow"></div><div class="tooltip-inner"><?php echo $sticker['caption']; ?></div></div><?php } ?>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
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
                                        <a data-hpm-href="1" data-hpm-href="1" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                                    </div>
                                    <div>
                                        <div class="caption">
                                            <a data-hpm-href="1" data-hpm-href="1" href="<?php echo $product['href']; ?>"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a>
                                        </div>
                                        <div class="price-detached"><small><?php if ($product['price']) { ?><span class="price text-muted"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>
			                                     
				                                    
<?php } else { ?><span class="price-new"><b><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?></b></span> <span class="price-old"><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?></span><?php } ?></span><?php } ?><?php if ($product['tax']) { ?><br /><span class="price-tax text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span><?php } ?></small></div>

                                        <div class="whitespace-block"></div>
	                                    <div class="btn-group btn-group-sm">
		                                    <button type="button" class="btn btn-default wishlist-button" data-placement="bottom" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></button>
	                                    </div>
                                        <?php if (!$moneymaker2_common_price_detached&&$product['price']&&$product['tax']) { ?><div class="price-tax"><small class="text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></small></div><?php } ?>
                                        <div class="additional"><?php echo $product['stock']; ?> <?php echo $product['code']; ?></div>
                                        <div class="description"><?php echo $product['description']; ?></div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($moneymaker2_modules_promo_enabled&&$moneymaker2_modules_promos) { ?>
                                <?php foreach ($moneymaker2_modules_promos as $moneymaker2_modules_promo) { ?>
                                    <?php if ($moneymaker2_modules_promo['sort_order']==$product['sort_order']) { ?>
                                        <div class="product-layout <?php if ($moneymaker2_catalog_default_view) { ?>product-list<?php } else { ?>product-grid<?php } ?>">
                                            <div class="product-thumb promo promo-<?php echo $moneymaker2_modules_promo_style; ?>">
                                                <div class="image">
                                                    <?php if ($moneymaker2_modules_stickers_promo_enabled) { ?>
                                                        <div class="stickers">
                                                            <div class="sticker text-left">
                      <span class="fa-stack fa-<?php echo $moneymaker2_stickers_size_catalog; ?>" <?php if (!$moneymaker2_stickers_mode) { ?>data-toggle="tooltip" data-placement="right" title="<?php echo strip_tags($moneymaker2_modules_stickers_promo_caption); ?>"<?php } ?>>
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-<?php echo $moneymaker2_modules_stickers_promo_icon; ?> fa-stack-1x fa-inverse"></i>
                      </span><?php if ($moneymaker2_stickers_mode) { ?><div class="tooltip right in"><div class="tooltip-arrow"></div><div class="tooltip-inner"><?php echo $moneymaker2_modules_stickers_promo_caption; ?></div></div><?php } ?>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                    <img src="<?php echo $moneymaker2_modules_promo['image']; ?>" alt="<?php echo $moneymaker2_modules_promo['text']; ?>" title="<?php echo $moneymaker2_modules_promo['text']; ?>" class="img-responsive" />
                                                </div>
                                                <div>
                                                    <div class="caption text-<?php echo $moneymaker2_modules_promo_text_style; ?>">
                                                        <span><?php echo $moneymaker2_modules_promo['text']; ?></span>
                                                    </div>
                                                    <?php if ($moneymaker2_common_price_detached) { ?>
                                                        <div class="price-detached"><small><span class="text-muted"><?php echo $moneymaker2_modules_stickers_promo_caption; ?></span></small></div>
                                                    <?php } ?>
                                                    <?php if ($moneymaker2_modules_promo['link']) { ?>
                                                        <button type="button" class="btn btn-sm btn-<?php echo $moneymaker2_modules_promo_style; ?>" title="<?php echo $moneymaker2_modules_promo['title']; ?>" data-toggle="modal" data-target="#infoModal" data-info-title="<?php echo $moneymaker2_modules_promo['info_title']; ?>" data-info-description="<?php echo $moneymaker2_modules_promo['link']; ?>"><i class="fa fa-fw fa-external-link"></i> <?php echo $moneymaker2_modules_promo['title']; ?></button>
                                                    <?php } ?>
                                                    <div class="additional"></div>
                                                    <div class="description"><?php echo $moneymaker2_modules_promo['description']; ?></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>



                        <?php if ($moneymaker2_product_related_carousel) { ?>
                    </div>
                <?php } ?>
                </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
