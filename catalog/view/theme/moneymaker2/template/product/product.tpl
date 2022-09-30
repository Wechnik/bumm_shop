<?php $LastModified_unix = strtotime($date_modified);
$LastModified = gmdate("D, d M Y H:i:s \G\M\T", $LastModified_unix);
$IfModifiedSince = false; if (isset($_ENV['HTTP_IF_MODIFIED_SINCE']))
$IfModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']))
$IfModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
if ($IfModifiedSince && $IfModifiedSince >= $LastModified_unix)
{
header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
exit;} header('Last-Modified: '. $LastModified); ?>
<?php echo $header; ?>
<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/hystmodal.min.css">
<script src="catalog/view/javascript/hystmodal.min.js"></script>
<div class="container product-page">
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>" itemscope itemtype="https://schema.org/Product">
			<ul class="breadcrumb text-center hidden-xs hidden-sm" itemscope itemtype="https://schema.org/BreadcrumbList">
				<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
				<span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
				</a><meta itemprop="position" content="<?php echo $i+1; ?>" />
				</li>
				<?php } ?>
			</ul>
			<?php echo $content_top; ?>
			<div class="row">
				<?php if ($column_left || $column_right) { ?>
				<?php $class = 'col-sm-6'; ?>
				<?php } else { ?>
				<?php $class = 'col-sm-8'; ?>
				<?php } ?>
				<div class="col-xs-12">
					<div class="row main-product-wrapper">
						<div class="h2 content-title-bordered text-center content-title">
							<h1 class="h2" itemprop="name"><?php if ($moneymaker2_product_metatitles_enabled) { ?><?php echo $meta_title; ?><?php } else { ?><?php echo $heading_title; ?><?php } ?></h1><?php if ($moneymaker2_code) { ?> <div class="h2"><small>(<?php echo $moneymaker2_code; ?>)</small></div><?php } ?>
							<meta itemprop="model" content="<?php echo $model; ?>" />
							<meta itemprop="manufacturer" content="<?php echo $manufacturer; ?>" />
						</div>
						<div class="col-sm-12 col-md-9 product-image-slider">
							<div class="row">
								<div class="col-md-3 hidden-sm hidden-xs text-center">
									<?php if ($images) { ?>
									<div class="slider-nav">
										<?php foreach ($images as $image) { ?>
											<div>
												<div>
													<img class="img-circle" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
												</div>
											</div>
										<?php } ?>
									</div>
									<?php } ?>
								</div>
								<div class="col-sm-12 col-md-9 text-center">
									<?php if ($thumb) { ?>
									<div class="thumbnails image-thumb">
										<?php if ($stickers) { ?>
										<div class="stickers">
											<?php foreach ($stickers as $sticker) { ?>
											<div class="sticker text-left sticker-<?php echo $sticker['type']; ?>">
												<span class="fa-stack fa-<?php echo $moneymaker2_stickers_size_product; ?>" <?php if (!$moneymaker2_stickers_mode) { ?>data-toggle="tooltip" data-placement="right" title="<?php echo strip_tags($sticker['caption']); ?>"<?php } ?>>
												<i class="fa fa-circle fa-stack-2x"></i>
												<i class="fa fa-<?php echo $sticker['icon']; ?> fa-stack-1x fa-inverse"></i>
												</span><?php if ($moneymaker2_stickers_mode) { ?><div class="tooltip right in"><div class="tooltip-arrow"></div><div class="tooltip-inner"><?php echo $sticker['caption']; ?></div></div><?php } ?>
											</div>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($rating) { ?>
										<div class="rating" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
											<meta itemprop="reviewCount" content="<?php echo preg_replace('/[^0-9]/', '', $tab_review); ?>" />
											<meta itemprop="ratingValue" content="<?php echo $rating; ?>" />
											<?php for ($i = 5; $i >= 1; $i--) { ?>
											<?php if ($rating < $i) { ?>
											<i class="fa fa-lg fa-star"></i>
											<?php } else { ?>
											<i class="fa fa-lg fa-star active"></i>
											<?php } ?>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($video_in_product || $video_in_product1 || $video_in_product2) { ?>
										<div class="hidden-md hidden-lg hidden-md hidden-sm video-row-xs flex fl-m5">
											<?php if ($video_in_product) { ?>
											<div class="thumbnail-video">
												<a href="<?php echo $video_in_product; ?>"><i class="fa fa-fw fa-play"></i></a>
											</div>
											<?php } ?>
											<?php if ($video_in_product1) { ?>
											<div class="thumbnail-video">
												<a href="<?php echo $video_in_product1; ?>"><i class="fa fa-fw fa-play"></i></a>
											</div>
											<?php } ?>
											<?php if ($video_in_product2) { ?>
											<div class="thumbnail-video">
												<a href="<?php echo $video_in_product2; ?>"><i class="fa fa-fw fa-play"></i></a>
											</div>
											<?php } ?>
										</div>
										<?php } ?>
										<div class="slider-for">
											<?php foreach ($images as $image) { ?>
											<div class="thumbnail" ><img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" itemprop="image" /></div>
											<?php } ?>
										</div>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
					<div class="col-sm-12 col-md-3 right-product">
						<div class="product-points product-points-model flex fl-ai-center">
							<span class="title"><?php echo $model; ?></span>
							<?php if ($manufacturer && $moneymaker2_manufacturer_image) { ?>
							  <a class="manufacturer-link" href="<?php echo $manufacturers; ?>" title="<?php echo $moneymaker2_product_points_manufacturer_caption; ?> - <?php echo $manufacturer; ?>"><img class="img-responsive" src="<?php echo $moneymaker2_manufacturer_image; ?>" title="<?php echo $manufacturer; ?>" alt="<?php echo $manufacturer; ?>"></a>
							<?php } ?>
						</div>
						<div class="product-points stock-status alternative-availability">
							<?php if($product_options_text) { ?>
								<?php echo $product_options_text; ?>
							<?php } else { ?>
								<?php if (($moneymaker2_product_points_stock && $availability_moscow == 0 && $availability_novosibirsk == 0)) { ?>
									<div class="stock-<?php echo $moneymaker2_product_points_stock_id; ?> flex fl-ai-center">
								<span class="fa-stack fa-md pull-left"><i
											class="fa fa-<?php echo $moneymaker2_product_points_stock_icon; ?> fa-stack-1x"></i></span>
										<span class="title"><?php echo $text_stock; ?></span><span
												class="value stock-status-value"><?php echo $stock; ?></span>
										<div class="text-muted"><?php echo $moneymaker2_product_points_stock_caption; ?></div>
									</div>
								<?php } elseif ($availability_moscow == 1 || $availability_novosibirsk == 1) { ?>
									<div class="stock-7 flex fl-ai-center">
										<?php if ($availability_moscow == 1) { ?>
											<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>
											<span class="title"><span class="stock-availability"></span><span
														class="value stock-status-value"> Есть в наличии в Москве</span></span>
										<?php } ?>
										<?php if ($availability_novosibirsk == 1) { ?>
											<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>
											<span class="title"><span class="stock-availability"></span><span
														class="value stock-status-value"> Есть в наличии в Новосибирске</span></span>
										<?php } ?>
									</div>
								<?php } elseif ($opt_availability_moscow == 1 || $opt_availability_novosibirsk == 1) { ?>
									<div class="stock-7 flex fl-ai-center">
										<?php if ($opt_availability_moscow == 1) { ?>
											<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>
											<span class="title"><span class="stock-availability"></span><span
														class="value stock-status-value"> Есть в наличии в Москве</span></span>
										<?php } ?>
										<?php if ($opt_availability_novosibirsk == 1) { ?>
											<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>
											<span class="title"><span class="stock-availability"></span><span
														class="value stock-status-value"> Есть в наличии в Новосибирске</span></span>
										<?php } ?>
									</div>
								<?php } ?>
								<?php if ($moneymaker2_product_points) { ?>
									<?php foreach ($moneymaker2_product_points as $key => $value) { ?>
										<div>
											<span class="fa-stack fa-md pull-left"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-<?php echo $value['icon']; ?> fa-stack-1x fa-inverse"></i></span>
											<span class="title"><?php echo $value['name']; ?></span>
											<div class="value"><?php echo $value['text']; ?></div>
										</div>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</div>
					  <?php if ($moneymaker2_modules_timer&&$moneymaker2_modules_timer_date) { ?>
					  <div class="product-timer">
						<span class="fa-stack fa-lg pull-left"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-clock-o fa-stack-1x fa-inverse"></i></span>
						<h4 class="text-special"><?php echo $text_timer_discount; ?><?php if ($moneymaker2_modules_timer_discount) { ?> <?php echo $moneymaker2_modules_timer_discount; ?><?php } ?>! <span id="timer-countdown"></span></h4>
						<div class="text-left"><p><?php echo $text_timer_limit; ?></p></div>
					  </div>
					  <?php } ?>
                        <?php echo !empty($hpmodel['html']) ? $hpmodel['html'] : '';?>
					  <div id="product" itemprop="offers" itemscope itemtype="https://schema.org/Offer" class="flex fl-ai-center fl-wrap">
						<meta itemprop="priceCurrency" content="<?php echo $moneymaker2_currency; ?>" />
						<meta itemprop="price" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($special ? $special : $price)), '.'); ?>" />
						<link itemprop = "availability" href = "https://schema.org/<?php echo ($quantity>0 ? "InStock" : "OutOfStock") ?>" />
						<?php if ($reward) { ?>
						<div class="text-left"><small><?php echo $text_reward; ?> <span class="text-muted"><?php echo $reward; ?></span></small></div>
						<hr>
						<?php } ?>
						<?php if ($price) { ?>
						  <?php if ($tax) { ?>
						  <div class="text-left"><small><?php echo $text_tax; ?> <span class="text-muted"><?php echo $tax; ?></span></small></div>
						  <hr>
						  <?php } ?>
						  <?php if ($points) { ?>
						  <div class="text-left"><small><?php echo $text_points; ?> <span class="text-muted"><?php echo $points; ?></span></small></div>
						  <hr>
						  <?php } ?>
						  <?php if ($discounts) { ?>
							<?php foreach ($discounts as $discount) { ?>
									<?php
									$discount_base_price = '';

									if (isset($discount['base_price']) and $discount['base_price'] != '') {
										$discount_base_price = ' ('.$discount['base_price'].')';
									};
									?>
							  <div class="text-left"><small><?php echo $discount['quantity']; ?><?php echo $text_discount; ?> <span class="text-muted"><?php echo $discount['price'].$discount_base_price; ?></span></small></div>
							<?php } ?>
						  <hr>
						  <?php } ?>
						<?php } ?>
						<?php if ($options) { ?>
						<div class="image-check-option">
							<?php foreach ($options as $option) { ?>
							<?php foreach ($option['product_option_value'] as $option_value_k => $option_value) { ?>
								<?php $stock_moscow = 0; ?>
								<?php $stock_novosibirsk = 0; ?>
								<?php if (($moneymaker2_product_points_stock && $availability_moscow == 0 && $availability_novosibirsk == 0) ||
									($option_value['availability_moscow'] == 0 && $option_value['availability_novosibirsk'] == 0)) { ?>
									<?php $tmp_stock_status = $stock;  ?>
								<?php } elseif ($option_value['availability_moscow'] == 1 || $option_value['availability_novosibirsk'] == 1) { ?>
									<?php if($option_value['availability_moscow'] == 1) { ?>
										<?php $tmp_stock_status = ' Есть в наличии в Москве';  ?>
										<?php $stock_moscow = 1; ?>
									<?php } ?>
									<?php if($option_value['availability_novosibirsk'] == 1) { ?>
										<?php $tmp_stock_status = ' Есть в наличии в Новосибирске';  ?>
										<?php $stock_novosibirsk = 1; ?>
									<?php } ?>
								<?php } elseif($availability_moscow == 1 || $availability_novosibirsk == 1) { ?>
									<?php if($availability_moscow == 1) { ?>
										<?php $tmp_stock_status = ' Есть в наличии в Москве';  ?>
										<?php $stock_moscow = 1; ?>
									<?php } ?>
									<?php if($availability_novosibirsk == 1) { ?>
										<?php $tmp_stock_status = ' Есть в наличии в Новосибирске';  ?>
										<?php $stock_novosibirsk = 1; ?>
									<?php } ?>
								<?php } ?>

								<?php if($option['type'] == 'picture') { ?>
									<a href="javascript:void(0);" class="option-text" style="margin: 15px 3px;"
									   data-toggle="tooltip" title="<?php echo $option_value['name']; ?>"
									   data-opt-value="<?php echo $option_value['product_option_value_id']; ?>"
									   data-opt-value-id="<?php echo $option_value['option_value_id']; ?>"
									   data-option-id="<?php echo $option['option_id']; ?>"
									   data-opt-name="<?php echo $option_value['name']; ?>"
									   data-opt-price="<?php echo $option_value['option_price']; ?>"
									   data-opt-base-price="<?php echo $option_value['opt_base_price']; ?>"
									   data-opt-price-prefix="<?php echo $option_value['price_prefix']; ?>"
									   data-stock-status-moscow="<?php echo $stock_moscow;  ?>"
									   data-stock-status-novosibirsk="<?php echo $stock_novosibirsk;  ?>"
									   data-product-option-id="<?php echo $option['product_option_id']; ?>">
										<div class="text-center">
											<img src="<?php echo $option_value['image']; ?>">
											<?php if(!empty($option_value['product_option_name'])) { ?>
												<span><?php echo $option_value['product_option_name']; ?></span>
											<?php } else { ?>
												<span><?php echo $option_value['name']; ?></span>
											<?php } ?>
										</div>
									</a>
								<?php } else if($option['type'] == 'text') { ?>
									<a href="javascript:void(0);" class="option-text"
									  data-opt-value="<?php echo $option_value['product_option_value_id']; ?>"
									  data-opt-value-id="<?php echo $option_value['option_value_id']; ?>"
									  data-option-id="<?php echo $option['option_id']; ?>"
									  data-opt-name="<?php echo $option_value['name']; ?>"
									  data-opt-price="<?php echo $option_value['option_price']; ?>"
									  data-opt-base-price="<?php echo $option_value['opt_base_price']; ?>"
									  data-opt-price-prefix="<?php echo $option_value['price_prefix']; ?>"
									  data-stock-status-moscow="<?php echo $stock_moscow;  ?>"
									  data-stock-status-novosibirsk="<?php echo $stock_novosibirsk;  ?>"
									  data-product-option-id="<?php echo $option['product_option_id']; ?>">
										<div class="text-center">
											<?php if(!empty($option_value['product_option_name'])) { ?>
												<span><?php echo $option_value['product_option_name']; ?></span>
											<?php } else { ?>
												<span><?php echo $option_value['name']; ?></span>
											<?php } ?>
										</div>
									</a>
									<?php if($option_value_k % 2 == 0 || $option_value_k == 0){ ?>
									<div style="width: 2%; display: inline-block;"></div>
									<?php } ?>
								<?php } ?>
							<?php } ?>
							<input class="selected-option" type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
							<?php } ?>
						</div>
						<hr>
						<?php } ?>
						<?php if ($recurrings) { ?>
						<div><small><?php echo $text_payment_recurring; ?></small></div>
						<div class="form-group required">
						  <select name="recurring_id" class="form-control">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($recurrings as $recurring) { ?>
							<option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
							<?php } ?>
						  </select>
						  <div class="help-block" id="recurring-description"></div>
						</div>
						<hr>
						<?php } ?>
						<?php if ($minimum > 1) { ?>
						<div><small><?php echo $text_minimum; ?></small></div>
						<?php } ?>
						<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
						<?php if ($moneymaker2_common_price_detached) { ?>
						<?php if ($price) { ?>
						<div class="original-product-price" data-original-product-price="<?php echo $product_base_price; ?>"></div>
                        <div class="price-detached">
                            <?php if (!$special) { ?>
							<span class="price">
                                <?php echo $price;  ?>
                                <?php echo $prod_max_price && $price != $prod_max_price ? ' - ' . $prod_max_price : '';  ?>
                                <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?>
                                    (<?php echo $base_price; ?>)
								<?php } ?>
							</span>
                            <?php } else { ?>
                                <span class="price-new"><b><?php echo $special; ?></b></span>
                                <span class="price-old">
                                <?php echo $price;  ?> - <?php echo $prod_max_price;  ?>
                                <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?>
                                    (<?php echo $base_price; ?>)
                                <?php } ?>
                                </span>
                            <?php } ?>
                        </div>
						<?php } ?>
						<?php } ?>
						<div class="btn-group">
						  <?php if (!$moneymaker2_common_buy_hide) { ?>
						  <button type="button" data-info-title="<?php echo $button_cart; ?>" id="button-cart" class="<?php echo $addtocart_class; ?>" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $addtocart_tooltip; ?>"><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached) { ?><?php if ($price&&$special) { ?><?php echo $special; ?><?php } else if ($price) { ?>                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?><?php } ?><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
						  <?php } ?>
						</div>
						<?php if ($moneymaker2_modules_quickorder_enabled) { ?>
						<div class="<?php echo $quickorder_class; ?>" <?php if (!$product_sold) { ?>data-toggle="modal" data-target="#orderModal" data-order-mode="product" data-order-product-id="<?php echo $product_id; ?>" data-order-title="<?php echo $heading_title; ?>" data-order-img-src="<?php echo $quickorder_thumb; ?>" data-order-price="<?php if ($price&&$special) { ?><?php echo strip_tags($special); ?><?php } else if ($price) { ?><?php echo strip_tags($price); ?><?php } ?>"<?php } ?>><span <?php if (strip_tags($quickorder_tooltip)) { ?>data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $quickorder_tooltip; ?>"<?php } ?>><i class="fa fa-fw fa-send"></i> <?php echo $moneymaker2_modules_quickorder_button_title; ?></span></div>
						<?php } ?>
						</div>
						<?php if ($partner) { ?>
						<div class="btn-group">
							<br><a href="#" type="button" class="<?php echo $addtocart_class; ?>" data-hystmodal="#myModal">Где можно установить</a>
						</div>
						<?php } ?>
						<?php if($product_stickers) { ?>
						<div class="cust-product-stickers">
							<?php foreach ($product_stickers as $product_sticker) { ?>
							<div class="prod-stick-container flex fl-ai-center">
								<?php if($image_variant == 1) { ?>
									<div class="product-sticker-image">
										<img src="<?php echo $product_sticker['image']?>">
									</div>
								<?php } ?>
								<div class="sticker-description"><?php echo $product_sticker['description']?></div>
								<?php if($image_variant == 0) { ?>
								<div class="col-md-3">
									<img src="<?php echo $product_sticker['image']?>">
								</div>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
						<?php } ?>
						<?php if ($video_in_product || $video_in_product1 || $video_in_product2) { ?>
						<div class="hidden-xs video-row flex fl-m5">
							<?php if ($video_in_product) { ?>
							<div class="thumbnail-video">
								<a href="<?php echo $video_in_product; ?>"><img src="image/video_icon.svg"/></a>
							</div>
							<?php } ?>
							<?php if ($video_in_product1) { ?>
							<div class="thumbnail-video">
								<a href="<?php echo $video_in_product1; ?>"><img src="image/video_icon.svg"/></a>
							</div>
							<?php } ?>
							<?php if ($video_in_product2) { ?>
							<div class="thumbnail-video">
								<a href="<?php echo $video_in_product2; ?>"><img src="image/video_icon.svg"/></a>
							</div>
							<?php } ?>
						</div>
						<?php } ?>
					</div>
				  </div>
				  <?php if ($description=="<p><br></p>") $description=""; ?>
				  <?php if (!$moneymaker2_product_tabs_hide) { ?>
					<ul class="nav nav-tabs">
						<?php if ($product_tabs_1) { ?>
						<?php foreach($product_tabs_1 as $tab_key => $product_tab_1) { ?>
						<li <?php if ($tab_key == 0) { ?>class="active"<?php } ?>>
							<a href="#tab-product-tab<?php echo $product_tab_1['tab_id'];?>" data-toggle="tab"><?php echo $product_tab_1['name']; ?></a>
						</li>
						<?php } ?>
						<?php } ?>
						<?php if ($description) { ?>
						<li <?php if (!$product_tabs_1) { ?>class="active"<?php } ?>>
							<a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a>
						</li>
						<?php } ?>
						<?php if ($product_tabs_2) { ?>
						<?php foreach($product_tabs_2 as $tab_key => $product_tab_2) { ?>
						<li <?php if (!$description && !$product_tabs_1 && $tab_key == 0) { ?>class="active"<?php } ?>>
							<a href="#tab-product-tab<?php echo $product_tab_2['tab_id'];?>" data-toggle="tab"><?php echo $product_tab_2['name']; ?></a>
						</li>
						<?php } ?>
						<?php } ?>
						<?php if ($product_filters) { ?>
						<li <?php if (!$description && !$product_tabs_1 && !$product_tabs_2) { ?>class="active"<?php } ?>>
							<a href="#tab-smartfilter" data-toggle="tab">Автомобили</a>
						</li>
						<?php } ?>
						<?php if ($attribute_groups||$weight||$length||$width||$height||$moneymaker2_attributes_code) { ?>
						<li <?php if (!$description && !$product_filters) { ?> class="active"<?php } ?>>
							<a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a>
						</li>
						<?php } ?>
						<?php if ($product_tabs_3) { ?>
						<?php foreach($product_tabs_3 as $tab_key => $product_tab_3) { ?>
						<li <?php if (!$description && !$product_tabs_1 && !$product_tabs_2 && !$attribute_groups && !$product_filters && $tab_key == 0) { ?>class="active"<?php } ?>>
							<a href="#tab-product-tab<?php echo $product_tab_3['tab_id'];?>" data-toggle="tab"><?php echo $product_tab_3['name']; ?></a>
						</li>
						<?php } ?>
						<?php } ?>
						<?php if ($review_status) { ?>
						<li>
							<a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a>
						</li>
						<?php } ?>
						<?php if ($moneymaker2_product_tabs) { ?>
						<?php foreach ($moneymaker2_product_tabs as $key => $value) { ?>
						<?php if ($value['link']) { ?>
						<li>
							<a href="#tab-additional-<?php echo $key; ?>" data-toggle="tab"><?php echo $value['name']; ?></a>
						</li>
						<?php } ?>
						<?php } ?>
						<?php } ?>
						<?php if ($product_tabs_5) { ?>
						<?php foreach($product_tabs_5 as $tab_key => $product_tab_5) { ?>
						<li <?php if (!$description && !$product_tabs_1 && !$product_tabs_2 && !$product_tabs_3 && !$attribute_groups && !$product_filters && !$review_status && !$moneymaker2_product_tabs && $tab_key == 0) { ?> class="active"<?php } ?>>
						<a href="#tab-product-tab<?php echo $product_tab_5['tab_id'];?>" data-toggle="tab"><?php echo $product_tab_5['name']; ?></a></li>
						<?php } ?>
						<?php } ?>
						<?php if($additional_product_tab) { ?>
						<li><a href="#additional-product-tab" data-toggle="tab" class="additional-product-tab"><?php echo $additional_product_tab_name; ?></a></li>
						<?php } ?>
					</ul>
					<?php } ?>
				  <div class="tab-content">
					  <?php if ($product_tabs_1) { ?>
						  <?php foreach($product_tabs_1 as $tab_key => $product_tab_1) { ?>
							  <div class="tab-pane fade in <?php if ($tab_key == 0) { ?> active<?php } ?>" id="tab-product-tab<?php echo $product_tab_1['tab_id'];?>">
								  <?php echo $product_tab_1['text']; ?>
							  </div>
						  <?php } ?>
					  <?php } ?>

					<?php if ($description) { ?>
					<div class="tab-pane fade in <?php if (!$product_tabs_1) { ?> active<?php } ?>" id="tab-description">
					  <?php if ($moneymaker2_product_tabs_headers) { ?>
						<h3 class="text-center"><?php echo $moneymaker2_product_description_header; ?></h3>
					  <?php } ?>
					  <div itemprop="description"><?php echo $description; ?></div>
						<?php if ($moneymaker2_product_tabs_description_buttons) { ?>
						<div class="text-center">
						  <?php if ($moneymaker2_common_price_detached) { ?>
						  <?php if ($price) { ?><div class="price-detached"><span class="price"><?php if (!$special) { ?>                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?><?php } else { ?><span class="price-new"><b>                <?php echo $special;  ?>

											  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_special) and !empty($base_special)) { ?>
												  <nobr>(<?php echo $base_special; ?>)</nobr>
											  <?php } ?></b></span> <span class="price-old">                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?></span><?php } ?></span></div><?php } ?>
						  <?php } ?>
						  <p class="btn-group">
							<?php if (!$moneymaker2_common_buy_hide) { ?>
							<button type="button" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $addtocart_tooltip; ?>" class="<?php echo $addtocart_class; ?>" <?php if (!$product_sold) { ?>onclick="cart.add('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');"<?php } ?>><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached) { ?><?php if ($price&&$special) { ?>                <?php echo $special;  ?>

									<?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_special) and !empty($base_special)) { ?>
										<nobr>(<?php echo $base_special; ?>)</nobr>
									<?php } ?><?php } else if ($price) { ?>                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?><?php } ?><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
							<?php } ?>
							  <?php if ($moneymaker2_modules_quickorder_enabled) { ?>
								  <button type="button" class="btn btn-default<?php if ($product_sold) { ?> disabled<?php } ?>" <?php if (!$product_sold) { ?>data-toggle="modal" data-target="#orderModal" data-order-mode="product" data-order-product-id="<?php echo $product_id; ?>" data-order-title="<?php echo $heading_title; ?>" data-order-img-src="<?php echo $quickorder_thumb; ?>" data-order-price="<?php if ($price&&$special) { ?><?php echo strip_tags($special); ?><?php } else if ($price) { ?><?php echo strip_tags($price); ?><?php } ?>"<?php } ?>><span <?php if (strip_tags($quickorder_tooltip)) { ?>data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $quickorder_tooltip; ?>"<?php } ?>><i class="fa fa-fw fa-send"></i></span></button>
							  <?php } ?>
							<?php if (!$moneymaker2_common_wishlist_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_wishlist_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-fw fa-heart"></i><?php if ($moneymaker2_common_wishlist_caption) { ?> <?php echo $button_wishlist; ?><?php } ?></button><?php } ?>
							<?php if (!$moneymaker2_common_compare_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_compare_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-fw fa-area-chart"></i><?php if ($moneymaker2_common_compare_caption) { ?> <?php echo $button_compare; ?><?php } ?></button><?php } ?>
						  </p>
						</div>
						<?php } ?>
						<?php if ($tags) { ?>
						<p><?php echo $text_tags; ?>
						  <?php for ($i = 0; $i < count($tags); $i++) { ?>
						  <?php if ($i < (count($tags) - 1)) { ?>
						  <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
						  <?php } else { ?>
						  <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
						  <?php } ?>
						  <?php } ?>
						</p>
						<?php } ?>
					</div>
					<?php } ?>


					  <?php if ($product_tabs_2) { ?>
						  <?php foreach($product_tabs_2 as $tab_key => $product_tab_2) { ?>
							  <div class="tab-pane fade in <?php if (!$description && !$product_tabs_1&& $tab_key == 0) { ?> active<?php } ?>" id="tab-product-tab<?php echo $product_tab_2['tab_id'];?>">
								  <?php echo $product_tab_2['text']; ?>
							  </div>
						  <?php } ?>
					  <?php } ?>



					<?php if ($product_filters) { ?>
						<div class="tab-pane fade<?php if ($moneymaker2_product_tabs_hide&&!$description&&!$product_tabs_1&&!$product_tabs_2 ) { ?> in active<?php } ?>" id="tab-smartfilter">
							<div class="<?php if ($moneymaker2_product_tabs_attributes_responsive) { ?>table-responsive<?php } ?>">
								<table class="table">
									<thead>
										<th>Годы выпуска</th>
										<th>Марка</th>
										<th>Модель</th>
										<th>Кузов</th>
									</thead>
									<tbody>
									<?php foreach ($product_filters as $product_filter) { ?>
									<tr>
										<td><?php echo $product_filter['start_year_id']; ?>-<?php echo $product_filter['end_year_id']; ?></td>
										<td><?php echo $product_filter['car_mark']; ?></td>
										<td><?php echo $product_filter['car_model']; ?></td>
										<td><?php echo $product_filter['car_generation']; ?></td>
									</tr>
									<?php } ?>
									</tbody>
								</table>
							</div>
						</div>
					<?php } ?>
					<?php if ($attribute_groups||$weight||$length||$width||$height||$moneymaker2_attributes_code) { ?>
					<div class="tab-pane fade<?php if ($moneymaker2_product_tabs_hide||!$description && !$product_filters) { ?> in active<?php } ?>" id="tab-specification">
					  <?php if ($moneymaker2_product_tabs_headers) { ?>
						<h3 class="text-center"><?php echo $moneymaker2_product_attribute_header; ?></h3>
					  <?php } ?>
					  <div class="<?php if ($moneymaker2_product_tabs_attributes_responsive) { ?>table-responsive<?php } ?>">
						<table class="table">
						  <?php foreach ($attribute_groups as $attribute_group) { ?>
						  <tbody>
							<tr>
							  <th colspan="2" class="text-center"><strong><?php echo $attribute_group['name']; ?></strong></th>
							</tr>
						  </tbody>
						  <tbody>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
							  <td><?php echo $attribute['name']; ?></td>
							  <td><?php echo $attribute['text']; ?></td>
							</tr>
							<?php } ?>
						  </tbody>
						  <?php } ?>
						  <?php if ($weight||$length||$width||$height||$moneymaker2_attributes_code) { ?>
						  <tbody>
						  <tr>
							<th colspan="2" class="text-center"><strong><?php echo $text_product; ?></strong></th>
						  </tr>
						  </tbody>
						  <tbody>
						  <?php if ($moneymaker2_attributes_code) { ?>
						  <tr>
							<td><?php echo $moneymaker2_product_code_caption; ?></td>
							<td><?php echo $moneymaker2_attributes_code; ?></td>
						  </tr>
						  <?php } ?>
						  <?php if ($weight) { ?>
						  <tr>
							<td><?php echo $text_weight; ?></td>
							<td><?php echo $weight; ?></td>
						  </tr>
						  <?php } ?>
						  <?php if ($length||$width||$height) { ?>
						  <tr>
							<td><?php echo $text_dimension; ?></td>
							<td><?php echo $length; ?> x <?php echo $width; ?> x <?php echo $height; ?></td>
						  </tr>
						  <?php } ?>
						  </tbody>
						  <?php } ?>
						</table>
					  </div>
					  <?php if ($moneymaker2_product_tabs_attributes_buttons) { ?>
					  <div class="text-center">
						<?php if ($moneymaker2_common_price_detached) { ?>
						<?php if ($price) { ?><div class="price-detached"><span class="price"><?php if (!$special) { ?>                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?><?php } else { ?><span class="price-new"><b>                <?php echo $special;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_special) and !empty($base_special)) { ?>                     <nobr>(<?php echo $base_special; ?>)</nobr>                 <?php } ?></b></span> <span class="price-old">                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?></span><?php } ?></span></div><?php } ?>
						<?php } ?>
						<p class="btn-group">
						  <?php if (!$moneymaker2_common_buy_hide) { ?>
						  <button type="button" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $addtocart_tooltip; ?>" class="<?php echo $addtocart_class; ?>" <?php if (!$product_sold) { ?>onclick="cart.add('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');"<?php } ?>><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached) { ?><?php if ($price&&$special) { ?>                <?php echo $special;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_special) and !empty($base_special)) { ?>                     <nobr>(<?php echo $base_special; ?>)</nobr>                 <?php } ?><?php } else if ($price) { ?>                <?php echo $price;  ?>                  <?php if (isset($currency_plus_show_base_price) and $currency_plus_show_base_price > 0 and isset($base_price) and !empty($base_price)) { ?> 					(<?php echo $base_price; ?>)                 <?php } ?><?php } ?><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
						  <?php } ?>
						  <?php if ($moneymaker2_modules_quickorder_enabled) { ?>
						  <button type="button" class="btn btn-default<?php if ($product_sold) { ?> disabled<?php } ?>" <?php if (!$product_sold) { ?>data-toggle="modal" data-target="#orderModal" data-order-mode="product" data-order-product-id="<?php echo $product_id; ?>" data-order-title="<?php echo $heading_title; ?>" data-order-img-src="<?php echo $quickorder_thumb; ?>" data-order-price="<?php if ($price&&$special) { ?><?php echo strip_tags($special); ?><?php } else if ($price) { ?><?php echo strip_tags($price); ?><?php } ?>"<?php } ?>><span <?php if (strip_tags($quickorder_tooltip)) { ?>data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $quickorder_tooltip; ?>"<?php } ?>><i class="fa fa-fw fa-send"></i></span></button>
						  <?php } ?>
						  <?php if (!$moneymaker2_common_wishlist_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_wishlist_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-fw fa-heart"></i><?php if ($moneymaker2_common_wishlist_caption) { ?> <?php echo $button_wishlist; ?><?php } ?></button><?php } ?>
						  <?php if (!$moneymaker2_common_compare_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_compare_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-fw fa-area-chart"></i><?php if ($moneymaker2_common_compare_caption) { ?> <?php echo $button_compare; ?><?php } ?></button><?php } ?>
						</p>
					  </div>
					  <?php } ?>
					</div>
					<?php } ?>

					  <?php if ($product_tabs_3) { ?>
						  <?php foreach($product_tabs_3 as $tab_key => $product_tab_3) { ?>
							  <div class="tab-pane fade in <?php if (!$description && !$product_tabs_1 && !$product_tabs_2 && !$product_filters && !$attribute_groups && $tab_key == 0) { ?> active<?php } ?>" id="tab-product-tab<?php echo $product_tab_3['tab_id'];?>">
								  <?php echo $product_tab_3['text']; ?>
							  </div>
						  <?php } ?>
					  <?php } ?>

					<?php if ($review_status) { ?>
					<div class="tab-pane fade<?php if ($moneymaker2_product_tabs_hide) { ?> in active<?php } ?>" id="tab-review">
					  <form class="form-horizontal" id="form-review">
						<?php if ($moneymaker2_product_tabs_headers) { ?>
						  <h3 class="text-center"><?php echo $moneymaker2_product_review_header; ?></h3>
						<?php } ?>
						<div id="review">
						  <?php if ($moneymaker2_product_tabs_reviews_indexed) { ?>
							<?php if ($reviews) { ?>
							<?php foreach ($reviews as $review) { ?>
							<div class="panel <?php if (true) { if ($review['rating'] >= 4) { ?>panel-success<?php } else if ($review['rating'] == 3) { ?>panel-warning<?php } else { ?>panel-danger<?php } } else { ?>panel-default<?php } ?> " itemprop="review" itemscope itemtype="https://schema.org/Review">
							  <div class="panel-heading">
								<div class="pull-left">
								  <b itemprop="author"><?php echo $review['author']; ?></b>
								</div>
								<div class="text-right" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
								  <meta itemprop="worstRating" content="1" >
								  <meta itemprop="bestRating" content="5">
								  <meta itemprop="ratingValue" content="<?php echo $review['rating']; ?>">
								  <?php for ($i = 1; $i <= 5; $i++) { ?>
								  <?php if ($review['rating'] < $i) { ?>
								  <i class="fa fa-star-o"></i>
								  <?php } else { ?>
								  <i class="fa fa-star"></i>
								  <?php } ?>
								  <?php } ?>
								</div>
							  </div>
							  <div class="panel-body">
								<p itemprop="reviewBody">
								  <?php echo $review['text']; ?>
								</p>
								<p class="text-right text-muted">
								  <time itemprop = "datePublished" datetime = "<?php echo $review['date_added']; ?>" ><?php echo $review['date_added']; ?></time>
								</p>
							  </div>
							</div>
							<?php } ?>
							<div class="row">
							  <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
							</div>
							<?php } else { ?>
							<div class="row">
							  <div class="col-sm-12 text-center">
								<p><?php echo $text_no_reviews; ?></p>
							  </div>
							</div>
							<?php } ?>
						  <?php } ?>
						</div>
						<h4 class="h3 text-center"><?php echo $text_write; ?></h4>
						<?php if ($review_guest) { ?>
						<div class="form-group required">
						  <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
						  <div class="col-sm-4">
							<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
						  </div>
						  <label class="col-sm-2 control-label"><?php echo $entry_rating; ?></label>
						  <div class="col-sm-4">
							<input type="number" data-max="5" data-min="1" name="rating" class="form-control moneymaker2-rating" />
						  </div>
						</div>
						<div class="form-group required">
						  <label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review; ?></label>
						  <div class="col-lg-8 col-md-9 col-sm-10 ">
							<textarea name="text" rows="3" id="input-review" class="form-control"></textarea>
						  </div>
						</div>
						<?php echo $captcha; ?>
						<div class="form-group required">
						  <div class="buttons clearfix col-sm-offset-2 col-sm-10">
							<button type="button" id="button-review" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-pencil"></i> <?php echo $button_submit; ?></button>
						  </div>
						</div>
						<?php } else { ?>
						<?php echo $text_login; ?>
						<?php } ?>
					  </form>
					</div>
					<?php } ?>
					<?php if ($moneymaker2_product_tabs) { ?>
					<?php foreach ($moneymaker2_product_tabs as $key => $value) { ?>
					<?php if ($value['link']) { ?>
					<div class="tab-pane fade<?php if ($moneymaker2_product_tabs_hide) { ?> in active<?php } ?>" id="tab-additional-<?php echo $key; ?>">
					  <?php if ($moneymaker2_product_tabs_headers) { ?><h3 class="text-center"><?php echo $value['name']; ?></h3><?php } ?>
					  <div id="tab-additional-content-<?php echo $key; ?>"></div>
					  <script><!--
						$(function() { $('#tab-additional-content-<?php echo $key; ?>').load('index.php?route=information/information/agree&information_id=<?php echo $value['link']; ?>');});
						//--></script>
					</div>
					<?php } ?>
					<?php } ?>
					<?php } ?>


					  <?php if ($product_tabs_5) { ?>
						  <?php foreach($product_tabs_5 as $tab_key => $product_tab_5) { ?>
							  <div class="tab-pane fade in <?php if (!$description && !$product_tabs_1 && !$product_tabs_2 && !$product_tabs_3 && !$attribute_groups && !$product_filters && !$review_status && !$moneymaker2_product_tabs && $tab_key == 0) { ?> active<?php } ?>" id="tab-product-tab<?php echo $product_tab_5['tab_id'];?>">
								  <?php echo $product_tab_5['text']; ?>
							  </div>
						  <?php } ?>
					  <?php } ?>
					<?php if($additional_product_tab) { ?>
					<div class="tab-pane fade in table-responsive product-option-description" id="additional-product-tab"><?php echo $additional_product_tab; ?></div>
					<?php } ?>
				  </div>
				</div>
			</div>

			<ul class="nav nav-tabs">
				<?php if ($similar_products) { ?>
					<li class="active"><a href="#tab-similar-products" data-toggle="tab">Похожие</a></li>
				<?php } ?>
				<?php if ($related_products) { ?>
					<li <?php if (!$similar_products) { ?>class="active"<?php } ?>><a href="#tab-related-products" data-toggle="tab">Сопутствующие</a></li>
				<?php } ?>
			</ul>

			<div class="tab-content">
				<?php if ($similar_products) { ?>
					<div class="tab-pane fade in active" id="tab-similar-products">
						<div class="row">
							<?php if ($moneymaker2_product_related_carousel) { ?>
							<div class="owl-carousel owl-moneymaker2 owl-moneymaker2-products owl-moneymaker2-products-related">
								<?php } ?>
								<?php foreach ($similar_products as $key => $product) { ?>
									<div class="product-layout product-grid col-md-12 col-sm-6 col-xs-6">
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
												<a href="<?php echo $product['href']; ?>" data-hpm-href="1"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
											</div>
											<div class="bottom flex fl-wrap fl-ai-center">
												<div class="caption text-left">
													<a href="<?php echo $product['href']; ?>" data-hpm-href="1"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a>
												</div>
												<?php if ($moneymaker2_common_price_detached) { ?>
													<div class="price-detached"><?php if ($product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?><?php } else { ?><span class="price-new"><b><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?></b></span> <span class="price-old"><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?></span><?php } ?></span><?php } ?><?php if ($product['tax']) { ?><br /><span class="price-tax text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span><?php } ?></div>
												<?php } ?>
												<div class="btn-group btn-group-sm">
													<a class="detail-view btn" href="<?php echo $product['href']; ?>" data-hpm-href="1">Подробнее</a>
													<?php if (!$moneymaker2_common_buy_hide && null === false) { ?>
														<button type="button" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['addtocart_tooltip']; ?>" class="<?php echo $product['addtocart_class']; ?>" <?php if (!$product['sold']) { ?>onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"<?php } ?>><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached&&$product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?><?php } else { ?><span class="price-new"><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?></span><?php } ?></span><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
													<?php } ?>
													<?php if ($moneymaker2_modules_quickorder_enabled&&$moneymaker2_modules_quickorder_display_catalog) { ?>
														<div class="<?php echo $product['quickorder_class']; ?>" <?php if (!$product['sold']) { ?>data-toggle="modal" data-target="#orderModal" data-order-mode="catalog" data-order-product-id="<?php echo $product['product_id']; ?>" data-order-title="<?php echo $product['name']; ?>" data-order-img-src="<?php echo $product['thumb']; ?>" data-order-price="<?php if (!$product['special']) { ?><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?><?php } else { ?><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?><?php } ?>"<?php } ?>><span data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['quickorder_tooltip']; ?>"><i class="fa fa-fw fa-send"></i></span></div>
													<?php } ?>
													<?php if (!$moneymaker2_common_wishlist_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_wishlist_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i><?php if ($moneymaker2_common_wishlist_caption) { ?> <?php echo $button_wishlist; ?><?php } ?></button><?php } ?>
													<?php if (!$moneymaker2_common_compare_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_compare_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-area-chart"></i><?php if ($moneymaker2_common_compare_caption) { ?> <?php echo $button_compare; ?><?php } ?></button><?php } ?>
												</div>
												<?php if (!$moneymaker2_common_price_detached&&$product['price']&&$product['tax']) { ?><div class="price-tax"><small class="text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></small></div><?php } ?>
											</div>
										</div>
									</div>
								<?php } ?>
								<?php if ($moneymaker2_product_related_carousel) { ?>
							</div>
						<?php } ?>
						</div>
					</div>
				<?php } ?>
				<?php if ($related_products) { ?>
					<div class="tab-pane fade in <?php if (!$similar_products) { ?>active<?php } ?>" id="tab-related-products">
						<div class="row">
							<?php if ($moneymaker2_product_related_carousel) { ?>
							<div class="owl-carousel owl-moneymaker2 owl-moneymaker2-products owl-moneymaker2-products-related">
								<?php } ?>
								<?php foreach ($related_products as $key => $product) { ?>
									<div class="product-layout product-grid">
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
												<a href="<?php echo $product['href']; ?>" data-hpm-href="1"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
											</div>
											<div class="bottom flex fl-wrap fl-ai-center">
                                                <?php echo !empty($product['hpm_block']) ? $product['hpm_block'] : ''; ?>
												<div class="caption">
													<a href="<?php echo $product['href']; ?>" data-hpm-href="1"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a>
												</div>
												<?php if ($moneymaker2_common_price_detached) { ?>
													<div class="price-detached"><?php if ($product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?><?php } else { ?><span class="price-new"><b><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?></b></span> <span class="price-old"><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?></span><?php } ?></span><?php } ?><?php if ($product['tax']) { ?><br /><span class="price-tax text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span><?php } ?></div>
												<?php } ?>
												<div class="btn-group btn-group-sm">
													<a class="detail-view btn" href="<?php echo $product['href']; ?>" data-hpm-href="1">Подробнее</a>
													<?php if (!$moneymaker2_common_buy_hide && null === false) { ?>
														<button type="button" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['addtocart_tooltip']; ?>" class="<?php echo $product['addtocart_class']; ?>" <?php if (!$product['sold']) { ?>onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"<?php } ?>><i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached&&$product['price']) { ?><span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?><?php } else { ?><span class="price-new"><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?></span><?php } ?></span><?php } else { ?><?php echo $button_cart; ?><?php } ?></button>
													<?php } ?>
													<?php if ($moneymaker2_modules_quickorder_enabled&&$moneymaker2_modules_quickorder_display_catalog) { ?>
														<div class="<?php echo $product['quickorder_class']; ?>" <?php if (!$product['sold']) { ?>data-toggle="modal" data-target="#orderModal" data-order-mode="catalog" data-order-product-id="<?php echo $product['product_id']; ?>" data-order-title="<?php echo $product['name']; ?>" data-order-img-src="<?php echo $product['thumb']; ?>" data-order-price="<?php if (!$product['special']) { ?><?php echo $product['price']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_price']) and !empty($product['base_price'])) { ?>                     <nobr>(<?php echo $product['base_price']; ?>)</nobr>                 <?php } ?><?php } else { ?><?php echo $product['special']; ?>                  <?php if (isset($currency_plus_show_base_price_cat) and $currency_plus_show_base_price_cat > 0 and isset($product['base_special']) and !empty($product['base_special'])) { ?>                     <nobr>(<?php echo $product['base_special']; ?>)</nobr>                 <?php } ?><?php } ?>"<?php } ?>><span data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo $product['quickorder_tooltip']; ?>"><i class="fa fa-fw fa-send"></i></span></div>
													<?php } ?>
													<?php if (!$moneymaker2_common_wishlist_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_wishlist_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i><?php if ($moneymaker2_common_wishlist_caption) { ?> <?php echo $button_wishlist; ?><?php } ?></button><?php } ?>
													<?php if (!$moneymaker2_common_compare_hide) { ?><button type="button" class="btn btn-default" <?php if (!$moneymaker2_common_compare_caption) { ?>data-toggle="tooltip" data-placement="bottom" <?php } ?>title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-area-chart"></i><?php if ($moneymaker2_common_compare_caption) { ?> <?php echo $button_compare; ?><?php } ?></button><?php } ?>
												</div>
												<?php if (!$moneymaker2_common_price_detached&&$product['price']&&$product['tax']) { ?><div class="price-tax"><small class="text-muted"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></small></div><?php } ?>
												<!--              <div class="additional">--><?php //echo $product['stock']; ?><!-- --><?php //echo $product['code']; ?><!--</div>-->
											</div>
										</div>
									</div>
								<?php } ?>
								<?php if ($moneymaker2_product_related_carousel) { ?>
							</div>
						<?php } ?>
						</div>
					</div>
				<?php } ?>
			</div>
		  <?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<script><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script><!--
    $(document).on('click', '#button-cart', function() {
  <?php if (!$product_sold) { ?>
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'number\'], #product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, #product '),
		dataType: 'json',
		beforeSend: function() {
      $('#button-cart .fa').removeClass('shopping-cart');
      $('#button-cart .fa').addClass('fa-spinner fa-spin');
		},
		complete: function() {
      $('#button-cart .fa').removeClass('fa-spinner fa-spin');
      $('#button-cart .fa').addClass('shopping-cart');

		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
          $('.options .collapse').show();
          <?php if ($moneymaker2_product_options_hide&&$moneymaker2_product_options_hide_limit&&(count($options)>=$moneymaker2_product_options_hide_limit)) { ?>
            $('.options > div:first-child').hide();
          <?php } ?>
          for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
        var moneymaker2_total_count = json['moneymaker2_total_count'];
        var moneymaker2_total_sum = json['moneymaker2_total_sum'];
        $('#cart > .dropdown-toggle #cart-total').html(moneymaker2_total_sum);

        $('#cart > .dropdown-toggle .fa-stack').remove();

        var cartHtml = '<small class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><span class="fa-stack-1x">moneymaker2_total_count</span></small>';

        $(cartHtml).insertAfter($("#cart > .dropdown-toggle .fa-shopping-cart"));
				
				$('#cart > .dropdown-toggle .fa-stack .fa-stack-1x, .navbar-cart-toggle .fa-stack .fa-stack-1x').html(moneymaker2_total_count);
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
				$('#popupModal').find('.modal-body').load('index.php?route=common/cart/info ul', function () {
					$('#popupModal .modal-header .close').addClass('hidden');
					$('#popupModal .modal-body > ul').removeClass('dropdown-menu keep-open');
					$('#popupModal .modal-body > ul').addClass('list-unstyled');
					$('.modal-cart-info').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small>' + json['success'] + '</small></div></div>');
					$('#popupModal').find('.modal-title').load('index.php?route=common/cart/info #cart-total', function () {
						$('#popupModal .modal-title').text(json['total']);
						$('#popupModal').modal();
					});
				});
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
  <?php } ?>
});

//--></script>
<script><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

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
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success').parent().parent().remove();
			$('.alert-danger').parent().parent().remove();
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
        if (typeof grecaptcha != "undefined") {grecaptcha.reset();} //refresh recaptcha if enabled
        $('#button-review').parent().parent().before('<div class="form-group"><div class="col-sm-offset-2 col-lg-8 col-md-9 col-sm-10"><div class="alert alert-danger">' + json['error'] + '</div></div></div>');
			}

			if (json['success']) {
        $('#button-review').parent().parent().before('<div class="form-group"><div class="col-sm-offset-2 col-lg-8 col-md-9 col-sm-10"><div class="alert alert-success">' + json['success'] + '</div></div></div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	<?php if ($moneymaker2_product_gallery_moved) { ?>
    $('.thumbnails.image-additional').detach().insertAfter( $('.thumbnails.image-thumb') );
	<?php } ?>

  <?php if ($moneymaker2_modules_timer&&$moneymaker2_modules_timer_date) { ?>
  function getDaysText(number, titles) {
    cases = [2, 0, 1, 1, 1, 2];
    return titles[ (number%100>4 && number%100<20)? 2 : cases[(number%10<5)?number%10:5] ];
  }
  var countDownDate = new Date("<?php echo $moneymaker2_modules_timer_date; ?>").getTime();
  var delimiter = "<span class='blink'>:</span>";
  function setTimer() {
    var now = new Date().getTime();
    var distance = countDownDate - now;
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var daysText=getDaysText(days,['<?php echo $text_timer_days_numeral1; ?>','<?php echo $text_timer_days_numeral2; ?>','<?php echo $text_timer_days_numeral3; ?>']);
    var remainingText=getDaysText(days,['<?php echo $text_timer_ends_numeral1; ?>','<?php echo $text_timer_ends_numeral2; ?>','<?php echo $text_timer_ends_numeral3; ?>']);
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    if (hours<10) hours='0'+hours;
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    if (minutes<10) minutes='0'+minutes;
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    if (seconds<10) seconds='0'+seconds;
    if ($('#timer-countdown').css("opacity") == 0 ) {
      $('#timer-countdown').velocity("fadeIn", {duration: 500});
    }
    if (days < 1) {
      document.getElementById("timer-countdown").innerHTML = remainingText + hours + delimiter + minutes + delimiter + seconds;
    } else {
      document.getElementById("timer-countdown").innerHTML = remainingText + days + "&nbsp;" + daysText + "&nbsp;" + hours + delimiter + minutes + delimiter + seconds;
    }
    if (distance < 0) {
      clearInterval(moneymaker2_timer);
      document.getElementsByClassName("product-timer")[0].outerHTML = "";
    }
  }
  var moneymaker2_timer = setInterval(function() {setTimer()}, 1000);
  <?php } ?>
  <?php if ($related_products&&$moneymaker2_product_related_carousel) { ?>
  $('.col-sm-6 > div > .owl-moneymaker2-products-related').owlCarousel({
    itemsCustom : [[0, 1], [561, 2], [768, 1], [992, 2], [1200, 2], [1583, 3]],
    navigation: true,
    navigationText: ['', ''],
    pagination: true,
  <?php if ($moneymaker2_product_related_carousel_autoplay) { ?>
    autoPlay: true,
    stopOnHover: true,
    autoPlay: 3500,
  <?php } ?>
  });
  $('.col-sm-9 > div > .owl-moneymaker2-products-related').owlCarousel({
    itemsCustom : [[0, 1], [561, 2], [992, 3], [1200, 3], [1583, 4]],
    navigation: true,
    navigationText: ['', ''],
    pagination: true,
  <?php if ($moneymaker2_product_related_carousel_autoplay) { ?>
    autoPlay: true,
    stopOnHover: true,
    autoPlay: 3500,
  <?php } ?>
  });
  $('.col-sm-12 > div > .owl-moneymaker2-products-related').owlCarousel({
    itemsCustom : [[0, 1], [561, 2], [768, 3], [992, 4], [1200, 4], [1583, 5]],
    navigation: true,
    navigationText: ['', ''],
    pagination: true,
  <?php if ($moneymaker2_product_related_carousel_autoplay) { ?>
    autoPlay: true,
    stopOnHover: true,
    autoPlay: 3500,
  <?php } ?>
  });
  <?php } ?>

	var hash = window.location.hash;
	if (hash) {
		var hashpart = hash.split('#');
		var  vals = hashpart[1].split('-');
		for (i=0; i<vals.length; i++) {
			$('div.options').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
			$('div.options').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
		}
	}
});
//--></script>
<script>
$(document).ready(function() {
	$('.thumbnail-video a').magnificPopup({
		type: 'iframe',
		iframe: {
			markup: '<div class="mfp-iframe-scaler">'+
				'<div class="mfp-close"></div>'+
				'<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
				'</div>',
			srcAction: 'iframe_src',
		}
	});
});

var fadeStatus = (window.innerWidth < 992) ? true : false;

$('.slider-for').slick({
	slidesToShow: 1,
	slidesToScroll: 1,
	arrows: false,
	infinite: true,
	dots: fadeStatus,
	fade: false,
	focusOnSelect: true,
	asNavFor: '.slider-nav'
});

$('.slider-nav').slick({
	infinite: true,
	slidesToShow: 4,
	slidesToScroll: 1,
	arrows: true,
	asNavFor: '.slider-for',
	dots: false,
	vertical: true,
	verticalSwiping: true,
	focusOnSelect: true,
	prevArrow: '<i class="fa fa-angle-up"></i>',
	nextArrow: '<i class="fa fa-angle-down"></i>',
	responsive: [{
		breakpoint: 450,
		settings: {
			slidesToShow: 3
		}
	}, {
		breakpoint: 576,
		settings: {
			slidesToShow: 3
		}
	}, {
		breakpoint: 768,
		settings: {
			slidesToShow: 3
		}
	}, {
		breakpoint: 992,
		settings: {
			slidesToShow: 4
		}
	}, {
		breakpoint: 1460,
		settings: {
			slidesToShow: 5
		}
	}]
});
</script>
<div id="myModalBox" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <?php echo $content_modal_filter; ?>
        </div>
    </div>
</div>
<style type="text/css">
    .product-product-<?php echo $product_id; ?> .smart-filter-module {
        padding: 20px;
    }
    .product-product-<?php echo $product_id; ?> .tabs-categories {
        display: none;
    }
</style>
<?php if($_SERVER['REMOTE_ADDR'] != '127.0.0.1') { ?>
<div class="hystmodal" id="myModal" aria-hidden="true">
    <div class="hystmodal__wrap">
        <div class="hystmodal__window" role="dialog" aria-modal="true">
            <button data-hystclose class="hystmodal__close">Закрыть</button>
			<script async src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=86484408-b7c2-42a7-9441-c5b60b72ab75&amp;onload=initMap" type="text/javascript"></script>
			<script>
				function initMap() {
					ymaps.ready(function () {
						mapHandler([55.76, 37.64], mapsArray);
						myMap.container.fitToViewport();

						partners = mapsArray;
					});
					var mapsArray = [
					<?php if (empty($affiliate_centr)) { ?>
					{
						geocode: '<?php echo $city; ?>',
						iconCaption: 'Нет установочных центров.'
					}
					<?php } else { ?>
					<?php foreach ($affiliate_centr as $affiliate) { ?>
					{
						geocode: '<?php echo $affiliate["geocode"]; ?>',
						header: '<?php echo $affiliate["header"]; ?>',
						body: '<?php echo $affiliate["body"]; ?>',
						footer: '<?php echo $affiliate["footer"]; ?>',
						iconCaption: '<?php echo $affiliate["header"]; ?>'
					},
					<?php } ?>
					<?php } ?>
					];
				}
			</script>
			<script src="catalog/view/javascript/reverse_geocode.js"></script>
			<style type="text/css">
			html, body, #map {
				width: 100%;
				height: 100%;
				margin: 0;
				padding: 0;
			}
				#map {
				min-height: 500px;
			}
			</style>
			<div id="map"></div>
		</div>
    </div>
</div>
<?php } ?>
<script><!--
const myModal = new HystModal({
    linkAttributeName: "data-hystmodal",
    // настройки (не обязательно), см. API
    beforeOpen: function(modal){
      //  setTimeout(() => {
      //      myMap.container.fitToViewport();
      //  }, 500);
    },
});
//--></script>
<script type="text/javascript">
    <?php

    $additional_product_tab = preg_replace_callback(
            '/[^a-z0-9,\._]/iSu',
            function ($matches) {
                $chr = $matches[0];
                if (strlen($chr) != 1) {
                    $chr = mb_convert_encoding($chr, 'UTF-16BE', 'UTF-8');
                    $chr = ($chr === false) ? '' : $chr;
                }
                return sprintf('\\u%04s', strtoupper(bin2hex($chr)));
            },
            $additional_product_tab
        );
    ?>

    defaultDescription = '<?php echo $additional_product_tab; ?>';

    $('.image-check-option a').on('click', function(){

        $('.product-option-description').html(defaultDescription);

        var productBasePrice = $('.original-product-price').attr('data-original-product-price');

        var $this = $(this);

        var parentEl = $this.closest('.row');

        $('.option-text').removeClass('active-option-item');
        $this.addClass('active-option-item');

        var optName = $this.data('opt-name');
        var optVal = $this.data('opt-value');
        var optValId = $this.data('opt-value-id');
        var optionId = $this.data('option-id');
        var optPrice = $this.data('opt-price');

        var optStockStatusMoscow = $this.data('stock-status-moscow');
        var optStockStatusNovosibirsk = $this.data('stock-status-novosibirsk');


        $.ajax({
            url: 'index.php?route=product/product/getOptionDescription',
            data: 'option_value_id=' + optValId + '&option_id=' + optionId + '&product_id=' + '<?php echo $product_id; ?>' ,
            type: 'post',
            dataType: 'json',
            beforeSend: function() {
            },
            complete: function() {
            },

            success: function(json) {


                if(defaultDescription.length != 0) {

                    $('.main-tabs-content > .tab-pane').removeClass('active');

                    if (json['success'] == 1) {
                        $('.product-option-description').html(json['html']);
                    } else {
                        $('.product-option-description').html(defaultDescription);
                    }

                    $('.product-option-description').addClass('active');


                    $('.product-page-tabs > li, .product-page-tabs .tab-pane').removeClass('active');
                    $('.additional-product-tab').parent('li').addClass('active');
                    $('.product-option-description').addClass('active');

                }


            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

        $('.stock-status').empty();

        var html = '';

        html += '<div class="stock-7 flex fl-ai-center">';

        if(optStockStatusMoscow == 1) {
            html += '<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>';
            html += '<span class="title"><span class="stock-availability"></span><span class="value stock-status-value"> Есть в наличии в Москве</span></span>';
        }

        if(optStockStatusNovosibirsk == 1) {
            html += '<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>';
            html += '<span class="title"><span class="stock-availability"></span><span class="value stock-status-value"> Есть в наличии в Новосибирске</span></span>';
        }

        if(optStockStatusMoscow == 0 && optStockStatusNovosibirsk == 0) {
            html += '<span class="fa-stack fa-md pull-left"><i class="fa fa-check fa-stack-1x"></i></span>';
            html += '<span class="title"><?php echo $text_stock; ?></span><span class="value stock-status-value"><?php echo $stock; ?></span>';
        }

        html += '<div class="text-muted"><?php echo $moneymaker2_product_points_stock_caption; ?></div>';

        $('.alternative-availability').html(html);
        $('.selected-option').val(optVal);

        var prodOptId = $this.data('product-option-id');

        var optBasePrice = $this.data('opt-base-price');
        var optPricePrefix = $this.data('opt-price-prefix');

        parentEl.find('.opt-rows').val(optVal);

        if($this.hasClass('option-text') == false) {
            $('.input-option' + prodOptId)
                .text(optName)
                .closest('.form-group')
                .css("display", "block");
        }

        $('#input-option' + prodOptId)
            .attr("data-opt-base-price", optBasePrice)
            .attr("data-opt-price-prefix", optPricePrefix)
            .val(optVal);

        $( ".product-options .form-group" ).each(function( index ) {
            var optionPrice = $( this ).find('input').attr('data-opt-base-price');
            var optionPricePrefix = $( this ).find('input').attr('data-opt-price-prefix');

            if(optionPricePrefix == '+') {
                productBasePrice = parseInt(productBasePrice) + parseInt(optionPrice);
            } else {
                productBasePrice = parseInt(productBasePrice) - parseInt(optionPrice);
            }
        });

        $('#product .price').text(optPrice);
		
        var optRows = $('.opt-rows').length;
        var counter = 0;
        var scrollAttrId = '';
		
        $('.opt-rows').each( function(e){
            if($(this).val() == '') {
                scrollAttrId = $(this).attr('id');
            } else {
                counter++;
            }
        });
    });
</script>
<?php echo $footer; ?>
