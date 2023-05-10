<div id="popupCart">
<ul>
<?php if ($products1 || $vouchers1) { ?>
    <li>
      <table class="table">
        <?php foreach ($products1 as $key => $shipps) { ?>
            <tr>
                <td colspan=5><?php echo $shippings[$key]; ?></td>
            </tr>
            <?php foreach($shipps as $product){ ?>    
                <tr>
                  <td class="text-center" style="width: 25%;"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                    <?php } ?></td>
                  <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php if ($product['option']) { ?>
                    <?php foreach ($product['option'] as $option) { ?>
                    <br />
                    - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                    <?php } ?>
                    <?php } ?>
                    <?php if ($product['recurring']) { ?>
                    <br />
                    - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                    <?php } ?></td>
                  <td class="text-right">x&nbsp;<?php echo $product['quantity']; ?></td>
                  <td class="text-right text-nowrap"><?php echo $product['total']; ?></td>
                  <td class="text-center"><a href="javascript:void(0);" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="text-muted"><i class="fa fa-lg fa-times-circle"></i></a></td>
                </tr>
            <?php } ?>
        <?php } ?>
        <?php foreach ($vouchers1 as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right text-nowrap"><?php echo $voucher['amount']; ?></td>
          <td class="text-center"><a href="javascript:void(0);" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="text-muted"><i class="fa fa-lg fa-times-circle"></i></a></td>
        </tr>
        <?php } ?>
        <?php foreach ($totals1 as $total) { ?>
        <tr>
          <td></td>
          <td class="text-left"><?php echo $total['title']; ?></td>
          <td></td>
          <td class="text-right text-nowrap"><?php echo $total['text']; ?></td>
          <td></td>
        </tr>
        <?php } ?>
        <tr><td colspan="5" class="modal-cart-info"></td></tr>
          <tr>
              <td class="continue-shopping" colspan="2"><p><a type="button" class="btn btn-default btn-shopping" data-dismiss="modal">Продолжить покупки</a></p></td>
              <td class="continue-shopping" colspan="1"></td>
              <td class="checkout-order" colspan="2"><p><a class="btn btn-primary" href="<?php echo $checkout; ?>"><i class="fa fa-share"></i> <?php echo $text_checkout; ?></a><?php if ($moneymaker2_modules_quickorder_enabled&&$moneymaker2_modules_quickorder_display_popupcart) { ?><a class="btn btn-link" data-toggle="modal" data-target="#orderModal" data-order-mode="cart" data-order-product-id="0" data-order-title="<?php echo $moneymaker2_modules_quickorder_button_title; ?>" data-order-img-src="0" data-order-price="<?php if (isset($totals)) echo $totals[count($totals)-1]['text']; ?>"><i class="fa fa-send"></i> <?php echo $moneymaker2_modules_quickorder_button_title; ?></a><?php } ?></p></td>
          </tr>

      </table>
        </div>
    </li>
    <li>
    </li>


    <?php } else { ?>
    <li>
      <?php if ($moneymaker2_header_cart_custom) { ?>
        <?php if ($moneymaker2_header_cart_image) { ?>
          <p class="text-center"><img src="<?php echo $moneymaker2_header_cart_image; ?>" alt="<?php echo $text_items; ?>" /></p>
        <?php } ?>
        <?php if ($moneymaker2_header_cart_link_enabled&&$moneymaker2_header_cart_link) { ?>
          <p class="text-center">
            <a href="<?php echo $moneymaker2_header_cart_link; ?>" class="btn btn-default"><i class="fa fa-<?php echo $moneymaker2_header_cart_link_icon; ?>"></i> <?php echo $moneymaker2_header_cart_link_title; ?></a>
          </p>
        <?php } ?>
        <p class="text-center"><?php echo $moneymaker2_header_cart_text; ?></p>
      <?php } else { ?>
        <p class="text-center"><?php echo $text_empty; ?></p>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>