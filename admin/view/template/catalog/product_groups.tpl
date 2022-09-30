<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="tab-description" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Группы товаров</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="tab-description" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li><a href="#tab-product-tab" data-toggle="tab">Текст для после описания</a></li>
                        <li class="active"><a href="#tab-product-tab-categories" data-toggle="tab">Категории</a></li>
                    </ul>
                    <div class="tab-content">

                        <div class="tab-pane" id="tab-product-tab">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left">Название группы</td>
                                        <td class="text-left">Товары</td>
                                        <td class="text-left"></td>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <?php $product_group_row = 0; ?>

                                    <?php foreach ($product_groups as $product_group) { ?>

                                        <tr id="product-group<?php echo $product_group_row; ?>">
                                            <td class="text-left col-md-4">
                                                <input type="text" name="product_group_name" value="<?php echo $product_group['product_group_name']; ?>" placeholder="Название группы" class="form-control" />
                                                <input type="hidden" name="product_group_id" value="<?php $product_group['product_group_id']?>">
                                            </td>
                                            <td class="text-left col-md-7">
                                                <select class="product_tab_select" name="product_tab_select<?php echo $product_product_description['product_description_id']; ?>[]" class="form-control" multiple>

                                                    <?php foreach ($products_tab as $product_k => $product) { ?>
                                                        <?php if (in_array($product['product_id'], $checked_tab_products[$product_product_description['product_description_id']])) { ?>
                                                            <option value="<?php echo $product['product_id']; ?>" selected><?php echo $product['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></option>
                                                        <?php } ?>
                                                    <?php } ?>

                                                </select>
                                            </td>

                                            <td class="text-left">
                                                <button type="button" onclick="$('#product-group<?php echo $product_group_row; ?>').remove()"
                                                        data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">
                                                    <i class="fa fa-minus-circle"></i>
                                                </button>
                                            </td>

                                        </tr>

                                        <?php $product_group_row++; ?>

                                    <?php } ?>


                                    </tbody>


                                    <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td class="text-left">
                                            <button type="button" onclick="addProductGroup()" data-toggle="tooltip" title="Добавить" class="btn btn-primary">
                                                <i class="fa fa-plus-circle"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    </tfoot>
                                    
                                    
                                </table>
                            </div>
                        </div>



                        <div class="tab-pane active" id="tab-product-tab-categories">
                            <div class="table-responsive">
                                <style>
                                    .categories_1000 ul {
                                        display: block !important;
                                    }
                                </style>
                                <div class="box">
                                    <div class="box-heading"><?php echo $heading_title ?></div>
                                    <div class="box-content">
                                        <div class="box-category"><?php echo $category_accordion_menu ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <script type="text/javascript">
        
        function addProductGroup() {
            
        }
        
    </script>

    <script type="text/javascript"><!--
        $('#language a:first').tab('show');
        //--></script></div>

<script type="text/javascript">
    $('.product_tab_select').multiSelect({});
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
        width: 900px;
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
