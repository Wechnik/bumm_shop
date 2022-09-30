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
				<button type="submit" form="form-geo-zone" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="pts-btn pts-btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?></div>
    </div>
  </div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil fas fa-edit"></i> <?php echo $text_form; ?></h3>
				</div>
				<div class="pts-panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-geo-zone" class="form-horizontal">        
						<div class="form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-name"><?php echo $entry_name; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="pts-form-control" />
								<?php if ($error_name) { ?>
									<div class="text-danger"><?php echo $error_name; ?></div>
								<?php } ?> </div>
						</div>
						<div class="form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-description"><?php echo $entry_description; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="description" value="<?php echo $description; ?>" placeholder="<?php echo $entry_description; ?>" id="input-description" class="pts-form-control" />
								<?php if ($error_description) { ?>
									<div class="text-danger"><?php echo $error_description; ?></div>
								<?php } ?> </div>
						</div>    

						<div class="form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-weight-from"><?php echo $entry_weight_from; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="weight_from" value="<?php echo $weight_from; ?>" placeholder="<?php echo $entry_weight_from; ?>" id="input-weight-from" class="pts-form-control" />
								<?php if ($error_weight_from) { ?>
									<div class="text-danger"><?php echo $error_weight_from; ?></div>
								<?php } ?></div>
						</div>
						
						<div class="form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-weight-to"><?php echo $entry_weight_to; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="weight_to" value="<?php echo $weight_to; ?>" placeholder="<?php echo $entry_weight_to; ?>" id="input-weight-to" class="pts-form-control" />
								<?php if ($error_weight_to) { ?>
									<div class="text-danger"><?php echo $error_weight_to; ?></div>
								<?php } ?></div>
						</div>

						<div class="form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-price"><?php echo $entry_price; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
								<?php if ($error_price) { ?>
									<div class="text-danger"><?php echo $error_price; ?></div>
								<?php } ?></div>
						</div>
						<fieldset>
							<legend><?php echo $text_geo_zone; ?></legend>
							<table id="zone-to-geo-zone" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<td class="pts-text-left"><?php echo $entry_country; ?></td>
										<td class="pts-text-left"><?php echo $entry_zone; ?></td>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<?php $zone_to_geo_zone_row = 0; ?>
									<?php foreach ($zone_to_geo_zones as $zone_to_geo_zone) { ?>
										<tr id="zone-to-geo-zone-row<?php echo $zone_to_geo_zone_row; ?>">
											<td class="pts-text-left"><select name="zone_to_geo_zone[<?php echo $zone_to_geo_zone_row; ?>][country_id]" class="pts-form-control" onchange="country(this, '<?php echo $zone_to_geo_zone_row; ?>', '<?php echo $zone_to_geo_zone['zone_id']; ?>');">
											<option value="a"><?php echo $text_select_country; ?></option>
												<?php foreach ($countries as $country) { ?>
													<?php  if ($country['country_id'] == $zone_to_geo_zone['country_id']) { ?>
														<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
														<?php } else { ?>
														<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
													<?php } ?>
												<?php } ?>
											</select></td>
											<td class="pts-text-left"><select name="zone_to_geo_zone[<?php echo $zone_to_geo_zone_row; ?>][zone_id]" class="pts-form-control">
											</select></td>
											<td class="pts-text-left"><button type="button" onclick="$('#zone-to-geo-zone-row<?php echo $zone_to_geo_zone_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>
										</tr>
										<?php $zone_to_geo_zone_row++; ?>
									<?php } ?>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"></td>
										<td class="text-left"><button type="button" onclick="addGeoZone();" data-toggle="tooltip" title="<?php echo $button_geo_zone_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>
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
	var zone_to_geo_zone_row = <?php echo $zone_to_geo_zone_row; ?>;
	
	function addGeoZone() {
		html  = '<tr id="zone-to-geo-zone-row' + zone_to_geo_zone_row + '">';
		html += '  <td class="text-left"><select name="zone_to_geo_zone[' + zone_to_geo_zone_row + '][country_id]" class="pts-form-control" onchange="country(this, \'' + zone_to_geo_zone_row + '\', \'0\');">';
		
		html += '    <option value="a"><?php echo $text_select_country; ?></option>';
		<?php foreach ($countries as $country) { ?>
			html += '    <option value="<?php echo $country['country_id']; ?>"><?php echo addslashes($country['name']); ?></option>';
		<?php } ?>   
		html += '</select></td>';
		html += '  <td class="text-left"><select name="zone_to_geo_zone[' + zone_to_geo_zone_row + '][zone_id]" class="pts-form-control"><option value="0"><?php echo $text_all_zones; ?></option></select></td>';
		html += '  <td class="text-left"><button type="button" onclick="$(\'#zone-to-geo-zone-row' + zone_to_geo_zone_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#zone-to-geo-zone tbody').append(html);
		
		$('zone_to_geo_zone[' + zone_to_geo_zone_row + '][country_id]').trigger();
		
		zone_to_geo_zone_row++;
	}
	
	function country(element, index, zone_id) {
		$.ajax({
			url: 'index.php?route=account/account/country&country_id=' + element.value,
			dataType: 'json',
			beforeSend: function() {
				$('select[name=\'zone_to_geo_zone[' + index + '][country_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
			},
			complete: function() {
				$('.fa-spin').remove();
			},
			success: function(json) {
				html = '<option value="0"><?php echo $text_all_zones; ?></option>';
				
				if (json['zone'] && json['zone'] != '') {	
					for (i = 0; i < json['zone'].length; i++) {
						html += '<option value="' + json['zone'][i]['zone_id'] + '"';
						
						if (json['zone'][i]['zone_id'] == zone_id) {
							html += ' selected="selected"';
						}
						
						html += '>' + json['zone'][i]['name'] + '</option>';
					}
				}
				
				$('select[name=\'zone_to_geo_zone[' + index + '][zone_id]\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
	
	$('select[name$=\'[country_id]\']').trigger('change');
//--></script></div>
<?php echo $footer; ?>