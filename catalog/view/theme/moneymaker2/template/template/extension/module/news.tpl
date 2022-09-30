<?php if($show_title) { ?>
<p class="h2 text-center content-title"><?php echo $heading_title; ?></p>
<?php if($show_icon) { ?>
<div class="row catalog-thumb">
  <div class="col-sm-12 text-center">
    <span class="fa-stack fa-2x img-thumbnail">
      <i class="fa fa-circle fa-stack-2x"></i>
      <i class="fa fa-calendar fa-stack-1x fa-inverse"></i>
    </span>
  </div>
</div>
<hr class="catalog-hr">
<?php } ?>
<br />
<?php } ?>
<div class="row products">
	<?php foreach ($news as $news_item) { ?>
	<div class="product-layout product-grid">
		<div class="product-thumb transition">
			<?php if($news_item['thumb']) { ?>
			<div class="image image-additional"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive img-circle" /></a></div>
			<?php } ?>
			<br />
      <div>
        <div class="caption">
          <a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a>
        </div>
        <div class="description show">
          <p class="text-left"><?php echo $news_item['description']; ?>.. <a href="<?php echo $news_item['href']; ?>"><?php echo $text_more; ?></a></p>
          <p class="text-muted"><i class="fa fa-clock-o"></i> <?php echo $news_item['posted']; ?></p>
        </div>
      </div>

			<div class="button-group hidden">
				<button onclick="location.href = ('<?php echo $news_item['href']; ?>');" data-toggle="tooltip" title="<?php echo $text_more; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_more; ?></span></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $news_item['posted']; ?>"><i class="fa fa-clock-o"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $news_item['viewed']; ?>"><i class="fa fa-eye"></i></button>
			</div>
		</div>
	</div>
	<?php } ?>
</div>