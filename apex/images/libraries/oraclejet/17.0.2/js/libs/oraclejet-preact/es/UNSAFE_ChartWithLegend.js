/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { F as Flex } from './Flex-24628925.js';
import './useTestId-adde554c.js';
import './LayerHost-45f545d7.js';
import 'preact';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import 'preact/compat';
import 'preact/hooks';
import './classNames-4e12b00d.js';
import './boxalignment-486c5ac9.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './arrayUtils-35a58161.js';
import './boxalignment.styles.css';
import './vanilla-extract-sprinkles-createRuntimeSprinkles.esm-2d655d37.js';
import './dimensions-5229d942.js';
import './flexbox-529f25da.js';
import './flexbox.styles.css';
import './flexitem-7b7f7920.js';
import './flexitem.styles.css';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './FlexStyles.styles.css';

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
    return (jsxs(Flex, { width: '100%', height: '100%', direction: flexDirection, children: [jsx("div", { style: {
                    order: chartOrder,
                    flexGrow: 1,
                    minWidth: 0
                }, children: chart }), legend && (jsx(Flex, { order: legendOrder, justify: justifyContent, align: alignItem, maxHeight: flexDirection === 'column' ? maxSize : undefined, maxWidth: flexDirection === 'row' ? maxSize : undefined, height: flexDirection === 'column' ? size : undefined, width: flexDirection === 'row' ? size : undefined, children: legend }))] }));
}

export { ChartWithLegend };
//# sourceMappingURL=UNSAFE_ChartWithLegend.js.map
