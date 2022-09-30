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
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <div class="pts-pull-right">     
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
						<div class="form-group ">
							<label class="col-sm-2 control-label" for="input-post_id"><span data-toggle="tooltip" title="<?php echo $help_post; ?>"><?php echo $entry_post; ?></span></label>
							<div class="col-sm-10">
								<input type="text" name="post" value="<?php echo $post; ?>" placeholder="<?php echo $entry_post; ?>" id="input-post_id" class="form-control" readonly />
								<input type="hidden" name="post_id" value="<?php echo $post_id; ?>" />
								<?php if ($error_post) { ?>
									<div class="text-danger"><?php echo $error_post; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group ">
							<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
							<div class="col-sm-10">
								<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" readonly/>  
								<?php if ($error_name) { ?>
									<div class="text-danger"><?php echo $error_name; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group ">
							<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
							<div class="col-sm-10">
								<input type="text" name="email_id" value="<?php echo $email_id; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" readonly />  
								<?php if ($error_email) { ?>
									<div class="text-danger"><?php echo $error_email; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group ">
							<label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
							<div class="col-sm-10">
								<textarea name="text" cols="60" rows="8" placeholder="<?php echo $entry_text; ?>" id="input-text" class="form-control"readonly><?php echo $text; ?></textarea>
								<?php if ($error_text) { ?>
									<div class="text-danger"><?php echo $error_text; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
							<div class="col-sm-3">
								<div class="input-group datetime">
									<input type="text" name="date_added" value="<?php echo $date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD HH:mm:ss" id="input-date-added" class="form-control"readonly />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
							<div class="col-sm-10">
								<?php if ($status == 0) { ?>
									<input type="text" name="status" value="<?php echo $text_disabled; ?>" placeholder="<?php echo $entry_status; ?>" id="input-status" class="form-control" readonly /> 
									<?php } else { ?>	
									<input type="text" name="status" value="<?php echo $text_enabled; ?>" placeholder="<?php echo $entry_status; ?>" id="input-status" class="form-control" readonly /> 
								<?php } ?>	              
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'post\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerblogpost/autocomplete=filter_name=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['title'],
							value: item['blog_post_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'post\']').val(item['label']);
			$('input[name=\'post_id\']').val(item['value']);		
		}	
	});
//--></script></div>
<?php echo $footer; ?>