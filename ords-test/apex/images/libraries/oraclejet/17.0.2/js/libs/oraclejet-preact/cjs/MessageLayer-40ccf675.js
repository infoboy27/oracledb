/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Flex = require('./Flex-fbba4ad6.js');
var WindowOverlay = require('./WindowOverlay-d255542f.js');
var useUser = require('./useUser-a6d15333.js');
var Layer = require('./Layer-3700cd37.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');

const positions = [
    'top',
    'top-left',
    'top-right',
    'top-start',
    'top-end',
    'bottom',
    'bottom-left',
    'bottom-right',
    'bottom-start',
    'bottom-end'
];
const MessageLayer = ({ children, offset, testId, position = 'bottom' }) => {
    const side = position.split('-')[0];
    let windowOverlayOffset;
    if (typeof offset === 'number') {
        windowOverlayOffset = { mainAxis: offset, crossAxis: offset };
    }
    else if (side == 'top' || side == 'bottom') {
        windowOverlayOffset = { mainAxis: offset?.vertical, crossAxis: offset?.horizontal };
    }
    else {
        windowOverlayOffset = { mainAxis: offset?.horizontal, crossAxis: offset?.vertical };
    }
    const { direction } = useUser.useUser();
    const isLtr = direction === 'ltr';
    let windowOverlayPlacement;
    switch (position) {
        case 'top-left':
            windowOverlayPlacement = isLtr ? 'top-start' : 'top-end';
            break;
        case 'top-right':
            windowOverlayPlacement = isLtr ? 'top-end' : 'top-start';
            break;
        case 'bottom-left':
            windowOverlayPlacement = isLtr ? 'bottom-start' : 'bottom-end';
            break;
        case 'bottom-right':
            windowOverlayPlacement = isLtr ? 'bottom-end' : 'bottom-start';
            break;
        default:
            windowOverlayPlacement = position;
            break;
    }
    return (jsxRuntime.jsx(Layer.Layer, { priority: "messages", level: "topLevel", children: jsxRuntime.jsx(WindowOverlay.WindowOverlay, { placement: windowOverlayPlacement, offset: windowOverlayOffset, children: jsxRuntime.jsx("div", { "data-testid": testId, children: jsxRuntime.jsx(Flex.Flex, { direction: "column", gap: "2x", children: children }) }) }) }));
};

exports.MessageLayer = MessageLayer;
exports.positions = positions;
//# sourceMappingURL=MessageLayer-40ccf675.js.map
