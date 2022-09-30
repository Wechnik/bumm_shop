<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right float-right">
			   <button type="button" form="form-emailreset" data-toggle="tooltip" id = "email_temp_reset" title="<?php echo $button_reset; ?>" class="btn btn-primary"><?php echo $button_reset; ?></button>
			   
				<button type="submit" form="form-subscription" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default btn-light"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a> -->
				<?php }?>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default card">
			<div class="panel-heading">
				<h3 class="panel-title card-header"><i class="fa fa-pencil fas fa-edit"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body card-body">
			   <form action="<?php echo $action1; ?>" method="post" enctype="multipart/form-data" id="form-emailreset">			   
			   </form>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-subscription" class="form-horizontal">
					<div class="tab-content">
							<ul class="nav nav-tabs" id="language">
								<?php foreach ($languages as $language) { ?>
								<li class="nav-item"><a class="nav-link" href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
									<div class="form-group row required">
										<label class="col-sm-2 control-label col-form-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
										<div class="col-sm-10">
											<input type="text" name="email[<?php echo $language['language_id']; ?>][new_subject]" placeholder="<?php echo $entry_name; ?>" value="<?php echo isset($email[$language['language_id']]) ? $email[$language['language_id']]['new_subject'] : ''; ?>"  id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
											<?php if ($email[$language['language_id']]['note_subject']) { ?>
											<span> <?php echo $text_available_variables; ?> <?php echo $email[$language['language_id']]['note_subject']; ?></span>
											<?php } ?>
											<?php if (isset($error_name[$language['language_id']]) ) { ?>
											<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
											<?php } ?>
											<input id = "email_tem_lcode" type="hidden" name="email[<?php echo $language['language_id']; ?>][language_code]" value="<?php echo $email[$language['language_id']]['language_code']; ?> " />
											<input id = "email_tem_id" type="hidden" name="email[<?php echo $language['language_id']; ?>][id]" value="<?php echo $email[$language['language_id']]['id']; ?> " />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 control-label col-form-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
										<div class="col-sm-10">
											<textarea name="email[<?php echo $language['language_id']; ?>][new_message]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($email[$language['language_id']]) ? $email[$language['language_id']]['new_message'] : ''; ?></textarea>
											<?php if ($email[$language['language_id']]['note']) { ?>
										<span> <?php echo $text_available_variables; ?>  <?php echo $email[$language['language_id']]['note']; ?> </span>
											<?php } ?>
										</div>
									</div>								
									
								</div>
								<?php } ?>
							</div>			
				
			</div>
			
		</div>
	</form>
</div>
</div>
</div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<script type="text/javascript"><!--
 $(document).ready(function () {
 $('#email_temp_reset').on("click", function() {
 confirm("<?php echo $reset_warning; ?>") ? $('#form-emailreset').submit() : false;
  });
}); 
//--></script>
<script type="text/javascript"><!--
	$('#language a:first').tab('show');
//--></script>
<?php echo $footer; ?>
