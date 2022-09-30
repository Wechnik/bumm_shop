<?php if($products) { ?>
<div id="hpmodel" class="form-group">
  <?php if($name_as_title){ ?>
  <div class="hpm-name"><?php echo $title_name; ?> <span class="after_title"></span></div>
  <?php } ?>
  <?php if ($variant == 'type_images') { ?>
  <div class="hpmodel_type_images text-center">
    <?php foreach($products as $product) { ?>
    <div class="hpm-item hpm-item-<?php echo $product['product_id']; ?> <?php if ($product['product_id'] == $selected_product_id) { ?>active<?php } ?> text-center pull-left thumbnail hidden-of-next<?php echo $product['product_id']; ?> <?php if ($product['quantity'] > 0) { ?>stock-on<?php } else { ?>stock-off<?php } ?>" data-hash="<?php echo $product['product_id']; ?>" data-title="<?php echo $product['after_title']; ?>" data-id="<?php echo $product['product_id']; ?>">
      <?php foreach ($product['view'] as $column => $value) { ?>
      <div class="hpm-v-<?php echo $column; ?>"><?php echo $value; ?></div>
      <div class="clearfix top10"></div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($variant == 'type_select') { ?>
  <div class="hpmodel-type-select text-left">
    <select name="hpm_product_id" class="form-control">
      <?php foreach($products as $product) { ?>
      <option class="hpm-item hpm-item-<?php echo $product['product_id']; ?> <?php if ($product['product_id'] == $selected_product_id) { ?>active<?php } ?>" data-hash="<?php echo $product['product_id']; ?>" data-title="<?php echo $product['after_title']; ?>" <?php if ($product['product_id'] == $selected_product_id) { ?>selected="selected"<?php } ?> value="<?php echo $product['product_id']; ?>"><?php echo $product['view_text']; ?></option>
      <?php } ?>
    </select>
  </div>
  <?php } ?>
  <?php if ($variant == 'type_html_select') { ?>
  <div class="hpm-type-html-select">
    <div class="hpm-select">
      <div class="selected">
      <?php $has_product = false; ?>
      <?php foreach ($products as $product) { ?>
      <?php if ($product['product_id'] == $product_id) { ?>
      <?php $has_product = true; ?>
      <div class="hpm-select-item hpm-cat-item">
        <?php foreach ($product['view'] as $column => $value) { ?>
        <div class="hpm-col-<?php echo $column; ?>"><?php echo $value; ?></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if (!$has_product) { ?>
      <div class="hpm-select-item hpm-cat-item">
        <div class="hpm-col-none"><?php echo $text_select; ?></div>
      </div>
      <?php } ?>
      </div>
      <div class="drop-down" style="display:none;">
        <?php foreach($products as $product) { ?>
        <div class="hpm-select-item hpm-item hpm-item-<?php echo $product['product_id']; ?> <?php if ($product['product_id'] == $selected_product_id) { ?>active<?php } ?> <?php if ($product['quantity'] > 0) { ?>stock-on<?php } else { ?>stock-off<?php } ?>" data-hash="<?php echo $product['product_id']; ?>" data-id="<?php echo $product['product_id']; ?>" data-title="<?php echo $product['after_title']; ?>">
          <?php foreach ($product['view'] as $column => $value) { ?>
          <div class="hpm-col-<?php echo $column; ?>"><?php echo $value; ?></div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
  <?php } ?>
  
  <div style="clear:both;"></div>
</div>
<?php echo $config; ?>
<script>
var hpm_products = {
<?php foreach ($products as $product) { ?>
<?php echo $product['product_id']; ?>: {href:'<?php echo $product['href']; ?>',real:'<?php echo $product['href_real']; ?>'},
<?php } ?>
}
function hpm_set_hash(h){try{history.replaceState(null,null,(location.href).split('#')[0]+'#'+h);return;}catch(e){}location.hash = h;}
<?php if (empty($redirect)) { ?>
function hpm_set_url(u){try{history.replaceState(null,null,u);}catch(e){}}
<?php } ?>
function hashchange() {
    var sf = false;
    <?php if ($hash) { ?>
    var hash = location.hash.replace('#','');
    if (hash) {
        hash = hash.split('-')[0];
        var elem = $('[data-hash="'+hash+'"]').closest('.hpm-item');
        if (elem.length) {
            elem.trigger('click');
            sf = true;
        }
    } else {
        if ($('#hpmodel .hpm-item-<?php echo $selected_product_id; ?>').length) {
            $('#hpmodel .hpm-item-<?php echo $selected_product_id; ?>').trigger('click');
            sf = true;            
        }
    }
    <?php } else { ?>
        if ($('#hpmodel .hpm-item-<?php echo $selected_product_id; ?>').length) {
            $('#hpmodel .hpm-item-<?php echo $selected_product_id; ?>').trigger('click');
            sf = true;            
        }
    <?php } ?>
    <?php /*
    if (!sf) {
        $('#hpmodel .hpm-item').first().trigger('click');
    }
    */ ?>
}
function hpmodel_rri(r, ri, $d) {
    for (s in r) { $(s).html(r[s]); }
    for (s in ri) { $i = $(s).val(ri[s]); v = hpmodel.input[s]; if (v) $i.trigger(v); }
    if (typeof hmodel_onchange === 'function') hmodel_onchange($d);
    if (typeof autocalc_init === 'function') autocalc_init();
}
function hpm_pp_select($item) {
    $('.hpm-item').removeClass('active');
    var product_id = $item.data('id') ? $item.data('id') : $item.val();
    $('#hpmodel .hpm-item-'+product_id).addClass('active');
    $('body').removeClass('hpm-no-active').addClass('hpm-has-active');
    
    <?php if ($hash) { ?>
    var name = $item.text(); name = name.trim(' ').toLowerCase().replace(/\s\s+/g, '-').replace(' ', '-');
    var hash = $item.data('hash'); // + (name ? '-' + name : '');
    hpm_set_hash(hash);
    <?php } else if (empty($redirect)) { ?>
    if (hpm_products[product_id]) hpm_set_url(hpm_products[product_id].href);
    <?php } ?>   
    
    $('#hpmodel .after_title').html($item.data('title'));
    
    if (typeof hmodel_before === 'function') hmodel_before();
    $.ajax({
        url: hpm_products[product_id].real,
        type: 'post',
        data: 'hpmodel_orig=1',
        dataType: 'html',
        success: function(h){
            var $d=$(h); var r = []; var ri = [];
            <?php if ($replace_h1) { ?>document.title=$d.filter('title').text();<?php } ?>
            for (s in hpmodel.rest) { r[s] = $(s).html(); };
            for (s in hpmodel.input) { ri[s] = $(s).val();  };
            var cc = 0;
            for (s in hpmodel.copy) { cc++; $h = $d.find(s); var $i = $h.find('img'); var ic = $i.length; if (ic == 0) { $(s).html($h.html()); cc--; } else { (function(ic, $i, s, $h){ $i.each(function(){ $ii = $('<img src="'+$(this).attr('src')+'" style="width:1px;height:1px;" />').on('load',function(){ ic--; if (ic == 0) { $(s).html($h.html()); cc--; if (cc == 0) hpmodel_rri(r, ri, $d);}}).on('error',function(){ ic--; if (ic == 0) { $(s).html($h.html()); cc--; if (cc == 0) hpmodel_rri(r, ri, $d);}});});})(ic, $i, s, $h);}};
            if (cc == 0) hpmodel_rri(r, ri, $d);
        }
    });
}
$(document).on('click', '#hpmodel .hpm-item', function() {
    hpm_pp_select($(this));
}).on('change', '#hpmodel .hpmodel-type-select select', function() {
    hpm_pp_select($(this).find('option:selected'));
});
$(document).ready(function () {
    <?php if (!empty($selector) && !empty($position)) { ?>$('#hpmodel').<?php echo $position; ?>('<?php echo $selector; ?>');<?php } ?>
    $('#hpmodel').show();    
    if ($('#hpmodel .hpm-item-<?php echo $selected_product_id; ?>').length) {
        $('#hpmodel .hpm-item-<?php echo $selected_product_id; ?>').addClass('active');
        $('body').addClass('hpm-has-active');
    } else {
        <?php /*$('#hpmodel .hpm-item').first().addClass('active');*/ ?>
        $('body').addClass('hpm-no-active');
    }
    hashchange();
});
</script>

<?php if ($custom_css) { ?><style><?php echo $custom_css; ?></style><?php } ?>
<?php if ($custom_js) { ?><script><?php echo $custom_js; ?></script><?php } ?>
<?php } ?>