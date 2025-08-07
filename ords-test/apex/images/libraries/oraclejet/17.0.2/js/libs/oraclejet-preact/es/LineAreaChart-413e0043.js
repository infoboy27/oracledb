/* @oracle/oraclejet-preact: undefined */
import { jsx, Fragment, jsxs } from 'preact/jsx-runtime';
import { e as getGroupCenterCoord, f as findNearestDataPoint } from './layoutUtils-c9c5367a.js';
import { h as getCmdsForArea, i as getMarkerFillAndStroke, g as getItemAriaLabel, j as getCmdsForLine, k as getCumulativeSeries, l as getSeriesData, m as getLineAreaSegments, n as getLineAreaChartNavUtil, e as getItemColor, f as getMarkerType, o as getMarkers } from './dataStyleUtils-4aad0486.js';
import { dvtVars, colorSchemeVars } from './Common/themes/themeContract.css.js';
import { a as MARKER_PADDING, M as Marker } from './Marker-546af001.js';
import './SvgShapesStyles.styles.css';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { s as supportsMobileScreenReader } from './accUtils-dc32d20b.js';
import { u as useUser } from './useUser-99920e02.js';
import { g as getColorRamp } from './colorUtils-9c7b574c.js';
import { r as rgba } from './utils-6eab3a64.js';
import { styles } from './PRIVATE_Chart/themes/ChartStyles.css.js';
import { C as Chart } from './Chart-793bd008.js';

function AreaSeries({ yScale, lineType = 'straight', color, isHorizontal, isLog, areaColorOpacity, lineSegmentCoords, bottomCoords, isHighlighted, isBottomSegmentCurved, seriesIndex }) {
    const style = {
        fill: color,
        opacity: isHighlighted
            ? areaColorOpacity
            : `calc(${dvtVars.dimmedOpacity} * ${areaColorOpacity})`
    };
    return (jsx(Fragment, { children: lineSegmentCoords.map((lineSegmentCoords) => {
            let baseCoords;
            if (bottomCoords) {
                // custom bottom coords. eg: top of last series in stacked area
                baseCoords = bottomCoords;
            }
            else {
                // TODO: make this more generic when we support apps setting baseline
                // for log assume domain min is the baseline, otherwise use 0 baseline
                const baselineCoord = yScale.transform(isLog ? yScale.domain()[0] : 0);
                baseCoords = isHorizontal
                    ? [
                        [baselineCoord, lineSegmentCoords[0][1]],
                        [baselineCoord, lineSegmentCoords[lineSegmentCoords.length - 1][1]]
                    ]
                    : [
                        [lineSegmentCoords[0][0], baselineCoord],
                        [lineSegmentCoords[lineSegmentCoords.length - 1][0], baselineCoord]
                    ];
            }
            const cmds = getCmdsForArea(lineSegmentCoords, baseCoords, lineType, isHorizontal, isBottomSegmentCurved);
            return (jsx("path", { d: cmds, style: style, "data-oj-series-index": seriesIndex, "data-oj-object": 'area' }));
        }) }));
}

const MARKER_DEFAULT_SIZE = 10;
function Markers({ yScale, xScale, color, seriesIndex, startIndex, endIndex, hiddenIds, selectedIds, orientation, isLog, data, markerType, getDataItem, focusedItemIndex, hoveredItemIndex, isDrillEnabled, activeId, isSelectionEnabled, timeAxisType, isPointInsideMarquee, series, groups }) {
    const isHoriz = orientation === 'horizontal';
    const items = [];
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    for (let groupIndex = startIndex; groupIndex < endIndex + 1; groupIndex++) {
        const item = getDataItem(seriesIndex, groupIndex);
        const value = data[groupIndex];
        if (!item || value == null || hiddenIds?.has(item.id) || (isLog && value <= 0)) {
            continue;
        }
        const x = isHoriz
            ? yScale.transform(value)
            : getGroupCenterCoord(groups[groupIndex], groupIndex, xScale, item, timeAxisType);
        const y = isHoriz
            ? getGroupCenterCoord(groups[groupIndex], groupIndex, xScale, item, timeAxisType)
            : yScale.transform(value);
        const isFocused = focusedItemIndex === groupIndex;
        const isHovered = hoveredItemIndex === groupIndex;
        const isSelected = !!(selectedIds?.has(item.id) || isPointInsideMarquee?.(item.id, { x, y }));
        const isDrillable = item.drilling === 'on' || (item.drilling != 'off' && isDrillEnabled);
        const { fill, stroke, outerStroke } = getMarkerFillAndStroke(!!item.isMarkerDisplayed, isSelectionEnabled, isHovered, isFocused, isSelected, color, item.markerColor);
        const itemMarkerType = item.isMarkerDisplayed ? item.markerType || markerType : markerType;
        const isActive = isFocused || isHovered;
        const ariaLabel = supportsMobileScreenReader || isActive
            ? getItemAriaLabel(translations, series.name || series.id.toString(), groups[groupIndex].name || groups[groupIndex].id, item.value, isSelectionEnabled, isSelected, isDrillable, item.accessibleLabel)
            : undefined;
        const dataInfo = {
            'data-oj-series-index': seriesIndex,
            'data-oj-group-index': groupIndex,
            'data-oj-object': 'item',
            id: isActive ? activeId : undefined,
            role: ariaLabel ? 'img' : undefined,
            'aria-label': ariaLabel
        };
        const markerSize = (item.markerSize || MARKER_DEFAULT_SIZE) + 2 * MARKER_PADDING;
        items.push(jsx(Marker, { type: itemMarkerType, tx: x, ty: y, isInteractive: isDrillable || isSelectionEnabled, scale: 1, fill: fill, stroke: stroke, outerStroke: outerStroke, width: markerSize, height: markerSize, dataInfo: dataInfo, preserveRectAspectRatio: true }));
    }
    return jsx(Fragment, { children: items });
}

function LineSeries({ color, isHorizontal, lineType = 'straight', lineColor, lineStyle, lineWidth = 3, isHighlighted, lineSegmentCoords, seriesIndex }) {
    const style = {
        stroke: lineColor || color,
        strokeDasharray: lineStyle === 'dotted' ? 3 : lineStyle === 'dashed' ? 6 : undefined,
        strokeWidth: lineWidth,
        fill: rgba(colorSchemeVars.palette.neutral[0], 0)
    };
    return (jsx(Fragment, { children: lineSegmentCoords.map((value) => {
            const cmds = getCmdsForLine(value, lineType, isHorizontal);
            return lineType === 'straight' ? (jsx("polyline", { points: cmds, style: style, className: isHighlighted ? undefined : styles.dimmed, "data-oj-series-index": seriesIndex, "data-oj-object": 'line' })) : (jsx("path", { d: cmds, style: style, className: isHighlighted ? undefined : styles.dimmed, "data-oj-series-index": seriesIndex, "data-oj-object": 'line' }));
        }) }));
}

const AXIS_OFFSET = 0.2;
/**
 * The LineAreaChart displays information graphically using lines and filled areas, making relationships among the data easier to understand.
 */
function LineAreaChart({ width, height, selectedIds = [], hiddenIds = [], highlightedIds, hideAndShowBehavior = 'none', orientation = 'vertical', yAxis, series, groups, isStacked = false, getDataItem, selectionMode = 'none', drilling = 'off', type = 'line', ...props }) {
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const isLog = yAxis?.scale === 'log';
    const timeAxisType = props.xAxis?.timeAxisType;
    const hiddenSet = new Set(hiddenIds);
    const selectedSet = new Set(selectedIds);
    const highlightedSet = new Set(highlightedIds);
    const isHoriz = orientation === 'horizontal';
    const colors = getColorRamp();
    const renderedSeries = isStacked
        ? getCumulativeSeries(series.length, groups.length, getDataItem, hiddenSet, isLog)
        : getSeriesData(series?.length, groups?.length, getDataItem, hiddenSet, isLog);
    const renderedGetDataItem = (seriesIndex, groupIndex) => {
        if (!isStacked)
            return getDataItem(seriesIndex, groupIndex);
        return {
            ...getDataItem(seriesIndex, groupIndex),
            value: renderedSeries[seriesIndex][groupIndex]
        };
    };
    const getGapRatio = () => {
        return 1;
    };
    const getNextChartItemFunc = (startIndex, endIndex) => {
        return getLineAreaChartNavUtil(getDataItem, series.length, startIndex, endIndex, isStacked, isRtl, isHoriz);
    };
    const getDataItemPos = (xScale, yScale) => {
        return (seriesIndex, groupIndex) => {
            const value = renderedSeries[seriesIndex][groupIndex];
            let xVal = groupIndex;
            if (timeAxisType) {
                const val = timeAxisType === 'mixedFrequency'
                    ? getDataItem(seriesIndex, groupIndex)?.x
                    : groups[groupIndex].id;
                xVal = new Date(val).getTime();
            }
            const x = isHoriz ? yScale.transform(value) : xScale.transform(xVal);
            const y = isHoriz ? xScale.transform(xVal) : yScale.transform(value);
            return { x, y, height: 0, width: 0 };
        };
    };
    const getMarkerColorAndType = (seriesIndex, groupIndex) => {
        return {
            color: getItemColor(seriesIndex, groupIndex, series, getDataItem),
            type: getMarkerType(seriesIndex, groupIndex, 'lineWithArea', getDataItem)
        };
    };
    const findNearest = (xScale, yScale) => {
        const getSeriesDataInfo = () => {
            return {
                offset: 0,
                dataWidth: 0
            };
        };
        const getYCoord = (value, yScale) => {
            return yScale.transform(value);
        };
        return findNearestDataPoint(series, groups, xScale, yScale, renderedGetDataItem, isStacked, getSeriesDataInfo, getYCoord, isLog, 0, hiddenSet, timeAxisType);
    };
    const markers = getMarkers();
    const areaOpacity = type === 'lineWithArea' ? 0.5 : 1;
    const isAreaRendered = type === 'area' || type === 'lineWithArea';
    const isContrastLineNeeded = type === 'area';
    const allLineSegmentCoords = [];
    return (jsx(Chart, { width: width, height: height, selectedIds: selectedSet, hiddenIds: hiddenIds, hideAndShowBehavior: hideAndShowBehavior, orientation: orientation, yAxis: yAxis, series: series, groups: groups, selectionMode: selectionMode, drilling: drilling, isStacked: isStacked, getDataItem: getDataItem, findNearest: findNearest, getDataItemPos: getDataItemPos, getMarkerInfo: getMarkerColorAndType, renderGridLinesInFront: isAreaRendered, getNavUtil: getNextChartItemFunc, getGapRatio: getGapRatio, offset: AXIS_OFFSET, isRtl: isRtl, ...props, children: ({ xStartIndex, xEndIndex, xScale, yScale, activeId, focusedItemInfo, hoveredItemInfo, isPointInsideMarquee }) => {
            return (jsxs(Fragment, { children: [renderedSeries.map((lineAreaSeries, index) => {
                        if (lineAreaSeries.length === 0) {
                            /* TODO: need a better way to handle when a series is hidden. */
                            return;
                        }
                        const seriesItem = series[index];
                        const lineSegmentCoords = getLineAreaSegments(yScale, xScale, lineAreaSeries, xStartIndex, xEndIndex, isHoriz, isLog, groups, index, renderedGetDataItem, timeAxisType);
                        allLineSegmentCoords[index] = lineSegmentCoords[0];
                        const isBottomSegmentCurved = seriesItem.lineType === 'curved' &&
                            isStacked &&
                            renderedSeries.length > 1 &&
                            index > 0;
                        const isHighlighted = highlightedIds === undefined || highlightedSet.has(seriesItem.id);
                        return (jsxs(Fragment, { children: [isAreaRendered && (jsx(AreaSeries, { yScale: yScale, lineType: seriesItem.lineType, color: seriesItem.areaColor || colors[index % colors.length], isHorizontal: isHoriz, areaColorOpacity: areaOpacity, isBottomSegmentCurved: isBottomSegmentCurved, bottomCoords: isStacked && index != 0 ? allLineSegmentCoords[index - 1] : undefined, lineSegmentCoords: lineSegmentCoords, isLog: isLog, isHighlighted: isHighlighted, seriesIndex: index })), jsx(LineSeries, { lineType: seriesItem.lineType, 
                                    /* TODO: confirm with UX if this is contrastLine (changes depending on dark/light mode) or always white.
                                        It's always white in legacy.*/
                                    lineColor: isContrastLineNeeded ? colorSchemeVars.dvt.contrastLine : seriesItem.lineColor, 
                                    /* The area generated in legacy are bit apart and not touching when stacked. Preact areas are a bit closer than legacy when curved.
                                      Increased the contrast linewidth (to 2.5 from legacy 1.25) to give legacy visual treatment.
                                      TODO: investivage why legacy areas are not touching. maybe we want to do the same in preact svg utils that
                                      generates this curve.
                                     */
                                    lineWidth: isContrastLineNeeded ? (isStacked ? 2.5 : 1.25) : seriesItem.lineWidth, lineStyle: seriesItem.lineStyle, color: seriesItem.lineColor || colors[index % colors.length], lineSegmentCoords: lineSegmentCoords, isHorizontal: isHoriz, isHighlighted: isHighlighted, seriesIndex: index }), 
                                /*for non stacked charts, markers should render in the order of series.
                                 some markers might get hidden behind area but this preserves the legacy behavior. */
                                !isStacked && (jsx(Markers, { yScale: yScale, xScale: xScale, groups: groups, series: seriesItem, timeAxisType: timeAxisType, data: lineAreaSeries, color: seriesItem.lineColor ||
                                        seriesItem.areaColor ||
                                        colors[index % colors.length] /* TODO : make this use getItemColor function from dataStyleUtils. */, seriesIndex: index, startIndex: xStartIndex, endIndex: xEndIndex, markerType: markers[index % markers.length], orientation: orientation, isLog: isLog, activeId: activeId, getDataItem: getDataItem, isPointInsideMarquee: isPointInsideMarquee, selectedIds: selectedSet, focusedItemIndex: focusedItemInfo.seriesIndex === index &&
                                        focusedItemInfo.isFocusVisible &&
                                        !(props.isDataCursorEnabled && props.dataCursorStyle?.isMarkerDisplayed)
                                        ? focusedItemInfo.groupIndex
                                        : undefined, hoveredItemIndex: hoveredItemInfo?.isCurrent && hoveredItemInfo.seriesIndex === index
                                        ? hoveredItemInfo.groupIndex
                                        : undefined, isSelectionEnabled: selectionMode === 'single' || selectionMode === 'multiple', isDrillEnabled: drilling === 'on' }))] }));
                    }), isStacked &&
                        renderedSeries.map((lineAreaSeries, index) => {
                            if (lineAreaSeries.length === 0) {
                                /* TODO: need a better way to handle when a series is hidden.*/
                                return;
                            }
                            const seriesItem = series[index];
                            return (jsx(Markers, { yScale: yScale, series: series[index], xScale: xScale, groups: groups, timeAxisType: timeAxisType, data: lineAreaSeries, color: seriesItem.lineColor || seriesItem.areaColor || colors[index % colors.length], seriesIndex: index, isPointInsideMarquee: isPointInsideMarquee, startIndex: xStartIndex, endIndex: xEndIndex, markerType: markers[index % markers.length], orientation: orientation, isLog: isLog, activeId: activeId, getDataItem: getDataItem, selectedIds: selectedSet, focusedItemIndex: focusedItemInfo.seriesIndex === index && focusedItemInfo.isFocusVisible
                                    ? focusedItemInfo.groupIndex
                                    : undefined, hoveredItemIndex: hoveredItemInfo?.isCurrent && hoveredItemInfo.seriesIndex === index
                                    ? hoveredItemInfo.groupIndex
                                    : undefined, isSelectionEnabled: selectionMode === 'single' || selectionMode === 'multiple', isDrillEnabled: drilling === 'on' }));
                        })] }));
        } }));
}

export { LineAreaChart as L };
//# sourceMappingURL=LineAreaChart-413e0043.js.map
