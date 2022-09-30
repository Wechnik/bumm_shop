var c6v_cities = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: 'index.php?route=tool/c6v/getCities',
});

function c6v_init() {
  $('.form-group > div > .typeahead,.form-group > .typeahead,#input-payment-city,#input-shipping-city').typeahead({
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

$(document).ready(function() {
  c6v_init();
});
