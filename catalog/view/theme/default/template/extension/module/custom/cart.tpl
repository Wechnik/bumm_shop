<?php if (!empty($products)) { ?>
<h2><?= $heading_cart ?></h2>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
        <tr>
          <?php foreach($setting['column'] as $column) { ?>
              <td class="text-center"><?= ${'column_'.$column} ?></td>
          <?php } ?>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($products as $product) { ?>
        <tr>

          <?php foreach($setting['column'] as $column) { ?>

            <?php if ($column === 'image') { ?>
              <td class="text-center"><?php if ($product['thumb']) { ?><a data-hpm-href="1" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a><?php } ?></td>
            <?php } ?>

            <?php if ($column === 'name') { ?>
              <td class="text-left"><a data-hpm-href="1" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
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
            <?php } ?>

            <?php if ($column === 'model') { ?>
              <td class="text-left"><?php echo $product['model']; ?></td>
            <?php } ?>

            <?php if ($column === 'sku') { ?>
              <td class="text-left"><?php echo $product['sku']; ?></td>
            <?php } ?>

            <?php if ($column === 'quantity') { ?>
              <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
              <input type="text" data-cart-id="<?php echo $product['cart_id']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
              </div></td>
            <?php } ?>

            <?php if ($column === 'price') { ?>
              <td class="text-right"><?php echo $product['price']; ?></td>
            <?php } ?>

            <?php if ($column === 'total') { ?>
              <td class="text-right"><?php echo $product['total']; ?></td>
            <?php } ?>

            <?php if ($column === 'remove') { ?>
              <td class="text-left">
                 <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="custom_cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button>
              </td>
            <?php } ?>

          <?php } ?>

        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</form>
<script>
  document.querySelectorAll('input[name^=quantity]').forEach(function(input){
    input.addEventListener('input', function(event){
      custom_cart.update(event.target.dataset.cartId, event.target.value);
    });
  });
</script>
<?php } ?>
