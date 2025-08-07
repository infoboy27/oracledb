/* @oracle/oraclejet-preact: undefined */
import { u as useMessageSeverity } from './useMessageSeverity-65295e8f.js';
import { m as merge } from './stringUtils-16f617bc.js';
import { u as useFocusWithin } from './useFocusWithin-30b1e2d8.js';
import { u as useFormFieldContextProps } from './useFormFieldContextProps-d07cd618.js';
import { u as useId } from './useId-03dbfdf0.js';

/**
 * A custom hook to determine the props for a component that renders
 * a text field
 */
function useTextField({ ariaDescribedBy, contentVariant, helpSourceLink, helpSourceText, isDisabled, isFocused, isLoading, isReadonly, isRequiredShown, labelEdge, messages, styleVariant, userAssistanceDensity, value }) {
    const baseId = useId();
    const labelId = labelEdge !== 'none' ? `${baseId}-label` : undefined;
    const inputId = !isReadonly ? `${baseId}-input` : undefined;
    const uaId = !(isDisabled || isReadonly) ? `${baseId}-ua` : undefined;
    const helpIconId = userAssistanceDensity === 'compact' ? `${baseId}-helpIcon` : undefined;
    const { focusProps, isFocused: isInputFocused } = useFocusWithin({ isDisabled });
    const hasValue = value !== undefined && (typeof value !== 'string' || value !== '');
    // Create the form field context
    const formFieldContext = useFormFieldContextProps({
        hasValue,
        isDisabled,
        isFocused,
        isInputFocused,
        isLoading,
        isReadonly
    });
    // Determine the highest severity from the messages
    const messageSeverity = useMessageSeverity(messages);
    // Determine the label variant
    const labelVariant = labelEdge !== 'none' ? labelEdge : undefined;
    return {
        baseId,
        formFieldContext,
        inputProps: {
            id: inputId,
            'aria-describedby': merge([helpIconId, uaId, ariaDescribedBy]),
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

export { useTextField as u };
//# sourceMappingURL=useTextField-f57cfb8d.js.map
