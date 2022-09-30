'use strict';

(function (timrod, $, undefined) {
    timrod.utils = {};

    timrod.utils.makeUrl = function (params = {}) {

        let data_module_route = timrod.data ? timrod.data.get('module_route') : '';
        let data_token_string = timrod.data ? timrod.data.get('token_string') : '';

        let route = params.route || data_module_route || getURLVar('route');
        let method = params.method ? '/' + params.method : '';

        let tokenName = getURLVar('token') ? 'token' : 'user_token';
        let token = data_token_string || tokenName + '=' + getURLVar(tokenName);

        let args = '';

        if (params.args) {
            for (var name in params.args) {
                args += '&' + name + '=' + params.args[name];
            }
        }

        return 'index.php?route=' + route + method + '&' + token + args;
    };

    timrod.utils.fetch = async function (url, data = {}, responseFormat = 'response') {
        let response;

        let body = '';

        if(data) {
            if (typeof data === 'string') {
                if ($(data).length) {
                    body = new FormData($(data)[0]);
                }
            }

            if (typeof data === 'object') {
                body = new FormData();

                for (let key in data ) {
                    body.append(key, data[key]);
                }
            }
        }

        if (body) {
            response = await fetch(url, {
                method: 'POST',
                body: body,
            });
        } else {
            response = await fetch(url);
        }

        if (!response.ok) {
            throw new Error(`Error at ${url}, error status ${response.status}`);
        }

        let result;

        switch (responseFormat) {
            case "json":
                result = await response.json();
                break;
            case "text":
                result = await response.text();
                break;
            case "response":
            default:
                result = response;
        }

        return result;
    }

    timrod.utils.multiFetch = async function (url, data = {}) {
        let result = await timrod.utils.fetch(url, data, 'json');

        if (result.status === 'next') {
            timrod.event.trigger('utils.mFetch.next');
            await timrod.utils.multiFetch(url, data);
        }

        timrod.event.trigger('utils.mFetch.done');
    }

})((window.timrod = window.timrod || {}), jQuery);
