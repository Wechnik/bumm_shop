<?php echo $header; ?> 
<style type="text/css">
.error{
  color: red;
}
.required{
  color: red;
}
</style><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">

        <button type="submit" form="art-form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_exit; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
         <?php foreach($breadcrumbs as $breadcrumb) { ?> 
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i></h3>
      </div>
      <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="art-form" class="form-horizontal">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-gen" data-toggle="tab"><?php echo $tab_gen; ?></a></li>
            <li><a href="#tab-info" data-toggle="tab"><?php echo $tab_info; ?></a></li>
        </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab-gen">
        <table class="table">
          <tr>
          <td width="25%"><span class="required">*</span> <?php echo $entry_license; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_license" value="<?php echo $artpr_license; ?>" />
            <br />
            <?php if ($error_license) { ?>
            <span class="error"><?php echo $error_license; ?></span>
            <?php } ?></td>
          </tr>
          <tr>
             <td><?php echo $entry_status; ?></td>
             <td>
                <select name="<?php echo $pname; ?>_status">
                   <?php if ($artpr_status) { ?>
                   <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                   <option value="0"><?php echo $text_disabled; ?></option>
                   <?php } else { ?>
                   <option value="1"><?php echo $text_enabled; ?></option>
                   <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                   <?php } ?>
                </select>
             </td>
          </tr>
          <tr>
          <?php $pole = 'messenger'; ?>
          <td><?php echo ${"entry_{$pole}"}; ?></td>
          <td>
            <?php foreach ($manypoles[$pole] as $ar) { ?>
                <input name="<?php echo $pname; ?>_<?php echo $pole; ?>[]" id="artpr_<?php echo $pole; ?>_<?php echo $ar; ?>" value="<?php echo $ar; ?>" <?php if (isset(${"artpr_{$pole}"})){ foreach(${"artpr_{$pole}"} as $artpr_pole){ if ($artpr_pole == $ar){ echo 'checked';  }}} ?> type="checkbox" >&nbsp<label style="margin-right:4px;" for="artpr_<?php echo $pole; ?>_<?php echo $ar; ?>"><?php echo ${"text_{$ar}"}; ?></label>
            <?php } ?>
          </td>
        </tr>
        <tr>
          <td width="25%"><?php echo $entry_apikey; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_apikey" value="<?php echo $artpr_apikey; ?>" /></td>
          </tr>
        </table>
    <input type="hidden" name="apply" id="apply" value="0">
  </form>
  <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="container-fluid" style="margin-top: 10px;">
        <div class="pull-right" style="block">
          <a onclick="addsubmit()" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#fieldart').submit() : false;"><i class="fa fa-trash-o"></i></button>
        </div>
      </div>
      <div class="panel-body">

        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="fieldart">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'sort_field') { ?>
                    <a href="<?php echo $sort_sort_field; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_field; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_field; ?>"><?php echo $column_sort_field; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($fields) { ?>
                <?php foreach ($fields as $field) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($field['field_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $field['field_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $field['field_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $field['name']; ?></td>
                  <td class="text-right"><?php echo $field['sort_field']; ?></td>
                  <td class="text-right"><a href="<?php echo $field['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
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
  <div class="tab-pane" id="tab-info">
      <p><?php echo $text_modname; ?></p>
      <p><?php echo $text_doc; ?></p>
      <p><?php echo $text_version; ?> <?php echo $version_name; ?> ver. <?php echo $version; ?></p>
      <p><?php echo $text_supp; ?></p>
      <p><?php echo $text_dev; ?></p>
    </div>
  
</div>
</div><p style="text-align: center; margin-top: 10px; margin-bottom: 20px"><a href="https://store.pe-art.ru" target="_blank" >ART&PR STUDIO</a> © ALL RIGHTS RESERVED<br><?php echo $version_name; ?> ver. <?php echo $version; ?></p>
</div>
<script>
    function addsubmit(){
        $('#art-form').append('<input type="hidden" name="res" value="add" />');
        $('#art-form').submit();
    }
</script>
<?php echo $footer; ?>