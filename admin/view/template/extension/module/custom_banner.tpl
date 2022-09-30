<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-custom_banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-custom_banner" class="form-horizontal">

            <table id="banner-images" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-center">Изображение</td>
                    <td class="text-left">Ширина</td>
                    <td class="text-left">Высота</td>
                    <td class="text-right">Порядок сортировки</td>
                </tr>
                </thead>
                <tbody>
                    <?php for ($i = 0; $i < 5; $i++ ) { ?>
                        <tr id="image-row[<?php echo $i; ?>]">
                            <td class="text-center">
                                <a href="" id="thumb-image-<?php echo $i; ?>" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $custom_banner_banner_image[$i]['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                                </a>
                                <input type="hidden" name="custom_banner_banner_image[<?php echo $i; ?>][image]" value="<?php echo $custom_banner_banner_image[$i]['image']; ?>" id="input-image<?php echo $i; ?>" />
                            </td>
                            <td class="text-left" style="width: 20%;">
                                <input type="text" name="custom_banner_banner_image[<?php echo $i; ?>][width]" value="<?php echo $custom_banner_banner_image[$i]['width']; ?>" class="form-control" />
                            </td>
                            <td class="text-left" style="width: 20%;">
                                <input type="text" name="custom_banner_banner_image[<?php echo $i; ?>][height]" value="<?php echo $custom_banner_banner_image[$i]['height']; ?>" class="form-control" />
                            </td>
                            <td class="text-right" style="width: 10%;">
                                <input type="text" name="custom_banner_banner_image[<?php echo $i; ?>][sort_order]" value="<?php echo $custom_banner_banner_image[$i]['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-custom_banner_style">Стиль баннера</label>
                <div class="col-sm-10">
                    <?php for ($i = 1; $i < 5; $i++ ) { ?>
                        <label class="radio-inline">
                            <?php if ($custom_banner_style == $i) { ?>
                                <input type="radio" name="custom_banner_banner_image[custom_banner_style]" value="<?php echo $i; ?>" checked="checked" />
                                <?php echo $i; ?>
                            <?php } else { ?>
                                <input type="radio" name="custom_banner_banner_image[custom_banner_style]" value="<?php echo $i; ?>" />
                                <?php echo $i; ?>
                            <?php } ?>
                        </label>
                        <img src="<?php echo $custom_banner_banner_image['image_style'][$i]; ?>">
                    <?php }  ?>
                </div>
            </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="custom_banner_status" id="input-status" class="form-control">
                <?php if ($custom_banner_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
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