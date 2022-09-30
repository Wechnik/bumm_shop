<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-affiliate" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-affiliate" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>

            <li><a href="#tab-payment" data-toggle="tab"><?php echo $tab_centr; ?></a></li>


            <li><a href="#tab-transaction" data-toggle="tab"><?php echo $tab_zakaz; ?></a></li>

          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <fieldset>
                <legend><?php echo $text_affiliate_detail; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                    <?php if ($error_firstname) { ?>
                    <div class="text-danger"><?php echo $error_firstname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                    <?php if ($error_lastname) { ?>
                    <div class="text-danger"><?php echo $error_lastname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="+7(999)-999-99-99" id="input-telephone" class="form-control" />
                    <?php if ($error_telephone) { ?>
                    <div class="text-danger"><?php echo $error_telephone; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                 <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                  <div class="col-sm-10">
                    <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" autocomplete="off" id="input-password" class="form-control"  />
                    <?php if ($error_password) { ?>
                    <div class="text-danger"><?php echo $error_password; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                  <div class="col-sm-10">
                    <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" autocomplete="off" id="input-confirm" class="form-control" />
                    <?php if ($error_confirm) { ?>
                    <div class="text-danger"><?php echo $error_confirm; ?></div>
                    <?php  } ?>
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
              </fieldset>
              <fieldset>
                <legend><?php echo $text_affiliate_address; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-website"><?php echo $entry_website; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="website" value="<?php echo $website; ?>" placeholder="<?php echo $entry_website; ?>" id="input-website" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                    <?php if ($error_address_1) { ?>
                    <div class="text-danger"><?php echo $error_address_1; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_zone; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_zone; ?>" id="input-address-2" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                    <?php if ($error_city) { ?>
                    <div class="text-danger"><?php echo $error_city; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                    <?php if ($error_postcode) { ?>
                    <div class="text-danger"><?php echo $error_postcode; ?></div>
                    <?php  } ?>
                  </div>
                </div>

                </fieldset>
            </div>

            <div class="tab-pane" id="tab-payment">
           <table id="centr-value" class="table table-striped table-bordered table-hover">
      <tbody>
      <?php $centr_value_row = 0; ?>
      <?php foreach ($centr_values as $centr_value) { ?>

            <body>
              <tr id="centr-value-row<?php echo $centr_value_row; ?>">
          <td class="text-left" style="max-width:120px;"><input type="hidden" name="centr_value[<?php echo $centr_value_row; ?>][centr_id]" value="<?php echo $centr_value['centr_id']; ?>" />
            <?php echo $entry_text_category; ?><br>
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

          <td class="text-left" style="min-width: 150px;"><?php echo $entry_text_city; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][city]" value="<?php echo $centr_value['city']; ?>" placeholder="<?php echo $entry_city; ?>" class="form-control" />
         <?php echo $entry_text_zone; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][zone]" value="<?php echo $centr_value['zone']; ?>" placeholder="<?php echo $entry_zone; ?>" class="form-control" />
          <?php echo $entry_text_adres; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][adres]" value="<?php echo $centr_value['adres']; ?>" placeholder="<?php echo $entry_adres; ?>" class="form-control" />
           <?php echo $entry_text_usluga; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][usluga]" value="<?php echo $centr_value['usluga']; ?>" placeholder="<?php echo $entry_usluga; ?>" class="form-control" />
          <?php echo $entry_text_rabota; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][rabota]" value="<?php echo $centr_value['rabota']; ?>" placeholder="<?php echo $entry_rabota; ?>" class="form-control" />
          <?php echo $entry_text_telefon; ?><br><input type="text" name="centr_value[<?php echo $centr_value_row; ?>][telefon]" value="<?php echo $centr_value['telefon']; ?>" placeholder="<?php echo $entry_telefon; ?>" class="form-control" />
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

            </div>

            <div class="tab-pane" id="tab-transaction">
           <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_order_id; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td class="text-right"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_centr; ?></td>
            <!--  <td class="text-right"><?php echo $column_shipping; ?></td> //-->
              <td class="text-left"><?php echo $column_date_added; ?></td>
           </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-right"><?php echo $order['order_id']; ?></td>
              <td class="text-left"><?php echo $order['customer']; ?></td>
              <td class="text-right"><a href="<?php echo $order['href']; ?>"><?php echo $order['name']; ?></a></td>
              <td class="text-left"><?php echo $order['centr']; ?></td>
            <!--  <td class="text-right"><?php echo $order['shipping']; ?></td> //-->
              <td class="text-left"><?php echo $order['date_added']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>

          </div>
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--

$('#centr-value').show();

var centr_value_row = <?php echo $centr_value_row; ?>;

function addCentrValue() {
    html  = '<tr id="centr-value-row' + centr_value_row + '">';
    html += '  <td class="text-left" style="max-width:120px;"><input type="hidden" name="centr_value[' + centr_value_row + '][centr_id]" value="" />';
    html += '  <?php echo $entry_text_category; ?><br>';
    html += '  <div class="well well-sm" style="min-height: 150px;max-height: 250px;overflow: auto;">';
    html += '  <?php foreach ($categories as $category) { ?>';
    html += '  <br>';
    html += '  <label>';
    html += '  <input type="checkbox" name="centr_value[' + centr_value_row + '][category][]" value="<?php echo $category['category_id']; ?>" />';
    html += '  <?php echo $category['name']; ?>';
    html += '  </label>';
    html += '  <?php } ?> ';
    html += '  </div>';
    html += '  <td class="text-left"><?php echo $entry_text_city; ?><br><input type="text" name="centr_value[' + centr_value_row + '][city]" value="" placeholder="<?php echo $entry_city; ?>" class="form-control" />';
    html += '  <?php echo $entry_text_zone; ?><br><input type="text" name="centr_value[' + centr_value_row + '][zone]" value="" placeholder="<?php echo $entry_zone; ?>" class="form-control" />';
	html += '  <?php echo $entry_text_adres; ?><br><input type="text" name="centr_value[' + centr_value_row + '][adres]" value="" placeholder="<?php echo $entry_adres; ?>" class="form-control" />';
    html += '  <?php echo $entry_text_usluga; ?><br><input type="text" name="centr_value[' + centr_value_row + '][usluga]" value="" placeholder="<?php echo $entry_usluga; ?>" class="form-control" />';
    html += '  <?php echo $entry_text_rabota; ?><br><input type="text" name="centr_value[' + centr_value_row + '][rabota]" value="" placeholder="<?php echo $entry_rabota; ?>" class="form-control" />';
    html += '  <?php echo $entry_text_telefon; ?><br><input type="text" name="centr_value[' + centr_value_row + '][telefon]" value="" placeholder="<?php echo $entry_telefon; ?>" class="form-control" />';
    html += '  <div class="text-right"><br><button type="button" onclick="$(\'#centr-value-row' + centr_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div></td>';
	html += '</tr>';
    $('#centr-value tbody').append(html);

	centr_value_row++;
}
//--></script>



  <script type="text/javascript"><!--
$('input[name=\'payment\']').on('change', function() {
	$('.payment').hide();

	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script>
  <script type="text/javascript"><!--
$('#transaction').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#transaction').load(this.href);
});

$('#transaction').load('index.php?route=marketing/affiliate/transaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>');

$('#button-transaction').on('click', function() {
	$.ajax({
		url: 'index.php?route=marketing/affiliate/addtransaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'description=' + encodeURIComponent($('#tab-transaction input[name=\'description\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
		beforeSend: function() {
			$('#button-transaction').button('loading');
		},
		complete: function() {
			$('#button-transaction').button('reset');
		},
		success: function(json) {
			$('.alert').remove();
			
			if (json['error']) {
				 $('#tab-transaction').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
			}

			if (json['success']) {
				$('#tab-transaction').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');

				$('#transaction').load('index.php?route=marketing/affiliate/transaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>');
	
				$('#tab-transaction input[name=\'amount\']').val('');
				$('#tab-transaction input[name=\'description\']').val('');			
			}
		}
	});
});
//--></script></div>
<?php echo $footer; ?>