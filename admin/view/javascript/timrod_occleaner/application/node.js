'use strict';

(function (timrod, $, undefined) {
	timrod.node = {};

	let list = new Map();

	timrod.node.set = function (name, selector) {
		list.set(name, { selector: selector, node: $(selector) });
	};

	timrod.node.update = function (name) {
		let selector = list.get(name).selector;
		timrod.node.set(name, selector);
	};

	timrod.node.UpdateAll = function () {
		list.forEach((node, name) => {
			timrod.node.update(name);
		});
	};

	timrod.node.get = function (name) {
		return list.get(name).node;
	};
})((window.timrod = window.timrod || {}), jQuery);
