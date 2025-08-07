/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { F as Flex } from './Flex-24628925.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { s as sizeToCSS } from './size-782ed57a.js';
import './LabelValueLayoutStyles.styles.css';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { TextFieldRedwoodTheme } from './UNSAFE_TextField/themes/redwood/TextFieldTheme.js';
import { RadioRedwoodTheme } from './UNSAFE_RadioItem/themes/redwood/RadioTheme.js';
import { LabelRedwoodTheme } from './UNSAFE_Label/themes/redwood/LabelTheme.js';
import { FormLayoutRedwoodTheme } from './UNSAFE_TextField/themes/redwood/FormLayoutTheme.js';
import { CheckboxRedwoodTheme } from './UNSAFE_Checkbox/themes/redwood/CheckboxTheme.js';

var labelInnerStyles = {base:'LabelValueLayoutStyles_labelInnerStyles_base__z3rxc55',start:'LabelValueLayoutStyles_labelInnerStyles_start__z3rxc56',startNotPureReadonly:'LabelValueLayoutStyles_labelInnerStyles_startNotPureReadonly__z3rxc57',startWithNoTopRadioSetUA:'LabelValueLayoutStyles_labelInnerStyles_startWithNoTopRadioSetUA__z3rxc58',insideRadioSet:'LabelValueLayoutStyles_labelInnerStyles_insideRadioSet__z3rxc59',startWithNoTopCheckboxSetUA:'LabelValueLayoutStyles_labelInnerStyles_startWithNoTopCheckboxSetUA__z3rxc5a',insideCheckboxSet:'LabelValueLayoutStyles_labelInnerStyles_insideCheckboxSet__z3rxc5b',noWrap:'LabelValueLayoutStyles_labelInnerStyles_noWrap__z3rxc5c'};
var labelSlotStyles = {base:'LabelValueLayoutStyles_labelSlotStyles_base__z3rxc50',start:'LabelValueLayoutStyles_labelSlotStyles_start__z3rxc51',top:'LabelValueLayoutStyles_labelSlotStyles_top__z3rxc52',topAndTopUA:'LabelValueLayoutStyles_labelSlotStyles_topAndTopUA__z3rxc53',topPureReadonly:'LabelValueLayoutStyles_labelSlotStyles_topPureReadonly__z3rxc54'};
var valueSlotStyles = 'LabelValueLayoutStyles_valueSlotStyles__z3rxc5d';

const LabelValueLayout = ({ label, labelEdge, children, labelStartWidth = '33%', parentComponentVariant = 'textField', hasTopUserAssistance = false }) => {
    const { baseTheme: textFieldTheme } = useComponentTheme(TextFieldRedwoodTheme);
    const { baseTheme: radioTheme } = useComponentTheme(RadioRedwoodTheme);
    const { baseTheme: checkboxTheme } = useComponentTheme(CheckboxRedwoodTheme);
    const { baseTheme: labelTheme } = useComponentTheme(LabelRedwoodTheme);
    const { baseTheme: formLayoutTheme } = useComponentTheme(FormLayoutRedwoodTheme);
    const isTextField = parentComponentVariant.startsWith('text');
    const isRadio = parentComponentVariant === 'radioSet';
    const isCheckbox = parentComponentVariant === 'checkboxSet';
    const isStart = labelEdge === 'start';
    const isTop = labelEdge === 'top' || labelEdge === 'inside'; // 'inside' needs to pick up all 'top' styles.
    const isInside = labelEdge === 'inside';
    const width = sizeToCSS(labelStartWidth);
    const valueWidth = `calc(100% - ${width})`;
    const labelStyles = isStart
        ? { flexBasis: width, width: width, maxWidth: width }
        : {};
    const valueStyles = isStart
        ? { flexBasis: valueWidth, width: valueWidth, maxWidth: valueWidth }
        : {};
    const { isFormLayout, isReadonly: isFormReadonly, labelWrapping } = useFormContext();
    const { isReadonly } = useFormFieldContext();
    const isPureReadonly = (isFormLayout && isFormReadonly) || (!isFormLayout && isReadonly);
    const labelStyleClasses = classNames([
        formLayoutTheme,
        labelSlotStyles.base,
        isStart && labelSlotStyles.start,
        isTop && labelSlotStyles.top,
        isTop && hasTopUserAssistance && labelSlotStyles.topAndTopUA,
        isTop && isPureReadonly && labelSlotStyles.topPureReadonly
    ]);
    const labelInnerClasses = classNames([
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
    jsxs(Flex, { wrap: "wrap", align: isReadonly && isStart ? 'stretch' : 'start', children: [jsx("div", { class: labelStyleClasses, style: labelStyles, children: jsx("div", { class: labelInnerClasses, children: label }) }), jsx("div", { class: valueSlotStyles, style: valueStyles, children: children })] }));
};

export { LabelValueLayout as L };
//# sourceMappingURL=LabelValueLayout-23b74176.js.map
