(function(){ 
    $(document).ready(function(){
        var hpm_config = window['hpm_config'] || {};
        var dropBlock = false; var activeOpt = false;
        $(document).on('mouseenter', '.hpm-cat-item', function(){
            var $t = $(this); var $c = $t.closest(hpm_config.cat_item ? hpm_config.cat_item : '.product-thumb, .product');
            if (hpm_config.event && hpm_config.event.mouseenter && !hpm_config.event.mouseenter($c, $t)) return;
            if ($t.data('thumb')) {
                $c.find('.image img').attr('src', $t.data('thumb'));
            }
        }).on('mouseleave', '.hpm-cat-box', function(){
            var $c = $(this).closest(hpm_config.cat_item ? hpm_config.cat_item : '.product-thumb, .product');
            if ($c.find('.hpm-cat-item').length == 0) return;
            if (hpm_config.event && hpm_config.event.mouseleave && !hpm_config.event.mouseleave($c)) return;
            var $a = $c.find('.hpm-cat-item.active');
            var $hc = $c.find('.hpm-cat-box');
            if ($a.length && $a.data('thumb')) {
                $c.find('.image img').attr('srcset', '').attr('src', $a.data('thumb'));
            } else if ($hc.length && $hc.data('thumb')) {
                $c.find('.image img').attr('srcset', '').attr('src', $hc.data('thumb'));
            }
        }).on('click', '.hpm-cat-item', function(){
            if (!$(this).data('id')) return;
            hpm_select($(this));
        }).on('change', '.hpm-cat-box select', function(){
            hpm_select($(this).find('option:selected'));
        }).on('click', function(e){
            var $t = $(e.target).closest('.hpm-select .selected'); var $si = $(e.target).closest('.hpm-select-item')
            if ($t.length) {
                var $p = $t.parent(); var $drop = $p.parent().find('.drop-down');
                if($drop.is(':hidden')) {
                    $drop.slideDown();
                    $p.addClass('open');
                } else {
                    $drop.slideUp();
                    $p.removeClass('open');
                }
                return false;
            } else if ($si.length) {
                var $p = $si.closest('.hpm-select');
                if ($p.find('.selected .hpm-select-item').length) {
                    $p.find('.selected .hpm-select-item').html($si.html());
                } else {
                    $p.find('.selected').html('<div class="hpm-select-item">'+$si.html()+'</div>');
                }
                $p.find('.drop-down').slideUp();
                $p.removeClass('open');
            } else if ($('.hpm-select.open').length) {
                $('.hpm-select.open .drop-down').slideUp();
                $('.hpm-select.open').removeClass('open');
            }
        });
        function hpm_select($t) {
            var $c = $t.closest(hpm_config.cat_item ? hpm_config.cat_item : '.product-thumb, .product');
            $c.find('.hpm-cat-item').removeClass('active');
            $t.addClass('active');
            if (hpm_config.event && hpm_config.event.select && !hpm_config.event.select($c, $t)) return;
            $c.find('[onclick*="cart.add("]').attr('onclick', 'cart.add('+$t.data('id')+',1)');
            $c.find('[onclick*="wishlist.add("]').attr('onclick', 'wishlist.add('+$t.data('id')+')');
            $c.find('[onclick*="compare.add"]').attr('onclick', 'compare.add('+$t.data('id')+')');
            if ($t.data('price')) {
                var ph = $t.data('price');
                if ($t.data('special')) ph = '<span class="price-new">'+$t.data('special')+'</span> <span class="price-old">'+ph+'</span>';
                $c.find('.price').html(ph);
            }
            $c.find('a[data-hpm-href="1"]').attr('href', $t.data('href'));
            if ($t.data('name')) {
                $c.find('.caption a[data-hpm-href="1"]').text($t.data('name'));
                $c.find('a[data-hpm-href="1"] img').attr('alt', $t.data('name')).attr('title', $t.data('name'));
            }
            if ($t.data('thumb')) {
                $c.find('.image img').attr('srcset', '').attr('src', $t.data('thumb'));
            }
        }
        function hpm_onload() {
            //$('.hpm-cat-box').each(function(){if (!$(this).find('.hpm-cat-item.active').length)$(this).find('.hpm-cat-item').first().trigger('click');});
            hpm_config.event && hpm_config.event.load && !hpm_config.event.load();
        }
        hpm_onload();    
        $(document).ajaxComplete(function(){hpm_onload();});
    });
})();
