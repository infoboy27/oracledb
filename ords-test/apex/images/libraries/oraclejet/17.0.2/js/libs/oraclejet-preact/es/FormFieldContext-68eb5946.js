/* @oracle/oraclejet-preact: undefined */
import { createContext } from 'preact';

/**
 * Context which the parent component can use to provide various FormControl related
 * information
 */
const FormFieldContext = createContext({
    hasValue: false,
    isDisabled: false,
    isFocused: false,
    isInputFocused: false,
    isLoading: false,
    isReadonly: false
});

export { FormFieldContext as F };
//# sourceMappingURL=FormFieldContext-68eb5946.js.map
