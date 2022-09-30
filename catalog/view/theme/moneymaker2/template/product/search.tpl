<?php echo $header; ?>
    <div class="container">
        <div class="row"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>">
                <ul class="breadcrumb text-center">
                    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
                        <?php if($i+1<count($breadcrumbs)) { ?>
                            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } else { ?><li class="active"><?php echo $breadcrumb['text']; ?></li><?php } ?>
                    <?php } ?>
                </ul>
                <?php echo $content_top; ?>


                <hr class="catalog-hr">
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <div class="input-group form-group">
                            <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" autofocus/>
                            <span class="input-group-btn">
                  <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
                </span>
                        </div>
                    </div>
                </div>

                <h2 class="text-center"><?php echo $text_search; ?></h2>
                <?php if ($products) { ?>
                    <div class="row limits">
                        <div class="col-xs-12 text-center">
                            <div class="btn-group text-left">
                                <div class="btn-group btn-group-sm dropdown">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <?php echo str_replace(":","",$text_sort); ?><i class="fa fa-fw fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu" id="input-sort">
                                        <?php foreach ($sorts as $sorts) { ?>
                                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                                <li class="active"><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
                                            <?php } else { ?>
                                                <li><a href="<?php echo $sorts['href']; ?>" rel="nofollow"><?php echo $sorts['text']; ?></a></li>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </div>
                                <?php if (!$moneymaker2_catalog_layout_switcher_hide) { ?>
                                    <button type="button" id="list-view" class="btn btn-default btn-sm <?php if ($moneymaker2_catalog_default_view) { ?>active<?php } ?> hidden-xxs" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" title="<?php echo $button_list; ?>"><i class="fa fa-list"></i></button>
                                    <button type="button" id="grid-view" class="btn btn-default btn-sm <?php if (!$moneymaker2_catalog_default_view) { ?>active<?php } ?> hidden-xxs" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                                <?php } ?>
                                <div class="btn-group btn-group-sm limit-btn-group dropdown">
                                    <ul class="dropdown-menu" id="input-limit">
                                        <?php foreach ($limits as $limits) { ?>
                                            <?php if ($limits['value'] == $limit) { ?>
                                                <li class="active"><a href="<?php echo $limits['href']; ?>" rel="nofollow"><small><?php echo $limits['text']; ?></small></a></li>
                                                <?php $mmr_limit_active = $limits['text']; ?>
                                            <?php } else { ?>
                                                <li><a href="<?php echo $limits['href']; ?>" rel="nofollow"><small><?php echo $limits['text']; ?></small></a></li>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-arrows-v hidden-md hidden-lg"></i> <span class="hidden-xs hidden-sm"><?php echo $text_limit; ?> </span><?php echo isset($mmr_limit_active) ? $mmr_limit_active : $limits['text']; ?><i class="fa fa-fw fa-angle-down"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row products">
	                    
	                    <?= $products; ?>
	                    
                    </div>
                    <div class="row paginator">
                        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                    </div>

                <?php } else { ?>
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <p class="h4"><?php echo $text_empty; ?></p>
                        </div>
                    </div>
                <?php } ?>
                <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
    </div>
    <script><!--
        $('#button-search').bind('click', function() {
            url = 'index.php?route=product/search';

            var search = $('#content input[name=\'search\']').prop('value');

            if (search) {
                url += '&search=' + encodeURIComponent(search);
            }

            var category_id = $('#content select[name=\'category_id\']').prop('value');

            if (category_id > 0) {
                url += '&category_id=' + encodeURIComponent(category_id);
            }

            var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

            if (sub_category) {
                url += '&sub_category=true';
            }

            var filter_description = $('#content input[name=\'description\']:checked').prop('value');

            if (filter_description) {
                url += '&description=true';
            }

            location = url;
        });

        $('#content input[name=\'search\']').bind('keydown', function(e) {
            if (e.keyCode == 13) {
                $('#button-search').trigger('click');
            }
        });

        $('select[name=\'category_id\']').on('change', function() {
            if (this.value == '0') {
                $('input[name=\'sub_category\']').prop('disabled', true);
            } else {
                $('input[name=\'sub_category\']').prop('disabled', false);
            }
        });

        $('select[name=\'category_id\']').trigger('change');
        --></script>
<?php echo $footer; ?>