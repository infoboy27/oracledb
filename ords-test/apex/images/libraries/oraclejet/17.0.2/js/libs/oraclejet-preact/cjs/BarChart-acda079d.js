/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useUser = require('./useUser-a6d15333.js');
var preact = require('preact');
var PRIVATE_Chart_themes_ChartStyles_css = require('./PRIVATE_Chart/themes/ChartStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');
var layoutUtils = require('./layoutUtils-25201abd.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var dataStyleUtils = require('./dataStyleUtils-e72725fe.js');
var accUtils = require('./accUtils-50f26093.js');
var colorUtils = require('./colorUtils-fe6f2fbf.js');
var Chart = require('./Chart-c55ecfa4.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const IDEAL_DATA_ITEM_GAP = 2;
const DEFAULT_BAR_GAP_RATIO = 0.25;
/**
 * The function that calculates the barWidth and offset from group center for each series.
 * @param groupWidth The width of the group.
 * @param noOfSeries The number of series present in the chart.
 * @param barGapRatio The ratio of gap to groupWidth.
 * @param dataItemGaps The ratio that determines the gap between the bars.
 */
function getBarGapsInfo(seriesIndex, groupWidth, barGapRatio, numOfSeries, dataItemGaps, isStacked, isRtl) {
    const numSeries = isStacked ? 1 : numOfSeries;
    const itemsGaps = IDEAL_DATA_ITEM_GAP * dataItemGaps;
    const barWidth = (groupWidth * (1 - barGapRatio) - (numSeries - 1) * itemsGaps) / numSeries;
    if (isStacked) {
        return { barWidth, offset: (-1 * barWidth) / 2, itemsGaps };
    }
    const center = groupWidth / 2;
    const seriesStart = groupWidth * (barGapRatio / 2) + seriesIndex * (barWidth + IDEAL_DATA_ITEM_GAP * dataItemGaps);
    const offset = isRtl ? center - seriesStart - barWidth : seriesStart - center;
    return { barWidth, offset, itemsGaps };
}
/**
 * Returns the bar gap ratio.
 * @param isStacked Whether the chart is a stacked bar chart.
 * @param startIndex The viewport start index.
 * @param endIndex The viewport end index.
 */
function getBarGapRatio(isStacked, startIndex, endIndex) {
    const noOfGroups = endIndex - startIndex + 1;
    // logic from legacy
    return isStacked ? 0.37 + 0.26 / noOfGroups : DEFAULT_BAR_GAP_RATIO;
}

const HOVERED_INNER_INSET = 1.5;
const SELECTED_INNER_INSET = 2.5;
/**
 * The rect representing the bar item.
 * @param props
 * @returns
 */
function Bar(props) {
    const isInteractive = props.isSelected || props.isFocused;
    if (isInteractive) {
        return jsxRuntime.jsx(InteractiveBar, { ...props });
    }
    return (jsxRuntime.jsx("rect", { x: props.x, y: props.y, "data-oj-series-index": props.seriesIndex, "data-oj-group-index": props.groupIndex, "data-oj-object": "bar", "aria-label": props['aria-label'], role: props['aria-label'] ? 'img' : undefined, id: props.activeId, style: {
            width: props.width,
            height: props.height,
            fill: props.fill,
            stroke: props.stroke,
            strokeWidth: props.strokeWidth
        }, class: classNames.classNames([
            props.isPointerEnabled ? PRIVATE_Chart_themes_ChartStyles_css.styles.cursorEnable : undefined,
            props.isDimmed ? PRIVATE_Chart_themes_ChartStyles_css.styles.dimmed : undefined
        ]) }));
}
/**
 * The selected or hovered selected bar.
 */
function InteractiveBar(props) {
    const { x, y, width, height, fill, isSelected, isFocused } = props;
    const inset = isSelected ? SELECTED_INNER_INSET : HOVERED_INNER_INSET;
    return (jsxRuntime.jsxs("g", { id: props.activeId, "data-oj-object": "bar", "data-oj-series-index": props.seriesIndex, "data-oj-group-index": props.groupIndex, className: props.isDimmed ? PRIVATE_Chart_themes_ChartStyles_css.styles.dimmed : '', role: props['aria-label'] ? 'img' : undefined, "aria-label": props['aria-label'], children: [jsxRuntime.jsx("rect", { x: x, y: y, class: classNames.classNames([isSelected ? PRIVATE_Chart_themes_ChartStyles_css.styles.selectedBorder : '']), style: {
                    width: width,
                    height: height,
                    fill: !isSelected && isFocused ? fill : undefined
                } }), jsxRuntime.jsx("rect", { x: x + inset, y: y + inset, class: classNames.classNames([
                    PRIVATE_Chart_themes_ChartStyles_css.styles.contrastBorder,
                    props.isPointerEnabled ? PRIVATE_Chart_themes_ChartStyles_css.styles.cursorEnable : undefined
                ]), style: {
                    width: width - 2 * inset,
                    height: height - 2 * inset,
                    fill: fill
                } })] }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getBarProps(item, series, seriesColor) {
    const fill = item.color || series.color || seriesColor;
    const stroke = item.borderColor || series.borderColor;
    return { fill, stroke };
}
/**
 * Returns the coordinate of bar rect.
 * @param x1 The bar start coordinate in x axis.
 * @param x2 The bar end coordinate in x axis.
 * @param endCoord The coordinate of bar top in y axis.
 * @param baselineCoord The coordinate of bar base in y axis.
 * @param isHoriz Whether the chart is horizontal chart.
 * @returns
 */
function getRectCoord(x1, x2, endCoord, baselineCoord, isHoriz) {
    let x;
    let y;
    let width;
    let height;
    let x_1 = x1;
    let x_2 = x2;
    // Bar width has to be at least 1px to prevent disappearing bars
    let barWidth = x2 - x1;
    if (barWidth < 1) {
        x_1 = Math.floor(x_1);
        x_2 = x_1 + 1;
        barWidth = 1;
    }
    if (!isHoriz) {
        x = x_1;
        y = endCoord > baselineCoord ? baselineCoord : endCoord;
        width = Math.abs(x_2 - x_1);
        height = Math.abs(baselineCoord - endCoord);
    }
    else {
        y = x_1;
        x = endCoord > baselineCoord ? baselineCoord : endCoord;
        width = Math.abs(baselineCoord - endCoord);
        height = Math.abs(x_2 - x_1);
    }
    return { x, y, width, height };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the base and end coordinate of the bar.
 * @param value The value of the bar item.
 * @param yScale The yscale.
 * @param isStacked Whether the bar chart is stacked or not.
 * @param isLog Whether the y axis is in log scale.
 * @param itemsGaps The gap between data item.
 * @param negCummulativeValue The negative cummulative value of the group.
 * @param posCummulativeValue The positive cummulative value of the group.
 * @returns
 */
function getBaseAndEndCoord(value, yScale, isStacked, isLog, itemsGaps, negCummulativeValue, posCummulativeValue) {
    let baselineCoord;
    let endCoord;
    if (isStacked) {
        baselineCoord = yScale.transform(value < 0 ? negCummulativeValue : posCummulativeValue);
        negCummulativeValue += value < 0 ? value : 0;
        posCummulativeValue += value > 0 ? value : 0;
        endCoord = yScale.transform(value < 0 ? negCummulativeValue : posCummulativeValue);
        baselineCoord += endCoord > baselineCoord ? itemsGaps : -itemsGaps;
    }
    else {
        baselineCoord = isLog ? yScale.range()[0] : yScale.transform(0);
        endCoord = yScale.transform(value);
    }
    return { baselineCoord, endCoord };
}
function getBarPosition(series, groups, getDataItem, xScale, yScale, hiddenIds, dataItemGaps, groupWidth, barGapRatio, isLog, isStacked, isRtl, isHoriz, timeAxisType) {
    return (seriesIndex, groupIndex) => {
        const numOfSeries = series.length;
        let posCumulativeValue = 0;
        let negCumulativeValue = 0;
        for (let index = 0; index < numOfSeries; index += 1) {
            const item = getDataItem(index, groupIndex);
            let xVal = groupIndex;
            if (timeAxisType) {
                const val = timeAxisType === 'mixedFrequency'
                    ? getDataItem(seriesIndex, groupIndex)?.x
                    : groups[groupIndex].id;
                xVal = new Date(val).getTime();
            }
            if (!item || hiddenIds?.has(item.id) || (isLog && item.value <= 0)) {
                continue;
            }
            const groupCenter = xScale.transform(xVal);
            const { barWidth, offset, itemsGaps } = getBarGapsInfo(index, groupWidth, barGapRatio, numOfSeries, dataItemGaps, isStacked, isRtl);
            const x1 = groupCenter + offset;
            const x2 = x1 + barWidth;
            const { baselineCoord, endCoord } = getBaseAndEndCoord(item.value, yScale, isStacked, isLog, itemsGaps, negCumulativeValue, posCumulativeValue);
            negCumulativeValue += item.value < 0 ? item.value : 0;
            posCumulativeValue += item.value > 0 ? item.value : 0;
            if (seriesIndex === index) {
                return getRectCoord(x1, x2, endCoord, baselineCoord, isHoriz);
            }
        }
        return;
    };
}
/**
 * Returns the center coordinate of the bar item.
 * @param value
 * @param yScale
 * @param isStacked
 * @param isLog
 * @param dataItemGaps
 * @param negCummValue
 * @param posCummValue
 * @returns
 */
function getBarCenterCoordinate(value, yScale, isStacked, isLog, dataItemGaps, negCummValue, posCummValue) {
    const { baselineCoord, endCoord } = getBaseAndEndCoord(value, yScale, isStacked, isLog, dataItemGaps, negCummValue, posCummValue);
    return (baselineCoord + endCoord) / 2;
}
function getSeriesOffsetAndWidth(groupWidth, barGapRatio, numOfSeries, dataItemGaps, isStacked, isRtl) {
    return (seriesIndex) => {
        const { offset, barWidth } = getBarGapsInfo(seriesIndex, groupWidth, barGapRatio, numOfSeries, dataItemGaps, isStacked, isRtl);
        return { offset, dataWidth: barWidth };
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const LABEL_OFFSET = 2;
function getValueCoord(isHoriz, isRtl, isNegative, barDims) {
    if (isHoriz) {
        return (isNegative && !isRtl) || (!isNegative && isRtl) ? barDims.x : barDims.x + barDims.width;
    }
    return isNegative ? barDims.height + barDims.y : barDims.y;
}
function getLabelProps(isHoriz, isRtl, isNegative, barDims, dataLabelPosition, labelDims) {
    if (!labelDims) {
        return {};
    }
    const valueCoord = getValueCoord(isHoriz, isRtl, isNegative, barDims);
    if (dataLabelPosition === 'insideBarEdge') {
        return {
            y: isHoriz
                ? barDims.y + barDims.height / 2
                : valueCoord + (isNegative ? -1 : 1) * (labelDims.height / 2 + LABEL_OFFSET + 2),
            x: isHoriz
                ? valueCoord -
                    ((isNegative && !isRtl) || (!isNegative && isRtl) ? -1 : 1) *
                        (labelDims.width / 2 + LABEL_OFFSET)
                : barDims.x + barDims.width / 2
        };
    }
    if (dataLabelPosition === 'outsideBarEdge') {
        return {
            y: isHoriz
                ? barDims.y + barDims.height / 2
                : valueCoord - (isNegative ? -1 : 1) * (labelDims.height / 2 + LABEL_OFFSET),
            x: isHoriz
                ? valueCoord +
                    ((isNegative && !isRtl) || (!isNegative && isRtl) ? -1 : 1) *
                        (labelDims.width / 2 + LABEL_OFFSET)
                : barDims.x + barDims.width / 2
        };
    }
    return {
        x: barDims.x + barDims.width / 2,
        y: barDims.y + barDims.height / 2
    };
}
function canFitLabel(isHoriz, labelDims, barDims, labelPos) {
    if (isHoriz) {
        if (labelDims.height > barDims.height) {
            return false;
        }
        if (labelPos != 'outsideBarEdge') {
            return labelDims.width < barDims.width;
        }
        return true;
    }
    if (labelDims.width > barDims.width) {
        return false;
    }
    if (labelPos != 'outsideBarEdge') {
        return labelDims.height < barDims.height;
    }
    return true;
}
const getStackLabelProps = (groupCenterCoord, valueCoord, isNegative, isHoriz, isRtl, labelDims) => {
    return {
        y: isHoriz
            ? groupCenterCoord
            : valueCoord - (isNegative ? -1 : 1) * (labelDims.height / 2 + LABEL_OFFSET),
        x: isHoriz
            ? valueCoord +
                ((isNegative && !isRtl) || (!isNegative && isRtl) ? -1 : 1) *
                    (labelDims.width / 2 + LABEL_OFFSET)
            : groupCenterCoord
    };
};

function StackLabels({ groupCenter, getStackLabel, group, posValue, negValue, posItemsData, yScale, isHoriz, isRtl, negItemsData, defaultFontSize, labelStyle, getTextDimensions }) {
    const positiveStackLabel = getStackLabel({
        group,
        value: posValue,
        data: posItemsData
    });
    // default style used for text dims calc. should match with styles.stackLabelStyle
    const stackLabelStyle = { fontSize: defaultFontSize, fontWeight: 'bold', ...labelStyle };
    const negativeStackLabel = negValue < 0
        ? getStackLabel?.({
            group,
            value: negValue,
            data: negItemsData
        })
        : '';
    const posProps = getStackLabelProps(groupCenter, yScale.transform(posValue), false, isHoriz, isRtl, getTextDimensions(positiveStackLabel, stackLabelStyle));
    const negProps = getStackLabelProps(groupCenter, yScale.transform(negValue), true, isHoriz, isRtl, getTextDimensions(negativeStackLabel, stackLabelStyle));
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("text", { class: PRIVATE_Chart_themes_ChartStyles_css.styles.stackLabelStyle, style: stackLabelStyle, ...posProps, children: positiveStackLabel }), jsxRuntime.jsx("text", { class: PRIVATE_Chart_themes_ChartStyles_css.styles.stackLabelStyle, style: stackLabelStyle, ...negProps, children: negativeStackLabel })] }));
}

function BarLabel({ item, seriesColor, isStacked, defaultFontSize, barDim, isRtl, isHoriz, getTextDimensions }) {
    let label = null;
    const position = !item.labelPosition || (item.labelPosition === 'outsideBarEdge' && isStacked)
        ? 'center'
        : item.labelPosition;
    const labelString = item.label;
    const color = item.color || seriesColor;
    const needsContrastColor = isStacked || !(position === 'outsideBarEdge');
    if (position != 'none' &&
        labelString &&
        getTextDimensions &&
        !(isStacked && position === 'outsideBarEdge')) {
        const labelStyle = {
            fontSize: defaultFontSize,
            fill: needsContrastColor ? colorUtils.getContrastingTextColor(color) : undefined,
            ...item.labelStyle
        };
        const labelDims = getTextDimensions(labelString, labelStyle);
        const canFit = canFitLabel(isHoriz, labelDims, barDim, position || 'center');
        label = canFit ? (jsxRuntime.jsx("text", { class: PRIVATE_Chart_themes_ChartStyles_css.styles.dataLabelStyle, style: labelStyle, ...getLabelProps(isHoriz, isRtl, item.value < 0, barDim, position || 'center', getTextDimensions?.(labelString, labelStyle)), children: labelString })) : null;
    }
    return label;
}

function BarGroup({ yScale, xScale, colors, series, groupIndex, hiddenIds, barGapRatio, dataItemGaps, groupWidth, highlightedIds, selectedIds, isPointInsideMarquee, orientation, isLog, activeId, getDataItem, isRtl, isStacked, isSelectionEnabled, focusedItemInfo, hoveredItemInfo, isDrillEnabled, group, timeAxisType, getTextDimensions, defaultFontSize, stacklabelStyle, getStackLabel }) {
    const isHoriz = orientation === 'horizontal';
    const items = [];
    const numSeries = series.length;
    let posCumulativeValue = isLog ? yScale.domain()[0] : 0;
    let negCumulativeValue = 0;
    const positiveValueItems = [];
    const negativeValueItems = [];
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const isStackLabelRendered = isStacked && !!getStackLabel && timeAxisType != 'mixedFrequency';
    let groupCenter = timeAxisType != 'mixedFrequency'
        ? xScale.transform(timeAxisType != undefined ? new Date(group.id).getTime() : groupIndex)
        : undefined;
    for (let seriesIndex = 0; seriesIndex < numSeries; seriesIndex += 1) {
        const item = getDataItem(seriesIndex, groupIndex);
        if (!item || hiddenIds?.has(item.id) || (isLog && item.value <= 0)) {
            continue;
        }
        if (timeAxisType === 'mixedFrequency') {
            groupCenter = layoutUtils.getMixedFreqGroupCenter(xScale, item);
        }
        const isFocused = focusedItemInfo?.groupIndex === groupIndex &&
            focusedItemInfo?.seriesIndex === seriesIndex &&
            focusedItemInfo?.isFocusVisible;
        const isHovered = hoveredItemInfo?.groupIndex === groupIndex &&
            hoveredItemInfo?.seriesIndex === seriesIndex &&
            hoveredItemInfo?.isCurrent;
        const isFocusVisible = !!isFocused || (!!isHovered && isSelectionEnabled);
        const isActive = (isFocused && focusedItemInfo.isCurrent) || isHovered;
        const isHighlighted = highlightedIds === undefined || highlightedIds.has(item.id);
        const isDrillable = item.drilling === 'on' || (item.drilling != 'off' && isDrillEnabled);
        const { barWidth, offset, itemsGaps } = getBarGapsInfo(seriesIndex, groupWidth, barGapRatio, numSeries, dataItemGaps, isStacked, isRtl);
        const x1 = groupCenter + offset;
        const x2 = x1 + barWidth;
        const { baselineCoord, endCoord } = getBaseAndEndCoord(item.value, yScale, isStacked, isLog, itemsGaps, negCumulativeValue, posCumulativeValue);
        negCumulativeValue += item.value < 0 ? item.value : 0;
        posCumulativeValue += item.value > 0 ? item.value : 0;
        if (isStackLabelRendered) {
            if (item.value >= 0) {
                positiveValueItems.push(item);
            }
            else {
                negativeValueItems.push(item);
            }
        }
        const barprops = getBarProps(item, series[seriesIndex], colors?.[seriesIndex]);
        const rectParam = getRectCoord(x1, x2, endCoord, baselineCoord, isHoriz);
        const isSelected = isPointInsideMarquee
            ? isPointInsideMarquee?.(item.id, {
                x: rectParam.x + rectParam.width / 2,
                y: rectParam.y
            })
            : selectedIds?.has(item.id);
        const ariaLabel = accUtils.supportsMobileScreenReader || isActive
            ? dataStyleUtils.getItemAriaLabel(translations, series[seriesIndex].name || series[seriesIndex].id.toString(), group.name || group.id, item.value, isSelectionEnabled, !!isSelected, isDrillable, item.accessibleLabel)
            : '';
        items.push(jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [preact.createElement(Bar, { ...rectParam, ...barprops, seriesIndex: seriesIndex, groupIndex: groupIndex, isFocused: isFocusVisible, activeId: isActive ? activeId : '', "aria-label": ariaLabel, isDimmed: !isHighlighted, isSelected: !!isSelected, isPointerEnabled: isDrillable || isSelectionEnabled, key: `${groupIndex};${seriesIndex}` }), jsxRuntime.jsx(BarLabel, { item: item, isRtl: isRtl, seriesColor: colors[seriesIndex % 12], isStacked: isStacked, defaultFontSize: defaultFontSize, barDim: rectParam, isHoriz: isHoriz, getTextDimensions: getTextDimensions })] }));
    }
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [items, isStackLabelRendered && getTextDimensions && (jsxRuntime.jsx(StackLabels, { group: group, isRtl: isRtl, yScale: yScale, getStackLabel: getStackLabel, defaultFontSize: defaultFontSize, getTextDimensions: getTextDimensions, posItemsData: positiveValueItems, negItemsData: negativeValueItems, isHoriz: isHoriz, groupCenter: groupCenter, labelStyle: stacklabelStyle, posValue: posCumulativeValue, negValue: negCumulativeValue }))] }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Get next item in unstacked bar chart.
 * @param info
 * @param viewportEndIndex
 * @param numSeries
 * @param isNavigable
 * @returns
 */
function getNextItem(info, viewportEndIndex, numSeries, isNavigable) {
    const nextItemInGroup = dataStyleUtils.getNextItemInGroup(info, numSeries, isNavigable);
    if (nextItemInGroup)
        return nextItemInGroup;
    if (info.groupIndex < viewportEndIndex) {
        let nextItem = { seriesIndex: 0, groupIndex: info.groupIndex + 1 };
        if (isNavigable(nextItem.seriesIndex, nextItem.groupIndex))
            return nextItem;
        nextItem = getNextItem(nextItem, viewportEndIndex, numSeries, isNavigable);
        if (nextItem)
            return nextItem;
    }
    return info;
}
/**
 * Get prev item in unstacked bar chart.
 * @param info
 * @param viewportStartIndex
 * @param numSeries
 * @param isNavigable
 * @returns
 */
function getPreviousItem(info, viewportStartIndex, numSeries, isNavigable) {
    const prevItemInGroup = dataStyleUtils.getPrevItemInGroup(info, isNavigable);
    if (prevItemInGroup)
        return prevItemInGroup;
    if (info.groupIndex > viewportStartIndex) {
        let prevItem = { groupIndex: info.groupIndex - 1, seriesIndex: numSeries - 1 };
        if (isNavigable(prevItem.seriesIndex, prevItem.groupIndex))
            return prevItem;
        prevItem = getPreviousItem(prevItem, viewportStartIndex, numSeries, isNavigable);
        if (prevItem)
            return prevItem;
    }
    return info;
}
function getBarChartNavUtil(getDataItem, numSeries, viewportStartIndex, viewportEndIndex, isStacked, isRtl) {
    const isItemNavigable = (seriesIndex, groupIndex) => {
        const barItem = getDataItem(seriesIndex, groupIndex);
        return Boolean(barItem);
    };
    const getNextChartItem = (itemInfo, arrow) => {
        if (!isStacked && (arrow === 'ArrowDown' || arrow === 'ArrowUp')) {
            return itemInfo;
        }
        let newInfo;
        // TODO: this is just to keep typescript happy.
        // figure out consistent typing while doing type cleanup.
        const info = {
            groupIndex: itemInfo.groupIndex,
            seriesIndex: itemInfo.seriesIndex
        };
        if (info.groupIndex < viewportStartIndex) {
            info.groupIndex = viewportStartIndex;
            return info;
        }
        else if (info.groupIndex > viewportEndIndex) {
            info.groupIndex = viewportEndIndex;
            return info;
        }
        if (isStacked) {
            if (arrow === 'ArrowLeft') {
                newInfo = isRtl
                    ? dataStyleUtils.getNextItemInSeries(info, viewportEndIndex, isItemNavigable)
                    : dataStyleUtils.getPrevItemInSeries(info, viewportStartIndex, isItemNavigable);
            }
            else if (arrow === 'ArrowRight') {
                newInfo = isRtl
                    ? dataStyleUtils.getPrevItemInSeries(info, viewportStartIndex, isItemNavigable)
                    : dataStyleUtils.getNextItemInSeries(info, viewportEndIndex, isItemNavigable);
            }
            else if (arrow === 'ArrowDown') {
                newInfo = dataStyleUtils.getPrevItemInGroup(info, isItemNavigable);
            }
            else {
                newInfo = dataStyleUtils.getNextItemInGroup(info, numSeries, isItemNavigable);
            }
        }
        else {
            if (arrow === 'ArrowRight') {
                newInfo = isRtl
                    ? getPreviousItem(info, viewportStartIndex, numSeries, isItemNavigable)
                    : getNextItem(info, viewportEndIndex, numSeries, isItemNavigable);
            }
            else if (arrow === 'ArrowLeft') {
                newInfo = isRtl
                    ? getNextItem(info, viewportEndIndex, numSeries, isItemNavigable)
                    : getPreviousItem(info, viewportStartIndex, numSeries, isItemNavigable);
            }
        }
        return newInfo || info;
    };
    return getNextChartItem;
}

/* bar chart start and end axis offset */
const AXIS_OFFSET = 0.5;
/**
 * A Bar chart displays information graphically using rectangular bars with heights or lengths proportional to the values that they represent,
 * making relationships among the data easier to understand.
 */
function BarChart({ width, height, selectedIds = [], hiddenIds = [], highlightedIds, hideAndShowBehavior = 'none', orientation = 'vertical', yAxis, series, groups, isStacked = false, getDataItem, selectionMode = 'none', drilling = 'off', dataItemGaps = 0.5, ...props }) {
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    const hiddenSet = new Set(hiddenIds);
    const isHoriz = orientation === 'horizontal';
    const timeAxisType = props.xAxis?.timeAxisType;
    const selectedSet = new Set(selectedIds);
    const highlightedSet = new Set(highlightedIds);
    const getGapRatio = (startIndex, endIndex) => {
        return getBarGapRatio(isStacked, startIndex, endIndex);
    };
    const getNextChartItemFunc = (startIndex, endIndex) => {
        return getBarChartNavUtil(getDataItem, series.length, startIndex, endIndex, isStacked, isRtl);
    };
    const getDataItemPos = (xScale, yScale, groupWidth, gapRatio) => {
        return getBarPosition(series, groups, getDataItem, xScale, yScale, hiddenSet, dataItemGaps, groupWidth, gapRatio, yAxis?.scale === 'log', isStacked, isRtl, isHoriz, timeAxisType);
    };
    const findNearest = (xScale, yScale, groupWidth, gapRatio) => {
        const getSeriesDataInfo = getSeriesOffsetAndWidth(groupWidth, gapRatio, series.length, dataItemGaps, isStacked, isRtl);
        return layoutUtils.findNearestDataPoint(series, groups, xScale, yScale, getDataItem, isStacked, getSeriesDataInfo, getBarCenterCoordinate, yAxis?.scale === 'log', dataItemGaps, hiddenSet, timeAxisType);
    };
    const getMarkerColorAndType = (seriesIndex, groupIndex) => {
        return {
            color: dataStyleUtils.getItemColor(seriesIndex, groupIndex, series, getDataItem),
            type: dataStyleUtils.getMarkerType(seriesIndex, groupIndex, 'bar', getDataItem)
        };
    };
    return (jsxRuntime.jsx(Chart.Chart, { width: width, height: height, selectedIds: selectedSet, hiddenIds: hiddenIds, hideAndShowBehavior: hideAndShowBehavior, orientation: orientation, yAxis: yAxis, series: series, groups: groups, isStacked: isStacked, getDataItem: getDataItem, selectionMode: selectionMode, drilling: drilling, renderGridLinesInFront: false, findNearest: findNearest, getDataItemPos: getDataItemPos, getNavUtil: getNextChartItemFunc, getGapRatio: getGapRatio, getMarkerInfo: getMarkerColorAndType, isRtl: isRtl, offset: AXIS_OFFSET, ...props, children: ({ xStartIndex, xEndIndex, xScale, yScale, gapRatio, activeId, focusedItemInfo, hoveredItemInfo, groupWidth, isPointInsideMarquee, getTextDimensions, defaultFontSize, colors }) => {
            return (jsxRuntime.jsx(jsxRuntime.Fragment, { children: groups.slice(xStartIndex, xEndIndex + 1).map((_, index) => (jsxRuntime.jsx(BarGroup, { yScale: yScale, xScale: xScale, groupIndex: index + xStartIndex, selectedIds: selectedSet, hiddenIds: hiddenSet, highlightedIds: highlightedIds ? highlightedSet : highlightedIds, isDrillEnabled: drilling === 'on', series: series, barGapRatio: gapRatio, dataItemGaps: dataItemGaps, isPointInsideMarquee: isPointInsideMarquee, isStacked: isStacked, groupWidth: groupWidth, group: groups[index], timeAxisType: props.xAxis?.timeAxisType, colors: colors, activeId: activeId, isLog: yAxis?.scale === 'log', orientation: orientation, getDataItem: getDataItem, isSelectionEnabled: selectionMode != 'none', isRtl: isRtl, focusedItemInfo: focusedItemInfo, hoveredItemInfo: hoveredItemInfo, getTextDimensions: getTextDimensions, defaultFontSize: defaultFontSize, getStackLabel: props.getStackLabel }))) }));
        } }));
}

exports.BarChart = BarChart;
//# sourceMappingURL=BarChart-acda079d.js.map
