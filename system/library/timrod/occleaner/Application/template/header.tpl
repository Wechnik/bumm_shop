<div class="app-header">
    <div class="app-header__navigation">
        <a class="btn btn_round btn_transparent" data-event="toggleMenu">
            <span class="material-icons">menu</span>
        </a>
    </div>
    <div class="app-header__title"><?php echo $heading_title; ?></div>
    <div class="app-header__action">
        <a class="btn btn_round btn_transparent" data-event="toggleFullscreen">
            <span class="material-icons">fullscreen_exit</span>
        </a>
        <a href="<?php echo $close_app; ?>" data-toggle="tooltip" data-placement="bottom" title="<?php echo $text_close; ?>" class="btn btn_round btn_transparent" data-route="skip">
            <span class="material-icons">exit_to_app</span>
        </a>
    </div>
</div>