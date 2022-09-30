<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="button" data-toggle="tooltip"
                        title="Сохранить" class="btn btn-primary" onclick="$('#form-product_stickers').submit();">
                    <i class="fa fa-save"></i>
                </button>
                <a href="<?php echo $add; ?>" data-toggle="tooltip" title="Добавить" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                <button type="button" data-toggle="tooltip" title="Удалить" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;">
                    <i class="fa fa-trash-o"></i>
                </button>
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
                <h3 class="panel-title"><i class="fa fa-list"></i> Описание с картинками</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                <td class="text-center">Изображение</td>
                                <td class="text-center">Имя</td>
                                <td class="text-center">Описание</td>
                                <td class="text-left">Сортировка</td>
                                <td class="text-left">Статус</td>
                                <td class="text-right">Действие</td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if ($product_stickers) { ?>
                                <?php foreach ($product_stickers as $product_sticker) { ?>
                                    <tr>
                                        <td class="text-center">
                                                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" /></td>
                                        <td class="text-center">
                                            <?php if ($product_sticker['image']) { ?>
                                                <img src="<?php echo $product_sticker['image']; ?>" alt="<?php echo $product_sticker['description']; ?>" class="img-thumbnail" />
                                            <?php } ?>
                                        </td>

                                        <td class="text-left"><?php echo $product_sticker['name']; ?></td>
                                        <td class="text-left"><?php echo $product_sticker['description']; ?></td>
                                        <td class="text-center"><?php echo $product_sticker['sort_order']; ?></td>
                                        <td class="text-center"><?php echo ($product_sticker['status'] == 1) ? 'Включено' : 'Отключено'; ?></td>
                                        <td class="text-center">
                                            <a href="index.php?route=extension/module/product_stickers/edit&token=<?php echo $token; ?>&product_sticker=<?php echo $product_sticker['id']; ?>"
                                                data-toggle="tooltip" title="Редактировать" class="btn btn-primary">
                                            <i class="fa fa-pencil"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>

                </form>

                <form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" id="form-product_stickers">

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width">Ширина изобржения</label>
                        <div class="col-sm-2">
                            <input type="text" name="product_stickers[width]"  value="<?php echo isset($product_stickers_conf['width']) ? $product_stickers_conf['width'] : ''; ?>" placeholder="Ширина изобржения" id="input-width" class="form-control" />
                        </div>

                        <label class="col-sm-2 control-label" for="input-height">Высота изобржения</label>
                        <div class="col-sm-2">
                            <input type="text" name="product_stickers[height]"  value="<?php echo isset($product_stickers_conf['height']) ? $product_stickers_conf['height'] : ''; ?>" placeholder="Высота изобржения" id="input-height" class="form-control" />
                        </div>

                        <label class="col-sm-2 control-label" for="input-image_variant">Отображение названия</label>
                        <div class="col-sm-2">
                            <select name="product_stickers[image_variant]" id="input-image_variant" class="form-control">
                                <?php if ($product_stickers_conf['image_variant']) { ?>
                                    <option value="1">Перед изображением</option>
                                    <option value="0" selected="selected">За изображением</option>
                                <?php } else { ?>
                                    <option value="1" selected="selected">Перед изображением</option>
                                    <option value="0">За изображением</option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>


                </form>

            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
