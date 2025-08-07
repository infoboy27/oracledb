/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var Flex = require('./Flex-fbba4ad6.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var size = require('./size-4e606ce4.js');

var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_TextField_themes_redwood_TextFieldTheme = require('./UNSAFE_TextField/themes/redwood/TextFieldTheme.js');
var UNSAFE_RadioItem_themes_redwood_RadioTheme = require('./UNSAFE_RadioItem/themes/redwood/RadioTheme.js');
var UNSAFE_Label_themes_redwood_LabelTheme = require('./UNSAFE_Label/themes/redwood/LabelTheme.js');
var UNSAFE_TextField_themes_redwood_FormLayoutTheme = require('./UNSAFE_TextField/themes/redwood/FormLayoutTheme.js');
var UNSAFE_Checkbox_themes_redwood_CheckboxTheme = require('./UNSAFE_Checkbox/themes/redwood/CheckboxTheme.js');

var labelInnerStyles = {base:'LabelValueLayoutStyles_labelInnerStyles_base__z3rxc55',start:'LabelValueLayoutStyles_labelInnerStyles_start__z3rxc56',startNotPureReadonly:'LabelValueLayoutStyles_labelInnerStyles_startNotPureReadonly__z3rxc57',startWithNoTopRadioSetUA:'LabelValueLayoutStyles_labelInnerStyles_startWithNoTopRadioSetUA__z3rxc58',insideRadioSet:'LabelValueLayoutStyles_labelInnerStyles_insideRadioSet__z3rxc59',startWithNoTopCheckboxSetUA:'LabelValueLayoutStyles_labelInnerStyles_startWithNoTopCheckboxSetUA__z3rxc5a',insideCheckboxSet:'LabelValueLayoutStyles_labelInnerStyles_insideCheckboxSet__z3rxc5b',noWrap:'LabelValueLayoutStyles_labelInnerStyles_noWrap__z3rxc5c'};
var labelSlotStyles = {base:'LabelValueLayoutStyles_labelSlotStyles_base__z3rxc50',start:'LabelValueLayoutStyles_labelSlotStyles_start__z3rxc51',top:'LabelValueLayoutStyles_labelSlotStyles_top__z3rxc52',topAndTopUA:'LabelValueLayoutStyles_labelSlotStyles_topAndTopUA__z3rxc53',topPureReadonly:'LabelValueLayoutStyles_labelSlotStyles_topPureReadonly__z3rxc54'};
var valueSlotStyles = 'LabelValueLayoutStyles_valueSlotStyles__z3rxc5d';

const LabelValueLayout = ({ label, labelEdge, children, labelStartWidth = '33%', parentComponentVariant = 'textField', hasTopUserAssistance = false }) => {
    const { baseTheme: textFieldTheme } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldTheme.TextFieldRedwoodTheme);
    const { baseTheme: radioTheme } = useComponentTheme.useComponentTheme(UNSAFE_RadioItem_themes_redwood_RadioTheme.RadioRedwoodTheme);
    const { baseTheme: checkboxTheme } = useComponentTheme.useComponentTheme(UNSAFE_Checkbox_themes_redwood_CheckboxTheme.CheckboxRedwoodTheme);
    const { baseTheme: labelTheme } = useComponentTheme.useComponentTheme(UNSAFE_Label_themes_redwood_LabelTheme.LabelRedwoodTheme);
    const { baseTheme: formLayoutTheme } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_FormLayoutTheme.FormLayoutRedwoodTheme);
    const isTextField = parentComponentVariant.startsWith('text');
    const isRadio = parentComponentVariant === 'radioSet';
    const isCheckbox = parentComponentVariant === 'checkboxSet';
    const isStart = labelEdge === 'start';
    const isTop = labelEdge === 'top' || labelEdge === 'inside'; // 'inside' needs to pick up all 'top' styles.
    const isInside = labelEdge === 'inside';
    const width = size.sizeToCSS(labelStartWidth);
    const valueWidth = `calc(100% - ${width})`;
    const labelStyles = isStart
        ? { flexBasis: width, width: width, maxWidth: width }
        : {};
    const valueStyles = isStart
        ? { flexBasis: valueWidth, width: valueWidth, maxWidth: valueWidth }
        : {};
    const { isFormLayout, isReadonly: isFormReadonly, labelWrapping } = useFormContext.useFormContext();
    const { isReadonly } = useFormFieldContext.useFormFieldContext();
    const isPureReadonly = (isFormLayout && isFormReadonly) || (!isFormLayout && isReadonly);
    const labelStyleClasses = classNames.classNames([
        formLayoutTheme,
        labelSlotStyles.base,
        isStart && labelSlotStyles.start,
        isTop && labelSlotStyles.top,
        isTop && hasTopUserAssistance && labelSlotStyles.topAndTopUA,
        isTop && isPureReadonly && labelSlotStyles.topPureReadonly
    ]);
    const labelInnerClasses = classNames.classNames([
        isTextField && textFieldTheme,
        isRadio && radioTheme,
        isCheckbox && checkboxTheme,
        (isRadio || isCheckbox) && labelTheme,
        formLayoutTheme,
        labelInnerStyles.base,
        isStart && labelInnerStyles.start,
        isTextField && isStart && !isPureReadonly && labelInnerStyles.startNotPureReadonly,
        isRadio && isInside && labelInnerStyles.insideRadioSet,
        isCheckbox && isInside && labelInnerStyles.insideCheckboxSet,
        isRadio && isStart && !hasTopUserAssistance && labelInnerStyles.startWithNoTopRadioSetUA,
        isCheckbox && isStart && !hasTopUserAssistance && labelInnerStyles.startWithNoTopCheckboxSetUA,
        labelWrapping === 'truncate' && labelInnerStyles.noWrap
    ]);
    return (
    // For readonly start aligned labels, we want the div that is the parent of the label to
    // stretch to the height of the value content, including the end content (InputSensitiveText)
    jsxRuntime.jsxs(Flex.Flex, { wrap: "wrap", align: isReadonly && isStart ? 'stretch' : 'start', children: [jsxRuntime.jsx("div", { class: labelStyleClasses, style: labelStyles, children: jsxRuntime.jsx("div", { class: labelInnerClasses, children: label }) }), jsxRuntime.jsx("div", { class: valueSlotStyles, style: valueStyles, children: children })] }));
};

exports.LabelValueLayout = LabelValueLayout;
//# sourceMappingURL=LabelValueLayout-24937fa5.js.map
