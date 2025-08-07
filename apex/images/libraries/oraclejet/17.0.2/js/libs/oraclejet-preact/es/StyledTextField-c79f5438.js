/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { LabelRedwoodTheme } from './UNSAFE_Label/themes/redwood/LabelTheme.js';
import { L as LabelValueLayout } from './LabelValueLayout-23b74176.js';
import { SkeletonRedwoodTheme } from './UNSAFE_Skeleton/themes/redwood/SkeletonTheme.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { l as layoutSpanStyles } from './LayoutStyles.css-a679044e.js';
import { forwardRef } from 'preact/compat';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { F as Flex } from './Flex-24628925.js';
import './InputGroupContext-20bdbd6e.js';
import { u as useInputGroupContext } from './useInputGroupContext-1d19411e.js';
import { u as useUser } from './useUser-99920e02.js';
import { TextFieldRedwoodTheme } from './UNSAFE_TextField/themes/redwood/TextFieldTheme.js';
import { ReadonlyTextFieldRedwoodTheme } from './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldTheme.js';
import { FormLayoutRedwoodTheme } from './UNSAFE_TextField/themes/redwood/FormLayoutTheme.js';

// Renders the oj-text-field-container dom which includes the
// main (where the inside label and inputElem goes),
// and end pieces of the form component.
// This does not include user assistance because that is rendered outside the
// oj-text-field-container; that is rendered in the TextField component.
const ReadonlyTextFieldContent = ({ variant, insideLabel, mainContent, endContent, rootRef, resize }) => {
    const { isFormLayout, isReadonly: isReadonlyForm } = useFormContext();
    const { isLoading } = useFormFieldContext();
    const { direction } = useUser();
    const isLtr = direction === 'ltr';
    const isInsideNonReadonlyForm = isFormLayout && !isReadonlyForm;
    const hasInsideLabel = insideLabel !== undefined;
    const inputGroupContext = useInputGroupContext();
    const hasGroupContext = inputGroupContext !== null;
    // depending on browser direction, apply the appropriate styling.
    // when 'rtl' the flex row direction is reversed.
    const inputGroupPosition = inputGroupContext
        ? inputGroupContext.last
            ? isLtr
                ? 'groupRight'
                : 'groupLeft'
            : inputGroupContext.index === 0
                ? isLtr
                    ? 'groupLeft'
                    : 'groupRight'
                : 'groupMiddle'
        : undefined;
    const { variantClasses: middleStyles, styles: { textFieldEndContent } } = useComponentTheme(TextFieldRedwoodTheme, {
        middleContent: variant,
        textAreaResizeDirection: resize && variant === 'textarea' ? direction : undefined
    });
    const { classes: readonlyClassNames, styles: { readonlyTextFieldMiddleBase, readonlyTextFieldMiddleNotInEnabledForm, readonlyTextFieldMiddleInEnabledForm, readonlyTextFieldMiddleInEnabledFormNotTextarea } } = useComponentTheme(ReadonlyTextFieldRedwoodTheme, {
        insideNonReadonlyForm: isInsideNonReadonlyForm
            ? 'isInsideNonReadonlyForm'
            : 'notInsideNonReadonlyForm',
        insideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel',
        textarea: variant === 'textarea' ? 'isTextArea' : 'notTextArea',
        loading: isLoading ? 'isLoading' : 'notLoading',
        withinGroup: hasGroupContext ? 'isWithinGroup' : undefined,
        inputGroupPosition,
        resize: resize ?? 'none'
    });
    const middleClasses = classNames([
        middleStyles,
        readonlyTextFieldMiddleBase,
        isInsideNonReadonlyForm && readonlyTextFieldMiddleInEnabledForm,
        isInsideNonReadonlyForm &&
            variant !== 'textarea' &&
            readonlyTextFieldMiddleInEnabledFormNotTextarea,
        !isInsideNonReadonlyForm && readonlyTextFieldMiddleNotInEnabledForm
    ]);
    return (jsxs("div", { role: "presentation", class: readonlyClassNames, ref: rootRef, children: [jsxs("div", { class: middleClasses, children: [insideLabel, mainContent] }), endContent && (jsx("span", { class: textFieldEndContent, children: jsx(Flex, { justify: "center", align: "center", hasZeroMargins: true, children: endContent }) }))] }));
};

const StartTopLabelReadonlyTextField = forwardRef(({ outerClassNames, label, labelEdge, labelStartWidth, compactUserAssistance, inlineUserAssistance, mainContent, endContent, rootRef, variant, resize, ...props }, ref) => {
    const parentComponentVariant = variant === 'textarea' ? 'textArea' : 'textField';
    return (jsxs("div", { ...props, ref: ref, class: outerClassNames, children: [compactUserAssistance, jsx(LabelValueLayout, { label: label, labelEdge: labelEdge, labelStartWidth: labelStartWidth, parentComponentVariant: parentComponentVariant, children: jsx(ReadonlyTextFieldContent, { mainContent: mainContent, endContent: endContent, rootRef: rootRef, ...(variant ? { variant, resize } : {}) }) }), inlineUserAssistance] }));
});
const InsideLabelReadonlyTextField = forwardRef(({ outerClassNames, compactUserAssistance, inlineUserAssistance, mainContent, endContent, label, rootRef, variant, resize, ...props }, ref) => {
    return (jsxs("div", { ...props, ref: ref, class: outerClassNames, children: [compactUserAssistance, jsx(ReadonlyTextFieldContent, { insideLabel: label, mainContent: mainContent, endContent: endContent, rootRef: rootRef, ...(variant ? { variant, resize } : {}) }), inlineUserAssistance] }));
});
const ReadonlyTextField = forwardRef(({ columnSpan = 1, label, labelEdge, mainContent, endContent, variant, mainFieldRef, testId, ...props }, ref) => {
    const testIdProps = useTestId(testId);
    const { classes, styles } = useComponentTheme(TextFieldRedwoodTheme, {
        readonly: 'isReadonly'
    });
    const { baseTheme: labelBaseTheme } = useComponentTheme(LabelRedwoodTheme);
    const { baseTheme: formLayoutTheme } = useComponentTheme(FormLayoutRedwoodTheme);
    const { formControlBase } = styles;
    // because TextField components reference Skeleton scoped vars, we need to bring in the Skeleton base theme
    // to pick up the scoped var definitions.
    const { baseTheme: skeletonBaseTheme } = useComponentTheme(SkeletonRedwoodTheme);
    const outerClassNames = classNames([
        classes,
        skeletonBaseTheme,
        formControlBase,
        formLayoutTheme,
        labelBaseTheme,
        layoutSpanStyles.layoutSpanColumn[columnSpan]
    ]);
    if (label !== undefined && (labelEdge === 'start' || labelEdge === 'top')) {
        return (jsx(StartTopLabelReadonlyTextField, { outerClassNames: outerClassNames, label: label, labelEdge: labelEdge, ref: ref, mainContent: mainContent, endContent: endContent, rootRef: mainFieldRef, variant: variant, ...props, ...testIdProps }));
    }
    return (jsx(InsideLabelReadonlyTextField, { outerClassNames: outerClassNames, ref: ref, label: label, mainContent: mainContent, endContent: endContent, rootRef: mainFieldRef, variant: variant, ...props, ...testIdProps }));
});

const StyledTextField = forwardRef(({ columnSpan = 1, hasInsideLabel = false, variant = 'default', ...props }, ref) => {
    // because of the mismatch of height for inputs with inside labels and no labels,
    // we'll have to set everything to the same min-height while within an input group context.
    // Here we'll look to see if it's present and apply the style as needed
    const groupContext = useInputGroupContext();
    const { isReadonly } = useFormFieldContext();
    const { baseTheme: formLayoutTheme } = useComponentTheme(FormLayoutRedwoodTheme);
    const { baseTheme: labelBaseTheme } = useComponentTheme(LabelRedwoodTheme);
    const { classes: textFieldClasses, styles } = useComponentTheme(TextFieldRedwoodTheme, {
        readonly: isReadonly ? 'isReadonly' : 'notReadonly',
        formControlInsideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel',
        withinGroup: groupContext !== null ? 'isWithinGroup' : undefined
    });
    const { formControlBase, textFieldBase, textFieldEmbedded } = styles;
    // because TextField components reference Skeleton scoped vars, we need to bring in the Skeleton base theme
    // to pick up the scoped var definitions.
    const { baseTheme: skeletonBaseTheme } = useComponentTheme(SkeletonRedwoodTheme);
    const classes = classNames([
        skeletonBaseTheme,
        formControlBase,
        textFieldBase,
        variant === 'embedded' && textFieldEmbedded,
        textFieldClasses,
        formLayoutTheme,
        labelBaseTheme,
        layoutSpanStyles.layoutSpanColumn[columnSpan]
    ]);
    return jsx("div", { ...props, class: classes, ref: ref });
});

export { ReadonlyTextField as R, StyledTextField as S };
//# sourceMappingURL=StyledTextField-c79f5438.js.map
