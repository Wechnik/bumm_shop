<div id="filemanager" class="pts-modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title"><?php echo $heading_title; ?></h4>
		</div>
		<div class="modal-body">
			<div class="pts-row">
				<div class="pts-col-sm-5"><a href="<?php echo $parent; ?>" title="<?php echo $button_parent; ?>" id="button-parent" class="pts-btn pts-btn-default"><i class="fa fa-level-up"></i></a> <a href="<?php echo $refresh; ?>" title="<?php echo $button_refresh; ?>" id="button-refresh" class="pts-btn pts-btn-default"><i class="fa fa-refresh"></i></a>
					<button type="button" title="<?php echo $button_upload; ?>" id="pts-button-upload" class="pts-btn pts-btn-primary"><i class="fa fa-upload"></i></button>
					<button type="button" title="<?php echo $button_folder; ?>" id="button-folder" class="pts-btn pts-btn-default"><i class="fa fa-folder"></i></button>
					<button type="button" title="<?php echo $button_delete; ?>" id="button-delete" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
				</div>
				<div class="pts-col-sm-7">
					<div class="pts-input-group">
						<input type="text" id="pts_search" name="search" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_search; ?>" class="pts-form-control">
						<span class="pts-input-group-btn">
							<button type="button" data-toggle="tooltip" title="<?php echo $button_search; ?>" id="button-search" class="pts-btn pts-btn-primary"><i class="fa fa-search"></i></button>
						</span></div>
				</div>
			</div>
			<hr />
			<?php foreach (array_chunk($images, 4) as $image) { ?>
				<div class="pts-row">
					<?php foreach ($image as $image) { ?>
						<div class="pts-col-sm-3 pts-col-xs-6 pts-text-center">
							<?php if ($image['type'] == 'directory') { ?>
								<div class="pts-text-center"><a href="<?php echo $image['href']; ?>" class="directory ptsc-fileman-verali"><i class="fa fa-folder fa-5x"></i></a></div>
								<label>
									<input class="deletecheckoxesfileupload" type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
								<?php echo $image['name']; ?></label>
							<?php } ?>
							<?php if ($image['type'] == 'image') { ?>
								<a href="<?php echo $image['href']; ?>" class="thumbnail"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $image['name']; ?>" title="<?php echo $image['name']; ?>" /></a>
								<label>
									<input class="deletecheckoxesfileupload" type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
								<?php echo $image['name']; ?></label>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
				<br />
			<?php } ?>
		</div>
		<div class="modal-footer"><?php echo $pagination; ?></div>
	</div>
</div>
<style>
	.fa.fa-folder.fa-5x {
    font-size: 10.5em;
	}
</style>
<script type="text/javascript"><!--
	<?php if ($target) { ?>
		$('a.thumbnail').on('click', function(e) {
			e.preventDefault();
			
			<?php if ($thumb) { ?>
				$('#<?php echo $thumb; ?>').find('img').attr('src', $(this).find('img').attr('src'));
			<?php } ?>
			
			$('#<?php echo $target; ?>').val($(this).parent().find('input').val());
			
			$('#modal-image').modal('hide');
		});
	<?php } ?>
	
	$('a.directory').on('click', function(e) {
		e.preventDefault();
		
		$('#modal-image').load($(this).attr('href'));
	});
	
	$('.pagination a').on('click', function(e) {
		e.preventDefault();
		
		$('#modal-image').load($(this).attr('href'));
	});
	
	$('#button-parent').on('click', function(e) {
		e.preventDefault();
		
		$('#modal-image').load($(this).attr('href'));
	});
	
	$('#button-refresh').on('click', function(e) {
		e.preventDefault();
		
		$('#modal-image').load($(this).attr('href'));
	});
	
	$('input[name=\'search\']').on('keydown', function(e) {
		if (e.which == 13) {
			$('#button-search').trigger('click');
		}
	});
	
	$('#button-search').on('click', function(e) {
		var url = 'index.php?route=common/filemanager&directory=<?php echo $directory; ?>';
		
		var filter_name = $('#pts_search').val();
		alert(filter_name);
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
		
		<?php if ($thumb) { ?>
			url += '&thumb=' + '<?php echo $thumb; ?>';
		<?php } ?>
		
		<?php if ($target) { ?>
			url += '&target=' + '<?php echo $target; ?>';
		<?php } ?>
		
		$('#modal-image').load(url);
	});
//--></script>
<script type="text/javascript"><!--
	$('#pts-button-upload').on('click', function() {
		$('#form-upload').remove();
		
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" class="ptsc-productl-nodisplay"><input type="file" name="file[]" value="" multiple="multiple" /></form>');
		
		$('#form-upload input[name=\'file[]\']').trigger('click');
		
		if (typeof timer != 'undefined') {
			clearInterval(timer);
		}
		
		timer = setInterval(function() {
			if ($('#form-upload input[name=\'file[]\']').val() != '') {
				clearInterval(timer);
				
				$.ajax({
					url: 'index.php?route=common/filemanager/upload&directory=<?php echo $directory; ?>',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
					cache: false,
					contentType: false,
					processData: false,
					beforeSend: function() {
						$('#pts-button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						$('#pts-button-upload').prop('disabled', true);
					},
					complete: function() {
						$('#pts-button-upload i').replaceWith('<i class="fa fa-upload"></i>');
						$('#pts-button-upload').prop('disabled', false);
					},
					success: function(json) {
						if (json['error']) {
							alert(json['error']);
						}
						
						if (json['success']) {
							alert(json['success']);
							
							$('#button-refresh').trigger('click');
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		}, 500);
	});
	
	$('#button-folder').popover({
		html: true,
		placement: 'bottom',
		trigger: 'click',
		title: '<?php echo $entry_folder; ?>',
		content: function() {
			html  = '<div class="pts-input-group">';
			html += '  <input type="text" name="folder" value="" placeholder="<?php echo $entry_folder; ?>" class="pts-form-control">';
			html += '  <span class="pts-input-group-btn"><button type="button" title="<?php echo $button_folder; ?>" id="button-create" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></span>';
			html += '</div>';
			
			return html;
		}
	});
	
	$('#button-folder').on('shown.bs.popover', function() {
		$('#button-create').on('click', function() {
			$.ajax({
				url: 'index.php?route=common/filemanager/folder&directory=<?php echo $directory; ?>',
				type: 'post',
				dataType: 'json',
				data: 'folder=' + encodeURIComponent($('input[name=\'folder\']').val()),
				beforeSend: function() {
					$('#button-create').prop('disabled', true);
				},
				complete: function() {
					$('#button-create').prop('disabled', false);
				},
				success: function(json) {
					if (json['error']) {
						alert(json['error']);
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$('#button-refresh').trigger('click');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
	});
	
	$('#modal-image #button-delete').on('click', function(e) {
		if (confirm('<?php echo $text_confirm; ?>')) {
			$.ajax({
				url: 'index.php?route=common/filemanager/delete',
				type: 'post',
				dataType: 'json',
				data: $('input[name^=\'path\']:checked'),
				beforeSend: function() {
					$('#button-delete').prop('disabled', true);
				},
				complete: function() {
					$('#button-delete').prop('disabled', false);
				},
				success: function(json) {
					if (json['error']) {
						alert(json['error']);
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$('#button-refresh').trigger('click');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	});
//--></script>
