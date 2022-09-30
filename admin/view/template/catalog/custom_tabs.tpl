<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="tab-description" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1>Тексты для товаров</h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="tab-description" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li><a href="#tab-product-description" data-toggle="tab">Текст описания</a></li>
                        <li><a class="active" href="#tab-product-tab" data-toggle="tab">Текста для таба</a></li>
                        <li><a href="#tab-product-tab-description" data-toggle="tab">Текст для после описания</a></li>
                        <li class="active"><a href="#tab-product-tab-categories" data-toggle="tab">Категории</a></li>
<!--                        <li><a href="#tab-product-tab-categories" data-toggle="tab">Категории</a></li>-->
                    </ul>
                    <div class="tab-content">

                        <div class="tab-pane" id="tab-product-description">
                            <div class="table-responsive">
                                <table id="product_description" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_product_description; ?></td>
                                        <td class="text-left"><?php echo $entry_text; ?></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $product_description_row = 0; ?>
                                    <?php foreach ($product_product_descriptions as $product_product_description) { ?>
                                        <tr id="product_description-row<?php echo $product_description_row; ?>">
                                            <td class="text-left" style="width: 40%;">
                                                <input type="text" name="product_product_description[<?php echo $product_description_row; ?>][name]" value="<?php echo $product_product_description['name']; ?>" placeholder="<?php echo $entry_product_description; ?>" class="form-control" />
                                                <input type="hidden" name="product_product_description[<?php echo $product_description_row; ?>][product_description_id]" value="<?php echo $product_product_description['product_description_id']; ?>" /></td>
                                            <td class="text-left"><?php foreach ($languages as $language) { ?>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                        <textarea id="input-description<?php echo $language['language_id']; ?><?php echo $product_description_row; ?>" name="product_product_description[<?php echo $product_description_row; ?>][product_product_description_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control">
                                                            <?php echo isset($product_product_description['product_product_description_description'][$language['language_id']]) ? $product_product_description['product_product_description_description'][$language['language_id']]['text'] : ''; ?>
                                                        </textarea>
                                                    </div>
                                                <?php } ?></td>

                                            <script type="text/javascript">
                                                ckeditorInit('input-description<?php echo $language['language_id']; ?><?php echo $product_description_row; ?>', getURLVar('token'));
                                                CKEDITOR.config.language = 'ru';
                                            </script>

                                            <td class="text-left"><button type="button" onclick="$('#product_description-row<?php echo $product_description_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                        </tr>
                                        <?php $product_description_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td class="text-left"><button type="button" onclick="addProductDescription();" data-toggle="tooltip" title="<?php echo $button_product_description_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>


                        <div class="tab-pane" id="tab-product-tab">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left">Название текста</td>
                                        <td class="text-left">Товары</td>
                                        <td class="text-left">Название вкладки</td>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <?php foreach ($product_product_descriptions as $product_product_description_k => $product_product_description) { ?>

                                    <tr>
                                        <td class="text-left col-md-3">
                                            <?php echo $product_product_description['name']; ?>
                                        </td>
                                        <td class="text-left col-md-5">

                                                <input type="text" name="checked_tab<?php echo $product_product_description['product_description_id']; ?>"
                                                       value="" class="form-control input-product-tabs-input" data-product-tab="1"
                                                       data-product-description-id="<?php echo $product_product_description['product_description_id']; ?>" />

                                                <div id="" class="well well-sm input-product-tabs" style="height: 150px; overflow: auto;">
                                                    <?php foreach ($products_tab as $product_k => $product) { ?>
                                                        <?php if (in_array($product['product_id'], $checked_tab_products[$product_product_description['product_description_id']])) { ?>
                                                            <div class="product-tab<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                                                                <input type="hidden" name="product_tab_select<?php echo $product_product_description['product_description_id']; ?>[]"
                                                                       value="<?php echo $product['product_id']; ?>" />
                                                            </div>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>

                                        </td>
                                        <td class="text-left col-md-4">
                                            <input type="text" name="product_tab_front_name<?php echo $product_product_description['product_description_id']; ?>" value="<?php echo $front_names[$product_product_description['product_description_id']]; ?>"
                                                   placeholder="Название вкладки" class="form-control" />
                                        </td>

                                    </tr>

                                    <?php } ?>


                                    </tbody>
                                </table>
                            </div>
                        </div>




                        <div class="tab-pane" id="tab-product-tab-description">
                            <div class="">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_store; ?></td>
                                        <td class="text-left"><?php echo $entry_layout; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <?php foreach ($product_product_descriptions as $product_product_description) { ?>

                                        <tr>
                                            <td class="text-left col-md-3">
                                                <?php echo $product_product_description['name']; ?>
                                            </td>
                                            <td class="text-left col-md-5">

                                                <input type="text" name="product_tab_select_description<?php echo $product_product_description['product_description_id']; ?>"
                                                       value="" class="form-control input-product-tabs-select" data-product-tab="2"
                                                       data-product-description-id="<?php echo $product_product_description['product_description_id']; ?>" />

                                                <div id="" class="well well-sm input-product-tabs" style="height: 150px; overflow: auto;">
                                                    <?php foreach ($products_tab as $product_k => $product) { ?>
                                                        <?php if (in_array($product['product_id'], $checked_tab_products_description[$product_product_description['product_description_id']])) { ?>
                                                            <div class="product-tab<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                                                                <input type="hidden" name="product_tab_select_description<?php echo $product_product_description['product_description_id']; ?>[]"
                                                                       value="<?php echo $product['product_id']; ?>" />
                                                            </div>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>

                                            </td>

                                        </tr>

                                    <?php } ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>


                        <div class="tab-pane active" id="tab-product-tab-categories">
<!--                        <div class="tab-pane" id="tab-product-tab-categories">-->
                            <div class="table-responsive">
                                <style>
                                    .categories_1000 ul {
                                        display: block !important;
                                    }
                                </style>
                                <div class="box">
                                    <div class="box-heading"><?php echo $heading_title ?></div>
                                    <div class="box-content">
                                        <div class="box-category"><?php echo $category_accordion_menu; ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- SEO URL Generator.Begin -->
    <script type="text/javascript">

        var config_language_id = <?php echo $config_language_id; ?>;

        var product_description_row = <?php echo $product_description_row; ?>;

        function addProductDescription() {
            html  = '<tr id="product_description-row' + product_description_row + '">';
            html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_product_description[' + product_description_row + '][name]" value="" placeholder="<?php echo $entry_product_description; ?>" class="form-control" /><input type="hidden" name="product_product_description[' + product_description_row + '][product_description_id]" value="" /></td>';
            html += '  <td class="text-left">';
            <?php foreach ($languages as $language) { ?>
            html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea id="input-description<?php echo $language['language_id']; ?>[' + product_description_row + ']" name="product_product_description[' + product_description_row + '][product_product_description_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
            <?php } ?>
            html += '  </td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#product_description-row' + product_description_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#product_description tbody').append(html);

            ckeditorInit('input-description<?php echo $language['language_id']; ?>[' + product_description_row + ']', getURLVar('token'));

            product_description_row++;
        }

    </script>
    <script type="text/javascript"><!--
        $('#language a:first').tab('show');
        //--></script></div>

<script type="text/javascript">
    // $('.product_tab_select').multiSelect({});

    $('.input-product-tabs .fa-minus-circle').on( 'click', function() {
        $(this).parent().remove();
    });

    $('.input-product-tabs-input, .input-product-tabs-select').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_meta_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['meta_h1'],
                            value: item['product_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {

            // console.log($(this).find('#product-tab'+item['value']));
            $(this).val('');

            var currentEl = $(this).attr('data-product-description-id');
            var productTab =  $(this).attr('data-product-tab');

            $(this).parent().find('.product-tab' + item['value']).remove();

            if(productTab == 1) {
                $(this).parent().find('.input-product-tabs').append('<div class="product-tab' + item['value'] + '">' +
                    '<i class="fa fa-minus-circle"></i> ' + item['label'] +
                    '<input type="hidden" name="product_tab_select' + currentEl + '[]" value="' + item['value'] + '" /></div>');
            } else if(productTab == 2) {
                $(this).parent().find('.input-product-tabs').append('<div class="product-tab' + item['value'] + '">' +
                    '<i class="fa fa-minus-circle"></i> ' + item['label'] +
                    '<input type="hidden" name="product_tab_select_description' + currentEl + '[]" value="' + item['value'] + '" /></div>');
            }



            $('.input-product-tabs .fa-minus-circle').on( 'click', function() {
                $(this).parent().remove();
            });

        }


    });


</script>
<style type="text/css">
    .multi-select-container {
        display: inline-block;
        position: relative;
    }

    .multi-select-menu {
        position: absolute;
        left: 0;
        top: 0.8em;
        z-index: 1;
        float: left;
        min-width: 100%;
        background: #fff;
        margin: 1em 0;
        border: 1px solid #aaa;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        display: none;
    }

    .multi-select-menuitem {
        display: block;
        font-size: 0.875em;
        padding: 0.6em 1em 0.6em 30px;
        white-space: nowrap;
    }

    .multi-select-menuitem--titled:before {
        display: block;
        font-weight: bold;
        content: attr(data-group-title);
        margin: 0 0 0.25em -20px;
    }

    .multi-select-menuitem--titledsr:before {
        display: block;
        font-weight: bold;
        content: attr(data-group-title);
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
    }

    .multi-select-menuitem + .multi-select-menuitem {
        padding-top: 0;
    }

    .multi-select-presets {
        border-bottom: 1px solid #ddd;
    }

    .multi-select-menuitem input {
        position: absolute;
        margin-top: 0.25em;
        margin-left: -20px;
    }

    .multi-select-button {
        display: inline-block;
        font-size: 0.875em;
        padding: 0.2em 0.6em;
        width: 700px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        vertical-align: -0.5em;
        background-color: #fff;
        border: 1px solid #aaa;
        border-radius: 4px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        cursor: default;
    }

    .multi-select-button:after {
        content: "";
        display: inline-block;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 0.4em 0.4em 0 0.4em;
        border-color: #999 transparent transparent transparent;
        margin-left: 0.4em;
        vertical-align: 0.1em;
    }

    .multi-select-container--open .multi-select-menu {
        display: block;
    }

    .multi-select-container--open .multi-select-button:after {
        border-width: 0 0.4em 0.4em 0.4em;
        border-color: transparent transparent #999 transparent;
    }

    .multi-select-container--positioned .multi-select-menu {
        /* Avoid border/padding on menu messing with JavaScript width calculation */
        box-sizing: border-box;
    }

    .multi-select-container--positioned .multi-select-menu label {
        /* Allow labels to line wrap when menu is artificially narrowed */
        white-space: normal;
    }


    .demo-example {
        margin-bottom: 2em;
    }

    .demo-example > label {
        display: block;
        margin-bottom: 0.5em;
        font-weight: bold;
    }

    .position-menu-within {
        width: 18em;
        height: 15em;
        background: #eee;
        overflow: auto;
        padding: 2em 0 0 2em;
    }

    .modal-example .multi-select-menu {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-height: 50%;
        min-width: 0;
        overflow: auto;
        border: none;
        border-radius: 0.3em;
        box-shadow: 0 1em 3em rgba(0,0,0,0.4);
    }

    .modal-example .multi-select-menuitem {
        font-size: 1em;
        padding: 1.5em 2.5em 1.5em 3.5em;
    }

    .modal-example .multi-select-menuitem + .multi-select-menuitem {
        padding-top: 0;
    }

    .modal-example .multi-select-menuitem input {
        margin-left: -2.5em;
    }

    .multi-select-modal {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1;
        background: rgba(0, 0, 0, 0.4);
        display: none;
    }

    .multi-select-container--open .multi-select-modal {
        display: block;
    }
    #tab-product-tab .table-responsive {
         overflow-x: visible;
    }
    .nochild.active {
        color: #000;
        font-size: 14px;
        font-weight: 600;
    }
</style>

<?php echo $footer; ?>
<!--<select class="product_tab_select" name="product_tab_select--><?php //echo $product_product_description['product_description_id']; ?><!--[]" class="form-control" multiple>-->
<!---->
<!--    --><?php //foreach ($products_tab as $product_k => $product) { ?>
<!---->
<!--        --><?php //if (in_array($product['product_id'], $checked_tab_products[$product_product_description['product_description_id']])) { ?>
<!--            <option value="--><?php //echo $product['product_id']; ?><!--" selected>--><?php //echo $product['name']; ?><!--</option>-->
<!--        --><?php //} else { ?>
<!--            <option value="--><?php //echo $product['product_id']; ?><!--">--><?php //echo $product['name']; ?><!--</option>-->
<!--        --><?php //} ?>
<!--    --><?php //} ?>
<!---->
<!--</select>-->

