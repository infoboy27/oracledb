/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var useFocusableTextField = require('./useFocusableTextField-c18d39c2.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
var useTextField = require('./useTextField-3ce8f0d0.js');
var useHover = require('./useHover-910b8e32.js');
var Label = require('./Label-d9ad059f.js');
var TextFieldInput = require('./TextFieldInput-4904c227.js');

var ReadonlyTextFieldInput = require('./ReadonlyTextFieldInput-fb7ffa5e.js');
var StyledTextField = require('./StyledTextField-351ea57e.js');
var TextField = require('./TextField-0f4e945f.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');

require('./LayerHost-46e4d858.js');
require('./logger-2b636482.js');
require('./TabbableModeContext-e99d527e.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');
var CompactUserAssistance = require('./CompactUserAssistance-f88519f9.js');
require('./useTooltipControlled-706a3651.js');
require('preact');

require('./Popup-881aae20.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
require('./InputGroupContext-05f2a46f.js');


require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var useToggle = require('./useToggle-3ebba7d8.js');
var useClearIcon = require('./useClearIcon-ae2c6ddf.js');
var componentUtils = require('./componentUtils-a5f09fc1.js');
var ClearIcon = require('./ClearIcon-50725213.js');
var useCurrentValueReducer = require('./useCurrentValueReducer-f37ac024.js');
var RevealToggleIcon = require('./RevealToggleIcon-b5738e5e.js');

// One way InputPassword differs from InputText is InputPassword's readonly
// is implemented with an <input> and not a <div>.
/**
 * An InputPassword is a password input field with a reveal icon.
 */
const InputPassword = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, hasClearIcon, hasRevealToggle = 'always', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, placeholder, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', onInput, onCommit, testId }, ref) => {
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
    const { bool: isRevealed, setFalse: setRevealedFalse, setTrue: setRevealedTrue } = useToggle.useToggle(false);
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField.useFocusableTextField({ isDisabled, isReadonly, ref, onBlurWithin: setRevealedFalse });
    const { hoverProps, isHover } = useHover.useHover({ isDisabled: isReadonly || isDisabled || false });
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField.useTextField({
        ariaDescribedBy,
        helpSourceLink,
        helpSourceText,
        isDisabled,
        isFocused,
        isReadonly,
        isRequiredShown,
        labelEdge,
        messages,
        styleVariant: variant,
        userAssistanceDensity,
        value
    });
    // Callback on the RevealToggleButton.
    // When the user clicks on the reveal button,
    // toggle revealing/masking password
    const onRevealIconToggle = hooks.useCallback(() => {
        isRevealed ? setRevealedFalse() : setRevealedTrue();
    }, [isRevealed, setRevealedFalse, setRevealedTrue]);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const passwordMaskedStr = translations.inputPassword_hidden();
    const passwordShowStr = translations.inputPassword_show();
    const passwordHideStr = translations.inputPassword_hide();
    const revealToggleIcon = !isDisabled && hasRevealToggle === 'always' ? (jsxRuntime.jsx(RevealToggleIcon.RevealToggleIcon, { accessibleLabel: passwordMaskedStr, isRevealed: isRevealed, onToggle: onRevealIconToggle, tooltipHide: passwordHideStr, tooltipShow: passwordShowStr, testId: `${testId}_toggleicon` })) : null;
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
    const endContentCombined = componentUtils.beforeVNode(revealToggleIcon, maybeClearIcon);
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
    userAssistanceDensity !== 'efficient' ? undefined : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { assistiveText: assistiveText, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = hooks.useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsxRuntime.jsx(CompactUserAssistance.CompactUserAssistance, { anchorRef: anchorRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    if (isReadonly) {
        const mainContent = (jsxRuntime.jsx(ReadonlyTextFieldInput.ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "input", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, type: "password", value: value, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside' }));
        return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(StyledTextField.ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, ref: anchorRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    const mainContent = (jsxRuntime.jsx(TextFieldInput.TextFieldInput, { "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEndContent: !!(maybeClearIcon || revealToggleIcon), hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', inputRef: enabledElementRef, isRequired: isRequired, onInput: onInputAndDispatch, onCommit: onCommitAndDispatch, placeholder: placeholder, textAlign: textAlign, value: value, type: isRevealed ? 'text' : 'password', ...inputProps }));
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(TextField.TextField, { columnSpan: columnSpan, endContent: endContentCombined, inlineUserAssistance: inlineUserAssistance, compactUserAssistance: compactUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...hoverProps }) }));
});

exports.InputPassword = InputPassword;
//# sourceMappingURL=InputPassword-16e31428.js.map
