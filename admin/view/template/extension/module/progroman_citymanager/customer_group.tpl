<div class="for-general-form">
  <div class="form-group">
    <label class="control-label">
      <input name="setting[enable_switch_customer_group]" value="1" type="checkbox"
        <?= !empty($settings['enable_switch_customer_group']) ? ' checked="checked"' : ''; ?>">
        <?= $entry_sub_enabled; ?>
    </label>
  </div>
  <div class="form-group">
    <label class="control-label">
      <input name="setting[customer_group_for_new_user]" value="1" type="checkbox"
        <?= !empty($settings['customer_group_for_new_user']) ? ' checked="checked"' : ''; ?>">
        <?= $entry_customer_group_for_new_user; ?>
    </label>
  </div>
  <div class="form-group">
    <label class="control-label">
      <input name="setting[customer_group_high_priority]" value="1" type="checkbox"
        <?= !empty($settings['customer_group_high_priority']) ? ' checked="checked"' : ''; ?>">
        <?= $entry_customer_group_high_priority; ?>
    </label>
  </div>
</div>
<form action="<?= $action_customer_group; ?>" class="main-form" data-submit="saveCustomerGroups">
  <table id="customer_groups" class="table table-striped table-bordered">
    <thead>
    <tr>
      <td>
        <div class="row">
          <div class="col-sm-5 col-xs-12">
              <?= $entry_zone; ?>
          </div>
          <div class="col-sm-5 col-xs-12">
              <?= $entry_customer_group; ?>
          </div>
        </div>
      </td>
    </tr>
    </thead>
    <tbody>
    <?php $customer_group_row = 0; ?>
    <?php foreach ($cm_customer_groups as $cm_group) { ?>
      <tr id="customer-group-row<?= $customer_group_row; ?>">
        <td>
          <div class="row">
            <div class="col-sm-5 col-xs-12">
              <input type="text" name="" value="<?= $cm_group['fias_name']; ?>" class="row-fias-name form-control"/>
              <input type="hidden" name="customer_groups[<?= $customer_group_row; ?>][fias_id]" value="<?= $cm_group['fias_id']; ?>"
                     class="row-fias-id"/>
            </div>
            <div class="col-sm-5 col-xs-12">
              <select name="customer_groups[<?= $customer_group_row ?>][customer_group_id]"
                      class="form-control">
                <option value="0"><?= $text_none; ?></option>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                    <option value="<?= $customer_group['customer_group_id']; ?>"
                        <?= $customer_group['customer_group_id'] == $cm_group['customer_group_id'] ? 'selected' : ''; ?>>
                        <?= $customer_group['name']; ?>
                    </option>
                  <?php } ?>
              </select>
            </div>
            <div class="col-sm-2 col-xs-12">
              <a onclick="$('#customer-group-row<?= $customer_group_row; ?>').remove();" class="btn btn-danger">
                <i class="fa fa-remove visible-xs"></i>
                <span class="hidden-xs"><?= $button_remove; ?></span>
              </a>
            </div>
          </div>
        </td>
      </tr>
        <?php $customer_group_row++; ?>
    <?php } ?>
    </tbody>
    <tfoot>
    <tr>
      <th>
        <a class="btn btn-success" onclick="addCustomerGroup();">
            <?= $button_add; ?>
        </a>
        <a class="btn btn-info" href="<?= $url_add_customer_group; ?>" target="_blank">
            <?= $button_customer_group; ?>
        </a>
      </th>
    </tr>
    </tfoot>
  </table>
</form>
<select id="select-customer-group" class="hidden">
  <option value="0"><?= $text_none; ?></option>
    <?php foreach ($customer_groups as $customer_group) { ?>
      <option value="<?= $customer_group['customer_group_id']; ?>"><?= $customer_group['name']; ?></option>
    <?php } ?>
</select>
<script type="text/javascript">
    var customer_group_row = <?= $customer_group_row; ?>;

    function addCustomerGroup() {
        var html = '<tr id="customer-group-row' + customer_group_row + '"><td><div class="row"><div class="col-sm-5 col-xs-12">';
        html += '<input type="text" name="" class="row-fias-name form-control"/>';
        html += '<input type="hidden" name="customer_groups[' + customer_group_row + '][fias_id]" class="row-fias-id"/>';
        html += '</div><div class="col-sm-5 col-xs-12">';
        html += '<select name="customer_groups[' + customer_group_row + '][customer_group_id]" class="form-control">';
        html += $('#select-customer-group').html();
        html += '</select>';
        html += '</div><div class="col-sm-2 col-xs-12">';
        html += '<a onclick="$(\'#customer-group-row' + customer_group_row + '\').remove();" class="btn btn-danger">';
        html += '<i class="fa fa-remove visible-xs"></i><span class="hidden-xs"><?= $button_remove; ?></span></a>';
        html += '</div></div></td></tr>';

        $('#customer_groups').find('tbody').append(html);
        customer_group_row++;
    }

    function saveCustomerGroups(callback) {
        var form = $('#tab-customer-group').find('form');
        form.find('.text-danger').remove();

        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.fias) {
                        $('#customer-group-row' + i).find('.row-fias-name').after('<p class="text-danger">' + json.errors.fias[i] + '</p>');
                    }
                    for (i in json.errors.customer_group) {
                        $('#customer-group-row' + i).find('select[name="customer_groups\[' + i + '\]\[customer_group_id\]"]')
                            .after('<p class="text-danger">' + json.errors.customer_group[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-customer-group"]').tab('show');
                }

                if (callback) {
                    callback.call(this, !json.errors);
                }
            }, 'json');
    }
</script>
