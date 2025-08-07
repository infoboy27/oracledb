/* @oracle/oraclejet-preact: undefined */
import { u as useDatatip } from './useDatatip-7c661980.js';
import { c as calculateOffset } from './util-c1d41418.js';
import { jsx } from 'preact/jsx-runtime';
import { V as VisTabularDatatip } from './VisTabularDatatip-1f16ca1f.js';
import { g as getColorRamp } from './colorUtils-9c7b574c.js';
import './accUtils-dc32d20b.js';
import { u as useUser } from './useUser-99920e02.js';

/**
 * Returns the data required for the VisTabularDatatip to render.
 * @param activeInfo active item info.
 * @param series The array of chart series.
 * @param groups The array of chart groups.
 * @param valueFormats The array of chart series.
 * @param getDataItem function which returns chartItem
 */
function getChartTabularData(data, seriesValue, groupValue, valueFormats, isTimeAxis) {
    //TODO: Use translation strings
    const value = data.value;
    const itemValue = valueFormats?.value?.format ? valueFormats?.value?.format?.(value) : value;
    const tableData = [];
    if (valueFormats?.series?.isDisplayed != false) {
        tableData.push({
            key: valueFormats?.series?.label || 'Series',
            value: seriesValue
        });
    }
    if (valueFormats?.group?.isDisplayed != false) {
        tableData.push({
            key: valueFormats?.group?.label || (isTimeAxis ? 'Date' : 'Group'),
            value: groupValue
        });
    }
    if (valueFormats?.value?.isDisplayed != false) {
        tableData.push({ key: valueFormats?.value?.label || 'Value', value: itemValue });
    }
    return tableData;
}
function getDefaultDatatipRenderer(options) {
    const isMixedFrequency = options.timeAxisType === 'mixedFrequency';
    const isRegularTimeAxis = options.timeAxisType === 'enabled' || options.timeAxisType === 'skipGaps';
    return (context) => {
        const groupValue = options.groups.name || options.groups.id;
        const timeValue = isMixedFrequency
            ? context.data.x
            : isRegularTimeAxis
                ? groupValue
                : undefined;
        return {
            content: (jsx(VisTabularDatatip, { tableData: getChartTabularData(context.data, options.series.name || options.series.id.toString(), timeValue || options.groups.name || options.groups.id, options.valueFormats, options.timeAxisType != null) })),
            borderColor: context.data.color || options.series.color
        };
    };
}

const DATA_CURSOR_OFFSET = 10;
const useChartDatatip = ({ isDataCursorEnabled, dataCursorPosition, isHoriz, datatip, xScale, getDataItem, getDataItemPos, hoveredItemInfo, focusedItemInfo, series, valueFormats, groups, width, height, findNearest, timeAxisType, touchResponse, isDisabled }) => {
    let activeInfo = !isDisabled
        ? focusedItemInfo?.isCurrent
            ? focusedItemInfo
            : hoveredItemInfo?.isCurrent &&
                hoveredItemInfo.seriesIndex !== undefined &&
                hoveredItemInfo.groupIndex !== undefined
                ? hoveredItemInfo
                : undefined
        : undefined;
    const anchor = focusedItemInfo?.isCurrent || isDataCursorEnabled ? 'element' : 'pointer';
    const elementBounds = focusedItemInfo?.isCurrent
        ? getDataItemPos(focusedItemInfo.seriesIndex, focusedItemInfo.groupIndex)
        : undefined;
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    let placement = 'top-start';
    let offset = calculateOffset(isRtl, width, elementBounds);
    if (isDataCursorEnabled && dataCursorPosition?.x != null && dataCursorPosition?.y != null) {
        // TOD0: The offset for data cursor should be calculated according to
        // datatip content dimensions as well.
        activeInfo = activeInfo || findNearest?.(dataCursorPosition.x, dataCursorPosition.y);
        const xPos = xScale.transform(dataCursorPosition.x);
        offset = { mainAxis: -1, crossAxis: -1 };
        if (isHoriz) {
            placement = 'end';
            offset.mainAxis = -1 * DATA_CURSOR_OFFSET;
            offset.crossAxis = xPos - height / 2;
        }
        else {
            placement = 'top';
            offset.crossAxis = isRtl ? width / 2 - xPos : xPos - width / 2;
            offset.mainAxis = -1 * DATA_CURSOR_OFFSET;
        }
    }
    let dtContent;
    let item;
    if (activeInfo?.seriesIndex != null && activeInfo?.groupIndex != null) {
        item = getDataItem(activeInfo.seriesIndex, activeInfo.groupIndex);
        const datatipContext = item
            ? {
                data: item,
                seriesIndex: activeInfo.seriesIndex,
                groupIndex: activeInfo.groupIndex,
                id: item.id
            }
            : undefined;
        if (datatipContext) {
            const datatipRenderer = datatip ||
                getDefaultDatatipRenderer({
                    series: series[activeInfo.seriesIndex],
                    groups: groups[activeInfo.groupIndex],
                    valueFormats,
                    timeAxisType
                });
            dtContent = datatipRenderer(datatipContext);
        }
    }
    const colors = getColorRamp();
    const borderColor = dtContent?.borderColor ||
        (activeInfo &&
            (series[activeInfo.seriesIndex].color ||
                series[activeInfo.seriesIndex].lineColor ||
                series[activeInfo.seriesIndex].areaColor)) ||
        (activeInfo && colors[activeInfo.seriesIndex % colors.length]);
    const { datatipContent, datatipProps } = useDatatip({
        content: dtContent?.content,
        anchor,
        placement,
        offset,
        borderColor,
        touchResponse
    });
    return { datatipContent, datatipProps };
};

export { useChartDatatip as u };
//# sourceMappingURL=useChartDatatip-b6b2b00a.js.map
