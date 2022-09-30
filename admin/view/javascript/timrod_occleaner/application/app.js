'use strict';

(function (timrod, $, undefined) {
	timrod.app = {};

	let config = {
		plugins: [],
	};

	function initProgress() {
		NProgress.configure({
			parent: '.app-container',
			showSpinner: false,
		});
	}

	function initParams() {
		// Nodes init
		timrod.node.set('app', '.timrod-app');
		timrod.node.set('container', '.timrod-app > .app-container');
		timrod.node.set('loader', '.app-loader');
		timrod.node.set('menu', '.app-menu');

		// Noty override default settings
		Noty.overrideDefaults({
			layout: 'topRight',
			theme: 'metroui',
			timeout: 5000,
			progressBar: true,
		});

		// Other params
		timrod.data.set('last_loaded_url', $('.app-menu > .app-menu__link_active > a').attr('href'));
		timrod.data.set('state_menu', true);

		// JS Data
		timrod.data.loadFromJSData();
	}

	function initLayout() {
		// Toggle menu
		timrod.node.get('app').on('click', '[data-event="toggleMenu"]', () => {
			if ($(window).width() <= 767) {
				timrod.node.get('menu').toggleClass('app-menu_mobile_open');
			} else {
				timrod.node.get('menu').toggleClass('app-menu_open');
				timrod.data.set('state_menu', timrod.node.get('menu').hasClass('app-menu_open'));
			}
		});

		// Close menu on mobile
		timrod.node.get('app').on('click', '.app-content', () => {
			$(window).width() <= 767 && timrod.node.get('menu').removeClass('app-menu_mobile_open');
		});

		// Toggle fullscreen
		timrod.node.get('app').attr('style', 'margin-left: 0 !important'); // Opencart RS fix
		
		timrod.node.get('app').on('click', '[data-event="toggleFullscreen"]', function () {
			timrod.node.get('app').toggleClass('timrod-app_expanded');

			// Opencart RS fix
			if (timrod.node.get('app').hasClass('timrod-app_expanded')) {
				timrod.node.get('app').attr('style', 'margin-left: 0 !important');
			} else {
				timrod.node.get('app').attr('style', '');
			}

			let icon = $(this).find('span').text();

			$(this)
				.find('span')
				.text(icon === 'fullscreen' ? 'fullscreen_exit' : 'fullscreen');

			$('#header, #column-left, #footer').slideToggle('');
		});

		// Router
		timrod.node.get('app').on('click', 'a[href*="index.php"]:not([data-route="skip"])', async function (e) {
			e.preventDefault();

			NProgress.start();

			await loadContent($(this).attr('href'));

			NProgress.done();
		});

		// Form submit
		timrod.node.get('app').on('click', 'button[type="button"][form]', async function (e) {
			e.preventDefault();

			NProgress.start();

			let form = $(e.currentTarget.form);
			let formAction = $(this).attr('formaction') || form.attr('action');

			if (form.length) {
				if ($(this).attr('data-confirm')) {
					$.confirm({
						title: '<span class="material-icons">warning</span>',
						content: $(this).attr('data-confirm'),
						theme: 'supervan',
						draggable: false,
						closeIcon: true,
						escapeKey: 'cancel',
						backgroundDismiss: false,
						buttons: {
							cancel: {
								text: $(this).attr('data-text-cancel'),
							},
							confirm: {
								text: $(this).attr('data-text-confirm'),
								action: async () => {
									await loadContent(formAction, form.serialize());
								},
							},
						},
					});
				} else {
					await loadContent(formAction, form.serialize());
				}
			}

			NProgress.done();
		});
	}

	function initEvents() {
		// Loader hide
		timrod.event.subscribe('app.loader.hide', () => {
			timrod.node.get('loader').fadeOut(300);
		});

		// Loader show
		timrod.event.subscribe('app.loader.show', () => {
			timrod.node.get('loader').fadeIn(300);
		});

		// Layout update
		timrod.event.subscribe('app.layout.update', () => {
			// Update nodes
			timrod.node.update('loader');
			timrod.node.update('menu');
			timrod.node.update('container');

			// Highlight Form Errors
			timrod.node
				.get('app')
				.find('.form-group .text-danger')
				.each(function () {
					$(this).parent().parent().addClass('has-error');
				});

			// Restore state menu
			timrod.node.get('menu').toggleClass('app-menu_open', timrod.data.get('state_menu'));

			// Reactivate Plugins
			timrod.plugins.attachList(config.plugins);

			// Range slider
			timrod.node.get('app').find('.js-range-slider').ionRangeSlider();

			// Clipboard
			new ClipboardJS('.js-clipboard');

			// Tooltip
			timrod.node.get('app').find('[data-toggle="tooltip"]').tooltip({container: 'body',html: true});
		});
	}

	async function loadContent(url, formData = '') {
		let response;

		if (formData) {
			response = await fetch(url, {
				method: 'post',
				headers: {
					'Content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
				},
				body: formData,
			});
		} else {
			response = await fetch(url);
			timrod.data.set('last_loaded_url', url);
		}

		let result = await response.text();

		timrod.node.get('container').replaceWith(result);

		timrod.event.trigger('app.layout.update');

		return response;
	}

	async function start() {
		$('#header, #column-left, #footer').hide();

		initProgress();
		NProgress.start();

		initParams();
		initLayout();
		initEvents();

		await loadContent(timrod.data.get('last_loaded_url'));

		NProgress.done();
		timrod.event.trigger('app.start');
		timrod.event.trigger('app.loader.hide');
	}

	timrod.app.setConfig = function (data = {}) {
		$.each(config, (key, value) => {
			config[key] = data[key] || config[key];
		});
	};

	timrod.app.startApplication = function () {
		$(document).ready(() => {
			start();
		});
	};

	timrod.app.reloadContent = function (data = '') {
		return loadContent(timrod.data.get('last_loaded_url'), data);
	};

	timrod.app.loadContent = function (url = '', formData = '') {
		return loadContent(url, formData);
	};

	timrod.app.confirm = function (el, callback) {
		if ($(el).attr('data-confirm')) {
			$.confirm({
				title: '<span class="material-icons">warning</span>',
				content: $(el).attr('data-confirm'),
				theme: 'supervan',
				draggable: false,
				closeIcon: true,
				escapeKey: 'cancel',
				backgroundDismiss: false,
				buttons: {
					cancel: {
						text: $(el).attr('data-text-cancel'),
					},
					confirm: {
						text: $(el).attr('data-text-confirm'),
						action: () => {
							callback();
						},
					},
				},
			});
		}
	};
})((window.timrod = window.timrod || {}), jQuery);
