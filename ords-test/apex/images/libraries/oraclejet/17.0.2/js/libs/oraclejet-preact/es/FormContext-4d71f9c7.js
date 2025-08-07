/* @oracle/oraclejet-preact: undefined */
import { createContext } from 'preact';

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
const FormContext = createContext(DefaultFormContext);

export { DefaultFormContext as D, FormContext as F };
//# sourceMappingURL=FormContext-4d71f9c7.js.map
