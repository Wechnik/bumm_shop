<div class="tab-pane" id="tab-nkf_autocategory">
    <ul class="nav nav-tabs" id="groups_autocategory">
        <?php $a=true; $max_group_id=0; foreach ($nkf_autocategory as $group_id => $group) { if ($group_id>$max_group_id) $max_group_id=$group_id; ?>
            <li class="<?php if ($a) echo ' active '; $a=false; ?>">
                <a id="a_group_<?php echo $group_id; ?>" href="#group_<?php echo $group_id; ?>" data-toggle="tab" aria-expanded="true">
                    Группа <?php echo ($group_id); ?>
                </a>
            </li>
        <?php } ?>
        <li><a href="#" class="add-group">+ Добавить</a></li>
    </ul>
    <div class="tab-content">
        <?php $nkf_autocategory_table_row = 0; ?>

        <?php $a=true; foreach ($nkf_autocategory as $group_id => $group) { ?>
        <div class="tab-pane <?php if ($a) echo ' active '; $a=false; ?>" id="group_<?php echo $group_id; ?>">
            <div class="pull-right" style="padding-bottom:10px;">
                <a href="#"  class="btn btn-primary" onclick="deleteGroup(<?php echo $group_id; ?>); return false;">Удалить группу</a>
            </div>
            <div class="table-responsive" style="width:100%;">
                <table id="nkf_autocategory_table_<?php echo $group_id; ?>" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <td class="text-left"><?php echo $entry_nkf_column_attribute_not; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_attribute; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_attribute_use_from_to; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_attribute_value; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_attribute_value_from; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_attribute_value_to; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_price_from; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_price_to; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_is_special; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_manufacturer; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_category; ?></td>
                        <td class="text-left"><?php echo $entry_nkf_column_in_name; ?></td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($nkf_autocategory[$group_id] as $na) { ?>
                        <tr id="nkf_autocategory_table_row<?php echo $nkf_autocategory_table_row; ?>">
                            <td class="text-left">
                                <select name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_not]" class="form-control">
                                    <?php if ($na['attribute_not']) { ?>
                                        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                        <option value="0"><?php echo $text_no; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_yes; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_name]" value="<?php echo $na['attribute_name']; ?>" class="form-control" />
                                <input type="hidden" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_id]" value="<?php echo $na['attribute_id']; ?>" />
                            </td>
                            <td class="text-left">
                                <select name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_use_from_to]" class="form-control">
                                    <?php if ($na['attribute_use_from_to']) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_value]" value="<?php echo $na['attribute_value']; ?>" class="form-control" />
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_value_from]" value="<?php echo $na['attribute_value_from']; ?>" class="form-control" />
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][attribute_value_to]" value="<?php echo $na['attribute_value_to']; ?>" class="form-control" />
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][price_from]" value="<?php echo $na['price_from']; ?>" class="form-control" />
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][price_to]" value="<?php echo $na['price_to']; ?>" class="form-control" />
                            </td>
                            <td class="text-left">
                                <select name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][is_special]" class="form-control">
                                    <?php if ($na['is_special']==1) { ?>
                                        <option value="0"><?php echo $text_no_matter; ?></option>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="2"><?php echo $text_disabled; ?></option>
                                    <?php } elseif ($na['is_special']==2) { ?>
                                        <option value="0"><?php echo $text_no_matter; ?></option>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="2" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option selected="selected" value="0"><?php echo $text_no_matter; ?></option>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="2"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][manufacturer_name]" value="<?php echo $na['manufacturer_name']; ?>" class="form-control" />
                                <input type="hidden" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][manufacturer_id]" value="<?php echo $na['manufacturer_id']; ?>" />
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][fcategory_name]" value="<?php echo $na['fcategory_name']; ?>" class="form-control" />
                                <input type="hidden" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][fcategory_id]" value="<?php echo $na['fcategory_id']; ?>" />
                            </td>
                            <td class="text-left">
                                <input type="text" name="nkf_autocategory[<?php echo $group_id; ?>][<?php echo $nkf_autocategory_table_row; ?>][in_name]" value="<?php echo $na['in_name']; ?>" class="form-control" />
                            </td>

                            <td class="text-left">
                                <button type="button" onclick="$('#nkf_autocategory_table_row<?php echo $nkf_autocategory_table_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                            </td>

                        </tr>
                        <?php $nkf_autocategory_table_row++; ?>
                    <?php } ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="11"></td>
                        <td class="text-left"><button type="button" onclick="addAutocategory(<?php echo $group_id; ?>);" data-toggle="tooltip" title="<?php echo $button_nkf_autocategory_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <?php } ?>
    </div>


<br/>

<a href="#" id="runrun" data-loading-text="работаем..." data-toggle="tooltip" title="<?php echo $button_nkf_run; ?>" class="btn btn-primary"><?php echo $button_nkf_run; ?></a>

<br/><br/><br/>
<a href="<?php echo $autocategory_settings; ?>"><?php echo $entry_autocategory_settings; ?></a>
<br/><br/><br/>
Группы настроек позволяют создать несколько независимых вариантов настроек.<br/>
Товары которые будут удовлетворять ВСЕМ настройкам в одной группе, попадут в эту категорию<br/>
Внутри группы можно указать одну или несколько строк  с настройками.<br/>
В каждой строке можно указать один из вариантов сочетаний.<br/>
Если у товара выполнятся все условия во всех строках, то он попадет в категорию.<br/>
В каждой строке можно заполнять или не заполнять какие-то столбцы<br/>
Если не нужно учитывать у цены минимальное или максимальное значение, то просто оставляем пусто.<br/>
Для дробных значений атрибутов используйте точку для разделения целой и дробной части как в настройках так и в самом атрибуте<br/>
Если вы используете несколько значений у одного атрибута, то их надо разделять символом, указанным в настройках модуля.<br/>
В текстовом значении атрибута можно указывать не целое значение, а частичное, при этом добавить знак процента вместо остального. Например напри%<br/>
Фильтр по наименованию ищет в любом месте названия товара<br/>
Столбец "не соответствует" позволяет поставить "да", тогда в категорию попадут товары, <strong>не подходящие</strong> под это условие<br/>

</div>
<script>
    var nkf_autocategory_table_row = <?php echo $nkf_autocategory_table_row; ?>;
    function addAutocategory(group_id) {
        html  = '<tr id="nkf_autocategory_table_row' + nkf_autocategory_table_row + '">';
        html += '  <td class="text-left">';
        html += '  <select name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_not]" class="form-control">';
        html += '  <option value="1"><?php echo $text_yes; ?></option>';
        html += '  <option value="0" selected="selected"><?php echo $text_no; ?></option>';
        html += '  </select>';
        html += '  </td>';

        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_name]" value="" class="form-control" />';
        html += '  <input type="hidden" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_id]" value="" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <select name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_use_from_to]" class="form-control">';
        html += '  <option value="1"><?php echo $text_enabled; ?></option>';
        html += '  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
        html += '  </select>';
        html += '  </td>';

        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value]" value="" class="form-control" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value_from]" value="" class="form-control" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value_to]" value="" class="form-control" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][price_from]" value="" class="form-control" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][price_to]" value="" class="form-control" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <select name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][is_special]" class="form-control">';
        html += '  <option value="0" selected="selected"><?php echo $text_no_matter; ?></option>';
        html += '  <option value="1"><?php echo $text_enabled; ?></option>';
        html += '  <option value="2"><?php echo $text_disabled; ?></option>';
        html += '  </select>';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][manufacturer_name]" value="" class="form-control" />';
        html += '  <input type="hidden" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][manufacturer_id]" value="" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][fcategory_name]" value="" class="form-control" />';
        html += '  <input type="hidden" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][fcategory_id]" value="" />';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <input type="text" name="nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][in_name]" value="" class="form-control" />';
        html += '  </td>';

        html += '  <td class="text-left"><button type="button" onclick="$(\'#nkf_autocategory_table_row' + nkf_autocategory_table_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#nkf_autocategory_table_'+group_id+' tbody').append(html);

        attributeautocomplete(group_id,nkf_autocategory_table_row);
        manufacturerautocomplete(group_id,nkf_autocategory_table_row);
        categoryautocomplete(group_id,nkf_autocategory_table_row);
        attribute_use_from_to(group_id,nkf_autocategory_table_row);

        nkf_autocategory_table_row++;
    }
    function attribute_use_from_to(group_id,nkf_autocategory_table_row) {
        $('select[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_use_from_to]\']').on('change', function() {
            if (this.value==1) {
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value]\']').hide();
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value_from]\']').show();
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value_to]\']').show();
            } else {
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value]\']').show();
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value_from]\']').hide();
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_value_to]\']').hide();
            }
        });
        $('select[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_use_from_to]\']').change();
    }
    function attributeautocomplete(group_id,nkf_autocategory_table_row) {
        $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_name]\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                category: item.attribute_group,
                                label: item.name,
                                value: item.attribute_id
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_name]\']').val(item['label']);
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][attribute_id]\']').val(item['value']);
            }
        });
    }
    function manufacturerautocomplete(group_id,nkf_autocategory_table_row) {
        $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][manufacturer_name]\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=extension/module/nkf_autocategory/manufacturer_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        json.unshift({
                            manufacturer_id: 0,
                            name: '<?php echo $text_none; ?>'
                        });

                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['manufacturer_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][manufacturer_name]\']').val(item['label']);
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][manufacturer_id]\']').val(item['value']);
            }
        });
    }
    function categoryautocomplete(group_id,nkf_autocategory_table_row) {
        $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][fcategory_name]\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        json.unshift({
                            category_id: 0,
                            name: '<?php echo $text_none; ?>'
                        });

                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['category_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][fcategory_name]\']').val(item['label']);
                $('input[name=\'nkf_autocategory['+group_id+'][' + nkf_autocategory_table_row + '][fcategory_id]\']').val(item['value']);
            }
        });
    }

    <?php foreach ($nkf_autocategory as $group_id => $group) { ?>
    $('#nkf_autocategory_table_<?php echo $group_id; ?> tbody tr').each(function(index, element) {
        attributeautocomplete(<?php echo $group_id; ?>,index);
        manufacturerautocomplete(<?php echo $group_id; ?>,index);
        categoryautocomplete(<?php echo $group_id; ?>,index);
        attribute_use_from_to(<?php echo $group_id; ?>,index);
    });
    <?php } ?>

    var max_group_id=<?php echo $max_group_id; ?>;

    $('.add-group').click(function (e) {
        max_group_id=max_group_id+1;
        e.preventDefault();
        var tabId = 'group_' + max_group_id;
        $(this).closest('li').before('<li><a id="a_group_' + max_group_id + '" href="#group_' + max_group_id + '" data-toggle="tab" aria-expanded="true">Группа '+ (max_group_id) +'</a></li>');

        html='';
        html+='<div class="pull-right" style="padding-bottom:10px;">';
        html+='<a href="#"  class="btn btn-primary" onclick="deleteGroup('+max_group_id+'); return false;">Удалить группу</a>';
        html+='</div>';

        html+='<div class="table-responsive" style="width:100%;">';
        html+='<table id="nkf_autocategory_table_'+max_group_id+'" class="table table-striped table-bordered table-hover">';
        html+='<thead>';
        html+='<tr>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_attribute_not; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_attribute; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_attribute_use_from_to; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_attribute_value; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_attribute_value_from; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_attribute_value_to; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_price_from; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_price_to; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_is_special; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_manufacturer; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_category; ?></td>';
        html+='<td class="text-left"><?php echo $entry_nkf_column_in_name; ?></td>';
        html+='<td></td>';
        html+='</tr>';
        html+='</thead>';
        html+='<tbody>';
        html+='<tfoot>';
        html+='<tr>';
        html+='<td colspan="11"></td>';
        html+='<td class="text-left"><button type="button" onclick="addAutocategory('+max_group_id+');" data-toggle="tooltip" title="<?php echo $button_nkf_autocategory_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
        html+='</tr>';
        html+='</tfoot>';
        html+='</table>';
        html+='<a href="<?php echo $autocategory_settings; ?>"><?php echo $entry_autocategory_settings; ?></a>';
        html+='</div>';

        $('#tab-nkf_autocategory .tab-content').append('<div class="tab-pane" id="' + tabId + '">'+html+'</div>');

        // add this
        $('#groups_autocategory #a_group_' + max_group_id + '').click();
    });

    $("#tab-nkf_autocategory .nav-tabs").on("click", "a", function (e) {
        e.preventDefault();
        if (!$(this).hasClass('add-group')) {
            $(this).tab('show');
        }
    });

    function removeTab(tabId) {
        $('#a_group_'+tabId).remove();
        $('#group_'+tabId).remove();
        $('#tab-nkf_autocategory a:first').tab('show');
    }

    function deleteGroup(group_id) {
        removeTab(group_id);
    }

    $("#runrun").on("click",function (e) {
        e.preventDefault();
        $.ajax({
            url: 'index.php?route=extension/module/nkf_autocategory/run_ajax&token=<?php echo $token; ?>&category_id=<?php echo $nkf_category_id; ?>',
            dataType: 'json',
            type: 'POST',
            data: $("#form-category").serialize(),
            success: function(json) {
                $('#runrun').button('reset');
                alert(json['result']);
            },
            beforeSend: function() {
                $('#runrun').button('loading');
            },
            complete: function() {
                $('#runrun').button('reset');
            }
        });
    });

</script>
