/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var classNames = require('./classNames-c14c6ef3.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var keys = require('./keys-a4b54295.js');
var LoadMoreCollection = require('./LoadMoreCollection-73112ff0.js');
var VirtualizedCollection = require('./VirtualizedCollection-00aedb8b.js');
var compat = require('preact/compat');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
var useId = require('./useId-6c0eeb27.js');
var FocusTrap = require('./FocusTrap-0a03f5a2.js');
var useInteractionStyle = require('./useInteractionStyle-442c6a12.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var PRIVATE_List_themes_ListStyles_css = require('./PRIVATE_List/themes/ListStyles.css.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
var Skeleton = require('./Skeleton-f0f86df2.js');
var Flex = require('./Flex-fbba4ad6.js');
var Selector = require('./Selector-cc35dbb1.js');
var ImageVars_css = require('./ImageVars.css-3fbb1c0b.js');
var useTheme = require('./useTheme-9b0dc066.js');
var useTestId = require('./useTestId-8234ec1e.js');
require('preact');
var useSelection = require('./useSelection-b53f8255.js');
var useCurrentKey = require('./useCurrentKey-3b4c8a44.js');
var useCollectionFocusRing = require('./useCollectionFocusRing-ca37785b.js');
var useCollectionGestureContext = require('./useCollectionGestureContext-daada886.js');
var useItemAction = require('./useItemAction-dad80c7d.js');
var useTabbableModeSet = require('./useTabbableModeSet-bfbdbba0.js');
var Inset = require('./Inset-a076f9ab.js');


/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * List Roles need to be kept in matching sets, this module encapsulates the sets
 *
 * @param ariaRole
 * @returns matching, valid set of roles
 */
const getListViewRoles = (ariaRole) => {
    switch (ariaRole) {
        case 'listbox':
            return { list: 'listbox', item: 'presentation', cell: 'option' };
        case 'treegrid':
            return { list: 'treegrid', item: 'row', cell: 'gridcell' };
        default:
            return { list: 'grid', item: 'row', cell: 'gridcell' };
    }
};

const ITEM_SELECTOR = '[data-oj-key]';
/**
 * The internal component used to render a single item in ListView.
 */
function ListViewItem({ children, context, itemDepth, isFocused, isFocusRingVisible, isActive, isGridlineVisible, isSelected, isTopGridlineVisible = false, isTabbable = false, role, selectionMode, suggestion, currentItemVariant }) {
    const rootRef = hooks.useRef(null);
    const roles = hooks.useMemo(() => getListViewRoles(role), [role]);
    const itemKey = context.metadata.key;
    const itemIndex = context.index;
    // some roles come with related aria attributes which need to be set
    const cellRoleAttributes = roles.cell === 'option'
        ? {
            role: roles.cell,
            'aria-posinset': itemIndex + 1,
            'aria-setsize': -1
        }
        : {
            role: roles.cell
        };
    // don't bubble Arrow Up and Down events to parent when in isTabbable mode
    // this bubbling causes the outer CollectionFocus ring to change index while in the isTabbable mode.
    const handleKeyDown = (event) => {
        if (isTabbable && (event.key === 'ArrowDown' || event.key === 'ArrowUp')) {
            event.stopPropagation();
        }
    };
    const { interactionProps, applyActiveStyle, applyHoverStyle, applyPseudoHoverStyle } = useInteractionStyle.useInteractionStyle();
    const variantClasses = PRIVATE_List_themes_ListStyles_css.listItemMultiVariantStyles({
        selectable: isSelectable(selectionMode, isSelected) ? 'isSelectable' : 'notSelectable',
        selected: isSelected ? 'isSelected' : 'notSelected',
        selectedSingle: isSelected && selectionMode === 'single' ? 'isSelectedSingle' : 'notSelectedSingle',
        needsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        active: applyActiveStyle || isActive ? 'isActive' : 'notActive',
        focusHighlight: currentItemVariant === 'highlight' && isFocused ? 'isFocusHighlight' : 'notFocusHighlight',
        focusRingVisible: isFocusRingVisible && isFocused ? 'isFocusRingVisible' : 'notFocusRingVisible',
        gridlineTop: isTopGridlineVisible ? 'visible' : 'hidden',
        gridlineBottom: isGridlineVisible ||
            (suggestion === 'end' && !isGridlineVisible && (!isSelected || selectionMode !== 'single'))
            ? 'visible'
            : 'hidden'
    });
    const classes = classNames.classNames([variantClasses]);
    const styleInterpolations = mergeInterpolations.mergeInterpolations([
        ...Object.values(flexitem.flexitemInterpolations)
    ]);
    const { class: cls, ...cellStyles } = styleInterpolations({
        flex: '1 1 auto',
        alignSelf: 'center'
    });
    const cellClasses = classNames.classNames([
        cls,
        selectionMode === 'multiple' && PRIVATE_List_themes_ListStyles_css.listItemStyles.checkboxContainer
    ]);
    // todo: use translated text for selector
    // note cannot put focus on gridcell div since JAWS will not read the aria-rowindex
    // correctly, so unfortunately needed another div
    return (jsxRuntime.jsx("div", { "aria-rowindex": role === 'grid' ? itemIndex + 1 : undefined, "aria-level": itemDepth, "data-oj-key": itemKey, class: classes, ref: rootRef, role: roles.item, ...(suggestion && { 'data-oj-suggestion': true }), ...(typeof itemKey === 'number' && { 'data-oj-key-type': 'number' }), ...interactionProps, children: jsxRuntime.jsx("div", { id: useId.useId(), style: cellStyles, class: cellClasses, "aria-posinset": role === 'grid' ? undefined : itemIndex + 1, "aria-setsize": role === 'grid' ? undefined : -1, onKeyDown: handleKeyDown, "aria-colindex": role === 'grid' ? 1 : undefined, "aria-selected": selectionMode !== 'none' ? isSelected : undefined, ...cellRoleAttributes, children: jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable }, children: jsxRuntime.jsx(FocusTrap.FocusTrap, { isDisabled: !isTabbable, restoreFocusRef: false, children: children(context) }) }) }) }));
}
/**
 * Helper method to determine whether item is selectable
 * @returns true if item is selectable (show hover effect), false otherwise
 */
const isSelectable = (selectionMode, isItemSelected) => {
    return selectionMode !== 'none' && (selectionMode === 'multiple' || !isItemSelected);
};
const MemoizeListViewItem = compat.memo(ListViewItem, (prev, next) => {
    if (prev && next) {
        return (prev.children === next.children &&
            prev.isFocused === next.isFocused &&
            prev.isFocusRingVisible === next.isFocusRingVisible &&
            prev.isSelected === next.isSelected &&
            prev.isTabbable === next.isTabbable &&
            prev.isActive === next.isActive &&
            prev.suggestion === next.suggestion &&
            prev.isGridlineVisible === next.isGridlineVisible &&
            prev.isTopGridlineVisible === next.isTopGridlineVisible &&
            collectionUtils.compareListItemContext(prev.context, next.context));
    }
    return false;
});

/**
 * Allows to specify the time delay for rendering the component
 **/
const timerValue = 50;
/**
 * SkeletonContainer renders 'minimumCount' number of skeletons
 * of the variant specified from its child element - Skeleton's prop after
 * 'timerValue' ms delay
 **/
function SkeletonContainer({ children, minimumCount = 1 }) {
    const [isVisible, setIsVisible] = hooks.useState(false);
    hooks.useEffect(() => {
        setTimeout(() => {
            setIsVisible(true);
        }, timerValue);
    }, []);
    const containerClasses = classNames.classNames([PRIVATE_List_themes_ListStyles_css.skeletonStyles.container]);
    return isVisible && children ? (jsxRuntime.jsx("div", { class: containerClasses, role: "presentation", children: [...Array(minimumCount)].map((_element, index) => children(index)) })) : null;
}

const SPARKLE_STYLE_CLASS = 'oj-collection-sparkle';
/**
 * A sparkle component for smart suggestion indicator in ListView
 * @param sparkleHeight the height of sparkle
 */
function Sparkle({ sparkleHeight }) {
    const { name } = useTheme.useTheme();
    if (sparkleHeight <= 0) {
        return null;
    }
    const height = sparkleHeight + 'px';
    const sparkleClasses = classNames.classNames([PRIVATE_List_themes_ListStyles_css.sparkleStyles.base]);
    const containerClasses = classNames.classNames([
        PRIVATE_List_themes_ListStyles_css.sparkleStyles.container,
        SPARKLE_STYLE_CLASS,
        // TODO: this component should create separate theme definitions to only show the image in redwood
        name === 'redwood' && ImageVars_css.globalImages
    ]);
    return (jsxRuntime.jsx("div", { class: containerClasses, children: jsxRuntime.jsx("div", { class: sparkleClasses, style: { height } }) }, "sparkle"));
}

const usePromotedSection = (data, promotedSection, rootRef) => {
    // tracking sparkle height
    const [sparkleHeight, setSparkleHeight] = hooks.useState(0);
    const suggestions = hooks.useMemo(() => data && promotedSection && findSuggestions(data.data, promotedSection.count), [data, promotedSection]);
    hooks.useEffect(() => {
        // update sparkleHeight only when we have suggestions
        // avoid unnecessary iterating through elements
        if (suggestions) {
            const placeholder = rootRef.current?.querySelector('.' + VirtualizedCollection.PLACEHOLDER_STYLE_CLASS);
            let height = placeholder?.offsetHeight || 0;
            const suggestionItems = rootRef.current?.querySelectorAll('[data-oj-suggestion]');
            suggestionItems?.forEach((item) => (height += item.offsetHeight));
            setSparkleHeight(height);
        }
    }, [rootRef, suggestions]);
    return { sparkleHeight, suggestions };
};
/**
 * A helper function that finds the data with suggestions, and
 * returns the corresponding keys
 * @param dataState
 */
const findSuggestions = (data, count) => {
    if (count === 0) {
        return null;
    }
    const suggestionsData = data.slice(0, count);
    return suggestionsData.reduce((suggestions, value, index) => {
        const key = value.metadata.key;
        if (index === count - 1) {
            suggestions.set(key, 'end');
        }
        else {
            suggestions.set(key, true);
        }
        return suggestions;
    }, new Map());
};

/**
 * Helper function to only include keys of leaf items.
 */
const excludeGroup = (data, keys) => {
    if (!keys.all) {
        const groups = data.data
            .filter((dataMetadata) => {
            return !dataMetadata.metadata.isLeaf;
        })
            .map((dataMetadata) => {
            return dataMetadata.metadata.key;
        });
        const leafOnly = Array.from(keys.keys.values()).filter((key) => {
            return !groups.includes(key);
        });
        return { ...keys, keys: new Set(leafOnly) };
    }
    return keys;
};
/**
 * A helper function to make sure specified elem is visible in the specified container
 */
const scrollToVisible = (elem, scroller, offset) => {
    if (elem && scroller) {
        if (elem.scrollIntoViewIfNeeded) {
            // for Safari, we'll need the non-standard scrollIntoViewIfNeeded
            elem.scrollIntoViewIfNeeded();
        }
        else {
            elem.scrollIntoView({ block: 'nearest' });
        }
        if (offset > 0) {
            const scrollerBounds = scroller.getBoundingClientRect();
            const elemBounds = elem.getBoundingClientRect();
            const diff = scrollerBounds.top + offset - elemBounds.top;
            if (diff > 0) {
                scroller.scrollTop = scroller.scrollTop - diff;
            }
        }
    }
};

const useSelectionAndNavigation = (currentKey, selectedKeys, selectionMode = 'none', onCurrentKeyChange, onSelectionChange, onItemAction, data, viewportConfig, role = 'grid', scrollToVisibleOffset, rootRef, pendingSelectionCallback) => {
    const listRoles = hooks.useMemo(() => getListViewRoles(role), [role]);
    // tracking the anchor key which is used for shift+click selection
    const anchorKey = hooks.useRef();
    const { currentKeyProps } = useCurrentKey.useCurrentKey((element) => collectionUtils.keyExtractor(element, ITEM_SELECTOR), selectionMode !== 'multiple', collectionUtils.getPrevNextKey(rootRef.current, currentKey, true, ITEM_SELECTOR), collectionUtils.getPrevNextKey(rootRef.current, currentKey, false, ITEM_SELECTOR), undefined, undefined, currentKey, onCurrentKeyChange);
    const [showFocusRing, focusRingProps] = useCollectionFocusRing.useCollectionFocusRing(rootRef, ['ArrowUp', 'ArrowDown']);
    hooks.useEffect(() => {
        if (currentKey != null && rootRef.current) {
            const elem = collectionUtils.findElementByKey(rootRef.current, currentKey, ITEM_SELECTOR);
            if (elem) {
                const activeDescendant = rootRef.current.getAttribute('aria-activedescendant');
                const cell = elem.querySelector(`[role=${listRoles.cell}]`);
                if (cell && activeDescendant !== cell.id) {
                    // update aria-activedescendant for screenreader
                    rootRef.current.setAttribute('aria-activedescendant', cell.id);
                    const scroller = viewportConfig?.scroller();
                    const offset = scrollToVisibleOffset ? scrollToVisibleOffset(rootRef.current) : 0;
                    // make sure item is visible
                    scrollToVisible(elem, scroller != null ? scroller : rootRef.current, offset);
                }
            }
        }
        // listen to data because the current item would re-render when the virtualizer
        // is fetching data or updating the data, i.e. the id of current item would be updated,
        // so the currentKey itself couldn't guarantee the root has latest aria-activedescendant
    }, [currentKey, data, listRoles.cell, viewportConfig, scrollToVisibleOffset, rootRef]);
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
            const value = handleSelectionRange(detail, data);
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
            else {
                pendingSelectionCallback(detail, value);
            }
        }
    }, [data, onSelectionChange, pendingSelectionCallback]);
    const value = useCollectionGestureContext.useCollectionGestureContext();
    const { selectionProps } = useSelection.useSelection((element) => {
        if (element === rootRef.current) {
            return currentKey === undefined ? null : currentKey;
        }
        return collectionUtils.keyExtractor(element, ITEM_SELECTOR);
    }, selectedKeys, selectionMode, false, 'replace', value === 'embedded', handleSelectionChange, anchorKey.current, currentKey, (currentKey, isPrev) => collectionUtils.getPrevNextKey(rootRef.current, currentKey, isPrev, ITEM_SELECTOR), undefined, (key) => {
        if (rootRef.current) {
            const elem = collectionUtils.findElementByKey(rootRef.current, key, ITEM_SELECTOR);
            if (elem) {
                const scroller = viewportConfig?.scroller();
                const offset = scrollToVisibleOffset ? scrollToVisibleOffset(rootRef.current) : 0;
                scrollToVisible(elem, scroller != null ? scroller : rootRef.current, offset);
            }
        }
    }, handleSelectionRangeChange);
    const itemActionProps = useItemAction.useItemAction(currentKey, data, onItemAction, ITEM_SELECTOR, value === 'embedded');
    return {
        eventProps: mergeProps.mergeProps(currentKeyProps, focusRingProps, selectionProps, itemActionProps),
        showFocusRing,
        handleSelectionChange
    };
};
const handleSelectionRange = (detail, dataState) => {
    const keys = dataState.data.map((value) => {
        return value.metadata.key;
    });
    const startIndex = keys.indexOf(detail.value.start);
    const endIndex = keys.indexOf(detail.value.end);
    const minIndex = Math.min(startIndex, endIndex);
    const maxIndex = Math.max(startIndex, endIndex);
    if (minIndex === -1) {
        // return a range to fetch so we can find all the keys, maxIndex should not be -1
        return { offset: 0, count: dataState.totalSize };
    }
    else {
        // range of keys are in the current viewport, return them
        return keys.slice(minIndex, maxIndex + 1);
    }
};

const useFocusTabbableMode = (currentKey, onCurrentKeyChange, allowTabbableMode, rootRef, viewportConfig, scrollToVisibleOffset) => {
    const pendingCurrentKey = hooks.useRef();
    const [isCurrentTabbableKey, tabbableModeProps] = useTabbableModeSet.useTabbableModeSet(rootRef, (element) => {
        // we don't want List to go into Tabbable mode when user clicks on expander
        return isExpander(element) ? null : collectionUtils.keyExtractor(element, ITEM_SELECTOR);
    }, currentKey, onCurrentKeyChange);
    const handleInitialFocus = hooks.useCallback(() => {
        if (rootRef.current &&
            onCurrentKeyChange &&
            (!allowTabbableMode || isCurrentTabbableKey(undefined))) {
            const firstKey = pendingCurrentKey.current || collectionUtils.getFirstVisibleKey(rootRef.current, ITEM_SELECTOR);
            if (keys.isKeyDefined(firstKey)) {
                onCurrentKeyChange({ value: firstKey });
            }
        }
    }, [rootRef, onCurrentKeyChange, allowTabbableMode, isCurrentTabbableKey]);
    const handleFocus = hooks.useCallback((event) => {
        if (isExpander(event.target)) {
            rootRef.current?.focus();
            const key = collectionUtils.keyExtractor(event.target, ITEM_SELECTOR);
            if (onCurrentKeyChange && keys.isKeyDefined(key)) {
                onCurrentKeyChange({ value: key });
            }
            return;
        }
        if (!keys.isKeyDefined(currentKey)) {
            onCurrentKeyChange && handleInitialFocus();
        }
        else if (rootRef.current) {
            // if currentKey is defined, make sure scroll the current item into view when listview regains focus
            const elem = collectionUtils.findElementByKey(rootRef.current, currentKey, ITEM_SELECTOR);
            if (elem) {
                const scroller = viewportConfig?.scroller();
                const offset = scrollToVisibleOffset ? scrollToVisibleOffset(rootRef.current) : 0;
                scrollToVisible(elem, scroller != null ? scroller : rootRef.current, offset);
            }
        }
    }, [currentKey, handleInitialFocus, onCurrentKeyChange, rootRef]);
    /**
     * Need to track pointer down element to set currentItem when initial focus happens
     */
    const handlePointerDown = hooks.useCallback((event) => {
        const key = collectionUtils.keyExtractor(event.target, ITEM_SELECTOR);
        if (keys.isKeyDefined(key)) {
            pendingCurrentKey.current = key;
        }
    }, []);
    return {
        eventProps: mergeProps.mergeProps(allowTabbableMode ? tabbableModeProps : {}, {
            onFocus: handleFocus,
            onPointerDown: handlePointerDown
        }),
        isCurrentTabbableKey
    };
};
const isExpander = (elem) => {
    if (elem.parentElement && elem.parentElement.classList.contains('oj-listview-expander')) {
        return true;
    }
    return false;
};

/**
 * Component that renders items as a flat list.
 * In order to maximize performance, only items that are visible in the viewport are rendered.
 */
function List({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, allowTabbableMode = true, children, currentKey, data, gridlines, loadingIndicator = defaultLoadingIndicator, onCurrentKeyChange, onLoadRange, onSelectionChange, onItemAction, rangeExtractor, role = 'grid', selectedKeys = emptyKeys, selectionMode = 'none', viewportConfig, currentItemVariant = 'none', promotedSection, isVirtualized = false, customItemRenderer, scrollToVisibleOffset, testId, scrollerRef, reorderProps, contextMenuTriggerProps, ...props }) {
    const rootRef = hooks.useRef(null);
    // tracking pending selection key that is not in current data
    const pendingSelection = hooks.useRef();
    const [active, setActive] = hooks.useState(false);
    const showGridline = (index) => {
        // show bottom gridlines for each item, and for the last item if specified
        return (gridlines?.item === 'visible' &&
            (index + 1 !== data?.totalSize || gridlines?.bottom === 'visible'));
    };
    const showGridlineTop = () => {
        // show the top gridline for the first item
        return gridlines?.item === 'visible' && gridlines?.top === 'visible';
    };
    const ariaMultiSelectable = selectionMode === 'none' ? undefined : selectionMode === 'multiple';
    const ariaRowCount = data === null ? undefined : data.sizePrecision === 'exact' ? data.totalSize : -1;
    const classes = classNames.classNames([PRIVATE_List_themes_ListStyles_css.listStyles.base]);
    const pendingSelectionCallback = hooks.useCallback((detail, value) => {
        if (data) {
            pendingSelection.current = {
                detail: detail,
                range: { offset: data.offset, count: data.data.length }
            };
            onLoadRange(value);
        }
    }, [data, onLoadRange]);
    const { eventProps, showFocusRing, handleSelectionChange } = useSelectionAndNavigation(currentKey, selectedKeys, selectionMode, onCurrentKeyChange, onSelectionChange, onItemAction, data, viewportConfig, role, scrollToVisibleOffset, rootRef, pendingSelectionCallback);
    const { eventProps: focusTabbableProps, isCurrentTabbableKey } = useFocusTabbableMode(currentKey, onCurrentKeyChange, allowTabbableMode, rootRef, viewportConfig, scrollToVisibleOffset);
    if (data && pendingSelection.current !== undefined && onSelectionChange) {
        const keys = handleSelectionRange(pendingSelection.current.detail, data);
        if (Array.isArray(keys)) {
            onSelectionChange({ value: { all: false, keys: new Set(keys) }, target: null });
        }
        const range = pendingSelection.current
            ? pendingSelection.current.range
            : { offset: data.offset, count: data.data.length };
        data = adjustDataState(data, range);
        pendingSelection.current = undefined;
        onLoadRange(range);
    }
    const { sparkleHeight, suggestions } = usePromotedSection(data, promotedSection, rootRef);
    // TODO: check suggestions before Sparkle would cause a scrolling issue
    const sparkleIndicator = jsxRuntime.jsx(Sparkle, { sparkleHeight: sparkleHeight });
    // returns an ListItemContext based on ItemContext (added metadata and selector)
    // note the type for ItemContext, this is the context coming from Collection
    const getItemContext = hooks.useCallback((context) => {
        const dataStateData = context.data;
        const selectorRenderer = selectionMode === 'multiple'
            ? () => (jsxRuntime.jsx(Selector.Selector, { onChange: handleSelectionChange, rowKey: dataStateData.metadata.key, selectedKeys: selectedKeys }))
            : undefined;
        return {
            index: context.index,
            data: dataStateData.data,
            metadata: dataStateData.metadata,
            selector: selectorRenderer
        };
    }, [selectionMode, selectedKeys, handleSelectionChange]);
    const ItemComponent = isVirtualized ? ListViewItem : MemoizeListViewItem;
    const childrenComponent = (context) => {
        const listItemContext = getItemContext(context);
        const suggestion = suggestions?.get(listItemContext.metadata.key);
        const isTabbable = allowTabbableMode && isCurrentTabbableKey(listItemContext.metadata.key);
        const isFocused = currentKey === listItemContext.metadata.key && !isTabbable;
        const isActive = isFocused && active;
        const isSelected = keys.containsKey(selectedKeys, listItemContext.metadata.key);
        const isFocusRingVisible = isFocused && showFocusRing;
        const listItemFunc = (ctx, otherProps) => (jsxRuntime.jsx(ItemComponent, { context: ctx, isFocused: isFocused, isFocusRingVisible: isFocusRingVisible, isActive: isActive, isGridlineVisible: showGridline(listItemContext.index), isSelected: isSelected, isTabbable: allowTabbableMode && isCurrentTabbableKey(listItemContext.metadata.key), role: role, selectionMode: selectionMode, currentItemVariant: currentItemVariant, ...(suggestion && { suggestion }), ...(listItemContext.index === 0 && { isTopGridlineVisible: showGridlineTop() }), ...otherProps, children: children }, listItemContext.metadata.key));
        // if customItemRenderer is specified (ExpandableList and GroupedList)
        // create a custom context with additional info including a function
        // that helps create the default item component
        if (customItemRenderer) {
            const customRendererContext = {
                listItemContext,
                isFocused,
                isFocusRingVisible,
                isSelected,
                isTabbable,
                isActive,
                defaultListItem: listItemFunc
            };
            return customItemRenderer(customRendererContext);
        }
        return listItemFunc(listItemContext);
    };
    viewportConfig = getViewportConfig(rootRef, viewportConfig);
    const handleKeyDown = hooks.useCallback((event) => {
        if (event.key === ' ' && keys.isKeyDefined(currentKey) && selectionMode !== 'none') {
            setActive(true);
        }
    }, [currentKey, selectionMode, setActive]);
    const handleKeyUp = hooks.useCallback(() => {
        setActive(false);
    }, [setActive]);
    hooks.useImperativeHandle(scrollerRef, () => rootRef.current);
    // if data is not specified, listview should show loading indicator
    // todo: replace placeholder with actual SkeletonContainer component (Ash is working on)
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { ...mergeProps.mergeProps(eventProps, focusTabbableProps, contextMenuTriggerProps || {}, reorderProps || {}, {
            onKeyDown: handleKeyDown,
            onKeyUp: handleKeyUp
        }, props), ...testIdProps, role: role, "aria-rowcount": role === 'grid' ? ariaRowCount : undefined, "aria-colcount": role === 'grid' ? 1 : undefined, ref: rootRef, class: classes, tabIndex: 0, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-multiselectable": ariaMultiSelectable, children: data == null ? (loadingIndicator) : isVirtualized ? (jsxRuntime.jsx(VirtualizedCollection.VirtualizedCollection, { data: data, itemSelector: ITEM_SELECTOR, loadMoreIndicator: defaultLoadMoreIndicator, onLoadRange: onLoadRange, rangeExtractor: rangeExtractor, suggestions: sparkleIndicator, viewportConfig: viewportConfig, children: childrenComponent })) : (jsxRuntime.jsx(LoadMoreCollection.LoadMoreCollection, { data: data.data, loadMoreIndicator: defaultLoadMoreIndicator, hasMore: data.sizePrecision === 'atLeast' && data.data.length <= data.totalSize, onLoadMore: () => {
                data && onLoadRange({ offset: 0, count: data.data.length + 25 });
            }, suggestions: sparkleIndicator, viewportConfig: viewportConfig, children: childrenComponent })) }));
}
const getViewportConfig = (rootRef, config) => {
    return (config ?? {
        scroller: () => {
            return rootRef.current;
        }
    });
};
const emptyKeys = { all: false, keys: new Set() };
const defaultLoadingIndicator = (jsxRuntime.jsx(SkeletonContainer, { minimumCount: 25, children: () => {
        return (jsxRuntime.jsx(Inset.Inset, { variant: "listview", children: jsxRuntime.jsx(Flex.Flex, { height: "6x", align: "center", children: jsxRuntime.jsx(Skeleton.Skeleton, { height: "4x" }) }) }));
    } }));
const defaultLoadMoreIndicator = (jsxRuntime.jsx("div", { class: LoadMoreCollection.LOADMORE_STYLE_CLASS, children: jsxRuntime.jsx(SkeletonContainer, { minimumCount: 3, children: () => {
            return (jsxRuntime.jsx(Inset.Inset, { variant: "listview", children: jsxRuntime.jsx(Flex.Flex, { height: "6x", align: "center", children: jsxRuntime.jsx(Skeleton.Skeleton, { height: "4x" }) }) }));
        } }) }));
/**
 * Adjust the DataState as needed if it contains more than needed for the specified range
 */
const adjustDataState = (dataState, range) => {
    if (range) {
        // prevent range offset from being larger than the data state
        const safeRangeOffset = Math.min(range.offset, dataState.offset + dataState.totalSize);
        const diff = safeRangeOffset - dataState.offset;
        if (diff > 0) {
            dataState = {
                offset: safeRangeOffset,
                data: dataState.data.slice(diff, diff + range.count),
                totalSize: dataState.totalSize,
                sizePrecision: dataState.sizePrecision
            };
        }
    }
    return dataState;
};

exports.List = List;
exports.SkeletonContainer = SkeletonContainer;
exports.excludeGroup = excludeGroup;
exports.scrollToVisible = scrollToVisible;
//# sourceMappingURL=List-bd9ecebb.js.map
