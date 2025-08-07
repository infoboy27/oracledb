/* @oracle/oraclejet-preact: undefined */
import { useState, useRef } from 'preact/hooks';
import { g as getRandomId } from './layoutUtils-2374ab3e.js';
import { c as cancelEvent, g as getInfo } from './eventsUtils-d544e874.js';
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
/**
 * Returns whether the two groups are same.
 * @param g1 GroupInfo
 * @param g2 GroupInfo
 * @returns
 */
function isGroupEqual(g1, g2) {
    return (g1?.groupIndex === g2?.groupIndex &&
        g1?.isCurrent === g2?.isCurrent &&
        g1?.isFocusVisible === g2?.isFocusVisible);
}
/**
 * Returns whether the two item info are same.
 * @param i1 ItemInfo
 * @param i2 ItemInfo
 * @returns
 */
function isItemEqual(i1, i2) {
    return i1?.seriesIndex === i2?.seriesIndex && isGroupEqual(i1, i2);
}
/**
 * Returns whether the two item info are same.
 * @param i1 ItemInfo
 * @param i2 ItemInfo
 * @returns
 */
function isItemInfoEqual(i1, i2) {
    return i1?.seriesIndex === i2?.seriesIndex && i2?.groupIndex === i1?.groupIndex;
}
/**
 * Hook to handle chart navigation.
 */
function useChartNav({ rootRef, getNextChartItem, getDefaultNavGroup, getNextNavGroup, xIndexExtent, touchResponse, onItemHover, onItemFocus, drilling }) {
    const [focusedItemInfo, setfocusedItemInfo] = useState({
        groupIndex: xIndexExtent.startIndex,
        seriesIndex: 0
    });
    const isGroupDrillEnabled = drilling === 'on' || drilling === 'groupsOnly';
    const [hoveredItemInfo, setHoveredItemInfo] = useState();
    const [focusedGroupInfo, setFocusedGroupInfo] = useState({ groupIndex: 0 });
    const activeId = useRef();
    const previousHoveredItemRef = useRef();
    const previousFocusedItemRef = useRef();
    const isItemFocused = focusedItemInfo.isCurrent;
    const isGroupFocused = focusedGroupInfo.isCurrent;
    const updateGroupInfo = (groupInfo) => {
        if (!isGroupEqual(groupInfo, focusedGroupInfo)) {
            setFocusedGroupInfo(groupInfo);
        }
    };
    const update = (type, info) => {
        const prevInfoRef = type === 'hover' ? previousHoveredItemRef : previousFocusedItemRef;
        const callback = type === 'hover' ? onItemHover : onItemFocus;
        if (!isItemEqual(info, prevInfoRef.current)) {
            const input = { groupIndex: info?.groupIndex, seriesIndex: info?.seriesIndex };
            callback?.(input);
            prevInfoRef.current = info;
            activeId.current = getRandomId();
        }
    };
    const updateFocusedItemInfo = (itemInfo) => {
        if (!isItemEqual(itemInfo, focusedItemInfo)) {
            setfocusedItemInfo(itemInfo);
            // preserve hovered effect if same item is focused
            if (hoveredItemInfo && !isItemInfoEqual(hoveredItemInfo, itemInfo)) {
                setHoveredItemInfo({ ...hoveredItemInfo, isCurrent: false });
            }
            if (itemInfo.isCurrent) {
                update('focus', itemInfo);
            }
        }
    };
    const updateHoveredItemInfo = (itemInfo) => {
        if (!hoveredItemInfo || !isItemEqual(itemInfo, hoveredItemInfo)) {
            setHoveredItemInfo(itemInfo);
            setfocusedItemInfo({ ...focusedItemInfo, isCurrent: false });
            update('hover', itemInfo);
        }
    };
    const handleTab = (event) => {
        const defaultGroup = getDefaultNavGroup(focusedGroupInfo);
        const validItemInfoIndex = Math.max(xIndexExtent.startIndex, Math.min(xIndexExtent.endIndex, focusedItemInfo.groupIndex));
        if (event.shiftKey) {
            if (isItemFocused) {
                updateFocusedItemInfo({
                    ...focusedItemInfo,
                    groupIndex: validItemInfoIndex,
                    isCurrent: false,
                    isFocusVisible: false
                });
                update('focus', undefined);
            }
            else if (isGroupFocused) {
                updateFocusedItemInfo({
                    ...focusedItemInfo,
                    groupIndex: validItemInfoIndex,
                    isCurrent: true,
                    isFocusVisible: true
                });
                if (isGroupDrillEnabled) {
                    updateGroupInfo({
                        ...focusedGroupInfo,
                        ...defaultGroup,
                        isCurrent: false,
                        isFocusVisible: false
                    });
                    cancelEvent(event);
                }
            }
            else if (isGroupDrillEnabled) {
                updateGroupInfo({
                    ...focusedGroupInfo,
                    ...defaultGroup,
                    isCurrent: true,
                    isFocusVisible: true
                });
            }
        }
        else {
            if (isItemFocused) {
                updateFocusedItemInfo({
                    ...focusedItemInfo,
                    groupIndex: validItemInfoIndex,
                    isCurrent: false,
                    isFocusVisible: false
                });
                if (isGroupDrillEnabled) {
                    updateGroupInfo({
                        ...focusedGroupInfo,
                        ...defaultGroup,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                    cancelEvent(event);
                }
                update('focus', undefined);
            }
            else if (isGroupFocused && isGroupDrillEnabled) {
                updateGroupInfo({
                    ...focusedGroupInfo,
                    ...defaultGroup,
                    isCurrent: false,
                    isFocusVisible: false
                });
            }
            else {
                updateFocusedItemInfo({
                    ...focusedItemInfo,
                    groupIndex: validItemInfoIndex,
                    isCurrent: true,
                    isFocusVisible: true
                });
            }
        }
        activeId.current = getRandomId();
    };
    const onKeyUp = (event) => {
        const key = event.key;
        switch (key) {
            case 'Tab': {
                if (!isItemFocused && !isGroupFocused) {
                    handleTab(event);
                }
                break;
            }
        }
    };
    const onKeyDown = (event) => {
        const key = event.key;
        switch (key) {
            case 'Tab': {
                handleTab(event);
                break;
            }
            case 'ArrowRight': {
                if (isGroupFocused) {
                    const info = getNextNavGroup(focusedGroupInfo, key);
                    updateGroupInfo({
                        ...info,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                }
                else {
                    const info = getNextChartItem(focusedItemInfo, key);
                    updateFocusedItemInfo({
                        ...info,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                }
                setHoveredItemInfo(undefined);
                cancelEvent(event);
                break;
            }
            case 'ArrowLeft': {
                if (isGroupFocused) {
                    const info = getNextNavGroup(focusedGroupInfo, key);
                    updateGroupInfo({
                        ...info,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                }
                else {
                    const info = getNextChartItem(focusedItemInfo, key);
                    updateFocusedItemInfo({
                        ...info,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                }
                setHoveredItemInfo(undefined);
                cancelEvent(event);
                break;
            }
            case 'ArrowUp': {
                if (isItemFocused) {
                    const info = getNextChartItem(focusedItemInfo, key);
                    updateFocusedItemInfo({
                        ...info,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                }
                setHoveredItemInfo(undefined);
                cancelEvent(event);
                break;
            }
            case 'ArrowDown': {
                if (isItemFocused) {
                    const info = getNextChartItem(focusedItemInfo, key);
                    updateFocusedItemInfo({
                        ...info,
                        isCurrent: true,
                        isFocusVisible: true
                    });
                }
                setHoveredItemInfo(undefined);
                cancelEvent(event);
                break;
            }
        }
    };
    const onPointerUp = (event) => {
        const info = getInfo(rootRef, event.target);
        if (!info) {
            return;
        }
        const { seriesIndex, groupIndex } = info;
        if (seriesIndex != undefined && groupIndex != undefined) {
            updateFocusedItemInfo({
                seriesIndex,
                groupIndex,
                isCurrent: false,
                isFocusVisible: false
            });
            updateGroupInfo({
                ...focusedGroupInfo,
                isCurrent: false,
                isFocusVisible: false
            });
        }
        else if (groupIndex !== undefined && seriesIndex === undefined) {
            updateGroupInfo({
                groupIndex,
                isCurrent: true,
                isFocusVisible: false
            });
            updateFocusedItemInfo({
                ...focusedItemInfo,
                isCurrent: false,
                isFocusVisible: false
            });
        }
    };
    const onHover = (event) => {
        const info = getInfo(rootRef, event.target);
        if (!info) {
            updateHoveredItemInfo(undefined);
            return;
        }
        const { seriesIndex, groupIndex } = info;
        if (seriesIndex != undefined) {
            updateHoveredItemInfo({
                seriesIndex,
                groupIndex,
                isCurrent: true
            });
            updateFocusedItemInfo({
                ...focusedItemInfo,
                isCurrent: false
            });
        }
    };
    const onHoverLeave = () => {
        updateHoveredItemInfo(undefined);
    };
    const hoverHandlers = useVisHover(onHover, undefined, onHoverLeave, touchResponse);
    const onFocusUpdate = () => {
        const validItemInfoIndex = Math.max(xIndexExtent.startIndex, Math.min(xIndexExtent.endIndex, focusedItemInfo.groupIndex));
        updateFocusedItemInfo({
            ...focusedItemInfo,
            groupIndex: validItemInfoIndex,
            isCurrent: true,
            isFocusVisible: true
        });
    };
    const onBlur = () => {
        updateFocusedItemInfo({
            ...focusedItemInfo,
            isCurrent: false,
            isFocusVisible: false
        });
    };
    return {
        focusedItemInfo,
        focusedGroupInfo,
        hoveredItemInfo,
        activeId: activeId.current,
        navProps: mergeProps(hoverHandlers, {
            onKeyDown,
            onKeyUp,
            onPointerUp,
            onBlur
        }),
        onFocusUpdate
    };
}

export { useChartNav as u };
//# sourceMappingURL=useChartNav-be57fa70.js.map
