/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useAccessibleContext } from './useAccessibleContext-5744de8b.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { t as textInterpolations } from './textAlign-ad252afa.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { ReadonlyTextFieldInputRedwoodTheme } from './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputTheme.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';

/**
 * Merge multiple ids into a space-separated list
 * @param ids The ids to be merged
 * @returns The space separated string of ids
 */
function mergeIDs(...ids) {
    return ids.filter(Boolean).join(' ') || undefined;
}
function ReadonlyTextFieldInput({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, 'aria-labelledby': inputLabelledBy, autoFocus, as = 'div', elementRef, hasEmptyLabel, hasInsideLabel = false, inlineUserAssistance, innerReadonlyField, rows, type, value = '', variant, ...props }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const loadingAriaLabel = translations.formControl_loading();
    const { isFormLayout, isReadonly: isReadonlyForm } = useFormContext();
    const { isLoading } = useFormFieldContext();
    const ariaLabelForReadonly = isLoading ? loadingAriaLabel : ariaLabel;
    // get classes for text align
    const interpolations = [...Object.values(textInterpolations)];
    const styleInterpolations = mergeInterpolations(interpolations);
    const { class: styleInterpolationClasses } = styleInterpolations(props);
    const { classes: themeClasses } = useComponentTheme(ReadonlyTextFieldInputRedwoodTheme, {
        textarea: variant === 'textarea' ? 'isTextArea' : 'notTextArea',
        formLayout: isFormLayout ? 'isFormLayout' : 'notFormLayout',
        readonlyForm: isReadonlyForm ? 'isReadonlyForm' : 'notReadonlyForm',
        insideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel'
    });
    const readonlyDivClasses = classNames([themeClasses, styleInterpolationClasses]);
    // JET-52914 - Implement Tabbable mode API contract in InputText
    // spread tabbableModeProps on component
    const { isTabbable, tabbableModeProps } = useTabbableMode();
    // JET-52089: add unsafe API for specifying an external label which is added to ariaLabelledBy on the input or div,
    // only when labelEdge is 'none' and label is ''. Since ariaLabelledBy takes precedence over all other
    // kinds of labels, this helps to ensure we don't override a meaningful label.
    const { UNSAFE_ariaLabelledBy } = useAccessibleContext();
    const ariaLabelledBy = hasEmptyLabel
        ? mergeIDs(inputLabelledBy, UNSAFE_ariaLabelledBy)
        : inputLabelledBy;
    if (as === 'input') {
        return (jsx("input", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabelForReadonly, "aria-labelledby": ariaLabelledBy, autofocus: autoFocus, class: readonlyDivClasses, readonly: true, 
            // @ts-ignore
            ref: elementRef, type: type, value: value, ...(!isTabbable && tabbableModeProps) }));
    }
    if (as === 'textarea') {
        return (jsx("textarea", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabelForReadonly, "aria-labelledby": ariaLabelledBy, autofocus: autoFocus, class: readonlyDivClasses, readonly: true, 
            // @ts-ignore
            ref: elementRef, rows: rows, ...(!isTabbable && tabbableModeProps), children: value }));
    }
    return (jsx("div", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabelForReadonly, "aria-labelledby": ariaLabelledBy, "aria-readonly": true, autofocus: autoFocus, class: readonlyDivClasses, 
        // @ts-ignore
        ref: elementRef, role: "textbox", ...tabbableModeProps, children: value }));
}

export { ReadonlyTextFieldInput as R };
//# sourceMappingURL=ReadonlyTextFieldInput-4392c7aa.js.map
