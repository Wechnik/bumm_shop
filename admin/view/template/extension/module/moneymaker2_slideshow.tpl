<?php echo $header; ?>
<?php
$moneymaker2_banners_styles = array('default','primary', 'success', 'info', 'warning', 'danger');
$moneymaker2_banners_positions = array('top-left','top-center', 'top-right', 'middle-left', 'middle-center', 'middle-right', 'bottom-left', 'bottom-center', 'bottom-right');
$moneymaker2_banners_text_styles = array('dark','light');
//$moneymaker2_animation_in_styles = array('bounceIn', 'bounceInDown', 'bounceInLeft', 'bounceInRight', 'bounceInUp', 'fadeIn', 'fadeInDown', 'fadeInDownBig', 'fadeInLeft', 'fadeInLeftBig', 'fadeInRight', 'fadeInRightBig', 'fadeInUp', 'fadeInUpBig', 'flipInX', 'flipInY', 'lightSpeedIn', 'rotateIn', 'rotateInDownLeft', 'rotateInDownRight', 'rotateInUpLeft', 'rotateInUpRight', 'rollIn', 'slideInDown', 'slideInLeft', 'slideInRight', 'slideInUp', 'zoomIn', 'zoomInDown', 'zoomInLeft', 'zoomInRight', 'zoomInUp', 'bounce', 'flash', 'flip', 'hinge', 'pulse', 'rubberBand', 'shake', 'swing', 'tada', 'wobble', 'jello');
$moneymaker2_animation_in_styles = array('fadeUp', 'fade', 'backSlide', 'goDown');
$moneymaker2_animation_out_styles = array('bounceOut', 'bounceOutDown', 'bounceOutLeft', 'bounceOutRight', 'bounceOutUp', 'fadeOut', 'fadeOutDown', 'fadeOutDownBig', 'fadeOutLeft', 'fadeOutLeftBig', 'fadeOutRight', 'fadeOutRightBig', 'fadeOutUp', 'fadeOutUpBig', 'flipOutX', 'flipOutY', 'lightSpeedOut', 'rotateOut', 'rotateOutDownLeft', 'rotateOutDownRight', 'rotateOutUpLeft', 'rotateOutUpRight', 'rollOut', 'slideOutDown', 'slideOutLeft', 'slideOutRight', 'slideOutUp', 'zoomOut', 'zoomOutDown', 'zoomOutLeft', 'zoomOutRight', 'zoomOutUp', 'bounce', 'flash', 'flip', 'hinge', 'pulse', 'rubberBand', 'shake', 'swing', 'tada', 'wobble', 'jello');
if(empty($autoplay_timeout)) $autoplay_timeout                  = '4';

?>
<!-- custom styles -->
<style type="text/css">
#animationSandbox {
	font-size: 42px;
	padding: 80px 0;
	margin: 35px 0;
	border: 1px solid #ccc;
	background-color: #fff;
}
</style>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<?php if ($module_id) { ?><a onclick="apply()" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-primary"><span><i class="fa fa-save"></i> &nbsp;<?php echo $button_apply; ?></span></a><script language="javascript">function apply(){$('#form-moneymaker2-slideshow').append('<input type="hidden" id="apply" name="apply" value="1"  />'); $('#form-moneymaker2-slideshow').submit();}</script><?php } ?>
				<button type="submit" form="form-moneymaker2-slideshow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-moneymaker2-slideshow" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							<?php if ($error_name) { ?>
							<div class="text-danger"><?php echo $error_name; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
						<div class="col-sm-10">
							<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
							<?php if ($error_width) { ?>
							<div class="text-danger"><?php echo $error_width; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
						<div class="col-sm-10">
							<input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
							<?php if ($error_height) { ?>
							<div class="text-danger"><?php echo $error_height; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
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
					<p class="form-group"><br /></p>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
						<div class="col-sm-4">
							<select name="autoplay" id="input-autoplay" class="form-control">
								<?php if ($autoplay) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<label class="col-sm-2 control-label" for="input-autoplay_timeout"><?php echo $entry_autoplay_timeout; ?></label>
						<div class="col-sm-4">
							<input type="number" min="1" name="autoplay_timeout" value="<?php echo $autoplay_timeout; ?>" id="input-autoplay_timeout" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-animation"><?php echo $entry_animation; ?></label>
						<div class="col-sm-4">
							<select name="animation" id="input-animation" class="form-control">
								<?php if ($animation) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<label class="col-sm-2 control-label"><?php echo $entry_animation_in; ?></label>
						<div class="col-sm-4">
							<select name="animation_in" class="form-control">
								<?php foreach ($moneymaker2_animation_in_styles as $moneymaker2_animation_in_style) { ?>
								<?php ($moneymaker2_animation_in_style ==  $animation_in) ? $active = 'selected' : $active=''; ?>
								<option value="<?php echo $moneymaker2_animation_in_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_animation_in_style; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_transparency_hover; ?></label>
						<div class="col-sm-4">
							<select name="transparency_hover" class="form-control">
								<?php if ($transparency_hover) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<label class="col-sm-2 control-label"><?php echo $entry_background; ?></label>
						<div class="col-sm-4">
							<select name="background_style" class="form-control">
								<?php foreach ($moneymaker2_banners_text_styles as $moneymaker2_banners_text_style) { ?>
								<?php ($moneymaker2_banners_text_style == $background_style) ? $active = 'selected' : $active=''; ?>
								<option value="<?php echo $moneymaker2_banners_text_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_text_style; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_border_style; ?></label>
						<div class="col-sm-4">
							<select name="border_style" class="form-control">
								<?php foreach ($moneymaker2_banners_text_styles as $moneymaker2_banners_text_style) { ?>
								<?php ($moneymaker2_banners_text_style == $border_style) ? $active = 'selected' : $active=''; ?>
								<option value="<?php echo $moneymaker2_banners_text_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_text_style; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<p class="form-group"><br /></p>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_navigation; ?></label>
						<div class="col-sm-4">
							<select name="navigation" class="form-control">
								<?php if ($navigation) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_navigation_zone_help; ?>"><?php echo $entry_navigation_zone; ?></span></label>
						<div class="col-sm-4">
							<select name="navigation_zone" class="form-control">
								<?php if ($navigation_zone) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-pagination"><?php echo $entry_pagination; ?></label>
						<div class="col-sm-4">
							<select name="pagination" id="input-pagination" class="form-control">
								<?php if ($pagination) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<p class="form-group"><br /></p>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_fullscreen_help; ?>"><?php echo $entry_fullscreen; ?></span></label>
						<div class="col-sm-4">
							<select name="fullwidth" class="form-control">
								<?php if ($fullwidth) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_fullscreen_bottom_help; ?>"><?php echo $entry_fullscreen_bottom; ?></span></label>
						<div class="col-sm-4">
							<select name="fullwidth_bottom" class="form-control">
								<?php if ($fullwidth_bottom) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_tilt3d_help; ?>"><?php echo $entry_tilt3d; ?></span></label>
						<div class="col-sm-4">
							<select name="tilt3d" class="form-control">
								<?php if ($tilt3d) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_parallax_help; ?>"><?php echo $entry_parallax; ?></span></label>
						<div class="col-sm-4">
							<select name="parallax" class="form-control">
								<?php if ($parallax) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
						<label class="col-sm-2 control-label"><?php echo $entry_parallax_speed; ?></label>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_speed" value="<?php echo $parallax_speed; ?>" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_parallax_invert_help; ?>"><?php echo $entry_parallax_invert; ?></span></label>
						<div class="col-sm-4">
							<select name="parallax_invert" class="form-control">
								<?php if ($parallax_invert) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_parallax_height_help; ?>"><?php echo $entry_parallax_height; ?></span></label>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_heights[lg]" value="<?php echo $parallax_heights['lg']; ?>" class="form-control" />
							<p class="text-center"><small><?php echo $entry_screen_large; ?></small></p>
						</div>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_heights[md]" value="<?php echo $parallax_heights['md']; ?>" class="form-control" />
							<p class="text-center"><small><?php echo $entry_screen_medium; ?></small></p>
						</div>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_heights[sm]" value="<?php echo $parallax_heights['sm']; ?>" class="form-control" />
							<p class="text-center"><small><?php echo $entry_screen_small; ?></small></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_heights[xsm]" value="<?php echo $parallax_heights['xsm']; ?>" class="form-control" />
							<p class="text-center"><small><?php echo $entry_screen_xsmall; ?></small></p>
						</div>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_heights[xxsm]" value="<?php echo $parallax_heights['xxsm']; ?>" class="form-control" />
							<p class="text-center"><small><?php echo $entry_screen_xxsmall; ?></small></p>
						</div>
						<div class="col-sm-3">
							<input type="number" min="1" name="parallax_heights[xxxsm]" value="<?php echo $parallax_heights['xxxsm']; ?>" class="form-control" />
							<p class="text-center"><small><?php echo $entry_screen_xxxsmall; ?></small></p>
						</div>
					</div>


					<p class="form-group"><br /></p>

					<div class="form-group">
						<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_items_help; ?>"><?php echo $entry_banners; ?></span></label>
						<div class="col-sm-3">
							<select name="items[lg]" class="form-control">
								<?php for ($j = 1; $j <= 12; $j++) {
									($items['lg'] == $j) ? $active = 'selected' : $active = ''; ?>
								<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
								<?php } ?>
							</select><p class="text-center"><small><?php echo $entry_screen_large; ?></small></p>
						</div>
						<div class="col-sm-3">
							<select name="items[md]" class="form-control">
								<?php for ($j = 1; $j <= 12; $j++) {
									($items['md'] == $j) ? $active = 'selected' : $active = ''; ?>
								<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
								<?php } ?>
							</select><p class="text-center"><small><?php echo $entry_screen_medium; ?></small></p>
						</div>
						<div class="col-sm-3">
							<select name="items[sm]" class="form-control">
								<?php for ($j = 1; $j <= 12; $j++) {
									($items['sm'] == $j) ? $active = 'selected' : $active = ''; ?>
								<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
								<?php } ?>
							</select><p class="text-center"><small><?php echo $entry_screen_small; ?></small></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-3">
							<select name="items[xsm]" class="form-control">
								<?php for ($j = 1; $j <= 12; $j++) {
									($items['xsm'] == $j) ? $active = 'selected' : $active = ''; ?>
								<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
								<?php } ?>
							</select><p class="text-center"><small><?php echo $entry_screen_xsmall; ?></small></p>
						</div>
						<div class="col-sm-3">
							<select name="items[xxsm]" class="form-control">
								<?php for ($j = 1; $j <= 12; $j++) {
									($items['xxsm'] == $j) ? $active = 'selected' : $active = ''; ?>
								<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
								<?php } ?>
							</select><p class="text-center"><small><?php echo $entry_screen_xxsmall; ?></small></p>
						</div>
						<div class="col-sm-3">
							<select name="items[xxxsm]" class="form-control">
								<?php for ($j = 1; $j <= 12; $j++) {
									($items['xxxsm'] == $j) ? $active = 'selected' : $active = ''; ?>
								<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo $j; ?></option>
								<?php } ?>
							</select><p class="text-center"><small><?php echo $entry_screen_xxxsmall; ?></small></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_banners_hidden_xs; ?></label>
						<div class="col-sm-4">
							<select name="hidden_xs" class="form-control">
								<?php if ($hidden_xs) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>



					<p><br /></p>


					<fieldset>
						<legend><?php echo $entry_banners; ?></legend>
						<div class="row" id="vtab-banners_settings">
							<div class="col-sm-2">
								<ul class="nav nav-pills nav-stacked" id="banners_settings">
									<?php $banners_setting_row = 1; ?>
									<?php foreach ($banners_settings as $value) { ?>
									<li><a href="#tab-banner<?php echo $banners_setting_row; ?>" data-toggle="tab" id="link-banner<?php echo $banners_setting_row; ?>"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-banner<?php echo $banners_setting_row; ?>\']').parent().remove(); $('#tab-banner<?php echo $banners_setting_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_banner; ?>&nbsp;#<?php echo $banners_setting_row; ?></a></li>
									<?php $banners_setting_row++; ?>
									<?php } ?>
									<li>
										<button type="button" onclick="addHeaderBanner();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
									</li>
								</ul>
							</div>
							<div class="col-sm-10">
								<div class="tab-content">
									<?php $banners_setting_row = 1; ?>
									<?php foreach ($banners_settings as $value) { ?>
									<div class="tab-pane" id="tab-banner<?php echo $banners_setting_row; ?>">
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<p><h4><?php echo $entry_banner; ?> #<?php echo $banners_setting_row; ?></h4></p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $tab_image; ?></label>
											<div class="col-sm-10">
												<a href="" id="banners_settings_image_thumb<?php echo $banners_setting_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="banners_settings[<?php echo $banners_setting_row; ?>][image]" value="<?php echo $value['image']; ?>" id="banners_settings_image_input<?php echo $banners_setting_row; ?>" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="banners_settings_link<?php echo $banners_setting_row; ?>"><?php echo $button_link; ?></label>
											<div class="col-sm-10">
												<input type="text" name="banners_settings[<?php echo $banners_setting_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="banners_settings_link<?php echo $banners_setting_row; ?>" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<?php echo $entry_multilanguage; ?>)</label>
											<div class="col-sm-10">
												<?php foreach ($languages as $language) { ?>
												<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
													<input type="text" name="banners_settings[<?php echo $banners_setting_row; ?>][multilink][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_optional; ?>" value="<?php echo isset($value['multilink'][$language['language_id']]) ? $value['multilink'][$language['language_id']] : ''; ?>" class="form-control">
												</div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10"><p></p><h4><?php echo $entry_optional; ?></h4><p></p></div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_text_position; ?></label>
											<div class="col-sm-10">
												<div class="input-group">
													<div class="input-group-btn">
														<button type="button" class="btn btn-default" data-toggle="modal" data-target="#positionsModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
													</div>
													<select name="banners_settings[<?php echo $banners_setting_row; ?>][position]" class="form-control">
														<?php foreach ($moneymaker2_banners_positions as $moneymaker2_banners_position) { ?>
														<?php ($moneymaker2_banners_position ==  $value['position']) ? $active = 'selected' : $active=''; ?>
														<option value="<?php echo $moneymaker2_banners_position; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_position; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_text_width; ?></label>
											<div class="col-sm-10">
												<select name="banners_settings[<?php echo $banners_setting_row; ?>][text_width]" class="form-control">
													<?php for ($j = 1; $j <= 12; $j++) {
												($j == $value['text_width']) ? $active = 'selected' : $active = ''; ?>
													<option value="<?php echo $j; ?>" <?php echo $active; ?>><?php echo round($j*(100/12)).'%'; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_text_style; ?></label>
											<div class="col-sm-10">
												<select name="banners_settings[<?php echo $banners_setting_row; ?>][text_style]" class="form-control">
													<?php foreach ($moneymaker2_banners_text_styles as $moneymaker2_banners_text_style) { ?>
													<?php ($moneymaker2_banners_text_style == $value['text_style']) ? $active = 'selected' : $active=''; ?>
													<option value="<?php echo $moneymaker2_banners_text_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_text_style; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
											<div class="col-sm-10">
												<?php foreach ($languages as $language) { ?>
												<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
													<input type="text" name="banners_settings[<?php echo $banners_setting_row; ?>][title][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_optional; ?>" value="<?php echo isset($value['title'][$language['language_id']]) ? $value['title'][$language['language_id']] : ''; ?>" class="form-control">
												</div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
											<div class="col-sm-10">
												<?php foreach ($languages as $language) { ?>
												<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
													<textarea name="banners_settings[<?php echo $banners_setting_row; ?>][text][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
												</div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_title_spacing; ?></label>
											<div class="col-sm-4">
												<select name="banners_settings[<?php echo $banners_setting_row; ?>][title_spacing]" class="form-control">
													<?php if ($value['title_spacing']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</div>
											<label class="col-sm-2 control-label"><?php echo $entry_text_spacing; ?></label>
											<div class="col-sm-4">
												<select name="banners_settings[<?php echo $banners_setting_row; ?>][text_spacing]" class="form-control">
													<?php if ($value['text_spacing']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_button_title; ?></label>
											<div class="col-sm-10">
												<?php foreach ($languages as $language) { ?>
												<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
													<input type="text" name="banners_settings[<?php echo $banners_setting_row; ?>][btn_title][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_optional; ?>" value="<?php echo isset($value['btn_title'][$language['language_id']]) ? $value['btn_title'][$language['language_id']] : ''; ?>" class="form-control">
												</div>
												<?php } ?>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label"><?php echo $entry_button_style; ?></label>
											<div class="col-sm-4">
												<div class="input-group">
													<div class="input-group-btn">
														<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>
													</div>
													<select name="banners_settings[<?php echo $banners_setting_row; ?>][btn_style]" class="form-control">
														<?php foreach ($moneymaker2_banners_styles as $moneymaker2_banners_style) { ?>
														<?php ($moneymaker2_banners_style ==  $value['btn_style']) ? $active = 'selected' : $active=''; ?>
														<option value="<?php echo $moneymaker2_banners_style; ?>" <?php echo $active; ?>><?php echo $moneymaker2_banners_style; ?></option>
														<?php } ?>
													</select>
												</div>
											</div>
											<label class="col-sm-2 control-label"><?php echo $entry_minimize; ?></label>
											<div class="col-sm-4">
												<select name="banners_settings[<?php echo $banners_setting_row; ?>][minimize]" class="form-control">
													<?php if ($value['minimize']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
													<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="banners_settings_sort_order<?php echo $banners_setting_row; ?>"><?php echo $entry_sort_order; ?></label>
											<div class="col-sm-10">
												<input type="number" min="0" name="banners_settings[<?php echo $banners_setting_row; ?>][sort_order]" value="<?php echo isset($value['sort_order']) ? $value['sort_order'] : ''; ?>" placeholder="<?php echo $entry_optional; ?>" id="banners_settings_sort_order<?php echo $banners_setting_row; ?>" class="form-control">
											</div>
										</div>
									</div>
									<?php $banners_setting_row++; ?>
									<?php } ?>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>

			<!-- styles modal -->
			<div class="modal fade" id="stylesModal" tabindex="-1" role="dialog" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">&nbsp;</h4>
						</div>
						<div class="modal-body">
							<?php foreach ($moneymaker2_banners_styles as $value) { ?>
							<span class="btn disabled btn-lg btn-<?php echo $value; ?>"><?php echo $value; ?></span>&nbsp;
							<?php } ?>
							<p>&nbsp;</p>
							<p>*<?php echo $entry_style_help; ?></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
						</div>
					</div>
				</div>
			</div>

			<!-- positions modal -->
			<div class="modal fade" id="positionsModal" tabindex="-1" role="dialog" aria-labelledby="iconsModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">&nbsp;</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<?php foreach ($moneymaker2_banners_positions as $value) { ?>
								<div class="col-sm-4 text-center"><p>&nbsp;</p><p><?php echo $value; ?></p><p>&nbsp;</p></div>
								<?php } ?>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
						</div>
					</div>
				</div>
			</div>

			<!-- animations modal -->
			<div class="modal fade" id="animationsModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">&nbsp;</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12 text-center">
										<div id="animationSandbox"><?php echo $entry_animation; ?></div>
								</div>
								<div class="col-sm-12 text-center">
									<div class="input-group">
										<div class="input-group-btn">
											<button type="button" class="btn btn-default  js--triggerAnimation" ><i class="fa fa-fw fa-play-circle"></i></button>
										</div>
										<select class="form-control js--animations">
											<optgroup label="Bouncing Entrances">
												<option value="bounceIn">bounceIn</option>
												<option value="bounceInDown">bounceInDown</option>
												<option value="bounceInLeft">bounceInLeft</option>
												<option value="bounceInRight">bounceInRight</option>
												<option value="bounceInUp">bounceInUp</option>
											</optgroup>
											<optgroup label="Bouncing Exits">
												<option value="bounceOut">bounceOut</option>
												<option value="bounceOutDown">bounceOutDown</option>
												<option value="bounceOutLeft">bounceOutLeft</option>
												<option value="bounceOutRight">bounceOutRight</option>
												<option value="bounceOutUp">bounceOutUp</option>
											</optgroup>
											<optgroup label="Fading Entrances">
												<option value="fadeIn">fadeIn</option>
												<option value="fadeInDown">fadeInDown</option>
												<option value="fadeInDownBig">fadeInDownBig</option>
												<option value="fadeInLeft">fadeInLeft</option>
												<option value="fadeInLeftBig">fadeInLeftBig</option>
												<option value="fadeInRight">fadeInRight</option>
												<option value="fadeInRightBig">fadeInRightBig</option>
												<option value="fadeInUp">fadeInUp</option>
												<option value="fadeInUpBig">fadeInUpBig</option>
											</optgroup>
											<optgroup label="Fading Exits">
												<option value="fadeOut">fadeOut</option>
												<option value="fadeOutDown">fadeOutDown</option>
												<option value="fadeOutDownBig">fadeOutDownBig</option>
												<option value="fadeOutLeft">fadeOutLeft</option>
												<option value="fadeOutLeftBig">fadeOutLeftBig</option>
												<option value="fadeOutRight">fadeOutRight</option>
												<option value="fadeOutRightBig">fadeOutRightBig</option>
												<option value="fadeOutUp">fadeOutUp</option>
												<option value="fadeOutUpBig">fadeOutUpBig</option>
											</optgroup>
											<optgroup label="Flippers">
												<option value="flip">flip</option>
												<option value="flipInX">flipInX</option>
												<option value="flipInY">flipInY</option>
												<option value="flipOutX">flipOutX</option>
												<option value="flipOutY">flipOutY</option>
											</optgroup>
											<optgroup label="Lightspeed">
												<option value="lightSpeedIn">lightSpeedIn</option>
												<option value="lightSpeedOut">lightSpeedOut</option>
											</optgroup>
											<optgroup label="Rotating Entrances">
												<option value="rotateIn">rotateIn</option>
												<option value="rotateInDownLeft">rotateInDownLeft</option>
												<option value="rotateInDownRight">rotateInDownRight</option>
												<option value="rotateInUpLeft">rotateInUpLeft</option>
												<option value="rotateInUpRight">rotateInUpRight</option>
											</optgroup>
											<optgroup label="Rotating Exits">
												<option value="rotateOut">rotateOut</option>
												<option value="rotateOutDownLeft">rotateOutDownLeft</option>
												<option value="rotateOutDownRight">rotateOutDownRight</option>
												<option value="rotateOutUpLeft">rotateOutUpLeft</option>
												<option value="rotateOutUpRight">rotateOutUpRight</option>
											</optgroup>
											<optgroup label="Sliding Entrances">
												<option value="slideInUp">slideInUp</option>
												<option value="slideInDown">slideInDown</option>
												<option value="slideInLeft">slideInLeft</option>
												<option value="slideInRight">slideInRight</option>
											</optgroup>
											<optgroup label="Sliding Exits">
												<option value="slideOutUp">slideOutUp</option>
												<option value="slideOutDown">slideOutDown</option>
												<option value="slideOutLeft">slideOutLeft</option>
												<option value="slideOutRight">slideOutRight</option>
											</optgroup>
											<optgroup label="Zoom Entrances">
												<option value="zoomIn">zoomIn</option>
												<option value="zoomInDown">zoomInDown</option>
												<option value="zoomInLeft">zoomInLeft</option>
												<option value="zoomInRight">zoomInRight</option>
												<option value="zoomInUp">zoomInUp</option>
											</optgroup>
											<optgroup label="Zoom Exits">
												<option value="zoomOut">zoomOut</option>
												<option value="zoomOutDown">zoomOutDown</option>
												<option value="zoomOutLeft">zoomOutLeft</option>
												<option value="zoomOutRight">zoomOutRight</option>
												<option value="zoomOutUp">zoomOutUp</option>
											</optgroup>
											<optgroup label="Attention Seekers">
												<option value="bounce">bounce</option>
												<option value="flash">flash</option>
												<option value="pulse">pulse</option>
												<option value="rubberBand">rubberBand</option>
												<option value="shake">shake</option>
												<option value="swing">swing</option>
												<option value="tada">tada</option>
												<option value="wobble">wobble</option>
												<option value="jello">jello</option>
											</optgroup>
											<optgroup label="Specials">
												<option value="hinge">hinge</option>
												<option value="rollIn">rollIn</option>
												<option value="rollOut">rollOut</option>
											</optgroup>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_close; ?></button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript"><!--
//    $('#tabs a:first').tab('show')
		$('#banners_settings a:first').tab('show');
//    $('#header_banners a:first').tab('show');

		var banners_setting_row = <?php echo $banners_setting_row; ?>;
		function addHeaderBanner() {
			html = '<div class="tab-pane active" id="tab-banner' + banners_setting_row + '">';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10">';
			html += '<p><h4><?php echo $entry_banner; ?> #' + banners_setting_row + '</h4></p>';
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $tab_image; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<a href="" id="banners_settings_image_thumb' + banners_setting_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="banners_settings[' + banners_setting_row + '][image]" value="" id="banners_settings_image_input' + banners_setting_row + '" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="banners_settings_link' + banners_setting_row + '"><?php echo $button_link; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="text" name="banners_settings[' + banners_setting_row + '][link]" value="" placeholder="<?php echo $entry_optional; ?>" id="banners_settings_link' + banners_setting_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $button_link; ?> (<?php echo $entry_multilanguage; ?>)</label>';
			html += '<div class="col-sm-10">';
			<?php foreach ($languages as $language) { ?>
				html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
				html += '<input type="text" name="banners_settings[' + banners_setting_row + '][multilink][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_optional; ?>" class="form-control">';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<div class="col-sm-offset-2 col-sm-10"><p></p><h4><?php echo $entry_optional; ?></h4><p></p></div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text_position; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<div class="input-group">';
			html += '<div class="input-group-btn">';
			html += '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#positionsModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>';
			html += '</div>';
			html += '<select name="banners_settings[' + banners_setting_row + '][position]" class="form-control">';
		<?php foreach ($moneymaker2_banners_positions as $key => $value) { ?>
				html += '<option value="<?php echo $value; ?>" <?php if ($key == 0) { ?>selected<?php } ?>><?php echo $value; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text_width; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<select name="banners_settings[' + banners_setting_row + '][text_width]" class="form-control">';
			<?php for ($j = 1; $j <= 12; $j++) { ?>
				html += '<option value="<?php echo $j; ?>" <?php if ($j == 6) { ?>selected<?php } ?>><?php echo round($j*(100/12)).'%'; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text_style; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<select name="banners_settings[' + banners_setting_row + '][text_style]" class="form-control">';
			<?php foreach ($moneymaker2_banners_text_styles as $key => $value) { ?>
				html += '<option value="<?php echo $value; ?>" <?php if ($key == 0) { ?>selected<?php } ?>><?php echo $value; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>';
			html += '<div class="col-sm-10">';
		<?php foreach ($languages as $language) { ?>
				html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
				html += '<input type="text" name="banners_settings[' + banners_setting_row + '][title][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_optional; ?>" value="" class="form-control">';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
			html += '<div class="col-sm-10">';
		<?php foreach ($languages as $language) { ?>
				html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
				html += '<textarea name="banners_settings[' + banners_setting_row + '][text][<?php echo $language['language_id']; ?>]" rows="2" placeholder="<?php echo $entry_optional; ?>" class="form-control"></textarea>';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_title_spacing; ?></label>';
			html += '<div class="col-sm-4">';
			html += '<select name="banners_settings[' + banners_setting_row + '][title_spacing]" class="form-control">';
			html += '<option value="1"><?php echo $text_enabled; ?></option>';
			html += '<option value="0" selected><?php echo $text_disabled; ?></option>';
			html += '</select>';
			html += '</div>';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_text_spacing; ?></label>';
			html += '<div class="col-sm-4">';
			html += '<select name="banners_settings[' + banners_setting_row + '][text_spacing]" class="form-control">';
			html += '<option value="1"><?php echo $text_enabled; ?></option>';
			html += '<option value="0" selected><?php echo $text_disabled; ?></option>';
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_button_title; ?></label>';
			html += '<div class="col-sm-10">';
		<?php foreach ($languages as $language) { ?>
				html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
				html += '<input type="text" name="banners_settings[' + banners_setting_row + '][btn_title][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_optional; ?>" value="" class="form-control">';
				html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_button_style; ?></label>';
			html += '<div class="col-sm-4">';
			html += '<div class="input-group">';
			html += '<div class="input-group-btn">';
			html += '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#stylesModal"><i class="fa fa-search"></i> <?php echo $button_view; ?></button>';
			html += '</div>';
			html += '<select name="banners_settings[' + banners_setting_row + '][btn_style]" class="form-control">';
		<?php foreach ($moneymaker2_banners_styles as $key => $value) { ?>
				html += '<option value="<?php echo $value; ?>" <?php if ($key == 0) { ?>selected<?php } ?>><?php echo $value; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '</div>';
			html += '<label class="col-sm-2 control-label"><?php echo $entry_minimize; ?></label>';
			html += '<div class="col-sm-4">';
			html += '<select name="banners_settings[' + banners_setting_row + '][minimize]" class="form-control">';
			html += '<option value="1"><?php echo $text_enabled; ?></option>';
			html += '<option value="0" selected><?php echo $text_disabled; ?></option>';
			html += '</select>';
			html += '</div>';

			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-sm-2 control-label" for="banners_settings_sort_order' + banners_setting_row + '"><?php echo $entry_sort_order; ?></label>';
			html += '<div class="col-sm-10">';
			html += '<input type="number" min="0" name="banners_settings[' + banners_setting_row + '][sort_order]" value="' + banners_setting_row + '" placeholder="<?php echo $entry_optional; ?>" id="banners_settings_sort_order' + banners_setting_row + '" class="form-control">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#vtab-banners_settings .tab-content').append(html);
			$('#banners_settings li .btn-success').parent().before('<li><a href="#tab-banner' + banners_setting_row + '" data-toggle="tab" id="link-banner' + banners_setting_row + '"><i class="fa fa-minus-circle" onclick="$(\'#link-banner' + banners_setting_row + '\').parent().remove(); $(\'#tab-banner' + banners_setting_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_banner; ?>&nbsp;#' + banners_setting_row + '</a></li>');

			//$('#banners a:first').tab('show');
			$('#link-banner' + banners_setting_row).trigger('click');
			banners_setting_row++;
		}

	/*animations preview*/
		function testAnim(x) {
			$('#animationSandbox').removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				$(this).removeClass();
			});
		};

		$(document).ready(function(){
			$('.js--triggerAnimation').click(function(e){
				e.preventDefault();
				var anim = $('.js--animations').val();
				testAnim(anim);
			});

			$('.js--animations').change(function(){
				var anim = $(this).val();
				testAnim(anim);
			});
		});



		//--></script>

</div>
<?php echo $footer; ?>