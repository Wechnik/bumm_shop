<?php echo $header; ?>
<div class="pts-container container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div>
		
		<div id="pts-content"><?php echo $content_top; ?>
			<h1><?php echo $heading_title; ?></h1>
			<?php if ($blog) { ?>
				<div class="pts-row">
					<?php foreach ($blog as $pts_blog) { ?>
						<div class="pts-col-lg-3 pts-col-md-3 pts-col-sm-6 pts-col-xs-12">
							<div class="  text-center pts-product-thumb transition ptsc-text-center-imp">
								<div class="transition">
									<div class="pull-left col-md-6">
										<?php echo $pts_blog['date']; ?>
									</div>		
									<div> <a href="<?php echo $pts_blog['href']; ?>"><img src="<?php echo $pts_blog['thumb']; ?>" alt="<?php echo $pts_blog['title']; ?>" title="<?php echo $pts_blog['title']; ?>" class="pts-seller-blog-image img-responsive ptsc-blogpost-automar"  /></a>
									</div>
									<div  class="ptsc-sellblog-height">
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
				<div class="pts-row">
					<div class="col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 pts-text-right"><?php echo $results; ?></div>
				</div>
				<?php } else { ?>
				<p><?php echo $text_empty; ?></p>
				<div class="buttons">
					<div class="pts-pull-right"><a href="<?php echo $continue; ?>" class="pts-btn pts-btn-primary"><?php echo $button_continue; ?></a></div>
				</div>
			<?php } ?>
		<?php echo $content_bottom; ?></div>   
	</div>
</div> 
<?php echo $footer; ?>
