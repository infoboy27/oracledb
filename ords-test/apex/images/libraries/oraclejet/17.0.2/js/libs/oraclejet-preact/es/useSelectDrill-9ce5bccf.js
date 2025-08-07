/* @oracle/oraclejet-preact: undefined */
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useChartDataCursor } from './useChartDataCursor-8e78a79f.js';
import { u as useChartDatatip } from './useChartDatatip-b6b2b00a.js';
import { g as getInfo } from './eventsUtils-d544e874.js';
import './accUtils-dc32d20b.js';
import { u as useChartDrill } from './useChartDrill-e20d7ae5.js';
import { u as useSelection } from './useSelection-c12f7802.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useChartDatatipAndCursor({ series, groups, width, height, findNearest, getMarkerInfo, onDataCursorPositionChange, isDataCursorEnabled, dataCursorPosition, dataCursorStyle, hoveredItemInfo, focusedItemInfo, getDataItem, getDataItemPos, datatip, valueFormats, isHoriz, xScale, yScale, plotAreaSpace, timeAxisType, touchResponse, isDisabled }) {
    const { datatipContent, datatipProps } = useChartDatatip({
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
    const { dataCursorContent, dataCursorProps } = useChartDataCursor({
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
        datatipProps: mergeProps(dataCursorProps, datatipProps)
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
            : getInfo(rootRef, event.target);
        return info && info.seriesIndex != null && info.groupIndex != null
            ? getDataItem(info.seriesIndex, info.groupIndex)?.id
            : undefined;
    };
    const { selectionProps, selectionContent } = useSelection({
        idExtracter,
        isDrillEnabled: drilling === 'on',
        selection,
        selectionMode,
        onChange,
        getDataById
    });
    const drillProps = useChartDrill({
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
    return { selectDrillProps: mergeProps(selectionProps, drillProps), selectionContent };
}

export { useSelectDrill as a, useChartDatatipAndCursor as u };
//# sourceMappingURL=useSelectDrill-9ce5bccf.js.map
