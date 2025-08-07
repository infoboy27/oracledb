/* @oracle/oraclejet-preact: undefined */
'use strict';

var preact = require('preact');

/**
 * Context which the parent component can use to provide various FormControl related
 * information
 */
const FormFieldContext = preact.createContext({
    hasValue: false,
    isDisabled: false,
    isFocused: false,
    isInputFocused: false,
    isLoading: false,
    isReadonly: false
});

exports.FormFieldContext = FormFieldContext;
//# sourceMappingURL=FormFieldContext-8418dc68.js.map
