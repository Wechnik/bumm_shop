'use strict';

(function (timrod, $, undefined) {
	timrod.data = {};

	let data = new Map();

	timrod.data.get = function (key) {
		return data.get(key);
	};

	timrod.data.getData = function () {
		return data;
	};

	timrod.data.set = function (key, value) {
		data.set(key, value);
	};

	timrod.data.loadFromJSData = function () {
		timrod.jsdata.forEach((v, k) => {
			data.set(k, v);
		});
	};

	timrod.data.load = function (route = '', method = '') {
		return $.ajax({
			url: timrod.utils.makeUrl({ route: route, method: method }),
			type: 'get',
			dataType: 'json',
			success: (json) => {
				if (json) {
					$.each(json, (key, value) => {
						data.set(key, value);
					});
				}
			},
		});
	};
})((window.timrod = window.timrod || {}), jQuery);
