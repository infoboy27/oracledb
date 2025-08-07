/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var List = require('./List-bd9ecebb.js');

/**
 * Component that renders items as a flat list.
 * In order to maximize performance, only items that are visible in the viewport are rendered.
 */
function VirtualizedListView(props) {
    return (jsxRuntime.jsx(List.List, { isVirtualized: true, ...props, children: props.children }));
}

exports.VirtualizedListView = VirtualizedListView;
//# sourceMappingURL=VirtualizedListView-a07fe73b.js.map
