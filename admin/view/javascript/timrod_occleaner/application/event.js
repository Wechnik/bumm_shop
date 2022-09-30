'use strict';

(function (timrod, $, undefined) {
	timrod.event = {};

	let data = [];

	timrod.event.subscribe = function (event, action) {
		data[event] = data[event] || [];
		data[event].push(action);
	};

	timrod.event.trigger = function (event) {
		data[event].forEach(function (action, i, data) {
			action();
		});
	};
})((window.timrod = window.timrod || {}), jQuery);
