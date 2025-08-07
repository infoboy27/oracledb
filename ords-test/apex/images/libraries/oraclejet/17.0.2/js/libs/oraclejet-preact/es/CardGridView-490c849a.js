/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useState } from 'preact/hooks';
import { B as BaseCardView } from './BaseCardView-59efba85.js';

function CardGridView(props) {
    const [cardSize, setCardSize] = useState({});
    const updateCardSize = (width, height) => {
        setCardSize({ width, height });
    };
    return (jsx(BaseCardView, { ...props, layout: "grid", cardSize: cardSize, updateCardSize: updateCardSize }));
}

export { CardGridView as C };
//# sourceMappingURL=CardGridView-490c849a.js.map
