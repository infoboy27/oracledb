/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { toChildArray } from 'preact';
import { useRef, useCallback, useState } from 'preact/hooks';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { L as LiveRegion } from './LiveRegion-81216fe6.js';
import { T as TabBar } from './TabBar-e39e8dbd.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';
import { b as getKey } from './collectionUtils-d72c7c40.js';
import './LayerHost-45f545d7.js';
import 'preact/compat';
import { a as useReorderableItem, u as useReorderable, R as ReorderableContext } from './useReorderableItem-25aa1c34.js';
import { styles } from './UNSAFE_ReorderableTabBar/themes/ReorderableTabBarItemStyles.css.js';
import { u as useTabBarContext } from './useTabBarContext-0071d2a7.js';
import './DragAndDropStyles.styles.css';
import './ReorderableItemStyles.styles.css';

const ITEM_SELECTOR = '[role="tab"]';
/**
 * A private item that will be used by ReorderableTabBar, location TBD (could be moved to PRIVATE_TabBar)
 */
function ReorderableTabBarItem({ children, dragKey, setDragKey, onReorder, layout, rootRef }) {
    const tabBarItemRef = useRef(null);
    const getItem = useCallback(() => tabBarItemRef?.current?.querySelector(ITEM_SELECTOR), []);
    const setTransferData = useCallback((event) => {
        event.dataTransfer?.setData('text/tabbar-item-key', getKey(getItem()) + '');
    }, [getItem]);
    const { currentKey } = useTabBarContext();
    const { rootProps, isDragged, overlayZoneBeforeProps, overlayZoneAfterProps } = useReorderableItem({
        currentKey: currentKey,
        isDisabled: onReorder ? false : true,
        draggable: onReorder ? true : false,
        dragKey,
        setDragKey,
        onReorder,
        rootRef,
        ref: tabBarItemRef,
        getItem,
        setTransferData,
        itemStyles: styles,
        itemSelector: ITEM_SELECTOR
    });
    //instead of specifying flex: '1 0 auto' in style
    const styleInterpolations = mergeInterpolations([
        ...Object.values(flexitemInterpolations)
    ]);
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    return (jsxs("div", { ...rootProps, style: flexDimensions, children: [children, !isDragged && dragKey && (jsxs(Fragment, { children: [jsx("div", { ...overlayZoneBeforeProps }), jsx("div", { ...overlayZoneAfterProps })] }))] }));
}

/**
 * A component that allows reordering of tabs within a TabBar.
 */
function ReorderableTabBar({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby, children, layout = 'stretch', display = 'standard', size = 'md', edge = 'top', selection, onSelect, onRemove, onReorder, testId }) {
    const rootRef = useRef(null);
    const [dragKey, setDragKey] = useState(undefined);
    const displayStackProps = {
        display: display
    };
    const displayNonStackProps = {
        display: display,
        size: size
    };
    const displayProps = display === 'stacked' ? displayStackProps : displayNonStackProps;
    const { reorderProps, reorderContext, reorderInstructionsId, reorderStatus, reorderInstructions } = useReorderable({
        onReorder,
        rootRef,
        itemSelector: ITEM_SELECTOR
    });
    return (jsxs("div", { ref: rootRef, ...reorderProps, children: [jsx(ReorderableContext.Provider, { value: reorderContext, children: jsx(TabBar, { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, layout: layout, edge: edge, selection: selection, onSelect: onSelect, onRemove: onRemove, testId: testId, ...displayProps, "aria-describedby": reorderInstructionsId, children: toChildArray(children).map((child) => {
                        return (jsx(ReorderableTabBarItem, { dragKey: dragKey, setDragKey: setDragKey, onReorder: onReorder, layout: layout, rootRef: rootRef, children: child }));
                    }) }) }), jsx("span", { id: reorderInstructionsId, children: jsx(HiddenAccessible, { children: reorderInstructions }) }), jsx(LiveRegion, { children: reorderStatus })] }));
}

export { ReorderableTabBar as R };
//# sourceMappingURL=ReorderableTabBar-84640a66.js.map
