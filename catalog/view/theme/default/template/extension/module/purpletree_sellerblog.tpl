<h3 class="pts-h3"><?php echo $heading_title; ?>
	<div class="pts-pull-right">
		<a class="pts-btn pts-btn-default ptsc-sellblog-baccolor"  href="<?php echo $allblog ; ?>"><?php echo $view_all; ?></a>
	</div>
</h3>
<div class="row">
	<div id="carousel_seller_blog" class="owl-carousel">
		<?php foreach ($pts_blogs as $pts_blog) { ?>
			<div class="col-lg-12 col-md-3 col-sm-6 col-xs-12 col-xs-12">
				<div class="  text-center pts-product-thumb transition ptsc-sellblog-align">
					<div class="transition">
						<div class="pull-left col-md-6">
							<?php echo $pts_blog['date']; ?>
						</div>		
						<div> <a href="<?php echo $pts_blog['href']; ?>"><img src="<?php echo $pts_blog['thumb']; ?>" alt="<?php echo $pts_blog['title']; ?>" title="<?php echo $pts_blog['title']; ?>" class="pts-seller-blog-image img-responsive" /></a>
						</div>
						<div class="ptsc-sellblog-height">
							<h4><a href="<?php echo $pts_blog['href']; ?>"><?php echo $pts_blog['title']; ?></a></h4>
							<p><?php echo $pts_blog['description']; ?></p>
						</div>
					</div>
					<div>
						<a href="<?php echo $pts_blog['href']; ?>"><?php echo $text_readmore; ?></a>
					</div>
				</div>
			</div>
		<?php } ?>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#carousel_seller_blog").owlCarousel({
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
