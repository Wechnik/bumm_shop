<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-prepayment-detailed" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
            <h3 class="panel-title"><i class="fa fa-pencil"></i> Редактирование модуля</h3>
        </div>

        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-prepayment-detailed" class="form-horizontal">

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="prepayment-detailed-status"><?php echo $entry_status; ?></label>
                    <div class="col-sm-10">
                        <select name="prepayment_detailed_status" id="prepayment-detailed-status" class="form-control">
                            <?php if ($prepayment_detailed_status) { ?>
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
                    <label class="col-sm-2 control-label" for="prepayment-detailed-sort-order"><?php echo $entry_sort_order; ?></label>
                    <div class="col-sm-3">
                        <input type="text" name="prepayment_detailed_sort_order" value="<?php echo $prepayment_detailed_sort_order; ?>" id="prepayment-detailed-sort-order" class="form-control" />
                    </div>
                    <div class="col-sm-7">
                        <?php echo $text_hint; ?>
                    </div>
                </div>

                <p><?php echo $text_module_help; ?> </p>
                <div class="panel-heading">
                    <p class="panel-title text-center"> <?php echo $entry_condition; ?></p>
                </div>


                <div class="table-responsive form-group">
                    <table id="prepayment_detailed_table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="3"><span data-toggle="tooltip" title="Модуль Предоплата будет включен при выполнении указанных ниже условий заказа">Включить предоплату при выполнении следующих условий</span></td>
                            <td class="text-center" rowspan="2"><span data-toggle="tooltip" title="Укажите, как должна вычисляться сумма предоплаты. ">Вычислять сумму предоплаты как</span></td>
                            <td class="text-center" rowspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-center"><span data-toggle="tooltip" title="Включить модуль предоплаты, когда выбран один из отмеченных ниже способов доставки.">Выбран способ доставки</span> </td>
                            <td class="text-center"><span data-toggle="tooltip" title="Включить модуль предоплаты, когда выбран один из отмеченных ниже способов оплаты. Должен быть отмечен хотя бы один способ оплаты.">Выбран способ оплаты</span> </td>
                            <td class="text-center"><span data-toggle="tooltip" title="Если Вы хотите включать предоплату только для определенной суммы заказа, укажите диапазон. Эти поля не являются обязательными.">Суммарная стоимость товаров</span> </td>
                        </tr>
                        </thead>
                        <tfoot>

                        <tbody>
                        <?php $filter_row = 0; ?>
                        <?php foreach ($filters as $filter) { ?>
                            <tr class="filter-row<?php echo $filter_row; ?>">
                                <td>
                                    <?php
                                    $shipping_codes = array();
                                    foreach ($shippings as $shipping) {
                                        if (!isset($filter["shipping_method"][$shipping['fname']])) {
                                            $filter["shipping_method"][$shipping['fname']] = "";
                                        }
                                        $shipping_codes[] = $shipping['fname'];
                                        ?>
                                        <input type="checkbox"
                                               name="prepayment_detailed_filter[<?php echo $filter_row; ?>][shipping_method][<?php echo $shipping['fname']; ?>]"
                                               id="prepayment_filter_shipping_method_<?php echo $shipping['fname'] . "_" . $filter_row; ?>"
                                            <?php echo $filter["shipping_method"][$shipping['fname']]; ?> value="checked" />
                                        <label for="prepayment_filter_shipping_method_<?php echo $shipping['fname'] . "_" . $filter_row; ?>"
                                               name="shipping_method_label_<?php echo $filter_row; ?>"><?php echo $shipping['hname']; ?></label><br />
                                    <?php } ?>
                                </td>
                                <td>
                                    <?php
                                    $payment_method_codes = array();
                                    foreach ($payment_methods as $payment_method) {
                                        if (!isset($filter["payment_method"][$payment_method['fname']])) {
                                            $filter["payment_method"][$payment_method['fname']] = "";
                                        }
                                        $payment_method_codes[] = $payment_method['fname'];
                                        ?>
                                        <input type="checkbox"
                                               name="prepayment_detailed_filter[<?php echo $filter_row; ?>][payment_method][<?php echo $payment_method['fname']; ?>]" id="prepayment_filter_payment_method_<?php echo $payment_method['fname'] . "_" . $filter_row; ?>" <?php echo $filter["payment_method"][$payment_method['fname']]; ?> value="checked" onclick="resetValidationForLabels('payment_method_label_<?php echo $filter_row; ?>', 'prepayment_payment_method_validation_tip_<?php echo $filter_row; ?>')"/> <label for="prepayment_filter_payment_method_<?php echo $payment_method['fname'] . "_" . $filter_row; ?>" name="payment_method_label_<?php echo $filter_row; ?>"><?php echo $payment_method['hname']; ?></label><br />
                                    <?php } ?>
                                    <span style="color:red; font-weight: bold; display:none;" id="prepayment_payment_method_validation_tip_<?php echo $filter_row ?>"><?php echo $entry_payment_method_validation_tip; ?></span>
                                </td>
                                <td>
                                    <?php echo $entry_from; ?> <input size="6" name="prepayment_detailed_filter[<?php echo $filter_row; ?>][price_from]" value="<?php echo $filter['price_from']; ?>" type="text" onkeyup="processNumericInput(this, 0, 999999);" /> <br />
                                    <?php echo $entry_to; ?> <input size="6" name="prepayment_detailed_filter[<?php echo $filter_row; ?>][price_to]" value="<?php echo $filter['price_to']; ?>" type="text" onkeyup="processNumericInput(this, 0, 999999);" />
                                </td>
                                <td>
                                    <?php
                                    $prepayment_amount_fixed_selection = "";
                                    $prepayment_amount_percent_selection = "";

                                    switch ($filter["amount_percent_fixed_option"]) {
                                        case "fixed": $prepayment_amount_fixed_selection = "checked"; break;
                                        case "percent": $prepayment_amount_percent_selection = "checked"; break;
                                    }
                                    ?>
                                    <input name="prepayment_detailed_filter[<?php echo $filter_row; ?>][amount_percent_fixed_option]" id="prepayment_detailed_amount_fixed_option_<?php echo $filter_row?>" value="fixed" type="radio" <?php echo $prepayment_amount_fixed_selection ?> onclick="resetValidationForValues(<?php echo $filter_row ?>);"/> <label for="prepayment_detailed_amount_fixed_option_<?php echo $filter_row?>"><?php echo $entry_prepayment_amount_fixed_selection; ?></label>: <input size="4" name="prepayment_detailed_filter[<?php echo $filter_row; ?>][amount_fixed]" id="prepayment_detailed_amount_fixed_value_<?php echo $filter_row; ?>" value="<?php echo $filter["amount_fixed"]; ?>" type="text" onkeyup="processNumericInput(this, 0, 999999);" /><br />
                                    <input name="prepayment_detailed_filter[<?php echo $filter_row; ?>][amount_percent_fixed_option]" id="prepayment_detailed_amount_percent_option_<?php echo $filter_row?>" value="percent" type="radio" <?php echo $prepayment_amount_percent_selection ?> onclick="resetValidationForValues(<?php echo $filter_row ?>);"><label for="prepayment_detailed_amount_percent_option_<?php echo $filter_row?>"><?php echo $entry_prepayment_percent_part; ?></label> <br />

                                    <div style="padding-left:20px;">
                                        <?php
                                        for ($iTotal = 0; $iTotal < count($totals); $iTotal++) {
                                            $total = $totals[$iTotal];
                                            if (!array_key_exists("amount_percent_" . $total["code"], $filter)) {
                                                $filter["amount_percent_" . $total["code"]] = 0;
                                            }
                                            echo '<input size="4" name="prepayment_detailed_filter[' . $filter_row .'][amount_percent_' . $total["code"] . ']" id="prepayment_detailed_amount_percent_' . $total["code"] . '_value_' . $filter_row . '" value="' . $filter["amount_percent_" . $total["code"]] . '" type="text" onkeyup="processNumericInput(this, 0, 9999);" />% ' . $entry_from . ' ' . $total["name"] . '<br />';
                                            if ($iTotal != count($totals) - 1) {
                                                echo "<span>+</span> <br />";
                                            }
                                        }
                                        ?>
                                    </div>
                                </td>
                                <td class="text-center" rowspan="2">
                                    <button type="button" onclick="removeFilter('.filter-row<?php echo $filter_row; ?>');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">
                                        <i class="fa fa-minus-circle"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr class="filter-row<?php echo $filter_row; ?>">
                                <td>
                                    <?php echo $entry_prepayment_comment; ?>
                                </td>
                                <td colspan="3" style="padding: 5px;">
                                    <textarea name="prepayment_detailed_filter[<?php echo $filter_row; ?>][comment]" style="width: 100%" rows="5" ><?php echo $filter['comment']; ?></textarea>
                                </td>
                            </tr>
                            <?php $filter_row++; ?>
                        <?php } ?>
                        </tbody>

                        <tfoot>
                        <tr>
                            <td colspan="5" class="text-center">
                                <button type="button" onclick="addFilter();" data-toggle="tooltip" title="<?php echo $button_add_filter; ?>" class="btn btn-primary">
                                    <i class="fa fa-plus-circle"></i>
                                </button>
                                <button onclick="saveSettings();" type="submit" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </form>

        </div>



    </div>
  </div>
</div>
<script type="text/javascript"><!--
var filter_rows_count = <?php echo $filter_row; ?>;
var shipping_codes = new Array(<?php if (!empty($shipping_codes)) echo "\"" . implode("\",\"", $shipping_codes) . "\""; ?>);
var payment_codes = new Array(<?php if (!empty($payment_method_codes)) echo "\"" . implode("\",\"", $payment_method_codes) . "\""; ?>);

    function addFilter() {

        html = '';

        html += '<tr class="filter-row' + filter_rows_count + '">';

        html += '<td>';
        html += '<?php foreach ($shippings as $shipping) { ?>';
        html += '<input type="checkbox" name="prepayment_detailed_filter[' + filter_rows_count + '][shipping_method][<?php echo $shipping['fname']; ?>]"';
        html += 'id="prepayment_filter_shipping_method_<?php echo $shipping['fname']; ?>_' + filter_rows_count + '" value="checked" />';
        html += '<label for="prepayment_filter_shipping_method_<?php echo $shipping['fname'] ?>_' + filter_rows_count + '"';
        html += 'name="shipping_method_label_' + filter_rows_count + '"><?php echo $shipping['hname']; ?></label><br />';
        html += '<?php } ?>';
        html += '</td>';


        html += '<td>';
        html += '<?php foreach ($payment_methods as $payment_method) { ?>';
        html += '<input type="checkbox"  name="prepayment_detailed_filter[' + filter_rows_count + '][payment_method][<?php echo $payment_method['fname']; ?>]" ';
        html += 'id="prepayment_filter_payment_method_<?php echo $payment_method['fname']; ?>_' + filter_rows_count + '" value="checked"';
        html += 'onclick="resetValidationForLabels(\'payment_method_label_' + filter_rows_count + '\', \'prepayment_payment_method_validation_tip_' + filter_rows_count + '\')"/> ';
        html += '<label for="prepayment_filter_payment_method_<?php echo $payment_method['fname']; ?>_' + filter_rows_count + '" name="payment_method_label_' + filter_rows_count + '">';
        html += '<?php echo $payment_method['hname']; ?>';
        html += '</label><br />';
        html += '<?php } ?>';


        html += '<td>';
        html += '<?php echo $entry_from; ?><input size="6" name="prepayment_detailed_filter[' + filter_rows_count + '][price_from]" value="" type="text" onkeyup="processNumericInput(this, 0, 999999);" /> <br />';
        html += '<?php echo $entry_to; ?><input size="6" name="prepayment_detailed_filter[' + filter_rows_count + '][price_to]" value="" type="text" onkeyup="processNumericInput(this, 0, 999999);" />';
        html += '</td>';


        html += '<td>';
        html += '<input name="prepayment_detailed_filter[' + filter_rows_count + '][amount_percent_fixed_option]" id="prepayment_detailed_amount_fixed_option_' + filter_rows_count + '" value="fixed" type="radio" checked onclick="resetValidationForValues(' + filter_rows_count + ');"/>';
        html += '<label for="prepayment_detailed_amount_fixed_option_' + filter_rows_count + '"><?php echo $entry_prepayment_amount_fixed_selection; ?></label>: ';
        html += '<input size="4" id="prepayment_detailed_amount_fixed_value_' + filter_rows_count + '" name="prepayment_detailed_filter[' + filter_rows_count + '][amount_fixed]" value="10" type="text" onkeyup="processNumericInput(this, 0, 999999);" /><br />';
        html += '<input name="prepayment_detailed_filter[' + filter_rows_count + '][amount_percent_fixed_option]" id="prepayment_detailed_amount_percent_option_' + filter_rows_count + '" value="percent" type="radio" onclick="resetValidationForValues(' + filter_rows_count + ')";><label for="prepayment_detailed_amount_percent_option_' + filter_rows_count + '"><?php echo $entry_prepayment_percent_part; ?></label><br />';

        html += '<div style="padding-left:20px;">';
        <?php for ($iTotal = 0; $iTotal < count($totals); $iTotal++) {
            $total = $totals[$iTotal];
            echo 'html += \'<input size="4" name="prepayment_detailed_filter[\' + filter_rows_count + \'][amount_percent_' . $total["code"] . ']" id="prepayment_detailed_amount_percent_' . $total["code"] . '_value_\' + filter_rows_count + \'" value="0" type="text" onkeyup="processNumericInput(this, 0, 9999);" />% ' . $entry_from . ' ' . $total["name"] . '<br />\';';
            if ($iTotal != count($totals) - 1) {
                echo "html += '<span>+</span> <br />';";
            }
        }
        ?>
        html += '</div>';
        html += '</td>';

        html += '<td class="text-center" rowspan="2">';
        html += '<button type="button" onclick="removeFilter(\'.filter-row' + filter_rows_count + '\')" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">';
        html += '<i class="fa fa-minus-circle"></i>';
        html += '</button>';
        html += '</td>';

        html += '</tr>';

        html += '<tr class="filter-row' + filter_rows_count + '">';
        html += '<td>';
        html += '<?php echo $entry_prepayment_comment; ?>';
        html += '</td>';
        html += '<td colspan="3" style="padding: 5px;">';
        html += '<textarea name="prepayment_detailed_filter[' + filter_rows_count + '][comment]" style="width: 100%" rows="5" ></textarea>';
        html += '</td>';
        html += '</tr>';


	$('#prepayment_detailed_table tbody tr:last-child').after(html);

	filter_rows_count++;

    }


function removeFilter(filterRowElement) {
	if (confirm('<?php echo $entry_confirm_remove_filter; ?>')) {
		$(filterRowElement).remove(); 	
	}
}

function saveSettings() {
	
	var success = true;
	
	// validate required fields
	for (var i = 0; i < filter_rows_count; i++) {
		if ($('#prepayment_detailed_amount_fixed_value_' + i).length == 0) {
			continue;
		}
		var amountFixedValue = $('#prepayment_detailed_amount_fixed_value_' + i).val();
		
		if ($('#prepayment_detailed_amount_fixed_option_' + i).attr('checked') == 'checked'
				&& (isNaN(parseFloat(amountFixedValue)) || !isFinite(amountFixedValue))) {
			success = false;
			$('#prepayment_detailed_amount_fixed_value_' + i).css("border-color", "red");
		}
		
		var paymentChecked = false;
		
		// check if at least one of payment methods is checked
		for (var payment_code_index = 0; payment_code_index < payment_codes.length; payment_code_index++) {
			var id = '#prepayment_filter_payment_method_' + payment_codes[payment_code_index] + "_" + i;
			if ($(id).attr('checked') == 'checked') {				
				paymentChecked = true;
				$('#prepayment_payment_method_validation_tip_' + i).css("display", "none");
				break;
			}
		}
		
		if (!paymentChecked) {
			$('label[name="payment_method_label_' + i + '"]').css("color", "red");
			$('#prepayment_payment_method_validation_tip_' + i).css("display", "inline");
			success = false;
		}
	}
	
	if (success) {
		$('#form-prepayment-detailed').submit();
	}
}

function resetValidationForValues(filter_num) {
	$('#prepayment_detailed_amount_fixed_value_' + filter_num).css("border-color", "");
	$('#prepayment_detailed_amount_percent_shipping_value_' + filter_num).css("border-color", "");
	$('#prepayment_detailed_amount_percent_total_price_value_' + filter_num).css("border-color", "");
}

function resetValidationForLabels(labelName, validationTipId) {
	$('label[name="' + labelName+ '"]').css("color", "");
	$('#' + validationTipId).css("display", "none");
}
//--></script>


<script type="text/javascript">
    function processNumericInput(textField, minValue, maxValue) {

        textField.style.borderColor = "";

        if (/\D/g.test(textField.value)) {
            textField.value = textField.value.replace(/\D/g,'');
        }

        var value = textField.value;
        // check whether value is numeric
        if (!isNaN(parseFloat(value)) && isFinite(value)) {

            if (minValue >= value) {
                textField.value = minValue;
            }

            if (maxValue <= value) {
                textField.value = maxValue;
            }
        }

        return true;
    }
</script>


<!-- Prepayment body End -->
<!-- Footer Start -->
<?php echo $footer; ?>
<!-- Footer End -->