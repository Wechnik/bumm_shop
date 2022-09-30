<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
            </div>
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
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-center" style="width: 45%;">Товар в 1С</td>
                                <td class="text-center" style="width: 45%;">Товар на сайте</td>
                                <td class="text-center" style="width: 10%;">Действие</td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $sync_product_row = 0; ?>
                            <?php if ($tmp_sync_products) { ?>

                                <?php foreach ($tmp_sync_products as $sync_products) { ?>

                                    <?php $count_sync_products = count($sync_products); ?>

                                    <?php $tmp_counter = 1; ?>

                                    <?php foreach ($sync_products as $sync_product) { ?>

                                        <tr class="sync_products<?= $sync_product_row; ?> <?php if($count_sync_products !== $tmp_counter ){ ?> <?php echo $sync_product['1c_code']; ?> <?php } ?>">
                                            <td class="text-left">
                                                <?php echo $sync_product['1c_name']; ?>
                                                <input type="hidden"
                                                       name="sync_shop_product[<?php echo $sync_product['1c_code']; ?>][<?php echo $sync_product_row; ?>][sync_product_code]"
                                                       value="<?php echo $sync_product['1c_code']; ?>"
                                                       class="form-control shop-product-code" />
                                                <input type="hidden"
                                                       name="sync_shop_product[<?php echo $sync_product['1c_code']; ?>][<?php echo $sync_product_row; ?>][sync_product_name]"
                                                       value="<?php echo $sync_product['1c_name']; ?>"
                                                       class="form-control shop-product-code" />

                                            </td>
                                            <td class="text-left sync-code">

                                                <input type="hidden"
                                                       name="sync_shop_product[<?php echo $sync_product['1c_code']; ?>][<?php echo $sync_product_row; ?>][shop_product_code]"
                                                       value="<?php echo $sync_product['shop_code']; ?>"
                                                       class="form-control shop-product-code" />
                                                <input type="text" id="<?php echo $sync_product['1c_code']; ?>"
                                                       name="sync_shop_product[<?php echo $sync_product['1c_code']; ?>][<?php echo $sync_product_row; ?>][shop_product_name]"
                                                       value="<?php echo $sync_product['shop_name']; ?>"
                                                       class="form-control shop-product-code" />


                                            </td>
<!--                                            onclick="$('.sync_products--><?//= $sync_product_row; ?><!--').remove();"-->
                                            <td class="text-left">
                                                    <button type="button"
                                                            onclick="removeRow($(this));"
                                                            data-toggle="tooltip" title="Удалить"

                                                            <?php if($count_sync_products == $tmp_counter ){ ?>
                                                                data-main-product="1"
                                                            <?php } else { ?>
                                                                data-main-product="0"
                                                            <?php } ?>

                                                            data-ccode="<?php echo $sync_product['1c_code']; ?>"

                                                            class="btn btn-danger"><i class="fa fa-minus-circle"></i>
                                                    </button>
                                                <?php if($count_sync_products == $tmp_counter ){ ?>
                                                    <button type="button"
                                                            data-cname='<?php echo $sync_product['1c_name']; ?>'
                                                            data-ccode='<?php echo $sync_product['1c_code']; ?>'
                                                            data-sname='<?php echo $sync_product['shop_name']; ?>'
                                                            data-scode='<?php echo $sync_product['shop_code']; ?>'
                                                            onclick="addSiteProduct($(this));"
                                                            data-toggle="tooltip"
                                                            title="" class="btn btn-primary"
                                                            data-original-title="Добавить">
                                                        <i class="fa fa-plus-circle"></i>
                                                    </button>
                                                <?php } ?>


                                            </td>
                                        </tr>
                                        <?php $tmp_counter++; ?>
                                        <?php $sync_product_row++; ?>
                                    <?php } ?>

                                <?php } ?>


                            <?php } else { ?>
                                <tr>
                                    <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $( document ).ready(function() {
        autocomplete();
    });

    function autocomplete(){
        $('.shop-product-code').autocomplete({
            'source': function (request, response) {

                var metaName = $(this).val();

                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_meta_name=' + metaName,
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            'select': function (item) {
                $(this).parent().find('.shop-product-code').val(item['value']);
                $(this).val(item['label']);
            }
        });
    }


    var sync_product_row = <?= $sync_product_row; ?>;

    function addSiteProduct($this) {

        var
            cname = $this.attr('data-cname'),
            ccode = $this.attr('data-ccode'),
            sname = $this.attr('data-sname'),
            scode = $this.attr('data-scode');


        html = '<tr class="sync_products' + sync_product_row + ' ' + ccode +' ">';

        html += '<td class="text-left">';
        html += cname;
        html += '<input type="hidden" name="sync_shop_product[' + ccode + '][' + sync_product_row + '][sync_product_code]" value="' + ccode + '" class="form-control shop-product-code"/>';
        html += '<input type="hidden" name="sync_shop_product[' + ccode + '][' + sync_product_row + '][sync_product_name]" value="' + cname + '" class="form-control shop-product-code"/>';
        html += '</td>';

        html += '<td class="text-left">';
        html += '<input type="hidden" name="sync_shop_product[' + ccode + '][' + sync_product_row + '][shop_product_code]" value="' + scode + '" class="form-control shop-product-code"/>';
        html += '<input type="text" name="sync_shop_product[' + ccode + '][' + sync_product_row + '][shop_product_name]" value="" class="form-control shop-product-code"/>';
        html += '</td>';

        html += '<td class = "text-left" >';
        html += '<button type = "button" onclick = "$(\'.sync_products' + sync_product_row + '\').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger" > <i class="fa fa-minus-circle" > </i></button>';
        html += '</td>';

        html += '</tr>';

        $this.parent().parent().after(html);

        autocomplete();

        sync_product_row++;
    }

    function removeRow($this) {

        var mainProduct = $this.attr('data-main-product');

        if(mainProduct == 0) {
            $this.closest('tr').remove();
        } else {
            var mainProductHtml = $this.closest('tr').find('.sync-code input').val('');
            var syncCode = $this.attr('data-ccode');
            $("." + syncCode).remove();
        }

    }

</script>
<?php echo $footer; ?>
