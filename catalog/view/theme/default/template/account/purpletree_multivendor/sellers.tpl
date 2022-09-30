<?php echo $header; ?>
<div id="product-category" class="container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
    <?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="pts-row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
			<?php $class = 'pts-col-sm-6 col-sm-6'; ?>
			<?php } elseif ($column_left || $column_right) { ?>
			<?php $class = 'pts-col-sm-9 col-sm-9'; ?>
			<?php } else { ?>
			<?php $class = 'pts-col-sm-12 col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<h1><?php echo $heading_title; ?></h1>
			<?php if ($sellers) { ?>
				<div class="pts-row">
					<div class="pts-col-md-4 pts-col-sm-4">
						<div class="search_seller">
							<div class="pts-input-group" id="pts-search">
								<input type="text" class="pts-form-control pts-input-lg search" placeholder="<?php echo $text_refine; ?>" value="<?php echo $filter; ?>" name="<?php echo $text_refine; ?>">
								<span class="pts-input-group-btn"><button class="pts-btn pts-btn-default pts-btn-lg" type="button"><i class="fa fa-search"></i></button></span>
							</div>
						</div>
					</div>
					<div class="pts-col-md-3 pts-col-sm-3">
					</div>
					<div class="pts-col-md-3 pts-col-xs-6 pts-col-sm-3">
						<div class="pts-form-group pts-input-group pts-input-group-sm ptssortcss">
							<label class="pts-input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
							<select id="input-sort" class="pts-form-control" onchange="location = this.value;">
								<?php foreach($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
										<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="pts-col-md-2 pts-col-xs-6 pts-col-sm-2">
						<div class="pts-form-group pts-input-group pts-input-group-sm ptssortcss">
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
				<?php foreach($sellers as $seller) { ?>
					<?php if($seller['subscription_status']){ ?>
						<div class="purpletree_seller clearfix">
							<div class="pts-col-sm-2 pts-col-md-2 pts-col-xs-6">
								<a href="<?php echo $seller['href'];  ?>"><img src="<?php echo $seller['seller_thumb']; ?>" alt="<?php echo $seller['seller_name']; ?>" title="<?php echo $seller['seller_name']; ?>" class="img-thumbnail" /></a>
							</div>
							<div class="pts-col-sm-3 pts-col-md-3 pts-col-xs-6">
								<p><a href="<?php echo $seller['href'];  ?>"><h3><strong><?php echo $seller['seller_name']; ?></strong></h3></a></p>
								<?php if(isset($pts_check_store_address)){ ?>
								<p><?php echo $seller['seller_address']; ?> <?php echo $seller['seller_country']; ?></p>
								<p><?php echo $seller['store_city']; ?> <?php echo $seller['store_state']; ?></p>
					            <p><?php echo $seller['seller_country']; ?> <?php echo $seller['store_zipcode']; ?></p>
								<?php } ?>
								<p><a href="<?php echo $seller['seller_contact'];  ?>"><?php echo $text_sellercontact; ?></a></p>
							</div>
							<div class="pts-col-sm-7 pts-col-md-7 pts-col-xs-12 pts-pull-right">
								<div class="seller_product">
									<div class="product_count">
										<h3 class="pts-text-center"><?php echo $seller['product_total']; ?></h3>
										<?php if($seller['product_total']==1) { ?>
											<div class="text-center"><?php echo "Product"; ?></div>
											<?php } else { ?>
											<div class="text-center"><?php echo $text_product; ?></div>
										<?php } ?>
									</div>
								</div>
								<?php if($seller['products']) { ?>
									<?php foreach($seller['products'] as $product) { ?>
										<div class="seller_product">
											<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $seller['seller_name']; ?>" title="<?php echo $seller['seller_name']; ?>" class="img-thumbnail" /></a>
										</div>
									<?php } ?>
								<?php } ?>
							</div>
						</div>
						
					<?php } } ?>
					<div class="pts-row">
						<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
						<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
					</div>
			<?php } ?>
			<?php if(!$sellers) { ?>
				<p><?php echo $text_empty; ?></p>
			<?php } ?>
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<script>
	$(document).ready(function(){
		$('.search_seller .pts-btn').click(function(){
			var search_text = $('.search_seller .search').val();
			window.location.href = 'index.php?route=account/purpletree_multivendor/sellers&search_text=' +  search_text;
		});
	});
</script>
<script>
	$(window).load(function() {
			$('aside#column-right').addClass('pts-col-sm-3 col-sm-3');
		});
</script>
<link href="catalog/view/javascript/purpletree/css/stylesheet/commonstylesheet.css" type="text/css" rel="stylesheet" />
<?php echo $footer; ?> 
