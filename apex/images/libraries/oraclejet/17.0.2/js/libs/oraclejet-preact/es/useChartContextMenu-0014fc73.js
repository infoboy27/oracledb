/* @oracle/oraclejet-preact: undefined */
import { u as useContextMenu } from './useContextMenu-81db2534.js';
import 'preact/jsx-runtime';
import './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import 'preact/hooks';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import './logger-c92f309c.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { g as getInfo } from './eventsUtils-d544e874.js';
import './accUtils-dc32d20b.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getChartContextMenuContext(focusedItemInfo, gesture, target, series, groups, rootRef, xAxisTitle, yAxisTitle, getDataItem) {
    let seriesIndex;
    let groupIndex;
    if (gesture === 'keyboard') {
        //We find the element where the position of the menu is going to be based of
        groupIndex = focusedItemInfo.groupIndex;
        seriesIndex = focusedItemInfo.seriesIndex;
    }
    else {
        //We search for the key using the target of the event
        const info = getInfo(rootRef, target);
        seriesIndex = info ? info.seriesIndex : undefined;
        groupIndex = info ? info.groupIndex : undefined;
    }
    let context;
    if (seriesIndex !== undefined &&
        groupIndex !== undefined &&
        getDataItem?.(seriesIndex, groupIndex)) {
        context = {
            data: getDataItem(seriesIndex, groupIndex),
            groupIndex,
            seriesIndex,
            type: 'item'
        };
    }
    else if (seriesIndex !== undefined) {
        context = {
            data: series[seriesIndex],
            type: 'series'
        };
    }
    else if (groupIndex !== undefined) {
        context = {
            data: groups[groupIndex],
            type: 'xAxisTickLabel'
        };
    }
    else {
        const target = event?.target;
        const text = target?.textContent;
        if ((text && gesture !== 'keyboard' && text === xAxisTitle) || text === yAxisTitle) {
            context = {
                type: 'axisTitle',
                axis: text === xAxisTitle ? 'x' : 'y'
            };
        }
        else {
            context = {
                type: 'background'
            };
        }
    }
    return {
        context: context
    };
}

const useChartContextMenu = ({ getDataItem, focusedItemInfo, series, groups, rootRef, xAxisTitle, yAxisTitle, contextMenuConfig, onContextMenuDismissed }) => {
    const { contextMenuProps, contextMenuContent } = useContextMenu({
        onContextMenuHandler: ({ gesture, target }) => {
            let elem;
            const { context } = getChartContextMenuContext(focusedItemInfo, gesture, target, series, groups, rootRef, xAxisTitle, yAxisTitle, getDataItem);
            if (gesture === 'keyboard' && context.type === 'item') {
                elem = rootRef.current?.querySelector(`[data-oj-series-index="${context?.seriesIndex}"][data-oj-group-index="${context?.groupIndex}"]`);
            }
            return {
                context,
                elem
            };
        },
        contextMenuOptions: {
            isDisabled: !contextMenuConfig //If there is not a context menu renderer we disable the hook
        },
        rootRef,
        contextMenuConfig,
        onContextMenuDismissed
    });
    return { contextMenuContent, contextMenuProps };
};

export { useChartContextMenu as u };
//# sourceMappingURL=useChartContextMenu-0014fc73.js.map
