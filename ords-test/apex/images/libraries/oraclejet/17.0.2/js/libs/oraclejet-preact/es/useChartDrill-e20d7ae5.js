/* @oracle/oraclejet-preact: undefined */
import { useCallback } from 'preact/hooks';
import { g as getInfo } from './eventsUtils-d544e874.js';
import './accUtils-dc32d20b.js';
import { u as useVisDrill } from './useVisDrill-4a6dcb23.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const isDrillable = (info, drilling, groups, getDataItem) => {
    const { seriesIndex, groupIndex } = info;
    if (groupIndex === undefined) {
        return false;
    }
    if (seriesIndex != null) {
        const itemDrilling = getDataItem(seriesIndex, groupIndex)?.drilling != 'off';
        return drilling === 'on' && itemDrilling;
    }
    else {
        return groups[groupIndex].drilling != 'off';
    }
};
/**
 * Returns the event handlers for drill support.
 */
function useChartDrill({ rootRef, focusedItemInfo, focusedGroupInfo, groups, selectionMode, drilling, getDataItem, onItemDrill, onGroupDrill }) {
    const processDrill = useCallback((info) => {
        if (!info ||
            info.groupIndex == undefined ||
            !isDrillable(info, drilling, groups, getDataItem)) {
            return;
        }
        const { seriesIndex, groupIndex } = info;
        if (seriesIndex != null) {
            const data = getDataItem(seriesIndex, groupIndex);
            if (data) {
                onItemDrill?.({
                    groupIndex,
                    seriesIndex,
                    data,
                    id: data?.id
                });
            }
        }
        else {
            onGroupDrill?.({
                groupIndex,
                group: groups[groupIndex],
                id: groups[groupIndex].id
            });
        }
    }, [drilling, getDataItem, groups, onGroupDrill, onItemDrill]);
    const onDrill = useCallback((event) => {
        if (event.type === 'keydown') {
            const focusedInfo = focusedItemInfo.isCurrent ? focusedItemInfo : focusedGroupInfo;
            processDrill(focusedInfo);
        }
        else {
            processDrill(getInfo(rootRef, event.target));
        }
    }, [rootRef, focusedItemInfo, focusedGroupInfo, processDrill]);
    return useVisDrill(selectionMode, onDrill);
}

export { useChartDrill as u };
//# sourceMappingURL=useChartDrill-e20d7ae5.js.map
