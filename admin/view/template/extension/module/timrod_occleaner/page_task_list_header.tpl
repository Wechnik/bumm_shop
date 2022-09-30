<div class="app-content__header">
    <div class="header__title"><?php echo $page_title; ?></div>
    <div class="header__action">
        <?php if (in_array('btn_select_all', $header_buttons)) { ?>
            <button data-toggle="tooltip" title="<?php echo $text_select_all; ?>" data-event="selectAll" class="btn btn_round btn_transparent">
                <span class="material-icons">select_all</span>
            </button>
        <?php } ?>

        <?php if (in_array('btn_scan', $header_buttons)) { ?>
            <button data-toggle="tooltip" title="<?php echo $text_scanning; ?>" data-event="scan" class="btn btn_round btn_transparent">
                <span class="material-icons">update</span>
            </button>
        <?php } ?>

        <?php if (in_array('btn_ignore', $header_buttons)) { ?>
            <button type="button" form="form-page" formaction="<?php echo $ignore; ?>" data-toggle="tooltip" title="<?php echo $text_add_ignore; ?>" class="btn btn_round btn_transparent">
                <span class="material-icons">visibility_off</span>
            </button>
        <?php } ?>

        <?php if (in_array('btn_notignore', $header_buttons)) { ?>
            <button type="button" form="form-page" formaction="<?php echo $notignore; ?>" data-toggle="tooltip" title="<?php echo $text_remove_ignore; ?>" class="btn btn_round btn_transparent">
                <span class="material-icons">visibility</span>
            </button>
        <?php } ?>

        <?php if (in_array('btn_delete', $header_buttons)) { ?>
            <button type="button" form="form-page" formaction="<?php echo $delete; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" data-confirm="<?php echo $text_confirm_delete; ?>" data-text-cancel="<?php echo $text_cancel; ?>" data-text-confirm="<?php echo $text_confirm; ?>" class="btn btn_round btn_transparent">
                <span class="material-icons">remove</span>
            </button>
        <?php } ?>

        <?php if (in_array('btn_delete_all', $header_buttons)) { ?>
            <button type="button" data-toggle="tooltip" title="<?php echo $text_delete_all; ?>" data-event="deleteAll" data-confirm="<?php echo $text_confirm_delete; ?>" data-text-cancel="<?php echo $text_cancel; ?>" data-text-confirm="<?php echo $text_confirm; ?>" class="btn btn_round btn_transparent">
                <span class="material-icons">delete_forever</span>
            </button>
        <?php } ?>
    </div>
</div>