/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useResizeObserver = require('./useResizeObserver-819b1236.js');
var BaseCardView = require('./BaseCardView-badf6df3.js');

function CardFlexView(props) {
    const rootRef = hooks.useRef(null);
    const [size, setSize] = hooks.useState({});
    const updateCardSize = (cardWidth, cardHeight) => {
        setSize((size) => ({ ...size, cardWidth, cardHeight }));
    };
    const handleResize = hooks.useCallback((entry) => {
        const containerWidth = entry.contentRect.width;
        if (size.containerWidth !== containerWidth) {
            setSize((size) => ({ ...size, containerWidth }));
        }
    }, [size]);
    useResizeObserver.useResizeObserver(rootRef, handleResize);
    const gutterSizePX = BaseCardView.gutterSizeToPX[props.gutterSize || 'sm'];
    const columns = BaseCardView.getColCount(gutterSizePX, size.cardWidth, size.containerWidth);
    const cardSize = { width: size.cardWidth, height: size.cardHeight };
    return (jsxRuntime.jsx(BaseCardView.BaseCardView, { ...props, ref: rootRef, layout: "flex", columns: columns, cardSize: cardSize, updateCardSize: updateCardSize }));
}

exports.CardFlexView = CardFlexView;
//# sourceMappingURL=CardFlexView-d44dfed5.js.map
