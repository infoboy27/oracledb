/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var PRIVATE_Chart_themes_ChartStyles_css = require('./PRIVATE_Chart/themes/ChartStyles.css.js');
var TrackResizeContainer = require('./TrackResizeContainer-cd09fc87.js');
var useTextDimensions = require('./useTextDimensions-0eabedd5.js');
var useCssVars = require('./useCssVars-4f061513.js');
var hooks = require('preact/hooks');
var Gridlines = require('./Gridlines-33618268.js');
var useId = require('./useId-6c0eeb27.js');
var Axis = require('./Axis-caa0444f.js');
var useChartViewport = require('./useChartViewport-8ffd20a9.js');
var layoutUtils = require('./layoutUtils-25201abd.js');
var useChartNav = require('./useChartNav-e850e19e.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var ScrollBar = require('./ScrollBar-dc5cf205.js');
var useSelectDrill = require('./useSelectDrill-64289234.js');
var useUser = require('./useUser-a6d15333.js');
var useTestId = require('./useTestId-8234ec1e.js');
var cssUtils = require('./cssUtils-7fddea41.js');
var useChartContextMenu = require('./useChartContextMenu-d7ed939f.js');
var eventsUtils = require('./eventsUtils-8680c9d7.js');
require('./accUtils-50f26093.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');

require('./Floating-1280c2ce.js');

require('./datatipUtils-ed3682ed.js');
var util = require('./util-28dd0315.js');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var useChartMarquee = require('./useChartMarquee-ab7c89ea.js');
var useVisTouchResponse = require('./useVisTouchResponse-fb9c4e8f.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');

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
    const [text, setText] = hooks.useState();
    const bounds = hooks.useRef();
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text,
        position: 'top-start',
        offset: util.calculateOffset(isRtl, width, bounds.current)
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
        tooltipProps: mergeProps.mergeProps({ onPointerMove }, tooltipProps)
    };
}

const chartVars = cssUtils.getChartVars();
function ChartWithDimensions({ width, height, selectedIds, hiddenIds, hideAndShowBehavior = 'none', orientation = 'vertical', xAxis, yAxis, plotArea, dragMode = 'user', series, groups, isStacked = false, getDataItem, selectionMode = 'none', drilling = 'off', dataCursorPosition, onSelectionChange, isDataCursorEnabled, dataCursorStyle, onViewportChange, onDataCursorPositionChange, onItemDrill, onGroupDrill, onItemHover, onItemFocus, datatip, zoomAndScroll = 'off', offset, getNavUtil, getDataItemPos, getGapRatio, valueFormats, findNearest, getMarkerInfo, isRtl, children, testId, renderGridLinesInFront, contextMenuConfig, ...props }) {
    const testIdProps = useTestId.useTestId(testId);
    const rootRef = hooks.useRef(null);
    const isHoriz = orientation === 'horizontal';
    const { xAxisPosition, yAxisPosition } = layoutUtils.getAxesPosition(yAxis, isHoriz, isRtl);
    const { resolvedVars, cssContent } = useCssVars.useCssVars(chartVars);
    const colors = Array.from(Array(12)).map((_, index) => {
        return resolvedVars[`color${index + 1}`];
    });
    const { textMeasureContent, getTextDimensions } = useTextDimensions.useTextDimensions();
    let availSpace = layoutUtils.getAvailSpace(width, height);
    const updatedSpace = layoutUtils.getScrollBarSpace(availSpace, zoomAndScroll, xAxisPosition);
    let scrollDims = updatedSpace.scrollDims;
    availSpace = updatedSpace.availSpace;
    const hiddenSet = new Set(hiddenIds);
    const { locale } = useUser.useUser();
    const { xProps, xScale, xViewportExtent, xAxisExtent, xIndexExtent, yViewportExtent, yAxisExtent, groupWidth, yProps, yScale, yMaxDim, yMajorTicks, yMinorTicks, plotAreaSpace, idToDataMap } = layoutUtils.getLayoutInfo(series, groups, getDataItem, xAxis, yAxis, availSpace, hiddenSet, hideAndShowBehavior, isHoriz, isRtl, isStacked, resolvedVars['labelFontSize'], offset, locale, getTextDimensions);
    scrollDims = layoutUtils.updateScrollBarSpace(scrollDims, xAxisPosition === 'bottom', isRtl, yMaxDim);
    const gapRatio = getGapRatio(xIndexExtent.startIndex, xIndexExtent.endIndex);
    const getNextChartItem = getNavUtil(xIndexExtent.startIndex, xIndexExtent.endIndex);
    const renderedGroupsIndex = xProps.tickLabels.map(({ index }) => index + xIndexExtent.startIndex);
    const { getNextNavGroup, getDefaultNavGroup } = getGroupNavUtil(groups, renderedGroupsIndex, xIndexExtent, drilling, isRtl);
    const { cursor, marqueeProps, marqueeContent, toggleButtonContent, isPointInsideMarquee, dragMode: mode } = useChartMarquee.useChartMarquee({
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
    const { touchResponse, touchResponseStyle } = useVisTouchResponse.useVisTouchResponse({
        type: 'auto',
        supportsTouchDragGestures: mode !== 'off',
        rootRef
    });
    const { activeId, focusedItemInfo, hoveredItemInfo, focusedGroupInfo, navProps, onFocusUpdate } = useChartNav.useChartNav({
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
            const dataSet = eventsUtils.getElementData(rootRef, target);
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
    const { selectDrillProps, selectionContent } = useSelectDrill.useSelectDrill({
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
    const viewportProps = useChartViewport.useChartViewport({
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
    const { datatipContent, dataCursorContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useSelectDrill.useChartDatatipAndCursor({
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
    const plotAreaClipPathId = useId.useId();
    const { viewportMin: xViewportMin, viewportMax: xViewportMax } = xViewportExtent;
    const { startIndex: xStartIndex, endIndex: xEndIndex } = xIndexExtent;
    const gridLines = (jsxRuntime.jsx(Gridlines.Gridlines, { plotArea: plotArea, yMinorTicks: yMinorTicks, xScale: xScale, yScale: yScale, isLog: yAxis?.scale === 'log', xViewportMin: xViewportMin, xViewportMax: xViewportMax, yTicks: yMajorTicks, yAxisPosition: yAxisPosition }));
    const { contextMenuContent, contextMenuProps } = useChartContextMenu.useChartContextMenu({
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
    const eventsProps = mergeProps.mergeProps(navProps, selectDrillProps, viewportProps, datatipProps, marqueeProps, tooltipProps, contextMenuProps);
    return (jsxRuntime.jsxs("div", { tabIndex: 0, ref: rootRef, "aria-activedescendant": activeId, "aria-label": props['aria-label'], "aria-labelledby": props['aria-labelledby'], "aria-describedby": stringUtils.merge([props['aria-describedby'], datatipAriaDescribedby]), style: { width, height, ...touchResponseStyle }, role: "application", className: PRIVATE_Chart_themes_ChartStyles_css.styles.outline, ...testIdProps, ...eventsProps, children: [jsxRuntime.jsxs("svg", { width: "100%", height: "100%", children: [jsxRuntime.jsx("clipPath", { id: `${plotAreaClipPathId}`, children: jsxRuntime.jsx("rect", { ...plotAreaSpace }) }), jsxRuntime.jsx(Gridlines.PlotArea, { color: plotArea?.color, yScale: yScale, cursor: cursor, isLog: yAxis?.scale === 'log', availSpace: plotAreaSpace, xAxisPosition: xAxisPosition }), !renderGridLinesInFront && gridLines, jsxRuntime.jsx(Axis.Axis, { ...yProps, axisPosition: yAxisPosition, isRtl: isRtl }), jsxRuntime.jsx(Axis.Axis, { ...xProps, isRtl: isRtl, axisPosition: xAxisPosition, isTextInteractive: isGroupInteractive, activeId: activeId, focusedGroupIndex: focusedGroupInfo.isFocusVisible ? focusedGroupInfo.groupIndex : undefined }), jsxRuntime.jsxs("g", { "clip-path": `url(#${plotAreaClipPathId})`, children: [children({
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
                            }), renderGridLinesInFront && gridLines, dataCursorContent] }), zoomAndScroll === 'live' && (jsxRuntime.jsx(ScrollBar.ScrollBar, { availSpace: scrollDims, isRtl: isRtl, viewport: xViewportExtent, axisExtent: xAxisExtent, isHoriz: xAxisPosition === 'bottom' })), marqueeContent] }), toggleButtonContent, textMeasureContent, cssContent, datatipContent, tooltipContent, contextMenuContent, selectionContent] }));
}

function Chart({ width, height, ...props }) {
    // TODO: reevaluate how we handle empty data
    return (jsxRuntime.jsx(TrackResizeContainer.TrackResizeContainer, { width: width, height: height, class: PRIVATE_Chart_themes_ChartStyles_css.dimensionStyle, children: (width, height) => width || height ? (jsxRuntime.jsx(ChartWithDimensions, { width: width, height: height, ...props })) : undefined }));
}

exports.Chart = Chart;
//# sourceMappingURL=Chart-c55ecfa4.js.map
