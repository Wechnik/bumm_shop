(function (timrod, $, undefined) {
	timrod.occleaner = {};

	async function _fetch(url) {
		const response = await fetch(url);

		if (!response.ok) {
			throw new Error('Network request error occurred');
		}

		const json = await response.json();

		if (json.status) {
			return json;
		} else {
			throw new Error('The controller returned incorrect data!');
		}
	}

	async function multiFetch(url) {
		json = await _fetch(url);

		$('.app-loader__text').text(json.text_next_step || '');

		if (json.status === 'next') {
			await multiFetch(url);
		}
	}

	let request = async function (method, task) {
		NProgress.start();
		timrod.event.trigger('app.loader.show');

		try {
			if (method === 'deleteAll') {
				await multiFetch(timrod.utils.makeUrl({ method: 'deleteAll', args: { task: task } }));
			}

			if (method === 'scan') {
				await multiFetch(timrod.utils.makeUrl({ method: 'scanning', args: { task: task } }));
			}

			await timrod.app.reloadContent();
		} catch (error) {
			await timrod.app.reloadContent();
			new Noty({ type: 'error', text: 'A request error has occurred. Details in the browser console.' }).show();
			console.log(error);
		}

		NProgress.done();
		timrod.event.trigger('app.loader.hide');
	};

	function init() {
		timrod.node.get('app').on('click', '[data-event="scan"]', function (e) {
			let task = $('input[name="task"]').val();
			request('scan', task);
		});

		timrod.node.get('app').on('click', '[data-event="deleteAll"]', function (e) {
			let task = $('input[name="task"]').val();
			timrod.app.confirm(this, request.bind(this, 'deleteAll', task));
		});

		timrod.node.get('app').on('change', 'select[name="list_type"]', async function (e) {
			NProgress.start();
			$(this).prop('disabled', true);

			let searchParams = new URLSearchParams(timrod.data.get('last_loaded_url'));

			searchParams.set('list_type', $(this).find('option:selected').val());
			searchParams.delete('page');

			await timrod.app.loadContent(decodeURIComponent(searchParams.toString()));

			NProgress.done();
			$(this).prop('disabled', false);
		});

		timrod.node.get('app').on('change', 'select[name="task"]', async function (e) {
			NProgress.start();
			$(this).prop('disabled', true);

			let searchParams = new URLSearchParams(timrod.data.get('last_loaded_url'));

			searchParams.set('task', $(this).find('option:selected').val());
			searchParams.delete('page');

			await timrod.app.loadContent(decodeURIComponent(searchParams.toString()));

			NProgress.done();
			$(this).prop('disabled', false);
		});

		timrod.node.get('app').on('change', 'select[name="limit"]', async function (e) {
			NProgress.start();
			$(this).prop('disabled', true);

			let searchParams = new URLSearchParams(timrod.data.get('last_loaded_url'));

			searchParams.set('limit', $(this).find('option:selected').val());
			searchParams.delete('page');

			await timrod.app.loadContent(decodeURIComponent(searchParams.toString()));

			NProgress.done();
			$(this).prop('disabled', false);
		});

		timrod.node.get('app').on('keypress', 'input[name="search"]', async function (e) {
			if (e.keyCode === 13) {
				e.preventDefault();

				NProgress.start();
				$(this).prop('readonly', true);

				let searchParams = new URLSearchParams(timrod.data.get('last_loaded_url'));

				if ($(this).val()) {
					searchParams.set('search', $(this).val());
				} else {
					searchParams.delete('search');
				}

				searchParams.delete('page');

				await timrod.app.loadContent(decodeURIComponent(searchParams.toString()));

				NProgress.done();
				$(this).prop('readonly', false);
			}
		});

		timrod.node.get('app').on('click', '.image-grid > .image-wrapper > input[type="checkbox"]', function (e) {
			$(this).parents('.image-wrapper').toggleClass('image-wrapper_active', $(this).prop('checked'));
		});

		timrod.node.get('app').on('click', '.image-grid > .image-wrapper > .image-filename', function (e) {
			$(this).siblings('input[type="checkbox"]').trigger('click');
		});

		timrod.node.get('app').on('click', '[data-event="selectAll"]', function (e) {
			let status = timrod.node.get('app').find('form input[type="checkbox"]').prop('checked');
			timrod.node.get('app').find('form input[type="checkbox"]').prop('checked', !status);
			timrod.node.get('app').find('.image-wrapper').toggleClass('image-wrapper_active', !status);
		});

		timrod.node.get('app').on('show.bs.modal', '#image-details', function (e) {
			let button = $(e.relatedTarget);
			let path = button.data('path');
			let size = button.data('size');
			let filename = button.data('filename');

			let modal = $(this);
			modal.find('#image-details__filename').text(filename);
			modal.find('#image-details__size').text(size);
			modal.find('#image-details__path').text(path);
		});

		timrod.node
			.get('app')
			.on(
				'propertychange input',
				'input[name="module_timrod_occleaner_protect_url_key"], input[name="module_timrod_occleaner_protect_url_value"]',
				function (e) {
					let key = timrod.node
							.get('app')
							.find('input[name="module_timrod_occleaner_protect_url_key"]')
							.val(),
						value = timrod.node
							.get('app')
							.find('input[name="module_timrod_occleaner_protect_url_value"]')
							.val();

					timrod.node
						.get('app')
						.find('#secure-link')
						.val(timrod.data.get('http_host') + '/admin/?' + key + '=' + value);
				}
			);

		// Add IP address
		timrod.node.get('app').on('keypress', '#input_add_ip', function (e) {
			if (e.which === 13) {
				let value = $(this).val().replace(/\s+/g, '');

				let list = $('#allowed_ip_list input').map(function () {
					return $(this).val();
				});

				valid = /^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$/.test(value);

				if (valid) {
					if ($.inArray(value, list) === -1) {
						$('#allowed_ip_list').append(`
							<div class="input-group input-group-sm">
								<input type="text" name="module_timrod_occleaner_ip_blocking_white_list[]"  value="${value}" class="form-control" readonly />
								<span class="input-group-btn">
									<button class="btn btn-danger" type="button" data-event="deleteInputGroup"><i class="fa fa-minus-circle"></i></button>
								</span>
							</div>
						`);
					}

					$(this).val('');
					$(this).parents('.form-group').removeClass('has-error');
					$(this).siblings('.text-danger').remove();
				} else {
					$(this).parents('.form-group').addClass('has-error');
				}
			}
		});

		timrod.node.get('app').on('click', '[data-event="deleteInputGroup"]', function (e) {
			$(this).parents('.input-group').remove();
		});

		timrod.node.get('app').on('click', '[data-event="rememberBrowser"]', async function (e) {
			await _fetch(timrod.utils.makeUrl({ method: 'rememberBrowser' }));
			timrod.app.reloadContent();
		});

		timrod.node.get('app').on('keypress', '[name="module_timrod_occleaner_lck"]', function (e) {
			if (e.which === 13) {
				e.preventDefault();
				timrod.node.get('app').find('button[form="form-page"]').trigger('click');
			}
		});

	}

	function imageGridSize() {
		setTimeout(() => {
			let width = timrod.node.get('app').find('.image-grid > .image-wrapper').width();
			if (width) {
				width = $(window).width() <= 767 ? width * 0.9 : width;
				timrod.node.get('app').find('.image-grid > .image-wrapper').height(width);
			}
		}, 200);
	}

	function showWelcomeDialog() {
		if (timrod.data.get('module_timrod_occleaner_welcome_dialog_status') === '1') {
			setTimeout(() => {
				$.confirm({
					title: timrod.data.get('text_welcome_dialog_title'),
					content: timrod.data.get('text_welcome_dialog_content'),
					columnClass: 'col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1',
					theme: 'material',
					type: 'blue',
					draggable: false,
					closeIcon: true,
					escapeKey: 'cancel',
					backgroundDismiss: false,
					buttons: {
						ok: {
							text: timrod.data.get('text_welcome_dialog_ok'),
							action: () => {
								_fetch(timrod.utils.makeUrl({ method: 'hideWelcomeDialog' }))
							},
						},
					},
				});
			}, 500);
		}		
	}

	timrod.occleaner.start = function () {
		timrod.event.subscribe('app.start', init);
		timrod.event.subscribe('app.layout.update', imageGridSize);		

		timrod.app.setConfig({
			plugins: ['toggelReadonly', 'insertTo'],
		});
		timrod.app.startApplication();

		$(window).resize(function () {
			imageGridSize();
		});

		$(window).ready(function () {
			showWelcomeDialog();
		});
	};
})((window.timrod = window.timrod || {}), jQuery);

timrod.occleaner.start();
