/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var vanillaExtractDynamic_esm = require('./vanilla-extract-dynamic.esm-d5dffce7.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var FormContext = require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var UNSAFE_FormLayout_themes_FormLayoutStyles_css = require('./UNSAFE_FormLayout/themes/FormLayoutStyles.css.js');
var LayoutStyles_css = require('./LayoutStyles.css-8af668b9.js');
var UNSAFE_FormLayout_themes_redwood_FormLayoutTheme = require('./UNSAFE_FormLayout/themes/redwood/FormLayoutTheme.js');
var classNames = require('./classNames-c14c6ef3.js');
var useTestId = require('./useTestId-8234ec1e.js');

const FormLayout = ({ columns = 1, columnBehavior = 'responsive', columnSpan = 1, direction = 'row', isFullWidth, isReadonly: propIsReadonly, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, labelWrapping: propLabelWrapping, userAssistanceDensity: propUserAssistanceDensity, children, testId }) => {
    const { isDisabled, isFormLayout: formIsFormLayout, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, labelWrapping: formLabelWrapping, textAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
    const testIdProps = useTestId.useTestId(testId);
    const layoutElementTestIdProps = useTestId.useTestId(`${testId}_layout`);
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const labelWrapping = propLabelWrapping ?? formLabelWrapping;
    // If we have the prop, pass it on, or if we are in a form layout, use the context value, otherwise default to 'efficient'
    const userAssistanceDensity = propUserAssistanceDensity ?? (formIsFormLayout ? formUserAssistanceDensity : 'efficient');
    // We need to set the localVars.columnCount so that we can correctly set the max width to the current column count
    const assignVarStyles = vanillaExtractDynamic_esm.assignInlineVars({
        [LayoutStyles_css.layoutLocalVars.columnCount]: `${columns}`
    });
    const { baseTheme, classes } = useComponentTheme.useComponentTheme(UNSAFE_FormLayout_themes_redwood_FormLayoutTheme.FormLayoutRedwoodTheme, {
        columnBehavior,
        direction
    });
    return (jsxRuntime.jsx(FormContext.FormContext.Provider, { value: {
            isDisabled,
            isFormLayout: true,
            isReadonly,
            labelEdge,
            labelStartWidth,
            labelWrapping,
            textAlign,
            userAssistanceDensity
        }, children: jsxRuntime.jsx("div", { class: classNames.classNames([
                baseTheme,
                UNSAFE_FormLayout_themes_FormLayoutStyles_css.styles.rootWrapperStyle,
                isFullWidth && UNSAFE_FormLayout_themes_FormLayoutStyles_css.styles.rootWrapperFullWidthStyle,
                LayoutStyles_css.layoutSpanStyles.layoutSpanColumn[columnSpan]
            ]), ...testIdProps, style: assignVarStyles, children: jsxRuntime.jsx("div", { class: classes, ...layoutElementTestIdProps, children: children }) }) }));
};

exports.FormLayout = FormLayout;
//# sourceMappingURL=FormLayout-ab6f90b8.js.map
