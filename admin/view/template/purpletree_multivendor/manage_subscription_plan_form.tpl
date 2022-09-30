<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-subscription" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
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
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-subscription" class="form-horizontal">
					
					<div class="form-group required">
					<label class="col-sm-2 control-label" for="input-no_of_product"><?php echo $column_seller_name; ?></span></label>
					<div class="col-sm-10">
						<input type="text" disabled readonly value="<?php echo $seller_name; ?>" class="form-control" />
						<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" />
					</div>
				</div>
				<?php if(isset($current_plan_name)) {
					foreach($current_plan_name as $keys=>$values){
					?>
					<div class="form-group required">
					<label class="col-sm-2 control-label" for="input-no_of_product"><?php echo $entry_current_plan; ?></span></label>
					<div class="col-sm-10">
						<input type="text" disabled readonly value="<?php echo $values; ?>" class="form-control" />
					</div>
				</div>
				<?php } }
			?>
			<?php if ($action!='edit') {?>
				<div class="form-group required">
					<label class="col-sm-2 control-label" for="input-plan_name"><?php echo $entry_select_plan; ?></label>
					<input type="hidden" name="new_plan_id" value="" />
					<div class="col-sm-10">
						<input type="text" name="filter_plan_name" value="" placeholder="<?php echo $entry_select_plan; ?>" id="input-plan_name" class="form-control" />
						<?php if ($error_select_plan) { ?>
							<div class="text-danger"><?php echo $error_select_plan; ?></div>
						<?php } ?>
					</div>
				</div>
				<?php } else { 
					if(isset($current_plan_name)) {
						foreach($current_plan_name as $keys=>$values){
						?>
						<input type="hidden" name="new_plan_id" value="<?php echo $keys ?>" />
						<?php
						}
					}
				}  ?>
				<?php if(isset($current_plan_name)) { ?>
					<div class="form-group required">
						<label class="col-sm-2 control-label"><?php echo $entry_start_date; ?></label>
						<div class="col-sm-10">
							<?php if($plan_status=='Active' and $action=='edit'){ } else {  ?>
								<div class="col-sm-4">
									<input checked="checked" type="radio" id="subscribenabled" name="start_date" value="0"> <label for="subscribenabled"><?php echo $entry_start_now; ?>
										
									</label>
									<input type="hidden" name="actionbutton" value="<?php echo $action ?>">
								</div>
							<?php } ?>
							<?php   if($action!='add'){ ?>
								<div class="col-sm-4">
									<input type="radio" id="subscribdisabled" name="start_date" value="1"> <label for="subscribdisabled"><?php echo $start_at_end_of_current_plan; ?></label>
								</div>
							<?php } ?>
						</div>
					</div>
				<?php } ?>
				
				
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-status"><?php echo $column_subscription_status; ?></label>
					<div class="col-sm-10">
						<select name="subscription_status" id="input-status" class="form-control">
							<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select>
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

<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/summernote-image-attributes.js"></script>
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>

<script type="text/javascript"><!--
	$('input[name=\'filter_store_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=purpletree_multivendor/managesubscriptionplan/autocomplete&token=<?php echo $token; ?>&filter_store_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['store_name'],
							value: item['seller_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_store_name\']').val(item['label']);
		}
	});
	
	$('input[name=\'filter_plan_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=purpletree_multivendor/managesubscriptionplan/autocomplete&token=<?php echo $token; ?>&seller_id=<?php echo $seller_id; ?>&filter_plan_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['plan_name'],
							value: item['plan_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_plan_name\']').val(item['label']);
			$('input[name=\'new_plan_id\']').val(item['value']);
		}
	});
	
	
	
//--></script>
<script type="text/javascript"><!--
	$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>
