<li class="modal-cart hidden-xs" id="cart">
	<a href="#"><i class="fa fa-fw fa-shopping-cart"></i>
		<?php if($count_cart_products != 0) { ?>
			<small class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><span class="fa-stack-1x"><?php echo $text_items_count; ?></span></small>
		<?php } ?>
		<span class="<?php echo $moneymaker2_header_strip_cart_class; ?>"><span id="cart-total"><?php echo $text_items; ?></span> <i class="fa fa-angle-down"></i></span></a>

</li>
