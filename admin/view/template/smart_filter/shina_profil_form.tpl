<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-filter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <?php if ($error_name) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_name; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"><?php echo $entry_group; ?></label>
                        <div class="col-sm-10">
                                <input type="text" name="shina_profil" value="<?php echo $shina_profil; ?>" placeholder="<?php echo $entry_group; ?>" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="shina_sort" value="<?php echo $shina_sort; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                        </div>
                    </div>
       <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mark">Диаметр</label>
                <div class="col-sm-10">
                    <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                        <table class="table table-striped">
                            <?php foreach ($shinaprofils as $shinaprofil) { ?>
                                <tr>
                                    <td class="checkbox">
                                        <label>
                                            <?php if (in_array($shinaprofil['id'], $shina_to_profil)) { ?>
                                                <input type="checkbox" name="shina_width_to_profil[]" value="<?php echo $shinaprofil['id']; ?>" checked="checked" />
                                                <?php echo $shinaprofil['shina_profil']; ?>
                                            <?php } else { ?>
                                                <input type="checkbox" name="shina_width_to_profil[]" value="<?php echo $shinaprofil['id']; ?>" />
                                                <?php echo $shinaprofil['shina_profil']; ?>
                                            <?php } ?>
                                        </label>
                                    </td>
                                </tr>
                            <?php } ?>
                        </table>
                    </div>
                 </div>
            </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>