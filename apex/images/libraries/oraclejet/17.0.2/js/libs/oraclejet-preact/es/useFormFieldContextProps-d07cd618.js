/* @oracle/oraclejet-preact: undefined */
import { useMemo } from 'preact/hooks';

/**
 * A custom hook to determine props to set FormFieldContext
 */
function useFormFieldContextProps({ hasValue, isDisabled, isFocused, isInputFocused, isLoading, isReadonly }) {
    return useMemo(() => {
        return isReadonly
            ? {
                hasValue,
                isFocused,
                isInputFocused,
                isLoading,
                isReadonly: true
            }
            : isDisabled
                ? {
                    hasValue,
                    isDisabled: true,
                    isLoading
                }
                : {
                    hasValue,
                    isFocused,
                    isInputFocused,
                    isLoading
                };
    }, [hasValue, isDisabled, isFocused, isInputFocused, isLoading, isReadonly]);
}

export { useFormFieldContextProps as u };
//# sourceMappingURL=useFormFieldContextProps-d07cd618.js.map
