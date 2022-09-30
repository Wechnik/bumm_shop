<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_description; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-centr" class="form-horizontal">
      <table id="centr-value" class="table table-striped table-bordered table-hover">
      <tbody>
      <?php $centr_value_row = 0; ?>
      <?php foreach ($centr_values as $centr_value) { ?>


              <tr id="centr-value-row<?php echo $centr_value_row; ?>">
          <td class="text-left"><input type="hidden" name="centr_value[<?php echo $centr_value_row; ?>][centr_id]" value="<?php echo $centr_value['centr_id']; ?>" />
            <?php echo $entry_text_category; ?><br>
            <select id="category" name="centr_value[<?php echo $centr_value_row; ?>][category]" class="form-control">
                    <option value="0" selected="selected"><?php echo $text_none; ?></option>
                    <?php foreach($categories as $category) { ?>
                    <?php if($category['category_id'] == $centr_value['category']) { ?>
                    <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>


          <!--  <input type="text" name="centr_value[<?php echo $centr_value_row; ?>][category]" value="<?php echo $centr_value['category']; ?>" placeholder="<?php echo $entry_category; ?>" class="form-control" /><br>  //-->
           <?php echo $entry_text_zone; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][zone]" value="<?php echo $centr_value['zone']; ?>" placeholder="<?php echo $entry_zone; ?>" class="form-control" /><br>
           <?php echo $entry_text_usluga; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][usluga]" value="<?php echo $centr_value['usluga']; ?>" placeholder="<?php echo $entry_usluga; ?>" class="form-control" />
           </td>

          <td class="text-left"><?php echo $entry_text_city; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][city]" value="<?php echo $centr_value['city']; ?>" placeholder="<?php echo $entry_city; ?>" class="form-control" /><br>
          <?php echo $entry_text_adres; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][adres]" value="<?php echo $centr_value['adres']; ?>" placeholder="<?php echo $entry_adres; ?>" class="form-control" /><br>
          <?php echo $entry_text_rabota; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][rabota]" value="<?php echo $centr_value['rabota']; ?>" placeholder="<?php echo $entry_rabota; ?>" class="form-control" />
          </td>

          <td class="text-left"><?php echo $entry_text_telefon; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][telefon]" value="<?php echo $centr_value['telefon']; ?>" placeholder="<?php echo $entry_telefon; ?>" class="form-control" /><br>
          <?php echo $button_remove; ?><br><button type="button" onclick="$('#centr-value-row<?php echo $centr_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              </body>

              <?php $centr_value_row++; ?>
              <?php } ?>
           </tbody>
           <tfoot>
              <tr>
                 <td class="text-right" colspan="3"><button type="button" onclick="addCentrValue();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
      </form>
      <div class="buttons clearfix">
      <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right">
        <button type="submit" form="form-centr" data-toggle="tooltip" title="<?php echo $button_continue; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>

        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

$('#centr-value').show();

var centr_value_row = <?php echo $centr_value_row; ?>;

function addCentrValue() {
    html  = '<tr id="centr-value-row' + centr_value_row + '">';
    html += '  <td class="text-left"><input type="hidden" name="centr_value[' + centr_value_row + '][centr_id]" value="" />';
    html += '  <?php echo $entry_text_category; ?><br>';
    html += '  <select id="category" name="centr_value[' + centr_value_row + '][category]" class="form-control">';
    html += '  <option value="0" selected="selected"><?php echo $text_none; ?></option>';
    html += '  <?php foreach($categories as $category) { ?> ';
    html += '  <?php if($category['category_id'] == $centr_value['category']) { ?>';
    html += '  <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option> ';
    html += '  <?php } else { ?>';
    html += '  <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>';
    html += '  <?php } ?>';
    html += '  <?php } ?> ';
    html += '  </select>';
    html += '  <?php echo $entry_text_zone; ?><br><input type="text" name="centr_value[' + centr_value_row + '][zone]" value="" placeholder="<?php echo $entry_zone; ?>" class="form-control" /><br>';
	html += '  <?php echo $entry_text_usluga; ?><br><input type="text" name="centr_value[' + centr_value_row + '][usluga]" value="" placeholder="<?php echo $entry_usluga; ?>" class="form-control" /></td>';
    html += '  <td class="text-left"><?php echo $entry_text_city; ?><br><input type="text" name="centr_value[' + centr_value_row + '][city]" value="" placeholder="<?php echo $entry_city; ?>" class="form-control" /><br>';
    html += '  <?php echo $entry_text_adres; ?><br><input type="text" name="centr_value[' + centr_value_row + '][adres]" value="" placeholder="<?php echo $entry_adres; ?>" class="form-control" /><br>';
    html += '  <?php echo $entry_text_rabota; ?><br><input type="text" name="centr_value[' + centr_value_row + '][rabota]" value="" placeholder="<?php echo $entry_rabota; ?>" class="form-control" /></td>';
    html += '  <td class="text-left"><?php echo $entry_text_telefon; ?><br><input type="text" name="centr_value[' + centr_value_row + '][telefon]" value="" placeholder="<?php echo $entry_telefon; ?>" class="form-control" /><br>';
    html += '  <?php echo $button_remove; ?><br><button type="button" onclick="$(\'#centr-value-row' + centr_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
    $('#centr-value tbody').append(html);

	centr_value_row++;
}
//--></script>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['link']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val(item['label']);
		$('textarea[name=\'link\']').val(item['value']);
	}
});
//--></script>
<?php echo $footer; ?>