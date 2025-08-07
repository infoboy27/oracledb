/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var BaseCardView = require('./BaseCardView-badf6df3.js');

function CardGridView(props) {
    const [cardSize, setCardSize] = hooks.useState({});
    const updateCardSize = (width, height) => {
        setCardSize({ width, height });
    };
    return (jsxRuntime.jsx(BaseCardView.BaseCardView, { ...props, layout: "grid", cardSize: cardSize, updateCardSize: updateCardSize }));
}

exports.CardGridView = CardGridView;
//# sourceMappingURL=CardGridView-dd7c777f.js.map
