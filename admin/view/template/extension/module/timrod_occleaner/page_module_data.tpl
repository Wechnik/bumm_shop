<div class="app-content">

	<div class="app-content__header">
		<div class="header__title"><?php echo $menu_module_data; ?></div>
		<div class="header__action">
			<button type="button" form="form-page" formaction="<?php echo $delete; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" data-confirm="<?php echo $text_confirm_delete; ?>" data-text-cancel="<?php echo $text_cancel; ?>" data-text-confirm="<?php echo $text_confirm; ?>" class="btn btn_round btn_transparent">
				<span class="material-icons">delete_forever</span>
			</button>
		</div>
	</div>

	<div class="app-content__body">
		<form method="post" enctype="multipart/form-data" id="form-page">

			<input type="hidden" name="task" value="<?php echo $task; ?>" />

			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<td style="width: 1px;" class="text-center">
								<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
							</td>
							<td class="text-left col-sm-8"><?php echo $column_data_type; ?></td>
							<td class="text-center col-sm-2"><?php echo $column_db_rows; ?></td>
							<td class="text-center col-sm-2"><?php echo $column_files_size; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php if ($list) { ?>
							<?php foreach ($list as $module_data) { ?>
								<tr>
									<td class="text-center">
										<?php if (in_array($module_data['type'], $selected)) { ?>
											<input type="checkbox" name="selected[]" value="<?php echo $module_data['type']; ?>" checked="checked" />
										<?php } else { ?>
											<input type="checkbox" name="selected[]" value="<?php echo $module_data['type']; ?>" />
										<?php } ?>
									</td>
									<td class="text-left"><?php echo $module_data['title']; ?></td>
									<td class="text-center"><?php echo $module_data['db']; ?></td>
									<td class="text-center"><?php echo $module_data['files'] . '/' . $module_data['size']; ?></td>
								</tr>
							<?php } ?>
						<?php } ?>
					</tbody>
				</table>
			</div>

		</form>
	</div>

</div>