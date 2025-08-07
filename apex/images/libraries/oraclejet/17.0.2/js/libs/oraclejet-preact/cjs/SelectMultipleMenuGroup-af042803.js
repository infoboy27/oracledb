/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var SelectMenuGroupContext = require('./SelectMenuGroupContext-bbb4f7e0.js');

function SelectMultipleMenuGroup({ value, onCommit, children }) {
    return (jsxRuntime.jsx(SelectMenuGroupContext.SelectMenuGroupContext.Provider, { value: { isMultiple: true, value, onCommit }, children: children }));
}

exports.SelectMultipleMenuGroup = SelectMultipleMenuGroup;
//# sourceMappingURL=SelectMultipleMenuGroup-af042803.js.map
