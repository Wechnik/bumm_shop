<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button data-toggle="tooltip" title="<?php echo $button_index; ?>" class="btn btn-primary indexing"><?php echo $button_index; ?></button>
        <button type="submit" form="form-smartsearch" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-smartsearch" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_status" id="input-status" class="form-control">
                <?php if ($smartsearch_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-field"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_field; ?>"><?php echo $entry_field; ?></span></label>
            <div class="col-sm-10">
              <input name="smartsearch_field" id="input-field" class="form-control" value="<?php echo $smartsearch_field; ?>" placeholder='header input[name="search"]'>              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_image" id="input-image" class="form-control">
                <?php if ($smartsearch_image) { ?>
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
            <label class="col-sm-2 control-label" for="input-image-width"><?php echo $entry_image_width; ?></label>
            <div class="col-sm-10">
              <input name="smartsearch_image_width" id="input-image-width" class="form-control" value="<?php echo $smartsearch_image_width; ?>">              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image-height"><?php echo $entry_image_height; ?></label>
            <div class="col-sm-10">
              <input name="smartsearch_image_height" id="input-image-height" class="form-control" value="<?php echo $smartsearch_image_height; ?>">              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_model" id="input-model" class="form-control">
                <?php if ($smartsearch_model) { ?>
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
            <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_price" id="input-price" class="form-control">
                <?php if ($smartsearch_price) { ?>
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
            <label class="col-sm-2 control-label" for="input-oldprice"><?php echo $entry_oldprice; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_oldprice" id="input-oldprice" class="form-control">
                <?php if ($smartsearch_oldprice) { ?>
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
            <label class="col-sm-2 control-label" for="input-button-all"><?php echo $entry_button_all; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_button_all" id="input-button-all" class="form-control">
                <?php if ($smartsearch_button_all) { ?>
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
            <label class="col-sm-2 control-label" for="input-search-model"><?php echo $entry_search_model; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_search_model" id="input-search-model" class="form-control">
                <?php if ($smartsearch_search_model) { ?>
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
            <label class="col-sm-2 control-label" for="input-search-engine"><?php echo $entry_search_engine; ?></label>
            <div class="col-sm-10">
              <select name="smartsearch_search_engine" id="input-search-engine" class="form-control">
                <?php if ($smartsearch_search_engine) { ?>
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
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input name="smartsearch_limit" id="input-limit" class="form-control" value="<?php echo $smartsearch_limit; ?>">              
            </div>
          </div>   
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $('.indexing').click(function(e){
      

      $.ajax({
          url: '<?php echo $http_catalog;?>index.php?route=extension/module/smartsearch/search_index',          
          beforeSend: function() {   
            $('.indexing').text('<?php echo $text_index; ?>');  
            $('.indexing').prop('disabled',true);                               
          },
          complete: function() {   
            $('.indexing').text('<?php echo $button_index; ?>'); 
            $('.indexing').prop('disabled',false);                                 
          },
          success: function(json) {
              
              
          },
          error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
      });
  });  
</script>
<?php echo $footer; ?>