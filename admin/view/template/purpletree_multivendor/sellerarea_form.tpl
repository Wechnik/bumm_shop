<?php echo $header;?><?php echo $column_left;?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right float-right">
				<button type="submit" form="form-subscription" data-toggle="tooltip" title="<?php echo $button_save;?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel;?>" data-toggle="tooltip" title="<?php echo $button_cancel;?>" class="btn btn-default btn-light"><i class="fa fa-reply"></i></a>
			 <?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			<?php } ?>
			</div>
			<h1><?php echo $heading_title;?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning;?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php  }  ?>
		<div class="panel panel-default card">
			<div class="panel-heading">
				<h3 class="panel-title card-header"><i class="fa fa-pencil fas fa-edit"></i> <?php echo $text_form;?></h3>
			</div>
			<div class="panel-body card-body">
				<form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form-subscription" class="form-horizontal">					
					
						<div class="tab-pane active" id="tab-general">
							<ul class="nav nav-tabs" id="language">
								<?php foreach ($languages as $language) { ?>
									<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name'];?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
									<div class="form-group row required">
										<label class="col-sm-2 control-label col-form-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name;?></label>
										<div class="col-sm-10">
											<input type="text" name="sellerarea[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sellerarea[$language['language_id']]) ? $sellerarea[$language['language_id']]['name']:''; ?>" placeholder="<?php echo $entry_name;?>" id="input-name<?php echo $language['language_id'];?>" class="form-control" />
											<?php if(isset($error_name[$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error_name[$language['language_id']];?></div>
											<?php } ?>
										</div>
									</div>							
								</div>
								<?php } ?>
							</div>
						</div>
						<div class="tab-pane" id="tab-data">
						<div class="form-group row required">
						<label class="col-sm-2 control-label col-form-label" for="input-sort_order"><?php echo $column_sort_order;?></span></label>
						<div class="col-sm-10">
							<input type="number" name="sort_order" value="<?php echo $sort_order;?>" placeholder="<?php echo $column_sort_order;?>" id="input-sort_order" class="form-control" min="0" />
							<?php if($error_sort_order) { ?>
							<div class="text-danger"><?php echo $error_sort_order;?></div>
							<?php  }  ?>
						</div>
					</div>				
				<div class="form-group row">
					<label class="col-sm-2 control-label col-form-label" for="input-status"><?php echo $entry_status;?></label>
					<div class="col-sm-10">
						<select name="status" id="input-status" class="form-control">
							<?php if(isset($status)) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled;?></option>
							<option value="0"><?php echo $text_disabled;?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled;?></option>
							<option value="0" selected="selected"><?php echo $text_disabled;?></option>
							<?php  }  ?>
						</select>
					</div>
				</div>
			
			
		</div>
	</form>
</div>
</div>
</div>
<link href="view/javascript/codemirror/lib/codemirror.css" rel="stylesheet" />
<link href="view/javascript/codemirror/theme/monokai.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/codemirror/lib/codemirror.js"></script> 
<script type="text/javascript" src="view/javascript/codemirror/lib/xml.js"></script> 
<script type="text/javascript" src="view/javascript/codemirror/lib/formatting.js"></script> 

<?php if ($ver=='3.1.0.0_b') { ?>
<script type="text/javascript"><!--
	$('textarea[data-toggle=\'summernote\']').ckeditor();
//--></script>
<?php } else { ?>
<?php if ($purpletree_multivendor_status) { ?>
<script type="text/javascript" src="view/javascript/purpletreejs/summernote.js"></script>
<?php } else { ?>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<?php  }  ?>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/summernote-image-attributes.js"></script> 
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script> 
<?php  }  ?> 

<script type="text/javascript"><!--
	$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer;?>
