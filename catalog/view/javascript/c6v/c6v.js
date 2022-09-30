var c6v_cities = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: 'index.php?route=tool/c6v/getCities',
});

var c6v_typeahead = function(fields) {
  $(fields).typeahead({
    hint: true,
    highlight: true,
    minLength: 1,
  },{
    source: c6v_cities.ttAdapter(),
    name: 'c6v_cities',
    display: 'name',
    limit: 7,
  });
};

function c6v_init() {
  c6v_typeahead('#input-city,#register_city,#address_city,#shipping_address_city');
}

function c6v_init_payment() {
  c6v_typeahead('#input-payment-city');
};

function c6v_init_shipping() {
  c6v_typeahead('#input-shipping-city');
};

function c6v_set_pickup(pickup_city) {
  $.ajax({
    url: 'index.php?route=tool/c6v/setPickupCity', 
    type: 'post',
    data: 'pickup_city=' + pickup_city,
    dataType: 'json',
    complete: function() {
      // simplecheckout
      $('#shipping_address_city').trigger('change');
      // checkout
      setTimeout(function () {
        $('#button-shipping-address').trigger('click');
      }, 500);
      $('a[href=\'#collapse-shipping-method\']').trigger('click');
    }
  });
};

$(document).ready(function() {
  $('#shipping_address_city').bind('typeahead:select', function() {
    $(this).trigger('change');
  });
});
