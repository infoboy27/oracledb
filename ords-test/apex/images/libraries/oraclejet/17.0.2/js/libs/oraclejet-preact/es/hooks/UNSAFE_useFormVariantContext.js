/* @oracle/oraclejet-preact: undefined */
import { createContext } from 'preact';
import { useContext } from 'preact/hooks';

/**
 * Context which an ancestor component can use to provide a value for the 'variant' property
 * of the descendant form fields.
 */
const FormVariantContext = createContext('default');

/**
 * Utility hook for consuming the FormVariantContext
 *
 * @returns The value of the closest FormVariantContext provider
 */
function useFormVariantContext() {
    return useContext(FormVariantContext);
}

export { FormVariantContext, useFormVariantContext };
//# sourceMappingURL=UNSAFE_useFormVariantContext.js.map
