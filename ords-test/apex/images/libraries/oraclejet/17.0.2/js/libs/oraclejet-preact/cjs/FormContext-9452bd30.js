/* @oracle/oraclejet-preact: undefined */
'use strict';

var preact = require('preact');

const DefaultFormContext = {
    isDisabled: false,
    isFormLayout: false,
    isReadonly: false,
    labelEdge: 'inside',
    labelStartWidth: '33%',
    labelWrapping: 'wrap',
    textAlign: 'start',
    userAssistanceDensity: 'reflow'
};
/**
 * Context which the parent component can use to provide various FormLayout related
 * information to descendant form controls.
 */
const FormContext = preact.createContext(DefaultFormContext);

exports.DefaultFormContext = DefaultFormContext;
exports.FormContext = FormContext;
//# sourceMappingURL=FormContext-9452bd30.js.map
