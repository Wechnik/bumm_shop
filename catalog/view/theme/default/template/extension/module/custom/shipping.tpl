<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_shipping; ?></div>
  <div class="panel-body">

    <?php if ($error_warning) { ?>
    <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>

    
    <?php if ($shipping_methods) { ?>

      <div id="custom-shipping-methods">
      <?php foreach ($shipping_methods as $shipping_method) { ?>
        <p><strong><?php echo $shipping_method['title']; ?></strong></p>
       <?php if (!$shipping_method['error']) { ?>
          <?php foreach ($shipping_method['quote'] as $quote) { ?>
            <div class="radio">
              <label>
                <?php if ($quote['code'] == $code || !$code) { ?>
                <?php $code = $quote['code']; ?>
                <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
                                <?php } else { ?>
                                    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
                                <?php } ?>
                                <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?>
                                <?php if (isset($quote['description'])) { ?>
                                    <br /><small><?php echo $quote['description']; ?></small>
                                <?php } ?>
                            </label>
                        </div>
                    <?php } ?>
                <?php } else { ?>
                    <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
                <?php } ?>
            <?php } ?>
        </div>
        <? if ($partner) { ?>
            <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/hystmodal.min.css">
            <script src="catalog/view/javascript/hystmodal.min.js"></script>
            <div class="buttons" id="custom-control">
			    <div class="pull-left" id="custom-aff"><input type="checkbox" name="aff_add" value="1">&nbsp;&nbsp; <b>Доставить товар в пункт установки</b>
			    	&nbsp; &nbsp;
			        <span class="inputs buttons"><a href="#" type="button" class="button btn-primary button_oc btn" data-hystmodal="#myModal">Где установить</a></span>
			    </div>
			    <div class="clearfix"></div>
			</div>
            <div class="hystmodal" id="myModal" aria-hidden="true">
                <div class="hystmodal__wrap">
                    <div class="hystmodal__window" role="dialog" aria-modal="true">
                        <button data-hystclose class="hystmodal__close">Закрыть</button>
                        <script>
                            ymaps.ready(function () {
                                mapHandler([55.76, 37.64], mapsArray, true);
                                myMap.container.fitToViewport();
                                partners = mapsArray;
                            });
                        </script>
                        <script>
                            var mapsArray = [
                                <?php if (empty($affiliate_centr)) { ?>
                                    {
                                        geocode: '<?php echo $city; ?>',
                                        iconCaption: 'Нет установочных центров.'
                                    }
                                <?php } else { ?>
                                    <?php foreach ($affiliate_centr as $affiliate) { ?>
                                        {
                                            geocode: '<?php echo $affiliate["geocode"]; ?>',
                                            header: '<?php echo $affiliate["header"]; ?>',
                                            body: '<?php echo $affiliate["body"]; ?>',
                                            footer: '<?php echo $affiliate["footer"]; ?>',
                                            iconCaption: '<?php echo $affiliate["header"]; ?>',
                                            city: '<?php echo $affiliate["city"]; ?>',
                                            street: '<?php echo $affiliate["street"]; ?>',
                                            centr_id: '<?php echo $affiliate["centr_id"]; ?>'
                                        },
                                    <?php } ?>
                                <?php } ?>
                            ];
                        </script>
                        <script src="catalog/view/javascript/reverse_geocode.js" type="text/javascript"></script>
                        <style type="text/css">
                            html, body, #map {
                                width: 100%;
                                height: 100%;
                                margin: 0;
                                padding: 0;
                            }
                            #map {
                                min-height: 500px;
                            }
                        </style>
                        <div id="map"></div>
                    </div>
                </div>
            </div>
            <script type="text/javascript"><!--
                const myModal = new HystModal({
                    linkAttributeName: "data-hystmodal",
                    // настройки (не обязательно), см. API
                    beforeOpen: function(modal){
                    //  setTimeout(() => {
                    //      myMap.container.fitToViewport();
                    //  }, 500);
                    },
                });
            //--></script>
            <div id="custom-add"  style="display:none;"> <br>
                <?php if (empty($aff_centrs)) { ?>
                    <select name="custom-centr" id="custom-centr" class="form-control">
                        <option value="0">Нет партнеров</option>
                    </select>
                <? } else { ?>
                    <select name="custom-centr" id="custom-centr" class="form-control">
                        <option value="0">Выбрать установочный центр</option>
                        <?php foreach ($aff_centrs as $affiliat) { ?>
                            <option value="<?php echo $affiliat['centr_id']; ?>"><?php echo $affiliat['adres']; ?></option>
                        <? } ?>
                    </select>
                <? } ?>
            </div>
        <?  } ?>
        <p></p>
        <div id="custom-shipping-address">      
            <hr>
            <?php if ($addresses) { ?>
                <div class="radio">
                    <label>
                        <input type="radio" name="shipping_address" value="existing" checked="checked" />
              <?php echo $text_address_existing; ?></label>
          </div>
          <div id="shipping-existing">
            <select name="address_id" class="form-control">
              <?php foreach ($addresses as $address) { ?>
              <?php if ($address['address_id'] == $address_id) { ?>
              <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php if($address['address_1'] != ''){ ?><?php echo $address['address_1']; ?><?php }?><?php if($address['city'] != ''){ ?>, <?php echo $address['city']; ?><?php } ?><?php if($address['zone'] != ''){ ?>, <?php echo $address['zone']; ?><?php } ?><?php if($address['country'] != ''){ ?>, <?php echo $address['country']; ?><?php } ?></option>
              <?php } else { ?>
              <option value="<?php echo $address['address_id']; ?>"><?php if($address['address_1'] != ''){ ?><?php echo $address['address_1']; ?><?php }?><?php if($address['city'] != ''){ ?>, <?php echo $address['city']; ?><?php } ?><?php if($address['zone'] != ''){ ?>, <?php echo $address['zone']; ?><?php } ?><?php if($address['country'] != ''){ ?>, <?php echo $address['country']; ?><?php } ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="radio">
            <label>
              <input type="radio" name="shipping_address" value="new" />
              <?php echo $text_address_new; ?></label>
          </div>

          <br />
        <?php } ?>
        
        <div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">

          <?php foreach ($setting['fields'] as $field) { ?>
            <input type="hidden" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-shipping-company" class="form-control" />
            <?php /* if ($field['name'] === 'company') { ?>
              <div class="form-group" id="shipping-field-company">
                <label class="control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
                <input type="text" name="company" value="<?= $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-shipping-company" class="form-control" />
              </div>
              <?php continue; ?>
            <?php } */ ?>

            <?php if ($field['name'] === 'address_1') { ?>
              <div class="form-group" id="shipping-field-address-1">
                <label class="control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
                <input type="text" name="address_1" value="<?= $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-shipping-address-1" class="form-control" />
              </div>
            <?php } ?>

            <?php if ($field['name'] === 'address_2') { ?>
              <div class="form-group" id="shipping-field-address-2">
                <label class="control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
                <input type="text" name="address_2" value="<?= $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control" />
              </div>
            <?php } ?>

            <?php if ($field['name'] === 'city') { ?>
              <div class="form-group" id="shipping-field-city">
                <label class="control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
                <input type="text" name="city" value="<?= $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-shipping-city" class="form-control" />
              </div>
            <?php } ?>

            <?php if ($field['name'] === 'postcode') { ?>
              <div class="form-group" id="shipping-field-postcode">
                <label class="control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="form-control" />
              </div>
            <?php } ?>

            <?php if ($field['name'] === 'country_id') { ?>
              <div class="form-group" id="shipping-field-country-id">
                <label class="control-label" for="input-shipping-country-id"><?php echo $entry_country; ?></label>
                <select name="country_id" id="input-shipping-country" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            <?php } ?>

            <?php if ($field['name'] === 'zone_id') { ?>
              <div class="form-group" id="shipping-field-zone-id">
                <label class="control-label" for="input-shipping-zone-id"><?php echo $entry_zone; ?></label>
                <select name="zone_id" id="input-shipping-zone" class="form-control"></select>
              </div>
            <?php } ?>

            <?php if (substr($field['name'], 0, 12) === 'custom_field') { ?>

              <?php $custom_field_id = (int)str_replace('custom_field', '', $field['name']); ?>

              <?php foreach ($custom_fields as $custom_field) { ?>
              <?php if ($custom_field['custom_field_id'] == $custom_field_id) { ?>

                <?php if ($custom_field['type'] == 'select') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <select name="custom_field<?php echo $custom_field['custom_field_id']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                    <?php } ?>
                  </select>
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'radio') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <div class="radio">
                      <label>
                        <input type="radio" name="custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'checkbox') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label"><?php echo $custom_field['name']; ?></label>
                    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'text') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <input type="text" name="custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'textarea') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <textarea name="custom_field<?php echo $custom_field['custom_field_id']; ?>" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'file') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label"><?php echo $custom_field['name']; ?></label>
                  <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                  <input type="hidden" name="custom_field<?php echo $custom_field['custom_field_id']; ?>" value="" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'date') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="input-group date">
                    <input type="text" name="custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'time') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="input-group time">
                    <input type="text" name="custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
                <?php } ?>

                <?php if ($custom_field['type'] == 'datetime') { ?>
                <div id="shipping-field-custom-field<?= $custom_field['custom_field_id']; ?>" class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="input-group datetime">
                    <input type="text" name="custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                </div>
                <?php } ?>

              <?php } ?>   
              <?php } ?> 

            <?php } ?> 
          <?php } ?>   
        </div>
      </div>

    <?php } ?>
  </div>   
</div>

<script><!--
$('input[name="aff_add"]').on('change', function() {
    if($(this).prop('checked')){
        $('#custom-shipping-address').css('display','none');
        $('#custom-add').css('display','block');
    } else {
        $('#custom-shipping-address').css('display','block');
        $('#custom-add').css('display','none');
    }
});

$('select[name="custom-centr"]').on('change', function(){
    $('#custom-shipping-address input[name="address_1"]').val($(this).find('option:selected').text());
    $('#custom-shipping-address input[name="shipping_address"]').each(function(){
        if($(this).val() == 'new'){
            $(this).prop("checked", true);
        } else{
            $(this).prop("checked", false);
        }
    });
});
$('#custom-shipping [name^=shipping]').on('input', function() {
  $(this).parent().find('.text-danger').remove();
  $(this).parent().removeClass('has-error');
});
//--></script>

<script><!--
$('#custom-shipping input[name=\'shipping_address\']').on('change', function() {
  if ( $(this).val() === 'new' ){
    $('#shipping-new').show();
  } else {
    $('#shipping-new').hide();
  }
});
//--></script>

<script><!--
$('#custom-shipping input[name=\'shipping_method\']').on('change', function() {

  $('.alert, .text-danger').remove();
  $('.has-error').removeClass('has-error');

  // Custom (inbox)
  custom_block.shipping(this.value);

});

$('#custom-shipping input[name=\'shipping_method\']:checked').trigger('change');
//--></script>

<script><!--
$('#custom-shipping select[name=\'country_id\']').on('change', function() {
  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#custom-shipping select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#custom-shipping input[name=\'postcode\']').parent().parent().addClass('required');
      } else {
        $('#custom-shipping input[name=\'postcode\']').parent().parent().removeClass('required');
      }

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('#custom-shipping select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#custom-shipping select[name=\'country_id\']').trigger('change');
//--></script>
