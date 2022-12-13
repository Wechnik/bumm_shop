<?php echo $header; ?>

<div class="container">

  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li>
    		<a href="<?php echo $breadcrumb['href']; ?>">
    		<?php echo $breadcrumb['text']; ?></a>
    	</li>
    <?php } ?>
  </ul>

  <?php echo $content_top; ?>
	
	<?php if (isset($errors)) { ?>
		<?php foreach($errors as $error) { ?>
			<div class="alert alert-warning"><?= $error; ?></div>
		<?php } ?>
	<?php } elseif (isset($empty)) {?>
		<div class="alert alert-info">Корзина пуста!</div>
	<?php } ?>

	<?php if (isset($cart)) { ?>
		<div id="custom-cart">
			<?php echo $cart; ?>
		</div>
	<?php } ?>

	<div class="row">
		
		<div class="col-sm-6">

			<?php echo $column_left; ?>

			<?php if (isset($login) && !$logged) { ?>
				<div id="custom-login">
					<?php echo $login; ?>
				</div>
			<?php } ?>

			<?php if (isset($customer)) { ?>
				<div id="custom-customer">
					<?php echo $customer; ?>
				</div>
			<?php } ?>



            <?php if (isset($payment)) { ?>
				<div id="custom-payment">
					<?php echo $payment; ?>
				</div>
			<?php } ?>

			<?php if (isset($comment) && $comment !== false) { ?>
				<div id="custom-comment">
					<?php echo $comment; ?>
				</div>
			<?php } ?>

		</div>

		<div class="col-sm-6">

			<?php echo $column_right; ?>
             <? $module = false; ?>
			<?php if (isset($module) && $module !== false) { ?>
				<div id="custom-module">
					<?php echo $module; ?>
				</div>
			<?php } ?>
           <?php if (isset($shipping) && $shipping !== false) { ?>
				<div id="custom-shipping">
					<?php echo $shipping; ?>
				</div>
			<?php } ?>
			<?php if (isset($total) && $total !== false) { ?>
				<div id="custom-total">
					<?php echo $total; ?>
				</div>
			<?php } ?>
			
		</div>

	</div>

	<?php if (isset($payment)) { ?>
		<?php if ($text_agree) { ?>
			<div class="buttons" id="custom-control">
			  <div class="pull-right"><?php echo $text_agree; ?>
			    <?php if ($agree) { ?>
			    <input type="checkbox" name="agree" value="1" checked="checked" />
			    <?php } else { ?>
			    <input type="checkbox" name="agree" value="1" />
			    <?php } ?>
			    &nbsp;
			    <input type="button" value="<?php echo $button_continue; ?>" id="button-custom-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
			  </div>
			  <div class="clearfix"></div>
			</div>
			<?php } else { ?>
			<div class="buttons">
			  <div class="pull-right">
			    <input type="button" value="<?php echo $button_continue; ?>" id="button-custom-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
			  </div>
			  <div class="clearfix"></div>
			</div>
		<?php } ?>
	<?php } ?>	

	<?php echo $content_bottom; ?>

	<div id="custom-confirm" style="display: none;"></div>
	
</div> 

<script>
  
$(document).ready(function($) {

  $('#button-custom-order').on('click', function(){

  	<?php if (!$logged) { ?>

			checkoutCustomer()
					<?php if (isset($login) && $login !== false) { ?>
					.then( () => checkoutLogin() )
				<?php } ?>
				<?php if (isset($shipping) && $shipping !== false) { ?>
					.then( () => checkoutShipping() )
				<?php } ?>
					.then( () => checkoutPayment() )
				<?php if (isset($comment) && $comment !== false) { ?>
					.then( () => checkoutComment() )
				<?php } ?>
					.then( () => checkoutConfirm() )
					.catch(failureCallback);

  	<?php } else { ?>

  		<?php if (isset($shipping) && $shipping !== false) { ?>

  			checkoutShipping()
  				.then( () => checkoutPayment() )
  				<?php if (isset($comment) && $comment !== false) { ?>
						.then( () => checkoutComment() )
					<?php } ?>
					.then( () => checkoutConfirm() )
					.catch(failureCallback);

  		<?php } else { ?>

  			checkoutPayment()
  				<?php if (isset($comment) && $comment !== false) { ?>
						.then( () => checkoutComment() )
					<?php } ?>
					.then( () => checkoutConfirm() )
					.catch(failureCallback);


  		<?php } ?>	

  	<?php } ?>


    

  });

});
  
</script>

<?php echo $footer; ?>