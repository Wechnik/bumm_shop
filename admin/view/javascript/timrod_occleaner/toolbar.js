'use strict';

(function (timrod, $, undefined) {
	timrod.occleaner_toolbar = {};

	function addToolbarButton() {
		let height = $('#header').height();
		let header = $('#header ul.nav:last');

		header.prepend(
			`<li class="dropdown" id="occleaner_toolbar">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height:${height}px">
                    <img src="view/image/timrod_occleaner/baseline_cleaning_services_black_48dp.png" style="height:50%" />
                </a>        
                <ul id="occleaner_toolbar_content" class="dropdown-menu dropdown-menu-right"></ul>
            </li>`
		);
	}

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
		let json = await _fetch(url);

		$('.app-loader__text').text(json.text_next_step || '');

		if (json.status === 'next') {
			await multiFetch(url);
		}
	}

	let request = async function (method, data) {
		try {
			if (method === 'fastClean') {
				$('#occleaner_toolbar').find('.progress-bar').width('0%');
				$('#occleaner_toolbar').find(`[data-task="${data}"] > i`).addClass('hidden');

				await multiFetch(
					timrod.utils.makeUrl({
						method: 'scanning',
						route: 'extension/module/timrod_occleaner',
						args: { task: data },
					})
				);

				$('#occleaner_toolbar').find('.progress-bar').width('50%');

				await multiFetch(
					timrod.utils.makeUrl({
						method: 'deleteAll',
						route: 'extension/module/timrod_occleaner',
						args: { task: data },
					})
				);

				setTimeout(function () {
					$('#occleaner_toolbar').find('.progress-bar').width('100%');
					$('#occleaner_toolbar').find(`[data-task="${data}"] > i`).removeClass('hidden');
				}, 500);

				setTimeout(function () {
					$('#occleaner_toolbar').find('.progress-bar').width('0');
					$('#occleaner_toolbar').find(`[data-task="${data}"] > i`).addClass('hidden');
				}, 2000);
			}
		} catch (error) {
			console.log(error);
		}
	};

	$(window).ready(function () {
		addToolbarButton();

		$('#occleaner_toolbar').on('show.bs.dropdown', function () {
			let node = $('#occleaner_toolbar_content');
			if (node.is(':empty')) {
				node.load(timrod.utils.makeUrl({ method: 'getToolbar', route: 'extension/module/timrod_occleaner' }));
			}
		});

		$('#occleaner_toolbar').on('click', '[data-event="fastClean"]', function (e) {
			e.stopPropagation();
			e.preventDefault();
			let task = $(this).attr('data-task');
			request('fastClean', task);
		});

		$('#occleaner_toolbar').on('click', '[data-event="refreshModifications"]', async function (e) {
			e.stopPropagation();
			e.preventDefault();
			let url = $(this).attr('href');

			$(this).find('i').addClass('fa-spin');

			const response = await fetch(url);

			setTimeout(() => {
				$(this).find('i').removeClass('fa-spin');
			}, 1000);
		});
	});
})((window.timrod = window.timrod || {}), jQuery);
