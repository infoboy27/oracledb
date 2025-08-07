/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var mergeProps = require('./mergeProps-e3da7237.js');
var classNames = require('./classNames-c14c6ef3.js');
var useId = require('./useId-6c0eeb27.js');
var UNSAFE_NavigationList_themes_NavigationListStyles_css = require('./UNSAFE_NavigationList/themes/NavigationListStyles.css.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
var useCollectionFocusRing = require('./useCollectionFocusRing-ca37785b.js');
var useCurrentKey = require('./useCurrentKey-3b4c8a44.js');
var compat = require('preact/compat');
var useTestId = require('./useTestId-8234ec1e.js');
var useNavigationListItem = require('./useNavigationListItem-74009187.js');

/*TODO: JET-58534. Create a hook to share some logic between navlist and tabbar. Hook will be used inside this one. */
function useNavigationList({ containerRef, selection, onRemove, onSelectionChange, children }) {
    const ITEM_SELECTOR = '[role="tab"]';
    const REMOVAL_ICON_SELECTOR = '[data-oj-navigationlist-item-remove-icon]';
    const [currentKey, setCurrentKey] = hooks.useState(selection);
    const onCurrentKeyChange = hooks.useCallback((detail) => {
        setCurrentKey(detail.value);
    }, []);
    const { currentKeyProps } = useCurrentKey.useCurrentKey((element) => onRemove
        ? extractOnlyItemKey(element, ITEM_SELECTOR, REMOVAL_ICON_SELECTOR)
        : collectionUtils.keyExtractor(element, ITEM_SELECTOR), false, collectionUtils.getPrevNextKeyUsingRef(containerRef, currentKey, true, ITEM_SELECTOR), collectionUtils.getPrevNextKeyUsingRef(containerRef, currentKey, false, ITEM_SELECTOR), undefined, undefined, currentKey, onCurrentKeyChange);
    const [showFocusRing, focusRingProps] = useCollectionFocusRing.useCollectionFocusRing(containerRef, [
        'Home',
        'End',
        'ArrowUp',
        'ArrowDown'
    ]);
    const onFocus = hooks.useCallback(() => {
        if (containerRef.current && currentKey === undefined) {
            const key = collectionUtils.getFirstVisibleKey(containerRef.current, ITEM_SELECTOR);
            if (key) {
                setCurrentKey(key);
            }
        }
    }, [currentKey, containerRef]);
    const onFocusProps = { onFocus };
    const prevNavItems = hooks.useRef();
    hooks.useEffect(() => {
        if (containerRef.current) {
            const navListItemKeys = Array.from(containerRef.current.querySelectorAll(ITEM_SELECTOR), (elem) => collectionUtils.getKey(elem));
            if (currentKey != null && navListItemKeys.indexOf(currentKey) !== -1) {
                const navListItem = collectionUtils.findElementByKey(containerRef.current, currentKey, ITEM_SELECTOR);
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
    const onKeyDown = hooks.useCallback((event) => {
        if ((event.key === 'Home' || event.key === 'End') && containerRef.current && currentKey) {
            const navListItemKey = Array.from(containerRef.current.querySelectorAll(ITEM_SELECTOR), (elem) => collectionUtils.getKey(elem));
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
        containerHandlers: mergeProps.mergeProps(focusRingProps, currentKeyProps, onFocusProps)
    };
}
const extractOnlyItemKey = (element, itemSelector, itemEliminator) => {
    const navigationListItem = element.closest(itemSelector);
    const removeButton = element.closest(itemEliminator);
    return navigationListItem?.contains(removeButton) ? null : collectionUtils.keyExtractor(element, itemSelector);
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

const NavigationList = compat.forwardRef(({ children, selection, onSelectionChange, onRemove, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelLedBy, testId }, ref) => {
    const containerRef = hooks.useRef(null);
    const { showFocusRing, currentKey, onCurrentKeyChange, containerHandlers, onKeyDown } = useNavigationList({
        containerRef: containerRef,
        selection,
        onRemove,
        onSelectionChange,
        children
    });
    const eventProps = { onKeyDown };
    const navigationListClass = classNames.classNames([UNSAFE_NavigationList_themes_NavigationListStyles_css.navigationListStyles.uListStyle]);
    const navigationListItemPrefix = useId.useId() + '_';
    const testIdProps = useTestId.useTestId(testId);
    //Allows to call focus on rootRef without having to expose it
    compat.useImperativeHandle(ref, () => ({
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
    return (jsxRuntime.jsx("ul", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelLedBy, role: "tablist", ref: containerRef, "aria-orientation": 'vertical', tabIndex: 0, "aria-activedescendant": currentKey ? navigationListItemPrefix + currentKey : '', ...mergeProps.mergeProps(eventProps, containerHandlers), ...testIdProps, class: navigationListClass, children: jsxRuntime.jsx(useNavigationListItem.NavigationListContext.Provider, { value: {
                selection,
                onSelectionChange,
                onCurrentKeyChange,
                currentKey,
                showFocusRing,
                navigationListItemPrefix,
                onRemove
            }, children: children }) }));
});

exports.NavigationList = NavigationList;
//# sourceMappingURL=NavigationList-5218562e.js.map
