/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var PRIVATE_Axis_themes_AxisStyles_css = require('./PRIVATE_Axis/themes/AxisStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');
var clientHints = require('./clientHints-9e411b6e.js');
var MultilineText = require('./MultilineText-e0d1d42b.js');
var labelUtils = require('./labelUtils-7f684e1a.js');
var PRIVATE_Axis_themes_redwood_AxisTheme = require('./PRIVATE_Axis/themes/redwood/AxisTheme.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');

/**
 * Renders the svg text with given style and svg attributes.
 */
function ChartAxisText({ style, textProps, isTitle, isInteractive, id, isRotated, isRtl, dataProps }) {
    const browser = clientHints.getClientHints().browser;
    const className = classNames.classNames([
        isInteractive ? PRIVATE_Axis_themes_AxisStyles_css.styles.isInteractive : '',
        isTitle ? PRIVATE_Axis_themes_AxisStyles_css.styles.axisTitle : PRIVATE_Axis_themes_AxisStyles_css.styles.axisLabel,
        !isTitle && browser === 'safari' ? PRIVATE_Axis_themes_AxisStyles_css.styles.middleBaseline : ''
    ]);
    const isMultiline = textProps.lines.length > 1;
    return isMultiline ? (jsxRuntime.jsx(MultilineText.MultilineText, { class: className, text: textProps.text, dataProps: dataProps, isRtl: isRtl, isRotated: isRotated, lines: textProps.lines, lineProps: textProps.lineProps, textStyle: style, isTruncated: textProps.isTruncated, id: id })) : (jsxRuntime.jsx(MultilineText.SinglelineText, { style: style, isRtl: isRtl, isRotated: isRotated, dataProps: dataProps, text: textProps.lines[0], props: textProps.lineProps[0], isTruncated: textProps.isTruncated, id: id, class: className }));
}

/**
 * Renders the chart axis.
 */
function Axis({ title, titleStyle, titleProps, tickLabels, tickLabelStyle, focusedGroupIndex, axisPosition, isRtl, activeId, isTextInteractive }) {
    const { classes } = useComponentTheme.useComponentTheme(PRIVATE_Axis_themes_redwood_AxisTheme.AxisRedwoodTheme);
    return (jsxRuntime.jsxs("g", { class: classes, children: [title && titleProps && (jsxRuntime.jsx(ChartAxisText, { textProps: titleProps, isRtl: isRtl, isRotated: titleProps.isRotated, style: titleStyle, isTitle: true, isInteractive: false })), tickLabels.length > 0 && (jsxRuntime.jsx("g", { style: tickLabelStyle, children: tickLabels.map(({ index, ...textProps }, renderedIndex) => {
                    const isFocused = focusedGroupIndex === renderedIndex;
                    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [isFocused
                                ? textProps.text &&
                                    textProps.dims && (jsxRuntime.jsx("rect", { ...labelUtils.getEnclosingRectDims(textProps.dims, axisPosition), class: PRIVATE_Axis_themes_AxisStyles_css.styles.outlineRing }))
                                : '', textProps.text && (jsxRuntime.jsx(ChartAxisText, { textProps: textProps, isTitle: false, isRotated: textProps.isRotated, isRtl: isRtl, dataProps: textProps.dataProps, isInteractive: !!isTextInteractive?.(index), id: isFocused ? activeId : '' }))] }));
                }) }))] }));
}

exports.Axis = Axis;
//# sourceMappingURL=Axis-caa0444f.js.map
