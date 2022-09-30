<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <?php if (isset($product_page)) { ?><a class="btn btn-info" href="<?php echo $product_page; ?>"
                                                       target="_blank" data-toggle="tooltip"
                                                       title="<?php echo $button_view; ?>"><i class="fa fa-eye"></i>
                    </a><?php } ?>
                <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product"
                      class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
                        <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
                        <li><a href="#tab-hpmodel" data-toggle="tab"><?php echo $tab_hpm; ?></a></li>
                        <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                        <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
                        <li><a href="#tab-recurring" data-toggle="tab"><?php echo $tab_recurring; ?></a></li>
                        <li><a href="#tab-discount" data-toggle="tab"><?php echo $tab_discount; ?></a></li>
                        <li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
                        <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
                        <li><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>
                        <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
                        <li><a href="#tab-smart-filter" data-toggle="tab">Опции фильтра</a></li>
                        <li><a href="#tab-product-tab" data-toggle="tab"><?php echo $tab_product_tab; ?></a></li>
	                    <li><a href="#tab-related-options" data-toggle="tab">Связанные опции</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <ul class="nav nav-tabs" id="language">
                                <?php foreach ($languages as $language) { ?>
                                    <li><a href="#language<?php echo $language['language_id']; ?>"
                                           data-toggle="tab"><img
                                                    src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"
                                                    title="<?php echo $language['name']; ?>"/> <?php echo $language['name']; ?>
                                        </a></li>
                                <?php } ?>
                            </ul>
                            <div class="tab-content">
                                <?php foreach ($languages as $language) { ?>
                                    <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label"
                                                   for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text"
                                                       name="product_description[<?php echo $language['language_id']; ?>][name]"
                                                       value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>"
                                                       placeholder="<?php echo $entry_name; ?>"
                                                       id="input-name<?php echo $language['language_id']; ?>"
                                                       class="form-control"/>
                                                <?php if (isset($error_name[$language['language_id']])) { ?>
                                                    <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text"
                                                       name="product_description[<?php echo $language['language_id']; ?>][meta_h1]"
                                                       value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_h1'] : ''; ?>"
                                                       placeholder="<?php echo $entry_meta_h1; ?>"
                                                       id="input-meta-h1<?php echo $language['language_id']; ?>"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text"
                                                       name="product_description[<?php echo $language['language_id']; ?>][meta_title]"
                                                       value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>"
                                                       placeholder="<?php echo $entry_meta_title; ?>"
                                                       id="input-meta-title<?php echo $language['language_id']; ?>"
                                                       class="form-control"/>
                                                <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                                                    <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                                            <div class="col-sm-10">
                                                <textarea
                                                        name="product_description[<?php echo $language['language_id']; ?>][meta_description]"
                                                        rows="5" placeholder="<?php echo $entry_meta_description; ?>"
                                                        id="input-meta-description<?php echo $language['language_id']; ?>"
                                                        class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                                            <div class="col-sm-10">
                                                <textarea
                                                        name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]"
                                                        rows="5" placeholder="<?php echo $entry_meta_keyword; ?>"
                                                        id="input-meta-keyword<?php echo $language['language_id']; ?>"
                                                        class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-tag<?php echo $language['language_id']; ?>"><span
                                                        data-toggle="tooltip"
                                                        title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                                            <div class="col-sm-10">
                                                <input type="text"
                                                       name="product_description[<?php echo $language['language_id']; ?>][tag]"
                                                       value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>"
                                                       placeholder="<?php echo $entry_tag; ?>"
                                                       id="input-tag<?php echo $language['language_id']; ?>"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                                            <div class="col-sm-10">
                                                <textarea
                                                        name="product_description[<?php echo $language['language_id']; ?>][description]"
                                                        placeholder="<?php echo $entry_description; ?>"
                                                        id="input-description<?php echo $language['language_id']; ?>"
                                                        data-lang="<?php echo $lang; ?>"
                                                        class="form-control summernote"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-additional-description-1<?php echo $language['language_id']; ?>"><span
                                                        data-toggle="tooltip"
                                                        title="<?php echo $help_additional_description_1; ?>"><?php echo $entry_additional_description_1; ?></span></label>
                                            <div class="col-sm-10">
                                                <textarea
                                                        name="product_description[<?php echo $language['language_id']; ?>][additional_description_1]"
                                                        rows="5"
                                                        placeholder="<?php echo $entry_additional_description_1; ?>"
                                                        id="input-additional-description-1<?php echo $language['language_id']; ?>"
                                                        class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['additional_description_1'] : ''; ?></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-additional-description-2<?php echo $language['language_id']; ?>"><span
                                                        data-toggle="tooltip"
                                                        title="<?php echo $help_additional_description_2; ?>"><?php echo $entry_additional_description_2; ?></span></label>
                                            <div class="col-sm-10">
                                                <textarea
                                                        name="product_description[<?php echo $language['language_id']; ?>][additional_description_2]"
                                                        rows="5"
                                                        placeholder="<?php echo $entry_additional_description_2; ?>"
                                                        id="input-additional-description-2<?php echo $language['language_id']; ?>"
                                                        class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['additional_description_2'] : ''; ?></textarea>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-model"><?php echo $entry_model; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="model" value="<?php echo $model; ?>"
                                           placeholder="<?php echo $entry_model; ?>" id="input-model"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip"
                                                                                            title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="sku" value="<?php echo $sku; ?>"
                                           placeholder="<?php echo $entry_sku; ?>" id="input-sku" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group<?php echo ($hide_upc == true) ? ' hide' : ''; ?>">
                                <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip"
                                                                                            title="<?php echo $help_upc; ?>"><?php echo $entry_upc; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="upc" value="<?php echo $upc; ?>"
                                           placeholder="<?php echo $entry_upc; ?>" id="input-upc" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group<?php echo ($hide_ean == true) ? ' hide' : ''; ?>">
                                <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip"
                                                                                            title="<?php echo $help_ean; ?>"><?php echo $entry_ean; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="ean" value="<?php echo $ean; ?>"
                                           placeholder="<?php echo $entry_ean; ?>" id="input-ean" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group<?php echo ($hide_jan == true) ? ' hide' : ''; ?>">
                                <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip"
                                                                                            title="<?php echo $help_jan; ?>"><?php echo $entry_jan; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="jan" value="<?php echo $jan; ?>"
                                           placeholder="<?php echo $entry_jan; ?>" id="input-jan" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group<?php echo ($hide_isbn == true) ? ' hide' : ''; ?>">
                                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip"
                                                                                             title="<?php echo $help_isbn; ?>"><?php echo $entry_isbn; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="isbn" value="<?php echo $isbn; ?>"
                                           placeholder="<?php echo $entry_isbn; ?>" id="input-isbn"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group<?php echo ($hide_mpn == true) ? ' hide' : ''; ?>">
                                <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip"
                                                                                            title="<?php echo $help_mpn; ?>"><?php echo $entry_mpn; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="mpn" value="<?php echo $mpn; ?>"
                                           placeholder="<?php echo $entry_mpn; ?>" id="input-mpn" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-location"><?php echo $entry_location; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="location" value="<?php echo $location; ?>"
                                           placeholder="<?php echo $entry_location; ?>" id="input-location"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-price"><?php echo $entry_price; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" value="<?php echo $price; ?>"
                                           placeholder="<?php echo $entry_price; ?>" id="input-price"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-base-price"><?php echo $entry_base_price; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="base_price" value="<?php echo $base_price; ?>"
                                           placeholder="<?php echo $entry_base_price; ?>" id="input-base-price"
                                           class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-base-currency-code"><?php echo $entry_base_currency; ?></label>
                                <div class="col-sm-10">
                                    <select name="base_currency_code" id="input-base-currency-code"
                                            class="form-control">
                                        <?php foreach ($currencies as $currency) { ?>
                                            <?php if ($currency['code'] == $base_currency_code) { ?>
                                                <option value="<?php echo $currency['code']; ?>"
                                                        selected="selected"><?php echo $currency['title']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                                <div class="col-sm-10">
                                    <select name="tax_class_id" id="input-tax-class" class="form-control">
                                        <option value="0"><?php echo $text_none; ?></option>
                                        <?php foreach ($tax_classes as $tax_class) { ?>
                                            <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>"
                                                        selected="selected"><?php echo $tax_class['title']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-quantity"><?php echo $entry_quantity; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="quantity" value="<?php echo $quantity; ?>"
                                           placeholder="<?php echo $entry_quantity; ?>" id="input-quantity"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip"
                                                                                                title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="minimum" value="<?php echo $minimum; ?>"
                                           placeholder="<?php echo $entry_minimum; ?>" id="input-minimum"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-subtract"><?php echo $entry_subtract; ?></label>
                                <div class="col-sm-10">
                                    <select name="subtract" id="input-subtract" class="form-control">
                                        <?php if ($subtract) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <option value="0"><?php echo $text_no; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-stock-status"><span
                                            data-toggle="tooltip"
                                            title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
                                <div class="col-sm-10">
                                    <select name="stock_status_id" id="input-stock-status" class="form-control">
                                        <?php foreach ($stock_statuses as $stock_status) { ?>
                                            <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                                                <option value="<?php echo $stock_status['stock_status_id']; ?>"
                                                        selected="selected"><?php echo $stock_status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_shipping; ?></label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <?php if ($shipping) { ?>
                                            <input type="radio" name="shipping" value="1" checked="checked"/>
                                            <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="shipping" value="1"/>
                                            <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$shipping) { ?>
                                            <input type="radio" name="shipping" value="0" checked="checked"/>
                                            <?php echo $text_no; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="shipping" value="0"/>
                                            <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Статическая SEO страница</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <?php if ($stat_seo_page) { ?>
                                            <input type="radio" name="stat_seo_page" value="1" checked="checked"/>
                                            <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="stat_seo_page" value="1"/>
                                            <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$stat_seo_page) { ?>
                                            <input type="radio" name="stat_seo_page" value="0" checked="checked"/>
                                            <?php echo $text_no; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="stat_seo_page" value="0"/>
                                            <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip"
                                                                                                title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="keyword" value="<?php echo $keyword; ?>"
                                           placeholder="<?php echo $entry_keyword; ?>" id="input-keyword"
                                           class="form-control"/>
                                    <?php if ($error_keyword) { ?>
                                        <div class="text-danger"><?php echo $error_keyword; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-date-available"><?php echo $entry_date_available; ?></label>
                                <div class="col-sm-3">
                                    <div class="input-group date">
                                        <input type="text" name="date_available" value="<?php echo $date_available; ?>"
                                               placeholder="<?php echo $entry_date_available; ?>"
                                               data-date-format="YYYY-MM-DD" id="input-date-available"
                                               class="form-control"/>
                                        <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-length"><?php echo $entry_dimension; ?></label>
                                <div class="col-sm-10">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <input type="text" name="length" value="<?php echo $length; ?>"
                                                   placeholder="<?php echo $entry_length; ?>" id="input-length"
                                                   class="form-control"/>
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" name="width" value="<?php echo $width; ?>"
                                                   placeholder="<?php echo $entry_width; ?>" id="input-width"
                                                   class="form-control"/>
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" name="height" value="<?php echo $height; ?>"
                                                   placeholder="<?php echo $entry_height; ?>" id="input-height"
                                                   class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-length-class"><?php echo $entry_length_class; ?></label>
                                <div class="col-sm-10">
                                    <select name="length_class_id" id="input-length-class" class="form-control">
                                        <?php foreach ($length_classes as $length_class) { ?>
                                            <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                                                <option value="<?php echo $length_class['length_class_id']; ?>"
                                                        selected="selected"><?php echo $length_class['title']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-weight"><?php echo $entry_weight; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="weight" value="<?php echo $weight; ?>"
                                           placeholder="<?php echo $entry_weight; ?>" id="input-weight"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                                <div class="col-sm-10">
                                    <select name="weight_class_id" id="input-weight-class" class="form-control">
                                        <?php foreach ($weight_classes as $weight_class) { ?>
                                            <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                                                <option value="<?php echo $weight_class['weight_class_id']; ?>"
                                                        selected="selected"><?php echo $weight_class['title']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">
                                        <?php if ($status) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="sort_order" value="<?php echo $sort_order; ?>"
                                           placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order"
                                           class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-links">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-manufacturer"><?php echo $entry_manufacturer; ?></label>
                                <div class="col-sm-10">
                                    <select id="input-manufacturer" name="manufacturer_id" class="form-control">
                                        <option value="0" selected="selected"><?php echo $text_none; ?></option>
                                        <?php foreach ($manufacturers as $manufacturer) { ?>
                                            <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
                                                <option value="<?php echo $manufacturer['manufacturer_id']; ?>"
                                                        selected="selected"><?php echo $manufacturer['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_main_category; ?></label>
                                <div class="col-sm-10">
                                    <select id="main_category_id" name="main_category_id" class="form-control">
                                        <option value="0" selected="selected"><?php echo $text_none; ?></option>
                                        <?php foreach ($categories as $category) { ?>
                                            <?php if ($category['category_id'] == $main_category_id) { ?>
                                                <option value="<?php echo $category['category_id']; ?>"
                                                        selected="selected"><?php echo $category['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm"
                                         style="min-height: 150px;max-height: 500px;overflow: auto;">
                                        <table class="table table-striped">
                                            <?php foreach ($categories as $category) { ?>
                                                <tr>
                                                    <td class="checkbox">
                                                        <label>
                                                            <?php if (in_array($category['category_id'], $product_category)) { ?>
                                                                <input type="checkbox" name="product_category[]"
                                                                       value="<?php echo $category['category_id']; ?>"
                                                                       checked="checked"/>
                                                                <?php echo $category['name']; ?>
                                                            <?php } else { ?>
                                                                <input type="checkbox" name="product_category[]"
                                                                       value="<?php echo $category['category_id']; ?>"/>
                                                                <?php echo $category['name']; ?>
                                                            <?php } ?>
                                                        </label>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </table>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a>
                                    /
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Текста для таба</label>
                                <div class="col-sm-10">
                                    <div class="well well-sm"
                                         style="min-height: 150px;max-height: 300px;overflow: auto;">
                                        <table class="table table-striped">
                                            <?php foreach ($product_product_descriptions as $product_product_description) { ?>
                                                <tr>
                                                    <td class="checkbox">
                                                        <label>
                                                            <?php if (in_array($product_product_description['product_description_id'], $checked_tab_products)) { ?>
                                                                <input type="checkbox"
                                                                       name="product_tab_select[<?php echo $product_product_description['product_description_id']; ?>]"
                                                                       value="<?php echo $product_product_description['front_name']; ?>"
                                                                       checked="checked"/>
                                                                <?php echo $product_product_description['name']; ?>
                                                            <?php } else { ?>
                                                                <input type="checkbox"
                                                                       name="product_tab_select[<?php echo $product_product_description['product_description_id']; ?>]"
                                                                       value="<?php echo $product_product_description['front_name']; ?>"/>
                                                                <?php echo $product_product_description['name']; ?>
                                                            <?php } ?>
                                                        </label>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </table>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a>
                                    /
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-category">Текст для после
                                    описания</label>
                                <div class="col-sm-10">
                                    <div class="well well-sm"
                                         style="min-height: 150px;max-height: 300px;overflow: auto;">
                                        <table class="table table-striped">
                                            <?php foreach ($product_product_descriptions as $product_product_description) { ?>
                                                <tr>
                                                    <td class="checkbox">
                                                        <label>
                                                            <?php if (in_array($product_product_description['product_description_id'], $checked_tab_products_description)) { ?>
                                                                <input type="checkbox"
                                                                       name="product_tab_select_description[]"
                                                                       value="<?php echo $product_product_description['product_description_id']; ?>"
                                                                       checked="checked"/>
                                                                <?php echo $product_product_description['name']; ?>
                                                            <?php } else { ?>
                                                                <input type="checkbox"
                                                                       name="product_tab_select_description[]"
                                                                       value="<?php echo $product_product_description['product_description_id']; ?>"/>
                                                                <?php echo $product_product_description['name']; ?>
                                                            <?php } ?>
                                                        </label>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </table>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a>
                                    /
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip"
                                                                                               title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>"
                                           id="input-filter" class="form-control"/>
                                    <div id="product-filter" class="well well-sm"
                                         style="height: 150px; overflow: auto;">
                                        <?php foreach ($product_filters as $product_filter) { ?>
                                            <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i
                                                        class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                                                <input type="hidden" name="product_filter[]"
                                                       value="<?php echo $product_filter['filter_id']; ?>"/>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                        <div class="checkbox">
                                            <label>
                                                <?php if (in_array(0, $product_store)) { ?>
                                                    <input type="checkbox" name="product_store[]" value="0"
                                                           checked="checked"/>
                                                    <?php echo $text_default; ?>
                                                <?php } else { ?>
                                                    <input type="checkbox" name="product_store[]" value="0"/>
                                                    <?php echo $text_default; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                        <?php foreach ($stores as $store) { ?>
                                            <div class="checkbox">
                                                <label>
                                                    <?php if (in_array($store['store_id'], $product_store)) { ?>
                                                        <input type="checkbox" name="product_store[]"
                                                               value="<?php echo $store['store_id']; ?>"
                                                               checked="checked"/>
                                                        <?php echo $store['name']; ?>
                                                    <?php } else { ?>
                                                        <input type="checkbox" name="product_store[]"
                                                               value="<?php echo $store['store_id']; ?>"/>
                                                        <?php echo $store['name']; ?>
                                                    <?php } ?>
                                                </label>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip"
                                                                                                 title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="download" value=""
                                           placeholder="<?php echo $entry_download; ?>" id="input-download"
                                           class="form-control"/>
                                    <div id="product-download" class="well well-sm"
                                         style="height: 150px; overflow: auto;">
                                        <?php foreach ($product_downloads as $product_download) { ?>
                                            <div id="product-download<?php echo $product_download['download_id']; ?>"><i
                                                        class="fa fa-minus-circle"></i> <?php echo $product_download['name']; ?>
                                                <input type="hidden" name="product_download[]"
                                                       value="<?php echo $product_download['download_id']; ?>"/>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip"
                                                                                                title="Похожие">Похожие</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="related" value="" placeholder="Похожие" id="input-related"
                                           class="form-control"/>
                                    <div id="product-related" class="well well-sm"
                                         style="height: 150px; overflow: auto;">
                                        <?php foreach ($product_relateds as $product_related) { ?>
                                            <div id="product-related<?php echo $product_related['product_id']; ?>"><i
                                                        class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                                                <input type="hidden" name="product_related[]"
                                                       value="<?php echo $product_related['product_id']; ?>"/>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-related-similar"><span
                                            data-toggle="tooltip" title="Сопутствующие">Сопутствующие</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="related_similar" value="" placeholder="Сопутствующие"
                                           id="input-related-similar" class="form-control"/>
                                    <div id="product-related-similar" class="well well-sm"
                                         style="height: 150px; overflow: auto;">
                                        <?php foreach ($product_related_similars as $product_related_similar) { ?>
                                            <div id="product-related-similar<?php echo $product_related_similar['product_id']; ?>">
                                                <i class="fa fa-minus-circle"></i> <?php echo $product_related_similar['name']; ?>
                                                <input type="hidden" name="product_related_similar[]"
                                                       value="<?php echo $product_related_similar['product_id']; ?>"/>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-product_stickers">Описание с
                                    картинками</label>
                                <div class="col-sm-10">
                                    <div class="well well-sm"
                                         style="min-height: 150px;max-height: 300px;overflow: auto;">
                                        <table class="table table-striped">
                                            <?php foreach ($product_stickers as $product_sticker) { ?>
                                                <tr>
                                                    <td class="checkbox">
                                                        <label>
                                                            <?php if (in_array($product_sticker['id'], $current_product_stickers)) { ?>
                                                                <input type="checkbox" name="product_stickers[]"
                                                                       value="<?php echo $product_sticker['id']; ?>"
                                                                       checked="checked"/>
                                                                <?php echo $product_sticker['name']; ?>
                                                            <?php } else { ?>
                                                                <input type="checkbox" name="product_stickers[]"
                                                                       value="<?php echo $product_sticker['id']; ?>"/>
                                                                <?php echo $product_sticker['name']; ?>
                                                            <?php } ?>
                                                        </label>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </table>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a>
                                    /
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>

                        </div>
                        <?php echo $hpm_tab; ?>
                        <div class="tab-pane" id="tab-attribute">
                            <div class="table-responsive">
                                <table id="attribute" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_attribute; ?></td>
                                        <td class="text-left"><?php echo $entry_text; ?></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $attribute_row = 0; ?>
                                    <?php foreach ($product_attributes as $product_attribute) { ?>
                                        <tr id="attribute-row<?php echo $attribute_row; ?>">
                                            <td class="text-left" style="width: 40%;"><input type="text"
                                                                                             name="product_attribute[<?php echo $attribute_row; ?>][name]"
                                                                                             value="<?php echo $product_attribute['name']; ?>"
                                                                                             placeholder="<?php echo $entry_attribute; ?>"
                                                                                             class="form-control"/>
                                                <input type="hidden"
                                                       name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]"
                                                       value="<?php echo $product_attribute['attribute_id']; ?>"/></td>
                                            <td class="text-left"><?php foreach ($languages as $language) { ?>
                                                    <div class="input-group"><span class="input-group-addon"><img
                                                                    src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"
                                                                    title="<?php echo $language['name']; ?>"/></span>
                                                        <textarea
                                                                name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]"
                                                                rows="5" placeholder="<?php echo $entry_text; ?>"
                                                                class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                                                    </div>
                                                <?php } ?></td>
                                            <td class="text-left">
                                                <button type="button"
                                                        onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();"
                                                        data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                        class="btn btn-danger"><i class="fa fa-minus-circle"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <?php $attribute_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td class="text-left">
                                            <button type="button" onclick="addAttribute();" data-toggle="tooltip"
                                                    title="<?php echo $button_attribute_add; ?>"
                                                    class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-option">
                            <div class="row">
                                <div class="col-sm-1">
                                    <ul class="nav nav-pills nav-stacked" id="option">
                                        <?php $option_row = 0; ?>
                                        <?php foreach ($product_options as $product_option) { ?>
                                            <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"><i
                                                            class="fa fa-minus-circle"
                                                            onclick="$('a[href=\'#tab-option<?php echo $option_row; ?>\']').parent().remove(); $('#tab-option<?php echo $option_row; ?>').remove(); $('#option a:first').tab('show');"></i> <?php echo $product_option['name']; ?>
                                                </a></li>
                                            <?php $option_row++; ?>
                                        <?php } ?>
                                        <li>
                                            <input type="text" name="option" value=""
                                                   placeholder="<?php echo $entry_option; ?>" id="input-option"
                                                   class="form-control"/>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-sm-11">
                                    <div class="tab-content">
                                        <?php $option_row = 0; ?>
                                        <?php $option_value_row = 0; ?>
                                        <?php foreach ($product_options as $product_option) { ?>
                                            <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
                                                <input type="hidden"
                                                       name="product_option[<?php echo $option_row; ?>][product_option_id]"
                                                       value="<?php echo $product_option['product_option_id']; ?>"/>
                                                <input type="hidden"
                                                       name="product_option[<?php echo $option_row; ?>][name]"
                                                       value="<?php echo $product_option['name']; ?>"/>
                                                <input type="hidden"
                                                       name="product_option[<?php echo $option_row; ?>][option_id]"
                                                       value="<?php echo $product_option['option_id']; ?>"/>
                                                <input type="hidden"
                                                       name="product_option[<?php echo $option_row; ?>][type]"
                                                       value="<?php echo $product_option['type']; ?>"/>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"
                                                           for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                                                    <div class="col-sm-10">
                                                        <select name="product_option[<?php echo $option_row; ?>][required]"
                                                                id="input-required<?php echo $option_row; ?>"
                                                                class="form-control">
                                                            <?php if ($product_option['required']) { ?>
                                                                <option value="1"
                                                                        selected="selected"><?php echo $text_yes; ?></option>
                                                                <option value="0"><?php echo $text_no; ?></option>
                                                            <?php } else { ?>
                                                                <option value="1"><?php echo $text_yes; ?></option>
                                                                <option value="0"
                                                                        selected="selected"><?php echo $text_no; ?></option>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <?php if ($product_option['type'] == 'text') { ?>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                                                        <div class="col-sm-10">
                                                            <input type="text"
                                                                   name="product_option[<?php echo $option_row; ?>][value]"
                                                                   value="<?php echo $product_option['value']; ?>"
                                                                   placeholder="<?php echo $entry_option_value; ?>"
                                                                   id="input-value<?php echo $option_row; ?>"
                                                                   class="form-control"/>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($product_option['type'] == 'textarea') { ?>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                                                        <div class="col-sm-10">
                                                            <textarea
                                                                    name="product_option[<?php echo $option_row; ?>][value]"
                                                                    rows="5"
                                                                    placeholder="<?php echo $entry_option_value; ?>"
                                                                    id="input-value<?php echo $option_row; ?>"
                                                                    class="form-control"><?php echo $product_option['value']; ?></textarea>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($product_option['type'] == 'file') { ?>
                                                    <div class="form-group" style="display: none;">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                                                        <div class="col-sm-10">
                                                            <input type="text"
                                                                   name="product_option[<?php echo $option_row; ?>][value]"
                                                                   value="<?php echo $product_option['value']; ?>"
                                                                   placeholder="<?php echo $entry_option_value; ?>"
                                                                   id="input-value<?php echo $option_row; ?>"
                                                                   class="form-control"/>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($product_option['type'] == 'date') { ?>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                                                        <div class="col-sm-3">
                                                            <div class="input-group date">
                                                                <input type="text"
                                                                       name="product_option[<?php echo $option_row; ?>][value]"
                                                                       value="<?php echo $product_option['value']; ?>"
                                                                       placeholder="<?php echo $entry_option_value; ?>"
                                                                       data-date-format="YYYY-MM-DD"
                                                                       id="input-value<?php echo $option_row; ?>"
                                                                       class="form-control"/>
                                                                <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($product_option['type'] == 'time') { ?>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group time">
                                                                <input type="text"
                                                                       name="product_option[<?php echo $option_row; ?>][value]"
                                                                       value="<?php echo $product_option['value']; ?>"
                                                                       placeholder="<?php echo $entry_option_value; ?>"
                                                                       data-date-format="HH:mm"
                                                                       id="input-value<?php echo $option_row; ?>"
                                                                       class="form-control"/>
                                                                <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($product_option['type'] == 'datetime') { ?>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group datetime">
                                                                <input type="text"
                                                                       name="product_option[<?php echo $option_row; ?>][value]"
                                                                       value="<?php echo $product_option['value']; ?>"
                                                                       placeholder="<?php echo $entry_option_value; ?>"
                                                                       data-date-format="YYYY-MM-DD HH:mm"
                                                                       id="input-value<?php echo $option_row; ?>"
                                                                       class="form-control"/>
                                                                <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image' || $product_option['type'] == 'text' || $product_option['type'] == 'picture') { ?>
                                                    <div class="table-responsive">
                                                        <table id="option-value<?php echo $option_row; ?>"
                                                               class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                            <tr>
                                                                <td class="text-left"
                                                                    style="width: 100px;"><?php echo $entry_option_value; ?></td>
                                                                <td class="text-right"
                                                                    style="width: 150px;"><?php echo $entry_price . ' / ' . $entry_base_price; ?></td>
                                                                <td class="text-right">Изображение:</td>
                                                                <td class="text-right">Название опции:</td>
                                                                <td class="text-right">Описание опции:</td>
                                                                <td></td>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                                                <tr id="option-value-row<?php echo $option_value_row; ?>">
                                                                    <td class="text-left">
                                                                        <select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]"
                                                                                class="form-control">
                                                                            <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                                                                <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                                                                    <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                                                                        <option value="<?php echo $option_value['option_value_id']; ?>"
                                                                                                selected="selected"><?php echo $option_value['name']; ?></option>
                                                                                    <?php } else { ?>
                                                                                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                                                                    <?php } ?>
                                                                                <?php } ?>
                                                                            <?php } ?>
                                                                        </select>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]"
                                                                               value="<?php echo $product_option_value['product_option_value_id']; ?>"/>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]"
                                                                               value="1000000000" class="form-control"/>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]"
                                                                               value="0" class="form-control"/>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]"
                                                                               value="+" class="form-control"/>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]"
                                                                               value="0" class="form-control"/>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]"
                                                                               value="+" class="form-control"/>
                                                                        <input type="hidden"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]"
                                                                               value="0" class="form-control"/>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]"
                                                                                class="form-control">
                                                                            <?php if ($product_option_value['price_prefix'] == '+') { ?>
                                                                                <option value="+" selected="selected">
                                                                                    +
                                                                                </option>
                                                                            <?php } else { ?>
                                                                                <option value="+">+</option>
                                                                            <?php } ?>
                                                                            <?php if ($product_option_value['price_prefix'] == '-') { ?>
                                                                                <option value="-" selected="selected">
                                                                                    -
                                                                                </option>
                                                                            <?php } else { ?>
                                                                                <option value="-">-</option>
                                                                            <?php } ?>
                                                                        </select>
                                                                        <input type="text"
                                                                               name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]"
                                                                               value="<?php echo $product_option_value['price']; ?>"
                                                                               placeholder="<?php echo $entry_price; ?>"
                                                                               class="form-control"/>
                                                                        / <input type="text"
                                                                                 name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][base_price]"
                                                                                 value="<?php echo $product_option_value['base_price']; ?>"
                                                                                 placeholder="<?php echo $entry_base_price; ?>"
                                                                                 class="form-control"/>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <div class="form-group">
                                                                            <a href=""
                                                                               id="thumb-product_option<?php echo $option_value_row; ?>-image"
                                                                               data-toggle="image"
                                                                               class="img-thumbnail">
                                                                                <img src="<?php echo $product_option_value['product_option_thumb']; ?>"
                                                                                     alt="" title=""
                                                                                     data-placeholder="<?php echo $placeholder; ?>"/>
                                                                            </a>
                                                                            <input type="hidden"
                                                                                   name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_image]"
                                                                                   value="<?php echo $product_option_value['product_option_image']; ?>"
                                                                                   id="input-product_option<?php echo $option_value_row; ?>-image"/>
                                                                        </div>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <div class="form-group">
                                                                            <div class="col-sm-12">
                                                                                <input type="text"
                                                                                       name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_name]"
                                                                                       value="<?php echo $product_option_value['product_option_name']; ?>"
                                                                                       placeholder="Название опции"
                                                                                       class="form-control"/>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <div class="form-group">
                                                                            <div class="col-sm-12">
                                                                                <textarea
                                                                                        name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_description]"
                                                                                        id="product_option<?php echo $option_value_row; ?>_option_description"
                                                                                        placeholder="Описание опции"
                                                                                        class="form-control"><?php echo isset($product_option_value['product_option_description']) ? $product_option_value['product_option_description'] : false; ?></textarea>
                                                                            </div>
                                                                        </div>
                                                                        <script type="text/javascript">
                                                                            ckeditorInit('product_option<?php echo $option_value_row; ?>_option_description', getURLVar('token'));
                                                                            CKEDITOR.config.language = 'ru';
                                                                        </script>
                                                                    </td>
                                                                    <td class="text-left">
                                                                        <button type="button"
                                                                                onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();"
                                                                                data-toggle="tooltip"
                                                                                title="<?php echo $button_remove; ?>"
                                                                                class="btn btn-danger"><i
                                                                                    class="fa fa-minus-circle"></i>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                                <?php $option_value_row++; ?>
                                                            <?php } ?>
                                                            </tbody>
                                                            <tfoot>
                                                            <tr>
                                                                <td colspan="5"></td>
                                                                <td class="text-left">
                                                                    <button type="button"
                                                                            onclick="addOptionValue('<?php echo $option_row; ?>');"
                                                                            data-toggle="tooltip"
                                                                            title="<?php echo $button_option_value_add; ?>"
                                                                            class="btn btn-primary"><i
                                                                                class="fa fa-plus-circle"></i></button>
                                                                </td>
                                                            </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                    <select id="option-values<?php echo $option_row; ?>"
                                                            style="display: none;">
                                                        <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                                            <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                                                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                <?php } ?>
                                            </div>
                                            <?php $option_row++; ?>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-recurring">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_recurring; ?></td>
                                        <td class="text-left"><?php echo $entry_customer_group; ?></td>
                                        <td class="text-left"></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $recurring_row = 0; ?>
                                    <?php foreach ($product_recurrings as $product_recurring) { ?>

                                        <tr id="recurring-row<?php echo $recurring_row; ?>">
                                            <td class="text-left"><select
                                                        name="product_recurring[<?php echo $recurring_row; ?>][recurring_id]"
                                                        class="form-control">
                                                    <?php foreach ($recurrings as $recurring) { ?>
                                                        <?php if ($recurring['recurring_id'] == $product_recurring['recurring_id']) { ?>
                                                            <option value="<?php echo $recurring['recurring_id']; ?>"
                                                                    selected="selected"><?php echo $recurring['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                            <td class="text-left"><select
                                                        name="product_recurring[<?php echo $recurring_row; ?>][customer_group_id]"
                                                        class="form-control">
                                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                                        <?php if ($customer_group['customer_group_id'] == $product_recurring['customer_group_id']) { ?>
                                                            <option value="<?php echo $customer_group['customer_group_id']; ?>"
                                                                    selected="selected"><?php echo $customer_group['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                            <td class="text-left">
                                                <button type="button"
                                                        onclick="$('#recurring-row<?php echo $recurring_row; ?>').remove()"
                                                        data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                        class="btn btn-danger"><i class="fa fa-minus-circle"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <?php $recurring_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td class="text-left">
                                            <button type="button" onclick="addRecurring()" data-toggle="tooltip"
                                                    title="<?php echo $button_recurring_add; ?>"
                                                    class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-discount">
                            <div class="table-responsive">
                                <table id="discount" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_customer_group; ?></td>
                                        <td class="text-right"><?php echo $entry_quantity; ?></td>
                                        <td class="text-right"><?php echo $entry_priority; ?></td>
                                        <td class="text-right"><?php echo $entry_price . ' / ' . $entry_base_price; ?></td>
                                        <td class="text-left"><?php echo $entry_date_start; ?></td>
                                        <td class="text-left"><?php echo $entry_date_end; ?></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $discount_row = 0; ?>
                                    <?php foreach ($product_discounts as $product_discount) { ?>
                                        <tr id="discount-row<?php echo $discount_row; ?>">
                                            <td class="text-left"><select
                                                        name="product_discount[<?php echo $discount_row; ?>][customer_group_id]"
                                                        class="form-control">
                                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                                        <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                                                            <option value="<?php echo $customer_group['customer_group_id']; ?>"
                                                                    selected="selected"><?php echo $customer_group['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                            <td class="text-right"><input type="text"
                                                                          name="product_discount[<?php echo $discount_row; ?>][quantity]"
                                                                          value="<?php echo $product_discount['quantity']; ?>"
                                                                          placeholder="<?php echo $entry_quantity; ?>"
                                                                          class="form-control"/></td>
                                            <td class="text-right"><input type="text"
                                                                          name="product_discount[<?php echo $discount_row; ?>][priority]"
                                                                          value="<?php echo $product_discount['priority']; ?>"
                                                                          placeholder="<?php echo $entry_priority; ?>"
                                                                          class="form-control"/></td>
                                            <td class="text-right"><input type="text"
                                                                          name="product_discount[<?php echo $discount_row; ?>][price]"
                                                                          value="<?php echo $product_discount['price']; ?>"
                                                                          placeholder="<?php echo $entry_price; ?>"
                                                                          class="form-control"/> / <input type="text"
                                                                                                          name="product_discount[<?php echo $discount_row; ?>][base_price]"
                                                                                                          value="<?php echo $product_discount['base_price']; ?>"
                                                                                                          placeholder="<?php echo $entry_base_price; ?>"
                                                                                                          class="form-control"/>
                                            </td>
                                            <td class="text-left" style="width: 20%;">
                                                <div class="input-group date">
                                                    <input type="text"
                                                           name="product_discount[<?php echo $discount_row; ?>][date_start]"
                                                           value="<?php echo $product_discount['date_start']; ?>"
                                                           placeholder="<?php echo $entry_date_start; ?>"
                                                           data-date-format="YYYY-MM-DD" class="form-control"/>
                                                    <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div>
                                            </td>
                                            <td class="text-left" style="width: 20%;">
                                                <div class="input-group date">
                                                    <input type="text"
                                                           name="product_discount[<?php echo $discount_row; ?>][date_end]"
                                                           value="<?php echo $product_discount['date_end']; ?>"
                                                           placeholder="<?php echo $entry_date_end; ?>"
                                                           data-date-format="YYYY-MM-DD" class="form-control"/>
                                                    <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div>
                                            </td>
                                            <td class="text-left">
                                                <button type="button"
                                                        onclick="$('#discount-row<?php echo $discount_row; ?>').remove();"
                                                        data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                        class="btn btn-danger"><i class="fa fa-minus-circle"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <?php $discount_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="6"></td>
                                        <td class="text-left">
                                            <button type="button" onclick="addDiscount();" data-toggle="tooltip"
                                                    title="<?php echo $button_discount_add; ?>" class="btn btn-primary">
                                                <i class="fa fa-plus-circle"></i></button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-special">
                            <div class="table-responsive">
                                <table id="special" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_customer_group; ?></td>
                                        <td class="text-right"><?php echo $entry_priority; ?></td>
                                        <td class="text-right"><?php echo $entry_price . ' / ' . $entry_base_price; ?></td>
                                        <td class="text-left"><?php echo $entry_date_start; ?></td>
                                        <td class="text-left"><?php echo $entry_date_end; ?></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $special_row = 0; ?>
                                    <?php foreach ($product_specials as $product_special) { ?>
                                        <tr id="special-row<?php echo $special_row; ?>">
                                            <td class="text-left"><select
                                                        name="product_special[<?php echo $special_row; ?>][customer_group_id]"
                                                        class="form-control">
                                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                                        <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                                                            <option value="<?php echo $customer_group['customer_group_id']; ?>"
                                                                    selected="selected"><?php echo $customer_group['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                            <td class="text-right"><input type="text"
                                                                          name="product_special[<?php echo $special_row; ?>][priority]"
                                                                          value="<?php echo $product_special['priority']; ?>"
                                                                          placeholder="<?php echo $entry_priority; ?>"
                                                                          class="form-control"/></td>
                                            <td class="text-right"><input type="text"
                                                                          name="product_special[<?php echo $special_row; ?>][price]"
                                                                          value="<?php echo $product_special['price']; ?>"
                                                                          placeholder="<?php echo $entry_price; ?>"
                                                                          class="form-control"/> / <input type="text"
                                                                                                          name="product_special[<?php echo $special_row; ?>][base_price]"
                                                                                                          value="<?php echo $product_special['base_price']; ?>"
                                                                                                          placeholder="<?php echo $entry_base_price; ?>"
                                                                                                          class="form-control"/>
                                            </td>
                                            <td class="text-left" style="width: 20%;">
                                                <div class="input-group date">
                                                    <input type="text"
                                                           name="product_special[<?php echo $special_row; ?>][date_start]"
                                                           value="<?php echo $product_special['date_start']; ?>"
                                                           placeholder="<?php echo $entry_date_start; ?>"
                                                           data-date-format="YYYY-MM-DD" class="form-control"/>
                                                    <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div>
                                            </td>
                                            <td class="text-left" style="width: 20%;">
                                                <div class="input-group date">
                                                    <input type="text"
                                                           name="product_special[<?php echo $special_row; ?>][date_end]"
                                                           value="<?php echo $product_special['date_end']; ?>"
                                                           placeholder="<?php echo $entry_date_end; ?>"
                                                           data-date-format="YYYY-MM-DD" class="form-control"/>
                                                    <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div>
                                            </td>
                                            <td class="text-left">
                                                <button type="button"
                                                        onclick="$('#special-row<?php echo $special_row; ?>').remove();"
                                                        data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                        class="btn btn-danger"><i class="fa fa-minus-circle"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <?php $special_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td class="text-left">
                                            <button type="button" onclick="addSpecial();" data-toggle="tooltip"
                                                    title="<?php echo $button_special_add; ?>" class="btn btn-primary">
                                                <i class="fa fa-plus-circle"></i></button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-image">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left">Ссылка на Youtube видео</td>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td class="text-left">
                                            <input type="text" name="video_in_product"
                                                   value="<?php echo $video_in_product; ?>" id="input-video_in_product"
                                                   style="width: 100%;"/></td>
                                    </tr>
                                    <tr>
                                        <td class="text-left">
                                            <input type="text" name="video_in_product1"
                                                   value="<?php echo $video_in_product1; ?>"
                                                   id="input-video_in_product1" style="width: 100%;"/></td>
                                    </tr>
                                    <tr>
                                        <td class="text-left">
                                            <input type="text" name="video_in_product2"
                                                   value="<?php echo $video_in_product2; ?>"
                                                   id="input-video_in_product2" style="width: 100%;"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
	                                    <td class="text-left"><?php echo $entry_image; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-left">
	                                        <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
		                                        <img src="<?php echo $thumb; ?>" />
	                                        </a>
	                                        <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
	                        <div class="table-responsive">
		                        <table class="table table-striped table-bordered table-hover">
			                        <thead>
			                        <tr>
				                        <td class="text-left">Превью товара</td>
			                        </tr>
			                        </thead>
			                        <tbody>
			                        <tr>
				                        <td class="text-left">
					                        <a href="" id="preview-image" data-toggle="image" class="img-thumbnail">
						                        <img src="<?php echo $thumb_preview; ?>" />
					                        </a>
					                        <input type="hidden" name="preview" value="<?php echo $preview; ?>" id="input-preview"/>
				                        </td>
			                        </tr>
			                        </tbody>
		                        </table>
	                        </div>
                            <div class="table-responsive">
                                <table id="images" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_additional_image; ?></td>
                                        <!--                        <td class="text-right">Youtube Video - <img src="/admin/view/image/video_in_product.jpg"></td>-->
                                        <td class="text-right"><?php echo $entry_sort_order; ?></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $image_row = 0; ?>
                                    <?php foreach ($product_images as $product_image) { ?>
                                        <tr id="image-row<?php echo $image_row; ?>">
                                            <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>"
                                                                     data-toggle="image" class="img-thumbnail"><img
                                                            src="<?php echo $product_image['thumb']; ?>" alt="" title=""
                                                            data-placeholder="<?php echo $placeholder; ?>"/></a><input
                                                        type="hidden"
                                                        name="product_image[<?php echo $image_row; ?>][image]"
                                                        value="<?php echo $product_image['image']; ?>"
                                                        id="input-image<?php echo $image_row; ?>"/></td>
                                            <!--                        <td class="text-right"><input type="text" name="product_image[-->
                                            <?php //echo $image_row; ?><!--][video_in_product]" value="-->
                                            <?php //echo $product_image['video_in_product']; ?><!--" placeholder="-->
                                            <?php //echo $entry_video_in_product; ?><!--" class="form-control" /></td>-->
                                            <td class="text-right"><input type="text"
                                                                          name="product_image[<?php echo $image_row; ?>][sort_order]"
                                                                          value="<?php echo $product_image['sort_order']; ?>"
                                                                          placeholder="<?php echo $entry_sort_order; ?>"
                                                                          class="form-control"/></td>
                                            <td class="text-left">
                                                <button type="button"
                                                        onclick="$('#image-row<?php echo $image_row; ?>').remove();"
                                                        data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                        class="btn btn-danger"><i class="fa fa-minus-circle"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <?php $image_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td class="text-left">
                                            <button type="button" onclick="addImage();" data-toggle="tooltip"
                                                    title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i
                                                        class="fa fa-plus-circle"></i></button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-reward">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip"
                                                                                               title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="points" value="<?php echo $points; ?>"
                                           placeholder="<?php echo $entry_points; ?>" id="input-points"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_customer_group; ?></td>
                                        <td class="text-right"><?php echo $entry_reward; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                        <tr>
                                            <td class="text-left"><?php echo $customer_group['name']; ?></td>
                                            <td class="text-right"><input type="text"
                                                                          name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]"
                                                                          value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>"
                                                                          class="form-control"/></td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-design">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_store; ?></td>
                                        <td class="text-left"><?php echo $entry_layout; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-left"><?php echo $text_default; ?></td>
                                        <td class="text-left"><select name="product_layout[0]" class="form-control">
                                                <option value=""></option>
                                                <?php foreach ($layouts as $layout) { ?>
                                                    <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                                                        <option value="<?php echo $layout['layout_id']; ?>"
                                                                selected="selected"><?php echo $layout['name']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select></td>
                                    </tr>
                                    <?php foreach ($stores as $store) { ?>
                                        <tr>
                                            <td class="text-left"><?php echo $store['name']; ?></td>
                                            <td class="text-left"><select
                                                        name="product_layout[<?php echo $store['store_id']; ?>]"
                                                        class="form-control">
                                                    <option value=""></option>
                                                    <?php foreach ($layouts as $layout) { ?>
                                                        <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                                                            <option value="<?php echo $layout['layout_id']; ?>"
                                                                    selected="selected"><?php echo $layout['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-smart-filter">
                            <?php $smart_filter_row = 0; ?>
                            <div id="smart_filter_content">
                                <?php
                                foreach ($smart_filters as $smart_filter) { ?>
                                    <div id="smartfilter<?php echo $smart_filter_row; ?>" class="row">
                                        <div class="form-group col-sm-2 required">
                                            <select class="start-year form-control"
                                                    name="smart_filter[<?php echo $smart_filter_row; ?>][start_year_id]">
                                                <option value="0" selected="selected">Начальный год</option>
                                                <?php foreach ($car_years as $car_year) { ?>
                                                    <?php if ($car_year['car_year'] == $smart_filter['start_year_id']) { ?>
                                                        <option value="<?php echo $car_year['car_year']; ?>"
                                                                selected="selected"><?php echo $car_year['car_year']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $car_year['car_year']; ?>"><?php echo $car_year['car_year']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-2 required">
                                            <select class="end-year form-control"
                                                    name="smart_filter[<?php echo $smart_filter_row; ?>][end_year_id]">
                                                <option value="0" selected="selected">Конечный год</option>
                                                <?php foreach ($car_years as $car_year) { ?>
                                                    <?php if ($car_year['car_year'] == $smart_filter['end_year_id']) { ?>
                                                        <option value="<?php echo $car_year['car_year']; ?>"
                                                                selected="selected"><?php echo $car_year['car_year']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $car_year['car_year']; ?>"><?php echo $car_year['car_year']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>


                                        <div class="form-group col-sm-2 required car-mark<?php echo $smart_filter_row; ?>"
                                             data-attr-id="<?php echo $smart_filter_row; ?>">
                                            <select class="form-control"
                                                    name="smart_filter[<?php echo $smart_filter_row; ?>][car_mark_id]"
                                                    onchange="setCarModel(this);">
                                                <option value="0">Марка</option>
                                                <?php foreach ($car_marks as $car_mark_k => $car_mark) { ?>
                                                    <?php if ($smart_filter['car_mark_id'] == $car_mark_k) { ?>
                                                        <option value="<?php echo $car_mark['id']; ?>"
                                                                selected="selected"><?php echo $car_mark['car_mark']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $car_mark['id']; ?>"><?php echo $car_mark['car_mark']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>


                                        <div class="form-group col-sm-2 required car-model<?php echo $smart_filter_row; ?>"
                                             data-attr-id="<?php echo $smart_filter_row; ?>">
                                            <?php foreach ($car_models as $car_model_k => $car_model) { ?>
                                                <?php if ($smart_filter['car_model_id'] == $car_model_k) { ?>
                                                    <input type="hidden"
                                                           name="smart_filter[<?php echo $smart_filter_row; ?>][car_model_id]"
                                                           class="old-car-model<?php echo $smart_filter_row; ?>"
                                                           value="<?php echo $car_model['id']; ?>">
                                                <?php } ?>
                                            <?php } ?>
                                            <select class="form-control"
                                                    name="smart_filter[<?php echo $smart_filter_row; ?>][car_model_id]"
                                                    disabled="disabled" onchange="setCarGeneration(this);">
                                                <option value="0">Модель</option>
                                                <?php foreach ($car_models as $car_model_k => $car_model) { ?>
                                                    <?php if ($smart_filter['car_model_id'] == $car_model_k) { ?>
                                                        <option value="<?php echo $car_model['id']; ?>"
                                                                selected="selected"><?php echo $car_model['car_model']; ?></option>

                                                    <?php } else { ?>
                                                        <option value="<?php echo $car_model['id']; ?>"><?php echo $car_model['car_model']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <div class="form-group col-sm-2 required car-generation<?php echo $smart_filter_row; ?>"
                                             data-attr-id="<?php echo $smart_filter_row; ?>">
                                            <?php foreach ($car_generations as $car_generation_k => $car_generation) { ?>
                                                <?php if ($smart_filter['car_generation_id'] == $car_generation_k) { ?>
                                                    <input type="hidden"
                                                           name="smart_filter[<?php echo $smart_filter_row; ?>][car_generation_id]"
                                                           class="old-car-generation<?php echo $smart_filter_row; ?>"
                                                           value="<?php echo $car_generation['id']; ?>">
                                                <?php } ?>
                                            <?php } ?>
                                            <select class="form-control"
                                                    name="smart_filter[<?php echo $smart_filter_row; ?>][car_generation_id]"
                                                    disabled="disabled">
                                                <option value="0" selected="selected">Поколение</option>
                                                <?php foreach ($car_generations as $car_generation_k => $car_generation) { ?>
                                                    <?php if ($smart_filter['car_generation_id'] == $car_generation_k) { ?>
                                                        <option value="<?php echo $car_generation['id']; ?>"
                                                                selected="selected"><?php echo $car_generation['car_generation']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $car_generation['id']; ?>"><?php echo $car_generation['car_generation']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <div class="form-group col-sm-1">
                                        </div>

                                        <div class="form-group col-sm-1">
                                            <button type="button"
                                                    onclick="$('#smartfilter<?php echo $smart_filter_row; ?>').remove();"
                                                    data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i
                                                        class="fa fa-minus-circle"></i></button>
                                        </div>
                                    </div>
                                    <?php $smart_filter_row++; ?>
                                <?php } ?>
                            </div>
                            <div id="" class="row">
                                <div class="form-group col-sm-11"></div>
                                <div class="form-group col-sm-1">
                                    <button type="button" onclick="addSmartFilterRow();" data-toggle="tooltip" title=""
                                            class="btn btn-primary" data-original-title="Добавить атрибут"><i
                                                class="fa fa-plus-circle"></i></button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Универсальный товар</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <?php if ($universal_product) { ?>
                                            <input type="radio" name="universal_product" value="1" checked="checked"/>
                                            <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="universal_product" value="1"/>
                                            <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$universal_product) { ?>
                                            <input type="radio" name="universal_product" value="0" checked="checked"/>
                                            <?php echo $text_no; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="universal_product" value="0"/>
                                            <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Отображать после фильтрации</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <?php if ($show_after_filtration) { ?>
                                            <input type="radio" name="show_after_filtration" value="1"
                                                   checked="checked"/>
                                            <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="show_after_filtration" value="1"/>
                                            <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$show_after_filtration) { ?>
                                            <input type="radio" name="show_after_filtration" value="0"
                                                   checked="checked"/>
                                            <?php echo $text_no; ?>
                                        <?php } else { ?>
                                            <input type="radio" name="show_after_filtration" value="0"/>
                                            <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-product-tab">
                            <div class="row">
                                <div class="col-sm-2">
                                    <ul class="nav nav-pills nav-stacked" id="product-tab">
                                        <?php $product_tab_row = 0; ?>
                                        <?php $first_flg_ = true; ?>
                                        <?php foreach ($product_tabs as $product_tab) { ?>
                                            <li role="presentation"<?php if ($first_flg_) {
                                                $first_flg_ = false;
                                                echo " class=\"active\"";
                                            } ?>><a href="#tab-product-tab<?php echo $product_tab_row; ?>"
                                                    data-toggle="tab"><i class="fa fa-minus-circle"
                                                                         onclick="$('a[href=\'#tab-product-tab<?php echo $product_tab_row; ?>\']').parent().remove(); $('#tab-product-tab<?php echo $product_tab_row; ?>').remove(); $('#product-tab a:first').tab('show');"></i> <?php echo $product_tab['name']; ?>
                                                </a></li>
                                            <?php $product_tab_row++; ?>
                                        <?php } ?>
                                        <li>
                                            <input type="text" name="product_tab" value=""
                                                   placeholder="<?php echo $button_add_product_tab; ?>"
                                                   id="input-product-tab" class="form-control"/>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-sm-10">
                                    <div class="tab-content" id="tab-product-tab-tabs">

                                        <?php $product_tab_row = 0; ?>
                                        <?php $first1_flg_ = true; ?>
                                        <?php foreach ($product_tabs as $product_tab) { ?>
                                            <div role="tabpanel" class="tab-pane<?php if ($first1_flg_) {
                                                $first1_flg_ = false;
                                                echo " active";
                                            } ?>" id="tab-product-tab<?php echo $product_tab_row; ?>">
                                                <input type="hidden"
                                                       name="product_tab[<?php echo $product_tab_row; ?>][name]"
                                                       value="<?php echo $product_tab['name']; ?>"/>
                                                <input type="hidden"
                                                       name="product_tab[<?php echo $product_tab_row; ?>][tab_id]"
                                                       value="<?php echo $product_tab['tab_id']; ?>"/>

                                                <ul class="nav nav-tabs"
                                                    id="tab-product-tab<?php echo $product_tab_row; ?>-languages"
                                                    role="tablist">
                                                    <?php $first_flg_ = true; ?>
                                                    <?php foreach ($languages as $language) { ?>
                                                        <li role="presentation"<?php if ($first_flg_) {
                                                            $first_flg_ = false;
                                                            echo " class=\"active\"";
                                                        } ?>>
                                                            <a href="#tab-product-tab-<?php echo $product_tab_row; ?>-languages-<?php echo $language['language_id']; ?>"
                                                               data-toggle="tab" role="tab"><img
                                                                        src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"
                                                                        title="<?php echo $language['name']; ?>"/> <?php echo $language['name']; ?>
                                                            </a></li>
                                                    <?php } ?>
                                                </ul>
                                                <div class="tab-content">
                                                    <?php $first_flg_ = true; ?>
                                                    <?php foreach ($languages as $language) { ?>
                                                        <div role="tabpanel" class="tab-pane<?php if ($first_flg_) {
                                                            $first_flg_ = false;
                                                            echo " active";
                                                        } ?>"
                                                             id="tab-product-tab-<?php echo $product_tab_row; ?>-languages-<?php echo $language['language_id']; ?>">
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label"
                                                                       for="input-product-tab-<?php echo $product_tab_row; ?>-language-<?php echo $language['language_id']; ?>"><?php echo $product_tab['name']; ?></label>
                                                                <div class="col-sm-10"><textarea
                                                                            name="product_tab[<?php echo $product_tab_row; ?>][product_tab_description][<?php echo $language['language_id']; ?>][text]"
                                                                            rows="5"
                                                                            placeholder="<?php echo $product_tab['name']; ?>"
                                                                            id="input-product-tab-<?php echo $product_tab_row; ?>-language-<?php echo $language['language_id']; ?>"
                                                                            class="form-control"><?php echo isset($product_tab['product_tab_description'][$language['language_id']]) ? $product_tab['product_tab_description'][$language['language_id']]['text'] : ''; ?></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                </div>

                                            </div>
                                            <?php $product_tab_row++; ?>
                                        <?php } ?>

                                    </div>
                                </div>
                            </div>
                        </div>
	                    <div class="tab-pane" id="tab-related-options">
		
		                    <div class="form-group">
			                    <label class="col-sm-2 control-label"
			                           for="input-product_options_text">Текст опций, при первой загрузке </label>
			                    <div class="col-sm-10">
                                                <textarea
		                                                name="product_options_text"
		                                                rows="5" placeholder="Текст опций, при первой загрузке"
		                                                id="input-product_options_text"
		                                                class="form-control"><?php echo isset($product_options_text) ? $product_options_text : ''; ?></textarea>
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

        <?php if(stristr($_GET['route'], 'add')) { ?>

        $('#input-name' + config_language_id).change(function () {
            generateUrlOnAdd();
        });
        $('#input-model').change(function () {
            generateUrlOnAdd();
        });
        $('#input-sku').change(function () {
            generateUrlOnAdd();
        });

        function generateUrlOnAdd() {
            data = {
                name: $('#input-name' + config_language_id).val(),
                model: $('#input-model').val(),
                sku: $('#input-sku').val(),
                essence: 'product',
                product_id: ''
            };

            getSeoUrl(data);
        }

        <?php } else { ?>

        // enque button #generateUrlOnEdit
        $('#input-keyword').after('<br><button id="generateUrlOnEdit" class="btn btn-success">GENERATE SEO URL</button>');

        $('#generateUrlOnEdit').click(function (e) {
            e.preventDefault();

            data = {
                name: $('#input-name' + config_language_id).val(),
                model: $('#input-model').val(),
                sku: $('#input-sku').val(),
                essence: 'product',
                product_id: <?php echo $_GET['product_id']; ?>
            };

            getSeoUrl(data);
        });

        <?php } ?>

        function getSeoUrl(data) {
            $.ajax({
                url: 'index.php?route=extension/module/seo_url_generator/getSeoUrlByAjax&token=<?php echo $token; ?>',
                dataType: 'json',
                data: data,
                method: 'POST',
                beforeSend: function () {
                },
                success: function (response, textStatus, jqXHR) {
                    // success ajax query
                    if (response.result != '') {
                        $('#input-keyword').val(response.result);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    // Error ajax query
                    console.log('AJAX query Error: ' + textStatus);
                },
                complete: function () {
                },
            });
        }

    </script>
    <!-- SEO URL Generator.End -->
    <script type="text/javascript"><!--
	    ckeditorInit('input-product_options_text', getURLVar('token'));
        <?php if ($ckeditor) { ?>
        <?php foreach ($languages as $language) { ?>
        ckeditorInit('input-description<?php echo $language['language_id']; ?>', getURLVar('token'));
        ckeditorInit('input-additional-description-1<?php echo $language['language_id']; ?>', getURLVar('token'));
        ckeditorInit('input-additional-description-2<?php echo $language['language_id']; ?>', getURLVar('token'));
        <?php } ?>
        <?php } ?>
        <?php $product_tab_row_ = 0; ?>
        <?php foreach ($product_tabs as $product_tab) { ?>
        <?php foreach ($languages as $language) { ?>
        ckeditorInit('input-product-tab-<?php echo $product_tab_row_; ?>-language-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
        <?php } ?>
        <?php $product_tab_row_++; ?>
        <?php } ?>
        //--></script>
    <script type="text/javascript"><!--
        // Manufacturer
        $('input[name=\'manufacturer\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        json.unshift({
                            manufacturer_id: 0,
                            name: '<?php echo $text_none; ?>'
                        });

                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['manufacturer_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'manufacturer\']').val(item['label']);
                $('input[name=\'manufacturer_id\']').val(item['value']);
            }
        });

        // Category
        $('input[name=\'category\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['category_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'category\']').val('');

                $('#product-category' + item['value']).remove();

                $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#product-category').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();
        });

        // Filter
        $('input[name=\'filter\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['filter_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'filter\']').val('');

                $('#product-filter' + item['value']).remove();

                $('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#product-filter').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();
        });

        // Downloads
        $('input[name=\'download\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['download_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'download\']').val('');

                $('#product-download' + item['value']).remove();

                $('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#product-download').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();
        });

        // Related
        $('input[name=\'related\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_meta_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['meta_h1'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'related\']').val('');

                $('#product-related' + item['value']).remove();

                $('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#product-related').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();
        });

        // Related-Similar
        $('input[name=\'related_similar\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_meta_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['meta_h1'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'related_similar\']').val('');

                $('#product-related-similar' + item['value']).remove();

                $('#product-related-similar').append('<div id="product-related-similar' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related_similar[]" value="' + item['value'] + '" /></div>');
            }
        });

        $('#product-related-similar').delegate('.fa-minus-circle', 'click', function () {
            $(this).parent().remove();
        });
        //--></script>
    <script type="text/javascript"><!--
        var attribute_row = <?php echo $attribute_row; ?>;

        function addAttribute() {
            html = '<tr id="attribute-row' + attribute_row + '">';
            html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
            html += '  <td class="text-left">';
            <?php foreach ($languages as $language) { ?>
            html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
            <?php } ?>
            html += '  </td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#attribute tbody').append(html);

            attributeautocomplete(attribute_row);

            attribute_row++;
        }

        function attributeautocomplete(attribute_row) {
            $('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
                'source': function (request, response) {
                    $.ajax({
                        url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                        dataType: 'json',
                        success: function (json) {
                            response($.map(json, function (item) {
                                return {
                                    category: item.attribute_group,
                                    label: item.name,
                                    value: item.attribute_id
                                }
                            }));
                        }
                    });
                },
                'select': function (item) {
                    $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
                    $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
                }
            });
        }

        $('#attribute tbody tr').each(function (index, element) {
            attributeautocomplete(index);
        });
        //--></script>
    <script type="text/javascript"><!--
        var product_tab_row = <?php echo $product_tab_row; ?>;

        $('input[name=\'product_tab\']').autocomplete({
            delay: 500,
            source: function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/tab/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['tab_id']
                            }
                        }));
                    }
                });
            },
            select: function (item) {
                html = '<div role="tabpanel" class="tab-pane" id="tab-product-tab' + product_tab_row + '">';
                html += '  <input type="hidden" name="product_tab[' + product_tab_row + '][name]" value="' + item['label'] + '" />';
                html += '  <input type="hidden" name="product_tab[' + product_tab_row + '][tab_id]" value="' + item['value'] + '" />';

                html += '  <ul class="nav nav-tabs" id="tab-product-tab' + product_tab_row + '-languages" role="tablist">';
                <?php $first_flg_ = true; ?>
                <?php foreach ($languages as $language) { ?>
                html += '    <li role="presentation"<?php if ($first_flg_) {
                    $first_flg_ = false;
                    echo " class=\"active\"";
                } ?>><a href="#tab-product-tab-' + product_tab_row + '-languages-<?php echo $language['language_id']; ?>" data-toggle="tab" role="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
                <?php } ?>
                html += '  </ul>';

                html += '  <div class="tab-content">';
                <?php $first_flg_ = true; ?>
                <?php foreach ($languages as $language) { ?>
                html += '    <div role="tabpanel" class="tab-pane<?php if ($first_flg_) {
                    $first_flg_ = false;
                    echo " active";
                } ?>" id="tab-product-tab-' + product_tab_row + '-languages-<?php echo $language['language_id']; ?>">';
                html += '      <div class="form-group">';
                html += '        <label class="col-sm-2 control-label" for="input-product-tab-' + product_tab_row + '-language-<?php echo $language['language_id']; ?>">' + item['label'] + '</label>';
                html += '        <div class="col-sm-10"><textarea name="product_tab[' + product_tab_row + '][product_tab_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="' + item['label'] + '" id="input-product-tab-' + product_tab_row + '-language-<?php echo $language['language_id']; ?>" class="form-control"></textarea></div>';
                html += '      </div>';
                html += '    </div>';
                <?php } ?>
                html += '  </div>';

                html += '</div>';

                $('#tab-product-tab-tabs').append(html);

                $('#product-tab > li:last-child').before('<li><a href="#tab-product-tab' + product_tab_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-product-tab' + product_tab_row + '\\\']\').parent().remove(); $(\'#tab-product-tab' + product_tab_row + '\').remove(); $(\'#product-tab a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

                $('#product-tab a[href=\'#tab-product-tab' + product_tab_row + '\']').tab('show');

                <?php foreach ($languages as $language) { ?>
                <?php if ($ckeditor) { ?>
                ckeditorInit('input-product-tab-' + product_tab_row + '-language-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
                <?php } else { ?>
                $('#input-product-tab-' + product_tab_row + '-language-<?php echo $language['language_id']; ?>').summernote({
                    height: 300,
                    lang: '<?php echo $lang; ?>'
                });
                <?php } ?>
                <?php } ?>

                product_tab_row++;

                $(this).val('');

                return false;
            },
            focus: function (item) {
                return false;
            }
        });
        //--></script>
    <script type="text/javascript"><!--
        var option_row = <?php echo $option_row; ?>;

        $('input[name=\'option\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                category: item['category'],
                                label: item['name'],
                                value: item['option_id'],
                                type: item['type'],
                                option_value: item['option_value']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                html = '<div class="tab-pane" id="tab-option' + option_row + '">';
                html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
                html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
                html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
                html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
                html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
                html += '	      <option value="1"><?php echo $text_yes; ?></option>';
                html += '	      <option value="0"><?php echo $text_no; ?></option>';
                html += '	  </select></div>';
                html += '	</div>';

                if (item['type'] == 'text') {
                    html += '	<div class="form-group">';
                    html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                    html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                    html += '	</div>';
                }

                if (item['type'] == 'textarea') {
                    html += '	<div class="form-group">';
                    html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                    html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
                    html += '	</div>';
                }

                if (item['type'] == 'file') {
                    html += '	<div class="form-group" style="display: none;">';
                    html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                    html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                    html += '	</div>';
                }

                if (item['type'] == 'date') {
                    html += '	<div class="form-group">';
                    html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                    html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                    html += '	</div>';
                }

                if (item['type'] == 'time') {
                    html += '	<div class="form-group">';
                    html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                    html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                    html += '	</div>';
                }

                if (item['type'] == 'datetime') {
                    html += '	<div class="form-group">';
                    html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                    html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                    html += '	</div>';
                }

                if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image' || item['type'] == 'picture' || item['type'] == 'text') {
                    html += '<div class="table-responsive">';
                    html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                    html += '  	 <thead>';
                    html += '      <tr>';
                    html += '        <td class="text-left" style="width: 200px;"><?php echo $entry_option_value; ?></td>';
                    html += '        <td class="text-right" style="width: 150px;"><?php echo $entry_price . ' / ' . $entry_base_price; ?></td>';
                    html += '        <td class="text-right">Изображение:</td>';
                    html += '        <td class="text-right">Описание опции:</td>';
                    html += '        <td></td>';
                    html += '      </tr>';
                    html += '  	 </thead>';
                    html += '  	 <tbody>';
                    html += '    </tbody>';
                    html += '    <tfoot>';
                    html += '      <tr>';
                    html += '        <td colspan="4"></td>';
                    html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
                    html += '      </tr>';
                    html += '    </tfoot>';
                    html += '  </table>';
                    html += '</div>';

                    html += '  <select id="option-values' + option_row + '" style="display: none;">';

                    for (i = 0; i < item['option_value'].length; i++) {
                        html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                    }

                    html += '  </select>';
                    html += '</div>';
                }

                $('#tab-option .tab-content').append(html);

                $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + item['label'] + '</li>');

                $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

                $('[data-toggle=\'tooltip\']').tooltip({
                    container: 'body',
                    html: true
                });

                $('.date').datetimepicker({
                    pickTime: false
                });

                $('.time').datetimepicker({
                    pickDate: false
                });

                $('.datetime').datetimepicker({
                    pickDate: true,
                    pickTime: true
                });


                option_row++;
            }
        });
        //--></script>
    <script type="text/javascript"><!--
        var option_value_row = <?php echo $option_value_row; ?>;

        function addOptionValue(option_row) {
            html = '<tr id="option-value-row' + option_value_row + '">';
            html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
            html += $('#option-values' + option_row).html();
            html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';

            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="1000000000" />';
            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" value="0" />';

            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" value="+" />';
            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="0" />';

            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" value="+" />';
            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="0" />';

            html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
            html += '    <option value="+">+</option>';
            html += '    <option value="-">-</option>';
            html += '  </select>';
            html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /> / ';
            html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][base_price]" value="" placeholder="<?php echo $entry_base_price; ?>" class="form-control" /></td>';

            html += '<td class="text-center">';
            html += '<div class="form-group">';
            html += '<a href="" id="thumb-product_option' + option_row + '-image' + option_value_row + '" data-toggle="image" class="img-thumbnail">';
            html += '<img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />';
            html += '</a>';
            html += '<input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_image]" value="" id="input-product_option' + option_row + '-image' + option_value_row + '" />';
            html += '</div>';
            html += '</td>';

            html += '<td class="text-center">';
            html += '<div class="form-group">';
            html += '<div class="col-sm-12">';
            html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_name]" value="" placeholder="Название опции" class="form-control" /> / ';
            html += '</textarea>';
            html += '</div>';
            html += '</div>';
            html += '</td>';

            html += '<td class="text-center">';
            html += '<div class="form-group">';
            html += '<div class="col-sm-12">';
            html += '<textarea name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_description]" id="product_option' + option_value_row + '_option_description"  placeholder="Описание опции" class="form-control" >';
            html += '</textarea>';
            html += '</div>';
            html += '</div>';
            html += '</td>';


            html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#option-value' + option_row + ' tbody').append(html);
            $('[rel=tooltip]').tooltip();


            ckeditorInit('product_option' + option_value_row + '_option_description', getURLVar('token'));
            CKEDITOR.config.height = 50;
            CKEDITOR.config.language = 'ru';

            option_value_row++;
        }

        //--></script>
    <script type="text/javascript"><!--
        var discount_row = <?php echo $discount_row; ?>;

        function addDiscount() {
            html = '<tr id="discount-row' + discount_row + '">';
            html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
            <?php foreach ($customer_groups as $customer_group) { ?>
            html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
            <?php } ?>
            html += '  </select></td>';
            html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
            html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
            html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /> / <input type="text" name="product_discount[' + discount_row + '][base_price]" value="" placeholder="<?php echo $entry_base_price; ?>" class="form-control" /></td>';
            html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
            html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#discount tbody').append(html);

            $('.date').datetimepicker({
                pickTime: false
            });

            discount_row++;
        }

        //--></script>
    <script type="text/javascript"><!--
        var special_row = <?php echo $special_row; ?>;

        function addSpecial() {
            html = '<tr id="special-row' + special_row + '">';
            html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
            <?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
            <?php } ?>
            html += '  </select></td>';
            html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
            html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /> / <input type="text" name="product_special[' + special_row + '][base_price]" value="" placeholder="<?php echo $entry_base_price; ?>" class="form-control" /></td>';
            html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
            html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#special tbody').append(html);

            $('.date').datetimepicker({
                pickTime: false
            });

            special_row++;
        }

        //--></script>
    <script type="text/javascript"><!--
        var image_row = <?php echo $image_row; ?>;

        function addImage() {
            html = '<tr id="image-row' + image_row + '">';
            html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
            html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#images tbody').append(html);

            image_row++;
        }

        //--></script>
    <script type="text/javascript"><!--
        var recurring_row = <?php echo $recurring_row; ?>;

        function addRecurring() {
            html = '<tr id="recurring-row' + recurring_row + '">';
            html += '  <td class="left">';
            html += '    <select name="product_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
            <?php foreach ($recurrings as $recurring) { ?>
            html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
            <?php } ?>
            html += '    </select>';
            html += '  </td>';
            html += '  <td class="left">';
            html += '    <select name="product_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
            <?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
            <?php } ?>
            html += '    <select>';
            html += '  </td>';
            html += '  <td class="left">';
            html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
            html += '  </td>';
            html += '</tr>';

            $('#tab-recurring table tbody').append(html);

            recurring_row++;
        }

        //--></script>
    <script type="text/javascript"><!--
        $('.date').datetimepicker({
            pickTime: false
        });

        $('.time').datetimepicker({
            pickDate: false
        });

        $('.datetime').datetimepicker({
            pickDate: true,
            pickTime: true
        });
        //--></script>
    <script type="text/javascript"><!--
        $('#language a:first').tab('show');
        $('#option a:first').tab('show');
        //--></script>
</div>

<style type="text/css">
    #tab-smart-filter .car-mark,
    #tab-smart-filter .car-model,
    #tab-smart-filter .car-generation {
        width: 75%;
    }

    .form-horizontal #tab-smart-filter .form-group {
        margin-left: 0;
        margin-right: 0;
    }

    .form-horizontal #tab-smart-filter .row {
        border-top: 1px solid #ededed;
        margin-left: 0;
        margin-right: 0;
    }
</style>
<script type="text/javascript">
    var smart_filter_row = <?php echo $smart_filter_row; ?>;

    function addSmartFilterRow() {

        html = '<div id="smartfilter' + smart_filter_row + '" class="row">';

        html += '<div class="form-group col-sm-2 required">';
        html += '<select id="start-year" name="smart_filter[' + smart_filter_row + '][start_year_id]" class="form-control">';
        html += '<option value="0" selected="selected">Начальный год</option>';
        <?php foreach ($car_years as $car_year) { ?>
        html += '<option value="<?php echo $car_year['car_year']; ?>"><?php echo $car_year['car_year']; ?></option>';
        <?php } ?>
        html += '</select>';
        html += '</div>';

        html += '<div class="form-group col-sm-2 required">';
        html += '<select id="" name="smart_filter[' + smart_filter_row + '][end_year_id]" class="form-control end-year">';
        html += '<option value="0" selected="selected">Конечный год</option>';
        <?php foreach ($car_years as $car_year) { ?>
        html += '<option value="<?php echo $car_year['car_year']; ?>"><?php echo $car_year['car_year']; ?></option>';
        <?php } ?>
        html += '</select>';
        html += '</div>';


        html += '<div class="form-group col-sm-2 required car-mark' + smart_filter_row + '" data-attr-id="' + smart_filter_row + '">';
        html += '<select class="form-control" name="smart_filter[' + smart_filter_row + '][car_mark_id]" onchange="setCarModel(this);">';
        html += '<option value="0" selected="selected">Марка</option>';
        <?php foreach ($car_marks as $car_mark_k => $car_mark) { ?>
        html += '<option value="<?php echo $car_mark['id']; ?>"><?php echo $car_mark['car_mark']; ?></option>';
        <?php } ?>
        html += '</select>';
        html += '</div>';


        html += '<div class="form-group col-sm-2 required car-model' + smart_filter_row + '" data-attr-id="' + smart_filter_row + '">';
        html += '<select class="form-control" name="smart_filter[' + smart_filter_row + '][car_model_id]" disabled="disabled" onchange="setCarGeneration(this);">';
        html += '<option value="0" selected="selected">Модель</option>';
        <?php foreach ($car_models as $car_model_k => $car_model) { ?>
        html += '<option value="<?php echo $car_model['id']; ?>"><?php echo $car_model['car_model']; ?></option>';
        <?php } ?>
        html += '</select>';
        html += '</div>';


        html += '<div class="form-group col-sm-2 required car-generation' + smart_filter_row + '">';
        html += '<select class="form-control" name="smart_filter[' + smart_filter_row + '][car_generation_id]" disabled="disabled">';
        html += '<option value="0" selected="selected">Поколение</option>';
        <?php foreach ($car_generations as $car_generation_k => $car_generation) { ?>
        html += '<option value="<?php echo $car_generation['id']; ?>"><?php echo $car_generation['car_generation']; ?></option>';
        <?php } ?>
        html += '</select>';
        html += '</div>';


        html += '<div class="form-group col-sm-1"></div>';

        html += '<div class="form-group col-sm-1">';
        html += '<button type="button" onclick="$(\'#smartfilter' + smart_filter_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">';
        html += '<i class="fa fa-minus-circle"></i>';
        html += '</button>';
        html += '</div>';
        html += '</div>';

        $('#smart_filter_content').append(html);

        // smartFilterAutocompleteMark(smart_filter_row);
        // smartFilterAutocompleteModel(smart_filter_row);
        // smartFilterAutocompleteGeneration(smart_filter_row);

        smart_filter_row++;


    }

    function setCarModel(smartRow) {

        var $this = $(smartRow);
        var attrId = $this.parent().data('attr-id');
        var $carModel = $('.car-model' + attrId + ' select');
        var $carGeneration = $('.car-generation' + attrId + ' select');
        var carMarkId = $('.car-mark' + attrId + ' select').val();

        $.ajax({
            url: 'index.php?route=catalog/product/smartFilterGetModels&token=<?php echo $token; ?>&car_mark=' + carMarkId,
            dataType: 'json',
            beforeSend: function () {
            },
            success: function (json, textStatus, jqXHR) {

                var modelHtml = '<option value="">Модель</option>';
                if (json) {

                    $carModel.empty().prop("disabled", false);

                    json.forEach(function (element) {
                        modelHtml += '  <option value="' + element.model_id + '">' + element.car_model + '</option>';
                    });

                } else {
                    $carModel.empty().prop("disabled", true);
                    $carGeneration.empty().prop("disabled", true);
                    $carGeneration.html('<option value="">Поколение</option>');
                }
                $carModel.html(modelHtml);
                $('.old-car-model' + attrId).remove();
                $('.old-car-generation' + attrId).remove();

            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            },
        });

    }

    function setCarGeneration(smartRow) {

        var $this = $(smartRow);
        var attrId = $this.parent().data('attr-id');
        var $carGeneration = $('.car-generation' + attrId + ' select');
        var carModelId = $('.car-model' + attrId + ' select').val();

        $.ajax({
            url: 'index.php?route=catalog/product/smartFilterGetGenerations&token=<?php echo $token; ?>&car_model=' + carModelId,
            dataType: 'json',
            beforeSend: function () {
            },
            success: function (json, textStatus, jqXHR) {

                var generationHtml = '<option value="">Поколение</option>';
                if (json) {

                    $carGeneration.empty().prop("disabled", false);

                    json.forEach(function (element) {
                        generationHtml += '  <option value="' + element.generation_id + '">' + element.car_generation + '</option>';
                    });

                } else {
                    $carGeneration.empty().prop("disabled", true);
                }
                $carGeneration.html(generationHtml);


            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            },
        });

    }


    function smartFilterAutocompleteMark(smart_filter_row) {
        $('input[name=\'smart_filter[' + smart_filter_row + '][car_mark]\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/smartFilterAutocomplete&token=<?php echo $token; ?>&car_mark=' + encodeURIComponent(request) + '&field=mark',
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item.car_mark,
                                value: item.id
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'smart_filter[' + smart_filter_row + '][car_mark]\']').val(item['label']);
                $('input[name=\'smart_filter[' + smart_filter_row + '][car_mark_id]\']').val(item['value']);
            }
        });
    }

    function smartFilterAutocompleteModel(smart_filter_row) {
        $('input[name=\'smart_filter[' + smart_filter_row + '][car_model]\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/smartFilterAutocomplete&token=<?php echo $token; ?>&car_model=' + encodeURIComponent(request) + '&field=model',
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item.car_model,
                                value: item.id
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'smart_filter[' + smart_filter_row + '][car_model]\']').val(item['label']);
                $('input[name=\'smart_filter[' + smart_filter_row + '][car_model_id]\']').val(item['value']);
            }
        });
    }

    function smartFilterAutocompleteGeneration(smart_filter_row) {
        $('input[name=\'smart_filter[' + smart_filter_row + '][car_generation]\']').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/smartFilterAutocomplete&token=<?php echo $token; ?>&car_generation=' + encodeURIComponent(request) + '&field=generation',
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item.car_generation,
                                value: item.id
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $('input[name=\'smart_filter[' + smart_filter_row + '][car_generation]\']').val(item['label']);
                $('input[name=\'smart_filter[' + smart_filter_row + '][car_generation_id]\']').val(item['value']);
            }
        });
    }

    $('#smart_filter_content .row').each(function (index, element) {
        smartFilterAutocompleteMark(index);
    });

    $('#smart_filter_content .row').each(function (index, element) {
        smartFilterAutocompleteModel(index);
    });

    $('#smart_filter_content .row').each(function (index, element) {
        smartFilterAutocompleteGeneration(index);
    });


</script>

<?php echo $footer; ?>
