<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $run; ?>" data-toggle="tooltip" title="<?php echo $button_run; ?>" class="btn btn-primary"><i class="fa fa-refresh" style="padding-right:5px;"></i><?php echo $button_run; ?></a>
        <button type="submit" form="form-nkf_autocategory" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
      <?php if (isset($error) && $error) { ?>
          <div class="alert alert-danger"><?php echo $error; ?></div>
      <?php } ?>
      <?php if (isset($success) && $success) { ?>
          <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
              <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
      <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-nkf_autocategory" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="nkf_autocategory_status" id="input-status" class="form-control">
                <?php if ($nkf_autocategory_status) { ?>
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
                <label class="col-sm-2 control-label" for="input-use_like"><?php echo $entry_use_like; ?></label>
                <div class="col-sm-10">
                    <select name="nkf_autocategory_use_like" id="input-use_like" class="form-control">
                        <?php if ($nkf_autocategory_use_like) { ?>
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
                  <label class="col-sm-2 control-label" for="input-attr_delimiter"><?php echo $entry_attr_delimiter; ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="nkf_autocategory_attr_delimiter" value="<?php echo $nkf_autocategory_attr_delimiter; ?>" placeholder="<?php echo $entry_attr_delimiter; ?>" id="input-attr_delimiter" class="form-control" />
                  </div>
              </div>

        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>