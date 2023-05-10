<div class="panel panel-default">
  <div class="panel-heading"><span class="col-lg-7"><?= $heading_customer ?></span></div>
  <div class="panel-body">
    <div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
      <label class="control-label"><?php echo $entry_customer_group; ?></label>
      <?php foreach ($customer_groups as $customer_group) { ?>
      <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
      <div class="radio">
        <label>
          <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
          <?php echo $customer_group['name']; ?></label>
      </div>
      <?php } else { ?>
      <div class="radio">
        <label>
          <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
          <?php echo $customer_group['name']; ?></label>
      </div>
      <?php } ?>
      <?php } ?>
    </div>

    <?php foreach ($setting['fields'] as $field) { ?>
    <?php if ($field['name'] === 'firstname') { ?>
        <div class="form-group ">
          <label class="control-label" for="customer-input-firstname"><?php echo $entry_firstname; ?>: </label>
          <span class="customer-input-firstname"><?php echo $firstname; ?> </span>
        </div>
      <?php } ?>
      <?php if ($field['name'] === 'email') { ?>
        <div class="form-group">
          <label class="control-label" for="customer-input-email"><?php echo $entry_email; ?>: </label>
          <span class="customer-input-email"><?php echo $email; ?></span>
        </div>
      <?php } ?>
      <?php if ($field['name'] === 'telephone') { ?>
        <div class="form-group">
          <label class="control-label" for="customer-input-telephone"><?php echo $entry_telephone; ?> :</label>
          <span class="customer-input-telephone"><?php echo $telephone; ?></span>
        </div>
      <?php } ?>
    <?php } ?>
    <?php foreach ($setting['fields'] as $field) { ?>
      <?php if ($field['name'] === 'firstname') { ?>
        <div class="form-group <?=(($firstname!='')?'disnone':'')?>" id="customer-field-firstname" >
          <label class="control-label" for="customer-input-firstname"><?php echo $entry_firstname; ?></label>
          <input type="text" name="customer_firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="customer-input-firstname" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if ($field['name'] === 'lastname') { ?>
        <div class="form-group <?=(($lastname!='')?'disnone':'')?>" id="customer-field-lastname">
          <label class="control-label" for="customer-input-lastname"><?php echo $entry_lastname; ?></label>
          <input type="text" name="customer_lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="customer-input-lastname" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if ($field['name'] === 'email') { ?>
        <div class="form-group <?=(($email!='')?'disnone':'')?>" id="customer-field-email">
          <label class="control-label" for="customer-input-email"><?php echo $entry_email; ?></label>
          <input type="text" name="customer_email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="customer-input-email" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if ($field['name'] === 'telephone') { ?>
        <div class="form-group <?=(($telephone!='')?'disnone':'')?>" id="customer-field-telephone">
          <label class="control-label" for="customer-input-telephone"><?php echo $entry_telephone; ?></label>
          <input type="text" name="customer_telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="customer-input-telephone" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if ($field['name'] === 'fax') { ?>
        <div class="form-group" id="customer-field-fax">
          <label class="control-label" for="customer-input-fax"><?php echo $entry_fax; ?></label>
          <input type="text" name="customer_fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="customer-input-fax" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if (!$logged && $field['name'] === 'password') { ?>
        <div class="form-group" id="customer-field-password">
          <label class="control-label" for="customer-input-password"><?php echo $entry_password; ?></label>
          <input type="password" name="customer_password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="customer-input-password" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if (!$logged && $field['name'] === 'confirm') { ?>
        <div class="form-group" id="customer-field-confirm">
          <label class="control-label" for="customer-input-confirm"><?php echo $entry_confirm; ?></label>
          <input type="password" name="customer_confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="customer-input-confirm" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php continue; ?>
      <?php } ?>

      <?php if (substr($field['name'], 0, 12) === 'custom_field') { ?>

        <?php $custom_field_id = (int)str_replace('custom_field', '', $field['name']); ?>

        <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['custom_field_id'] == $custom_field_id) { ?>
        
        <?php if ($custom_field['type'] == 'select') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
          <select name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'radio') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label"><?php echo $custom_field['name']; ?></label>
          <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
            <div class="radio">
              <label>
                <input type="radio" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                <?php echo $custom_field_value['name']; ?></label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'checkbox') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label"><?php echo $custom_field['name']; ?></label>
          <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
            <div class="checkbox">
              <label>
                <input type="checkbox" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>[]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                <?php echo $custom_field_value['name']; ?></label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'text') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
          <input type="text" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" data-validation="<?php echo $field['validation']; ?>" />
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'textarea') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
          <textarea name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'file') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label"><?php echo $custom_field['name']; ?></label>
          <br />
          <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
          <input type="hidden" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" value="" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'date') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
          <div class="input-group date">
            <input type="text" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            <span class="input-group-btn">
            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
            </span></div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'time') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
          <div class="input-group time">
            <input type="text" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            <span class="input-group-btn">
            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
            </span></div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'datetime') { ?>
        <div id="customer-field-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
          <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
          <div class="input-group datetime">
            <input type="text" name="customer_custom_field<?php echo $custom_field['custom_field_id']; ?>" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            <span class="input-group-btn">
            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
            </span></div>
        </div>
        <?php } ?>
        <?php } ?>
        <?php } ?>

      <?php } ?>

    <?php } ?>
    <div> <a id="edit_customer" href="javascript:;">Изменить</a></div>

  </div>
</div>

<script><!--
$('#custom-customer [name^=customer]').on('input', function() {
  $(this).parent().find('.text-danger').remove();
  $(this).parent().removeClass('has-error');
});
//--></script>
<style>
    .panel-default > .panel-heading{height:40px;}
    .disnone{display:none!important;}
</style>
<script><!--
$('#edit_customer').on('click',function(){
    if($('#customer-field-firstname').hasClass('disnone')){
        $('#customer-field-firstname').removeClass('disnone');
        $('#customer-field-telephone').removeClass('disnone');
        $('#customer-field-email').removeClass('disnone');
        $('#edit_customer').text('Готово');
    } else {
        $('#customer-field-firstname').addClass('disnone');
        $('#customer-field-telephone').addClass('disnone');
        $('#customer-field-email').addClass('disnone');
        $('#edit_customer').text('Изменить');
    }
});
$('#custom-customer input[name=\'customer_group_id\']').on('change', function() {

  // Customer
  custom_block.customer(this.value);

  // Payment Methods
  custom_block.payment(this.value);

});
$('input[name="customer_firstname"]').on('change', function(){
    custom_block.customerupdate('firstname',this.value);
    $('span.customer-input-firstname').text(this.value);
});
$('input[name="customer_email"]').on('change', function(){
    custom_block.customerupdate('email',this.value);
    $('span.customer-input-email').text(this.value);
});
$('input[name="customer_telephone"]').on('change', function(){
    custom_block.customerupdate('telephone',this.value);
    $('span.customer-input-telephone').text(this.value);
});
$('#custom-customer input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>

<script><!--
$('#custom-customer button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input[name^=\'custom_field\']').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>

