<div class="main-compare ptsc-compare">
	<div class="pts-border-grey ptsc-border-grey">
		<label class="seller-heading-compare"><?php echo $text_seller_price; ?></label>
		<?php foreach($template_prices as $template_price){ ?>
			<div class="pts-px-1 ptsc-px-1 bg-strip pts-bg-strip">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-9">
							<h5 class="m-0 <?php if(isset($journal2)){ ?> ptsc-sellerprice-marlef<?php } ?>ptsc-sellerprice-margfsiz">
								<a href="<?php echo $template_price['href'] ?>"><span><?php echo $template_price['store_name']; ?></span></a>
							</h5>
						</div>
						<div class="col-md-3">
							<a href="<?php echo $template_price['href'] ?>"><img src=<?php echo $template_price['store_logo']; ?> class="img-fluid img-responsive <?php if(isset($journal2)){ ?>ptsc-sellerprice-marwid <?php } ?>"></a>
						</div>
						<div class="col-md-12 text-left">
							<div class="row">
								<div class="price-new ptsc-price-new compare-pts-star compare-ptsc-star">
									<div class="">
										<label><i class="fa fa-doller"></i><?php echo $template_price['price']; ?></label>
									</div>
									
									
									
									<div class="">				
										<?php for($i = 1; $i <= 5; $i++) { ?>
											<?php if($template_price['rating'] < $i){ ?>
												<i class="fa fa-star-o"></i>
												<?php } else { ?>							 
												<i class="fa fa-star"></i>
											<?php } ?>
										<?php } ?>
									</div>
									
									
									<div class="">
										<button class="pts-btn pts-btn-primary ptsc-sellprice-bradius" onclick="addcartseller('<?php echo $template_price['seller_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_add_cart; ?></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<?php } ?>
		
		
	</div>
	
</div>

<style>
	.pl-0{padding-left:0 !important}
	.mt-2{margin-top:5px}
	.compare-pts-star{padding:8px 0px;style="margin:0;font-size:14px;<?php if(!isset($journal2)){ ?> display: flex;<?php } ?>"justify-content: space-between;padding:10px 12px;line-height: 2;}
	.cart-btn-compare{background:transparent;border:none;color:#337ab7}
	.cart-btn-compare .fa::before{font-size:18px;}
</style>
<?php if($purpletree_multivendor_seller_product_template){ ?>
	<script>
		function addcartseller(sellerid){
			//alert(productis);
			//
			$.ajax({
				url: 'index.php?route=checkout/cart/add&seller_id='+sellerid,
				type: 'post',
				data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
				dataType: 'json',
				beforeSend: function() {
					$('#button-cart').button('loading');
				},
				complete: function() {
					$('#button-cart').button('reset');
				},
				success: function(json) {
					$('.alert-dismissible, .text-danger').remove();
					$('.form-group').removeClass('has-error');
					
					if (json['error']) {
						if (json['error']['option']) {
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
						$('.breadcrumb').after('<div class="alert alert-success alert-dismissible">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
						
						$('#cart > ul').load('index.php?route=common/cart/info ul li');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
			//
			
		} 
	</script>
	<script>
		$(window).load(function() {
			if($('.main-compare').parent().attr('id') == 'column-right' || $('.main-compare').parent().hasClass('right_column')) {
				$('.main-compare').parent().addClass('pts-col-sm-3');
			}
			if ($(window).width() < 768) {
				$('.main-compare').parent().addClass('pts-column-right-sellerpprice');
			}
		});
	</script>
	<script>
		$(window).load(function() {
			if($('.main-compare').parent().attr('id') == 'column-right' || $('.main-compare').parent().hasClass('right_column')) {
				$('.pts-list-group').parent().addClass('pts-col-sm-3');
			}
			if ($(window).width() < 768) {
				$('.main-compare').parent().addClass('pts-column-right-sellerpprice');
			}
		});
	</script>
<?php } ?>
