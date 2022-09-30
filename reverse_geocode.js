let partners = [];

// ymaps.ready(function () {
//     mapHandler([55.76, 37.64], mapsArray);
//     myMap.container.fitToViewport();

//     partners = mapsArray;
// });

var myMap;
function mapHandler(center, maps) {
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
    maps.forEach((element) => {
        ymaps.geocode(element.geocode).then(function (res) {
            var coord = res.geoObjects.get(0).geometry.getCoordinates();
            var myPlacemark = new ymaps.Placemark(coord, {
                balloonContentHeader: element.header,
                balloonContentBody: element.body,
                balloonContentFooter: element.footer,
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

$(document).on('input', '#city_type', function () {
    const __this = $(this);
    // console.log(__this.val());
    const city = __this.val();
    if (city != 0) {
        $('[data-map-txt]').hide();
    } else {
        $('[data-map-txt]').show();
    }
    $.ajax({
        url: 'index.php?route=extension/module/custom/total',
        method: 'post',
        dataType: 'json',
        data: { city: city },
        success: function (data) {
            if (data && Array.isArray(data)) {
                partners = data;
                if (myMap) {
                    myMap.destroy();
                }
                mapHandler([55.76, 37.64], partners);


                let select = $('#custom-centr');
                select.html('');
                select.append('<option value="0">Выберите партнера</option>');
                partners.forEach(el => {
                    select.append('<option value="' + el.centr_id + '">' + el.geocode + '</option>');
                });
                select.trigger('input');


            }
        }

    });
});


$(document).on('input', '#custom-centr', function () {
    const __this = $(this);
    const partnerVal = __this.val();

    let checkedAddress = $('[name="aff_add"]');

    if (partnerVal && partnerVal != 0) {
        $('#custom-address-partner').show();
    } else {
        $('#custom-address-partner').hide();
    }

    if (partnerVal && partnerVal != 0 && checkedAddress.prop('checked')) {
        let partner = partners.find(partner => partner.centr_id === partnerVal);
        $('#input-shipping-address-1').val(partner.street).attr('readonly', true);
        $('#input-shipping-city').val(partner.city).attr('readonly', true);
        $('#input-shipping-company').val(partner.footer).attr('readonly', true);
    } else {
        $('#input-shipping-address-1').val('').attr('readonly', false);
        $('#input-shipping-city').val('').attr('readonly', false);
        $('#input-shipping-company').val('').attr('readonly', false);
    }
});

$(document).on('input', '[name="aff_add"]', function () {
    const __this = $(this);
    $('#custom-centr').trigger('input');
});