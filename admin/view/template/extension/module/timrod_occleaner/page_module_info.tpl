<div class="app-content">

    <div class="app-content__header">
        <div class="header__title"><?php echo $menu_module_info; ?></div>
    </div>

    <div class="app-content__body">

        <div class="col-sm-8 col-sm-offset-2 form-horizontal" id="module-info">

            <p class="h2"><?php echo $heading_title; ?></p>

            <div class="form-group">
                <label class="col-sm-4 control-label text-right"><?php echo $entry_version; ?></label>
                <div class="col-sm-8"><?php echo $version; ?></div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-right"><?php echo $entry_support; ?></label>
                <div class="col-sm-8"><a href="mailto:timrod.v@gmail.com">timrod.v@gmail.com</a></div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-right"><?php echo $entry_developer; ?></label>
                <div class="col-sm-8">TimRod</div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-right">OpenCart:</label>
                <div class="col-sm-8"><?php echo $oc_version; ?></div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-right">PHP:</label>
                <div class="col-sm-8"><?php echo $php_version; ?></div>
            </div>

        </div>

    </div>

</div>