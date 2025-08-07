/* @oracle/oraclejet-preact: undefined */
import { useRef, useState, useEffect } from 'preact/hooks';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { b as getKey, c as getPrevNextKeyUsingRef, k as keyExtractor, f as findElementByKey, d as getFirstVisibleKey } from './collectionUtils-d72c7c40.js';
import { u as useCollectionFocusRing } from './useCollectionFocusRing-d0c80397.js';
import { u as useCurrentKey } from './useCurrentKey-db7d3bb9.js';
import { u as useId } from './useId-03dbfdf0.js';

const ITEM_SELECTOR = '[role="tab"]';
const REMOVABLE_ICON_SELECTOR = '[data-oj-tabbar-item-remove-icon="true"]';
const REMOVABLE_ITEM_ATTRIBUTE = 'data-oj-removable';
/**
 * Implements TabBar behavior for focus and keyboad handling
 */
function useTabBar(options) {
    const { children, class: className, display, edge = 'top', selection, onSelect, onRemove, ref: userRef, size } = options;
    const internalRef = useRef(null);
    const rootRef = userRef || internalRef;
    const tabId = useId();
    const [currentKey, setCurrentKey] = useState(selection);
    const [hideTooltip, setHideTooltip] = useState(false);
    const tabItemPrefix = tabId + '_';
    /**
     * A reference to the previous set of tab keys that this TabBar
     * contains before children were re-rendered. In the event the "current" tab
     * is removed and the "currentKey" reference is broken, we can redirect
     * the "currentKey" to another tab based on the index of the removed tab.
     */
    const prevTabKeys = useRef();
    useEffect(() => {
        if (rootRef.current) {
            const tabKeys = Array.from(rootRef.current.querySelectorAll(ITEM_SELECTOR)).map((elem) => getKey(elem));
            if (currentKey && !tabKeys.includes(currentKey)) {
                //If prevTabs does not exist set the first visible key as currentKey
                prevTabKeys.current
                    ? setCurrentKey(findNextValidKey(currentKey, tabKeys, prevTabKeys.current))
                    : setCurrentKey(tabKeys[0]);
            }
            prevTabKeys.current = tabKeys;
        }
    }, [children, currentKey, rootRef]);
    const [showFocusRing, focusRingProps] = useCollectionFocusRing(rootRef, [
        'ArrowRight',
        'ArrowLeft',
        'Home',
        'End'
    ]);
    const { currentKeyProps } = useCurrentKey((element) => onRemove
        ? extractOnlyItemKey(element, ITEM_SELECTOR, REMOVABLE_ICON_SELECTOR)
        : keyExtractor(element, ITEM_SELECTOR), false, undefined, undefined, getPrevNextKeyUsingRef(rootRef, currentKey, true, ITEM_SELECTOR), getPrevNextKeyUsingRef(rootRef, currentKey, false, ITEM_SELECTOR), currentKey, (detail) => {
        setCurrentKey(detail.value);
        setHideTooltip(false);
    });
    const onKeyDown = (event) => {
        if (rootRef.current && currentKey) {
            if (event.key === 'Home' || event.key === 'End') {
                const tabBarItemKey = Array.from(rootRef.current.querySelectorAll(ITEM_SELECTOR), (elem) => getKey(elem));
                event.preventDefault();
                setCurrentKey?.(tabBarItemKey[event.key === 'Home' ? 0 : tabBarItemKey.length - 1]);
            }
            if (event.key === 'Enter' || event.key === ' ') {
                event.preventDefault();
                onSelect?.({ value: currentKey });
            }
            if (event.key === 'Delete') {
                const tabBarItem = findElementByKey(rootRef.current, currentKey, ITEM_SELECTOR);
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
            const key = getFirstVisibleKey(rootRef.current, ITEM_SELECTOR);
            if (key) {
                setCurrentKey(key);
            }
        }
    };
    const eventProps = { onKeyDown, onFocus };
    return {
        rootProps: mergeProps({
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
        return getKey(tabBarItem);
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

export { useTabBar as u };
//# sourceMappingURL=useTabBar-8af19c50.js.map
