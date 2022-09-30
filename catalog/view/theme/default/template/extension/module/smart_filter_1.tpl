<link href="catalog/view/javascript/jquery/slick-slider/slick.css" rel="stylesheet">
<link href="catalog/view/javascript/jquery/slick-slider/slick-theme.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/slick-slider/slick.min.js"></script>

<div class="smart-filter-module">
    <div class="smartfilter-heading text-center">Выберите ваш автомобиль</div>
    <div class="text-center smart-filter-header">
        <div class=" text-center car-year">
            <select name="car_year" id="car_year">
                <option value="">Год</option>
                <?php foreach ($all_car_years as $car_year) { ?>
                    <option value="<?php echo $car_year['car_year']; ?>" <?php echo $car_year['car_year'] == $car ? 'selected="selected"' : false; ?>><?php echo $car_year['car_year']; ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="text-center car-mark">
            <select name="car_mark" id="car_mark">
                <option value="">Марка</option>
                <?php foreach ($marks as $mark) { ?>
                    <option value="<?php echo $mark['car_mark_id']; ?>" <?php echo $mark['car_mark_id'] == $mark_id ? 'selected="selected"' : false; ?>><?php echo $mark['car_mark']; ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="text-center car-model">
            <select name="car_model" id="car_model">
                <option value="">Модель</option>
                <?php foreach ($models as $model) { ?>
                    <option value="<?php echo $model['car_model_id']; ?>" <?php echo $model['car_model_id'] == $model_id ? 'selected="selected"' : false; ?>><?php echo $model['car_model']; ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="text-center car-generation">
            <select name="car_generation" id="car_generation">
                <option value="">Поколение</option>
                <?php foreach ($generations as $generation) { ?>
                    <option value="<?php echo $generation['car_generation_id']; ?>" <?php echo $generation['car_generation_id'] == $generation_id ? 'selected="selected"' : false; ?>><?php echo $generation['car_generation']; ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="btn-wrapper">
            <button class="btn btn-block btn-primary smart-filter-button">Поиск</button>
        </div>
    </div>

</div>
<?php if ($categories) { ?>
    <?php if (!$smart_page) { ?>
        <div class="row tabs-categories">
            <ul class="nav nav-tabs text-center">
                <?php $counter = 0; ?>
                <?php foreach ($categories as $cat_key => $category) { ?>
                    <?php if ($category['children']) { ?>
                        <li <?php if ($counter == 0) { echo 'class="active"'; } ?> >
                            <a href="#tab-<?php echo $category['translate_name']; ?>"
                                 data-toggle="tab"><?php echo $category['name']; ?>
                            </a>
                        </li>
                        <?php $counter++; ?>
                    <?php } ?>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <?php $counter = 0; ?>
                <?php foreach ($categories as $cat_key => $category) { ?>
                    <?php if ($category['children']) { ?>
                        <div class="tab-pane fade in <?php if ($counter == 0) { echo 'active'; } ?>"
                             id="tab-<?php echo $category['translate_name']; ?>">
                            <div class="row catalog-sub">
                                <?php foreach ($category['children'] as $cat_children) { ?>
                                    <?php if ($category['thumb']) { ?>
                                        <div class="text-center col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                            <a href="<?php echo $cat_children['href']; ?>">
                                                <img src="<?php echo $cat_children['thumb']; ?>"
                                                     alt="<?php echo $cat_children['name']; ?>"
                                                     title="<?php echo $cat_children['name']; ?>"
                                                     class="img-responsive center-block"/>
                                                <div class="btn btn-sm btn-link" href="<?php echo $cat_children['href']; ?>">
                                                    <?php echo $cat_children['name']; ?>
                                                </div>
                                            </a>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                            <?php if ($smart_page && $category['products']) { ?>
                                <div class="filtered-cat-prods">
                                    <?php foreach ($category['products'] as $key => $product) { ?>
                                        <div class="product-layout product-grid">
                                            <div class="product-thumb">
                                                <div class="image">
                                                    <?php if ($product['stickers']) { ?>
                                                        <div class="stickers">
                                                            <?php foreach ($product['stickers'] as $sticker) { ?>
                                                                <div class="sticker text-left sticker-<?php echo $sticker['type']; ?>">
                                                                    <span class="fa-stack fa-<?php echo $moneymaker2_stickers_size_catalog; ?>"
                                                                            <?php if (!$moneymaker2_stickers_mode) { ?>data-toggle="tooltip" data-placement="right"
                                                                            title="<?php echo strip_tags($sticker['caption']); ?>"<?php } ?>>
                                                                      <i class="fa fa-circle fa-stack-2x"></i>
                                                                      <i class="fa fa-<?php echo $sticker['icon']; ?> fa-stack-1x fa-inverse"></i>
                                                                    </span><?php if ($moneymaker2_stickers_mode) { ?>
                                                                        <div class="tooltip right in">
                                                                        <div class="tooltip-arrow"></div>
                                                                        <div class="tooltip-inner"><?php echo $sticker['caption']; ?></div>
                                                                    </div><?php } ?>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                    <?php } ?>
                                                    <?php if ($product['rating']) { ?>
                                                        <div class="rating">
                                                            <?php for ($i = 5; $i >= 1; $i--) { ?>
                                                                <?php if ($product['rating'] < $i) { ?>
                                                                    <i class="fa fa-star"></i>
                                                                <?php } else { ?>
                                                                    <i class="fa fa-star active"></i>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </div>
                                                    <?php } ?>
                                                    <a data-hpm-href="1" href="<?php echo $product['href']; ?>"><img
                                                                src="<?php echo $product['thumb']; ?>"
                                                                alt="<?php echo $product['name']; ?>"
                                                                title="<?php echo $product['name']; ?>"
                                                                class="img-responsive"/>
                                                    </a>
                                                </div>
                                                <div>
                                                    <div class="caption">
                                                        <a data-hpm-href="1" href="<?php echo $product['href']; ?>"<?php if ($product['special']) { ?> class="text-special"<?php } ?>><?php echo $product['name']; ?></a>
                                                    </div>
                                                    <?php if ($moneymaker2_common_price_detached) { ?>
                                                        <div class="price-detached">
                                                            <small><?php if ($product['price']) { ?><span
                                                                        class="price text-muted"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?>
                                                                    <span class="price-new">
                                                                    <b><?php echo $product['special']; ?></b></span>
                                                                    <span class="price-old"><?php echo $product['price']; ?></span><?php } ?>
                                                                    </span><?php } ?><?php if ($product['tax']) { ?>
                                                                    <br/><span
                                                                            class="price-tax text-muted"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span><?php } ?>
                                                            </small>
                                                        </div>
                                                    <?php } ?>
                                                    <div class="btn-group btn-group-sm">
                                                        <?php if (!$moneymaker2_common_buy_hide) { ?>
                                                            <button type="button" data-toggle="tooltip" data-html="true"
                                                                    data-placement="bottom"
                                                                    title="<?php echo $product['addtocart_tooltip']; ?>"
                                                                    class="<?php echo $product['addtocart_class']; ?>"
                                                                    <?php if (!$product['sold']) { ?>onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"<?php } ?>>
                                                                <i class="fa fa-fw fa-shopping-cart"></i> <?php if (!$moneymaker2_common_price_detached && $product['price']) { ?>
                                                                    <span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?>
                                                                        <span class="price-new"><?php echo $product['special']; ?></span><?php } ?>
                                                                    </span><?php } else { ?><?php echo $button_cart; ?><?php } ?>
                                                            </button>
                                                        <?php } ?>
                                                        <?php if ($moneymaker2_modules_quickorder_enabled && $moneymaker2_modules_quickorder_display_catalog) { ?>
                                                            <div class="<?php echo $product['quickorder_class']; ?>"
                                                                 <?php if (!$product['sold']) { ?>data-toggle="modal"
                                                                 data-target="#orderModal" data-order-mode="catalog"
                                                                 data-order-product-id="<?php echo $product['product_id']; ?>"
                                                                 data-order-title="<?php echo $product['name']; ?>"
                                                                 data-order-img-src="<?php echo $product['thumb']; ?>"
                                                                 data-order-price="<?php if ($product['quickorder_tax']) echo $text_tax; ?><?php if (!$product['special']) { ?><?php echo $product['price']; ?><?php } else { ?><?php echo $product['special']; ?><?php } ?>"<?php } ?>>
                                                                <span data-toggle="tooltip" data-html="true"
                                                                      data-placement="bottom"
                                                                      title="<?php echo $product['quickorder_tooltip']; ?>"><i
                                                                            class="fa fa-fw fa-send"></i></span></div>
                                                        <?php } ?>
                                                        <?php if (!$moneymaker2_common_wishlist_hide) { ?>
                                                        <button type="button"
                                                                class="btn btn-default"
                                                                <?php if (!$moneymaker2_common_wishlist_caption) { ?>data-toggle="tooltip"
                                                                data-placement="bottom"
                                                                <?php } ?>title="<?php echo $button_wishlist; ?>"
                                                                onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                            <i class="fa fa-fw fa-heart"></i><?php if ($moneymaker2_common_wishlist_caption) { ?><?php echo $button_wishlist; ?><?php } ?>
                                                            </button><?php } ?>
                                                        <?php if (!$moneymaker2_common_compare_hide) { ?>
                                                        <button type="button"
                                                                class="btn btn-default"
                                                                <?php if (!$moneymaker2_common_compare_caption) { ?>data-toggle="tooltip"
                                                                data-placement="bottom"
                                                                <?php } ?>title="<?php echo $button_compare; ?>"
                                                                onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                            <i class="fa fa-fw fa-area-chart"></i><?php if ($moneymaker2_common_compare_caption) { ?><?php echo $button_compare; ?><?php } ?>
                                                            </button><?php } ?>
                                                    </div>
                                                    <?php if (!$moneymaker2_common_price_detached && $product['price'] && $product['tax']) { ?>
                                                        <div class="price-tax">
                                                        <small class="text-muted"><?php echo $text_tax; ?><?php echo $product['tax']; ?></small>
                                                        </div><?php } ?>
                                                    <div class="additional"><?php echo $product['stock']; ?><?php echo $product['code']; ?></div>
                                                    <div class="description"><?php echo $product['description']; ?></div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>

                                </div>
                            <?php } ?>
                        </div>
                        <?php $counter++; ?>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    <?php } else { ?>
        <div class="row tabs-categories">
            <ul class="nav nav-tabs text-center product-page-tabs">
                <?php $counter = 0; ?>
                <?php foreach ($categories as $cat_key => $category) { ?>
                    <li <?php if ($counter == 0) { echo 'class="active"'; } ?> >
<!--	                    <div>-->
<!--	                    </div>-->
	                    <img src="<?php echo $category['categories']['cat_image']; ?>"
	                         alt="<?php echo $category['categories']['cat_name']; ?>"
	                         title="<?php echo $category['categories']['cat_name']; ?>"
	                         class="img-responsive "/>
                        <a href="#tab-<?php echo $category['categories']['cat_tab_name']; ?>" data-toggle="tab">
                            <?php echo $category['categories']['cat_name']; ?>
                        </a>
                    </li>
                    <?php $counter++; ?>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <?php $counter = 0; ?>
                <?php foreach ($categories as $cat_key => $category) { ?>
	                    <div class="tab-pane fade in <?php if ($counter == 0) { echo 'active'; } ?>" id="tab-<?php echo $category['categories']['cat_tab_name']; ?>">
	                        <?php if ($category['cat_prods']) { ?>
		                            <h4 class="smart-cat-name"><?php echo $category['categories']['cat_name']; ?></h4>
		                        <h4 class="smart-cat-arrow"><a href="<?= $category['categories']['cat_href']; ?>"><i class="fa fa-arrow-right hidden-md hidden-lg"></i></a></h4>
		                            <div class="clearfix"></div>
		                            
		                        <div class="filtered-cat-prods<?= $category['categories']['cat_tab_name']; ?>">
				                            <?php foreach ($category['cat_prods'] as $key => $product) { ?>
			                                    <div class="product-layout product-grid ">
			                                        <div class="product-thumb">
			                                            <div class="image">
			                                                <?php if ($product['rating']) { ?>
			                                                    <div class="rating">
			                                                        <?php for ($i = 5; $i >= 1; $i--) { ?>
			                                                            <?php if ($product['rating'] < $i) { ?>
			                                                                <i class="fa fa-star"></i>
			                                                            <?php } else { ?>
			                                                                <i class="fa fa-star active"></i>
			                                                            <?php } ?>
			                                                        <?php } ?>
			                                                    </div>
			                                                <?php } ?>
			                                                <a data-hpm-href="1" href="<?php echo $product['href']; ?>" >
			                                                    <img src="<?php echo $product['preview']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive "/>
			                                                </a>
			                                            </div>
			                                            <div class="bottom flex fl-wrap fl-ai-center">
			                                                <div class="caption">
				                                                <img src="<?php echo $product['thumb']; ?>" class="img-responsive product-preview"/>
			                                                    <a data-hpm-href="1" href="<?php echo $product['href']; ?>" class="product-description">
			                                                        <?php echo $product['name']; ?>
			                                                    </a>
			                                                </div>
			                                                <div class="price-detached">
			                                                    <?php if ($product['price']) { ?>
			                                                        <span class="price"><?php if (!$product['special']) { ?><?php echo $product['price']; ?>
					                                                        <?php } else { ?>
			                                                                <span class="price-new">
			                                                                    <b>
			                                                                        <?php echo $product['special']; ?>
			                                                                    </b>
			                                                                </span>
			                                                                <span class="price-old">
			                                                                    <?php echo $product['price']; ?>
			                                                                </span>
			                                                            <?php } ?>
			                                                        </span>
			                                                    <?php } ?>
			                                                    <?php if ($product['tax']) { ?>
			                                                        <br/>
			                                                        <span class="price-tax text-muted">
			                                                            <?php echo $text_tax; ?><?php echo $product['tax']; ?>
			                                                        </span>
			                                                    <?php } ?>
			                                                </div>
				
				                                            <div class="btn-group btn-group-sm">
					                                            <button type="button" class="btn btn-default wishlist-button" data-placement="bottom" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></button>
				                                            </div>
			                                            </div>
			                                        </div>
			                                    </div>
			                                <?php } ?>
			
			                            
	                            </div>
	                        <?php } ?>
	                    </div>
	                <script>
		                $('.filtered-cat-prods<?= $category['categories']['cat_tab_name']; ?>').slick({
			                dots: true,
			                infinite: true,
			                speed: 300,
			                slidesToShow: 1,
			                centerMode: true,
			                variableWidth: false
		                });
		                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			                $('.filtered-cat-prods<?= $category['categories']['cat_tab_name']; ?>').slick('setPosition');
		                });
	                </script>
                    <?php $counter++; ?>
                <?php } ?>
            </div>
        </div>
    <?php } ?>
<?php } ?>



<script type="text/javascript">
    $('#car_year').on('change', function () {
        var carYearId = this.value;
        $.ajax({
            url: 'index.php?route=extension/module/smart_filter/get_mark',
            type: 'post',
            data: {car_year_id: carYearId},
            dataType: 'json',
            success: function (json) {
                var html = '';
                if (json) {

                    html += '<select name="car_mark" id="car_mark" class="">';
                    html += '<option value="">Марка</option>';
                    json.forEach(function (element) {
                        html += '  <option value="' + element.car_mark_id + '">' + element.car_mark + '</option>';
                    });
                    html += '</select>';

                }
                $('.car-mark').html(html);
                $('#car_mark').niceSelect().next().addClass('open');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $(document).delegate('#car_mark', 'change', function () {
        var carYearId = $("#car_year").find(" option:selected").val();
        var carMarkId = $("#car_mark").find("option:selected").val();
        $.ajax({
            url: 'index.php?route=extension/module/smart_filter/get_model',
            type: 'post',
            data: {car_year_id: carYearId, car_mark_id: carMarkId},
            dataType: 'json',
            success: function (json) {
                var html = '';
                if (json) {
                    html += '<select name="car_model" id="car_model" class="">';
                    html += '<option value="">Модель</option>';
                    json.forEach(function (element) {
                        html += '  <option value="' + element.car_model_id + '">' + element.car_model + '</option>';
                    });
                    html += '</select>';

                }
                $('.car-model').html(html);
                $('#car_model').niceSelect().next().addClass('open');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $(document).delegate('#car_model', 'change', function () {
        var carYearId = $("#car_year").find("option:selected").val();
        var carMarkId = $("#car_mark").find("option:selected").val();
        var carModelId = $("#car_model").find("option:selected").val();

        $.ajax({
            url: 'index.php?route=extension/module/smart_filter/get_generation',
            type: 'post',
            data: {car_year_id: carYearId, car_mark_id: carMarkId, car_model_id: carModelId},
            dataType: 'json',
            success: function (json) {
                var html = '';
                if (json) {
                    html += '<select name="car_generation" id="car_generation" class="">';
                    html += '<option value="">Поколение</option>';
                    json.forEach(function (element) {
                        html += '  <option value="' + element.car_generation_id + '">' + element.car_generation + '</option>';
                    });
                    html += '</select>';

                }

                $('.car-generation').html(html);
                $('#car_generation').niceSelect().next().addClass('open');

                console.log(json);


                if (json.length == 0) {
                    var carYearId = $("#car_year").find("option:selected").val();
                    var carMarkId = $("#car_mark").find("option:selected").val();
                    var carModelId = $("#car_model").find("option:selected").val();

                    if (carYearId != '' && carMarkId != '' && carModelId != '') {
                        document.location.href = 'index.php?route=product/smartfilter&car=' + carYearId + '&mark=' + carMarkId + '&model=' + carModelId;
                    }
                } else if (json.length == 1) {
                    var carYearId = $("#car_year").find("option:selected").val();
                    var carMarkId = $("#car_mark").find("option:selected").val();
                    var carModelId = $("#car_model").find("option:selected").val();
                    var carGenerationId = json[0].car_generation_id;

                    //$(".smart-filter-module .smart-filter-button").css("display", "inline-block");
                    $(".smart-filter-module .smart-filter-button").removeAttr('disabled');
                    if (carYearId != '' && carMarkId != '' && carModelId != '') {
                        document.location.href = 'index.php?route=product/smartfilter&car=' + carYearId + '&mark=' + carMarkId + '&model=' + carModelId + '&generation=' + carGenerationId;
                    }
                }

            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    $(document).delegate('#car_generation', 'change', function () {

        if ($('#car_generation').val() != '') {
            var carYearId = $("#car_year").val();
            var carMarkId = $("#car_mark").val();
            var carModelId = $("#car_model").val();
            var carGenerationId = $("#car_generation").val();

            document.location.href = 'index.php?route=product/smartfilter&car=' + carYearId + '&mark=' + carMarkId + '&model=' + carModelId + '&generation=' + carGenerationId;

        }
    });

    $('.smart-filter-button').on('click', function () {

        var carYearId = $('#car_year').val();
        var carMarkId = $('#car_mark').val();
        var carModelId = $('#car_model').val();
        var carGenerationId = $('#car_generation').val();

        if (carYearId != '' && carMarkId != '' && carModelId != '') {
            document.location.href = 'index.php?route=product/smartfilter&car=' + carYearId + '&mark=' + carMarkId + '&model=' + carModelId + '&generation=' + carGenerationId;
        }

    });

    $('.smart-filter-reset-button').on('click', function () {
        document.location.href = 'index.php?route=common/home';
    });

    $(document).ready(function () {
        $('#car_year').niceSelect();
        $('#car_mark').niceSelect();
        $('#car_model').niceSelect();
        $('#car_generation').niceSelect();
    });

</script>