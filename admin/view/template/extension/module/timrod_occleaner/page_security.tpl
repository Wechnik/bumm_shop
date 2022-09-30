<div class="app-content">

	<div class="app-content__header">
		<div class="header__title"><?php echo $menu_security; ?></div>
		<div class="header__action">
			<button type="button" form="form-page" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn_round btn_transparent">
				<span class="material-icons">save</span>
			</button>
		</div>
	</div>

	<div class="app-content__body">

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-page" class="form-horizontal">

			<div class="alert alert-info"><?php echo $help_login_problem; ?></div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_remember_browser; ?></label>
				<div class="col-sm-6">
					<?php if ($trusted_browser) { ?>
						<button type="button" class="btn btn-default active" data-event="rememberBrowser">
							<i class="fa fa-check text-success"></i>
							<?php echo $text_trusted; ?>
						</button>
					<?php } else { ?>
						<button type="button" class="btn btn-default" data-event="rememberBrowser"><?php echo $text_remember; ?></button>
					<?php } ?>
					<div class="help-block"><?php echo $help_remember_browser; ?></div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_security_redirect; ?></label>
				<div class="col-sm-3">
					<select name="module_timrod_occleaner_security_redirect" class="form-control">
						<option value="home" <?php echo $module_timrod_occleaner_security_redirect == 'home' ? 'selected="selected"' : ''; ?>><?php echo $text_security_redirect_home; ?></option>
						<option value="error" <?php echo $module_timrod_occleaner_security_redirect == 'error' ? 'selected="selected"' : ''; ?>><?php echo $text_security_redirect_error; ?></option>
					</select>
				</div>
			</div>

			<div class="form-heading">
				<span><?php echo $text_protect_url; ?></span>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_status; ?></label>
				<div class="col-sm-5">
					<div class="app-toggle">
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_protect_url_status" value="1" id="module_timrod_occleaner_protect_url_status_on" <?php echo $module_timrod_occleaner_protect_url_status == 1 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_green" for="module_timrod_occleaner_protect_url_status_on"><?php echo $text_enabled; ?></label>
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_protect_url_status" value="0" id="module_timrod_occleaner_protect_url_status_off" <?php echo $module_timrod_occleaner_protect_url_status == 0 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_red" for="module_timrod_occleaner_protect_url_status_off"><?php echo $text_disabled; ?></label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_protect_url_key; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_protect_url_key" value="<?php echo $module_timrod_occleaner_protect_url_key; ?>" class="form-control" />
					<?php if ($error_protect_url_key) { ?>
						<div class="text-danger"><?php echo $error_protect_url_key; ?></div>
					<?php } ?>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_protect_url_value; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_protect_url_value" value="<?php echo $module_timrod_occleaner_protect_url_value; ?>" class="form-control" />
					<?php if ($error_protect_url_value) { ?>
						<div class="text-danger"><?php echo $error_protect_url_value; ?></div>
					<?php } ?>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="secure-link"><?php echo $entry_secure_link; ?></label>
				<div class="col-sm-5">
					<div class="input-group">
						<input type="text" value="<?php echo $secure_link; ?>" id="secure-link" class="form-control" readonly />
						<span class="input-group-btn">
							<button class="btn btn-default js-clipboard" type="button" data-toggle="tooltip" title="<?php echo $text_copy_clipboard; ?>" data-clipboard-target="#secure-link">
								<i class="fa fa-clipboard"></i>
							</button>
						</span>
					</div>
					<div class="text-warning"><?php echo $help_secure_link; ?></div>
				</div>
			</div>

			<div class="form-heading">
				<span><?php echo $text_grecaptchav2; ?></span>
			</div>

			<div class="form-group">
				<div class="col-sm-5 col-sm-offset-3">
					<div class="text-info"><?php echo $text_grecaptchav2_info; ?></div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_status; ?></label>
				<div class="col-sm-5">
					<div class="app-toggle">
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_grecaptchav2_status" value="1" id="grecaptchav2_status_on" <?php echo $module_timrod_occleaner_grecaptchav2_status == 1 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_green" for="grecaptchav2_status_on"><?php echo $text_enabled; ?></label>
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_grecaptchav2_status" value="0" id="grecaptchav2_status_off" <?php echo $module_timrod_occleaner_grecaptchav2_status == 0 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_red" for="grecaptchav2_status_off"><?php echo $text_disabled; ?></label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_grecaptchav2_key; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_grecaptchav2_key" value="<?php echo $module_timrod_occleaner_grecaptchav2_key; ?>" class="form-control" />
					<?php if ($error_grecaptchav2_key) { ?>
						<div class="text-danger"><?php echo $error_grecaptchav2_key; ?></div>
					<?php } ?>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_grecaptchav2_secret; ?></label>
				<div class="col-sm-5">
					<input type="text" name="module_timrod_occleaner_grecaptchav2_secret" value="<?php echo $module_timrod_occleaner_grecaptchav2_secret; ?>" class="form-control" />
					<?php if ($error_grecaptchav2_secret) { ?>
						<div class="text-danger"><?php echo $error_grecaptchav2_secret; ?></div>
					<?php } ?>
				</div>
			</div>

			<div class="form-heading">
				<span><?php echo $text_ip_blocking; ?></span>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_status; ?></label>
				<div class="col-sm-5">
					<div class="app-toggle">
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_ip_blocking_status" value="1" id="ip_blocking_status_on" <?php echo $module_timrod_occleaner_ip_blocking_status == 1 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_green" for="ip_blocking_status_on"><?php echo $text_enabled; ?></label>
						<input class="app-toggle__input" type="radio" name="module_timrod_occleaner_ip_blocking_status" value="0" id="ip_blocking_status_off" <?php echo $module_timrod_occleaner_ip_blocking_status == 0 ? 'checked' : ''; ?> />
						<label class="app-toggle__label app-toggle__label_color_outline_red" for="ip_blocking_status_off"><?php echo $text_disabled; ?></label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_add_allowed_ip; ?></label>
				<div class="col-sm-5">
					<input type="text" id="input_add_ip" value="" placeholder="<?php echo $placeholder_add_allowed_ip; ?>" class="form-control" />
					<?php if ($error_ip_blocking_white_list) { ?>
						<div class="text-danger"><?php echo $error_ip_blocking_white_list; ?></div>
					<?php } ?>
					<div class="help-block"><?php echo $text_your_current_ip; ?>
						<a href="#" class="link" data-toggle="tooltip" data-plugin="insertTo" data-target="#input_add_ip" title="<?php echo $text_insert; ?>"><?php echo $your_current_ip; ?></a>
					</div>
					<div class="text-warning"><?php echo $help_add_allowed_ip; ?></div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $entry_allowed_ip; ?></label>
				<div class="col-sm-5" id="allowed_ip_list">
					<?php foreach ($module_timrod_occleaner_ip_blocking_white_list as $ip_address) { ?>
						<?php if ($ip_address) { ?>
							<div class="input-group input-group-sm">
								<input type="text" name="module_timrod_occleaner_ip_blocking_white_list[]" value="<?php echo $ip_address; ?>" class="form-control" readonly />
								<span class="input-group-btn">
									<button class="btn btn-danger" type="button" data-event="deleteInputGroup">
										<i class="fa fa-minus-circle"></i>
									</button>
								</span>
							</div>
						<?php } ?>
					<?php } ?>
				</div>

				<input type="hidden" name="module_timrod_occleaner_ip_blocking_white_list[]" value="" />
			</div>


		</form>

	</div>

</div>