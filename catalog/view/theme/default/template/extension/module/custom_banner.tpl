<div class="row custom-banner">
    <div class="col-md-12 hidden-xs hidden-sm">
        <?php switch ($image_style) {
            case 1:
        ?>
        <div class="col-md-4">
<!--            <div class="col-md-12">-->
                <img src="<?php echo $banner_images[0]['image']; ?>" style="height: <?php echo $banner_images[0]['height']; ?>px; width: <?php echo $banner_images[0]['width']; ?>px; padding-bottom: 5px; ">
<!--            </div>-->
<!--            <div class="col-md-12">-->
                <img src="<?php echo $banner_images[1]['image']; ?>" style="height: <?php echo $banner_images[1]['height']; ?>px; width: <?php echo $banner_images[1]['width']; ?>px; padding-top: 5px;">
<!--            </div>-->
        </div>
        <div class="col-md-4">
<!--            <div class="col-md-12">-->
                <img src="<?php echo $banner_images[2]['image']; ?>" style="height: <?php echo $banner_images[2]['height']; ?>px; width: <?php echo $banner_images[2]['width']; ?>px">
<!--            </div>-->
        </div>
        <div class="col-md-4">
<!--            <div class="col-md-12">-->
                <img src="<?php echo $banner_images[3]['image']; ?>" style="height: <?php echo $banner_images[3]['height']; ?>px; width: <?php echo $banner_images[3]['width']; ?>px; padding-bottom: 5px;">
<!--            </div>-->
<!--            <div class="col-md-12">-->
                <img src="<?php echo $banner_images[4]['image']; ?>" style="height: <?php echo $banner_images[4]['height']; ?>px; width: <?php echo $banner_images[4]['width']; ?>px; padding-top: 5px;">
<!--            </div>-->
        </div>
        <?php

                break;
            case 2:
        ?>
            <div class="col-md-6">
                <img src="<?php echo $banner_images[0]['image']; ?>" style="height: <?php echo $banner_images[0]['height']; ?>px; width: <?php echo $banner_images[0]['width']; ?>px">
            </div>
            <div class="col-md-6">
                <img src="<?php echo $banner_images[1]['image']; ?>" style="height: <?php echo $banner_images[1]['height']; ?>px; width: <?php echo $banner_images[1]['width']; ?>px">
            </div>
            <div class="col-md-12">
                <img src="<?php echo $banner_images[2]['image']; ?>" style="height: <?php echo $banner_images[2]['height']; ?>px; width: <?php echo $banner_images[2]['width']; ?>px">
            </div>
            <div class="col-md-6">
                <img src="<?php echo $banner_images[3]['image']; ?>" style="height: <?php echo $banner_images[3]['height']; ?>px; width: <?php echo $banner_images[3]['width']; ?>px">
            </div>
            <div class="col-md-6">
                <img src="<?php echo $banner_images[4]['image']; ?>" style="height: <?php echo $banner_images[4]['height']; ?>px; width: <?php echo $banner_images[4]['width']; ?>px">
            </div>
        <?php

                break;
            case 3:
        ?>
                <div class="col-md-3">
                    <img src="<?php echo $banner_images[0]['image']; ?>" style="height: <?php echo $banner_images[0]['height']; ?>px; width: <?php echo $banner_images[0]['width']; ?>px">
                </div>
                <div class="col-md-3">
                    <img src="<?php echo $banner_images[1]['image']; ?>" style="height: <?php echo $banner_images[1]['height']; ?>px; width: <?php echo $banner_images[1]['width']; ?>px">
                </div>
                <div class="col-md-3">
                    <img src="<?php echo $banner_images[2]['image']; ?>" style="height: <?php echo $banner_images[2]['height']; ?>px; width: <?php echo $banner_images[2]['width']; ?>px">
                </div>
                <div class="col-md-3">
                    <img src="<?php echo $banner_images[3]['image']; ?>" style="height: <?php echo $banner_images[3]['height']; ?>px; width: <?php echo $banner_images[3]['width']; ?>px">
                </div>
                <div class="col-md-9">
                    <img src="<?php echo $banner_images[4]['image']; ?>" style="height: <?php echo $banner_images[4]['height']; ?>px; width: <?php echo $banner_images[4]['width']; ?>px">
                </div>
        <?php

                break;
            case 4:
        ?>


        <?php
                break;
        }?>
    </div>
</div>
<style type="text/css">
    .custom-banner {
        margin-top: 35px;
    }
    .custom-banner .col-md-3 ,
    .custom-banner .col-md-4 ,
    .custom-banner .col-md-6 {
        padding-left: 5px;
        padding-right: 5px;
    }
</style>

<!--    <img src="--><?php //echo $banner_image; ?><!--" class="img-responsive" />-->
<!---->
<!--    --><?php //die; ?>
