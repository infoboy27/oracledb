/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { styles, dimensionStyle } from './PRIVATE_Chart/themes/ChartStyles.css.js';
import { T as TrackResizeContainer } from './TrackResizeContainer-8360f2c2.js';
import { u as useTextDimensions } from './useTextDimensions-e48f2781.js';
import { u as useCssVars } from './useCssVars-64d9b696.js';
import { useState, useRef } from 'preact/hooks';
import { G as Gridlines, P as PlotArea } from './Gridlines-428bf909.js';
import { u as useId } from './useId-03dbfdf0.js';
import { A as Axis } from './Axis-3eec4b00.js';
import { u as useChartViewport } from './useChartViewport-634ea088.js';
import { g as getAxesPosition, a as getScrollBarSpace, b as getLayoutInfo, u as updateScrollBarSpace, c as getAvailSpace } from './layoutUtils-c9c5367a.js';
import { u as useChartNav } from './useChartNav-be57fa70.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { S as ScrollBar } from './ScrollBar-a431a4f0.js';
import { a as useSelectDrill, u as useChartDatatipAndCursor } from './useSelectDrill-9ce5bccf.js';
import { u as useUser } from './useUser-99920e02.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { g as getChartVars } from './cssUtils-5492d949.js';
import { u as useChartContextMenu } from './useChartContextMenu-0014fc73.js';
import { a as getElementData } from './eventsUtils-d544e874.js';
import './accUtils-dc32d20b.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import './LayerStyles.styles.css';
import './Floating-9703160e.js';
import './useDatatip.styles.css';
import './datatipUtils-5cb22909.js';
import { c as calculateOffset } from './util-c1d41418.js';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { u as useChartMarquee } from './useChartMarquee-38dbb5f9.js';
import { u as useVisTouchResponse } from './useVisTouchResponse-e9ca4766.js';
import { m as merge } from './stringUtils-16f617bc.js';

function getNextGroup(info, viewportEndIndex, isGroupNavigable) {
    const groupIndex = info.groupIndex + 1;
    if (groupIndex >= viewportEndIndex) {
        return;
    }
    if (isGroupNavigable(groupIndex)) {
        return { groupIndex };
    }
    return getNextGroup({ groupIndex }, viewportEndIndex, isGroupNavigable);
}
function getPreviousGroup(info, isGroupNavigable) {
    const groupIndex = info.groupIndex - 1;
    if (groupIndex < 0) {
        return;
    }
    if (isGroupNavigable(groupIndex)) {
        return { groupIndex };
    }
    return getPreviousGroup({ groupIndex }, isGroupNavigable);
}
function getGroupNavUtil(groups, renderedGroups, xIndexExtent, drilling, isRtl) {
    const isGroupNavigable = (groupIndex) => {
        const groupsDrilling = groups[renderedGroups[groupIndex]].drilling;
        return (drilling === 'on' || drilling === 'groupsOnly') && groupsDrilling != 'off';
    };
    const getDefaultNavGroup = (info) => {
        if (xIndexExtent.startIndex > renderedGroups[info.groupIndex]) {
            info.groupIndex = 0;
            return info;
        }
        else if (xIndexExtent.endIndex < renderedGroups[info.groupIndex]) {
            info.groupIndex = renderedGroups.length - 1;
            return info;
        }
        return;
    };
    const getNextNavGroup = (info, arrow) => {
        let nextGroup = getDefaultNavGroup(info);
        if (nextGroup)
            return nextGroup;
        if (arrow === 'ArrowRight') {
            nextGroup = isRtl
                ? getPreviousGroup(info, isGroupNavigable)
                : getNextGroup(info, renderedGroups.length, isGroupNavigable);
        }
        else {
            nextGroup = isRtl
                ? getNextGroup(info, renderedGroups.length, isGroupNavigable)
                : getPreviousGroup(info, isGroupNavigable);
        }
        return nextGroup || info;
    };
    return { getDefaultNavGroup, getNextNavGroup };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useTextTruncation({ getTextAndBounds, width, isRtl }) {
    const [text, setText] = useState();
    const bounds = useRef();
    const { tooltipContent, tooltipProps } = useTooltip({
        text,
        position: 'top-start',
        offset: calculateOffset(isRtl, width, bounds.current)
    });
    const onPointerMove = (event) => {
        const textAndBounds = getTextAndBounds(event.target);
        if (textAndBounds) {
            bounds.current = textAndBounds.bounds;
            setText(textAndBounds.text);
        }
        else {
            setText(undefined);
        }
    };
    return {
        tooltipContent,
        tooltipProps: mergeProps({ onPointerMove }, tooltipProps)
    };
}

const chartVars = getChartVars();
function ChartWithDimensions({ width, height, selectedIds, hiddenIds, hideAndShowBehavior = 'none', orientation = 'vertical', xAxis, yAxis, plotArea, dragMode = 'user', series, groups, isStacked = false, getDataItem, selectionMode = 'none', drilling = 'off', dataCursorPosition, onSelectionChange, isDataCursorEnabled, dataCursorStyle, onViewportChange, onDataCursorPositionChange, onItemDrill, onGroupDrill, onItemHover, onItemFocus, datatip, zoomAndScroll = 'off', offset, getNavUtil, getDataItemPos, getGapRatio, valueFormats, findNearest, getMarkerInfo, isRtl, children, testId, renderGridLinesInFront, contextMenuConfig, ...props }) {
    const testIdProps = useTestId(testId);
    const rootRef = useRef(null);
    const isHoriz = orientation === 'horizontal';
    const { xAxisPosition, yAxisPosition } = getAxesPosition(yAxis, isHoriz, isRtl);
    const { resolvedVars, cssContent } = useCssVars(chartVars);
    const colors = Array.from(Array(12)).map((_, index) => {
        return resolvedVars[`color${index + 1}`];
    });
    const { textMeasureContent, getTextDimensions } = useTextDimensions();
    let availSpace = getAvailSpace(width, height);
    const updatedSpace = getScrollBarSpace(availSpace, zoomAndScroll, xAxisPosition);
    let scrollDims = updatedSpace.scrollDims;
    availSpace = updatedSpace.availSpace;
    const hiddenSet = new Set(hiddenIds);
    const { locale } = useUser();
    const { xProps, xScale, xViewportExtent, xAxisExtent, xIndexExtent, yViewportExtent, yAxisExtent, groupWidth, yProps, yScale, yMaxDim, yMajorTicks, yMinorTicks, plotAreaSpace, idToDataMap } = getLayoutInfo(series, groups, getDataItem, xAxis, yAxis, availSpace, hiddenSet, hideAndShowBehavior, isHoriz, isRtl, isStacked, resolvedVars['labelFontSize'], offset, locale, getTextDimensions);
    scrollDims = updateScrollBarSpace(scrollDims, xAxisPosition === 'bottom', isRtl, yMaxDim);
    const gapRatio = getGapRatio(xIndexExtent.startIndex, xIndexExtent.endIndex);
    const getNextChartItem = getNavUtil(xIndexExtent.startIndex, xIndexExtent.endIndex);
    const renderedGroupsIndex = xProps.tickLabels.map(({ index }) => index + xIndexExtent.startIndex);
    const { getNextNavGroup, getDefaultNavGroup } = getGroupNavUtil(groups, renderedGroupsIndex, xIndexExtent, drilling, isRtl);
    const { cursor, marqueeProps, marqueeContent, toggleButtonContent, isPointInsideMarquee, dragMode: mode } = useChartMarquee({
        plotAreaSpace,
        dragMode,
        chartWidth: width,
        isMultiSelection: selectionMode === 'multiple',
        onViewportChange,
        isZoomScroll: zoomAndScroll === 'live',
        xAxisExtent,
        xScale,
        selectedIds,
        getDataById: (id) => idToDataMap.get(id),
        onSelectionChange,
        viewportMax: xViewportExtent.viewportMax,
        viewportMin: xViewportExtent.viewportMin,
        isRtl
    });
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({
        type: 'auto',
        supportsTouchDragGestures: mode !== 'off',
        rootRef
    });
    const { activeId, focusedItemInfo, hoveredItemInfo, focusedGroupInfo, navProps, onFocusUpdate } = useChartNav({
        rootRef,
        getNextChartItem,
        getNextNavGroup,
        getDefaultNavGroup,
        touchResponse,
        onItemHover,
        onItemFocus,
        drilling,
        xIndexExtent
    });
    const onContextMenuDismissed = (gesture) => {
        if (gesture === 'keyboard') {
            onFocusUpdate();
        }
    };
    const getTextAndBounds = (target) => {
        if (target != rootRef.current) {
            const dataSet = getElementData(rootRef, target);
            const text = dataSet?.['ojText'];
            if (!text) {
                return;
            }
            if (text === xAxis?.title) {
                return {
                    text,
                    bounds: xProps.titleProps?.dims
                };
            }
            else if (text === yAxis?.title) {
                return {
                    text,
                    bounds: yProps.titleProps?.dims
                };
            }
            else if (dataSet?.['ojGroupIndex']) {
                const index = parseInt(dataSet['ojGroupIndex']);
                return {
                    bounds: xProps.tickLabels[index].dims,
                    text: text
                };
            }
        }
        if (target === rootRef.current && focusedGroupInfo.isFocusVisible) {
            const group = groups[focusedGroupInfo.groupIndex];
            return {
                bounds: xProps.tickLabels[focusedGroupInfo.groupIndex].dims,
                text: group.name || group.id
            };
        }
        return;
    };
    const { tooltipContent, tooltipProps } = useTextTruncation({
        getTextAndBounds,
        width,
        isRtl
    });
    const { selectDrillProps, selectionContent } = useSelectDrill({
        selectionMode,
        selection: [...selectedIds],
        onChange: onSelectionChange,
        rootRef,
        drilling,
        onItemDrill,
        onGroupDrill,
        focusedGroupInfo,
        focusedItemInfo,
        groups,
        getDataItem,
        getDataById: (id) => idToDataMap.get(id)
    });
    const viewportProps = useChartViewport({
        rootRef,
        width,
        height,
        xViewportExtent,
        yViewportExtent,
        xAxisExtent,
        yAxisExtent,
        xScale,
        yScale,
        plotAreaSpace,
        isRtl,
        isHoriz,
        zoomAndScroll,
        onViewportChange
    });
    const findNearestData = findNearest(xScale, yScale, groupWidth, gapRatio);
    const getDataItemPosition = getDataItemPos(xScale, yScale, groupWidth, gapRatio);
    const { datatipContent, dataCursorContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useChartDatatipAndCursor({
        series,
        groups,
        width,
        height,
        findNearest: findNearestData,
        plotAreaSpace,
        onDataCursorPositionChange,
        isDataCursorEnabled,
        dataCursorPosition,
        dataCursorStyle,
        hoveredItemInfo,
        focusedItemInfo,
        getDataItem,
        getMarkerInfo,
        getDataItemPos: getDataItemPosition,
        datatip,
        valueFormats,
        isHoriz,
        touchResponse,
        isDisabled: mode != 'off',
        xScale: xScale,
        yScale,
        timeAxisType: xAxis?.timeAxisType
    });
    const isGroupInteractive = (index) => {
        if (xAxis?.timeAxisType != null) {
            return false;
        }
        const groupDrill = groups[index].drilling;
        if (groupDrill === 'on') {
            return true;
        }
        if (groupDrill != 'off' && (drilling === 'on' || drilling === 'groupsOnly')) {
            return true;
        }
        return false;
    };
    const plotAreaClipPathId = useId();
    const { viewportMin: xViewportMin, viewportMax: xViewportMax } = xViewportExtent;
    const { startIndex: xStartIndex, endIndex: xEndIndex } = xIndexExtent;
    const gridLines = (jsx(Gridlines, { plotArea: plotArea, yMinorTicks: yMinorTicks, xScale: xScale, yScale: yScale, isLog: yAxis?.scale === 'log', xViewportMin: xViewportMin, xViewportMax: xViewportMax, yTicks: yMajorTicks, yAxisPosition: yAxisPosition }));
    const { contextMenuContent, contextMenuProps } = useChartContextMenu({
        series,
        groups,
        getDataItem,
        focusedItemInfo,
        rootRef,
        xAxisTitle: xAxis?.title,
        yAxisTitle: yAxis?.title,
        contextMenuConfig,
        onContextMenuDismissed
    });
    const eventsProps = mergeProps(navProps, selectDrillProps, viewportProps, datatipProps, marqueeProps, tooltipProps, contextMenuProps);
    return (jsxs("div", { tabIndex: 0, ref: rootRef, "aria-activedescendant": activeId, "aria-label": props['aria-label'], "aria-labelledby": props['aria-labelledby'], "aria-describedby": merge([props['aria-describedby'], datatipAriaDescribedby]), style: { width, height, ...touchResponseStyle }, role: "application", className: styles.outline, ...testIdProps, ...eventsProps, children: [jsxs("svg", { width: "100%", height: "100%", children: [jsx("clipPath", { id: `${plotAreaClipPathId}`, children: jsx("rect", { ...plotAreaSpace }) }), jsx(PlotArea, { color: plotArea?.color, yScale: yScale, cursor: cursor, isLog: yAxis?.scale === 'log', availSpace: plotAreaSpace, xAxisPosition: xAxisPosition }), !renderGridLinesInFront && gridLines, jsx(Axis, { ...yProps, axisPosition: yAxisPosition, isRtl: isRtl }), jsx(Axis, { ...xProps, isRtl: isRtl, axisPosition: xAxisPosition, isTextInteractive: isGroupInteractive, activeId: activeId, focusedGroupIndex: focusedGroupInfo.isFocusVisible ? focusedGroupInfo.groupIndex : undefined }), jsxs("g", { "clip-path": `url(#${plotAreaClipPathId})`, children: [children({
                                xStartIndex,
                                xEndIndex,
                                colors,
                                xScale: xScale,
                                yScale,
                                isPointInsideMarquee,
                                defaultFontSize: resolvedVars['labelFontSize'],
                                gapRatio,
                                activeId,
                                focusedItemInfo,
                                hoveredItemInfo,
                                getTextDimensions,
                                groupWidth
                            }), renderGridLinesInFront && gridLines, dataCursorContent] }), zoomAndScroll === 'live' && (jsx(ScrollBar, { availSpace: scrollDims, isRtl: isRtl, viewport: xViewportExtent, axisExtent: xAxisExtent, isHoriz: xAxisPosition === 'bottom' })), marqueeContent] }), toggleButtonContent, textMeasureContent, cssContent, datatipContent, tooltipContent, contextMenuContent, selectionContent] }));
}

function Chart({ width, height, ...props }) {
    // TODO: reevaluate how we handle empty data
    return (jsx(TrackResizeContainer, { width: width, height: height, class: dimensionStyle, children: (width, height) => width || height ? (jsx(ChartWithDimensions, { width: width, height: height, ...props })) : undefined }));
}

export { Chart as C };
//# sourceMappingURL=Chart-793bd008.js.map
