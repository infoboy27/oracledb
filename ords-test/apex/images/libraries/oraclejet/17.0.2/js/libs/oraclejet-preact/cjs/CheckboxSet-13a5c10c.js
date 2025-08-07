/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var hooks = require('preact/hooks');
var compat = require('preact/compat');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
var useFormFieldContextProps = require('./useFormFieldContextProps-8c04ed0f.js');

var useId = require('./useId-6c0eeb27.js');
var CheckboxRadioField = require('./CheckboxRadioField-0d4b2c66.js');

const CheckboxSetContext = preact.createContext({});
const useCheckboxSetContext = () => hooks.useContext(CheckboxSetContext);

var styles = {ul:'CheckboxSetStyles_styles_ul__68p6630'};

/**
 * A CheckboxSet set allows the user to select one or more options from a set.
 */
const CheckboxSet = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, direction = 'column', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, onCommit, userAssistanceDensity: propUserAssistanceDensity, value, children, testId }, ref) => {
    const hasValue = value !== undefined ? value.size > 0 : false;
    const baseId = useId.useId();
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
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
    const checkboxSetContext = hooks.useMemo(() => ({
        name: baseId,
        value,
        onCommit
    }), [baseId, onCommit, value]);
    // wrap each CheckboxItem in an <li> tag and the entire set with <ul>
    const childrenArray = preact.toChildArray(children).filter(Boolean);
    const wrappedChildren = childrenArray.map((item) => jsxRuntime.jsx("li", { children: item }));
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(CheckboxRadioField.CheckboxRadioField, { "aria-describedby": ariaDescribedBy, assistiveText: assistiveText, baseId: baseId, columnSpan: columnSpan, direction: direction, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, isRequired: isRequired, label: label, labelEdge: labelEdge, labelStartWidth: labelStartWidth, parentComponentVariant: "checkboxSet", messages: messages, userAssistanceDensity: userAssistanceDensity, hasValue: hasValue, role: "group", testId: testId, ref: ref, children: jsxRuntime.jsx(CheckboxSetContext.Provider, { value: checkboxSetContext, children: jsxRuntime.jsx("ul", { className: styles.ul, children: wrappedChildren }) }) }) }));
});

exports.CheckboxSet = CheckboxSet;
exports.CheckboxSetContext = CheckboxSetContext;
exports.useCheckboxSetContext = useCheckboxSetContext;
//# sourceMappingURL=CheckboxSet-13a5c10c.js.map
