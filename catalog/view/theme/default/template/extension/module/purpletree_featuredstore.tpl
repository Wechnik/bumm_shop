<?php if(!empty($store)) { ?>
	<h3 class="pts-h3"><?php echo $heading_title; ?></h3>
	<div class="row">
		<div id="carousel_seller_featuredstore" class="aaaa owl-carousel text-center">
			<?php foreach ($store as $result) { ?>
				<div class="pts-product-layout pts-col-lg-12 pts-col-md-12 pts-col-sm-12 pts-col-xs-12">
					<div class="pts-product-thumb transition">
						<div class="image">
							<a href="<?php echo $result['href']; ?>">
								<img src="<?php echo $result['store_logo']; ?>" alt="  <?php echo $result['store_name']; ?>" title="<?php echo $result['store_name']; ?>" class="img-responsive" />
							</a>
						</div>
						<div class="pts-caption ptsc-cfeatured-modumihei">
							<h4><a href="<?php echo $result['href']; ?>"><?php echo $result['store_name']; ?></a></h4>       
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#carousel_seller_featuredstore").owlCarousel({
				items:5,
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
	</script>
<?php } ?>
