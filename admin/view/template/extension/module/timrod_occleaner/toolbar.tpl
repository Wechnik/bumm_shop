<li class="header">OCCleaner Toolbar v.<?php echo $version; ?></li>
<li class="divider"></li>
<li class="dropdown-header">
    <?php echo $text_fast_clean; ?>
</li>
<li>
    <a href="#" data-event="fastClean" data-task="system_cache">
        <i class="fa fa-check-square text-success hidden"></i>
        <?php echo $page_system_cache; ?>
    </a>
</li>
<li>
    <a href="#" data-event="fastClean" data-task="image_cache">
        <i class="fa fa-check-square text-success hidden"></i>
        <?php echo $page_image_cache; ?>
    </a>
</li>
<li>
    <a href="#" data-event="fastClean" data-task="log_files">
        <i class="fa fa-check-square text-success hidden"></i>
        <?php echo $page_log_files; ?>
    </a>
</li>
<li>
    <a href="#" data-event="fastClean" data-task="vqmod_cache">
        <i class="fa fa-check-square text-success hidden"></i>
        <?php echo $page_vqmod_cache; ?>
    </a>
</li>
<li class="divider"></li>
<li>
    <a href="<?php echo $refresh_modifications; ?>" data-event="refreshModifications">
        <i class="fa fa-refresh"></i>
        <?php echo $text_refresh_modifications; ?>
    </a>
</li>
<li class="divider"></li>
<li>
    <a href="<?php echo $goto_occleaner; ?>">
        <i class="fa fa-external-link"></i>
        OCCleaner
    </a>
</li>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div>

<style>
    #occleaner_toolbar li>a>i {
        margin-top: 3px;
        float: right;
    }

    #occleaner_toolbar li.header {
        display: block;
        padding: 3px 20px;
        font-size: 12px;
        color: #1a73e8;
    }

    #occleaner_toolbar .progress {
        height: 2px;
        position: absolute;
        width: 100%;
        margin-bottom: 0;
        top: 0;
    }

    #occleaner_toolbar_content {
        min-width: 280px;
    }
</style>