<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <div class="pts-pull-right">
				<button type="submit" form="form-attribute" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="pts-btn pts-btn-default"><i class="fa fa-reply"></i></a>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute" class="form-horizontal">
						<input type="hidden" name="id" value="<?php echo $idd; ?>" />
						<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" />
						<input type="hidden" name="attribute_idd" value="<?php echo $attribute_idd; ?>" />
						<div class="form-group required">
							<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_name; ?></label>
							<div class="pts-col-sm-10">
								<?php foreach ($languages as $language) { ?>
									<div class="input-group" style="margin-bottom: 10px;"><span class="input-group-addon"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
										<input type="text" name="attribute_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute_description[$language['language_id']]) ? $attribute_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="pts-form-control" />
									</div>
									<?php if (isset($error_name[$language['language_id']])) { ?>
										<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
									<?php } ?>
								<?php } ?>
							</div>
						</div>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label" for="input-attribute-group"><?php echo $entry_attribute_group; ?></label>
							<div class="col-sm-10">
								<select name="attribute_group_id" id="input-attribute-group" class="pts-form-control">
									<option value="0"></option>
									<?php foreach ($attribute_groups as $attribute_group) { ?>
										<?php if ($attribute_group['attribute_group_id']==$attribute_group_id) { ?>
											<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php if ($error_attribute_group) { ?>
									<div class="text-danger"><?php echo $error_attribute_group; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="pts-form-group ">
							<label class="pts-col-sm-2 pts-control-label" for="input-sort-order" style="margin-top: 12px !important;"><?php echo $entry_sort_order; ?></label>
							<div class="pts-col-sm-10" style="margin-top: 10px !important;">
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="pts-form-control" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>