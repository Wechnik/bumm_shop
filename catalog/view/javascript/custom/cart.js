const custom_cart = {
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=extension/module/custom/cart/update',
			type: 'post',
			data: 'key=' + key + '&quantity=' + quantity + '&event=update',
			dataType: 'json',
			beforeSend: function(){

				$('.alert').remove();
				$('[role="tooltip"]').remove();

			},
			success: function(json) {

				console.log(json)

				if (json['empty']){
					location.reload();
				}

				custom_block.render('cart');
				custom_block.render('total');
				custom_block.render('shipping');
				custom_block.render('payment');

				if (json['total']){
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}

				if (json['error']){

					json['error'].forEach(function(error){
						$('.breadcrumb').after('<div class="alert alert-warning">' + error + '</div>')
					});

				}

				$('#custom-cart [data-cart-id=' + key + ']').focus();
				
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=extension/module/custom/cart/update',
			type: 'post',
			data: 'key=' + key + '&event=remove',
			dataType: 'json',
			beforeSend: function(){

				$('.alert').remove();
				$('[role="tooltip"]').remove();

			},
			success: function(json) {

				console.log(json)

				if (json['empty']){
					location.reload();
				}

				custom_block.render('cart');
				custom_block.render('total');
				custom_block.render('shipping');
				custom_block.render('payment');

				if (json['total']){
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}

				if (json['error']){

					json['error'].forEach(function(error){
						$('.breadcrumb').after('<div class="alert alert-warning">' + error + '</div>')
					});

				}
				
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}
