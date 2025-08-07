/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { memo, forwardRef } from 'preact/compat';
import { useRef, useCallback, useState, useEffect, useImperativeHandle, useLayoutEffect } from 'preact/hooks';
import './LayerHost-45f545d7.js';
import './DragAndDropStyles.styles.css';
import { a as useReorderableItem, u as useReorderable, R as ReorderableContext } from './useReorderableItem-25aa1c34.js';
import './ReorderableItemStyles.styles.css';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { b as getKey, I as ITEM_SELECTOR, f as findElementByKey, h as dragToScroll, k as keyExtractor } from './collectionUtils-d72c7c40.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { styles } from './UNSAFE_ListView/themes/ListViewStyles.css.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { s as scrollToVisible, L as List } from './List-9026206d.js';
import { M as Menu } from './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import './logger-c92f309c.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import { f as findItemContext } from './useItemAction-044c6369.js';
import { u as useContextMenuGesture } from './useContextMenuGesture-e8f99ce3.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the key for the row at the given index
 */
const getKeyForIndex = (root, index) => {
    if (root != null) {
        const rowElements = root.querySelectorAll(`[role='row']`);
        if (rowElements.length > index) {
            return getKey(rowElements[index]);
        }
    }
    return null;
};
function getScrollPosition(root, newScrollTop) {
    // ensure scroll position y value is initialized
    const scrollTop = Math.abs(newScrollTop == null ? root.scrollTop : newScrollTop);
    const scrollPosition = {
        y: scrollTop,
        key: undefined,
        offsetY: undefined
    };
    let rowBottom = 0;
    const rowElements = root.querySelectorAll(`[role='row']`);
    if (rowElements.length > 0) {
        if (scrollTop === 0) {
            scrollPosition.key = getKeyForIndex(root, 0);
            scrollPosition.offsetY = 0;
            return scrollPosition;
        }
    }
    for (let i = 0; i < rowElements.length; i++) {
        const rowHeight = rowElements[i].getBoundingClientRect().height;
        rowBottom += rowHeight;
        if (scrollTop < rowBottom) {
            scrollPosition.key = getKeyForIndex(root, i);
            scrollPosition.offsetY = rowHeight + scrollTop - rowBottom;
            break;
        }
    }
    return scrollPosition;
}
/**
 * Helper to set the scroll position on the ListView.
 */
function setScrollPosition(root, scrollPosition) {
    const y = _getScrollTopFromScrollPosition(root, scrollPosition);
    root.scrollTop = y != null ? y : 0;
}
/**
 * Helper to determine the 'y' value of a given scroll position.
 */
function _getScrollTopFromScrollPosition(root, scrollPosition) {
    if (scrollPosition != null) {
        let key;
        let useRow = false;
        if (scrollPosition.key != null) {
            // key takes precedence over everything else
            useRow = true;
            key = scrollPosition.key;
        }
        else if (scrollPosition.offsetY != null && scrollPosition.y == null) {
            // offsetY can be used on its own if it is the only vertical aspect provided
            useRow = true;
            key = getScrollPosition(root).key;
        }
        if (useRow) {
            if (key != null) {
                let y = 0;
                const rowElements = root.querySelectorAll(`[role ='row']`);
                for (let i = 0; i < rowElements.length; i++) {
                    if (key === getKey(rowElements[i])) {
                        return y + (scrollPosition.offsetY != null ? scrollPosition.offsetY : 0);
                    }
                    y += rowElements[i].getBoundingClientRect().height;
                }
            }
        }
        else if (scrollPosition.y != null) {
            return scrollPosition.y;
        }
    }
    // either nothing was provided, or what was provided was invalid
    return undefined;
}

/**
 * A private item that will be used by ReorderableCardFlexView, location TBD (could be moved to PRIVATE_CardFlexView)
 */
function ListViewReorderableItem({ currentKey, children, dragKey, setDragKey, onReorder, rootRef, itemKey }) {
    const itemRef = useRef(null);
    const itemStyles = {
        itemOverlayFront: styles.reorderableItemOverlayFront,
        itemOverlayRear: styles.reorderableItemOverlayRear,
        itemDragger: styles.reorderableItemDragger
    };
    const getItem = () => itemRef?.current?.closest(ITEM_SELECTOR);
    const setTransferData = useCallback((event) => {
        event.dataTransfer?.setData('text/listview-items-key', JSON.stringify(itemKey));
    }, [itemKey]);
    const { rootProps, isDragged, overlayZoneBeforeProps, overlayZoneAfterProps } = useReorderableItem({
        currentKey,
        isDisabled: onReorder ? false : true,
        draggable: onReorder ? true : false,
        dragKey,
        setDragKey,
        onReorder,
        rootRef,
        ref: itemRef,
        getItem,
        setTransferData,
        itemStyles,
        itemSelector: ITEM_SELECTOR,
        isVertical: true
    });
    const classes = classNames([rootProps?.class, styles.reorderableItemDnd]);
    return (jsxs("div", { ...rootProps, draggable: false, class: classes, children: [children, !isDragged && dragKey && (jsxs(Fragment, { children: [jsx("div", { ...overlayZoneBeforeProps }), jsx("div", { ...overlayZoneAfterProps })] }))] }));
}
const MemoizeListViewReorderableItem = memo(ListViewReorderableItem, (prev, next) => {
    if (prev && next) {
        return (prev?.children === next?.children &&
            prev?.currentKey === next?.currentKey &&
            prev?.dragKey === next?.dragKey);
    }
    return false;
});

const useListViewReorder = ({ currentKey, onReorder, rootRef, viewportConfig }) => {
    const isReorderEnabled = onReorder != undefined;
    const [dragKey, setDragKey] = useState(undefined);
    const { reorderProps, reorderContext, reorderInstructionsId, reorderInstructions } = useReorderable({
        onReorder,
        rootRef,
        itemSelector: ITEM_SELECTOR,
        isDisabled: !isReorderEnabled,
        columns: 1
    });
    // ensure the current item is scrolled into view during keyboard reordering,
    // disable that during mouse reordering
    const reorderScrollIntoView = useRef(false);
    useEffect(() => {
        if (isReorderEnabled && reorderScrollIntoView.current) {
            const rootElement = rootRef.current;
            const elem = findElementByKey(rootElement, currentKey, ITEM_SELECTOR);
            if (elem) {
                const scroller = viewportConfig?.scroller() || rootElement;
                // make sure item is visible
                scrollToVisible(elem, scroller, 0);
                reorderScrollIntoView.current = false;
            }
        }
    });
    if (!isReorderEnabled) {
        return {
            reorderProps,
            reorderContext,
            reorderInstructionsId,
            reorderInstructions
        };
    }
    const handleKeyDown = (event) => {
        // listview only do keyboard reordering with arrow up/down keys
        if (isReorderEnabled &&
            (event.key === 'ArrowUp' || event.key === 'ArrowDown') &&
            (event.metaKey || event.ctrlKey) &&
            event.shiftKey) {
            reorderScrollIntoView.current = true;
            reorderProps.onKeyDown?.(event);
        }
    };
    const handleDragOver = (event) => {
        if (dragKey !== undefined) {
            reorderScrollIntoView.current = false;
            dragToScroll(event, dragKey !== undefined, rootRef.current);
        }
    };
    const reorderEventProps = mergeProps({ onKeyDown: handleKeyDown, onDragOver: handleDragOver });
    const reorderItemProps = {
        currentKey: currentKey,
        dragKey,
        setDragKey,
        onReorder,
        rootRef
    };
    return {
        reorderProps: reorderEventProps,
        reorderItemProps,
        reorderContext,
        reorderInstructionsId,
        reorderInstructions
    };
};

/**
 * The internal component used to render a custom context menu
 */
function ListViewContextMenu({ contextMenuConfig, contextMenuContext, ...menuProps }) {
    const accessibleLabel = contextMenuConfig.accessibleLabel;
    return (jsx(Fragment, { children: jsx(Menu, { ...menuProps, ...(accessibleLabel && {
                'aria-label': accessibleLabel
            }), children: menuProps.isOpen && contextMenuConfig.itemsRenderer(contextMenuContext) }) }));
}

const TOUCH_OFFSET_VALUE = 40;
const menuPropGestureStates = {
    mouse: {
        initialFocus: 'menu',
        placement: 'bottom-start',
        offsetValue: 0
    },
    keyboard: {
        initialFocus: 'firstItem',
        placement: 'bottom-start',
        offsetValue: 0
    },
    touch: {
        initialFocus: 'menu',
        placement: 'end',
        offsetValue: TOUCH_OFFSET_VALUE
    }
};
const initialMenuProps = {
    isOpen: false,
    initialFocus: 'menu',
    placement: 'bottom-start',
    offsetValue: 0,
    anchorRef: { current: null }
};
const useListViewContextMenu = (dataState, contextMenuConfig, currentKey, onCurrentKeyChange, scrollListRef) => {
    /*Context Menu section
     TODO: A version of context Menu listview will be merged using useContextMenuGesture instead. Once it's merged we
     can go back to this to create a hook or utility that could be share among all collection comps. JET-60320
    */
    /*
    Steps to open a menu:
      1.- useContextMenu handler is called when menu is supposed to be opened.
      2.- We set contextMenuContext when contextMenuRenderer is called.
      3.- We dispatch opening the menu with the correct anchor.
      5.- Menu receives updated props and updated contextMenuContext.
      6.- Menu is opened.
  
      */
    //Supposed to be updated when menu is about to be opened
    //We set an initial key value for the context menu context, to allow user use object destructuring inside the
    //contextMenuRenderer. It doesn't matter if the key is not correct at the initial rendering since menu starts
    //being closed always
    const [contextMenuContext, setContextMenuContext] = useState();
    const [menuProps, setMenuProps] = useState(initialMenuProps);
    const { triggerProps } = useContextMenuGesture(({ gesture, anchor, target }) => {
        let anchorBasedOnGesture = anchor;
        if (gesture === 'keyboard') {
            //We find the element where the position of the menu is going to be based of
            const elem = findElementByKey(scrollListRef.current, currentKey, ITEM_SELECTOR);
            //We set the correct anchor
            anchorBasedOnGesture = elem ? elem : anchor;
            const context = findItemContext(currentKey, dataState);
            setContextMenuContext(context);
        }
        else {
            //We search for the key using the target of the event
            const key = keyExtractor(target, ITEM_SELECTOR);
            const context = findItemContext(key, dataState);
            setContextMenuContext(context);
            //We update the key so when we close logical focus is on the correct item
            //TODO: Do this directly in useCurrentKey.JET-62373
            onCurrentKeyChange?.({ value: key });
        }
        setMenuProps({
            ...menuPropGestureStates[gesture],
            anchorRef: { current: anchorBasedOnGesture },
            isOpen: true
        });
    }, {
        isDisabled: !contextMenuConfig //If there is no a context menu renderer we disable the hook
    });
    const handleCloseContextMenu = useCallback((detail) => {
        /*
        TODO: Focus ring should be visible when context menu was closed because of selecting an item using keyboard,
        but should not be visible when the selection was done using mouse or touch. This would probably means menu
        onClose API is going to be changed a little bit so we can satisfy this requirement. JET-62372
        */
        //Focus has to be set on the current target that was obtained
        //during context menu gesture when menu is dismissed or item is "selected"
        if (detail.reason === 'dismissed' || detail.reason === 'itemAction') {
            scrollListRef.current?.focus({ preventScroll: true });
        }
        // We close the menu.The only prop that matters here is isOpen
        setMenuProps({ ...initialMenuProps });
    }, [scrollListRef]);
    return {
        menuProps: { ...menuProps, onClose: handleCloseContextMenu },
        onClose: handleCloseContextMenu,
        contextMenuContext: contextMenuContext,
        triggerProps
    };
};

/**
 * A list view displays data items as a list or a grid with highly interactive features.
 */
const ListView = forwardRef((props, ref) => {
    const { currentKey, contextMenuConfig, onCurrentKeyChange } = props;
    const scrollPositionRef = useRef();
    const scrollListRef = useRef(null);
    const dataMetadata = props.data
        ? props.data.map((aData) => {
            const key = props.getRowKey(aData);
            return { data: aData, metadata: { key } };
        })
        : null;
    const loadRange = props.onLoadMore ? props.onLoadMore : () => { };
    const dataState = dataMetadata
        ? {
            offset: 0,
            data: dataMetadata,
            sizePrecision: props.hasMore ? 'atLeast' : 'exact',
            totalSize: dataMetadata.length
        }
        : null;
    useImperativeHandle(ref, () => ({
        getScrollPosition: () => {
            if (scrollListRef.current) {
                return getScrollPosition(scrollListRef.current);
            }
            return { y: 0 };
        }
    }));
    // update scroll position if a new value is provided
    useLayoutEffect(() => {
        if (scrollListRef.current && scrollPositionRef.current !== props.scrollPositionOverride) {
            setScrollPosition(scrollListRef.current, props.scrollPositionOverride);
            scrollPositionRef.current = props.scrollPositionOverride;
        }
    }, [props.scrollPositionOverride]);
    /**
     * Reorder Section
     */
    const isReorderEnabled = props.onReorder != undefined;
    const { reorderProps, reorderItemProps, reorderContext, reorderInstructionsId, reorderInstructions } = useListViewReorder({
        currentKey: props.currentKey,
        onReorder: props.onReorder,
        rootRef: scrollListRef,
        viewportConfig: props.viewportConfig
    });
    const { triggerProps, menuProps, contextMenuContext } = useListViewContextMenu(dataState, contextMenuConfig, currentKey, onCurrentKeyChange, scrollListRef);
    if (isReorderEnabled && reorderItemProps) {
        return (jsxs(Fragment, { children: [jsxs(ReorderableContext.Provider, { value: reorderContext, children: [jsx(List, { ...props, contextMenuTriggerProps: triggerProps, reorderProps: reorderProps, onLoadRange: loadRange, scrollerRef: scrollListRef, data: dataState, children: (context) => (jsx(MemoizeListViewReorderableItem, { ...reorderItemProps, itemKey: context.metadata.key, children: props.children(context) })) }), jsx("span", { id: reorderInstructionsId, children: jsx(HiddenAccessible, { children: reorderInstructions }) })] }), contextMenuConfig && (jsx(ListViewContextMenu, { ...menuProps, contextMenuConfig: contextMenuConfig, contextMenuContext: contextMenuContext }))] }));
    }
    return (jsxs(Fragment, { children: [jsx(List, { ...props, onLoadRange: loadRange, scrollerRef: scrollListRef, data: dataState, contextMenuTriggerProps: triggerProps, children: props.children }), contextMenuConfig && (jsx(ListViewContextMenu, { ...menuProps, contextMenuConfig: contextMenuConfig, contextMenuContext: contextMenuContext }))] }));
});

export { ListView as L };
//# sourceMappingURL=ListView-c508c3a4.js.map
