/*
 * Showmore plugin for opencart
 * Copyright (c) 2015 Shvarev Ruslan ruslan.shv@gmail.com
 * https://opencartforum.com/user/12381-freelancer/
 */
var $cookie = function () {};
$(document).ready(function () {
    if ($('.pagination div.links b').next('a').length > 0) {
        $('.pagination').before('<div id="showmore" style="padding-bottom: 15px;"><a onclick="showmore()">Показать еще</a></div>');
    }
    if ($.totalStorage != undefined && $.totalStorage('display') != null) {
        $cookie = $.totalStorage;
    } else if ($.cookie != undefined && $.cookie('display') != null) {
        $cookie = $.cookie;
    }
});
function showmore() {
    var $next = $('.pagination div.links b').next('a');
    if ($next.length == 0) {
        return;
    }
    $.get($next.attr('href'), function (data) {
        $data = $(data);
        var $container = $('.product-' + $cookie('display'));
        $container.append($data.find('.product-grid > *, .product-list > *'));
        $('.pagination').html($data.find('.pagination > *'));
        if ($('.pagination div.links b').next('a').length == 0) {
            $('#showmore').hide();
        }

        $data.filter('script').each(function () {
            if ((this.text || this.textContent || this.innerHTML).indexOf("document.write") >= 0) {
                return;
            }
            $.globalEval(this.text || this.textContent || this.innerHTML || '');
        });
        //$('html, body').animate({ scrollTop: $container.offset().top - 10 }, 'slow');

    }, "html");
    return false;
}