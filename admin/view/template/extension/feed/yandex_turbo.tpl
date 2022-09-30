<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
	<div class="container-fluid">
	  <div class="pull-right">
		<button type="submit" form="form-yandex-turbo" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
	  </div>
	  <div class="panel-body">
		<!--div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo @$text_alert; ?> <button type="button" class="close" data-dismiss="alert">×</button></div-->

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-yandex-turbo" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="yandex_turbo_status" id="input-status" class="form-control">
	            <?php if ($yandex_turbo_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-data-feed">Всего товаров:</label>
            <div class="col-sm-10"><?php echo $totalProducts; ?></div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-data-feed">URL добавления товара в корзину:</label>
            <div class="col-sm-10"><input class="form-control" style="width:100%;" value="<?php echo "$addtocart_url"; ?>" readonly/></div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-data-feed"><?php echo $entry_data_feed_yml; ?></label>
            <div class="col-sm-10">
              <?php echo $base_feed_url; ?> <i class="fa fas fa-arrow-right"></i> <?php echo $base_xml_url.'.xml'; ?>

              <?php if ($totalPages > 1): ?>
                <?php for ($i = 2; $i <= $totalPages; $i++): ?>
                  <br/><br/><?php echo "$base_feed_url&page=$i"; ?> <i class="fa fas fa-arrow-right"></i> <?php echo $base_xml_url.$i.'.xml'; ?>
                <?php endfor ?>
              <?php endif ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_categories ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($categories as $item): ?>
	                <div class="checkbox">
	                <label>
		                <input type="checkbox" name="categories[<?php echo $item['category_id']; ?>]"<?php if (isset($selected[ $item['category_id'] ])): ?> checked<?php endif; ?>> <?php echo $item['name']?><br/>
	                </label>
	                </div>
                <?php endforeach ?>
                </div>
                <div style="margin-top: 10px;">
                <a href="#" onclick="$(this).closest('.form-group').find('input[type=checkbox]').prop('checked', true); return false;">Выбрать все</a> / <a href="#" onclick="$(this).closest('.form-group').find('input[type=checkbox]').prop('checked', false); return false;">Убрать все</a>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_vendor">Производитель*:<br/><small>Один производитель для всех товаров, елси не указано то производители берутся из карточек товаров</small></label>
            <div class="col-sm-10">
              <input type="text" name="yandex_turbo_vendor" value="<?php echo $yandex_turbo_vendor; ?>" id="yandex_turbo_vendor" class="form-control">
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_qty0">Выгружать товары кол-во которых равно нулю:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_qty0" id="yandex_turbo_qty0" class="form-control"<?php echo $yandex_turbo_qty0 ? ' checked' : '' ?>>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_attributes">Выгружать аттрибуты:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_attributes" id="yandex_turbo_attributes" class="form-control"<?php echo $yandex_turbo_attributes ? ' checked' : '' ?>>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_typePrefix">Показывать категорию в заголовке товара на турбо-странице:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_typePrefix" id="yandex_turbo_typePrefix" class="form-control"<?php echo $yandex_turbo_typePrefix ? ' checked' : ''; ?>
              onclick="$(this).prop('checked') ? $('#typePrefix').show() : $('#typePrefix').hide();"
              >
              Пример: <b>
                <span id="typePrefix"<?php if (!$yandex_turbo_typePrefix): ?> style="display:none;"<?php endif ?>><?php echo $product['typePrefix']; ?></span>
                <span id="vendor"><?php echo $product['vendor']; ?></span>
                <span id="model"><?php echo $product['model']; ?></span>
              </b>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_delivery">Курьерская доставка:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_delivery" id="yandex_turbo_delivery" class="form-control"<?php echo $yandex_turbo_delivery ? ' checked' : '' ?>>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_pickup">Самовывоз:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_pickup" id="yandex_turbo_pickup" class="form-control"<?php echo $yandex_turbo_pickup ? ' checked' : '' ?>>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_manufacturer_warranty">Официальная гарантия производителя*:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_manufacturer_warranty" id="yandex_turbo_manufacturer_warranty" class="form-control"<?php echo $yandex_turbo_manufacturer_warranty ? ' checked' : '' ?>>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_adult">Товары имеют отношение к удовлетворению сексуальных потребностей, либо иным образом эксплуатирует интерес к сексу*:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_adult" id="yandex_turbo_adult" class="form-control"<?php echo $yandex_turbo_adult ? ' checked' : '' ?>>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_striptags">Удалять теги из описаний товаров*:</label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_striptags" id="yandex_turbo_striptags" class="form-control"<?php echo $yandex_turbo_striptags ? ' checked' : '' ?>>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="yandex_turbo_echo">Выводить результат на экран*:<br><small>Вывод большого YML файла в браузер может занять длительное время и большой обьём памяти</small></label>
            <div class="col-sm-10">
              <input type="checkbox" name="yandex_turbo_echo" id="yandex_turbo_echo" class="form-control"<?php echo $yandex_turbo_echo ? ' checked' : '' ?>>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-12">
              *Необязательные параметры
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-12" style="text-align: center;">
              По всем вопросам и доработкам функционала модуля обращаться по:<br/>
              E-Mail: <a href="mailto:devel@allmp3.us?Subject=ЯндексТурбо%20ocStore2.3%20тех.поддержка">devel@allmp3.us</a><br/>
              Skype: <a href="skype:dziroo">dziroo</a><br/>
              Telegram: <a href="http://t.me/Dzirosh">Dzirosh</a><br/><br/>
              Copyright &copy; <a href="mailto:devel@allmp3.us?Subject=ЯндексТурбо%20ocStore2.3%20тех.поддержка">Parfenov Artem</a>, 2019
            </div>
          </div>

		</form>

	  </div>
	</div>
  </div>
</div>

<?php echo $footer; ?>