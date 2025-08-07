/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { useCallback, useRef } from 'preact/hooks';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';
import { L as Label } from './Label-6674b3f2.js';
import { P as PrefixSuffix } from './PrefixSuffix-73361db2.js';
import { u as usePrefixSuffix } from './usePrefixSuffix-71a410f4.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { T as TextFieldInput } from './TextFieldInput-3c39cb7b.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import { T as TextField } from './TextField-323fe0e9.js';
import './LayerHost-45f545d7.js';
import './LiveRegionStyles.styles.css';
import './logger-c92f309c.js';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
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
import './HiddenAccessibleStyles.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { u as useCurrentValueReducer } from './useCurrentValueReducer-bdf796fa.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { S as SvgChevronUp } from './ChevronUp-8e0ac42c.js';
import { S as SvgMinus } from './Minus-519136b2.js';
import { S as SvgPlus } from './Plus-bbe994f4.js';
import { I as IconButton } from './IconButton-37310d21.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { G as Grid } from './Grid-cfeac922.js';
import { u as useSpinning } from './useSpinning-c2c54c7c.js';

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
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const labelIncrease = translations.inputNumber_increase();
    const labelDecrease = translations.inputNumber_decrease();
    const label = direction === 'increase' ? labelIncrease : labelDecrease;
    return (jsx(TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsx("div", { "aria-hidden": "true", onPointerDown: onPointerDown, onPointerUp: onPointerUp, onPointerOut: onPointerOut, onPointerCancel: onPointerCancel, children: jsx(IconButton, { isDisabled: isDisabled, tooltip: label, variant: "ghost", size: "sm", children: children }) }) }));
}

// TODO: Replace Steppers with Buttonset when it becomes available
function Steppers({ children }) {
    return (jsx(Grid, { align: "center", gap: "1x", gridTemplateColumns: "1fr 1fr", children: children }));
}

const stepperVariants = ['directional', 'quantitative'];
const NumberInputText = forwardRef(({ 'aria-describedby': ariaDescribedBy, 'aria-valuemax': ariaValueMax, 'aria-valuemin': ariaValueMin, 'aria-valuenow': ariaValueNow, 'aria-valuetext': ariaValueText, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, isStepDownDisabled: propIsStepDownDisabled, isStepUpDisabled: propIsStepUpDisabled, hasSteppers = false, stepperVariant = 'directional', label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, placeholder, prefix, suffix, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', virtualKeyboard, onInput, onCommit, onSpin, onSpinComplete, onStep, testId }, ref) => {
    const { currentCommitValue, dispatch } = useCurrentValueReducer({ value });
    const onInputAndDispatch = useCallback((detail) => {
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = useCallback((detail) => {
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
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField({ isDisabled, isReadonly, ref });
    const { baseId, formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
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
    const handleStep = useCallback((e) => {
        if (!isFocused) {
            enabledElementRef.current?.focus();
        }
        onStep?.(e);
    }, [onStep, isFocused, enabledElementRef]);
    // if hasSteppers, keyboardHandlerProps will be spread onto TextFieldInput to handle
    // stepping functionality via the arrow up or down keys.
    // also, pointerIncreaseHandlerProps and pointerDecreaseHandlerProps will be spread to
    // the corresponding StepButton
    const { keyboardHandlerProps, pointerIncreaseHandlerProps, pointerDecreaseHandlerProps } = useSpinning({
        isStepDownDisabled,
        isStepUpDisabled,
        onSpin,
        onSpinComplete,
        onStep: handleStep
    });
    const DecreaseButton = hasSteppers ? (jsx(StepButton, { direction: "decrease", isDisabled: isStepDownDisabled, ...pointerDecreaseHandlerProps, children: stepperVariant === 'directional' ? jsx(SvgChevronDown, {}) : jsx(SvgMinus, {}) })) : undefined;
    const IncreaseButton = hasSteppers ? (jsx(StepButton, { direction: "increase", isDisabled: isStepUpDisabled, ...pointerIncreaseHandlerProps, children: stepperVariant === 'directional' ? jsx(SvgChevronUp, {}) : jsx(SvgPlus, {}) })) : undefined;
    // when stepperVariant is quantitative, the decrease button is placed in the startContent slot
    const startContent = hasSteppers && stepperVariant === 'quantitative' ? DecreaseButton : undefined;
    // when stepperVariant is directional, both buttons are wrapped in Steppers and placed in the endContent slot
    // if it equals quantitative, only the increase button is placed in the endContent slot
    const endContent = hasSteppers ? (stepperVariant === 'directional' ? (jsxs(Steppers, { children: [DecreaseButton, IncreaseButton] })) : (IncreaseButton)) : undefined;
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
    userAssistanceDensity !== 'efficient' ? undefined : (jsx(InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsx(InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsx(CompactUserAssistance, { anchorRef: anchorRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    if (isReadonly) {
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, value: valuePrefixSuffix, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: anchorRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    // If ariaValueText is the same as ariaValueNow.toString, no need to show it.
    const valueText = ariaValueNow === undefined
        ? ariaValueText
        : ariaValueNow.toString() !== ariaValueText
            ? ariaValueText
            : undefined;
    const mainContent = (jsxs(Fragment, { children: [renderedPrefix, jsx(TextFieldInput, { "aria-labelledby": ariaLabelledBy, "aria-label": ariaLabel, "aria-valuemax": hasSteppers ? ariaValueMax : undefined, "aria-valuemin": hasSteppers ? ariaValueMin : undefined, "aria-valuenow": hasSteppers ? ariaValueNow : undefined, "aria-valuetext": hasSteppers ? valueText : undefined, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasEndContent: endContent !== undefined, hasInsideLabel: hasInsideLabel, hasPrefix: renderedPrefix !== undefined, hasStartContent: startContent !== undefined, hasSuffix: renderedSuffix !== undefined, inputRef: enabledElementRef, isRequired: isRequired, placeholder: placeholder, role: hasSteppers ? 'spinbutton' : undefined, textAlign: textAlign, type: isMobile() ? virtualKeyboard : undefined, value: isDisabled ? valuePrefixSuffix : value, onCommit: onCommitAndDispatch, onInput: onInputAndDispatch, ...inputProps, ...(hasSteppers ? keyboardHandlerProps : {}) }), renderedSuffix] }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { startContent: startContent, endContent: endContent, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, mainFieldRef: anchorRef, hasZeroStartMargin: hasSteppers && stepperVariant === 'quantitative', testId: testId, ...textFieldProps, ...fieldLabelProps }) }));
});
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if running on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}

export { NumberInputText as N, stepperVariants as s };
//# sourceMappingURL=NumberInputText-21ded33a.js.map
