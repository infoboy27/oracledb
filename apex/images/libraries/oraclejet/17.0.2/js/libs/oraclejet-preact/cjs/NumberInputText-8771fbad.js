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
var Label = require('./Label-d9ad059f.js');
var PrefixSuffix = require('./PrefixSuffix-dd79bd7c.js');
var usePrefixSuffix = require('./usePrefixSuffix-edb21dad.js');
var clientHints = require('./clientHints-9e411b6e.js');
var TextFieldInput = require('./TextFieldInput-4904c227.js');

var ReadonlyTextFieldInput = require('./ReadonlyTextFieldInput-fb7ffa5e.js');
var StyledTextField = require('./StyledTextField-351ea57e.js');
var TextField = require('./TextField-0f4e945f.js');
require('./LayerHost-46e4d858.js');

require('./logger-2b636482.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');
var CompactUserAssistance = require('./CompactUserAssistance-f88519f9.js');
require('./useTooltipControlled-706a3651.js');
require('preact');

require('./Popup-881aae20.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
require('./InputGroupContext-05f2a46f.js');


require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var useCurrentValueReducer = require('./useCurrentValueReducer-f37ac024.js');
var ChevronDown = require('./ChevronDown-ec558844.js');
var ChevronUp = require('./ChevronUp-11e9a7d7.js');
var Minus = require('./Minus-3aadfd1a.js');
var Plus = require('./Plus-cecd0d87.js');
var IconButton = require('./IconButton-94f8ca5c.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var Grid = require('./Grid-03d487e5.js');
var useSpinning = require('./useSpinning-929c5225.js');

/**
 * A StepButton is used to request a "step up" or "step down" to a value in NumberInputText.
 * @param children The children are Icons for the button
 * @param direction The direction of the step
 * @param isDisabled Whether the button should be disabled
 * @param onPointerDown Handler called when pointer is down
 * @param onPointerUp Handler called when pointer is up
 * @param onPointerOut Handler called when pointer is out
 * @param onPointerCancel Handler called when pointer is canceled
 */
function StepButton({ direction, isDisabled, children, onPointerDown, onPointerUp, onPointerOut, onPointerCancel }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const labelIncrease = translations.inputNumber_increase();
    const labelDecrease = translations.inputNumber_decrease();
    const label = direction === 'increase' ? labelIncrease : labelDecrease;
    return (jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsxRuntime.jsx("div", { "aria-hidden": "true", onPointerDown: onPointerDown, onPointerUp: onPointerUp, onPointerOut: onPointerOut, onPointerCancel: onPointerCancel, children: jsxRuntime.jsx(IconButton.IconButton, { isDisabled: isDisabled, tooltip: label, variant: "ghost", size: "sm", children: children }) }) }));
}

// TODO: Replace Steppers with Buttonset when it becomes available
function Steppers({ children }) {
    return (jsxRuntime.jsx(Grid.Grid, { align: "center", gap: "1x", gridTemplateColumns: "1fr 1fr", children: children }));
}

const stepperVariants = ['directional', 'quantitative'];
const NumberInputText = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, 'aria-valuemax': ariaValueMax, 'aria-valuemin': ariaValueMin, 'aria-valuenow': ariaValueNow, 'aria-valuetext': ariaValueText, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, isStepDownDisabled: propIsStepDownDisabled, isStepUpDisabled: propIsStepUpDisabled, hasSteppers = false, stepperVariant = 'directional', label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, placeholder, prefix, suffix, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', virtualKeyboard, onInput, onCommit, onSpin, onSpinComplete, onStep, testId }, ref) => {
    const { currentCommitValue, dispatch } = useCurrentValueReducer.useCurrentValueReducer({ value });
    const onInputAndDispatch = hooks.useCallback((detail) => {
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = hooks.useCallback((detail) => {
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
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField.useFocusableTextField({ isDisabled, isReadonly, ref });
    const { baseId, formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField.useTextField({
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
    // Disable the steppers if the number input is disabled.
    const isStepDownDisabled = isDisabled || propIsStepDownDisabled;
    const isStepUpDisabled = isDisabled || propIsStepUpDisabled;
    // Set focus to the input when a step is requested by clicking/holding down a step button.
    // For Arrow up/down, it already has focus so no action is needed.
    // Note: for readonly there are no steppers, for disabled stepping is disabled, so this only
    // applies to enabled case.
    const handleStep = hooks.useCallback((e) => {
        if (!isFocused) {
            enabledElementRef.current?.focus();
        }
        onStep?.(e);
    }, [onStep, isFocused, enabledElementRef]);
    // if hasSteppers, keyboardHandlerProps will be spread onto TextFieldInput to handle
    // stepping functionality via the arrow up or down keys.
    // also, pointerIncreaseHandlerProps and pointerDecreaseHandlerProps will be spread to
    // the corresponding StepButton
    const { keyboardHandlerProps, pointerIncreaseHandlerProps, pointerDecreaseHandlerProps } = useSpinning.useSpinning({
        isStepDownDisabled,
        isStepUpDisabled,
        onSpin,
        onSpinComplete,
        onStep: handleStep
    });
    const DecreaseButton = hasSteppers ? (jsxRuntime.jsx(StepButton, { direction: "decrease", isDisabled: isStepDownDisabled, ...pointerDecreaseHandlerProps, children: stepperVariant === 'directional' ? jsxRuntime.jsx(ChevronDown.SvgChevronDown, {}) : jsxRuntime.jsx(Minus.SvgMinus, {}) })) : undefined;
    const IncreaseButton = hasSteppers ? (jsxRuntime.jsx(StepButton, { direction: "increase", isDisabled: isStepUpDisabled, ...pointerIncreaseHandlerProps, children: stepperVariant === 'directional' ? jsxRuntime.jsx(ChevronUp.SvgChevronUp, {}) : jsxRuntime.jsx(Plus.SvgPlus, {}) })) : undefined;
    // when stepperVariant is quantitative, the decrease button is placed in the startContent slot
    const startContent = hasSteppers && stepperVariant === 'quantitative' ? DecreaseButton : undefined;
    // when stepperVariant is directional, both buttons are wrapped in Steppers and placed in the endContent slot
    // if it equals quantitative, only the increase button is placed in the endContent slot
    const endContent = hasSteppers ? (stepperVariant === 'directional' ? (jsxRuntime.jsxs(Steppers, { children: [DecreaseButton, IncreaseButton] })) : (IncreaseButton)) : undefined;
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
    userAssistanceDensity !== 'efficient' ? undefined : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = hooks.useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsxRuntime.jsx(CompactUserAssistance.CompactUserAssistance, { anchorRef: anchorRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    if (isReadonly) {
        const mainContent = (jsxRuntime.jsx(ReadonlyTextFieldInput.ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, value: valuePrefixSuffix, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel }));
        return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(StyledTextField.ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: anchorRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    // If ariaValueText is the same as ariaValueNow.toString, no need to show it.
    const valueText = ariaValueNow === undefined
        ? ariaValueText
        : ariaValueNow.toString() !== ariaValueText
            ? ariaValueText
            : undefined;
    const mainContent = (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [renderedPrefix, jsxRuntime.jsx(TextFieldInput.TextFieldInput, { "aria-labelledby": ariaLabelledBy, "aria-label": ariaLabel, "aria-valuemax": hasSteppers ? ariaValueMax : undefined, "aria-valuemin": hasSteppers ? ariaValueMin : undefined, "aria-valuenow": hasSteppers ? ariaValueNow : undefined, "aria-valuetext": hasSteppers ? valueText : undefined, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasEndContent: endContent !== undefined, hasInsideLabel: hasInsideLabel, hasPrefix: renderedPrefix !== undefined, hasStartContent: startContent !== undefined, hasSuffix: renderedSuffix !== undefined, inputRef: enabledElementRef, isRequired: isRequired, placeholder: placeholder, role: hasSteppers ? 'spinbutton' : undefined, textAlign: textAlign, type: isMobile() ? virtualKeyboard : undefined, value: isDisabled ? valuePrefixSuffix : value, onCommit: onCommitAndDispatch, onInput: onInputAndDispatch, ...inputProps, ...(hasSteppers ? keyboardHandlerProps : {}) }), renderedSuffix] }));
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(TextField.TextField, { startContent: startContent, endContent: endContent, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, mainFieldRef: anchorRef, hasZeroStartMargin: hasSteppers && stepperVariant === 'quantitative', testId: testId, ...textFieldProps, ...fieldLabelProps }) }));
});
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if running on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = clientHints.getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}

exports.NumberInputText = NumberInputText;
exports.stepperVariants = stepperVariants;
//# sourceMappingURL=NumberInputText-8771fbad.js.map
