/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var layoutUtils = require('./layoutUtils-56b6111c.js');
var eventsUtils = require('./eventsUtils-8680c9d7.js');
require('./accUtils-50f26093.js');
var useVisHover = require('./useVisHover-ad36112d.js');
var mergeProps = require('./mergeProps-e3da7237.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const getItemInfo = (event) => {
    const itemIndex = event.target.dataset['ojItemIndex'];
    if (itemIndex) {
        return {
            itemIndex: parseInt(itemIndex, 10)
        };
    }
    return;
};
/**
 * Hook to handle chart navigation. This can be shared between the pie, funnel and pyramid chart
 * as they follow similar navigation pattern.
 * TODO: rename
 */
function usePieChartNav({ touchResponse, getNextChartItem }) {
    const [focusedItemInfo, setfocusedItemInfo] = hooks.useState({
        itemIndex: 0
    });
    const [hoveredItemInfo, setHoveredItemInfo] = hooks.useState();
    const activeId = hooks.useRef();
    const updateFocusedItemInfo = (itemInfo) => {
        if (itemInfo.itemIndex !== focusedItemInfo.itemIndex ||
            itemInfo.isFocusVisible !== focusedItemInfo.isFocusVisible) {
            setfocusedItemInfo(itemInfo);
            setHoveredItemInfo(undefined);
        }
    };
    const onPointerUp = (event) => {
        const info = getItemInfo(event);
        if (info) {
            updateFocusedItemInfo({ ...info, isFocusVisible: false });
        }
    };
    const onHover = (event) => {
        const info = getItemInfo(event);
        if (info?.itemIndex != hoveredItemInfo?.itemIndex) {
            setHoveredItemInfo(info);
            activeId.current = layoutUtils.getRandomId();
        }
    };
    const hoverHandlers = useVisHover.useVisHover(onHover, undefined, undefined, touchResponse);
    const onKeyDown = (event) => {
        const key = event.key;
        switch (key) {
            case 'Tab':
                return;
            case 'ArrowDown': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowDown');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                eventsUtils.cancelEvent(event);
                break;
            }
            case 'ArrowUp': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowUp');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                eventsUtils.cancelEvent(event);
                break;
            }
            case 'ArrowLeft': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowLeft');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                eventsUtils.cancelEvent(event);
                break;
            }
            case 'ArrowRight': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowRight');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                eventsUtils.cancelEvent(event);
                break;
            }
        }
        activeId.current = layoutUtils.getRandomId();
    };
    const onKeyUp = (event) => {
        const key = event.key;
        if (key === 'Tab') {
            updateFocusedItemInfo({ ...focusedItemInfo, isFocusVisible: true });
        }
    };
    const onBlur = () => {
        updateFocusedItemInfo({
            ...focusedItemInfo,
            isFocusVisible: false
        });
    };
    return {
        focusedItemInfo,
        hoveredItemInfo,
        activeId: activeId.current,
        navProps: mergeProps.mergeProps(hoverHandlers, {
            onKeyDown,
            onKeyUp,
            onPointerUp,
            onBlur
        })
    };
}

exports.usePieChartNav = usePieChartNav;
//# sourceMappingURL=usePieChartNav-1acb3f07.js.map
