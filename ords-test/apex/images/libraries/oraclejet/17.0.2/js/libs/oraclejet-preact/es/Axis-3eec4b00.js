/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { styles } from './PRIVATE_Axis/themes/AxisStyles.css.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { M as MultilineText, S as SinglelineText } from './MultilineText-03e1e46c.js';
import { g as getEnclosingRectDims } from './labelUtils-9b534489.js';
import { AxisRedwoodTheme } from './PRIVATE_Axis/themes/redwood/AxisTheme.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';

/**
 * Renders the svg text with given style and svg attributes.
 */
function ChartAxisText({ style, textProps, isTitle, isInteractive, id, isRotated, isRtl, dataProps }) {
    const browser = getClientHints().browser;
    const className = classNames([
        isInteractive ? styles.isInteractive : '',
        isTitle ? styles.axisTitle : styles.axisLabel,
        !isTitle && browser === 'safari' ? styles.middleBaseline : ''
    ]);
    const isMultiline = textProps.lines.length > 1;
    return isMultiline ? (jsx(MultilineText, { class: className, text: textProps.text, dataProps: dataProps, isRtl: isRtl, isRotated: isRotated, lines: textProps.lines, lineProps: textProps.lineProps, textStyle: style, isTruncated: textProps.isTruncated, id: id })) : (jsx(SinglelineText, { style: style, isRtl: isRtl, isRotated: isRotated, dataProps: dataProps, text: textProps.lines[0], props: textProps.lineProps[0], isTruncated: textProps.isTruncated, id: id, class: className }));
}

/**
 * Renders the chart axis.
 */
function Axis({ title, titleStyle, titleProps, tickLabels, tickLabelStyle, focusedGroupIndex, axisPosition, isRtl, activeId, isTextInteractive }) {
    const { classes } = useComponentTheme(AxisRedwoodTheme);
    return (jsxs("g", { class: classes, children: [title && titleProps && (jsx(ChartAxisText, { textProps: titleProps, isRtl: isRtl, isRotated: titleProps.isRotated, style: titleStyle, isTitle: true, isInteractive: false })), tickLabels.length > 0 && (jsx("g", { style: tickLabelStyle, children: tickLabels.map(({ index, ...textProps }, renderedIndex) => {
                    const isFocused = focusedGroupIndex === renderedIndex;
                    return (jsxs(Fragment, { children: [isFocused
                                ? textProps.text &&
                                    textProps.dims && (jsx("rect", { ...getEnclosingRectDims(textProps.dims, axisPosition), class: styles.outlineRing }))
                                : '', textProps.text && (jsx(ChartAxisText, { textProps: textProps, isTitle: false, isRotated: textProps.isRotated, isRtl: isRtl, dataProps: textProps.dataProps, isInteractive: !!isTextInteractive?.(index), id: isFocused ? activeId : '' }))] }));
                }) }))] }));
}

export { Axis as A };
//# sourceMappingURL=Axis-3eec4b00.js.map
