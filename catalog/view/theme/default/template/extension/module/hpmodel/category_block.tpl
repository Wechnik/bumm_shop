<?php if ($products) { ?>
<div class="hpm-cat-box" <?php echo !empty($thumb) && !empty($replace_image) ? 'data-thumb="'.$thumb.'"': ''; ?>>
  <?php if (!empty($title)) { ?><div class="hpm-cat-title"><?php echo $title; ?></div><?php } ?>
  <?php if ($variant == 'type_images') { ?>
  <div class="hpm-cat-content hpm-type-images">
    <?php foreach ($products as $product) { ?>
    <div class="hpm-cat-item <?php if ($product['product_id'] == $product_id) { ?>active<?php } ?>" data-id="<?php echo $product['product_id']; ?>" data-data-hpm-href="1" href="<?php echo $product['href']; ?>" <?php if ($replace_h1) { ?>data-name="<?php echo $product['name']; ?>"<?php } ?> <?php echo !empty($product['thumb']) && !empty($replace_image) ? 'data-thumb="'.$product['thumb'].'"': ''; ?> <?php if (!empty($product['price'])) { ?>data-price="<?php echo $product['price']; ?>"<?php } ?> <?php if (!empty($product['special'])) { ?>data-special="<?php echo $product['special']; ?>"<?php } ?> data-qty="<?php echo $product['quantity']; ?>" <?php echo (float)$product['price_value'] ? 'data-price-value="'.$product['price_value'].'"': ''; ?> <?php echo (float)$product['special_value'] ? 'data-special-value="'.$product['special_value'].'"': ''; ?>>
      <?php foreach ($product['view'] as $column => $value) { ?>
      <div class="hpm-col-<?php echo $column; ?>"><?php echo $value; ?></div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($variant == 'type_select') { ?>
  <div class="hpm-cat-content hpm-type-select">
    <select class="form-control">
      <?php foreach ($products as $product) { ?>
      <option <?php if ($product['product_id'] == $product_id) { ?>selected="selected"<?php } ?> data-id="<?php echo $product['product_id']; ?>" data-data-hpm-href="1" href="<?php echo $product['href']; ?>" <?php if ($replace_h1) { ?>data-name="<?php echo $product['name']; ?>"<?php } ?> <?php echo !empty($product['thumb']) && !empty($replace_image) ? 'data-thumb="'.$product['thumb'].'"': ''; ?> <?php if (!empty($product['price'])) { ?>data-price="<?php echo $product['price']; ?>"<?php } ?> <?php if (!empty($product['special'])) { ?>data-special="<?php echo $product['special']; ?>"<?php } ?> data-qty="<?php echo $product['quantity']; ?>" <?php echo (float)$product['price_value'] ? 'data-price-value="'.$product['price_value'].'"': ''; ?> <?php echo (float)$product['special_value'] ? 'data-special-value="'.$product['special_value'].'"': ''; ?>><?php echo $product['view_text']; ?></option>
      <?php } ?>
    </select>
  </div>
  <?php } ?>
  <?php if ($variant == 'type_html_select') { ?>
  <div class="hpm-cat-content hpm-type-html-select">
    <div class="hpm-select">
      <div class="selected">
        <?php $has_product = false; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($product['product_id'] == $product_id) { ?>
        <?php $has_product = true; ?>
        <div class="hpm-select-item hpm-cat-item">
          <?php foreach ($product['view'] as $column => $value) { ?>
          <div class="hpm-col-<?php echo $column; ?>"><?php echo $value; ?></div>
          <?php } ?>
        </div>
        <?php } ?>
        <?php } ?>
        <?php if (!$has_product) { ?>
        <div class="hpm-select-item hpm-cat-item">
          <div class="hpm-col-none"><?php echo $text_select; ?></div>
        </div>
        <?php } ?>
      </div>
      <div class="drop-down" style="display:none;">
        <?php foreach ($products as $product) { ?>
        <div class="hpm-select-item hpm-cat-item <?php if ($product['product_id'] == $product_id) { ?>active<?php } ?>" data-id="<?php echo $product['product_id']; ?>" data-data-hpm-href="1" href="<?php echo $product['href']; ?>" <?php if ($replace_h1) { ?>data-name="<?php echo $product['name']; ?>"<?php } ?> <?php echo !empty($product['thumb']) && !empty($replace_image) ? 'data-thumb="'.$product['thumb'].'"': ''; ?> <?php if (!empty($product['price'])) { ?>data-price="<?php echo $product['price']; ?>"<?php } ?> <?php if (!empty($product['special'])) { ?>data-special="<?php echo $product['special']; ?>"<?php } ?> data-qty="<?php echo $product['quantity']; ?>" <?php echo (float)$product['price_value'] ? 'data-price-value="'.$product['price_value'].'"': ''; ?> <?php echo (float)$product['special_value'] ? 'data-special-value="'.$product['special_value'].'"': ''; ?>>
          <?php foreach ($product['view'] as $column => $value) { ?>
          <div class="hpm-col-<?php echo $column; ?>"><?php echo $value; ?></div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php } ?>
