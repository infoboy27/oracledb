/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { a as assignInlineVars } from './vanilla-extract-dynamic.esm-2955d60a.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { F as FormContext } from './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { styles } from './UNSAFE_FormLayout/themes/FormLayoutStyles.css.js';
import { l as layoutSpanStyles, a as layoutLocalVars } from './LayoutStyles.css-a679044e.js';
import { FormLayoutRedwoodTheme } from './UNSAFE_FormLayout/themes/redwood/FormLayoutTheme.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useTestId } from './useTestId-adde554c.js';

const FormLayout = ({ columns = 1, columnBehavior = 'responsive', columnSpan = 1, direction = 'row', isFullWidth, isReadonly: propIsReadonly, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, labelWrapping: propLabelWrapping, userAssistanceDensity: propUserAssistanceDensity, children, testId }) => {
    const { isDisabled, isFormLayout: formIsFormLayout, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, labelWrapping: formLabelWrapping, textAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    const testIdProps = useTestId(testId);
    const layoutElementTestIdProps = useTestId(`${testId}_layout`);
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const labelWrapping = propLabelWrapping ?? formLabelWrapping;
    // If we have the prop, pass it on, or if we are in a form layout, use the context value, otherwise default to 'efficient'
    const userAssistanceDensity = propUserAssistanceDensity ?? (formIsFormLayout ? formUserAssistanceDensity : 'efficient');
    // We need to set the localVars.columnCount so that we can correctly set the max width to the current column count
    const assignVarStyles = assignInlineVars({
        [layoutLocalVars.columnCount]: `${columns}`
    });
    const { baseTheme, classes } = useComponentTheme(FormLayoutRedwoodTheme, {
        columnBehavior,
        direction
    });
    return (jsx(FormContext.Provider, { value: {
            isDisabled,
            isFormLayout: true,
            isReadonly,
            labelEdge,
            labelStartWidth,
            labelWrapping,
            textAlign,
            userAssistanceDensity
        }, children: jsx("div", { class: classNames([
                baseTheme,
                styles.rootWrapperStyle,
                isFullWidth && styles.rootWrapperFullWidthStyle,
                layoutSpanStyles.layoutSpanColumn[columnSpan]
            ]), ...testIdProps, style: assignVarStyles, children: jsx("div", { class: classes, ...layoutElementTestIdProps, children: children }) }) }));
};

export { FormLayout as F };
//# sourceMappingURL=FormLayout-ecd0259b.js.map
