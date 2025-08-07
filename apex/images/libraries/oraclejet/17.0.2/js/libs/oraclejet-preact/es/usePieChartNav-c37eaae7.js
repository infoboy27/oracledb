/* @oracle/oraclejet-preact: undefined */
import { useState, useRef } from 'preact/hooks';
import { g as getRandomId } from './layoutUtils-2374ab3e.js';
import { c as cancelEvent } from './eventsUtils-d544e874.js';
import './accUtils-dc32d20b.js';
import { u as useVisHover } from './useVisHover-d7a0b2f3.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

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
    const [focusedItemInfo, setfocusedItemInfo] = useState({
        itemIndex: 0
    });
    const [hoveredItemInfo, setHoveredItemInfo] = useState();
    const activeId = useRef();
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
            activeId.current = getRandomId();
        }
    };
    const hoverHandlers = useVisHover(onHover, undefined, undefined, touchResponse);
    const onKeyDown = (event) => {
        const key = event.key;
        switch (key) {
            case 'Tab':
                return;
            case 'ArrowDown': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowDown');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                cancelEvent(event);
                break;
            }
            case 'ArrowUp': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowUp');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                cancelEvent(event);
                break;
            }
            case 'ArrowLeft': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowLeft');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                cancelEvent(event);
                break;
            }
            case 'ArrowRight': {
                const info = getNextChartItem(focusedItemInfo, 'ArrowRight');
                updateFocusedItemInfo({ ...info, isFocusVisible: true });
                cancelEvent(event);
                break;
            }
        }
        activeId.current = getRandomId();
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
        navProps: mergeProps(hoverHandlers, {
            onKeyDown,
            onKeyUp,
            onPointerUp,
            onBlur
        })
    };
}

export { usePieChartNav as u };
//# sourceMappingURL=usePieChartNav-c37eaae7.js.map
