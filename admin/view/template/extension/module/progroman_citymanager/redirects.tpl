<div class="prmn-cmngr-settings__block">
  <div class="for-general-form">
    <div class="form-group">
      <label class="control-label">
        <input name="setting[enable_switch_redirects]" value="1" type="checkbox"
        <?= !empty($settings['enable_switch_redirects']) ? ' checked="checked"' : ''; ?>">
        <?= $entry_enabled_redirects; ?>
      </label>
    </div>

    <div class="form-group">
      <label class="control-label">
        <input name="setting[disable_autoredirect]" value="1" type="checkbox"
          <?= !empty($settings['disable_autoredirect']) ? ' checked="checked"' : ''; ?>">
          <?= $entry_disable_autoredirect; ?>
      </label>
    </div>

    <div class="form-group">
      <label class="control-label">
        <input name="setting[bind_subdomain]" value="1" type="checkbox"
          <?= !empty($settings['bind_subdomain']) ? ' checked="checked"' : ''; ?>">
          <?= $entry_bind_subdomain; ?>
      </label>
    </div>

    <div class="form-group">
      <label class="control-label">
        <input name="setting[fias_in_qs]" value="1" type="checkbox"
          <?= !empty($settings['fias_in_qs']) ? ' checked="checked"' : ''; ?>">
          <?= $entry_fias_in_qs; ?>
      </label>
    </div>

    <div class="form-group form-inline">
      <label class="control-label"><?= $entry_domain; ?></label>
      <input type="text" name="setting[main_domain]" class="form-control"
             value="<?= !empty($settings['main_domain']) ? $settings['main_domain'] : '' ?>"/>
    </div>
  </div>
</div>

<h4><?= $tab_redirects ?></h4>
<form action="<?= $action_redirects; ?>" class="main-form" data-submit="saveRedirects">
  <table id="redirects" class="table table-striped table-bordered">
    <thead>
    <tr>
      <td>
        <div class="row">
          <div class="col-sm-4 col-xs-12">
              <?= $entry_zone; ?>
          </div>
          <div class="col-sm-5 col-xs-12">
              <?= $entry_subdomain; ?>
          </div>
        </div>
      </td>
    </tr>
    </thead>
    <tbody>
    <?php $redirect_row = 0; ?>
    <?php foreach ($redirects as $redirect) { ?>
      <tr id="redirect-row<?= $redirect_row; ?>">
        <td>
          <div class="row">
            <div class="col-sm-4 col-xs-12">
              <input type="text" name="" value="<?= $redirect['fias_name']; ?>" class="row-fias-name form-control"/>
              <input type="hidden" name="redirects[<?= $redirect_row; ?>][fias_id]"
                     value="<?= $redirect['fias_id']; ?>" class="row-fias-id"/>
              <input type="hidden" name="redirects[<?= $redirect_row; ?>][id]"
                     value="<?= $redirect['id']; ?>"/>
            </div>
            <div class="col-sm-5 col-xs-12">
              <input type="text" name="redirects[<?= $redirect_row; ?>][url]" class="form-control"
                     value="<?= $redirect['url']; ?>" placeholder="http://site.com"/>
            </div>
            <div class="col-sm-2 col-xs-12">
              <a class="btn btn-danger" onclick="$('#redirect-row<?= $redirect_row; ?>').remove();">
                <i class="fa fa-remove visible-xs"></i>
                <span class="hidden-xs"><?= $button_remove; ?></span>
              </a>
            </div>
          </div>
        </td>
      </tr>
        <?php $redirect_row++; ?>
    <?php } ?>
    </tbody>
    <tfoot>
    <tr>
      <th>
        <a class="btn btn-success" onclick="addRedirect();">
            <?= $button_add; ?>
        </a>
      </th>
    </tr>
    </tfoot>
  </table>
</form>
<script type="text/javascript">
    var redirect_row = <?= $redirect_row; ?>;

    function addRedirect() {
        var html = '<tr id="redirect-row' + redirect_row + '"><td><div class="row">';
        html += '<div class="col-sm-4 col-xs-12">';
        html += '<input type="text" name="" class="row-fias-name form-control"/>';
        html += '<input type="hidden" name="redirects[' + redirect_row + '][fias_id]" class="row-fias-id"/>';
        html += '<input type="hidden" name="redirects[' + redirect_row + '][id]" value=""/>';
        html += '</div><div class="col-sm-5 col-xs-12">';
        html += '<input type="text" name="redirects[' + redirect_row + '][url]" value="" class="form-control" placeholder="http://site.com"/>';
        html += '</div><div class="col-sm-2 col-xs-12">';
        html += '<a class="btn btn-danger" onclick="$(\'#redirect-row' + redirect_row + '\').remove();">';
        html += '<i class="fa fa-remove visible-xs"></i><span class="hidden-xs"><?= $button_remove; ?></span></a>';
        html += '</div></div></td></tr>';

        $('#redirects').find('tbody').append(html);

        redirect_row++;
    }

    function saveRedirects(callback) {
        var form = $('#tab-redirects').find('form');
        form.find('.text-danger').remove();
        $.post(form.attr('action'), form.serialize(),
            function(json) {
                if (json.errors) {
                    for (i in json.errors.fias) {
                        $('#redirect-row' + i).find('.row-fias-name').after('<p class="text-danger">' + json.errors.fias[i] + '</p>');
                    }
                    for (i in json.errors.subdomain) {
                        $('#redirect-row' + i).find('input[name="redirects\[' + i + '\]\[url\]"]')
                            .after('<p class="text-danger">' + json.errors.subdomain[i] + '</p>');
                    }
                    $('#tabs').find('a[href="#tab-redirects"]').tab('show');
                }

                if (callback) {
                    callback.call(this, !json.errors);
                }
            }, 'json');
    }
</script>