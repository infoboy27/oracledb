/* @oracle/oraclejet-preact: undefined */
'use strict';

var useContextMenu = require('./useContextMenu-f3cf0db8.js');
require('preact/jsx-runtime');
require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
require('preact/hooks');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
require('./logger-2b636482.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var eventsUtils = require('./eventsUtils-8680c9d7.js');
require('./accUtils-50f26093.js');

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
        const info = eventsUtils.getInfo(rootRef, target);
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
    const { contextMenuProps, contextMenuContent } = useContextMenu.useContextMenu({
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

exports.useChartContextMenu = useChartContextMenu;
//# sourceMappingURL=useChartContextMenu-d7ed939f.js.map
