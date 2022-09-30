<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-category" data-toggle="tooltip" title="Сохранить" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="Отиенить" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Редактирование модуля</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product_stickers" class="form-horizontal">

                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-name">Название</label>
                        <div class="col-sm-10">
                            <input type="text" name="product_stickers[name]"  value="<?php echo isset($product_stickers['name']) ? $product_stickers['name'] : ''; ?>" placeholder="Название" id="input-name" class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-description">Описание</label>
                        <div class="col-sm-10">
                            <textarea name="product_stickers[description]" placeholder="Описание" id="input-description" class="form-control summernote"><?php echo isset($product_stickers['description']) ? $product_stickers['description'] : ''; ?>
                            </textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Изображение</label>
                        <div class="col-sm-10">
                            <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
                                <img src="<?php echo $product_stickers['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                            <input type="hidden" name="product_stickers[image]" value="<?php echo $product_stickers['image']; ?>" id="input-image" />
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sort-order">Порядок сортировки</label>
                        <div class="col-sm-10">
                            <input type="text" name="product_stickers[sort_order]" value="<?php echo $product_stickers['sort_order']; ?>"
                                   placeholder="Порядок сортировки" id="input-sort-order" class="form-control" />
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status">Статус</label>
                        <div class="col-sm-10">
                            <select name="product_stickers[status]" id="input-status" class="form-control">
                                <?php if ($product_stickers['status']) { ?>
                                    <option value="1" selected="selected">Включено</option>
                                    <option value="0">Отключено</option>
                                <?php } else { ?>
                                    <option value="1">Включено</option>
                                    <option value="0" selected="selected">Отключено</option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>



                </form>
            </div>
        </div>
    </div>

<script type="text/javascript"><!--
    ckeditorInit('input-description', getURLVar('token'));
//--></script>

<?php echo $footer; ?>
