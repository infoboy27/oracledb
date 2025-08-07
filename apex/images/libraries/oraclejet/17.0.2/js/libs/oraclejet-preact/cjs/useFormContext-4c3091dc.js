/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var FormContext = require('./FormContext-9452bd30.js');

/**
 * Utility hook for consuming the FormContext
 *
 * @returns The value of closest FormContext provider
 */
function useFormContext() {
    const context = hooks.useContext(FormContext.FormContext);
    // merge the returned context into the default context so that all props are specified
    const contextWithDefaults = Object.assign({}, FormContext.DefaultFormContext, context);
    return contextWithDefaults;
}

exports.useFormContext = useFormContext;
//# sourceMappingURL=useFormContext-4c3091dc.js.map
