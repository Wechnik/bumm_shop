<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-c6v" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-c6v" class="form-horizontal">
          <?php if (!$c6v_api_key) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_info; ?></div>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-settings" data-toggle="tab"><?php echo $tab_settings; ?></a></li>
            <li><a href="#tab-tk" data-toggle="tab"><?php echo $tab_tk; ?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-settings">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_api_key"><?php echo $entry_api_key; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_api_key" value="<?php echo $c6v_api_key; ?>" placeholder="<?php echo $entry_api_key; ?>" id="input-c6v_api_key" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_pickup_cities"><?php echo $entry_pickup_cities; ?></label>
                <div class="col-sm-10">
                  <table id="cities" class="table table-striped table-bordered table-hover">
                    <tbody>
                      <?php $city_row = 0; ?>
                      <?php foreach ($c6v_pickup_cities as $c6v_pickup_city) { ?>
                      <tr id="city-row-<?php echo $city_row; ?>">
                        <td class="text-left">
                          <select name="c6v_pickup_cities[]" id="input-c6v_pickup_cities" class="form-control">
                            <?php if (!empty($c6v_cities)) { ?>
                            <?php foreach ($c6v_cities as $city) { ?>
                              <?php if ($city['name'] == $c6v_pickup_city) { ?>
                              <option value="<?php echo $city['name']; ?>" selected="selected"><?php echo $city['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $city['name']; ?>"><?php echo $city['name']; ?></option>
                              <?php } ?>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </td>
                        <td class="text-right">
                          <button type="button" onclick="$('#city-row-<?php echo $city_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                        </td>
                      </tr>
                      <?php $city_row++; ?>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="2">
                          <button type="button" onclick="addCity();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_weight_class_id"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_weight_class_id" id="input-c6v_weight_class_id" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $c6v_weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_default_weight"><?php echo $entry_default_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_default_weight" value="<?php echo $c6v_default_weight; ?>" placeholder="<?php echo $entry_default_weight; ?>" id="input-c6v_default_weight" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_length_class_id"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_length_class_id" id="input-c6v_length_class_id" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $c6v_length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_default_length"><?php echo $entry_default_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="c6v_default_length" value="<?php echo $c6v_default_length; ?>" placeholder="<?php echo $entry_default_length; ?>" id="input-c6v_default_length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="c6v_default_width" value="<?php echo $c6v_default_width; ?>" placeholder="<?php echo $entry_default_width; ?>" id="input-c6v_default_width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="c6v_default_height" value="<?php echo $c6v_default_height; ?>" placeholder="<?php echo $entry_default_height; ?>" id="input-c6v_default_height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_min_weight"><?php echo $entry_min_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_min_weight" value="<?php echo $c6v_min_weight; ?>" placeholder="<?php echo $entry_min_weight; ?>" id="input-c6v_min_weight" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_max_weight"><?php echo $entry_max_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_max_weight" value="<?php echo $c6v_max_weight; ?>" placeholder="<?php echo $entry_max_weight; ?>" id="input-c6v_max_weight" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_min_total"><?php echo $entry_min_total; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_min_total" value="<?php echo $c6v_min_total; ?>" placeholder="<?php echo $entry_min_total; ?>" id="input-c6v_min_total" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_max_total"><?php echo $entry_max_total; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_max_total" value="<?php echo $c6v_max_total; ?>" placeholder="<?php echo $entry_max_total; ?>" id="input-c6v_max_total" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_fix_price"><?php echo $entry_fix_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_fix_price" value="<?php echo $c6v_fix_price; ?>" placeholder="<?php echo $entry_fix_price; ?>" id="input-c6v_fix_price" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_add_cost"><?php echo $entry_add_cost; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_add_cost" value="<?php echo $c6v_add_cost; ?>" placeholder="<?php echo $entry_add_cost; ?>" id="input-c6v_add_cost" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_add_day"><?php echo $entry_add_day; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_add_day" value="<?php echo $c6v_add_day; ?>" placeholder="<?php echo $entry_add_day; ?>" id="input-c6v_add_day" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_tax_class_id"><?php echo $entry_tax_class; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_tax_class_id" id="input-c6v_tax_class_id" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $c6v_tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_geo_zone_id"><?php echo $entry_geo_zone; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_geo_zone_id" id="input-c6v_geo_zone_id" class="form-control">
                    <option value="0"><?php echo $text_all_zones; ?></option>
                    <?php foreach ($geo_zones as $geo_zone) { ?>
                    <?php if ($geo_zone['geo_zone_id'] == $c6v_geo_zone_id) { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_sort_order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_sort_order" value="<?php echo $c6v_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-c6v_sort_order" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_title"><?php echo $entry_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_title" value="<?php echo $c6v_title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-c6v_title" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_quote_title"><?php echo $entry_quote_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="c6v_quote_title" value="<?php echo $c6v_quote_title; ?>" placeholder="<?php echo $entry_quote_title; ?>" id="input-c6v_quote_title" class="form-control" />
                  <div class="panel panel-default">
                    <table class="table">
                      <tr>
                        <td><code>{{logo}}</code> <code>{{name}}</code> <code>{{description}}</code> <code>{{days}}</code></td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_cost_status"><?php echo $entry_cost_status; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_cost_status" id="input-c6v_cost_status" class="form-control">
                    <?php if ($c6v_cost_status) { ?>
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
                <label class="col-sm-2 control-label" for="input-c6v_calc_type"><?php echo $entry_calc_type; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-default <?php if ($c6v_calc_type == 0) { ?>active<?php } ?>"><input type="radio" name="c6v_calc_type" value="0" autocomplete="off" <?php if ($c6v_calc_type == 0) { ?>checked="checked"<?php } ?>><?php echo $text_width; ?></label>
                      <label class="btn btn-default <?php if ($c6v_calc_type == 1) { ?>active<?php } ?>"><input type="radio" name="c6v_calc_type" value="1" autocomplete="off" <?php if ($c6v_calc_type == 1) { ?>checked="checked"<?php } ?>><?php echo $text_length; ?></label>
                      <label class="btn btn-default <?php if ($c6v_calc_type == 2) { ?>active<?php } ?>"><input type="radio" name="c6v_calc_type" value="2" autocomplete="off" <?php if ($c6v_calc_type == 2) { ?>checked="checked"<?php } ?>><?php echo $text_height; ?></label>
                      <label class="btn btn-default <?php if ($c6v_calc_type == 3) { ?>active<?php } ?>"><input type="radio" name="c6v_calc_type" value="3" autocomplete="off" <?php if ($c6v_calc_type == 3) { ?>checked="checked"<?php } ?>><?php echo $text_volume; ?></label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-c6v_status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_status" id="input-c6v_status" class="form-control">
                    <?php if ($c6v_status) { ?>
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
                <label class="col-sm-2 control-label" for="input-c6v_logging"><?php echo $entry_logging; ?></label>
                <div class="col-sm-10">
                  <select name="c6v_logging" id="input-c6v_logging" class="form-control">
                    <?php if ($c6v_logging) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-tk">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="tk">
                    <?php foreach ($tk as $code) { ?>
                    <li><a href="#tab-tk-<?php echo $code; ?>" data-toggle="tab"><?php echo ${'text_' . $code}; ?></a></li>
                    <?php } ?>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <?php foreach ($tk as $code) { ?>
                    <div class="tab-pane" id="tab-tk-<?php echo $code; ?>">
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-c6v_fix_price_<?php echo $code; ?>"><?php echo $entry_fix_price; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="c6v_fix_price_<?php echo $code; ?>" value="<?php echo ${'c6v_fix_price_' . $code}; ?>" placeholder="<?php echo $entry_fix_price; ?>" id="input-c6v_fix_price_<?php echo $code; ?>" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-c6v_add_cost_<?php echo $code; ?>"><?php echo $entry_add_cost; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="c6v_add_cost_<?php echo $code; ?>" value="<?php echo ${'c6v_add_cost_' . $code}; ?>" placeholder="<?php echo $entry_add_cost; ?>" id="input-c6v_add_cost_<?php echo $code; ?>" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-c6v_add_day_<?php echo $code; ?>"><?php echo $entry_add_day; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="c6v_add_day_<?php echo $code; ?>" value="<?php echo ${'c6v_add_day_' . $code}; ?>" placeholder="<?php echo $entry_add_day; ?>" id="input-c6v_add_day_<?php echo $code; ?>" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-c6v_sort_order_<?php echo $code; ?>"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="c6v_sort_order_<?php echo $code; ?>" value="<?php echo ${'c6v_sort_order_' . $code}; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-c6v_sort_order_<?php echo $code; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php if ($code == 'cdektk' || $code == 'russianpost') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-c6v_exclude_<?php echo $code; ?>"><?php echo $entry_exclude_tariff; ?></label>
                        <div class="col-sm-10">
                          <select name="c6v_exclude_<?php echo $code; ?>[]" id="input-c6v_exclude_<?php echo $code; ?>" class="form-control" multiple>
                            <?php foreach (${$code . '_tariffs'} as $id => $tariff) { ?>
                            <option value="<?php echo $id; ?>" <?php if (in_array($id, ${'c6v_exclude_' . $code})) { ?>selected="selected"<?php } ?>><?php echo $tariff; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <?php } ?>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-support">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_version; ?></label>
                <div class="col-sm-10"><a class="btn"><?php echo $version; ?></a></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_developer; ?></label>
                <div class="col-sm-10"><a href="mailto:p0v1n0m@gmail.com" class="btn">p0v1n0m@gmail.com</a></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_documentation; ?></label>
                <div class="col-sm-10"><a href="https://opencartforum.com/files/file/6526-kalkulyator-dostavki-cdek-ems-pochta-rossii-energiya/" target="_blank" class="btn">https://opencartforum.com/files/file/6526-kalkulyator-dostavki-cdek-ems-pochta-rossii-energiya/</a></div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#tk a:first').tab('show');

var city_row = <?php echo $city_row; ?>;

function addCity() {
  html  = '<tr id="city-row-' + city_row + '">';
  html += '  <td class="text-left">';
  html += '    <select name="c6v_pickup_cities[]" id="input-c6v_pickup_cities" class="form-control">';
  <?php if (!empty($c6v_cities)) { ?>
  <?php foreach ($c6v_cities as $city) { ?>
  html += '      <option value="<?php echo $city['name']; ?>"><?php echo $city['name']; ?></option>';
  <?php } ?>
  <?php } ?>
  html += '    </select>';
  html += '  </td>';
  html += '  <td class="text-right"><button type="button" onclick="$(\'#city-row-' + city_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#cities tbody').append(html);
  
  city_row++;
}
//--></script>
<?php echo $footer; ?> 
