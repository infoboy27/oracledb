/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');

function SinglelineText({ text, style, dataProps, props, id, isRotated, isRtl, isTruncated, ...otherProps }) {
    const { x, y } = props;
    const transform = isRotated
        ? `matrix(0, ${isRtl ? 1 : -1}, ${isRtl ? -1 : 1}, 0, ${x}, ${y})`
        : undefined;
    return (jsxRuntime.jsx("text", { ...props, ...dataProps, id: id, className: otherProps.class, style: style, x: isRotated ? undefined : x, y: isRotated ? undefined : y, transform: isRotated ? transform : undefined, children: text }));
}

function MultilineText({ text, lines, lineProps, dataProps, id, textStyle, isRotated, isRtl, isTruncated, ...otherProps }) {
    return (jsxRuntime.jsx("g", { ...dataProps, id: id, className: otherProps.class, style: textStyle, children: lines.map((line, i) => {
            return (jsxRuntime.jsx(SinglelineText, { text: line, props: lineProps[i], isRotated: isRotated, isRtl: isRtl }));
        }) }));
}

exports.MultilineText = MultilineText;
exports.SinglelineText = SinglelineText;
//# sourceMappingURL=MultilineText-e0d1d42b.js.map
