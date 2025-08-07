/* @oracle/oraclejet-preact: undefined */
'use strict';

var mergeProps = require('./mergeProps-e3da7237.js');
var useChartDataCursor = require('./useChartDataCursor-7f36d497.js');
var useChartDatatip = require('./useChartDatatip-7b7f757f.js');
var eventsUtils = require('./eventsUtils-8680c9d7.js');
require('./accUtils-50f26093.js');
var useChartDrill = require('./useChartDrill-fefe92fb.js');
var useSelection = require('./useSelection-8f71759b.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useChartDatatipAndCursor({ series, groups, width, height, findNearest, getMarkerInfo, onDataCursorPositionChange, isDataCursorEnabled, dataCursorPosition, dataCursorStyle, hoveredItemInfo, focusedItemInfo, getDataItem, getDataItemPos, datatip, valueFormats, isHoriz, xScale, yScale, plotAreaSpace, timeAxisType, touchResponse, isDisabled }) {
    const { datatipContent, datatipProps } = useChartDatatip.useChartDatatip({
        series,
        groups,
        width,
        height,
        isDataCursorEnabled,
        dataCursorPosition,
        hoveredItemInfo,
        getDataItem,
        getDataItemPos,
        focusedItemInfo,
        datatip,
        valueFormats,
        isHoriz,
        xScale,
        findNearest,
        timeAxisType,
        touchResponse,
        isDisabled
    });
    const { dataCursorContent, dataCursorProps } = useChartDataCursor.useChartDataCursor({
        touchResponse,
        findNearest,
        dataCursorPosition,
        onDataCursorPositionChange,
        isDataCursorEnabled,
        dataCursorStyle,
        isHoriz,
        getMarkerInfo,
        focusedItemInfo,
        plotAreaSpace,
        yScale,
        xScale,
        getDataItemPos
    });
    return {
        datatipContent,
        dataCursorContent,
        datatipProps: mergeProps.mergeProps(dataCursorProps, datatipProps)
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useSelectDrill({ selectionMode, selection, onChange, rootRef, drilling, onItemDrill, onGroupDrill, focusedGroupInfo, focusedItemInfo, groups, getDataItem, getDataById }) {
    const idExtracter = (event) => {
        const isItemFocused = focusedItemInfo.isCurrent;
        const info = isItemFocused && event.type === 'keyup'
            ? focusedItemInfo
            : eventsUtils.getInfo(rootRef, event.target);
        return info && info.seriesIndex != null && info.groupIndex != null
            ? getDataItem(info.seriesIndex, info.groupIndex)?.id
            : undefined;
    };
    const { selectionProps, selectionContent } = useSelection.useSelection({
        idExtracter,
        isDrillEnabled: drilling === 'on',
        selection,
        selectionMode,
        onChange,
        getDataById
    });
    const drillProps = useChartDrill.useChartDrill({
        rootRef,
        selectionMode,
        drilling,
        focusedItemInfo,
        focusedGroupInfo,
        groups,
        getDataItem,
        onItemDrill,
        onGroupDrill
    });
    return { selectDrillProps: mergeProps.mergeProps(selectionProps, drillProps), selectionContent };
}

exports.useChartDatatipAndCursor = useChartDatatipAndCursor;
exports.useSelectDrill = useSelectDrill;
//# sourceMappingURL=useSelectDrill-64289234.js.map
