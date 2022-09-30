<div class="table-responsive">
	<table class="table table-hover">
		<thead>
		<tr>
			<td style="width: 1px;" class="text-center">
				<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
			</td>
			<td class="text-left">
				<?php if ($sort === 'filename') { ?>
				<a href="<?php echo $sort_filename; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_file_name; ?></a>
				<?php } else { ?>
				<a href="<?php echo $sort_filename; ?>"><?php echo $column_file_name; ?></a>
				<?php } ?>
			</td>
			<td class="text-left"><?php echo $column_file_path; ?></td>
			<?php if ($list_type === 'default') { ?>
			<td class="text-center col-sm-1">
				<?php if ($sort === 'size') { ?>
				<a href="<?php echo $sort_size; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_file_size; ?></a>
				<?php } else { ?>
				<a href="<?php echo $sort_size; ?>"><?php echo $column_file_size; ?></a>
				<?php } ?>
			</td>
			<?php } ?>
		</tr>
		</thead>
		<tbody>
		<?php if ($list) { ?>
		<?php foreach ($list as $file) { ?>
		<tr>
			<td class="text-center">
				<?php if (in_array($file['id'], $selected)) { ?>
				<input type="checkbox" name="selected[]" value="<?php echo $file['id']; ?>" checked="checked" />
				<?php } else { ?>
				<input type="checkbox" name="selected[]" value="<?php echo $file['id']; ?>" />
				<?php } ?>
			</td>
			<td class="text-left"><?php echo $file['filename']; ?></td>
			<td class="text-left"><?php echo $file['path']; ?></td>
			<?php if ($list_type === 'default') { ?>
			<td class="text-center"><?php echo $file['size']; ?></td>
			<?php } ?>
		</tr>
		<?php } ?>
		<?php } else { ?>
		<tr>
			<?php if ($list_type === 'default') { ?>
			<td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
			<?php } elseif ($list_type === 'ignore') { ?>
			<td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
			<?php } ?>
		</tr>
		<?php } ?>
		</tbody>
	</table>
</div>