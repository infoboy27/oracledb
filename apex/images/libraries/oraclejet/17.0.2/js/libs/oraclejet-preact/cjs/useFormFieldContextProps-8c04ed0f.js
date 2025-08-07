/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');

/**
 * A custom hook to determine props to set FormFieldContext
 */
function useFormFieldContextProps({ hasValue, isDisabled, isFocused, isInputFocused, isLoading, isReadonly }) {
    return hooks.useMemo(() => {
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

exports.useFormFieldContextProps = useFormFieldContextProps;
//# sourceMappingURL=useFormFieldContextProps-8c04ed0f.js.map
