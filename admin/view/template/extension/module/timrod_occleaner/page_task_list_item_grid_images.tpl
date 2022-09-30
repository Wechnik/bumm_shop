<div class="image-grid">
	<?php if ($list) { ?>
		<?php foreach ($list as $file) { ?>
			<div class="image-wrapper <?php echo in_array($file['id'], $selected) ? 'image-wrapper_active' : ''; ?>" title="<?php echo $file['filename']; ?>">
				<div class="image-lens"></div>
				<input type="checkbox" name="selected[]" value="<?php echo $file['id']; ?>" <?php echo in_array($file['id'], $selected) ? 'checked="checked"' : ''; ?> />
				<div class="image-info">
					<div class="image-info__size"><?php echo $file['size']; ?></div>
					<button type="button" class="btn btn_round btn_transparent" data-toggle="modal" data-target="#image-details" data-path="<?php echo $file['path']; ?>" data-size="<?php echo $file['size']; ?>" data-filename="<?php echo $file['filename']; ?>">
						<span class="material-icons" data-toggle="tooltip" title="<?php echo $text_title_file_details; ?>">info</span>
					</button>
				</div>
				<div class="image-filename"><?php echo $file['filename']; ?></div>
				<img src="<?php echo $file['image']; ?>" class="img-responsive" />
			</div>
		<?php } ?>
	<?php } else { ?>
		<?php echo $text_no_results; ?>
	<?php } ?>
</div>

<div class="modal fade" id="image-details" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"><?php echo $text_title_file_details; ?></h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $column_file_name; ?>:</label>
					<div id="image-details__filename"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $column_file_size; ?>:</label>
					<div id="image-details__size"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $column_file_path; ?>:</label>
					<div id="image-details__path"></div>
				</div>
			</div>
		</div>
	</div>
</div>