/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
var hooks = require('preact/hooks');
var useFocusableTextField = require('./useFocusableTextField-c18d39c2.js');
var Label = require('./Label-d9ad059f.js');
var TextFieldInput = require('./TextFieldInput-4904c227.js');

var ReadonlyTextFieldInput = require('./ReadonlyTextFieldInput-fb7ffa5e.js');
var StyledTextField = require('./StyledTextField-351ea57e.js');
var TextField = require('./TextField-0f4e945f.js');
var MaxLengthLiveRegion = require('./MaxLengthLiveRegion-85913361.js');
var useTextField = require('./useTextField-3ce8f0d0.js');
require('./logger-2b636482.js');
require('./TabbableModeContext-e99d527e.js');
var useId = require('./useId-6c0eeb27.js');
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
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');

require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var useLengthFilter = require('./useLengthFilter-d4cb6f47.js');
var useCurrentValueReducer = require('./useCurrentValueReducer-f37ac024.js');
var MaxLengthCounter = require('./MaxLengthCounter-a5370f66.js');

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
    hooks.useLayoutEffect(() => {
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
const TextAreaAutosize = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoComplete = 'off', autoFocus = false, columnSpan, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, maxLength, maxLengthCounter = 'remaining', maxLengthUnit, maxRows, messages, minRows = 2, placeholder, role, 
//TODO: Add counter to show the length remaining - JET-50752
textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', onInput, onCommit, testId }, ref) => {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const formControl_limitReached = maxLength
        ? translations.formControl_limitReached({
            CHARACTER_LIMIT: maxLength
        })
        : '';
    const { currentCommitValue, dispatch } = useCurrentValueReducer.useCurrentValueReducer({ value });
    const onInputAndDispatch = compat.useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = compat.useCallback((detail) => {
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
    const maxLengthDescribedByIdRef = compat.useRef(useId.useId());
    // The enabledAriaDescribedBy includes the maxLengthDescribedById in addition to what was passed in to aria-describedby.
    // We don't need to announce the max length message for readonly, as it only applies when editing the value.
    const enabledAriaDescribedBy = ariaDescribedBy
        ? `${ariaDescribedBy} ${maxLengthDescribedByIdRef.current}`
        : maxLengthDescribedByIdRef.current;
    const { enabledElementRef, readonlyElementRef, focusProps, isFocused } = useFocusableTextField.useFocusableTextField({ isDisabled, isReadonly, ref });
    // Handle length filter for user-typed inputs and controlled inputs
    const { isMaxLengthReached, valueLength, onFilteredInput } = useLengthFilter.useLengthFilter({
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
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField.useTextField({
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
    const onClickCounter = compat.useCallback(() => {
        const elm = enabledElementRef.current;
        // for setSelectionRange(), len needs to be a number or null.
        const len = elm ? elm.value.length : null;
        // Since the counter element is after the text, clicking in this
        // should put the selection at the end of the text
        enabledElementRef.current?.setSelectionRange(len, len);
        // Clicking the counter should put the focus on the input field
        enabledElementRef.current?.focus();
    }, [enabledElementRef]);
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
    const anchorRef = compat.useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsxRuntime.jsx(CompactUserAssistance.CompactUserAssistance, { anchorRef: anchorRef, messages: allMessages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
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
        const mainContent = (jsxRuntime.jsx(ReadonlyTextFieldInput.ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, elementRef: readonlyElementRef, ...(maxRows ? { as: 'textarea', rows: minRows } : { as: 'div' }), autoFocus: autoFocus, textAlign: textAlign, value: value, variant: "textarea", hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside' }));
        return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(StyledTextField.ReadonlyTextField, { role: "presentation", colSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, variant: "textarea", mainContent: mainContent, ref: anchorRef, testId: testId, ...fieldLabelProps }) }));
    }
    const hasMaxLength = maxLength !== undefined;
    const mainContent = (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(TextFieldInput.TextFieldInput, { as: "textarea", "aria-label": ariaLabel, autoComplete: autoComplete, autoFocus: autoFocus, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', isRequired: isRequired, inputRef: enabledElementRef, onCommit: onCommitAndDispatch, onInput: onFilteredInput, placeholder: placeholder, role: role, rows: minRows, textAlign: textAlign, value: value, ...inputProps }), maxLengthCounter === 'remaining' && hasMaxLength && (jsxRuntime.jsx(MaxLengthCounter.MaxLengthCounter, { maxLength: maxLength, valueLength: valueLength, onClick: onClickCounter })), hasMaxLength && (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: maxLengthDescribedByIdRef.current, children: translations.formControl_maxLength({
                    MAX_LENGTH: `${maxLength}`
                }) })), hasMaxLength && isFocused && (jsxRuntime.jsx(MaxLengthLiveRegion.MaxLengthLiveRegion, { maxLength: maxLength, valueLength: valueLength, testId: testId + '_remainingChars' }))] }));
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(TextField.TextField, { mainContent: mainContent, columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps?.onFocusOut, onFocus: focusProps?.onFocusIn, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps }) }));
});

exports.TextAreaAutosize = TextAreaAutosize;
//# sourceMappingURL=TextAreaAutosize-d8cad6ce.js.map
