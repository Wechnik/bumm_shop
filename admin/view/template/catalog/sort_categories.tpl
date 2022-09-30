<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
          <button type="submit" form="form-product" data-toggle="tooltip" title="Сохранить" class="btn btn-primary"><i class="fa fa-save"></i></button>
      </div>
      <h1>Сортировка категорий после фильтрации</h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-category">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"></td>
                  <td class="text-right"></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($categories) { ?>
                <?php foreach ($categories as $category) { ?>
                <tr>
<!--                  <td class="text-center">--><?php //if (in_array($category['category_id'], $selected)) { ?>
<!--                    <input type="hidden" name="selected[]" value="--><?php //echo $category['category_id']; ?><!--" />-->
<!--                    --><?php //} else { ?>
<!--                    <input type="checkbox" name="selected[]" value="--><?php //echo $category['category_id']; ?><!--" />-->
<!--                    --><?php //} ?><!--</td>-->
<!--                    --><?php //if ($category['href']) { ?>
<!--                    <td class="left">--><?php //echo $category['indent']; ?><!--<a href="--><?php //echo $category['href']; ?><!--">--><?php //echo $category['name']; ?><!--</a>&nbsp;&nbsp;<i class="fa fa-sort-desc"></i></td>-->
<!--                  --><?php //} else { ?>
<!--                    <td class="left">--><?php //echo $category['indent']; ?><!----><?php //echo $category['name']; ?><!--</td>-->
<!--                  --><?php //} ?>
                  <td class="text-left"><?php echo $category['name']; ?></td>
                  <td class="text-right">
                      <input type="text" name="sort_categories[<?php echo $category['category_id']; ?>]" value="<?php echo $category['sort_order']; ?>" class="form-control" />
                  </td>
                </tr>
                <?php } ?>

                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>

      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>