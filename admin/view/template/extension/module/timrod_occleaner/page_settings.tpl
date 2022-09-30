<div class="app-content">

	<div class="app-content__header">
		<div class="header__title"><?php echo $menu_settings; ?></div>
		<div class="header__action">
			<button type="button" form="form-page" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn_round btn_transparent">
				<span class="material-icons">save</span>
			</button>
		</div>
	</div>

	<div class="app-content__body">

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-page" class="form-horizontal">

			<input type="hidden" name="module_timrod_occleaner_status" value="1" />

			<div class="form-heading">
				<span><?php echo $text_common_settigns; ?></span>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_license_key; ?></label>
				<div class="col-sm-5">
					<div class="input-group">
						<input type="text" id="input_lck" name="module_timrod_occleaner_lck" value="<?php echo $module_timrod_occleaner_lck; ?>" class="form-control" />
						<span class="input-group-btn">
							<button class="btn btn-default js-toggle-readonly" type="button" data-target="#input_lck" data-toggle="tooltip" title="<?php echo $text_edit; ?>">
								<i class="fa fa-edit"></i>
							</button>
						</span>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_welcome_dialog; ?></label>
				<div class="col-sm-5">
					<div class="app-toggle">
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_welcome_dialog_status" value="1" id="welcome_dialog_status_on" <?php echo $module_timrod_occleaner_welcome_dialog_status == 1 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_green" for="welcome_dialog_status_on"><?php echo $text_enabled; ?></label>
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_welcome_dialog_status" value="0" id="welcome_dialog_status_off" <?php echo $module_timrod_occleaner_welcome_dialog_status == 0 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_red" for="welcome_dialog_status_off"><?php echo $text_disabled; ?></label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_toolbar; ?></label>
				<div class="col-sm-5">
					<div class="app-toggle">
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_toolbar_status" value="1" id="toolbar_status_on" <?php echo $module_timrod_occleaner_toolbar_status == 1 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_green" for="toolbar_status_on"><?php echo $text_enabled; ?></label>
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_toolbar_status" value="0" id="toolbar_status_off" <?php echo $module_timrod_occleaner_toolbar_status == 0 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_red" for="toolbar_status_off"><?php echo $text_disabled; ?></label>
					</div>
				</div>
			</div>

			<div class="form-heading">
				<span><?php echo $text_performance; ?></span>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_performance_request; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_performance_request" value="<?php echo $module_timrod_occleaner_performance_request; ?>" class="js-range-slider" data-min="10" data-max="100" data-step="5" data-grid="true" data-grid-num="9" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_performance_database; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_performance_database" value="<?php echo $module_timrod_occleaner_performance_database; ?>" class="js-range-slider" data-min="10" data-max="100" data-step="5" data-grid="true" data-grid-num="9" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_performance_data; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_performance_data" value="<?php echo $module_timrod_occleaner_performance_data; ?>" class="js-range-slider" data-min="10" data-max="100" data-step="5" data-grid="true" data-grid-num="9" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_performance_filesystem; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_performance_filesystem" value="<?php echo $module_timrod_occleaner_performance_filesystem; ?>" class="js-range-slider" data-min="10" data-max="100" data-step="5" data-grid="true" data-grid-num="9" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Exclude</label>
				<div class="col-sm-5">
					<textarea name="module_timrod_occleaner_performance_exclude" rows="5" placeholder="" class="form-control"><?php echo $module_timrod_occleaner_performance_exclude; ?></textarea>
				</div>
			</div>

			<div class="form-heading">
				<span><?php echo $text_extended; ?></span>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Debug mode</label>
				<div class="col-sm-5">
					<div class="app-toggle">
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_debug_mode" value="1" id="debug_mode_on" <?php echo $module_timrod_occleaner_debug_mode == 1 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_green" for="debug_mode_on"><?php echo $text_enabled; ?></label>
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_debug_mode" value="0" id="debug_mode_off" <?php echo $module_timrod_occleaner_debug_mode == 0 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_red" for="debug_mode_off"><?php echo $text_disabled; ?></label>
					</div>
				</div>
			</div>

		</form>

	</div>

</div>