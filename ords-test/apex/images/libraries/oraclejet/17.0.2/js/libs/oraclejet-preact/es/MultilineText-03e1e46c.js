/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';

function SinglelineText({ text, style, dataProps, props, id, isRotated, isRtl, isTruncated, ...otherProps }) {
    const { x, y } = props;
    const transform = isRotated
        ? `matrix(0, ${isRtl ? 1 : -1}, ${isRtl ? -1 : 1}, 0, ${x}, ${y})`
        : undefined;
    return (jsx("text", { ...props, ...dataProps, id: id, className: otherProps.class, style: style, x: isRotated ? undefined : x, y: isRotated ? undefined : y, transform: isRotated ? transform : undefined, children: text }));
}

function MultilineText({ text, lines, lineProps, dataProps, id, textStyle, isRotated, isRtl, isTruncated, ...otherProps }) {
    return (jsx("g", { ...dataProps, id: id, className: otherProps.class, style: textStyle, children: lines.map((line, i) => {
            return (jsx(SinglelineText, { text: line, props: lineProps[i], isRotated: isRotated, isRtl: isRtl }));
        }) }));
}

export { MultilineText as M, SinglelineText as S };
//# sourceMappingURL=MultilineText-03e1e46c.js.map
