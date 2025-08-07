/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');

/**
 * An empty list.
 */
const EmptyList = ({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby, children }) => {
    return (jsxRuntime.jsx("div", { role: "grid", "aria-rowcount": 0, tabIndex: 0, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, children: jsxRuntime.jsx("div", { role: "row", children: jsxRuntime.jsx("div", { role: "gridcell", children: children }) }) }));
};

exports.EmptyList = EmptyList;
//# sourceMappingURL=EmptyList-46b826b2.js.map
