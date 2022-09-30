<?php echo $header; ?>
<?php echo $column_left; ?> 
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right float-right">
				<button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default btn-light"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach($breadcrumbs as $breadcrumb){ ?>
				<li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php  if ($error_warning){ ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php  } ?>
		<div class="panel panel-default card">
			<div class="panel-heading">
				<h3 class="panel-title card-header"><i class="fa fa-pencil"></i><?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body card-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">					  				
					<div class="form-group row">
						<label class="col-sm-2 control-label col-form-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="purpletree_sellerdetail_status" id="input-status" class="form-control">
								<?php  if($purpletree_sellerdetail_status){ ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php  } ?>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
