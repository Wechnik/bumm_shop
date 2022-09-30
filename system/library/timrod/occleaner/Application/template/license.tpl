<div class="app-content">
    <div class="app-content__header">
        <div class="header__title"><?php echo $page_license; ?></div>
        <div class="header__action">
            <button type="button" form="form-page" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn_round btn_transparent">
                <span class="material-icons">save</span>
            </button>
        </div>
    </div>
    <div class="app-content__body">
        <form action="<?php echo $activate; ?>" method="post" enctype="multipart/form-data" id="form-page" class="form-horizontal">

            <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $entry_license_key; ?></label>
                <div class="col-sm-5">
                    <input type="text" name="<?php echo $input_name_lck; ?>" class="form-control col-sm-6" />
                    <div class="help-block"><?php echo $help_activation; ?></div>
                </div>
            </div>

        </form>
    </div>
</div>