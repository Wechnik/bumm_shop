<?php if(isset($products)){ ?>
       <table class="table">
            <thead>
              <tr>
                <td></td>
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $key => $shipps) { ?>
                <tr>
                    <td colspan=8><?php echo $shippings[$key]; ?></td>
                </tr>
                <?php foreach($shipps as $product){ ?>
                  <tr>
                    <td class="text-center"><input type="checkbox" <?php if(isset($_SESSION['product_id']) && $_SESSION['product_id'] == $product['cart_id'] ){?>checked="checked" <?php } ?> name="product_id[]" value="<?php echo $product['cart_id']?>"/></td>
                    <td class="text-center"><?php if ($product['thumb']) { ?>   
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                      <?php } ?></td>
                    <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <br />
                      <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                      <?php } ?>
                      <?php } ?>
                      <?php if ($product['reward']) { ?>
                      <br />
                      <small><?php echo $product['reward']; ?></small>
                      <?php } ?>
                      <?php if ($product['recurring']) { ?>
                      <br />
                      <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                      <?php } ?></td>
                    <td class="text-left"><?php echo $product['model']; ?></td>
                    <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                        <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                        <span class="input-group-btn">
                        <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-link"><i class="fa fa-refresh"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-link text-special" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                    <td class="text-right"><?php echo $product['price']; ?></td>
                    <td class="text-right"><?php echo $product['total']; ?></td>

     <!--</form>
           <form action="<?php echo $checkout; ?>" method="post" enctype="multipart/form-data">
     <td class="text-right"><button type="submit" class="btn btn-primary"><?php echo $button_checkout; ?></button></td>
       <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>"/>
            </form>
          -->      
              </tr>
              <?php } ?>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-link text-special" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
<?php } else { ?>
      <div class="row catalog-thumb">
        <div class="col-sm-12 text-center">
          <span class="fa-stack fa-2x img-thumbnail">
            <i class="fa fa-circle fa-stack-2x"></i>
            <i class="fa fa-times fa-stack-1x fa-inverse"></i>
          </span>
        </div>
      </div>
      <hr class="catalog-hr">
      <div class="row catalog-msg">
        <div class="col-sm-12 text-center">
          <p><?php echo $text_error; ?></p>
        </div>
      </div>
      <div class="buttons text-center">
        <a href="<?php echo $continue; ?>" class="btn btn-default"><i class="fa fa-fw fa-angle-right"></i><?php echo $button_continue; ?></a>
      </div>
      
<?php } ?>