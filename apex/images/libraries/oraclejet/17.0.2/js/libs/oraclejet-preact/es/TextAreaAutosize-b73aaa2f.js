/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { forwardRef, useCallback, useRef } from 'preact/compat';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { useLayoutEffect } from 'preact/hooks';
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
import { u as useCurrentValueReducer } from './useCurrentValueReducer-bdf796fa.js';
import { M as MaxLengthCounter } from './TextArea-979496a0.js';

// returns the lineHeight as a number of pixels.
const calculateLineHeight = (textarea) => {
    const computedStyle = window.getComputedStyle(textarea);
    const computedlineHeight = computedStyle.lineHeight;
    if (computedlineHeight === 'normal') {
        // We get 'normal' for values 'initial', 'inherit', 'unset' and 'normal'
        // TODO: Unclear if we need this.
        // getComputedStyle always return fontSize in pixels.  Not likely a float, but since it's legal
        // we use parseFloat()
        const fontSize = parseFloat(computedStyle.fontSize);
        return 1.2 * fontSize;
    }
    return parseFloat(computedlineHeight);
};
const getStylingHeight = (textarea) => {
    const cssStyle = window.getComputedStyle(textarea);
    const paddingTop = parseFloat(cssStyle.paddingTop);
    const paddingBottom = parseFloat(cssStyle.paddingBottom);
    const borderTop = parseFloat(cssStyle.borderTop);
    const borderBottom = parseFloat(cssStyle.borderBottom);
    return { paddingHeight: paddingTop + paddingBottom, borderHeight: borderTop + borderBottom };
};

// TODO: Make this fire when the container resizes - JET-50840
const useTextAreaAutosizing = ({ isReadonly, enabledElementRef, readonlyElementRef, minRows = 2, maxRows, value }) => {
    useLayoutEffect(() => {
        const textareaRef = isReadonly ? readonlyElementRef : enabledElementRef;
        if (textareaRef.current === null)
            return;
        if (textareaRef.current instanceof HTMLDivElement)
            return; // We don't need to do anything if the readonlyElement is a DIV.
        const textarea = textareaRef.current;
        const lineHeight = calculateLineHeight(textarea);
        textarea.style.height = '0';
        const { paddingHeight, borderHeight } = getStylingHeight(textarea);
        const heightForMinRows = lineHeight * minRows + paddingHeight + borderHeight;
        const scrollHeight = textarea.scrollHeight + borderHeight;
        let resizedHeight = 0;
        // if maxRows is -1 the textarea will grow or shrink to fit all the content.
        // it won't shrink any less than rows.
        if (maxRows === undefined) {
            // we want to fit the entire scrollHeight, but we don't want
            // to shrink smaller than the height for rows.
            if (scrollHeight < heightForMinRows) {
                resizedHeight = heightForMinRows;
            }
            else {
                resizedHeight = scrollHeight;
            }
        }
        else if (maxRows > minRows) {
            // if maxRows is positive and greater than rows, the textarea will grow to fit the content
            // up to maxrows, or shrink to fit the content and down to rows.
            const heightForMaxRows = lineHeight * maxRows + paddingHeight + borderHeight;
            if (scrollHeight > heightForMaxRows) {
                resizedHeight = heightForMaxRows;
            }
            else if (scrollHeight < heightForMinRows) {
                resizedHeight = heightForMinRows;
            }
            else {
                resizedHeight = scrollHeight;
            }
        }
        else {
            resizedHeight = heightForMinRows;
        }
        // The 0.5 gaurantees that the clientHeight will be bigger than the scrollHeight, so no scrollbar appears.
        textarea.style.height = resizedHeight + 0.5 + 'px';
    }, [value, minRows, maxRows, isReadonly, enabledElementRef, readonlyElementRef]);
};

/**
 * A text area auto size displays a field that allows a user to enter a multi-line text value, and will adjust its height based on its content.
 */
const TextAreaAutosize = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, maxLength, maxLengthCounter = 'remaining', maxLengthUnit, maxRows, messages, minRows = 2, placeholder, role, 
//TODO: Add counter to show the length remaining - JET-50752
textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', onInput, onCommit, testId }, ref) => {
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
    const onClickCounter = useCallback(() => {
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
    useTextAreaAutosizing({
        isReadonly,
        enabledElementRef,
        readonlyElementRef,
        minRows,
        maxRows,
        value
    });
    if (isReadonly) {
        // TODO: should be able to configure whether start/end content is shown when readonly
        // JET-49916 - Preact InputText: show start/end content when readonly
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, elementRef: readonlyElementRef, ...(maxRows ? { as: 'textarea', rows: minRows } : { as: 'div' }), autoFocus: autoFocus, textAlign: textAlign, value: value, variant: "textarea", hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside' }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", colSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, variant: "textarea", mainContent: mainContent, ref: anchorRef, testId: testId, ...fieldLabelProps }) }));
    }
    const hasMaxLength = maxLength !== undefined;
    const mainContent = (jsxs(Fragment, { children: [jsx(TextFieldInput, { as: "textarea", "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', isRequired: isRequired, inputRef: enabledElementRef, onCommit: onCommitAndDispatch, onInput: onFilteredInput, placeholder: placeholder, role: role, rows: minRows, textAlign: textAlign, value: value, ...inputProps }), maxLengthCounter === 'remaining' && hasMaxLength && (jsx(MaxLengthCounter, { maxLength: maxLength, valueLength: valueLength, onClick: onClickCounter })), hasMaxLength && (jsx(HiddenAccessible, { id: maxLengthDescribedByIdRef.current, children: translations.formControl_maxLength({
                    MAX_LENGTH: `${maxLength}`
                }) })), hasMaxLength && isFocused && (jsx(MaxLengthLiveRegion, { maxLength: maxLength, valueLength: valueLength, testId: testId + '_remainingChars' }))] }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { mainContent: mainContent, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps?.onFocusOut, onFocus: focusProps?.onFocusIn, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps }) }));
});

export { TextAreaAutosize as T };
//# sourceMappingURL=TextAreaAutosize-b73aaa2f.js.map
