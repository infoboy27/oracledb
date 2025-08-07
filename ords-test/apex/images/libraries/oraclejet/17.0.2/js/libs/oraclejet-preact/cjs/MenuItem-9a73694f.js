/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Text = require('./Text-aaacb6a0.js');
var classNames = require('./classNames-c14c6ef3.js');
var useId = require('./useId-6c0eeb27.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var usePress = require('./usePress-00deca01.js');
var useUser = require('./useUser-a6d15333.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var useInteractionStyle = require('./useInteractionStyle-442c6a12.js');
var preact = require('preact');
var compat = require('preact/compat');
var clientHints = require('./clientHints-9e411b6e.js');
var useToggle = require('./useToggle-3ebba7d8.js');
var UNSAFE_Menu_themes_redwood_MenuItemTheme = require('./UNSAFE_Menu/themes/redwood/MenuItemTheme.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the key from the item element
 */
const getKey = (item) => {
    // Key is set on data-oj-menu-item-key on each menuItem. To get this key from the
    // the actual menuItem we need to do a kebab to camel-case conversion.
    return item.dataset['ojMenuItemKey'];
};
/**
 * A helper function that return the key of the n available item.
 */
const getNVisible = (root, positionIndex) => {
    if (root) {
        const items = root.querySelectorAll('[data-oj-menu-item-key]');
        const positionedItem = items[positionIndex];
        if (positionedItem) {
            const key = getKey(positionedItem);
            if (key) {
                return key;
            }
        }
    }
    return null;
};
/**
 * A helper function that return the key of the last available item.
 */
const getLastVisible = (root) => {
    if (root) {
        const items = root.querySelectorAll('[data-oj-menu-item-key]');
        const lastItem = items[items.length - 1];
        if (lastItem) {
            const key = getKey(lastItem);
            if (key) {
                return key;
            }
        }
    }
    return null;
};
/**
 * A helper function that returns the key of the previous or the next item
 * given the specified current key
 */
const getPrevNext = (root, isPrev, currentKey) => {
    return () => {
        if (root) {
            const items = Array.from(root.querySelectorAll('[data-oj-menu-item-key]'));
            const currentKeyIndex = items.findIndex((item) => getKey(item) === currentKey);
            let nextIndex = currentKeyIndex + (isPrev ? -1 : 1);
            const itemsLastIndex = items.length - 1;
            if (nextIndex < 0) {
                nextIndex = itemsLastIndex;
            }
            if (nextIndex > itemsLastIndex) {
                nextIndex = 0;
            }
            const key = getKey(items[nextIndex]);
            return key ? key : null;
        }
        return null;
    };
};
/**
 * A helper function to get the key from an element
 */
const keyElemExtractor = (element) => {
    const elem = element.closest('[data-oj-menu-item-key]');
    if (elem) {
        const key = getKey(elem);
        return key === undefined ? null : { key, elem };
    }
    return null;
};
/**
 * Function to get the corresponding keyboard behavior to close the menu.
 */
const getKeyboardCloseProps = (onClose, menuLevel) => {
    const onKeyDown = (event) => {
        if (event.key === 'Tab') {
            event.stopPropagation();
            onClose?.({ reason: 'dismissed' });
            event.preventDefault(); //TODO: Revisit this since we should let focus be at its natural flow, quick solution for now to focus correct item in main use case
        }
        else if (event.key === 'Escape' && menuLevel === 'main') {
            event.stopPropagation();
            onClose?.({ reason: 'dismissed' });
        }
    };
    return { onKeyDown };
};
/**
 * Function to get the corresponding specific behavior for closing submenu via keyboard
 */
const getCloseSubmenuEvent = (direction, closeSubmenu) => {
    if (!closeSubmenu) {
        return {};
    }
    const onKeyDown = (e) => {
        if (e.key === 'Escape' ||
            (direction === 'ltr' && e.key === 'ArrowLeft') ||
            (direction === 'rtl' && e.key === 'ArrowRight')) {
            e.stopPropagation();
            closeSubmenu?.();
        }
    };
    return { onKeyDown };
};
/**
 * Function to get the corresponding specific behavior for opening submenu via keyboard
 */
const getOpenSubmenuEvent = (direction, openSubmenu) => {
    if (!openSubmenu) {
        return {};
    }
    const onKeyDown = (e) => {
        if (direction === 'ltr') {
            if (e.key === 'ArrowRight') {
                openSubmenu?.();
            }
        }
        else {
            if (e.key === 'ArrowLeft') {
                openSubmenu?.();
            }
        }
    };
    return { onKeyDown };
};
/**
 * Function to get type of device
 */
const getIsMobile = () => {
    const { deviceType } = clientHints.getClientHints();
    return deviceType === 'phone';
};
/**
 * Get blur and focus events
 */
const getMenuContainerFocusMethods = (blurFunction, focusFunction) => {
    const onBlur = () => {
        setTimeout(() => {
            blurFunction();
        }, 100);
    };
    const onFocus = () => {
        focusFunction();
    };
    return { onBlur, onFocus };
};
/**
 * Set currentKey based on clicking menuItem
 */
const getMenuItemClickChangeKey = (key, changeKeyMethod) => {
    const onClick = () => {
        changeKeyMethod({ key, reason: 'click' });
    };
    return { onClick };
};
const getMenuContainerMouseLeave = (mouseLeaveFunction) => {
    const onMouseLeave = (e) => {
        mouseLeaveFunction(e);
    };
    return { onMouseLeave };
};
/**
 * Function to get the corresponding specific behavior for clicking/touching down menuContainer
 */
const getMenuPointerDown = () => {
    const onPointerDown = (event) => {
        //We just want to prevent default when element that was
        //pressed down was not a menu item.
        const keyElem = keyElemExtractor(event.target);
        if (!keyElem?.key) {
            event.preventDefault();
        }
    };
    return { onPointerDown };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Context used to pass menu information without having to pass it to menu children props.
 * We want to communicate information down to any interested menu item children.
 */
const MenuContext = preact.createContext({
    isMobile: false,
    onClose: () => null,
    testId: ''
});

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the MenuContext
 *
 * @returns The value of MenuContext provider
 */
function useMenuContext() {
    return hooks.useContext(MenuContext);
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Context used to pass menu information without having to pass it to menu children MenuContainerContextprops.
 * We want to communicate information down to any interested menu item children.
 */
const MenuContainerContext = preact.createContext({
    menuContainerRef: { current: null },
    currentKey: undefined,
    showFocusRing: false,
    changeKey: () => { },
    isContainerFocused: false,
    menuContainerGeneralInformation: {
        current: {
            wasMouseMoved: false,
            lastMouseLeaveMenuItemdRelatedTarget: null
        }
    }
});

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the MenuContainerContext
 *
 * @returns The value of MenuContainerContext provider
 */
function useMenuContainerContext() {
    return hooks.useContext(MenuContainerContext);
}

/**
 * Returns listeners and status for hover
 *
 *
 * @returns
 */
function useSubmenuItemHover(settings) {
    const { bool: ignore, setTrue: setIgnoreTrue, setFalse: setIgnoreFalse } = useToggle.useToggle(false);
    const startHover = (e) => {
        if (ignore) {
            setIgnoreFalse();
        }
        else {
            settings.onMouseEnter(e);
        }
    };
    const hoverProps = {
        ontouchend: setIgnoreTrue,
        onMouseEnter: startHover,
        onMouseLeave: (e) => {
            settings.onMouseLeave(e);
        }
    };
    return {
        hoverProps: hoverProps
    };
}

function MenuItem(props) {
    const uniqueID = useId.useId();
    const id = hooks.useMemo(() => `oj-menu-item-${uniqueID}`, [uniqueID]);
    return jsxRuntime.jsx(BaseMenuItem, { ...props, role: "menuitem", type: "simple", id: id });
}
//TODO: We have to comeback to this and see if we create new components to represent different types on menuItems
//instead of using type prop. It also includes a new definition on prop types. This also includes the exposing of id
//that is used by submenus. JET-57191
const BaseMenuItem = compat.forwardRef(({ id, label, onAction, startIcon, endIcon, role, isChecked, isDisabled = false, variant = 'standard', type, hoverInfo, openSubmenu, menuItemLabelWeight = 'normal', isSubmenuOpen, submenuId, submenuRef }, ref) => {
    const { onClose } = useMenuContext();
    const { currentKey, changeKey, showFocusRing, menuContainerRef, menuContainerGeneralInformation, isContainerFocused } = useMenuContainerContext();
    const menuItemRef = hooks.useRef(null);
    const { direction } = useUser.useUser();
    const isCurrent = currentKey === id;
    const handleItemSelection = hooks.useCallback((e) => {
        //We don't want to close the menu if the element is a submenu one
        if (type !== 'submenu') {
            onClose?.({ reason: 'itemAction' });
        }
        onAction?.(e);
    }, [type, onClose, onAction]);
    /*This hook is not used to just know is something is hover or not. Actual callbacks are run when mouse enter
    or leave the menu item (to focus items when hovering and open submenus if the item is a submenu).  We don't use
    useInteractionStyle hook for hovering since "hovering style" is more of a "focus" style in this context */
    const { hoverProps } = useSubmenuItemHover({
        onMouseEnter: (e) => {
            if (!(hoverInfo?.hoverStatus.current.recentClose ||
                hoverInfo?.hoverStatus.current.pendingUnhover)) {
                if (hoverInfo && menuContainerGeneralInformation.current.wasMouseMoved) {
                    hoverInfo.hoverStatus.current.pendingUnhover = true;
                }
                // Mouse needs to be already moved to trigger mouse enter event
                if (menuContainerGeneralInformation.current.wasMouseMoved) {
                    hoverInfo?.hoverProps['onMouseEnter'](e);
                    changeKey({
                        key: id,
                        reason: 'mouseEnter'
                    });
                }
            }
        },
        onMouseLeave: (e) => {
            if (hoverInfo) {
                hoverInfo.hoverStatus.current.pendingUnhover = false;
            }
            //We check if new hover element is part of the menuContainer or submenu is there is one
            if (menuContainerRef.current?.contains(e.relatedTarget) ||
                submenuRef?.current?.contains(e.relatedTarget)) {
                menuContainerGeneralInformation.current.lastMouseLeaveMenuItemdRelatedTarget =
                    e.relatedTarget;
            }
        }
    });
    const { pressProps } = usePress.usePress(handleItemSelection, { isDisabled });
    hooks.useLayoutEffect(() => {
        if (isCurrent) {
            menuItemRef.current?.focus();
        }
    }, [isCurrent]);
    const { interactionProps } = useInteractionStyle.useInteractionStyle(isDisabled);
    const { classes: menuItemContainerClasses, styles: { iconLabelContainer, iconContainer, startIconContainer, labelContainer, endIconContainer } } = useComponentTheme.useComponentTheme(UNSAFE_Menu_themes_redwood_MenuItemTheme.MenuItemRedwoodTheme, {
        current: isCurrent ? 'isCurrent' : 'notCurrent',
        focusRing: showFocusRing ? 'isFocusRing' : 'notFocusRing',
        variant: isDisabled ? 'disabled' : variant,
        containerFocused: isContainerFocused ? 'isContainerFocused' : 'notContainerFocused',
        submenuOpen: !!isSubmenuOpen ? 'isSubmenuOpen' : 'notSubmenuOpen'
    });
    const flexItemStyleInterpolations = mergeInterpolations.mergeInterpolations([
        ...Object.values(flexitem.flexitemInterpolations)
    ]);
    const { class: labelContainerFlexItemClasses, ...labelContainerFlexItemStyles } = flexItemStyleInterpolations({
        flex: '1 1 auto',
        alignSelf: 'center'
    });
    const { class: iconContainerFlexItemClasses, ...iconContainerFlexItemStyles } = flexItemStyleInterpolations({
        flex: '0 0 auto',
        alignSelf: 'center'
    });
    const startIconContainerClasses = classNames.classNames([
        iconContainerFlexItemClasses,
        iconLabelContainer,
        iconContainer,
        startIconContainer
    ]);
    const labelContainerClasses = classNames.classNames([
        labelContainerFlexItemClasses,
        iconLabelContainer,
        labelContainer
    ]);
    const endIconContainerClasses = classNames.classNames([
        iconContainerFlexItemClasses,
        iconLabelContainer,
        iconContainer,
        endIconContainer
    ]);
    return (jsxRuntime.jsx("div", { role: "presentation", ...(submenuId !== undefined && type === 'submenu' && { 'aria-owns': submenuId }), children: jsxRuntime.jsxs("a", { ref: (node) => {
                menuItemRef.current = node;
                if (typeof ref === 'function') {
                    ref(node);
                }
                else if (ref) {
                    ref.current = node;
                }
            }, class: menuItemContainerClasses, ...mergeProps.mergeProps(interactionProps, hoverProps, pressProps, getOpenSubmenuEvent(direction, openSubmenu), getMenuItemClickChangeKey(id, changeKey)), role: role, "data-oj-menu-item-key": id, ...(type === 'submenu' && { 'aria-haspopup': true, 'aria-expanded': !!isSubmenuOpen }), ...(isDisabled && { 'aria-disabled': true }), ...(type === 'select' && { 'aria-checked': !!isChecked }), tabIndex: isCurrent ? 0 : -1, children: [startIcon && (jsxRuntime.jsx("span", { style: iconContainerFlexItemStyles, class: startIconContainerClasses, children: startIcon })), jsxRuntime.jsx("span", { style: labelContainerFlexItemStyles, class: labelContainerClasses, children: jsxRuntime.jsx(Text.Text, { variant: "inherit", size: "md", weight: menuItemLabelWeight, children: label }) }), endIcon && (jsxRuntime.jsx("span", { style: iconContainerFlexItemStyles, class: endIconContainerClasses, children: endIcon }))] }) }));
});

exports.BaseMenuItem = BaseMenuItem;
exports.MenuContainerContext = MenuContainerContext;
exports.MenuContext = MenuContext;
exports.MenuItem = MenuItem;
exports.getCloseSubmenuEvent = getCloseSubmenuEvent;
exports.getIsMobile = getIsMobile;
exports.getKeyboardCloseProps = getKeyboardCloseProps;
exports.getLastVisible = getLastVisible;
exports.getMenuContainerFocusMethods = getMenuContainerFocusMethods;
exports.getMenuContainerMouseLeave = getMenuContainerMouseLeave;
exports.getMenuPointerDown = getMenuPointerDown;
exports.getNVisible = getNVisible;
exports.getPrevNext = getPrevNext;
exports.keyElemExtractor = keyElemExtractor;
exports.useMenuContainerContext = useMenuContainerContext;
exports.useMenuContext = useMenuContext;
//# sourceMappingURL=MenuItem-9a73694f.js.map
