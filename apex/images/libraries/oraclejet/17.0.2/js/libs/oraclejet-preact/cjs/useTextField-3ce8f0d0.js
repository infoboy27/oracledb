/* @oracle/oraclejet-preact: undefined */
'use strict';

var useMessageSeverity = require('./useMessageSeverity-cfc4ae9d.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');
var useFocusWithin = require('./useFocusWithin-eb7f956a.js');
var useFormFieldContextProps = require('./useFormFieldContextProps-8c04ed0f.js');
var useId = require('./useId-6c0eeb27.js');

/**
 * A custom hook to determine the props for a component that renders
 * a text field
 */
function useTextField({ ariaDescribedBy, contentVariant, helpSourceLink, helpSourceText, isDisabled, isFocused, isLoading, isReadonly, isRequiredShown, labelEdge, messages, styleVariant, userAssistanceDensity, value }) {
    const baseId = useId.useId();
    const labelId = labelEdge !== 'none' ? `${baseId}-label` : undefined;
    const inputId = !isReadonly ? `${baseId}-input` : undefined;
    const uaId = !(isDisabled || isReadonly) ? `${baseId}-ua` : undefined;
    const helpIconId = userAssistanceDensity === 'compact' ? `${baseId}-helpIcon` : undefined;
    const { focusProps, isFocused: isInputFocused } = useFocusWithin.useFocusWithin({ isDisabled });
    const hasValue = value !== undefined && (typeof value !== 'string' || value !== '');
    // Create the form field context
    const formFieldContext = useFormFieldContextProps.useFormFieldContextProps({
        hasValue,
        isDisabled,
        isFocused,
        isInputFocused,
        isLoading,
        isReadonly
    });
    // Determine the highest severity from the messages
    const messageSeverity = useMessageSeverity.useMessageSeverity(messages);
    // Determine the label variant
    const labelVariant = labelEdge !== 'none' ? labelEdge : undefined;
    return {
        baseId,
        formFieldContext,
        inputProps: {
            id: inputId,
            'aria-describedby': stringUtils.merge([helpIconId, uaId, ariaDescribedBy]),
            'aria-invalid': messageSeverity === 'error'
                ? 'true'
                : undefined,
            variant: styleVariant,
            onBlur: focusProps?.onFocusOut,
            onFocus: focusProps?.onFocusIn
        },
        labelProps: {
            forId: inputId,
            helpIconId,
            helpSourceLink,
            helpSourceText,
            id: labelId,
            isRequiredShown,
            userAssistanceDensity,
            variant: labelVariant
        },
        textFieldProps: {
            contentVariant,
            statusVariant: /error|warning/.test(messageSeverity ?? '')
                ? messageSeverity
                : undefined,
            styleVariant
        },
        userAssistanceProps: {
            id: uaId
        }
    };
}

exports.useTextField = useTextField;
//# sourceMappingURL=useTextField-3ce8f0d0.js.map
