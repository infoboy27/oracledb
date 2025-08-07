'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var virtual_Common = require('./Common');
var virtual_themes = require('./themes');



Object.keys(virtual_Common).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return virtual_Common[k]; }
	});
});
Object.keys(virtual_themes).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return virtual_themes[k]; }
	});
});
