<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-google-base" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
      <?php if ($error_api) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_api; ?>
              <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
      <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-google-base" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $text_api_key; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="content_watch_api_key" class="form-control" value="<?php echo $content_watch_api_key; ?>">
                </div>
            </div>
            <div class="form-group">

                <label class="col-sm-2 control-label" for="input-tag1"><?php echo $text_show_button; ?></label>
                <div class="col-sm-10">
                    <?php if($content_watch_show_button){ ?>
                        <input type="checkbox" name="content_watch_show_button" checked class="form-control" value="1">
                    <?php }else{ ?>
                        <input type="checkbox" name="content_watch_show_button" class="form-control"   value="1">
                    <?php }?>
                </div>
            </div>
            <div class="form-group">

                <label class="col-sm-2 control-label" for="input-tag1">
                    <?php if($content_watch_show_range){ ?>
                        <input type="checkbox" name="content_watch_show_range" checked class="form-control" style="display: inline-block;margin-right: 10px;" value="1">
                    <?php }else{ ?>
                        <input type="checkbox" name="content_watch_show_range" class="form-control" style="display: inline-block;margin-right: 10px;"  value="1">
                    <?php }?>
                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $text_title; ?>"><?php echo $text_show_range; ?></span>
                </label>

                <div class="col-sm-6">
                    <div id="slider" style="top: 25px;"></div>
                    <input type="text" class="hide" name="content_watch_range_0" value="<?php echo $content_watch_range_0; ?>" id="range-0">
                    <input type="text" class="hide" name="content_watch_range_1" value="<?php echo $content_watch_range_1; ?>" id="range-1">
                </div>
                <button type="button" title="<?php echo $text_default; ?>" id="return-default" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-reply"></i></button>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $text_test_api; ?></label>
                <div class="col-sm-10">
                    <?php if($content_watch_test_api){ ?>
                        <input type="checkbox" name="content_watch_test_api" checked class="form-control" value="1">
                    <?php }else{ ?>
                        <input type="checkbox" name="content_watch_test_api" class="form-control" value="1">
                    <?php }?>

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                    <select name="content_watch_status" id="input-status" class="form-control">
                        <?php if($content_watch_status){ ?>
                            <option value="1" selected><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                        <?php }else{ ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected ><?php echo $text_disabled; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>

        </form>
      </div>
    </div>
  </div>
</div>
<style>
    .c-1-color { background: red !important; }
    .c-2-color { background: orange !important; }
    .c-3-color { background: green !important; }

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.0.0/nouislider.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.1.0/wNumb.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.0.0/nouislider.min.js"></script>
<script>
    var defual0=<?php echo $default_range[0];?>;
    var defual1=<?php echo $default_range[1];?>;
    var slider = document.getElementById('slider');
    var setter = document.getElementById('return-default');
    var start0=<?php echo $content_watch_range_0; ?>;
    var start1=<?php echo $content_watch_range_1; ?>;
    noUiSlider.create(slider, {
        start: [start0,start1],
        connect: [ true, true, true],
        tooltips: true,
        format: wNumb({
            decimals: 0
        }),
        step: 1,
        range: {
            'min': 0,

            'max': 100
        }
    });

    var connect = slider.querySelectorAll('.noUi-connect');
    var classes = ['c-1-color', 'c-2-color', 'c-3-color'];

    for ( var i = 0; i < connect.length; i++ ) {
        connect[i].classList.add(classes[i]);
    }
    slider.noUiSlider.on('update', function ( values, handle ) {
       
        $('#range-'+handle).val(values[handle]);
    });

        setter.addEventListener('click', function(){
            slider.noUiSlider.set([defual0, defual1]);
        });

</script>
<?php echo $footer; ?>
