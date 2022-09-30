<h3><?php echo $heading_title; ?></h3>
<div class="row product-layout">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3s col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a target="_blank" href="<?php echo $product['href']; ?>" data-hpm-href="1"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <?php echo !empty($product['hpm_block']) ? $product['hpm_block'] : ''; ?>
        <div class="caption">
        <p><a href="<?php echo $product['href']; ?>" data-hpm-href="1"><?php echo $product['name']; ?></a></p>
        <p class="price"><?php echo $product['price']; ?></p>
      </div>
    </div>
  </div>
  <?php } ?>
  <img src="<?php echo $tracking_pixel; ?>" height="0" width="0" />
</div>