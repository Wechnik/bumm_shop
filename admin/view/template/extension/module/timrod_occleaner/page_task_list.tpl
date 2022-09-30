<div class="app-content">

    <?php echo $task_list_header; ?>

    <?php echo $task_list_toolbar; ?>

    <div class="app-content__body">
        <form method="post" enctype="multipart/form-data" id="form-page">
            <input type="hidden" name="task" value="<?php echo $task; ?>" />
            <?php echo $item_list; ?>
        </form>
    </div>

    <div class="app-content__footer app-content__footer_pagination">
        <div class="text-left"><?php echo $pagination; ?></div>
        <div class="text-right"><?php echo $results; ?></div>
    </div>

</div>
