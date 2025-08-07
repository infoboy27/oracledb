/* @oracle/oraclejet-preact: undefined */
'use strict';

var accUtils = require('./accUtils-50f26093.js');
var colorUtils = require('./colorUtils-0d6ee5fe.js');
var pathUtils = require('./pathUtils-ba10ce25.js');
var Common_themes_themeContract_css = require('./Common/themes/themeContract.css.js');
var utils = require('./utils-b7099be5.js');
var layoutUtils = require('./layoutUtils-25201abd.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the aria label for the chart item
 * @param translations The translations bundle.
 * @param series The series of the item.
 * @param group The group of the item.
 * @param value The value of the item.
 * @param isSelected Whether the item is selected.
 * @param isDrillable Whether the item is drillable.
 * @param accessibleLabel The accessible label of the item.
 * @returns
 */
function getItemAriaLabel(translations, series, group, value, isSelectionEnabled, isSelected, isDrillable, accessibleLabel) {
    const seriesLabel = translations.chart_labelSeries();
    const groupLabel = translations.chart_labelGroup();
    const valueLabel = translations.chart_labelValue();
    const label = accessibleLabel ||
        `${seriesLabel}: ${series}, ${groupLabel}: ${group}, ${valueLabel}: ${value}`;
    return accUtils.generateAriaLabel(translations, label, {
        isSelected: !isSelectionEnabled ? undefined : isSelected,
        isDrillable
    });
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the next navigable item in the same series.
 * @param seriesIndex
 * @param groupIndex
 * @param numOfGroups
 * @returns
 */
function getNextItemInSeries(info, viewportEndIndex, isNavigable) {
    const { seriesIndex, groupIndex } = info;
    const nextGroupIndex = groupIndex + 1;
    if (nextGroupIndex > viewportEndIndex) {
        return;
    }
    if (isNavigable(seriesIndex, nextGroupIndex)) {
        return { seriesIndex, groupIndex: nextGroupIndex };
    }
    return getNextItemInSeries({
        seriesIndex,
        groupIndex: nextGroupIndex
    }, viewportEndIndex, isNavigable);
}
/**
 * Returns the previous navigable item in the same series.
 * @param seriesIndex
 * @param itemIndex
 * @returns
 */
function getPrevItemInSeries(info, viewportStartIndex, isNavigable) {
    const { seriesIndex, groupIndex } = info;
    const prevGroupIndex = groupIndex - 1;
    if (prevGroupIndex < viewportStartIndex) {
        return;
    }
    if (isNavigable(seriesIndex, prevGroupIndex)) {
        return { seriesIndex, groupIndex: prevGroupIndex };
    }
    if (prevGroupIndex === 0) {
        return undefined;
    }
    return getPrevItemInSeries({ seriesIndex, groupIndex: prevGroupIndex }, viewportStartIndex, isNavigable);
}
/**
 * Returns the previous navigable item in the same group.
 * @param seriesIndex
 * @param groupIndex
 * @param isNavigable
 */
function getPrevItemInGroup(info, isNavigable) {
    const { seriesIndex, groupIndex } = info;
    const prevSeriesIndex = seriesIndex - 1;
    if (prevSeriesIndex < 0) {
        return;
    }
    if (isNavigable(prevSeriesIndex, groupIndex)) {
        return { seriesIndex: prevSeriesIndex, groupIndex };
    }
    return getPrevItemInGroup({
        seriesIndex: prevSeriesIndex,
        groupIndex
    }, isNavigable);
}
/**
 * Returns the next navigable item in the same group.
 * @param seriesIndex
 * @param groupIndex
 * @param numOfSeries
 * @param numOfGroups
 */
function getNextItemInGroup(info, numOfSeries, isNavigable) {
    const { seriesIndex, groupIndex } = info;
    const nextSeriesIndex = seriesIndex + 1;
    if (nextSeriesIndex >= numOfSeries) {
        return;
    }
    if (isNavigable(nextSeriesIndex, groupIndex)) {
        return { seriesIndex: nextSeriesIndex, groupIndex };
    }
    return getNextItemInGroup({
        seriesIndex: nextSeriesIndex,
        groupIndex
    }, numOfSeries, isNavigable);
}
/**
 * Returns the next item in the group with higher value than the current item.
 * @param info The ItemInfo of current item.
 * @param numSeries The number of series in the group.
 * @param getDataItem The function that returns the chart data item.
 * @returns
 */
function getNextHigherItemInGroup(info, numSeries, getDataItem, isItemNavigable) {
    const { groupIndex, seriesIndex } = info;
    const item = getDataItem(seriesIndex, groupIndex);
    if (!item) {
        return info;
    }
    let minValue = Number.MAX_VALUE;
    let minIndex = seriesIndex;
    for (let i = 0; i < numSeries; i++) {
        const itemValue = getDataItem(i, groupIndex)?.value;
        if (!itemValue ||
            itemValue < item.value ||
            !isItemNavigable(i, groupIndex) ||
            seriesIndex === i) {
            continue;
        }
        if (itemValue < minValue) {
            minValue = itemValue;
            minIndex = i;
        }
    }
    return { seriesIndex: minIndex, groupIndex };
}
/**
 * Returns the item info of the item in the group with lower value than the current item.
 * @param info The ItemInfo of the current item.
 * @param numSeries The number of series in the group.
 * @param getDataItem The function that returns the chart data item.
 * @returns
 */
function getNextLowerItemInGroup(info, numSeries, getDataItem, isItemNavigable) {
    const { groupIndex, seriesIndex } = info;
    const item = getDataItem(seriesIndex, groupIndex);
    if (!item) {
        return info;
    }
    let maxValue = Number.MIN_VALUE;
    let maxIndex = seriesIndex;
    for (let i = 0; i < numSeries; i++) {
        const itemValue = getDataItem(i, groupIndex)?.value;
        if (!itemValue ||
            itemValue > item.value ||
            !isItemNavigable(i, groupIndex) ||
            seriesIndex === i) {
            continue;
        }
        if (itemValue > maxValue) {
            maxValue = itemValue;
            maxIndex = i;
        }
    }
    return { seriesIndex: maxIndex, groupIndex };
}
function getLineAreaChartNavUtil(getDataItem, numSeries, viewportStartIndex, viewportEndIndex, isStacked, isRtl, isHoriz) {
    const isItemNavigable = (seriesIndex, groupIndex) => {
        const barItem = getDataItem(seriesIndex, groupIndex);
        return Boolean(barItem);
    };
    const getNextChartItem = (itemInfo, arrow) => {
        let newInfo;
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
        if (arrow === 'ArrowLeft') {
            if (!isHoriz) {
                newInfo = isRtl
                    ? getNextItemInSeries(info, viewportEndIndex, isItemNavigable)
                    : getPrevItemInSeries(info, viewportStartIndex, isItemNavigable);
            }
            else {
                newInfo = isRtl
                    ? getNextHigherItemInGroup(info, numSeries, getDataItem, isItemNavigable)
                    : getNextLowerItemInGroup(info, numSeries, getDataItem, isItemNavigable);
            }
        }
        else if (arrow === 'ArrowRight') {
            if (!isHoriz) {
                newInfo = isRtl
                    ? getPrevItemInSeries(info, viewportStartIndex, isItemNavigable)
                    : getNextItemInSeries(info, viewportEndIndex, isItemNavigable);
            }
            else {
                newInfo = !isRtl
                    ? getNextHigherItemInGroup(info, numSeries, getDataItem, isItemNavigable)
                    : getNextLowerItemInGroup(info, numSeries, getDataItem, isItemNavigable);
            }
        }
        else if (arrow === 'ArrowDown') {
            if (isHoriz) {
                newInfo = getNextItemInSeries(info, viewportEndIndex, isItemNavigable);
            }
            else {
                if (isStacked) {
                    newInfo = getPrevItemInGroup(info, isItemNavigable);
                }
                else {
                    newInfo = getNextLowerItemInGroup(info, numSeries, getDataItem, isItemNavigable);
                }
            }
        }
        else {
            if (isHoriz) {
                newInfo = getPrevItemInSeries(info, viewportStartIndex, isItemNavigable);
            }
            else {
                if (isStacked) {
                    newInfo = getNextItemInGroup(info, numSeries, isItemNavigable);
                }
                else {
                    newInfo = getNextHigherItemInGroup(info, numSeries, getDataItem, isItemNavigable);
                }
            }
        }
        return newInfo || info;
    };
    return getNextChartItem;
}

/**
 * @license
 * Copyright (c) 2008 %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns a straight area path command.
 * @param {array} lineSegmentCoords Polyline top points array.
 * @param {array} bottomCoords Polyline bottom points array.
 * @return {string} Straight area path commands.
 */
function getStraightAreaPath(lineSegmentCoords, bottomCoords) {
    // Create the path data string
    let pathData;
    if (lineSegmentCoords.length > 0) {
        pathData =
            lineSegmentCoords
                .map((lineSegmentCoord, index) => {
                return `${index === 0 ? 'M' : 'L'} ${lineSegmentCoord[0]} ${lineSegmentCoord[1]}`;
            })
                .join(' ') +
                [...bottomCoords]
                    .reverse()
                    .map((bottomCoord) => {
                    return `L ${bottomCoord[0]} ${bottomCoord[1]}`;
                })
                    .join(' ') +
                'Z';
    }
    return pathData;
}
/**
 * Returns a curved area path command, based on cubic hermite splines, that goes through the points in the points array.
 * @param {array} lineSegmentCoords Polyline top points array.
 * @param {array} bottomCoords Polyline bottom points array.
 * @param {boolean} connectWithLine Whether the first point is reached using lineTo. Otherwise, moveTo is used.
 * @param {string} splineType The spline type.
 * @return {string} Curved area path commands.
 */
function getCurveAreaPath(lineSegmentCoords, bottomCoords, connectWithLine, splineType, isBottomSegmentCurved) {
    let pathData;
    if (lineSegmentCoords.length > 0) {
        if (!isBottomSegmentCurved) {
            pathData =
                pathUtils.curveThroughPoints(lineSegmentCoords, connectWithLine, splineType) +
                    [...bottomCoords]
                        .reverse()
                        .map((bottomCoord) => {
                        return `L ${bottomCoord[0]} ${bottomCoord[1]}`;
                    })
                        .join(' ') +
                    'Z';
        }
        else {
            pathData =
                pathUtils.curveThroughPoints(lineSegmentCoords, false, splineType) +
                    ' ' +
                    pathUtils.curveThroughPoints([...bottomCoords].reverse(), true, splineType) +
                    ' Z';
        }
    }
    return pathData;
}

/**
 * @license
 * Copyright (c) 2008 %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getCmdsForArea(lineSegmentCoords, bottomCoords, areaType, isHoriz, isBottomSegmentCurved) {
    if (areaType === 'straight') {
        return getStraightAreaPath(lineSegmentCoords, bottomCoords);
    }
    return getCurveAreaPath(lineSegmentCoords, bottomCoords, false, isHoriz ? 'mh' : 'mv', isBottomSegmentCurved);
}
function getCmdsForLine(lineSegmentCoords, lineType, isHoriz) {
    if (lineType === 'straight') {
        return lineSegmentCoords.join(' ');
    }
    return pathUtils.curveThroughPoints(lineSegmentCoords, false, isHoriz ? 'mh' : 'mv');
}
/**
 * Returns the cumulative series for stacked chart.
 */
function getCumulativeSeries(numSeries, numGroups, getDataItem, hiddenIds, isLog) {
    const series = [];
    for (let seriesIndex = 0; seriesIndex < numSeries; seriesIndex += 1) {
        const currentSeries = [];
        const prevSeries = series[seriesIndex - 1];
        for (let groupIndex = 0; groupIndex < numGroups; groupIndex += 1) {
            const item = getDataItem(seriesIndex, groupIndex);
            if (!item || hiddenIds?.has(item.id) || (isLog && item.value <= 0)) {
                continue;
            }
            if (seriesIndex) {
                currentSeries[groupIndex] = item.value + prevSeries[groupIndex];
            }
            else {
                currentSeries[groupIndex] = item.value;
            }
        }
        series.push(currentSeries);
    }
    return series;
}
/**
 * Returns the series data.
 */
function getSeriesData(numSeries, numGroups, getDataItem, hiddenIds, isLog) {
    const series = [];
    for (let seriesIndex = 0; seriesIndex < numSeries; seriesIndex += 1) {
        const currentSeries = [];
        for (let groupIndex = 0; groupIndex < numGroups; groupIndex += 1) {
            const item = getDataItem(seriesIndex, groupIndex);
            if (!item || hiddenIds?.has(item.id) || (isLog && item.value <= 0)) {
                continue;
            }
            currentSeries[groupIndex] = item.value;
        }
        series.push(currentSeries);
    }
    return series;
}
/**
 * Returns the markertype order.
 */
function getMarkers() {
    return ['square', 'circle', 'diamond', 'plus', 'triangleDown', 'triangleUp'];
}
/**
 * Returns the marker fill and stroke depending on the state.
 */
function getMarkerFillAndStroke(// TODO : JET-62244 - Replace getMarkerFillAndStroke function with classes.
isMarkerDisplayed, isSelectionEnabled, isHovered, isFocused, isSelected, seriesColor, itemColor) {
    let fill;
    let stroke;
    let outerStroke;
    if (isSelectionEnabled) {
        if (isSelected) {
            if (isMarkerDisplayed) {
                // TODO: settle on one visual for selected markers: 
                // Selected effect when markers are turned on
                fill = itemColor || seriesColor;
                outerStroke = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[130]);
                stroke = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0]);
            }
            else {
                // Selected effect when markers are not turned on
                fill = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0]);
                if (isHovered || isFocused) {
                    stroke = itemColor || seriesColor;
                }
                else {
                    stroke = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[130]);
                }
            }
        }
        else if (isHovered || isFocused) {
            stroke = itemColor || seriesColor;
            fill = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0]);
        }
        else {
            if (isMarkerDisplayed) {
                fill = itemColor || seriesColor;
                stroke = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0]);
            }
            else {
                fill = utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0], 0);
                stroke = utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0], 0);
            }
        }
    }
    else if (isMarkerDisplayed) {
        fill = itemColor || seriesColor;
        stroke = utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0]);
    }
    else {
        stroke = isFocused ? itemColor || seriesColor : utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0], 0);
        fill = utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0], 0);
    }
    return { fill, stroke, outerStroke };
}
/**
 * Returns the coordinates of line or area based on orientation and size of the chart.
 */
function getLineAreaSegments(yScale, xScale, data, startIndex, endIndex, isHorizontal, isLog, groups, seriesIndex, getDataItem, timeAxisType) {
    const segments = [];
    let currentPath = [];
    for (let groupIndex = startIndex; groupIndex < endIndex + 1; groupIndex += 1) {
        const item = data[groupIndex];
        if (item == null || (isLog && item <= 0)) {
            segments.push(currentPath);
            currentPath = [];
            continue;
        }
        const x = isHorizontal
            ? yScale.transform(item)
            : layoutUtils.getGroupCenterCoord(groups[groupIndex], groupIndex, xScale, getDataItem(seriesIndex, groupIndex), timeAxisType);
        const y = isHorizontal
            ? layoutUtils.getGroupCenterCoord(groups[groupIndex], groupIndex, xScale, getDataItem(seriesIndex, groupIndex), timeAxisType)
            : yScale.transform(item);
        currentPath.push([x, y]);
        if (groupIndex === endIndex) {
            segments.push(currentPath);
        }
    }
    return segments;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getItemColor(seriesIndex, groupIndex, series, getDataItem) {
    const item = getDataItem(seriesIndex, groupIndex);
    if (item?.color) {
        return item.color;
    }
    if (item.markerColor) {
        return item.markerColor;
    }
    const itemSeries = series[seriesIndex];
    const colors = colorUtils.getColorRamp();
    return (itemSeries.color ||
        itemSeries.lineColor ||
        itemSeries.areaColor ||
        colors[seriesIndex % colors.length]);
}
function getMarkerType(seriesIndex, groupIndex, chartType, getDataItem) {
    if (chartType === 'bar') {
        return 'circle';
    }
    const item = getDataItem(seriesIndex, groupIndex);
    if (item.markerType) {
        return item.markerType;
    }
    const shapes = getMarkers();
    return shapes[seriesIndex % shapes.length];
}

exports.getCmdsForArea = getCmdsForArea;
exports.getCmdsForLine = getCmdsForLine;
exports.getCumulativeSeries = getCumulativeSeries;
exports.getItemAriaLabel = getItemAriaLabel;
exports.getItemColor = getItemColor;
exports.getLineAreaChartNavUtil = getLineAreaChartNavUtil;
exports.getLineAreaSegments = getLineAreaSegments;
exports.getMarkerFillAndStroke = getMarkerFillAndStroke;
exports.getMarkerType = getMarkerType;
exports.getMarkers = getMarkers;
exports.getNextItemInGroup = getNextItemInGroup;
exports.getNextItemInSeries = getNextItemInSeries;
exports.getPrevItemInGroup = getPrevItemInGroup;
exports.getPrevItemInSeries = getPrevItemInSeries;
exports.getSeriesData = getSeriesData;
//# sourceMappingURL=dataStyleUtils-e72725fe.js.map
