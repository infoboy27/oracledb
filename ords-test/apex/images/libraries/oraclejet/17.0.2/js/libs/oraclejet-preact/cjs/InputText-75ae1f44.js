/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var useClearIcon = require('./useClearIcon-ae2c6ddf.js');
var useFocusableTextField = require('./useFocusableTextField-c18d39c2.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
var useHover = require('./useHover-910b8e32.js');
var useLengthFilter = require('./useLengthFilter-d4cb6f47.js');
var useTextField = require('./useTextField-3ce8f0d0.js');
var Label = require('./Label-d9ad059f.js');
var PrefixSuffix = require('./PrefixSuffix-dd79bd7c.js');
var usePrefixSuffix = require('./usePrefixSuffix-edb21dad.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var useId = require('./useId-6c0eeb27.js');
var clientHints = require('./clientHints-9e411b6e.js');
var TextFieldInput = require('./TextFieldInput-4904c227.js');

var ReadonlyTextFieldInput = require('./ReadonlyTextFieldInput-fb7ffa5e.js');
var StyledTextField = require('./StyledTextField-351ea57e.js');
var TextField = require('./TextField-0f4e945f.js');
var MaxLengthLiveRegion = require('./MaxLengthLiveRegion-85913361.js');
require('./logger-2b636482.js');
require('./TabbableModeContext-e99d527e.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');
var CompactUserAssistance = require('./CompactUserAssistance-f88519f9.js');
require('./useTooltipControlled-706a3651.js');
require('preact');

require('./Popup-881aae20.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
require('./InputGroupContext-05f2a46f.js');
require('./LayerHost-46e4d858.js');

require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var componentUtils = require('./componentUtils-a5f09fc1.js');
var ClearIcon = require('./ClearIcon-50725213.js');
var useCurrentValueReducer = require('./useCurrentValueReducer-f37ac024.js');

/**
 * An input text displays a field that allows a user to enter a text value.
 */
const InputText = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, hasClearIcon = 'never', endContent, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, maxLength, maxLengthUnit, messages, placeholder, prefix, role, startContent, suffix, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', virtualKeyboard, onInput, onCommit, testId }, ref) => {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const formControl_limitReached = maxLength
        ? translations.formControl_limitReached({
            CHARACTER_LIMIT: maxLength
        })
        : '';
    const { currentCommitValue, dispatch } = useCurrentValueReducer.useCurrentValueReducer({ value });
    const onInputAndDispatch = hooks.useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = hooks.useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'commit', payload: detail.value });
        onCommit?.(detail);
    }, [onCommit, dispatch]);
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const maxLengthDescribedByIdRef = hooks.useRef(useId.useId());
    // The enabledAriaDescribedBy includes the maxLengthDescribedById in addition to what was passed in to aria-describedby.
    // We don't need to announce the max length message for readonly, as it only applies when editing the value.
    const enabledAriaDescribedBy = ariaDescribedBy
        ? `${ariaDescribedBy} ${maxLengthDescribedByIdRef.current}`
        : maxLengthDescribedByIdRef.current;
    const limitMessage = [{ detail: formControl_limitReached, severity: 'info' }];
    // Handle length filter for user-typed inputs and controlled inputs
    const { isMaxLengthReached, valueLength, onFilteredInput } = useLengthFilter.useLengthFilter({
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
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField.useFocusableTextField({ isDisabled, isReadonly, ref });
    const { hoverProps, isHover } = useHover.useHover({ isDisabled: isReadonly || isDisabled || false });
    const { baseId, formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField.useTextField({
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
    const onClickClearIcon = hooks.useCallback(() => {
        // Clicking the clear icon should put the focus on the input field
        enabledElementRef.current?.focus();
        // Send an event to clear the field's value
        onInputAndDispatch?.({ previousValue: value, value: '' });
    }, [onInputAndDispatch, value, enabledElementRef]);
    const maybeClearIcon = useClearIcon.useClearIcon({
        clearIcon: jsxRuntime.jsx(ClearIcon.ClearIcon, { onClick: onClickClearIcon, testId: `${testId}_clearicon` }),
        display: hasClearIcon,
        hasValue: formFieldContext.hasValue,
        isFocused,
        isEnabled: !isReadonly && !isDisabled,
        isHover
    });
    const endContentCombined = componentUtils.beforeVNode(endContent, maybeClearIcon);
    const hasInsideLabel = label !== undefined && labelEdge === 'inside';
    const { shouldRenderPrefix, shouldRenderSuffix, prefixProps, suffixProps, valuePrefixSuffix, ariaLabelledBy } = usePrefixSuffix.usePrefixSuffix({
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
    const renderedPrefix = shouldRenderPrefix ? jsxRuntime.jsx(PrefixSuffix.PrefixSuffix, { ...prefixProps }) : undefined;
    const renderedSuffix = shouldRenderSuffix ? jsxRuntime.jsx(PrefixSuffix.PrefixSuffix, { ...suffixProps }) : undefined;
    const labelComp = labelEdge !== 'none' ? jsxRuntime.jsx(Label.Label, { ...labelProps, children: label }) : undefined;
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
    userAssistanceDensity !== 'efficient' ? undefined : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: allMessages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = hooks.useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsxRuntime.jsx(CompactUserAssistance.CompactUserAssistance, { anchorRef: anchorRef, messages: allMessages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    if (isReadonly) {
        // TODO: should be able to configure whether start/end content is shown when readonly
        // JET-49916 - Preact InputText: show start/end content when readonly
        const mainContent = (jsxRuntime.jsx(ReadonlyTextFieldInput.ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, value: valuePrefixSuffix, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel }));
        return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(StyledTextField.ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: anchorRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    const hasMaxLength = maxLength !== undefined;
    const mainContent = (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [renderedPrefix, jsxRuntime.jsx(TextFieldInput.TextFieldInput, { "aria-labelledby": ariaLabelledBy, "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasEndContent: endContent !== undefined, hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', hasPrefix: renderedPrefix !== undefined, hasStartContent: startContent !== undefined, hasSuffix: renderedSuffix !== undefined, inputRef: enabledElementRef, isRequired: isRequired, placeholder: placeholder, role: role, textAlign: textAlign, type: isMobile() ? virtualKeyboard : undefined, value: isDisabled ? valuePrefixSuffix : value, onCommit: onCommitAndDispatch, onInput: onFilteredInput, ...inputProps }), renderedSuffix, hasMaxLength && (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: maxLengthDescribedByIdRef.current, children: translations.formControl_maxLength({
                    MAX_LENGTH: `${maxLength}`
                }) })), hasMaxLength && isFocused && (jsxRuntime.jsx(MaxLengthLiveRegion.MaxLengthLiveRegion, { maxLength: maxLength, valueLength: valueLength, testId: testId + '_remainingChars' }))] }));
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(TextField.TextField, { endContent: endContentCombined, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, startContent: startContent, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...hoverProps }) }));
});
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if running on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = clientHints.getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}

exports.InputText = InputText;
//# sourceMappingURL=InputText-75ae1f44.js.map
