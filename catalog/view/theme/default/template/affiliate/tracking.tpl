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
      <h1><b><?php echo $heading_title; ?></b></h1>
      <p><b><?php echo $text_description; ?></b></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-centr" class="form-horizontal">
      <table id="centr-value" class="table table-striped table-bordered table-hover">
      <tbody>
      <?php $centr_value_row = 0; ?>
      <?php foreach ($centr_values as $centr_value) { ?>

            <body>
              <tr id="centr-value-row<?php echo $centr_value_row; ?>">
          <td class="text-left" style="max-width:120px;"><input type="hidden" name="centr_value[<?php echo $centr_value_row; ?>][centr_id]" value="<?php echo $centr_value['centr_id']; ?>" />
            <b><?php echo $entry_text_category; ?></b><br>
                <div class="well well-sm" style="min-height: 150px;max-height: 250px;overflow: auto;">
                    <?php foreach ($categories as $category) { ?>
                        <br>
                        <label>
                          <?php if (in_array($category['category_id'], explode( ',', $centr_value['category']))) { ?>
                          <input type="checkbox" name="centr_value[<?php echo $centr_value_row; ?>][category][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                          <?php echo $category['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="centr_value[<?php echo $centr_value_row; ?>][category][]" value="<?php echo $category['category_id']; ?>" />
                          <?php echo $category['name']; ?>
                          <?php } ?>
                        </label>

                    <?php } ?>
                  </div>


          <!--  <input type="text" name="centr_value[<?php echo $centr_value_row; ?>][category]" value="<?php echo $centr_value['category']; ?>" placeholder="<?php echo $entry_category; ?>" class="form-control" /><br>  //-->
            </td>

          <td class="text-left" style="min-width: 150px;"><b><?php echo $entry_text_city; ?></b><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][city]" value="<?php echo $centr_value['city']; ?>" placeholder="<?php echo $entry_city; ?>" class="form-control" />
         <b><?php echo $entry_text_zone; ?></b><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][zone]" value="<?php echo $centr_value['zone']; ?>" placeholder="<?php echo $entry_zone; ?>" class="form-control" />
          <b><?php echo $entry_text_adres; ?></b><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][adres]" value="<?php echo $centr_value['adres']; ?>" placeholder="<?php echo $entry_adres; ?>" class="form-control" />
           <b><?php echo $entry_text_usluga; ?></b><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][usluga]" value="<?php echo $centr_value['usluga']; ?>" placeholder="<?php echo $entry_usluga; ?>" class="form-control" />
          <b><?php echo $entry_text_rabota; ?></b><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][rabota]" value="<?php echo $centr_value['rabota']; ?>" placeholder="<?php echo $entry_rabota; ?>" class="form-control" />
          <b><?php echo $entry_text_telefon; ?></b><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][telefon]" value="<?php echo $centr_value['telefon']; ?>" placeholder="<?php echo $entry_telefon; ?>" class="form-control" />
         <div class="text-right"><br><button type="button" onclick="$('#centr-value-row<?php echo $centr_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button> </div></td>
              </tr>
              </body>

              <?php $centr_value_row++; ?>
              <?php } ?>
           </tbody>
           <tfoot>
              <tr>
                 <td class="text-right" colspan="2"><button type="button" onclick="addCentrValue();" data-toggle="tooltip" title="Добавить" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
      </form>
      <div class="buttons clearfix">
      <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right">
        <button type="submit" form="form-centr" data-toggle="tooltip" title="Сохранить" class="btn btn-primary"><i class="fa fa-save"></i></button>

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
    html += '  <td class="text-left" style="max-width:120px;"><input type="hidden" name="centr_value[' + centr_value_row + '][centr_id]" value="" />';
    html += '  <b><?php echo $entry_text_category; ?></b><br>';
    html += '  <div class="well well-sm" style="min-height: 150px;max-height: 250px;overflow: auto;">';
    html += '  <?php foreach ($categories as $category) { ?>';
    html += '  <br>';
    html += '  <label>';
    html += '  <input type="checkbox" name="centr_value[' + centr_value_row + '][category][]" value="<?php echo $category['category_id']; ?>" />';
    html += '  <?php echo $category['name']; ?>';
    html += '  </label>';
    html += '  <?php } ?> ';
    html += '  </div>';
    html += '  <td class="text-left"><br><br><input type="text" name="centr_value[' + centr_value_row + '][city]" value="" placeholder="<?php echo $entry_city; ?>" class="form-control" />';
    html += '  <b><?php echo $entry_text_zone; ?></b><br><input type="text" name="centr_value[' + centr_value_row + '][zone]" value="" placeholder="<?php echo $entry_zone; ?>" class="form-control" />';
	html += '  <b><?php echo $entry_text_adres; ?></b><br><input type="text" name="centr_value[' + centr_value_row + '][adres]" value="" placeholder="<?php echo $entry_adres; ?>" class="form-control" />';
    html += '  <b><?php echo $entry_text_usluga; ?></b><br><input type="text" name="centr_value[' + centr_value_row + '][usluga]" value="" placeholder="<?php echo $entry_usluga; ?>" class="form-control" />';
    html += '  <b><?php echo $entry_text_rabota; ?></b><br><input type="text" name="centr_value[' + centr_value_row + '][rabota]" value="" placeholder="<?php echo $entry_rabota; ?>" class="form-control" />';
    html += '  <b><?php echo $entry_text_telefon; ?></b><br><input type="text" name="centr_value[' + centr_value_row + '][telefon]" value="" placeholder="<?php echo $entry_telefon; ?>" class="form-control" />';
    html += '  <div class="text-right"><br><button type="button" onclick="$(\'#centr-value-row' + centr_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div></td>';
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