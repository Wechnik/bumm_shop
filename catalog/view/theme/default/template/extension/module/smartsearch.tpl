<ul class="items">
    <?php foreach ($products as $product) { ?>
        <li class="item" search_name="<?php echo $product['search_name']; ?>">
            <div class="item_block">
                <?php if ($smartsearch_image) { ?>
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"></a></div>
                <?php } ?>
                <div class="title">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php if ($smartsearch_model) { ?>
                        <br><span><?php echo $text_model; ?> <?php echo $product['model']; ?></span>
                    <?php } ?>

                </div>
                <?php if ($smartsearch_price) { ?>
                    <?php if ($smartsearch_oldprice) { ?>
                        <div class="price">
                            <?php if ($product['special']) { ?>
                                <span class="oldprice"><?php echo $product['price']; ?></span> <?php echo $product['special']; ?>
                            <?php } else { ?>
                                <?php echo $product['price']; ?>
                            <?php } ?>
                        </div>
                    <?php } else { ?>
                        <div class="price">
                            <?php echo $product['special'] ? $product['special'] : $product['price']; ?>
                        </div>
                    <?php } ?>
                <?php } ?>
                </a>
            </div>
        </li>
    <?php } ?>
</ul>
<?php if ($smartsearch_button_all) { ?>
    <div class="button"><a href="<?php echo $button_all_href; ?>"><?php echo $button_all; ?></a></div>
<?php } ?>