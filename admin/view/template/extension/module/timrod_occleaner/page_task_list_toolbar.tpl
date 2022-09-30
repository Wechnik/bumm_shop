<div class="app-content__toolbar">
    <?php if ($task_list) { ?>
        <select name="task" class="form-control">
            <?php foreach ($task_list as $item) { ?>
                <option value="<?php echo $item; ?>" <?php echo $task === $item ? 'selected="selected"' : ''; ?>><?php echo ${'page_' . $item}; ?></option>
            <?php } ?>
        </select>
    <?php } ?>

    <select name="list_type" class="form-control" <?php echo in_array('list_type', $tb_disabled) ? 'disabled' : '' ?>>
        <option value="default" <?php echo $list_type === 'default' ? 'selected="selected"' : ''; ?>><?php echo $text_default; ?></option>
        <option value="ignore" <?php echo $list_type === 'ignore' ? 'selected="selected"' : ''; ?>><?php echo $text_ignore_list; ?></option>
    </select>

    <input type="text" value="<?php echo $search; ?>" name="search" class="form-control" placeholder="<?php echo $placeholder_search; ?>" <?php echo in_array('search', $tb_disabled) ? 'disabled' : '' ?> />

    <select name="limit" class="form-control">
        <option value="10" <?php echo $limit == 10 ? 'selected="selected"' : ''; ?>>10</option>
        <option value="20" <?php echo $limit == 20 ? 'selected="selected"' : ''; ?>>20</option>
        <option value="50" <?php echo $limit == 50 ? 'selected="selected"' : ''; ?>>50</option>
        <option value="100" <?php echo $limit == 100 ? 'selected="selected"' : ''; ?>>100</option>
    </select>

    <div class="block-info">
        <div>
            <span class="label label-default"><?php echo $total_info; ?></span>
        </div>
        <div>
            <span class="label label-primary"><?php echo $text_last_scan; ?><?php echo $last_scan; ?></span>
        </div>
    </div>
</div>