<?php /**/ ?>
<script>
var hpmodel = {
    copy: {
        <?php if ($replace_desc) { ?>
        '#tab-description div[itemprop="description"]': '',
        <?php } ?>
        <?php if ($replace_att) { ?>
        '#tab-specification': '',
        <?php } ?>
        <?php if ($replace_image) { ?>
        '#content .product-image-slider': '',
        <?php } ?>
        <?php if ($replace_h1) { ?>
        'h1': '',
        '.breadcrumb': '',
        '#tab-description h3': '',
        <?php } ?>
        '#product': '',
        '#content .btn-group:eq(0)': '',
        '#tab-description > div.text-center': '',
        '#image-addon': '',
        '#content .product-points:eq(0)': '',
        '#content .product-points:eq(1)': '',
    },
    rest: {
        <?php if ($replace_att) { ?>
        '.product_informationss > ul .rating': '',
        <?php } ?>
    },
    input: {
        //'#product input[name="quantity"]': 'change',
    },
};
function hmodel_onchange() {
  <?php if ($replace_image) { ?>
    var fadeStatus = (window.innerWidth < 992) ? true : false;
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        infinite: true,
        dots: fadeStatus,
        fade: false,
        focusOnSelect: true,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        asNavFor: '.slider-for',
        dots: false,
        vertical: true,
        verticalSwiping: true,
        focusOnSelect: true,
        prevArrow: '<i class="fa fa-angle-up"></i>',
        nextArrow: '<i class="fa fa-angle-down"></i>',
        responsive: [{
            breakpoint: 450,
            settings: {
                slidesToShow: 3
            }
        }, {
            breakpoint: 576,
            settings: {
                slidesToShow: 3
            }
        }, {
            breakpoint: 768,
            settings: {
                slidesToShow: 3
            }
        }, {
            breakpoint: 992,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 1460,
            settings: {
                slidesToShow: 5
            }
        }]
    });
  <?php } ?>
}
</script>
