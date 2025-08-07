/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { useCallback, useRef } from 'preact/hooks';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { L as Label } from './Label-6674b3f2.js';
import { T as TextFieldInput } from './TextFieldInput-3c39cb7b.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import { T as TextField } from './TextField-323fe0e9.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './LiveRegionStyles.styles.css';
import './LayerHost-45f545d7.js';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
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
import { u as useToggle } from './useToggle-8b7fcefe.js';
import { u as useClearIcon } from './useClearIcon-f0ff8de3.js';
import { b as beforeVNode } from './componentUtils-4681ea5c.js';
import { C as ClearIcon } from './ClearIcon-f1f796b4.js';
import { u as useCurrentValueReducer } from './useCurrentValueReducer-bdf796fa.js';
import { R as RevealToggleIcon } from './RevealToggleIcon-9236963e.js';

// One way InputPassword differs from InputText is InputPassword's readonly
// is implemented with an <input> and not a <div>.
/**
 * An InputPassword is a password input field with a reveal icon.
 */
const InputPassword = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, hasClearIcon, hasRevealToggle = 'always', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, placeholder, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', onInput, onCommit, testId }, ref) => {
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
    const { bool: isRevealed, setFalse: setRevealedFalse, setTrue: setRevealedTrue } = useToggle(false);
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField({ isDisabled, isReadonly, ref, onBlurWithin: setRevealedFalse });
    const { hoverProps, isHover } = useHover({ isDisabled: isReadonly || isDisabled || false });
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
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
    const onRevealIconToggle = useCallback(() => {
        isRevealed ? setRevealedFalse() : setRevealedTrue();
    }, [isRevealed, setRevealedFalse, setRevealedTrue]);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const passwordMaskedStr = translations.inputPassword_hidden();
    const passwordShowStr = translations.inputPassword_show();
    const passwordHideStr = translations.inputPassword_hide();
    const revealToggleIcon = !isDisabled && hasRevealToggle === 'always' ? (jsx(RevealToggleIcon, { accessibleLabel: passwordMaskedStr, isRevealed: isRevealed, onToggle: onRevealIconToggle, tooltipHide: passwordHideStr, tooltipShow: passwordShowStr, testId: `${testId}_toggleicon` })) : null;
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
    const endContentCombined = beforeVNode(revealToggleIcon, maybeClearIcon);
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
    userAssistanceDensity !== 'efficient' ? undefined : (jsx(InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsx(InlineUserAssistance, { assistiveText: assistiveText, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsx(CompactUserAssistance, { anchorRef: anchorRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    if (isReadonly) {
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "input", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, type: "password", value: value, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside' }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, ref: anchorRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    const mainContent = (jsx(TextFieldInput, { "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEndContent: !!(maybeClearIcon || revealToggleIcon), hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', inputRef: enabledElementRef, isRequired: isRequired, onInput: onInputAndDispatch, onCommit: onCommitAndDispatch, placeholder: placeholder, textAlign: textAlign, value: value, type: isRevealed ? 'text' : 'password', ...inputProps }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { columnSpan: columnSpan, endContent: endContentCombined, inlineUserAssistance: inlineUserAssistance, compactUserAssistance: compactUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...hoverProps }) }));
});

export { InputPassword as I };
//# sourceMappingURL=InputPassword-1f1f80b3.js.map
