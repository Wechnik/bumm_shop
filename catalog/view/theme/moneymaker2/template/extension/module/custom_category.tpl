<?php if($custom_categories) { ?>
<ul class="flex fl-wrap fl-m5 list-unstyled categorywall">
	<?php foreach ($custom_categories as $custom_category) { ?>
	<li class="col-xs-4 col-sm-3 col-lg-2">
		<a class="custom-category-item" href="<?php echo $custom_category['href']; ?>">
			<img src="<?php echo $custom_category['image']; ?>" alt="<?php echo $custom_category['name']; ?>" class="img-responsive" />
			<div class="cat-name"><?php echo $custom_category['name']; ?></div>
		</a>
	</li>
	<?php } ?>
</ul>
<?php } ?>