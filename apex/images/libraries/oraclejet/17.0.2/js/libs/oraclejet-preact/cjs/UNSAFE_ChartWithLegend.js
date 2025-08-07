/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var Flex = require('./Flex-fbba4ad6.js');
require('./useTestId-8234ec1e.js');
require('./LayerHost-46e4d858.js');
require('preact');
require('./Common/themes/redwood/theme.js');
require('./Common/themes/themeContract.css.js');
require('preact/compat');
require('preact/hooks');
require('./classNames-c14c6ef3.js');
require('./boxalignment-5ef612ee.js');
require('./size-4e606ce4.js');
require('./utils-b7099be5.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./arrayUtils-7d8dcfc3.js');

require('./vanilla-extract-sprinkles-createRuntimeSprinkles.esm-d68f3e0f.js');
require('./dimensions-b48bf1ab.js');
require('./flexbox-2cae9a01.js');

require('./flexitem-fee13e26.js');

require('./mergeInterpolations-6727b536.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');


/**
 * Returns the flex order of the legend and chart in the flex container.
 * @param legendPos The legend position.
 * @returns
 */
function getFlexOrder(legendPos) {
    const isLegendFirst = legendPos === 'start' || legendPos === 'top';
    return {
        chartOrder: isLegendFirst ? 2 : 1,
        legendOrder: isLegendFirst ? 1 : 2
    };
}
/**
 * Returns the legend flex align and justify prop.
 */
function getLegendFlexProps(legendPos) {
    let justifyContent;
    let alignItem;
    if (legendPos === 'top') {
        justifyContent = 'center';
        alignItem = 'end';
    }
    else if (legendPos === 'bottom') {
        justifyContent = 'center';
        alignItem = 'start';
    }
    else if (legendPos === 'start') {
        justifyContent = 'end';
        alignItem = 'center';
    }
    else {
        justifyContent = 'start';
        alignItem = 'center';
    }
    return { justifyContent, alignItem };
}

/**
 * Component responsible for laying out the legend around a chart.
 */
function ChartWithLegend({ chart, legend, position, maxSize, size }) {
    const flexDirection = position === 'start' || position === 'end' ? 'row' : 'column';
    const { chartOrder, legendOrder } = getFlexOrder(position);
    const { justifyContent, alignItem } = getLegendFlexProps(position);
    return (jsxRuntime.jsxs(Flex.Flex, { width: '100%', height: '100%', direction: flexDirection, children: [jsxRuntime.jsx("div", { style: {
                    order: chartOrder,
                    flexGrow: 1,
                    minWidth: 0
                }, children: chart }), legend && (jsxRuntime.jsx(Flex.Flex, { order: legendOrder, justify: justifyContent, align: alignItem, maxHeight: flexDirection === 'column' ? maxSize : undefined, maxWidth: flexDirection === 'row' ? maxSize : undefined, height: flexDirection === 'column' ? size : undefined, width: flexDirection === 'row' ? size : undefined, children: legend }))] }));
}

exports.ChartWithLegend = ChartWithLegend;
//# sourceMappingURL=UNSAFE_ChartWithLegend.js.map
