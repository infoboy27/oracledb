/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useRef, useState, useCallback } from 'preact/hooks';
import { u as useResizeObserver } from './useResizeObserver-260ee12b.js';
import { g as gutterSizeToPX, a as getColCount, B as BaseCardView } from './BaseCardView-59efba85.js';

function CardFlexView(props) {
    const rootRef = useRef(null);
    const [size, setSize] = useState({});
    const updateCardSize = (cardWidth, cardHeight) => {
        setSize((size) => ({ ...size, cardWidth, cardHeight }));
    };
    const handleResize = useCallback((entry) => {
        const containerWidth = entry.contentRect.width;
        if (size.containerWidth !== containerWidth) {
            setSize((size) => ({ ...size, containerWidth }));
        }
    }, [size]);
    useResizeObserver(rootRef, handleResize);
    const gutterSizePX = gutterSizeToPX[props.gutterSize || 'sm'];
    const columns = getColCount(gutterSizePX, size.cardWidth, size.containerWidth);
    const cardSize = { width: size.cardWidth, height: size.cardHeight };
    return (jsx(BaseCardView, { ...props, ref: rootRef, layout: "flex", columns: columns, cardSize: cardSize, updateCardSize: updateCardSize }));
}

export { CardFlexView as C };
//# sourceMappingURL=CardFlexView-71c79a88.js.map
