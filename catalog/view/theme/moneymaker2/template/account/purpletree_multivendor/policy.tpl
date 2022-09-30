<?php echo $header; ?>
<div class="pts-container container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="pts-row">
		<div id="content" class="pts-col-sm-12">
			<?php echo $content_top; ?>
			<h1><?php echo $text_policy; ?></h1>
			<?php echo $store_policy;?>
			<?php echo $content_bottom; ?>
		</div>
	</div>
</div>
<?php echo $footer; ?>