/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var SelectMenuGroupContext = require('./SelectMenuGroupContext-bbb4f7e0.js');

function SelectSingleMenuGroup({ value, onCommit, children }) {
    return (jsxRuntime.jsx(SelectMenuGroupContext.SelectMenuGroupContext.Provider, { value: { isMultiple: false, value, onCommit }, children: children }));
}

exports.SelectSingleMenuGroup = SelectSingleMenuGroup;
//# sourceMappingURL=SelectSingleMenuGroup-c4fda1f5.js.map
