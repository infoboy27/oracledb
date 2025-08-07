/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var mergeProps = require('./mergeProps-e3da7237.js');
var keys = require('./keys-a4b54295.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
var useCurrentKey = require('./useCurrentKey-3b4c8a44.js');
var useCollectionFocusRing = require('./useCollectionFocusRing-ca37785b.js');
var useTabbableModeSet = require('./useTabbableModeSet-bfbdbba0.js');
var useSelection = require('./useSelection-b53f8255.js');
require('./LayerHost-46e4d858.js');

var useReorderableItem = require('./useReorderableItem-02ed8243.js');

var Selector = require('./Selector-cc35dbb1.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var LoadMoreCollection = require('./LoadMoreCollection-73112ff0.js');
var PRIVATE_BaseCardView_themes_BaseCardViewStyles_css = require('./PRIVATE_BaseCardView/themes/BaseCardViewStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');
var refUtils = require('./refUtils-915b985d.js');
var logger = require('./logger-2b636482.js');
var tabbableUtils = require('./tabbableUtils-b49673af.js');
var useId = require('./useId-6c0eeb27.js');
var useAnimation = require('./useAnimation-2f7dd313.js');
var useResizeObserver = require('./useResizeObserver-819b1236.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
var FocusTrap = require('./FocusTrap-0a03f5a2.js');
var useUser = require('./useUser-a6d15333.js');
var Grid = require('./Grid-03d487e5.js');
var Flex = require('./Flex-fbba4ad6.js');
var PRIVATE_BaseCardView_themes_BaseCardViewContract_css = require('./PRIVATE_BaseCardView/themes/BaseCardViewContract.css.js');
var Skeleton = require('./Skeleton-f0f86df2.js');


/**
 * The internal component used to render a reorderable item in CardView.
 */
function BaseCardViewReorderableItem({ currentKey, children, dragKey, setDragKey, onReorder, rootRef, gutterSize, columns, context }) {
    const itemRef = hooks.useRef(null);
    const isOneColumn = columns === 1;
    const isFirstColumn = context.index % columns === 0;
    const isLastColumn = context.index % columns === columns - 1;
    const variantClasses = PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.multiVariantStyles({
        itemOverlayFront: gutterSize
    });
    const variantClassesVertical = PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.multiVariantStyles({
        itemOverlayFrontVertical: gutterSize
    });
    const itemStyles = {
        itemOverlayFront: isOneColumn ? variantClassesVertical : variantClasses,
        itemOverlayRear: isOneColumn ? PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemOverlayRearVertical : PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemOverlayRear,
        itemDragger: PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemDragger
    };
    const getItem = hooks.useCallback(() => itemRef?.current?.closest(collectionUtils.ITEM_SELECTOR), []);
    const setTransferData = hooks.useCallback((event) => {
        event.dataTransfer?.setData('text/cardview-items-key', JSON.stringify(context.metadata.key));
    }, [context.metadata.key]);
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
        isVertical: isOneColumn
    });
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    const overlayZoneBeforeClass = classNames.classNames([
        overlayZoneBeforeProps?.class,
        !isOneColumn && !isRtl && isFirstColumn && PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemOverlayFrontEdge,
        !isOneColumn && isRtl && isLastColumn && PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemOverlayFrontEdge
    ]);
    const overlayZoneAfterClass = classNames.classNames([
        overlayZoneAfterProps?.class,
        !isOneColumn && !isRtl && isLastColumn && PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemOverlayRearEdge,
        !isOneColumn && isRtl && isFirstColumn && PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemOverlayRearEdge
    ]);
    return (jsxRuntime.jsxs("div", { ...rootProps, draggable: false, children: [children, !isDragged && dragKey && (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { ...overlayZoneBeforeProps, class: overlayZoneBeforeClass }), jsxRuntime.jsx("div", { ...overlayZoneAfterProps, class: overlayZoneAfterClass })] }))] }));
}

/**
 * The internal component used to render a single item in CardView.
 */
function BaseCardViewItem({ children, context, isTabbable, isFocused, isFocusRingVisible, isSelected, selectionMode, focusBehavior, setIsFocusBehaviorValid, initialAnimation, isGridLayout, updateCardSize, reorderItemProps }) {
    const rootRef = hooks.useRef(null);
    const itemKey = context.metadata.key;
    const itemIndex = context.index;
    const isItemFocused = isFocused && isFocusRingVisible;
    const variantClasses = PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.multiVariantStyles({
        itemFocused: focusBehavior === 'card' && isItemFocused ? 'isItemFocused' : 'isNotItemFocused',
        itemInitialOpacity: initialAnimation ? 'isTransparent' : 'isNotTransparent',
        itemInGridLayout: isGridLayout ? 'isInGridLayout' : 'isNotInGridLayout'
    });
    const classes = classNames.classNames([PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.itemStyle, variantClasses]);
    /*********************************** Tabbable Mode ***********************************/
    // don't bubble Arrow Up/Down/Left/Right events to parent when in isTabbable mode
    // this bubbling causes the outer CollectionFocus ring to change index while in the isTabbable mode.
    const handleKeyDown = (event) => {
        if (focusBehavior === 'card' &&
            isTabbable &&
            (event.key === 'ArrowDown' ||
                event.key === 'ArrowUp' ||
                event.key === 'ArrowLeft' ||
                event.key === 'ArrowRight')) {
            event.stopPropagation();
        }
    };
    /************************************ Card Size ************************************/
    const handleResize = hooks.useCallback((entry) => {
        updateCardSize?.(entry.contentRect.width, entry.contentRect.height);
    }, [updateCardSize]);
    const nullRef = hooks.useRef(null);
    useResizeObserver.useResizeObserver(updateCardSize ? rootRef : nullRef, handleResize);
    /********************************* Focus Behavior *********************************/
    hooks.useLayoutEffect(() => {
        if (focusBehavior === 'content' && isItemFocused) {
            // rootRef is cardview item, its first child is the focus trap div, so its first grand child
            // is the actual content
            const content = rootRef.current?.firstElementChild?.firstElementChild;
            const focusable = tabbableUtils.allTabbableElements(content, true, true);
            if (focusable.length === 0 || focusable.length > 1) {
                logger.warn(`${focusable.length} focusable elements are detected in the card. 'content' focusBehavior is intended only for use when the card has single focusable element. Please specify one focusable element in the card or switch the focusBehavior to 'card'.`);
                setIsFocusBehaviorValid?.(false);
            }
            else {
                focusable[0].focus();
            }
        }
    }, [focusBehavior, isItemFocused, setIsFocusBehaviorValid]);
    /******************************** Initial Animation ********************************/
    // animation for slide up/down
    const { nodeRef: nodeRefSlide, controller: controllerSlide } = useAnimation.useAnimation(initialAnimation || 'none', animationConfigSlide(itemIndex));
    // animation for opacity change
    const { nodeRef: nodeRefOpacity, controller: controllerOpacity } = useAnimation.useAnimation((initialAnimation && 'opacity') || 'none', animationConfigOpacity(itemIndex));
    // max cap for animation is 1s
    setTimeout(() => {
        controllerSlide.cancel();
        controllerOpacity.cancel();
    }, 1000);
    // TODO: issue track in JET-57681, we currently have two useAnimation() because the opacity and
    // slide up/down have different durations, and the current API couldn't handle this case, we will
    // update this once the API is updated
    /********************************** Child Component **********************************/
    const itemRefs = hooks.useMemo(() => {
        // NOTE: spot an issue when we click the cards during animation is processing, the cards would not finish
        // the current animations and stay as what it is, e.g. leave itself as half transparent.
        // need to remove nodeRefSlide and nodeRefOpacity to avoid this issue.
        if (initialAnimation === undefined) {
            return refUtils.mergeRefs(rootRef);
        }
        return refUtils.mergeRefs(rootRef, nodeRefSlide, nodeRefOpacity);
    }, [rootRef, nodeRefSlide, nodeRefOpacity, initialAnimation]);
    const childrenComponent = reorderItemProps ? (jsxRuntime.jsx(BaseCardViewReorderableItem, { ...reorderItemProps, context: context, children: children(context) })) : (children(context));
    return (jsxRuntime.jsx("div", { id: useId.useId(), ref: itemRefs, class: classes, role: "gridcell", "data-oj-key": itemKey, onKeyDown: handleKeyDown, "aria-selected": selectionMode === 'none' ? undefined : isSelected, ...(typeof itemKey === 'number' && { 'data-oj-key-type': 'number' }), children: jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable }, children: jsxRuntime.jsx(FocusTrap.FocusTrap, { isDisabled: !isTabbable, restoreFocusRef: false, children: childrenComponent }) }) }));
}
const animationConfigSlide = (index) => {
    return {
        animationStates: {
            slideUp: {
                from: {
                    translateY: '50px'
                },
                to: {
                    translateY: '0px'
                },
                options: {
                    duration: 300,
                    delay: index * 50,
                    easing: [0, 0, 0.2, 1]
                }
            },
            slideDown: {
                from: {
                    translateY: '-50px'
                },
                to: {
                    translateY: '0'
                },
                options: {
                    duration: 300,
                    delay: index * 50,
                    easing: [0, 0, 0.2, 1]
                }
            }
        },
        isAnimatedOnMount: true
    };
};
const animationConfigOpacity = (index) => {
    return {
        animationStates: {
            opacity: {
                from: {
                    opacity: 0
                },
                to: {
                    opacity: 1
                },
                options: {
                    duration: 150,
                    delay: index * 50,
                    easing: 'linear'
                }
            }
        },
        isAnimatedOnMount: true
    };
};
/**
 * Compare the equality between two reorderItemProps, especially useful for memoized items
 */
const compareReorderItemProps = (props1, props2) => {
    return (props1?.['currentKey'] === props2?.['currentKey'] &&
        props1?.['dragKey'] === props2?.['dragKey'] &&
        props1?.['columns'] === props2?.['columns']);
};
const MemoizeBaseCardViewItem = compat.memo(BaseCardViewItem, (prev, next) => {
    if (prev && next) {
        return (prev.children === next.children &&
            prev.isTabbable === next.isTabbable &&
            prev.isFocused === next.isFocused &&
            prev.isFocusRingVisible === next.isFocusRingVisible &&
            prev.isSelected === next.isSelected &&
            prev.initialAnimation === next.initialAnimation &&
            prev.focusBehavior === next.focusBehavior &&
            collectionUtils.compareListItemContext(prev.context, next.context) &&
            compareReorderItemProps(prev.reorderItemProps, next.reorderItemProps));
    }
    return false;
});

function BaseCardViewLayout({ children, layout, gutterSize, columns }) {
    const gap = PRIVATE_BaseCardView_themes_BaseCardViewContract_css.cardViewVars.gutterSize[gutterSize];
    if (layout === 'grid') {
        return columns < 1 ? null : (jsxRuntime.jsx(Grid.Grid, { gridTemplateColumns: `repeat(${columns}, 1fr)`, gap: gap, children: children }));
    }
    else {
        return (jsxRuntime.jsx(Flex.Flex, { wrap: "wrap", gap: gap, children: children }));
    }
}

/**
 * Allows to specify the time delay for rendering the component
 **/
const timerValue = 50;
/**
 * BaseCardViewSkeletonContainer renders skeletons after 50ms threshold defined in the Redwood spec
 **/
function BaseCardViewSkeletonContainer({ children }) {
    const [isVisible, setIsVisible] = hooks.useState(false);
    hooks.useEffect(() => {
        setTimeout(() => {
            setIsVisible(true);
        }, timerValue);
    }, []);
    return isVisible ? jsxRuntime.jsx(preact.Fragment, { children: children }) : jsxRuntime.jsx("div", { class: LoadMoreCollection.LOADMORE_STYLE_CLASS });
}

// these are arbitrary values by now, might update them with definite values in the future
const DEFAULT_SKELETON_NUMBER = 25;
const DEFAULT_SKELETON_WIDTH = '60x';
const DEFAULT_SKELETON_HEIGHT = '70x';
/**
 * A function that returns an array of skeletons based on count
 * @param count the number of skeletons
 */
const getSkeletonsByCount = (layout, count = DEFAULT_SKELETON_NUMBER, width, height, isUnique = true) => {
    const sw = width || (layout === 'flex' ? DEFAULT_SKELETON_WIDTH : '100%');
    const sh = height || DEFAULT_SKELETON_HEIGHT;
    return [...Array(count)].map((_v, i) => (
    // create unique keys if needed, otherwise the animations won't start at the same time, because the old copy of skeletons
    // could be reused, even the key is specified by useId(), combine count with time to make the key unique.
    jsxRuntime.jsx(Skeleton.Skeleton, { width: sw, height: sh }, isUnique && `${i}${new Date().getTime()}`)));
};
/**
 * When there is no data (i.e. data is an empty array or null, and hasMore is false), we will show 25 card skeletons with default size
 */
const InitialLoadSkeletons = (props) => (jsxRuntime.jsx(BaseCardViewSkeletonContainer, { children: getSkeletonsByCount(props.layout) }));
/**
 * When we are fetching the initial data (i.e. data is an empty array, and hasMore is true), we will show 25 card skeletons with default size,
 * because we don't know the card dimension at this time. Since there is more data to load, we will specify LOADMORE_STYLE_CLASS on skeletons
 */
const DefaultLoadMoreSkeletons = (props) => {
    const firstSkeleton = (jsxRuntime.jsx("div", { class: LoadMoreCollection.LOADMORE_STYLE_CLASS, children: getSkeletonsByCount(props.layout, 1) }));
    const otherSkeletons = getSkeletonsByCount(props.layout, DEFAULT_SKELETON_NUMBER - 1);
    const skeletons = [firstSkeleton, ...otherSkeletons];
    return jsxRuntime.jsx(BaseCardViewSkeletonContainer, { children: skeletons });
};
/**
 * During the render that we measure and update card dimension, we will hide skeletons temporarily
 * to avoid showing incorrect skeletons
 */
const InvisibleSkeletons = () => {
    return jsxRuntime.jsx("div", { class: LoadMoreCollection.LOADMORE_STYLE_CLASS });
};
const LoadMoreSkeletons = (props) => {
    if (props.colCount < 1 || props.cardWidth == null || props.cardHeight == null) {
        // if column count / card width / card height are invalid, we will show the invisible skeletons
        return jsxRuntime.jsx(InvisibleSkeletons, {});
    }
    else {
        // after initial renders, show skeletons with correct dimension and count
        const skeletons = [];
        const firstRowColCount = props.colCount - (props.totalCount % props.colCount);
        const isOnlyOneRow = firstRowColCount === props.colCount;
        const cardWidth = `calc(${props.cardWidth}px)`;
        const cardHeight = props.cardHeight
            ? `calc(${props.cardHeight}px)`
            : DEFAULT_SKELETON_HEIGHT;
        const width = props.layout === 'flex' ? cardWidth : '100%';
        const height = props.layout === 'flex' || isOnlyOneRow ? cardHeight : '100%';
        // first row
        const firstSkeleton = (jsxRuntime.jsx("div", { class: LoadMoreCollection.LOADMORE_STYLE_CLASS, children: getSkeletonsByCount(props.layout, 1, width, height) }));
        skeletons.push(firstSkeleton);
        skeletons.push(getSkeletonsByCount(props.layout, firstRowColCount - 1, width, height));
        // second row
        if (!isOnlyOneRow) {
            skeletons.push(getSkeletonsByCount(props.layout, props.colCount, width, cardHeight));
        }
        return jsxRuntime.jsx(BaseCardViewSkeletonContainer, { children: skeletons });
    }
};

const emptyKeys = { all: false, keys: new Set() };
/**
 * A mapping of gutterSize to concrete size in pixels
 */
const gutterSizeToPX = {
    xs: 12,
    sm: 16,
    md: 24,
    lg: 48,
    xl: 64
};
const getColCount = (gapWidth, cardWidth, rootWidth) => {
    if (!cardWidth || !rootWidth)
        return 0;
    // if we have n cards, we have n-1 gaps
    const colCount = Math.floor((rootWidth + gapWidth) / (gapWidth + cardWidth));
    return Math.max(1, colCount);
};

const useCardViewReorder = ({ currentKey, onReorder, gutterSize, columns, rootRef, scrollCurrItemIntoView }) => {
    const isReorderEnabled = onReorder != undefined;
    const [dragKey, setDragKey] = hooks.useState(undefined);
    const { reorderProps, reorderContext, reorderInstructionsId, reorderInstructions } = useReorderableItem.useReorderable({
        onReorder,
        rootRef,
        itemSelector: collectionUtils.ITEM_SELECTOR,
        isDisabled: !isReorderEnabled,
        columns
    });
    if (!isReorderEnabled) {
        return {
            reorderProps,
            reorderContext,
            reorderInstructionsId,
            reorderInstructions
        };
    }
    const handleDragOver = (event) => {
        collectionUtils.dragToScroll(event, dragKey !== undefined, rootRef.current);
        // during mouse reordering, the drag item might not be the same as current item,
        // so we should disallow current item scroll into view
        scrollCurrItemIntoView.current = false;
    };
    const reorderEventProps = { ...reorderProps, onDragOver: handleDragOver };
    const reorderItemProps = {
        currentKey,
        dragKey,
        setDragKey,
        onReorder,
        rootRef,
        gutterSize,
        columns
    };
    return {
        reorderProps: reorderEventProps,
        reorderItemProps,
        reorderContext,
        reorderInstructionsId,
        reorderInstructions
    };
};

const BaseCardViewImpl = compat.forwardRef(({ children, data, onLoadMore = () => { }, hasMore = false, getRowKey, currentKey, onCurrentKeyChange, selectionMode = 'none', selectedKeys = emptyKeys, onSelectionChange, onReorder, viewportConfig, focusBehavior = 'card', 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, initialAnimation = 'slideUp', gutterSize = 'sm', columns, layout, cardSize, updateCardSize }, ref) => {
    const rootRef = hooks.useRef(null);
    hooks.useImperativeHandle(ref, () => rootRef.current, [rootRef]);
    // tracking the anchor key which is used for shift+click selection
    const anchorKey = hooks.useRef();
    // tracking pending current key in pointer down event
    const pendingCurrentKey = hooks.useRef();
    const gutterSizePX = gutterSizeToPX[gutterSize];
    const layoutProps = { layout, columns, gutterSize };
    const isInitialAnimation = hooks.useRef(true);
    hooks.useEffect(() => {
        if (cardSize.height != undefined && cardSize.width != undefined) {
            isInitialAnimation.current = false;
        }
    }, [cardSize]);
    const ariaMultiSelectable = selectionMode === 'none' ? undefined : selectionMode === 'multiple';
    const ariaRowcount = hasMore || !data || columns < 1 ? -1 : Math.ceil(data?.length / columns);
    const ariaColcount = columns < 1 ? -1 : columns;
    const [isFocusBehaviorValid, setIsFocusBehaviorValid] = hooks.useState(true);
    const validFocusBehavior = isFocusBehaviorValid ? focusBehavior : 'card';
    // ensure current item is scrolled into view when current item is updated
    // during reordering, enable that during keyboard reordering, disable that during mouse reordering
    const scrollCurrItemIntoView = hooks.useRef(false);
    const isReorderEnabled = onReorder != undefined;
    const isFetching = hooks.useRef(false);
    /*****************************************************************************************/
    /************************************* Tabbable Mode *************************************/
    /*****************************************************************************************/
    const [isCurrentTabbableKey, tabbableModeProps] = useTabbableModeSet.useTabbableModeSet(rootRef, (element) => {
        return collectionUtils.keyExtractor(element, collectionUtils.ITEM_SELECTOR);
    }, currentKey, onCurrentKeyChange);
    /*****************************************************************************************/
    /********************************* Current Key and Focus *********************************/
    /*****************************************************************************************/
    const { currentKeyProps } = useCurrentKey.useCurrentKey((element) => collectionUtils.keyExtractor(element, collectionUtils.ITEM_SELECTOR), selectionMode !== 'multiple', 
    // init a function every time to make sure we pass in the latest columns,
    // otherwise the new key might be wrong after resize
    () => collectionUtils.getPrevNextKeyByCount(data, getRowKey, currentKey, -columns), () => collectionUtils.getPrevNextKeyByCount(data, getRowKey, currentKey, columns), () => collectionUtils.getPrevNextKeyByCount(data, getRowKey, currentKey, -1), () => collectionUtils.getPrevNextKeyByCount(data, getRowKey, currentKey, 1), currentKey, onCurrentKeyChange);
    const [showFocusRing, focusRingProps] = useCollectionFocusRing.useCollectionFocusRing(rootRef, [
        'ArrowUp',
        'ArrowDown',
        'ArrowLeft',
        'ArrowRight'
    ]);
    const handleFocus = () => {
        // handle initial focus
        if (!keys.isKeyDefined(currentKey) &&
            onCurrentKeyChange &&
            isCurrentTabbableKey(undefined) &&
            rootRef.current) {
            const firstKey = pendingCurrentKey.current || collectionUtils.getFirstVisibleKey(rootRef.current, collectionUtils.ITEM_SELECTOR);
            if (keys.isKeyDefined(firstKey)) {
                onCurrentKeyChange({ value: firstKey });
            }
        }
        else if (keys.isKeyDefined(currentKey) && rootRef.current) {
            // if currentKey is defined, make sure scroll the current item into view when cardview regains focus
            const elem = collectionUtils.findElementByKey(rootRef.current, currentKey, collectionUtils.ITEM_SELECTOR);
            elem?.scrollIntoView({ block: 'nearest' });
        }
    };
    // need to track pointer down element to set currentItem when initial focus happens
    const handlePointerDown = (event) => {
        const key = collectionUtils.keyExtractor(event.target, collectionUtils.ITEM_SELECTOR);
        if (keys.isKeyDefined(key)) {
            pendingCurrentKey.current = key;
        }
    };
    const handleKeyDown = (event) => {
        // for content focusBehavior, when users tab out, we need to focus back to card grid, to ensure
        // the tabbing order works properly, otherwise the focus might get stuck at the current item
        if (validFocusBehavior === 'content' && event.key === 'Tab') {
            rootRef.current?.focus({ preventScroll: true });
        }
        // during keyboard reordering, the current item should be scrolled into view
        const keyHandlers = ['ArrowLeft', 'ArrowRight', 'ArrowUp', 'ArrowDown'];
        if (isReorderEnabled &&
            (event.metaKey || event.ctrlKey) &&
            event.shiftKey &&
            keyHandlers.includes(event.key)) {
            scrollCurrItemIntoView.current = true;
        }
    };
    hooks.useEffect(() => {
        if (currentKey != null && rootRef.current) {
            const elem = collectionUtils.findElementByKey(rootRef.current, currentKey, collectionUtils.ITEM_SELECTOR);
            if (elem) {
                // only update aria-activedescendant for screen reader in default focusBehavior
                if (validFocusBehavior === 'card') {
                    const cell = elem.closest(`[role=gridcell]`);
                    const activeDescendant = rootRef.current.getAttribute('aria-activedescendant');
                    if (cell && activeDescendant !== cell.id) {
                        rootRef.current.setAttribute('aria-activedescendant', cell.id);
                        scrollCurrItemIntoView.current = true;
                    }
                }
                // make sure current item is visible
                if (scrollCurrItemIntoView.current) {
                    elem.scrollIntoView({ block: 'nearest' });
                    scrollCurrItemIntoView.current = false;
                }
            }
        }
        // listen to data because the current item would re-render when data is updated, i.e. the id
        // of current item would be updated, so the currentKey itself couldn't guarantee the root has
        // the latest aria-activedescendant
    }, [currentKey, data, validFocusBehavior, isReorderEnabled]);
    /*****************************************************************************************/
    /*************************************** Selection ***************************************/
    /*****************************************************************************************/
    const handleSelectionChange = hooks.useCallback((detail) => {
        if (onSelectionChange) {
            if (detail.value.all === false && detail.value.keys.size > 0) {
                // during regular selection, the last key selected by a user gesture is the anchor key
                anchorKey.current = Array.from(detail.value.keys.values()).pop();
            }
            onSelectionChange(detail);
        }
    }, [anchorKey, onSelectionChange]);
    const handleSelectionRangeChange = hooks.useCallback((detail) => {
        if (data && onSelectionChange) {
            const value = collectionUtils.handleSelectionRange(detail, data, getRowKey);
            // for non-virtualized CardView, value should always be an array
            if (Array.isArray(value)) {
                if (detail.eventType === 'shiftSpace') {
                    // during range selection by shift+space, the first key selected by a user gesture is the anchor key
                    anchorKey.current = detail.value.start;
                }
                else {
                    // during range selection by shift+click/arrow keys, the last key selected by a user gesture is the anchor key
                    anchorKey.current = detail.value.end;
                }
                onSelectionChange({ value: { all: false, keys: new Set(value) }, target: null });
            }
        }
    }, [data, onSelectionChange, getRowKey]);
    const { selectionProps } = useSelection.useSelection((element) => {
        if (element === rootRef.current) {
            return currentKey === undefined ? null : currentKey;
        }
        return collectionUtils.keyExtractor(element, collectionUtils.ITEM_SELECTOR);
    }, selectedKeys, selectionMode, false, 'toggle', false, handleSelectionChange, anchorKey.current, currentKey, (currentKey, isPrev) => () => collectionUtils.getPrevNextKeyByCount(data, getRowKey, currentKey, isPrev ? -columns : columns), (currentKey, isPrev) => () => collectionUtils.getPrevNextKeyByCount(data, getRowKey, currentKey, isPrev ? -1 : 1), (key) => {
        if (rootRef.current) {
            const elem = collectionUtils.findElementByKey(rootRef.current, key, collectionUtils.ITEM_SELECTOR);
            if (elem) {
                elem.scrollIntoView({ block: 'nearest' });
            }
        }
    }, handleSelectionRangeChange);
    /*****************************************************************************************/
    /**************************************** Reorder ****************************************/
    /*****************************************************************************************/
    const { reorderProps, reorderItemProps, reorderContext, reorderInstructionsId, reorderInstructions } = useCardViewReorder({
        currentKey,
        onReorder,
        gutterSize,
        columns,
        rootRef,
        scrollCurrItemIntoView
    });
    const reorderAcc = isReorderEnabled && (jsxRuntime.jsx(jsxRuntime.Fragment, { children: jsxRuntime.jsx("span", { id: reorderInstructionsId, children: jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { children: reorderInstructions }) }) }));
    /*****************************************************************************************/
    /************************************* Load More *****************************************/
    /*****************************************************************************************/
    const handleLoadMore = hooks.useCallback(() => {
        // check isFetching to avoid multiple load more at the same time (details in JET-61117)
        if (!isFetching.current) {
            isFetching.current = true;
            onLoadMore();
        }
    }, [isFetching, onLoadMore]);
    hooks.useEffect(() => {
        isFetching.current = false;
        // listen to data and hasMore because when one of them gets updated, the fetching is done
    }, [data, hasMore]);
    /*****************************************************************************************/
    /************************************ Child Component ************************************/
    /*****************************************************************************************/
    const getItemContext = hooks.useCallback((context) => {
        const key = getRowKey(context.data);
        const selectorRenderer = selectionMode === 'multiple'
            ? () => (jsxRuntime.jsx(Selector.Selector, { onChange: onSelectionChange, rowKey: key, selectedKeys: selectedKeys }))
            : undefined;
        return {
            index: context.index,
            data: context.data,
            metadata: { key: key },
            selector: selectorRenderer,
            isSelected: keys.containsKey(selectedKeys, key)
        };
    }, [selectionMode, selectedKeys, onSelectionChange, getRowKey]);
    const childrenComponent = (context) => {
        const cardItemContext = getItemContext(context);
        const isTabbable = isCurrentTabbableKey(cardItemContext.metadata.key);
        const isFocused = currentKey === cardItemContext.metadata.key && !isTabbable;
        const isFocusRingVisible = isFocused && showFocusRing;
        const isSelected = cardItemContext.isSelected;
        const itemRenderFunc = (context) => (jsxRuntime.jsx(MemoizeBaseCardViewItem, { context: context, isTabbable: isTabbable, isFocused: isFocused, isFocusRingVisible: isFocusRingVisible, isGridLayout: layout === 'grid', isSelected: isSelected, selectionMode: selectionMode, focusBehavior: validFocusBehavior, ...(focusBehavior === 'content' && { setIsFocusBehaviorValid }), ...(isInitialAnimation.current && { initialAnimation }), ...(cardItemContext.index === 0 && !cardSize.width && { updateCardSize }), ...(isReorderEnabled && { reorderItemProps }), children: children }, cardItemContext.metadata.key));
        return itemRenderFunc(cardItemContext);
    };
    // todo: issue track in JET-57952, need a way to show the skeletons in keyboard navigation
    const skeletons = data && !data.length && hasMore ? (jsxRuntime.jsx(DefaultLoadMoreSkeletons, { layout: layout })) : (jsxRuntime.jsx(LoadMoreSkeletons, { layout: layout, colCount: columns, totalCount: data?.length || 0, cardWidth: cardSize.width, cardHeight: cardSize.height }));
    viewportConfig = collectionUtils.getViewportConfig(rootRef, viewportConfig);
    const collectionComponent = (jsxRuntime.jsx("div", { role: "row", children: jsxRuntime.jsx(BaseCardViewLayout, { ...layoutProps, children: jsxRuntime.jsx(LoadMoreCollection.LoadMoreCollection, { data: data, hasMore: hasMore, onLoadMore: handleLoadMore, loadMoreIndicator: skeletons, loadMoreThreshold: gutterSizePX + 4, viewportConfig: viewportConfig, children: childrenComponent }) }) }));
    const initialLoadSkeletons = (jsxRuntime.jsx(BaseCardViewLayout, { ...layoutProps, children: jsxRuntime.jsx(InitialLoadSkeletons, { layout: layout }) }));
    return (jsxRuntime.jsxs("div", { ...mergeProps.mergeProps(currentKeyProps, focusRingProps, selectionProps, reorderProps, {
            onFocus: handleFocus,
            onPointerDown: handlePointerDown,
            onKeyDown: handleKeyDown
        }, 
        // only enable tabbable mode in default focusBehavior
        { ...(validFocusBehavior === 'card' && tabbableModeProps) }), ref: rootRef, role: "grid", class: PRIVATE_BaseCardView_themes_BaseCardViewStyles_css.styles.baseStyle, tabIndex: 0, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-multiselectable": ariaMultiSelectable, "aria-rowcount": ariaRowcount, "aria-colcount": ariaColcount, children: [jsxRuntime.jsx(useReorderableItem.ReorderableContext.Provider, { value: reorderContext, children: !data ? (initialLoadSkeletons) : data.length || hasMore ? (collectionComponent) : (jsxRuntime.jsx(preact.Fragment, {})) }), reorderAcc] }));
});
/**
 * Cast BaseCardViewImpl to generic type, because BaseCardViewImpl would infer the generic type to specific type,
 * i.e infer <K extends string | number, D> to <string | number, unknown>, which will cause type issues in the parent component
 */
const BaseCardView = BaseCardViewImpl;

exports.BaseCardView = BaseCardView;
exports.getColCount = getColCount;
exports.gutterSizeToPX = gutterSizeToPX;
//# sourceMappingURL=BaseCardView-badf6df3.js.map
