let partners = [];



var myMap;
function mapHandler(center, maps, choosePartner) {
    myMap = new ymaps.Map(
        "map",
        {
            center: center,
            zoom: 9,
            controls: []
        },
        {
            searchControlProvider: "yandex#search",
        }
    );
    mySearchControl = new ymaps.control.SearchControl({
        options: {
            noPlacemark: true
        }
    }),
        // Результаты поиска будем помещать в коллекцию.
        mySearchResults = new ymaps.GeoObjectCollection(null, {
            hintContentLayout: ymaps.templateLayoutFactory.createClass('$[properties.name]')
        });
    myMap.controls.add(mySearchControl);
    myMap.geoObjects.add(mySearchResults);
    // При клике по найденному объекту метка становится красной.
    mySearchResults.events.add('click', function (e) {
        e.get('target').options.set('preset', 'islands#redIcon');
    });
    // Выбранный результат помещаем в коллекцию.
    mySearchControl.events.add('resultselect', function (e) {
        var index = e.get('index');
        mySearchControl.getResult(index).then(function (res) {
            mySearchResults.add(res);
        });
    }).add('submit', function () {
        mySearchResults.removeAll();
    })
    maps.forEach((element, i) => {
        ymaps.geocode(element.geocode).then(function (res) {
            var coord = res.geoObjects.get(0).geometry.getCoordinates();
            var myPlacemark = new ymaps.Placemark(coord, {
                balloonContentHeader: element.header,
                balloonContentBody: element.body,
                balloonContentFooter: choosePartner ? element.footer + '<br><button class="btn btn-primary" data-choose-partner="' + element.centr_id + '">Выбрать</button>' : element.footer,
                iconCaption: element.iconCaption,
            }, {
                preset: 'islands#darkDotIcon'
            });
            myMap.geoObjects.add(myPlacemark);
            myMap.setCenter(coord, 9);
        });
    });

    myMap.container.fitToViewport();

}

$(document).on('click', '[data-choose-partner]', function () {
    const __this = $(this);
    const partnerVal = __this.attr('data-choose-partner');

    let select = $('#custom-centr');

    if (partnerVal) {

        $('[data-choose-partner]').removeClass('btn-success btn-primary');
        __this.addClass('btn-success');

        myModal.close();
        $('.hystmodal__shadow--show').removeClass('hystmodal__shadow--show');

        let partner = partners.find(partner => partner.centr_id === partnerVal);

        $('#input-shipping-address-1').val(partner.street);
        $('#input-shipping-city').val(partner.city);
        $('#input-shipping-company').val(partner.footer);

        if (select.length) {
            select.find('option[value="' + partnerVal + '"]').attr("selected", true).prop('selected', true);
            select.trigger('input');
        }

    }
    // else {
    //     $('#input-shipping-address-1').val('').attr('readonly', false);
    //     $('#input-shipping-city').val('').attr('readonly', false);
    //     $('#input-shipping-company').val('').attr('readonly', false);
    // }
});

// $(document).on('input', '#city_type', function () {
//     const __this = $(this);
//     // console.log(__this.val());
//     const city = __this.val();
//     if (city != 0) {
//         $('[data-map-txt]').hide();
//     } else {
//         $('[data-map-txt]').show();
//     }
//     $.ajax({
//         url: 'index.php?route=extension/module/custom/total',
//         method: 'post',
//         dataType: 'json',
//         data: { city: city },
//         success: function (data) {
//             if (data && Array.isArray(data)) {
//                 partners = data;
//                 if (myMap) {
//                     myMap.destroy();
//                 }
//                 mapHandler([55.76, 37.64], partners);


//                 let select = $('#custom-centr');
//                 select.html('');
//                 select.append('<option value="0">Выберите партнера</option>');
//                 partners.forEach(el => {
//                     select.append('<option value="' + el.centr_id + '">' + el.geocode + '</option>');
//                 });
//                 select.trigger('input');


//             }
//         }

//     });
// });


$(document).on('input', '#custom-centr', function () {
    const __this = $(this);
    const partnerVal = __this.val();

    let checkedAddress = $('[name="aff_add"]');

    if (partnerVal && partnerVal != 0) {
        checkedAddress.attr("checked", true).prop("checked", true);
    } else {
        checkedAddress.attr("checked", false).prop("checked", false);
    }

});

