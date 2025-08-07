/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useAccessibleContext = require('./useAccessibleContext-c49d8d1b.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var classNames = require('./classNames-c14c6ef3.js');
var textAlign = require('./textAlign-f41f49db.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_TextField_themes_redwood_ReadonlyTextFieldInputTheme = require('./UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputTheme.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');

/**
 * Merge multiple ids into a space-separated list
 * @param ids The ids to be merged
 * @returns The space separated string of ids
 */
function mergeIDs(...ids) {
    return ids.filter(Boolean).join(' ') || undefined;
}
function ReadonlyTextFieldInput({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, 'aria-labelledby': inputLabelledBy, autoFocus, as = 'div', elementRef, hasEmptyLabel, hasInsideLabel = false, inlineUserAssistance, innerReadonlyField, rows, type, value = '', variant, ...props }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const loadingAriaLabel = translations.formControl_loading();
    const { isFormLayout, isReadonly: isReadonlyForm } = useFormContext.useFormContext();
    const { isLoading } = useFormFieldContext.useFormFieldContext();
    const ariaLabelForReadonly = isLoading ? loadingAriaLabel : ariaLabel;
    // get classes for text align
    const interpolations = [...Object.values(textAlign.textInterpolations)];
    const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
    const { class: styleInterpolationClasses } = styleInterpolations(props);
    const { classes: themeClasses } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_ReadonlyTextFieldInputTheme.ReadonlyTextFieldInputRedwoodTheme, {
        textarea: variant === 'textarea' ? 'isTextArea' : 'notTextArea',
        formLayout: isFormLayout ? 'isFormLayout' : 'notFormLayout',
        readonlyForm: isReadonlyForm ? 'isReadonlyForm' : 'notReadonlyForm',
        insideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel'
    });
    const readonlyDivClasses = classNames.classNames([themeClasses, styleInterpolationClasses]);
    // JET-52914 - Implement Tabbable mode API contract in InputText
    // spread tabbableModeProps on component
    const { isTabbable, tabbableModeProps } = useTabbableMode.useTabbableMode();
    // JET-52089: add unsafe API for specifying an external label which is added to ariaLabelledBy on the input or div,
    // only when labelEdge is 'none' and label is ''. Since ariaLabelledBy takes precedence over all other
    // kinds of labels, this helps to ensure we don't override a meaningful label.
    const { UNSAFE_ariaLabelledBy } = useAccessibleContext.useAccessibleContext();
    const ariaLabelledBy = hasEmptyLabel
        ? mergeIDs(inputLabelledBy, UNSAFE_ariaLabelledBy)
        : inputLabelledBy;
    if (as === 'input') {
        return (jsxRuntime.jsx("input", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabelForReadonly, "aria-labelledby": ariaLabelledBy, autofocus: autoFocus, class: readonlyDivClasses, readonly: true, 
            // @ts-ignore
            ref: elementRef, type: type, value: value, ...(!isTabbable && tabbableModeProps) }));
    }
    if (as === 'textarea') {
        return (jsxRuntime.jsx("textarea", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabelForReadonly, "aria-labelledby": ariaLabelledBy, autofocus: autoFocus, class: readonlyDivClasses, readonly: true, 
            // @ts-ignore
            ref: elementRef, rows: rows, ...(!isTabbable && tabbableModeProps), children: value }));
    }
    return (jsxRuntime.jsx("div", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabelForReadonly, "aria-labelledby": ariaLabelledBy, "aria-readonly": true, autofocus: autoFocus, class: readonlyDivClasses, 
        // @ts-ignore
        ref: elementRef, role: "textbox", ...tabbableModeProps, children: value }));
}

exports.ReadonlyTextFieldInput = ReadonlyTextFieldInput;
//# sourceMappingURL=ReadonlyTextFieldInput-fb7ffa5e.js.map
