/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var preact = require('preact');
var hooks = require('preact/hooks');

/**
 * Context which an ancestor component can use to provide a value for the 'variant' property
 * of the descendant form fields.
 */
const FormVariantContext = preact.createContext('default');

/**
 * Utility hook for consuming the FormVariantContext
 *
 * @returns The value of the closest FormVariantContext provider
 */
function useFormVariantContext() {
    return hooks.useContext(FormVariantContext);
}

exports.FormVariantContext = FormVariantContext;
exports.useFormVariantContext = useFormVariantContext;
//# sourceMappingURL=UNSAFE_useFormVariantContext.js.map
