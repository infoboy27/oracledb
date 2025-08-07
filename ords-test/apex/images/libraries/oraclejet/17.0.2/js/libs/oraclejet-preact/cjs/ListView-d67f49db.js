/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
require('./LayerHost-46e4d858.js');

var useReorderableItem = require('./useReorderableItem-02ed8243.js');

var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_ListView_themes_ListViewStyles_css = require('./UNSAFE_ListView/themes/ListViewStyles.css.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var List = require('./List-bd9ecebb.js');
var Menu = require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
require('./logger-2b636482.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
var useItemAction = require('./useItemAction-dad80c7d.js');
var useContextMenuGesture = require('./useContextMenuGesture-67bf952e.js');

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
            return collectionUtils.getKey(rowElements[index]);
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
                    if (key === collectionUtils.getKey(rowElements[i])) {
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
    const itemRef = hooks.useRef(null);
    const itemStyles = {
        itemOverlayFront: UNSAFE_ListView_themes_ListViewStyles_css.styles.reorderableItemOverlayFront,
        itemOverlayRear: UNSAFE_ListView_themes_ListViewStyles_css.styles.reorderableItemOverlayRear,
        itemDragger: UNSAFE_ListView_themes_ListViewStyles_css.styles.reorderableItemDragger
    };
    const getItem = () => itemRef?.current?.closest(collectionUtils.ITEM_SELECTOR);
    const setTransferData = hooks.useCallback((event) => {
        event.dataTransfer?.setData('text/listview-items-key', JSON.stringify(itemKey));
    }, [itemKey]);
    const { rootProps, isDragged, overlayZoneBeforeProps, overlayZoneAfterProps } = useReorderableItem.useReorderableItem({
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
        itemSelector: collectionUtils.ITEM_SELECTOR,
        isVertical: true
    });
    const classes = classNames.classNames([rootProps?.class, UNSAFE_ListView_themes_ListViewStyles_css.styles.reorderableItemDnd]);
    return (jsxRuntime.jsxs("div", { ...rootProps, draggable: false, class: classes, children: [children, !isDragged && dragKey && (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { ...overlayZoneBeforeProps }), jsxRuntime.jsx("div", { ...overlayZoneAfterProps })] }))] }));
}
const MemoizeListViewReorderableItem = compat.memo(ListViewReorderableItem, (prev, next) => {
    if (prev && next) {
        return (prev?.children === next?.children &&
            prev?.currentKey === next?.currentKey &&
            prev?.dragKey === next?.dragKey);
    }
    return false;
});

const useListViewReorder = ({ currentKey, onReorder, rootRef, viewportConfig }) => {
    const isReorderEnabled = onReorder != undefined;
    const [dragKey, setDragKey] = hooks.useState(undefined);
    const { reorderProps, reorderContext, reorderInstructionsId, reorderInstructions } = useReorderableItem.useReorderable({
        onReorder,
        rootRef,
        itemSelector: collectionUtils.ITEM_SELECTOR,
        isDisabled: !isReorderEnabled,
        columns: 1
    });
    // ensure the current item is scrolled into view during keyboard reordering,
    // disable that during mouse reordering
    const reorderScrollIntoView = hooks.useRef(false);
    hooks.useEffect(() => {
        if (isReorderEnabled && reorderScrollIntoView.current) {
            const rootElement = rootRef.current;
            const elem = collectionUtils.findElementByKey(rootElement, currentKey, collectionUtils.ITEM_SELECTOR);
            if (elem) {
                const scroller = viewportConfig?.scroller() || rootElement;
                // make sure item is visible
                List.scrollToVisible(elem, scroller, 0);
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
            collectionUtils.dragToScroll(event, dragKey !== undefined, rootRef.current);
        }
    };
    const reorderEventProps = mergeProps.mergeProps({ onKeyDown: handleKeyDown, onDragOver: handleDragOver });
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
    return (jsxRuntime.jsx(jsxRuntime.Fragment, { children: jsxRuntime.jsx(Menu.Menu, { ...menuProps, ...(accessibleLabel && {
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
    const [contextMenuContext, setContextMenuContext] = hooks.useState();
    const [menuProps, setMenuProps] = hooks.useState(initialMenuProps);
    const { triggerProps } = useContextMenuGesture.useContextMenuGesture(({ gesture, anchor, target }) => {
        let anchorBasedOnGesture = anchor;
        if (gesture === 'keyboard') {
            //We find the element where the position of the menu is going to be based of
            const elem = collectionUtils.findElementByKey(scrollListRef.current, currentKey, collectionUtils.ITEM_SELECTOR);
            //We set the correct anchor
            anchorBasedOnGesture = elem ? elem : anchor;
            const context = useItemAction.findItemContext(currentKey, dataState);
            setContextMenuContext(context);
        }
        else {
            //We search for the key using the target of the event
            const key = collectionUtils.keyExtractor(target, collectionUtils.ITEM_SELECTOR);
            const context = useItemAction.findItemContext(key, dataState);
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
    const handleCloseContextMenu = hooks.useCallback((detail) => {
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
const ListView = compat.forwardRef((props, ref) => {
    const { currentKey, contextMenuConfig, onCurrentKeyChange } = props;
    const scrollPositionRef = hooks.useRef();
    const scrollListRef = hooks.useRef(null);
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
    hooks.useImperativeHandle(ref, () => ({
        getScrollPosition: () => {
            if (scrollListRef.current) {
                return getScrollPosition(scrollListRef.current);
            }
            return { y: 0 };
        }
    }));
    // update scroll position if a new value is provided
    hooks.useLayoutEffect(() => {
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
        return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsxs(useReorderableItem.ReorderableContext.Provider, { value: reorderContext, children: [jsxRuntime.jsx(List.List, { ...props, contextMenuTriggerProps: triggerProps, reorderProps: reorderProps, onLoadRange: loadRange, scrollerRef: scrollListRef, data: dataState, children: (context) => (jsxRuntime.jsx(MemoizeListViewReorderableItem, { ...reorderItemProps, itemKey: context.metadata.key, children: props.children(context) })) }), jsxRuntime.jsx("span", { id: reorderInstructionsId, children: jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { children: reorderInstructions }) })] }), contextMenuConfig && (jsxRuntime.jsx(ListViewContextMenu, { ...menuProps, contextMenuConfig: contextMenuConfig, contextMenuContext: contextMenuContext }))] }));
    }
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(List.List, { ...props, onLoadRange: loadRange, scrollerRef: scrollListRef, data: dataState, contextMenuTriggerProps: triggerProps, children: props.children }), contextMenuConfig && (jsxRuntime.jsx(ListViewContextMenu, { ...menuProps, contextMenuConfig: contextMenuConfig, contextMenuContext: contextMenuContext }))] }));
});

exports.ListView = ListView;
//# sourceMappingURL=ListView-d67f49db.js.map
