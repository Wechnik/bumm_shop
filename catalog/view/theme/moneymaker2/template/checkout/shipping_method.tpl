<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<p><strong><?php echo $shipping_method['title']; ?></strong></p>
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
    <?php } ?>
    <?php echo $quote['title']; ?>
      <?php /*CDEK OCMOD START*/ if (isset($quote['description'])) { ?>
          <?php echo $quote['description']; ?>
      <?php } /*CDEK OCMOD END*/ ?>
      - <?php echo $quote['text']; ?>
    <?php if (isset($quote['description'])) { ?>
    <br /><small><?php echo $quote['description']; ?></small>
    <?php } ?>
    </label>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--
  $(document).ready(function() {
    <?php if ($error_warning) { ?>
      $('#popupModal .modal-header .close').removeClass('hidden');
      //$('#popupModal .modal-title').text('<?php echo $heading_title; ?>');
      $('#popupModal .modal-body').prepend('<div class="panel panel-danger"><div class="panel-heading text-center"><small><?php echo $error_warning; ?></small></div></div>');
      $('#popupModal').modal();
    <?php } ?>
  });
  //--></script>

