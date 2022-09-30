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
				<button type="submit" form="form-attribute" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="pts-btn pts-btn-default"><i class="fa fa-reply"></i></a>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div class="pts-panel pts-panel-default">
				<div class="pts-panel-heading">
					<h3 class="pts-panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
				</div>
				<div class="pts-panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute" class="pts-form-horizontal">
						<fieldset>
							<input type="hidden" name="id" value="<?php echo $idd; ?>" />
							<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" />
							<input type="hidden" name="attribute_idd" value="<?php echo $attribute_idd; ?>" />
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label"><?php echo $entry_name; ?></label>
								<div class="pts-col-sm-10">
									<?php foreach ($languages as $language) { ?>
										<div class="pts-input-group"><span class="pts-input-group-addon"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="option_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_description[$language['language_id']]) ? $option_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="pts-form-control" />
										</div>
										<?php if (isset($error_name[$language['language_id']])) { ?>
											<div class="pts-text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
										<?php } ?>
									<?php } ?>
								</div>
							</div>
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-type"><?php echo $entry_type; ?></label>
								<div class="pts-col-sm-10">
									<select name="type" id="input-type" class="pts-form-control">
										<optgroup label="<?php echo $text_choose; ?>">
											<?php if ($type =='select') { ?>
												<option value="select" selected="selected"><?php echo $text_select; ?></option>
												<?php } else { ?>
												<option value="select"><?php echo $text_select; ?></option>
											<?php } ?>
											<?php if ($type =='radio') { ?>
												<option value="radio" selected="selected"><?php echo $text_radio; ?></option>
												<?php } else { ?>
												<option value="radio"><?php echo $text_radio; ?></option>
											<?php } ?>
											<?php if ($type =='checkbox') { ?>
												<option value="checkbox" selected="selected"><?php echo $text_checkbox; ?></option>
												<?php } else { ?>
												<option value="checkbox"><?php echo $text_checkbox; ?></option>
											<?php } ?>
										</optgroup>
										<optgroup label="<?php echo $text_input; ?>">
											<?php if ($type =='text') { ?>
												<option value="text" selected="selected"><?php echo $text_text; ?></option>
												<?php } else { ?>
												<option value="text"><?php echo $text_text; ?></option>
											<?php } ?>
											<?php if ($type =='textarea') { ?>
												<option value="textarea" selected="selected"><?php echo $text_textarea; ?></option>
												<?php } else { ?>
												<option value="textarea"><?php echo $text_textarea; ?></option>
											<?php } ?>
										</optgroup>
										<optgroup label="<?php echo $text_file; ?>">
											<?php if ($type =='file') { ?>
												<option value="file" selected="selected"><?php echo $text_file; ?></option>
												<?php } else { ?>
												<option value="file"><?php echo $text_file; ?></option>
											<?php } ?>
										</optgroup>
										<optgroup label="<?php echo $text_date; ?>">
											<?php if ($type =='date') { ?>
												<option value="date" selected="selected"><?php echo $text_date; ?></option>
												<?php } else { ?>
												<option value="date"><?php echo $text_date; ?></option>
											<?php } ?>
											<?php if ($type =='time') { ?>
												<option value="time" selected="selected"><?php echo $text_time; ?></option>
												<?php } else { ?>
												<option value="time"><?php echo $text_time; ?></option>
											<?php } ?>
											<?php if ($type=='datetime') { ?>
												<option value="datetime" selected="selected"><?php echo $text_datetime; ?></option>
												<?php } else { ?>
												<option value="datetime"><?php echo $text_datetime; ?></option>
											<?php } ?>
										</optgroup>
									</select>
								</div>
							</div>
							<div class="pts-form-group">
								<label class="pts-col-sm-2 pts-control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="pts-form-control" />
								</div>
							</div>
						</fieldset>
						<fieldset>
							<h4><?php echo $text_value; ?></h4>
							<table id="option-value" class="pts-table pts-table-striped pts-table-bordered pts-table-hover">
								<thead>
									<tr>
										<td class="pts-text-left required"><?php echo $entry_option_value; ?></td>
										<td class="pts-text-center"><?php echo $entry_image; ?></td>
										<td class="pts-text-right"><?php echo $entry_sort_order; ?></td>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<?php $option_value_row = 0; ?>
									<?php foreach ($option_values as $option_value) { ?>
										<tr id="option-value-row<?php echo $option_value_row; ?>">
											<td class="pts-text-left"><input type="hidden" name="option_value[<?php echo $option_value_row; ?>][option_value_id]" value="<?php echo $option_value['option_value_id']; ?>" />
												<?php foreach ($languages as $language) { ?>
													<div class="pts-input-group"><span class="pts-input-group-addon"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
														<input type="text" name="option_value[<?php echo $option_value_row; ?>][option_value_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_value['option_value_description'][$language['language_id']]) ? $option_value['option_value_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_option_value; ?>" class="pts-form-control" />
													</div>
													<?php if (isset($error_option_value[$option_value_row][$language['language_id']])) { ?>
														<div class="pts-text-danger"><?php echo $error_option_value[$option_value_row][$language['language_id']]; ?></div>
													<?php } ?>
												<?php } ?></td>
												<td class="pts-text-left"><a href="" id="thumb-image<?php echo $option_value_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $option_value['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
												<input type="hidden" name="option_value[<?php echo $option_value_row; ?>][image]" value="<?php echo $option_value['image']; ?>" id="input-image<?php echo $option_value_row; ?>" /></td>
												<td class="pts-text-right"><input type="text" name="option_value[<?php echo $option_value_row; ?>][sort_order]" value="<?php echo $option_value['sort_order']; ?>" class="pts-form-control" /></td>
												<td class="pts-text-left"><button type="button" onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>
										</tr>
										<?php $option_value_row++; ?>
									<?php } ?>
								</tbody>              
								<tfoot>
									<tr>
										<td colspan="3"></td>
										<td class="pts-text-right"><button type="button" onclick="addOptionValue();" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>
									</tr>
								</tfoot>
							</table>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('select[name=\'type\']').on('change', function() {
		if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox' || this.value == 'image') {
			$('#option-value').show();
			} else {
			$('#option-value').hide();
		}
	});
	
	$('select[name=\'type\']').trigger('change');
	
	var option_value_row = <?php echo $option_value_row; ?>;
	
	function addOptionValue() {
		html  = '<tr id="option-value-row' + option_value_row + '">';	
		html += '  <td class="pts-text-left"><input type="hidden" name="option_value[' + option_value_row + '][option_value_id]" value="" />';
		<?php foreach ($languages as $language) { ?>
			html += '    <div class="pts-input-group">';
			html += '      <span class="pts-input-group-addon"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="option_value[' + option_value_row + '][option_value_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_option_value; ?>" class="pts-form-control" />';
			html += '    </div>';
		<?php } ?>
		html += '  </td>';
		html += '  <td class="pts-text-left"><a href="" id="thumb-image' + option_value_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="option_value[' + option_value_row + '][image]" value="" id="input-image' + option_value_row + '" /></td>';
		html += '  <td class="pts-text-right"><input type="text" name="option_value[' + option_value_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-left"><button type="button" onclick="$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';	
		
		$('#option-value tbody').append(html);
		
		option_value_row++;
	}
//--></script></div>
<?php echo $footer; ?>