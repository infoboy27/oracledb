/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { useCallback, useRef } from 'preact/hooks';
import { u as useClearIcon } from './useClearIcon-f0ff8de3.js';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { u as useLengthFilter } from './useLengthFilter-f72f45ac.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';
import { L as Label } from './Label-6674b3f2.js';
import { P as PrefixSuffix } from './PrefixSuffix-73361db2.js';
import { u as usePrefixSuffix } from './usePrefixSuffix-71a410f4.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { u as useId } from './useId-03dbfdf0.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { T as TextFieldInput } from './TextFieldInput-3c39cb7b.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import { T as TextField } from './TextField-323fe0e9.js';
import { M as MaxLengthLiveRegion } from './MaxLengthLiveRegion-cd15b075.js';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import { C as CompactUserAssistance } from './CompactUserAssistance-41c32c6f.js';
import './useTooltipControlled-2044f639.js';
import 'preact';
import './IconStyle.styles.css';
import './Popup-8889a781.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './LayerHost-45f545d7.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { b as beforeVNode } from './componentUtils-4681ea5c.js';
import { C as ClearIcon } from './ClearIcon-f1f796b4.js';
import { u as useCurrentValueReducer } from './useCurrentValueReducer-bdf796fa.js';

/**
 * An input text displays a field that allows a user to enter a text value.
 */
const InputText = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, hasClearIcon = 'never', endContent, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, maxLength, maxLengthUnit, messages, placeholder, prefix, role, startContent, suffix, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', virtualKeyboard, onInput, onCommit, testId }, ref) => {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const formControl_limitReached = maxLength
        ? translations.formControl_limitReached({
            CHARACTER_LIMIT: maxLength
        })
        : '';
    const { currentCommitValue, dispatch } = useCurrentValueReducer({ value });
    const onInputAndDispatch = useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'commit', payload: detail.value });
        onCommit?.(detail);
    }, [onCommit, dispatch]);
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const maxLengthDescribedByIdRef = useRef(useId());
    // The enabledAriaDescribedBy includes the maxLengthDescribedById in addition to what was passed in to aria-describedby.
    // We don't need to announce the max length message for readonly, as it only applies when editing the value.
    const enabledAriaDescribedBy = ariaDescribedBy
        ? `${ariaDescribedBy} ${maxLengthDescribedByIdRef.current}`
        : maxLengthDescribedByIdRef.current;
    const limitMessage = [{ detail: formControl_limitReached, severity: 'info' }];
    // Handle length filter for user-typed inputs and controlled inputs
    const { isMaxLengthReached, valueLength, onFilteredInput } = useLengthFilter({
        maxLength,
        maxLengthUnit,
        value,
        onInput: onInputAndDispatch,
        onCommit: onCommitAndDispatch
    });
    const allMessages = [
        ...(messages ?? []),
        ...(isMaxLengthReached ? limitMessage : [])
    ];
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField({ isDisabled, isReadonly, ref });
    const { hoverProps, isHover } = useHover({ isDisabled: isReadonly || isDisabled || false });
    const { baseId, formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
        ariaDescribedBy: isReadonly || isDisabled ? ariaDescribedBy : enabledAriaDescribedBy,
        helpSourceLink,
        helpSourceText,
        isDisabled,
        isFocused,
        isReadonly,
        isRequiredShown,
        labelEdge,
        messages: allMessages,
        styleVariant: variant,
        userAssistanceDensity,
        value
    });
    const onClickClearIcon = useCallback(() => {
        // Clicking the clear icon should put the focus on the input field
        enabledElementRef.current?.focus();
        // Send an event to clear the field's value
        onInputAndDispatch?.({ previousValue: value, value: '' });
    }, [onInputAndDispatch, value, enabledElementRef]);
    const maybeClearIcon = useClearIcon({
        clearIcon: jsx(ClearIcon, { onClick: onClickClearIcon, testId: `${testId}_clearicon` }),
        display: hasClearIcon,
        hasValue: formFieldContext.hasValue,
        isFocused,
        isEnabled: !isReadonly && !isDisabled,
        isHover
    });
    const endContentCombined = beforeVNode(endContent, maybeClearIcon);
    const hasInsideLabel = label !== undefined && labelEdge === 'inside';
    const { shouldRenderPrefix, shouldRenderSuffix, prefixProps, suffixProps, valuePrefixSuffix, ariaLabelledBy } = usePrefixSuffix({
        baseId,
        hasEndContent: endContent !== undefined,
        hasInsideLabel,
        hasStartContent: startContent !== undefined,
        hasValue: formFieldContext.hasValue,
        isDisabled,
        isFocused,
        labelId: labelProps.id,
        prefix,
        suffix,
        value
    });
    const renderedPrefix = shouldRenderPrefix ? jsx(PrefixSuffix, { ...prefixProps }) : undefined;
    const renderedSuffix = shouldRenderSuffix ? jsx(PrefixSuffix, { ...suffixProps }) : undefined;
    const labelComp = labelEdge !== 'none' ? jsx(Label, { ...labelProps, children: label }) : undefined;
    const fieldLabelProps = {
        label: labelEdge !== 'none' ? labelComp : undefined,
        labelEdge: labelEdge !== 'none' ? labelEdge : undefined,
        labelStartWidth: labelEdge !== 'none' ? labelStartWidth : undefined
    };
    const ariaLabel = labelEdge === 'none' ? label : undefined;
    const isInlineDensity = userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow';
    const inlineUserAssistance = isInlineDensity ? (isDisabled || isReadonly ? (
    // save space for user assistance if density is 'efficient', even though we don't
    // render user assistance for disabled or readonly fields
    userAssistanceDensity !== 'efficient' ? undefined : (jsx(InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsx(InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: allMessages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsx(CompactUserAssistance, { anchorRef: anchorRef, messages: allMessages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    if (isReadonly) {
        // TODO: should be able to configure whether start/end content is shown when readonly
        // JET-49916 - Preact InputText: show start/end content when readonly
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, value: valuePrefixSuffix, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: anchorRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    const hasMaxLength = maxLength !== undefined;
    const mainContent = (jsxs(Fragment, { children: [renderedPrefix, jsx(TextFieldInput, { "aria-labelledby": ariaLabelledBy, "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasEndContent: endContent !== undefined, hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', hasPrefix: renderedPrefix !== undefined, hasStartContent: startContent !== undefined, hasSuffix: renderedSuffix !== undefined, inputRef: enabledElementRef, isRequired: isRequired, placeholder: placeholder, role: role, textAlign: textAlign, type: isMobile() ? virtualKeyboard : undefined, value: isDisabled ? valuePrefixSuffix : value, onCommit: onCommitAndDispatch, onInput: onFilteredInput, ...inputProps }), renderedSuffix, hasMaxLength && (jsx(HiddenAccessible, { id: maxLengthDescribedByIdRef.current, children: translations.formControl_maxLength({
                    MAX_LENGTH: `${maxLength}`
                }) })), hasMaxLength && isFocused && (jsx(MaxLengthLiveRegion, { maxLength: maxLength, valueLength: valueLength, testId: testId + '_remainingChars' }))] }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { endContent: endContentCombined, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, startContent: startContent, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...hoverProps }) }));
});
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if running on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}

export { InputText as I };
//# sourceMappingURL=InputText-5fb896e7.js.map
