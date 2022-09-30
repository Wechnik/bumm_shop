'use strict';

(function (timrod, $, undefined) {
	timrod.plugins = {};

	let plugins = {
		itemList: function () {
			function controlCheckboxStateUpdate(table) {
				let count = table.querySelectorAll('tbody input[type="checkbox"]').length;
				let checked = table.querySelectorAll('tbody input[type="checkbox"]:checked').length;
				table.querySelectorAll('thead input[type="checkbox"]')[0].checked = !(count > checked || count === 0);
			}

			function itemList() {
				let tables = document.querySelectorAll('table[data-plugin="itemList"]');

				for (let table of tables) {
					// Change state all checkboxes
					let thead_checkbox = table.querySelectorAll('thead input[type="checkbox"]')[0];

					thead_checkbox.addEventListener('click', (event) => {
						let checkboxes = table.querySelectorAll('tbody input[type="checkbox"]');

						for (let item of checkboxes) {
							item.checked = thead_checkbox.checked;
						}
					});

					// Show/hide empty row
					let tableObserver = new MutationObserver((mutationRecords) => {
						let count = table.querySelectorAll('tbody > tr:not(.list-empty)').length;
						table.getElementsByClassName('list-empty')[0].classList.toggle('hidden', count > 0);
					});

					tableObserver.observe(table, {
						childList: true,
						subtree: true,
					});

					// Change state checkboxes
					table.addEventListener('change', (event) => {
						controlCheckboxStateUpdate(table);
					});
				}
			}

			function deleteItemFromList() {
				let buttons = document.querySelectorAll('[data-event="deleteItemFromList"]');

				for (let button of buttons) {
					let target = button.getAttribute('data-target');

					if (target) {
						button.addEventListener('click', (event) => {
							let table = document.getElementById(target.replace('#', ''));

							if (table) {
								let list = table.querySelectorAll('tbody input[type="checkbox"]:checked');
								for (let input of list) {
									input.closest('tr').remove();
								}
								controlCheckboxStateUpdate(table);
							}
						});
					}
				}
			}
		},

		toggelReadonly: function () {			
			let buttons = document.querySelectorAll('.js-toggle-readonly');

			for (let button of buttons) {

				let target = button.getAttribute('data-target').replace('#', '');
				let input = document.getElementById(target);

				if (target) {
					button.addEventListener('click', (e) => {					
						input.removeAttribute('readonly');
						input.focus();
						input.setSelectionRange(input.value.length,input.value.length)
					});
				}

				if (input) {
					input.setAttribute('readonly', '');

					input.addEventListener('focusout', (e) => {					
						input.setAttribute('readonly', '');
					});
				}
			}
		},

		insertTo: function () {
			let buttons = document.querySelectorAll('[data-plugin="insertTo"]');

			for (let button of buttons) {
				let target = button.getAttribute('data-target').replace('#', '');
				target = document.getElementById(target);

				button.addEventListener('click', (e) => {	
					e.preventDefault();				
					target.value = button.innerHTML;
					target.focus();
				});
			}
		}
	};

	timrod.plugins.attach = function (name) {
		if (typeof name === 'string' || name instanceof String) {
			name in plugins && plugins[name]();
		}
	};

	timrod.plugins.attachList = function (list) {
		if (Array.isArray(list)) {
			for (let name of list) {
				timrod.plugins.attach(name);
			}
		}
	};
})((window.timrod = window.timrod || {}), jQuery);
