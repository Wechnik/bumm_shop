function im_ss(b) {
    function c() {
		//alert('i am function c ');
        return J = $(E).children().length, J < u ? void(D.attr('style') ? D.html(b.drop).attr('style', '') : '') : ($('#drop-files p').html(b.max_f + u + b.max_i).css('color', '#fd8b8b'), !0)
    }

    function d(P, Q, R, S) {
        var T = R.width,
            U = R.height,
            V = document.createElement('canvas');
        R.height > Q && (T = R.width * Q / R.height, U = Q), V.width = T, V.height = U;
        var W = V.getContext('2d');
        return W.drawImage(R, 0, 0, T, U), /blob:|wm_bg/.test(R.src) && t(W, T, U), S ? V : V.toDataURL('image/' + ('jpg' == P ? 'jpeg' : P), 0.9)
    }

    function f(P, Q, R) {
        if (0 != R.status) {
            var S = $('#img-' + Q),
                T = $('[id^=\'input-image\']', S).val();
            S.append('<span class="aExist"><img src="" class="ui-sortable-handle" ><p class="e_text">' + b.exist + '</p><p class="e_bottom"><button id="keep" type="button" class="btn btn-default keep_both">' + b.keep_both + '</button><button id="rep" type="button" class="btn btn-default">' + b.replace + '</button><button id="skip" type="button" class="btn btn-default">' + b.keep_old + '</button></p></span>');
            var U = new Image;
            U.onload = function() {
                $('.aExist', S).show('fast'), $('.aExist img', S).attr('src', d(P, 80, this, !1))
            }, U.src = I + T, $('.aExist button', S).one('click', function() {
				//alert(R.newname);
				//alert(T.match(/.*\//));
				//alert((S.data('upl')).name);
				//alert((S.data('url')).name);
                $('.aExist', S).hide('fast'), 'skip' == this.id ? S.removeData('upl url').find('.previewImg').html('<img src=\'' + d(P, 200, U, !1) + '\' />') : 'keep' == this.id && ((S.data('url') || S.data('upl')).name = R.newname, S.find('[id^=\'input-image\']').val(R.newname)), setTimeout(function() {
                    $('.aExist', S).remove()
                }, 200)
            })
        }
    }

    function g(P) {
        if (0 != P.length && y && !(J >= u)) {
            var Q = F,
                R = [];
            y = !1;
            for (var S = 0; S < P.length; S++) {
                if (H.test(P[S].name || P[S])) {
                    if (!P[S].name) {
                        var T, U;
                        /^data:image\//.test(P[S]) ? ('' == (T = $('input[id^=\'input-name\']').val()) ? T = 'no_name' + Q : T += Q, T = T + '.' + P[S].replace(/(data:image\/(?=(jpe?g|png|gif|bmp)))|(;base64.*)/ig, ''), U = !0) : (T = P[S].replace(/.*\//, ''), U = !1), R.push({
                            name: T,
                            url: P[S],
                            type: U
                        })
                    } else R.push(P[S]);
                    $(E).append('<div id="img-' + Q++ + '"class="loaderImg image" ><div class="loading"><div></div><span>' + b.upl_save + '...</span></div></div>')
                }
                if (c()) break
            }
			sellssser_id = document.getElementById('sellssser_id').value;
            if (!G)
                if (0 == $('[name="manufacturer_id"]').val()) G = 'catalog/Seller_' + sellssser_id + '/';
                else {
                    var V;
                    if (V = $('#input-manufacturer').val());
                    else V = $('[name=\'manufacturer_id\'] option:selected').text();
                    G = 'catalog/Seller_' + sellssser_id + '/'
                }
            j(R)
        }
    }

    function j(P) {
        if (0 == P.length) return void(y = !0);
        var Q = new Image,
            R = P.shift(),
            S = 'new',
            T = $('#img-' + F),
            U = !1,
            V, W = R.name.split(/\.(?=[^.]*$)/),
            X = /png|gif/i.test(W[1]) ? W[1] : 'jpg',
            W = (0 > (V = 175 - W[0].length) ? W[0].slice(0, V) : W[0]).replace(/\W/g, '_') + '.' + X,
            Y = G + W;
        /^image\//.test(R.type) ? (window.URL = window.URL || window.webkitURL, urlImg = window.URL.createObjectURL(R)) : (urlImg = R.url, 0 <= R.url.indexOf(I) && (S = 'old', Y = R.url.replace(I, ''))), Q.onerror = function() {
            alert('\'' + W + '\' is broken'), F++, T.remove(), j(P)
        }, Q.onload = function() {
            'new' == S && (k(X, F, Y), K++, R.type ? T.data('upl', {
                name: W,
                type: X,
                value: d(X, 1080, this, U)
            }) : (T.data('url', {
                name: W,
                value: urlImg
            }), U = !0));
            var Z = d(X, 200, this, U);
            T.html('<span class=\'previewImg\'></span>').removeClass('loaderImg').addClass(S), T.find('.previewImg').append(U ? Z : '<img src=\'' + Z + '\' />'), T.append('<span  class="btm_img "><i class="fa fa-search-plus" data-toggle="tooltip" title="' + b.zoom + '" aria-hidden="true"></i><i class="fa fa-times" data-toggle="tooltip" title="' + b.button_remove + '" aria-hidden="true" ></i></span><input value="' + Y + '" id="input-image" type="hidden" >'), F++, setTimeout(function() {
                j(P)
            }, 20)
        }, Q.src = urlImg
    }

    function k(P, Q, R) {
        $.ajax({
            url: 'index.php?route=account/purpletree_multivendor/sellerproduct/existImage',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                name: R
            },
            success: function(S) {
                f(P, Q, S), K--
            }
        })
    }
	function l() {
        (postData = function() {
            $('.keep_both').click();
            var S, Q = $(E).children(),
                R = [],
                T = new FormData,
                U = [];
            if ($.each(Q, function(W) {
                    if ((S = $(this).data('upl') || $(this).data('url')) && -1 == $.inArray(S.name, R))
                        if (R.push(S.name), S.type) {
                            for (var Y = atob(S.value.split(',')[1]), Z = [], _ = 0; _ < Y.length; _++) Z.push(Y.charCodeAt(_));
                            var aa = new Blob([new Uint8Array(Z)], {
                                type: 'image/' + S.type
                            });
                            T.append(W, aa, S.name)
                        } else T.append('urls[' + W + '][value]', S.value), T.append('urls[' + W + '][name]', S.name);
                    var ba = $(this).find('[id^=\'input-image\']').val(),
                        ca = this.id.match(/\d+/),
                        da = '<input name=\'' + (0 == W ? 'image' : 'product_image[' + ca + '][image]') + '\' value=\'' + ba + '\' id=\'input-image' + (0 == W ? '' : ca) + '\' type=\'hidden\' >',
                        ea = 0 == W ? '' : '\n<input name=\'product_image[' + ca + '][sort_order]\' value=\'' + W + '\' type=\'hidden\' >';
                    $('input', this).remove(), $(this).append(da + ea), $(this).is('.old') && U.push(ba)
                }), A.length) {
                R = [], T.append('dels[id]', b.proId);
                for (var V = 0; V < A.length; V++) - 1 != $.inArray(A[V], U) || -1 != $.inArray(A[V], R) || new RegExp(A[V], 'i').test($('#input-description1').val()) || (R.push(A[V]), T.append('dels[value][]', A[V]))
            }
            return J || $(E).html('<input name="image" id="input-image" type="hidden" >'), T.append('catalog', G), 0 !== R.length && T
        }()) ? $.ajax({
            async: !0,
            contentType: !1,
            data: postData,
            processData: !1,
            type: 'post',
			  url: 'index.php?route=account/purpletree_multivendor/sellerproduct/uploadNewImage',
            xhr: function() {
                var Q = $.ajaxSettings.xhr();
                return Q.upload.onprogress = function(R) {
                    $('.lis i').html(b.upl_save + parseInt(100.1 / R.total * R.loaded) + '%')
                }, Q
            },
            success: function() {
                $('#form-product').submit()
            }
        }):$('#form-product').submit()
    }


    function m(P) {
        var Q = P.originalEvent.changedTouches[0],
            R = document.createEvent('MouseEvent');
        return R.initMouseEvent({
            touchstart: 'mousedown',
            touchmove: 'mousemove',
            touchend: 'mouseup'
        }[P.type], !0, !0, window, 1, Q.screenX, Q.screenY, Q.clientX, Q.clientY, !1, !1, !1, !1, 0, null), Q.target.dispatchEvent(R), P.preventDefault(), !1
    }

    function o() {
        $('.wmBkfix').removeClass('opc4'), setTimeout(function() {
            $('.wmBkfix').remove()
        }, 200), O.text('WM').removeClass('wmSave'), $('.ssWaterMark').removeClass('wmAct')
    }

    function p(P) {
        if (L.wmStatus = $('#wmStatus').prop('checked'), L.wmPos = $('#wmPos option:selected').val(), L.wmSize = $('#wmSize').val(), L.wmOpc = $('#wmOpc').val(), L.wmFont.Ft = 'sans-serif', L.wmFont.Cl = $('#wmColor').val(), $('#wmData').val() != L.wmData)
            if (L.wmData = $('#wmData').val(), /(\.(jpe?g|png|gif|bmp)$)/.test(L.wmData)) L.wmType = 'img', M.src = L.wmData, N = !0, M.onerror = function() {
                alert('\'ERR_FILE_NOT_FOUND\' WaterMark disabled! For enable watermark please replace \'Image Url\' or use any \'Text\'!'), $('#wmStatus').prop('checked', !1), $('#wmData').val('')
            };
            else {
                L.wmType = 'txt', N = !1;
                var Q = document.createElement('span');
                Q.textContent = $('#wmData').val().replace(/\ /g, '|'), Q.style.lineHeight = 1, Q.style.display = 'inline-block', Q.style.fontSize = '1000px', Q.style.fontFamily = L.wmFont.Ft, Q.style.position = 'fixed', Q.style.opacity = 0, document.body.appendChild(Q), L.wmFont.Wi = Q.offsetWidth, document.body.removeChild(Q)
            }
        P && (!1 == (L.imgMove = N) && o(), $.ajax({
            data: L,
            type: 'post',
            url: 'index.php?route=account/purpletree_multivendor/sellerproduct/wmjson',
            success: function() {
                N && (N = !1, M.src = 'catalog/view/javascript/simple_store/watermark/wmImg.png?' + new Date().getTime(), o())
            }
        }))
    }

    function q(P) {
        P ? (O.text('Save').addClass('wmSave'), p(!1)) : O.is('.wmSave') && (O.html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>'), p(!0)), $('#setCol,.color.anyCol').css('background', $('#wmColor').val()), $('#setCol').css('display', 'none');
        var Q = new Image;
        Q.src = 'catalog/view/javascript/simple_store/watermark/wm_bg.jpg', Q.onload = function() {
            'txt' == L.wmType && '' != L.wmData && $('#setCol').css('display', 'block'), $('.previweWm').html(d('jpg', 177, Q, !0))
        }
    }

    function t(P, Q, R) {
        function S(Z, _, aa) {
            var ba = (Q - 2 * U) / _,
                ca = (R - 2 * U) / aa,
                da = (_ * ba <= Q && aa * ba <= R ? ba : ca) * V;
            _ *= da, aa *= da;
            var ea = /^r/.test(T) ? Q - _ - U : U,
                fa = /b$/.test(T) ? R - aa - U : U;
            if ('cn' == T && (ea = (Q - _) / 2, fa = (R - aa) / 2), 'mt' == T) {
                for (var ga = aa + 0.2 * aa / V, ha = _ + 0.2 * _ / V, ia = 0; ia < R / ga; ia++) {
                    fa = ga * ia + U;
                    for (var ja = ia % 2 ? ha / 2 : U, ka = 0; ka < Q / ha; ka++) ea = ha * ka + ja, P.drawImage(Z, ea, fa, _, aa)
                }
                return
            }
            P.drawImage(Z, ea, fa, _, aa)
        }
        if (L.wmStatus && '' != L.wmData) {
            var T = L.wmPos,
                U = Q / 100,
                V = parseInt(L.wmSize) / 100,
                W = parseInt(L.wmFont.Wi);
            if (P.globalAlpha = parseInt(L.wmOpc) / 100, 'txt' == L.wmType) {
                var X = document.createElement('canvas'),
                    Y = X.getContext('2d');
                wmFontSize = Q * (1e3 / W), wmFontSize = wmFontSize <= R ? wmFontSize : R, X.width = W / 1e3 * wmFontSize, X.height = wmFontSize - 0.05 * wmFontSize, Y.font = wmFontSize + 'px ' + L.wmFont.Ft, Y.fillStyle = L.wmFont.Cl, Y.textBaseline = 'bottom', Y.fillText(L.wmData, -1 * V, X.height), S(X, X.width, X.height)
            } else M.complete ? S(M, M.width, M.height) : M.onload = function() {
                S(M, M.width, M.height)
            }
        }
    }
    jQuery.event.props.push('dataTransfer'), $('body').bind({
        drop: function() {
			//alert(' i am drop fun');
            return !1
        },
        dragover: function() {
			//alert(' i am dragover fun');
            return !1
        }
    });
    var J, u = 20,
        y = !0,
        A = [],
        B = 0,
        C = $('#file-input'),
        D = $('#drop-files p'),
        E = '#list-view',
        F = b.image_row,
        G = !1,
        H = /(\.(jpe?g|png|gif|bmp)$)|^data:image\//i,
        I = b.pathImg,
        K = 0;
    (function() {
        $(document).on('touchstart touchmove touchend touchcancel', E + ' .previewImg', function(P) {
			//alert(' i am touch event fun');
            return 'touchstart' == P.type ? (stra = 0, ssd = setTimeout(function() {
                $(P.target).parent().addClass('tapScale'), $(document).trigger('touchstart'), m(P), stra = 1
            }, 200)) : ('touchend' == P.type || 'touchmove' == P.type) && clearTimeout(ssd), 0 == stra ? void 0 : (m(P), void('touchend' == P.type && $(this).parent().removeClass('tapScale')))
        })
    })(), c(), $('#drop-files').bind('drop dragover dragleave', function(P) {
		//alert('i am drop and dragover ');
        'dragover' == P.type ? (P.preventDefault(), $(this).attr('class', 'dropHover')) : ('drop' == P.type && g(P.dataTransfer.files), $(this).removeAttr('class', 'dropHover'))
    }), C.on('change', function() {
		//alert('i am change fun ');
        g($(this)[0].files), C.replaceWith(C = C.val('').clone(!0))
    });
    $('#bySer').on('click', function() {
		//alert(' i am server fun');
        function P(S) {
            $('#button-up').remove(), 0 < S && $('#modal-image #button-delete').after('<button type="button" style="background:green;" data-toggle="tooltip" title="" id="button-up" class="btn btn-success" data-original-title="' + b.mAdd + '"><i class="fa fa-check"></i><span>' + S + '</span></button>')
        }
        $(this).prop('disabled', !0);
        var Q = $('i', this),
            R = [];
        Q.attr('class', 'fa fa-circle-o-notch fa-spin'), $('body').tooltip({
            selector: '#button-up'
        }), $('#modal-image').remove(), $.ajax({
            url: 'index.php?route=common/filemanager&target=no-id&thumb=no-id',
            dataType: 'html',
            success: function(S) {
                Q.attr('class', 'fa fa-server'), $('body').append('<div id="modal-image" class="modal ssIm_modal">' + S + '</div>'), $('#modal-image').modal('show').one('hidden.bs.modal', function() {
                    $(document).off('click', '#modal-image a,#modal-image #button-up'), $(document).off('ajaxComplete'), $(document).off('ajaxSend'), $('#bySer').prop('disabled', !1)
                }), $(document).on('ajaxComplete', function(T, U, V) {
                    $('a.thumbnail').off('click');
                    for (var X, W = 0; W < R.length; W++) X = $('#modal-image a[href="' + R[W] + '"]'), X.length && X.addClass('seBor').next().children().prop('checked', !0);
                    /delete\&(token|user_token)/.test(V.url) && $('input[name^=\'path\']:checked').each(function() {
                        indexOfDublicat = $.inArray(I + this.value, R), R.splice(indexOfDublicat, 1), $('#button-up').prop('disabled', !1)
                    }), P(R.length)
                }), $(document).on('ajaxSend', function(T, U, V) {
                    /delete\&(token|user_token)/.test(V.url) && $('#button-up').prop('disabled', !0)
                }), $(document).on('click', '#modal-image a,#modal-image #button-up', function(T) {
                    if (T.preventDefault(), $(this).is('.thumbnail')) {
                        var V, U = $(this).parent().find('input');
                        U.click(), U = I + U.val(), -1 == (V = $.inArray(U, R)) ? u > R.length && (R.push(U), $(this).addClass('seBor')) : (R.splice(V, 1), $(this).removeClass('seBor')), P(R.length)
                    } else $(this).is('#button-up') && y && (g(R), $('#modal-image').modal('hide'))
                })
            }
        })
    }), $('#byUrl, #url-input button').click(function() {
        $('#url-input span').toggle('fast')
    }), $('#url-input button').on('click', function() {
        myList = $('#url-input input').val(), myList = /base64,/.test(myList) ? myList.split() : myList.replace(/\ /g, '').split(','), $('#url-input input').val(''), g(myList)
    }), $(E).on('click', '.image i.fa-times', function() {
        var P = $(this).closest('div'),
            Q = P.find('input[id^=in]').val();
        $('.alRem').remove(), 1 < B++ && 3 < J && (B = 0, P.next().append('<span class="alRem"><button onclick="$(\'.image i.fa-times\').click();"  type="button" class="btn btn-default">' + b.remove_all + '</button><button onclick="$(\'.alRem.sclose\').remove();$(\'.alRem\').addClass(\'shkMe sclose\');" type="button" class="btn btn-default canrem">' + b.ignor + '</button></span>'), setTimeout(function() {
            $('.alRem').addClass('sclose')
        }, 800)), y && (P.is('.old') && '' != Q && A.push(Q), P.hide('fast', function() {
            $(this).prev().length ? B = 0 : B++, this.remove(), c()
        }))
    }), $(function() {
        function P(T) {
            return ds = $(document).scrollTop(), ds >= T - R && 0 < Q || ds <= S && 0 > Q ? void(Q = !1) : void(Q && ($(document).scrollTop(ds + Q), setTimeout(P, 100)))
        }
        var Q = !1,
            R = 0,
            S = 0;
        $(E).sortable({
            scroll: !1,
            handle: '.previewImg',
            start: function(T, U) {
                U.item.addClass('mouseScale'), dh = $(document).height(), S = $(E).offset().top - 50, R = $(window).height()
            },
            sort: function(T) {
                var V = $(document).scrollTop(),
                    W = T.pageY - window.pageYOffset;
                Q = W >= R - 30 ? 5 : !!(30 >= W) && -5, P(dh)
            },
            deactivate: function(T, U) {
                setTimeout(function() {
                    U.item.removeClass('mouseScale tapScale')
                }, 10), Q = !1
            }
        }), $(E).disableSelection()
    }), $('.upl').on('click', function(e) {
		e.preventDefault();
        0 == K ? (y = !1, $('<div class=\'lis\' ><div><i>' + b.upl_save + '100%</i><span></span></div></div>').prependTo('body').fadeIn(500), $('body').css({
            overflow: 'hidden',
            width: $('body').width() + 'px',
            position: 'fixed'
        }), l()) : ($('.upl').addClass('shkMe').after('<span  class = \'moment\' style=\'text-align:center;position: absolute;background: #ffffff;border: 1px solid #000;padding: 3px;border-radius: 2px;line-height: 1.2;\'>One sec.!</span>'), setTimeout(function() {
            $('.upl').removeClass('shkMe').next().remove()
        }, 500))
    }), scaled = 'transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', $(document).on('mousedown touchstart', function(P) {
        var R, Q = $(P.target).closest('.image');
        if ($('.z-view').parent().css({
                'z-index': '1',
                transform: ''
            }).one(scaled, function() {
                $(this).css({
                    'z-index': ''
                }), $(this).off(scaled)
            }), $('.z-view').remove(), $('.image .fa-search-minus', this).removeClass('fa-search-minus'), $(P.target).is('.fa-search-plus') && 'none' == Q.css('transform')) {
            $(P.target).addClass('fa-search-minus');
            var S = I + Q.find('input[id^=in]').val();
            (R = Q.data('url') || Q.data('upl')) && (S = R.value);
            var T = 0,
                U = 1.7 * Q.width() > $(E).width() ? $(E).width() / Q.width() : 1.7,
                V = (Q.width() * U - Q.width()) / 2,
                W = Q.offset().left - $(E).offset().left,
                X = W + Q.width() + V;
            W < V && (T = (15 + V - W) / 2), $(E).width() < X && (T = -(15 + X - $(E).width()) / 2), Q.css({
                'z-index': '2',
                transform: 'scale(' + U + ') translateX(' + T + 'px)'
            }), Q.one(scaled, function() {
                $(this).prepend('<img class=\'z-view\' src=\'' + S + '\'>'), $(this).off(scaled)
            })
        }
    });
    var L = b.wmArr,
        M = new Image,
        N = !1,
        O = $('.ssWaterMark .btWm');
    $('.btWm').on('click', function() {
		//alert('i am btwm');
        'WM' == $(this).text() ? ($(this).html('<i class="fa fa-times" aria-hidden="true"></i>'), $('.ssWaterMark').after('<div class =\'wmBkfix\'></div>'), setTimeout(function() {
            $('.wmBkfix').addClass('opc4')
        }), $('.ssWaterMark').addClass('wmAct')) : !O.is('.wmSave') && o(), q(!1)
    }), $('.settWm select,.settWm input').on('change keyup', function(P) {
		//alert('i am change keyup');
        'change' == P.type && 'text' == this.type || ($(this).next().find('.wmRng').text($(this).val()), q(!0))
    }), $('.waterMarkBlock').on('click', function(P) {
		//alert('i am waterMarkBlock');
        jQt = $(P.target), jQt.is('#setCol') && jQt.toggleClass('active'), $('#setCol').is('.active') && (jQt.is('.simp') && ($('#wmColor').val(P.target.outerHTML.match(/#\S{3,6}/)[0]), setTimeout(function() {
            q(!0)
        }, 200)), !jQt.is('#setCol,#wmColor,.colorList') && $('#setCol.active').removeClass('active'))
    }), $('#wmStatus').prop('checked', L.wmStatus), $('#wmPos option[value=' + L.wmPos + ']').prop('selected', !0), $('#wmData').val(L.wmData), $('#wmColor').val(L.wmFont.Cl), $('#wmSize').val(L.wmSize), $('#wmSize + label .wmRng').text(L.wmSize), $('#wmOpc').val(L.wmOpc), $('#wmOpc + label .wmRng').text(L.wmOpc), 'img' == L.wmType && (M.src = 'catalog/view/javascript/simple_store/watermark/wmImg.png')
}