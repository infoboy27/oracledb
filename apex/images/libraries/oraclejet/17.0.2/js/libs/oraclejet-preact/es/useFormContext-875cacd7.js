/* @oracle/oraclejet-preact: undefined */
import { useContext } from 'preact/hooks';
import { F as FormContext, D as DefaultFormContext } from './FormContext-4d71f9c7.js';

/**
 * Utility hook for consuming the FormContext
 *
 * @returns The value of closest FormContext provider
 */
function useFormContext() {
    const context = useContext(FormContext);
    // merge the returned context into the default context so that all props are specified
    const contextWithDefaults = Object.assign({}, DefaultFormContext, context);
    return contextWithDefaults;
}

export { useFormContext as u };
//# sourceMappingURL=useFormContext-875cacd7.js.map
