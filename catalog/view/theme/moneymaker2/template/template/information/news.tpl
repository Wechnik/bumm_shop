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
		<div id="content" class="<?php echo $class; ?>">
      <ul class="breadcrumb text-center">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <?php if($i+1<count($breadcrumbs)) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><li class="active"><?php echo $breadcrumb['text']; ?></li><?php } ?>
        <?php } ?>
      </ul>
      <?php echo $content_top; ?>
      <h1 class="h2 text-center content-title"><?php echo $heading_title; ?></h1>
      <?php if ($thumb) { ?>
      <div class="row catalog-thumb thumbnails">
        <div class="col-sm-12 thumbnail image-additional">
          <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-circle center-block" /></a>
        </div>
      </div>
      <?php } ?>
      <hr class="catalog-hr">
      <br />
			<div class="row">
				<div class="col-sm-12">
          <?php echo $description; ?>
          <p class="clearfix"></p>
          <?php if($news_share) { ?>
          <div class="addthis_inline_share_toolbox pull-right"></div><script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-59235d10badfbf0b"></script>
          <?php } ?>
          <p class="text-muted "><i class="fa fa-clock-o"></i>&nbsp;<?php echo $posted; ?></p>
          <p class="clearfix"></p>
          <p class="text-center">
            <a class="btn btn-primary" href="<?php echo $news_list; ?>"><?php echo $button_news; ?></a><br />
            <a class="btn btn-link" href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
          </p>
				</div>
			</div>
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
	<script type="text/javascript"><!--
		$(document).ready(function () {
			$('.thumbnail').magnificPopup({
				type: 'image',
				delegate: 'a',
			});
		});
	//--></script>
</div>
<?php echo $footer; ?>