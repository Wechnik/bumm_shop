<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-custom_category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-custom_category" class="form-horizontal">


            <div class="form-group">
                <label class="col-sm-2 control-label" >Название модуля</label>
                <div class="col-sm-4">
                    <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control"/>
                </div>

                <label class="col-sm-1 control-label" >Кол-во</label>
                <div class="col-sm-2">
                    <select name="quantity" class="form-control">
                            <option value="0">Выберите</option>
                            <option value="6" <?php if ($quantity == 2) { echo 'selected="selected"'; } ?> >2</option>
                            <option value="4" <?php if ($quantity == 3) { echo 'selected="selected"'; } ?> >3</option>
                            <option value="3" <?php if ($quantity == 4) { echo 'selected="selected"'; } ?> >4</option>
                            <option value="2" <?php if ($quantity == 6) { echo 'selected="selected"'; } ?> >6</option>
                    </select>
                </div>

                <label class="col-sm-1 control-label" >Статус</label>
                <div class="col-sm-2">
                    <select name="status" class="form-control">
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

            <?php $custom_category_row = 0; ?>

            <?php foreach ($custom_categories as $custom_category) { ?>


                <div class="custom-category<?php echo $custom_category_row; ?>">

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name[<?php echo $custom_category_row; ?>]"><?php echo $entry_name; ?></label>
                        <div class="col-sm-2">
                            <input type="text" name="custom_category[<?php echo $custom_category_row; ?>][name]"
                                   value="<?php echo $custom_category['name']; ?>" placeholder="<?php echo $entry_name; ?>"
                                   id="input-name[<?php echo $custom_category_row; ?>]" class="form-control"/>
                        </div>

                        <label class="col-sm-2 control-label" for="input-width[<?php echo $custom_category_row; ?>]"><?php echo $entry_width; ?></label>
                        <div class="col-sm-2">
                            <input type="text" name="custom_category[<?php echo $custom_category_row; ?>][width]" value="<?php echo $custom_category['width']; ?>"
                                   placeholder="<?php echo $entry_width; ?>" id="input-width[<?php echo $custom_category_row; ?>]" class="form-control"/>
                        </div>

                        <label class="col-sm-2 control-label" for="input-height[<?php echo $custom_category_row; ?>]"><?php echo $entry_height; ?></label>
                        <div class="col-sm-2">
                            <input type="text" name="custom_category[<?php echo $custom_category_row; ?>][height]" value="<?php echo $custom_category['height']; ?>"
                                   placeholder="<?php echo $entry_height; ?>" id="input-height[<?php echo $custom_category_row; ?>]" class="form-control"/>
                        </div>

                    </div>


                    <div class="form-group">

                        <label class="col-sm-2 control-label" for="input-category">Категория</label>
                        <div class="col-sm-2">
                            <select id="custom_category<?php echo $custom_category_row; ?>"
                                    name="custom_category[<?php echo $custom_category_row; ?>][category_id]" class="form-control">
                                <option value="0" selected="selected">Выберите</option>
                                <?php foreach ($categories as $category) { ?>
                                    <?php if($category['category_id'] == $custom_category['category_id']) { ?>
                                        <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </div>

                        <label class="col-sm-2 control-label" for="input-show_image<?php echo $custom_category_row; ?>">Отображать/Скрыть изображение</label>
                        <div class="col-sm-2">
                            <select name="custom_category[<?php echo $custom_category_row; ?>][show_image]" id="input-show_image<?php echo $custom_category_row; ?>" class="form-control">
                                <?php if ($custom_category['show_image']) { ?>
                                    <option value="1" selected="selected">Отображать</option>
                                    <option value="0">Скрыть</option>
                                <?php } else { ?>
                                    <option value="1">Отображать</option>
                                    <option value="0" selected="selected">Скрыть</option>
                                <?php } ?>
                            </select>
                        </div>

                        <label class="col-sm-2 control-label" for="input-status<?php echo $custom_category_row; ?>"><?php echo $entry_status; ?></label>
                        <div class="col-sm-2">
                            <select name="custom_category[<?php echo $custom_category_row; ?>][status]" id="input-status<?php echo $custom_category_row; ?>" class="form-control">
                                <?php if ($custom_category['status']) { ?>
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

                        <label class="col-sm-2 control-label">Изображение</label>
                        <div class="col-sm-2">
                            <a href="" id="thumb-image<?php echo $custom_category_row; ?>" data-toggle="image" class="img-thumbnail">
                                <img src="<?php echo $custom_category['thumb']; ?>" alt="" title=""
                                     data-placeholder="<?php echo $placeholder; ?>"/>
                            </a>
                            <input type="hidden" name="custom_category[<?php echo $custom_category_row; ?>][image]"
                                   value="<?php echo $custom_category['image']; ?>" id="input-image<?php echo $custom_category_row; ?>"/>
                        </div>

                        <label class="col-sm-2 control-label">Сортировка</label>
                        <div class="col-sm-2">
                            <input type="text" name="custom_category[<?php echo $custom_category_row; ?>][sort]" value="<?php echo $custom_category['sort']; ?>"
                               placeholder="Сортировка" id="input-sort[<?php echo $custom_category_row; ?>]" class="form-control"/>
                        </div>

                        <label class="col-sm-11 control-label"></label>
                        <div class="col-sm-1">
                            <button type="button" onclick="$('.custom-category<?php echo $custom_category_row;?>').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                        </div>

                    </div>

                </div>

                <hr>

                <?php $custom_category_row++; ?>

            <?php } ?>


        </form>

          <div id="" class="row">
              <div class="col-sm-11"></div>
              <div class="form-group col-sm-1">
                  <button type="button" onclick="addCustomCategoryRow();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Добавить"><i class="fa fa-plus-circle"></i></button>
              </div>
          </div>

      </div>
    </div>
  </div>
</div>
    <script type="text/javascript">

        var custom_category_row = <?php echo $custom_category_row; ?>;

        function addCustomCategoryRow() {

            html = '';

            html += '<div class="custom-category' + custom_category_row + '">';

            html += '<div class="form-group">';

            html += '<label class="col-sm-2 control-label" for="input-name[]">Имя</label>';
            html += '<div class="col-sm-2">';
            html += '<input type="text" name="custom_category[' + custom_category_row + '][name]" placeholder="Имя" id="input-name[' + custom_category_row + ']" class="form-control"/>';
            html += '</div>';

            html += '<label class="col-sm-2 control-label" for="input-width[' + custom_category_row + ']">Ширина</label>';
            html += '<div class="col-sm-2">';
            html += '<input type="text" name="custom_category[' + custom_category_row + '][width]" placeholder="Ширина" id="input-width[' + custom_category_row + ']" class="form-control"/>';
            html += '</div>';

            html += '<label class="col-sm-2 control-label" for="input-height[' + custom_category_row + ']">Высота</label>';
            html += '<div class="col-sm-2">';
            html += '<input type="text" name="custom_category[' + custom_category_row + '][height]" placeholder="Высота" id="input-height[' + custom_category_row + ']" class="form-control"/>';
            html += '</div>';

            html += '</div>';

            html += '<div class="form-group">';

            html += '<label class="col-sm-2 control-label" for="input-category">Категория</label>';
            html += '<div class="col-sm-2">';
            html += '<select id="custom_category' + custom_category_row + '" name="custom_category[' + custom_category_row + '][category_id]" class="form-control">';
            html += '<option value="0" selected="selected">Выберите</option>';

            <?php foreach ($categories as $category) { ?>
            html += '<option value=" <?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>';
            <?php } ?>

            html += '</select>';
            html += '</div>';

            html += '<label class="col-sm-2 control-label" for="input-show_image' + custom_category_row + '">Отображать/Скрыть изображение</label>';
            html += '<div class="col-sm-2">';
            html += '<select name="custom_category[' + custom_category_row + '][show_image]" id="input-show_image' + custom_category_row + '" class="form-control">';
            html += '<option value="1">Отображать</option>';
            html += '<option value="0">Скрыть</option>';
            html += '</select>';
            html += '</div>';


            html += '<label class="col-sm-2 control-label" for="input-status' + custom_category_row + '">Статус</label>';
            html += '<div class="col-sm-2">';
            html += '<select name="custom_category[' + custom_category_row + '][status]" id="input-status' + custom_category_row + '" class="form-control">';
            html += '<option value="1">Включено</option>';
            html += '<option value="0">Отключено</option>';
            html += '</select>';
            html += '</div>';

            html += '</div>';

            html += '<div class="form-group">';

            html += '<label class="col-sm-2 control-label">Изображение</label>';
            html += '<div class="col-sm-2">';
            html += '<a href="" id="thumb-image' + custom_category_row + '" data-toggle="image" class="img-thumbnail">';
            html += '<img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/>';
            html += '</a>';
            html += '<input type="hidden" name="custom_category[' + custom_category_row + '][image]" id="input-image' + custom_category_row + '"/>';
            html += '</div>';

            html += '<label class="col-sm-2 control-label">Сортировка</label>';
            html += '<div class="col-sm-2">';
            html += '<input type="text" name="custom_category[' + custom_category_row + '][sort]"placeholder="Сортировка" id="input-sort[' + custom_category_row + ']" class="form-control"/>';
            html += '</div>';


            html += '<div class="col-sm-1">';
            html += '<button type="button" onclick="$(\'.custom-category' + custom_category_row + '\').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
            html += '</div>';
            html += '</div>';

            html += '<hr>';

            $('#form-custom_category').append(html);

            custom_category_row++;

        }

        // ckeditorInit('input-description', getURLVar('token'));
    </script>
<?php echo $footer; ?>