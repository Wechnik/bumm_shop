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
	<?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
     <h1><?php echo $heading_titlee; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
    </div>
  </div>
			<div class="pts-panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-download" class="pts-form-horizontal">
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_name; ?></label>
						<div class="pts-col-sm-10">
							<?php foreach ($languages as $language) { ?>
								<div class="pts-input-group"> <span class="pts-input-group-addon"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
									<input type="text" name="download_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($download_description[$language['language_id']]) ? $download_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="pts-form-control" />
								</div>
								<?php if (isset($error_name[$language['language_id']])) { ?>
									<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
								<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-filename"><span data-toggle="tooltip" title="<?php echo $help_filename; ?>"><?php echo $entry_filename; ?></span></label>
						<div class="pts-col-sm-10">
							<div class="pts-input-group">
								<input type="text" name="filename" value="<?php echo $filename; ?>" placeholder="<?php echo $entry_filename; ?>" id="input-filename" class="pts-form-control" />
								<span class="pts-input-group-btn">
									<button type="button" id="button-upload" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
								</span> </div>
								<?php if ($error_filename) { ?>
									<div class="text-danger"><?php echo $error_filename; ?></div>
								<?php } ?>
						</div>
					</div>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-mask"><span data-toggle="tooltip" title="<?php echo $help_mask; ?>"><?php echo $entry_mask; ?></span></label>
						<div class="pts-col-sm-10">
							<input type="text" name="mask" value="<?php echo $mask; ?>" placeholder="<?php echo $entry_mask; ?>" id="input-mask" class="pts-form-control" />
							<?php if ($error_mask) { ?>
								<div class="text-danger"><?php echo $error_mask; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pts-buttons clearfix">
						<div class="pts-pull-left">
						<a href="<?php echo $cancel; ?>" title="<?php echo $button_cancel; ?>" class="pts-btn pts-btn-default"><?php echo $button_cancel; ?></a></div>
						<div class="pts-pull-right">
							<button type="submit" form="form-download" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="pts-btn pts-btn-primary"><?php echo $button_save; ?></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#button-upload').on('click', function() {
		$('#form-upload').remove();
		
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" class="ptsc-productl-nodisplay"><input type="file" name="file" /></form>');
		
		$('#form-upload input[name=\'file\']').trigger('click');
		
		if (typeof timer != 'undefined') {
			clearInterval(timer);
		}
		
		timer = setInterval(function() {
			if ($('#form-upload input[name=\'file\']').val() != '') {
				clearInterval(timer);
				
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/downloads/upload',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
					cache: false,
					contentType: false,
					processData: false,
					beforeSend: function() {
						$('#button-upload').button('loading');
					},
					complete: function() {
						$('#button-upload').button('reset');
					},
					success: function(json) {
						if (json['error']) {
							alert(json['error']);
						}
						
						if (json['success']) {
							alert(json['success']);
							
							$('input[name=\'filename\']').val(json['filename']);
							$('input[name=\'mask\']').val(json['mask']);
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		}, 500);
	});
//--></script></div>
<?php echo $footer; ?>
