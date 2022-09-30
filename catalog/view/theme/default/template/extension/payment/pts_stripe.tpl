<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm ?>" id="button-confirm" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	var stripe = Stripe("<?php echo $publishable_key; ?>");
	stripe.redirectToCheckout({
	  // Make the id field from the Checkout Session creation API response
	  // available to this file, so you can provide it as parameter here
	  sessionId: "<?php echo $session_id; ?>"
	}).then(function (result) {
	  // If `redirectToCheckout` fails due to a browser or network
	  // error, display the localized error message to your customer
	  // using `result.error.message`.
	});
});
//--></script>