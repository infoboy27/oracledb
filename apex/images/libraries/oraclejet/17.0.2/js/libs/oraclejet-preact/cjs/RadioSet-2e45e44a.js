/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var compat = require('preact/compat');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
require('preact/hooks');
var useFormFieldContextProps = require('./useFormFieldContextProps-8c04ed0f.js');
var useId = require('./useId-6c0eeb27.js');
var RadioItemContext = require('./RadioItemContext-3a86c17d.js');
var CheckboxRadioField = require('./CheckboxRadioField-0d4b2c66.js');

/**
 * A radio set allows the user to select one option from a set of mutually exclusive options.
 */
const RadioSet = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, direction = 'column', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, onCommit, testId, userAssistanceDensity: propUserAssistanceDensity, value, children }, ref) => {
    const hasValue = !!value;
    const { isDisabled: isFormDisabled, 
    // TODO: unused variables, are they needed?
    // isFormLayout,
    isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const formFieldContext = useFormFieldContextProps.useFormFieldContextProps({
        hasValue,
        isDisabled,
        isReadonly
    });
    const baseId = useId.useId();
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(CheckboxRadioField.CheckboxRadioField, { "aria-describedby": ariaDescribedBy, assistiveText: assistiveText, baseId: baseId, columnSpan: columnSpan, direction: direction, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, isRequired: isRequired, label: label, labelEdge: labelEdge, labelStartWidth: labelStartWidth, parentComponentVariant: "radioSet", messages: messages, userAssistanceDensity: userAssistanceDensity, hasValue: hasValue, ref: ref, role: "radiogroup", testId: testId, children: jsxRuntime.jsx(RadioItemContext.RadioSetContext.Provider, { value: {
                    name: baseId,
                    value,
                    onCommit
                }, children: preact.toChildArray(children).map((child, index) => (jsxRuntime.jsx(RadioItemContext.RadioItemContext.Provider, { value: { index }, children: child }))) }) }) }));
});

exports.RadioSet = RadioSet;
//# sourceMappingURL=RadioSet-2e45e44a.js.map
