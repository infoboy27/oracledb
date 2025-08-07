/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var UNSAFE_Label_themes_redwood_LabelTheme = require('./UNSAFE_Label/themes/redwood/LabelTheme.js');
var LabelValueLayout = require('./LabelValueLayout-24937fa5.js');
var UNSAFE_Skeleton_themes_redwood_SkeletonTheme = require('./UNSAFE_Skeleton/themes/redwood/SkeletonTheme.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useTestId = require('./useTestId-8234ec1e.js');
var classNames = require('./classNames-c14c6ef3.js');
var LayoutStyles_css = require('./LayoutStyles.css-8af668b9.js');
var compat = require('preact/compat');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var Flex = require('./Flex-fbba4ad6.js');
require('./InputGroupContext-05f2a46f.js');
var useInputGroupContext = require('./useInputGroupContext-4c10bd57.js');
var useUser = require('./useUser-a6d15333.js');
var UNSAFE_TextField_themes_redwood_TextFieldTheme = require('./UNSAFE_TextField/themes/redwood/TextFieldTheme.js');
var UNSAFE_TextField_themes_redwood_ReadonlyTextFieldTheme = require('./UNSAFE_TextField/themes/redwood/ReadonlyTextFieldTheme.js');
var UNSAFE_TextField_themes_redwood_FormLayoutTheme = require('./UNSAFE_TextField/themes/redwood/FormLayoutTheme.js');

// Renders the oj-text-field-container dom which includes the
// main (where the inside label and inputElem goes),
// and end pieces of the form component.
// This does not include user assistance because that is rendered outside the
// oj-text-field-container; that is rendered in the TextField component.
const ReadonlyTextFieldContent = ({ variant, insideLabel, mainContent, endContent, rootRef, resize }) => {
    const { isFormLayout, isReadonly: isReadonlyForm } = useFormContext.useFormContext();
    const { isLoading } = useFormFieldContext.useFormFieldContext();
    const { direction } = useUser.useUser();
    const isLtr = direction === 'ltr';
    const isInsideNonReadonlyForm = isFormLayout && !isReadonlyForm;
    const hasInsideLabel = insideLabel !== undefined;
    const inputGroupContext = useInputGroupContext.useInputGroupContext();
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
    const { variantClasses: middleStyles, styles: { textFieldEndContent } } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldTheme.TextFieldRedwoodTheme, {
        middleContent: variant,
        textAreaResizeDirection: resize && variant === 'textarea' ? direction : undefined
    });
    const { classes: readonlyClassNames, styles: { readonlyTextFieldMiddleBase, readonlyTextFieldMiddleNotInEnabledForm, readonlyTextFieldMiddleInEnabledForm, readonlyTextFieldMiddleInEnabledFormNotTextarea } } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_ReadonlyTextFieldTheme.ReadonlyTextFieldRedwoodTheme, {
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
    const middleClasses = classNames.classNames([
        middleStyles,
        readonlyTextFieldMiddleBase,
        isInsideNonReadonlyForm && readonlyTextFieldMiddleInEnabledForm,
        isInsideNonReadonlyForm &&
            variant !== 'textarea' &&
            readonlyTextFieldMiddleInEnabledFormNotTextarea,
        !isInsideNonReadonlyForm && readonlyTextFieldMiddleNotInEnabledForm
    ]);
    return (jsxRuntime.jsxs("div", { role: "presentation", class: readonlyClassNames, ref: rootRef, children: [jsxRuntime.jsxs("div", { class: middleClasses, children: [insideLabel, mainContent] }), endContent && (jsxRuntime.jsx("span", { class: textFieldEndContent, children: jsxRuntime.jsx(Flex.Flex, { justify: "center", align: "center", hasZeroMargins: true, children: endContent }) }))] }));
};

const StartTopLabelReadonlyTextField = compat.forwardRef(({ outerClassNames, label, labelEdge, labelStartWidth, compactUserAssistance, inlineUserAssistance, mainContent, endContent, rootRef, variant, resize, ...props }, ref) => {
    const parentComponentVariant = variant === 'textarea' ? 'textArea' : 'textField';
    return (jsxRuntime.jsxs("div", { ...props, ref: ref, class: outerClassNames, children: [compactUserAssistance, jsxRuntime.jsx(LabelValueLayout.LabelValueLayout, { label: label, labelEdge: labelEdge, labelStartWidth: labelStartWidth, parentComponentVariant: parentComponentVariant, children: jsxRuntime.jsx(ReadonlyTextFieldContent, { mainContent: mainContent, endContent: endContent, rootRef: rootRef, ...(variant ? { variant, resize } : {}) }) }), inlineUserAssistance] }));
});
const InsideLabelReadonlyTextField = compat.forwardRef(({ outerClassNames, compactUserAssistance, inlineUserAssistance, mainContent, endContent, label, rootRef, variant, resize, ...props }, ref) => {
    return (jsxRuntime.jsxs("div", { ...props, ref: ref, class: outerClassNames, children: [compactUserAssistance, jsxRuntime.jsx(ReadonlyTextFieldContent, { insideLabel: label, mainContent: mainContent, endContent: endContent, rootRef: rootRef, ...(variant ? { variant, resize } : {}) }), inlineUserAssistance] }));
});
const ReadonlyTextField = compat.forwardRef(({ columnSpan = 1, label, labelEdge, mainContent, endContent, variant, mainFieldRef, testId, ...props }, ref) => {
    const testIdProps = useTestId.useTestId(testId);
    const { classes, styles } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldTheme.TextFieldRedwoodTheme, {
        readonly: 'isReadonly'
    });
    const { baseTheme: labelBaseTheme } = useComponentTheme.useComponentTheme(UNSAFE_Label_themes_redwood_LabelTheme.LabelRedwoodTheme);
    const { baseTheme: formLayoutTheme } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_FormLayoutTheme.FormLayoutRedwoodTheme);
    const { formControlBase } = styles;
    // because TextField components reference Skeleton scoped vars, we need to bring in the Skeleton base theme
    // to pick up the scoped var definitions.
    const { baseTheme: skeletonBaseTheme } = useComponentTheme.useComponentTheme(UNSAFE_Skeleton_themes_redwood_SkeletonTheme.SkeletonRedwoodTheme);
    const outerClassNames = classNames.classNames([
        classes,
        skeletonBaseTheme,
        formControlBase,
        formLayoutTheme,
        labelBaseTheme,
        LayoutStyles_css.layoutSpanStyles.layoutSpanColumn[columnSpan]
    ]);
    if (label !== undefined && (labelEdge === 'start' || labelEdge === 'top')) {
        return (jsxRuntime.jsx(StartTopLabelReadonlyTextField, { outerClassNames: outerClassNames, label: label, labelEdge: labelEdge, ref: ref, mainContent: mainContent, endContent: endContent, rootRef: mainFieldRef, variant: variant, ...props, ...testIdProps }));
    }
    return (jsxRuntime.jsx(InsideLabelReadonlyTextField, { outerClassNames: outerClassNames, ref: ref, label: label, mainContent: mainContent, endContent: endContent, rootRef: mainFieldRef, variant: variant, ...props, ...testIdProps }));
});

const StyledTextField = compat.forwardRef(({ columnSpan = 1, hasInsideLabel = false, variant = 'default', ...props }, ref) => {
    // because of the mismatch of height for inputs with inside labels and no labels,
    // we'll have to set everything to the same min-height while within an input group context.
    // Here we'll look to see if it's present and apply the style as needed
    const groupContext = useInputGroupContext.useInputGroupContext();
    const { isReadonly } = useFormFieldContext.useFormFieldContext();
    const { baseTheme: formLayoutTheme } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_FormLayoutTheme.FormLayoutRedwoodTheme);
    const { baseTheme: labelBaseTheme } = useComponentTheme.useComponentTheme(UNSAFE_Label_themes_redwood_LabelTheme.LabelRedwoodTheme);
    const { classes: textFieldClasses, styles } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldTheme.TextFieldRedwoodTheme, {
        readonly: isReadonly ? 'isReadonly' : 'notReadonly',
        formControlInsideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel',
        withinGroup: groupContext !== null ? 'isWithinGroup' : undefined
    });
    const { formControlBase, textFieldBase, textFieldEmbedded } = styles;
    // because TextField components reference Skeleton scoped vars, we need to bring in the Skeleton base theme
    // to pick up the scoped var definitions.
    const { baseTheme: skeletonBaseTheme } = useComponentTheme.useComponentTheme(UNSAFE_Skeleton_themes_redwood_SkeletonTheme.SkeletonRedwoodTheme);
    const classes = classNames.classNames([
        skeletonBaseTheme,
        formControlBase,
        textFieldBase,
        variant === 'embedded' && textFieldEmbedded,
        textFieldClasses,
        formLayoutTheme,
        labelBaseTheme,
        LayoutStyles_css.layoutSpanStyles.layoutSpanColumn[columnSpan]
    ]);
    return jsxRuntime.jsx("div", { ...props, class: classes, ref: ref });
});

exports.ReadonlyTextField = ReadonlyTextField;
exports.StyledTextField = StyledTextField;
//# sourceMappingURL=StyledTextField-351ea57e.js.map
