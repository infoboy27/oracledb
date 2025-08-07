/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var mergeProps = require('./mergeProps-e3da7237.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
var useCollectionFocusRing = require('./useCollectionFocusRing-ca37785b.js');
var useCurrentKey = require('./useCurrentKey-3b4c8a44.js');
var useId = require('./useId-6c0eeb27.js');

const ITEM_SELECTOR = '[role="tab"]';
const REMOVABLE_ICON_SELECTOR = '[data-oj-tabbar-item-remove-icon="true"]';
const REMOVABLE_ITEM_ATTRIBUTE = 'data-oj-removable';
/**
 * Implements TabBar behavior for focus and keyboad handling
 */
function useTabBar(options) {
    const { children, class: className, display, edge = 'top', selection, onSelect, onRemove, ref: userRef, size } = options;
    const internalRef = hooks.useRef(null);
    const rootRef = userRef || internalRef;
    const tabId = useId.useId();
    const [currentKey, setCurrentKey] = hooks.useState(selection);
    const [hideTooltip, setHideTooltip] = hooks.useState(false);
    const tabItemPrefix = tabId + '_';
    /**
     * A reference to the previous set of tab keys that this TabBar
     * contains before children were re-rendered. In the event the "current" tab
     * is removed and the "currentKey" reference is broken, we can redirect
     * the "currentKey" to another tab based on the index of the removed tab.
     */
    const prevTabKeys = hooks.useRef();
    hooks.useEffect(() => {
        if (rootRef.current) {
            const tabKeys = Array.from(rootRef.current.querySelectorAll(ITEM_SELECTOR)).map((elem) => collectionUtils.getKey(elem));
            if (currentKey && !tabKeys.includes(currentKey)) {
                //If prevTabs does not exist set the first visible key as currentKey
                prevTabKeys.current
                    ? setCurrentKey(findNextValidKey(currentKey, tabKeys, prevTabKeys.current))
                    : setCurrentKey(tabKeys[0]);
            }
            prevTabKeys.current = tabKeys;
        }
    }, [children, currentKey, rootRef]);
    const [showFocusRing, focusRingProps] = useCollectionFocusRing.useCollectionFocusRing(rootRef, [
        'ArrowRight',
        'ArrowLeft',
        'Home',
        'End'
    ]);
    const { currentKeyProps } = useCurrentKey.useCurrentKey((element) => onRemove
        ? extractOnlyItemKey(element, ITEM_SELECTOR, REMOVABLE_ICON_SELECTOR)
        : collectionUtils.keyExtractor(element, ITEM_SELECTOR), false, undefined, undefined, collectionUtils.getPrevNextKeyUsingRef(rootRef, currentKey, true, ITEM_SELECTOR), collectionUtils.getPrevNextKeyUsingRef(rootRef, currentKey, false, ITEM_SELECTOR), currentKey, (detail) => {
        setCurrentKey(detail.value);
        setHideTooltip(false);
    });
    const onKeyDown = (event) => {
        if (rootRef.current && currentKey) {
            if (event.key === 'Home' || event.key === 'End') {
                const tabBarItemKey = Array.from(rootRef.current.querySelectorAll(ITEM_SELECTOR), (elem) => collectionUtils.getKey(elem));
                event.preventDefault();
                setCurrentKey?.(tabBarItemKey[event.key === 'Home' ? 0 : tabBarItemKey.length - 1]);
            }
            if (event.key === 'Enter' || event.key === ' ') {
                event.preventDefault();
                onSelect?.({ value: currentKey });
            }
            if (event.key === 'Delete') {
                const tabBarItem = collectionUtils.findElementByKey(rootRef.current, currentKey, ITEM_SELECTOR);
                if (tabBarItem.hasAttribute(REMOVABLE_ITEM_ATTRIBUTE)) {
                    onRemove?.({ value: currentKey });
                }
            }
            if (event.key === 'Escape') {
                setHideTooltip(true);
            }
        }
    };
    const onFocus = () => {
        if (rootRef.current && currentKey === undefined) {
            const key = collectionUtils.getFirstVisibleKey(rootRef.current, ITEM_SELECTOR);
            if (key) {
                setCurrentKey(key);
            }
        }
    };
    const eventProps = { onKeyDown, onFocus };
    return {
        rootProps: mergeProps.mergeProps({
            'aria-activedescendant': currentKey ? tabItemPrefix + currentKey : '',
            'aria-multiselectable': false,
            class: className,
            ref: rootRef,
            role: 'tablist',
            tabIndex: 0
        }, currentKeyProps, focusRingProps, eventProps),
        tabBarContext: {
            currentKey,
            display,
            isEdgeBottom: edge === 'bottom',
            layout: 'condense',
            onRemove,
            onSelect,
            showFocusRing,
            hideTooltip,
            selection,
            size,
            tabItemPrefix
        }
    };
}
//useCurrentKey use click capture that captures first click, which is on remove button
//when we remove and sets the item being removed to currentKey. So we should not allow
//this if click is on remove button
const extractOnlyItemKey = (element, itemSelector, itemEliminator) => {
    const tabBarItem = element.closest(itemSelector);
    if (tabBarItem) {
        if (tabBarItem.hasAttribute(REMOVABLE_ITEM_ATTRIBUTE)) {
            const removeButton = element.closest(itemEliminator);
            if (removeButton && tabBarItem?.contains(removeButton)) {
                return null;
            }
        }
        return collectionUtils.getKey(tabBarItem);
    }
    return null;
};
const findNextValidKey = (currentKey, currTabs, prevTabs) => {
    const index = prevTabs.indexOf(currentKey);
    // update current key to be the first one if currentKey is invalid
    if (index === -1) {
        return currTabs[0];
    }
    let nextIndex = 0;
    let isLastKey = false;
    if (index === prevTabs.length - 1) {
        nextIndex = index - 1;
        isLastKey = true;
    }
    else {
        nextIndex = index + 1;
    }
    while (nextIndex !== index && nextIndex > -1 && nextIndex < prevTabs.length) {
        const nextKey = prevTabs[nextIndex];
        if (currTabs.indexOf(nextKey) !== -1) {
            return nextKey;
        }
        isLastKey ? nextIndex-- : nextIndex++;
    }
    // update current key to be the first one if we can't find a suitable next key
    return currTabs[0];
};

exports.useTabBar = useTabBar;
//# sourceMappingURL=useTabBar-35edcdb1.js.map
