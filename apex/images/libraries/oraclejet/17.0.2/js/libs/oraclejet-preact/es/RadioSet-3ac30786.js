/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { toChildArray } from 'preact';
import { forwardRef } from 'preact/compat';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import 'preact/hooks';
import { u as useFormFieldContextProps } from './useFormFieldContextProps-d07cd618.js';
import { u as useId } from './useId-03dbfdf0.js';
import { R as RadioSetContext, b as RadioItemContext } from './RadioItemContext-fe419b75.js';
import { C as CheckboxRadioField } from './CheckboxRadioField-c7c4643e.js';

/**
 * A radio set allows the user to select one option from a set of mutually exclusive options.
 */
const RadioSet = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, direction = 'column', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, onCommit, testId, userAssistanceDensity: propUserAssistanceDensity, value, children }, ref) => {
    const hasValue = !!value;
    const { isDisabled: isFormDisabled, 
    // TODO: unused variables, are they needed?
    // isFormLayout,
    isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const formFieldContext = useFormFieldContextProps({
        hasValue,
        isDisabled,
        isReadonly
    });
    const baseId = useId();
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(CheckboxRadioField, { "aria-describedby": ariaDescribedBy, assistiveText: assistiveText, baseId: baseId, columnSpan: columnSpan, direction: direction, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, isRequired: isRequired, label: label, labelEdge: labelEdge, labelStartWidth: labelStartWidth, parentComponentVariant: "radioSet", messages: messages, userAssistanceDensity: userAssistanceDensity, hasValue: hasValue, ref: ref, role: "radiogroup", testId: testId, children: jsx(RadioSetContext.Provider, { value: {
                    name: baseId,
                    value,
                    onCommit
                }, children: toChildArray(children).map((child, index) => (jsx(RadioItemContext.Provider, { value: { index }, children: child }))) }) }) }));
});

export { RadioSet as R };
//# sourceMappingURL=RadioSet-3ac30786.js.map
