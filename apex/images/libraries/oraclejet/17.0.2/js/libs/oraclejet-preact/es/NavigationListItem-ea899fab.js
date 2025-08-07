/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useState, useCallback, useRef, useEffect } from 'preact/hooks';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useId } from './useId-03dbfdf0.js';
import { navigationListStyles } from './UNSAFE_NavigationList/themes/NavigationListStyles.css.js';
import { c as getPrevNextKeyUsingRef, k as keyExtractor, d as getFirstVisibleKey, b as getKey, f as findElementByKey } from './collectionUtils-d72c7c40.js';
import { u as useCollectionFocusRing } from './useCollectionFocusRing-d0c80397.js';
import { u as useCurrentKey } from './useCurrentKey-db7d3bb9.js';
import { forwardRef, useImperativeHandle } from 'preact/compat';
import { u as useTestId } from './useTestId-adde554c.js';
import './UNSAFE_Text/themes/TextStyles.css.js';
import { N as NavigationListContext, B as BaseNavigationListItem } from './BaseNavigationListItem-3a377d46.js';
import './Flex-24628925.js';
import './logger-c92f309c.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './UNSAFE_NavigationList/themes/NavigationListItemStyles.css.js';
import './UNSAFE_NavigationList/themes/redwood/NavigationListItemBaseTheme.styles.css';
import './UNSAFE_NavigationList/themes/redwood/NavigationListItemVariants.css.js';
import './LayerHost-45f545d7.js';

/*TODO: JET-58534. Create a hook to share some logic between navlist and tabbar. Hook will be used inside this one. */
function useNavigationList({ containerRef, selection, onRemove, onSelectionChange, children }) {
    const ITEM_SELECTOR = '[role="tab"]';
    const REMOVAL_ICON_SELECTOR = '[data-oj-navigationlist-item-remove-icon]';
    const [currentKey, setCurrentKey] = useState(selection);
    const onCurrentKeyChange = useCallback((detail) => {
        setCurrentKey(detail.value);
    }, []);
    const { currentKeyProps } = useCurrentKey((element) => onRemove
        ? extractOnlyItemKey(element, ITEM_SELECTOR, REMOVAL_ICON_SELECTOR)
        : keyExtractor(element, ITEM_SELECTOR), false, getPrevNextKeyUsingRef(containerRef, currentKey, true, ITEM_SELECTOR), getPrevNextKeyUsingRef(containerRef, currentKey, false, ITEM_SELECTOR), undefined, undefined, currentKey, onCurrentKeyChange);
    const [showFocusRing, focusRingProps] = useCollectionFocusRing(containerRef, [
        'Home',
        'End',
        'ArrowUp',
        'ArrowDown'
    ]);
    const onFocus = useCallback(() => {
        if (containerRef.current && currentKey === undefined) {
            const key = getFirstVisibleKey(containerRef.current, ITEM_SELECTOR);
            if (key) {
                setCurrentKey(key);
            }
        }
    }, [currentKey, containerRef]);
    const onFocusProps = { onFocus };
    const prevNavItems = useRef();
    useEffect(() => {
        if (containerRef.current) {
            const navListItemKeys = Array.from(containerRef.current.querySelectorAll(ITEM_SELECTOR), (elem) => getKey(elem));
            if (currentKey != null && navListItemKeys.indexOf(currentKey) !== -1) {
                const navListItem = findElementByKey(containerRef.current, currentKey, ITEM_SELECTOR);
                if (navListItem.scrollIntoViewIfNeeded) {
                    // for some browsers, we'll need the non-standard scrollIntoViewIfNeeded
                    navListItem.scrollIntoViewIfNeeded();
                }
                else {
                    navListItem.scrollIntoView({ block: 'nearest' });
                }
            }
            else {
                if (currentKey && navListItemKeys.indexOf(currentKey) === -1) {
                    prevNavItems.current
                        ? setCurrentKey(findNextCurrentKey(currentKey, navListItemKeys, prevNavItems.current))
                        : setCurrentKey(navListItemKeys[0]);
                }
                prevNavItems.current = navListItemKeys;
            }
        }
    }, [children, currentKey, containerRef]);
    const onKeyDown = useCallback((event) => {
        if ((event.key === 'Home' || event.key === 'End') && containerRef.current && currentKey) {
            const navListItemKey = Array.from(containerRef.current.querySelectorAll(ITEM_SELECTOR), (elem) => getKey(elem));
            onCurrentKeyChange?.({
                value: navListItemKey[event.key === 'Home' ? 0 : navListItemKey.length - 1]
            });
        }
        if (currentKey && event.key === 'Enter') {
            onSelectionChange?.({
                value: currentKey,
                reason: 'keyboard'
            });
        }
        if (currentKey && event.key === 'Delete') {
            onRemove?.({ value: currentKey });
        }
    }, [currentKey, onSelectionChange, onRemove, onCurrentKeyChange, containerRef]);
    return {
        showFocusRing,
        currentKey,
        onCurrentKeyChange,
        onKeyDown,
        containerHandlers: mergeProps(focusRingProps, currentKeyProps, onFocusProps)
    };
}
const extractOnlyItemKey = (element, itemSelector, itemEliminator) => {
    const navigationListItem = element.closest(itemSelector);
    const removeButton = element.closest(itemEliminator);
    return navigationListItem?.contains(removeButton) ? null : keyExtractor(element, itemSelector);
};
const findNextCurrentKey = (currentKey, currNavs, prevNavs) => {
    const index = prevNavs.indexOf(currentKey);
    if (index > 0) {
        const nextIndex = index === prevNavs.length - 1 ? index - 1 : index + 1;
        const nextKey = prevNavs[nextIndex];
        if (currNavs.indexOf(nextKey) !== -1) {
            return nextKey;
        }
    }
    // update current key to be the first one if we can't find a suitable next key
    return currNavs[0];
};

const NavigationList = forwardRef(({ children, selection, onSelectionChange, onRemove, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelLedBy, testId }, ref) => {
    const containerRef = useRef(null);
    const { showFocusRing, currentKey, onCurrentKeyChange, containerHandlers, onKeyDown } = useNavigationList({
        containerRef: containerRef,
        selection,
        onRemove,
        onSelectionChange,
        children
    });
    const eventProps = { onKeyDown };
    const navigationListClass = classNames([navigationListStyles.uListStyle]);
    const navigationListItemPrefix = useId() + '_';
    const testIdProps = useTestId(testId);
    //Allows to call focus on rootRef without having to expose it
    useImperativeHandle(ref, () => ({
        focus: () => {
            if (containerRef.current) {
                containerRef.current.focus();
            }
        },
        blur: () => {
            if (containerRef.current) {
                containerRef.current.focus();
            }
        }
    }));
    return (jsx("ul", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelLedBy, role: "tablist", ref: containerRef, "aria-orientation": 'vertical', tabIndex: 0, "aria-activedescendant": currentKey ? navigationListItemPrefix + currentKey : '', ...mergeProps(eventProps, containerHandlers), ...testIdProps, class: navigationListClass, children: jsx(NavigationListContext.Provider, { value: {
                selection,
                onSelectionChange,
                onCurrentKeyChange,
                currentKey,
                showFocusRing,
                navigationListItemPrefix,
                onRemove
            }, children: children }) }));
});

function NavigationListItem({ itemKey, label, badge, metadata, severity }) {
    return (jsx(BaseNavigationListItem, { itemKey: itemKey, label: label, badge: badge, metadata: metadata, severity: severity }));
}

export { NavigationList as N, NavigationListItem as a };
//# sourceMappingURL=NavigationListItem-ea899fab.js.map
