/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { forwardRef, useCallback as useCallback$1, useRef } from 'preact/compat';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { useCallback } from 'preact/hooks';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import { L as Label } from './Label-6674b3f2.js';
import { T as TextFieldInput } from './TextFieldInput-3c39cb7b.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import { T as TextField } from './TextField-323fe0e9.js';
import { M as MaxLengthLiveRegion } from './MaxLengthLiveRegion-cd15b075.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useId } from './useId-03dbfdf0.js';
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
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { u as useLengthFilter } from './useLengthFilter-f72f45ac.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import './MaxLengthCounterStyles.styles.css';
import { u as useCurrentValueReducer } from './useCurrentValueReducer-bdf796fa.js';

var hide = 'MaxLengthCounterStyles_hide__7dy9j71';
var maxLengthCounterBase = 'MaxLengthCounterStyles_maxLengthCounterBase__7dy9j70';
var spanStyles = 'MaxLengthCounterStyles_spanStyles__7dy9j72';

const noop = () => { };
function MaxLengthCounter({ maxLength, valueLength = 0, onClick }) {
    const { isFocused } = useFormFieldContext();
    // We don't want mousedown on this component to do anything, so prevent the default behavior.
    const killEvent = useCallback((event) => event.preventDefault(), []);
    const textClasses = classNames([!isFocused && hide]);
    const { pressProps } = usePress(onClick ?? noop);
    return (jsx("div", { class: maxLengthCounterBase, onMouseDown: killEvent, ...pressProps, children: jsxs("span", { class: textClasses, children: [jsx("span", { class: spanStyles, children: valueLength }), jsx("span", { class: spanStyles, children: "/" }), jsx("span", { class: spanStyles, children: maxLength })] }) }));
}

/**
 * A text area displays a field that allows a user to enter a multi-line text value.
 */
const TextArea = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, maxLength, maxLengthCounter = 'remaining', maxLengthUnit, messages, placeholder, resize, role, rows, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', onInput, onCommit, testId }, ref) => {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const formControl_limitReached = maxLength
        ? translations.formControl_limitReached({
            CHARACTER_LIMIT: maxLength
        })
        : '';
    const { currentCommitValue, dispatch } = useCurrentValueReducer({ value });
    const onInputAndDispatch = useCallback$1((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = useCallback$1((detail) => {
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
    const { enabledElementRef, readonlyElementRef, focusProps, isFocused } = useFocusableTextField({ isDisabled, isReadonly, ref });
    // Handle length filter for user-typed inputs and controlled inputs
    const { isMaxLengthReached, valueLength, onFilteredInput } = useLengthFilter({
        maxLength,
        maxLengthUnit,
        value,
        onInput: onInputAndDispatch,
        onCommit: onCommitAndDispatch
    });
    const limitMessage = [{ detail: formControl_limitReached, severity: 'info' }];
    const allMessages = [
        ...(messages ?? []),
        ...(isMaxLengthReached ? limitMessage : [])
    ];
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
        ariaDescribedBy: isReadonly || isDisabled ? ariaDescribedBy : enabledAriaDescribedBy,
        contentVariant: 'textarea',
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
    const onClickCounter = useCallback$1(() => {
        const elm = enabledElementRef.current;
        // for setSelectionRange(), len needs to be a number or null.
        const len = elm ? elm.value.length : null;
        // Since the counter element is after the text, clicking in this
        // should put the selection at the end of the text
        enabledElementRef.current?.setSelectionRange(len, len);
        // Clicking the counter should put the focus on the input field
        enabledElementRef.current?.focus();
    }, [enabledElementRef]);
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
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "textarea", elementRef: readonlyElementRef, rows: rows, autoFocus: autoFocus, textAlign: textAlign, value: value, variant: "textarea", hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside' }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, ref: anchorRef, testId: testId, variant: "textarea", mainContent: mainContent, resize: resize, ...fieldLabelProps }) }));
    }
    const hasMaxLength = maxLength !== undefined;
    const mainContent = (jsxs(Fragment, { children: [jsx(TextFieldInput, { as: "textarea", "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', isRequired: isRequired, inputRef: enabledElementRef, onCommit: onCommitAndDispatch, onInput: onFilteredInput, placeholder: placeholder, role: role, rows: rows, textAlign: textAlign, value: value, ...inputProps }), maxLengthCounter === 'remaining' && hasMaxLength && (jsx(MaxLengthCounter, { maxLength: maxLength, valueLength: valueLength, onClick: onClickCounter })), hasMaxLength && (jsx(HiddenAccessible, { id: maxLengthDescribedByIdRef.current, isHidden: true, children: translations.formControl_maxLength({
                    MAX_LENGTH: `${maxLength}`
                }) })), hasMaxLength && isFocused && (jsx(MaxLengthLiveRegion, { maxLength: maxLength, valueLength: valueLength, testId: testId + '_remainingChars' }))] }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { mainContent: mainContent, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps?.onFocusOut, onFocus: focusProps?.onFocusIn, mainFieldRef: anchorRef, resize: resize, testId: testId, ...textFieldProps, ...fieldLabelProps }) }));
});

export { MaxLengthCounter as M, TextArea as T };
//# sourceMappingURL=TextArea-979496a0.js.map
