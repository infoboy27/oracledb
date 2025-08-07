/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var Floating = require('./Floating-1280c2ce.js');
var Layer = require('./Layer-3700cd37.js');
require('./LayerHost-46e4d858.js');
var hooks = require('preact/hooks');
var mergeProps = require('./mergeProps-e3da7237.js');
var classNames = require('./classNames-c14c6ef3.js');
var useUser = require('./useUser-a6d15333.js');
var MenuItem = require('./MenuItem-9a73694f.js');
var UNSAFE_Menu_themes_MenuStyles_css = require('./UNSAFE_Menu/themes/MenuStyles.css.js');
var useTestId = require('./useTestId-8234ec1e.js');
var UNSAFE_Menu_themes_DropdownMenuStyles_css = require('./UNSAFE_Menu/themes/DropdownMenuStyles.css.js');
var useOutsideMousedown = require('./useOutsideMousedown-a8c09ad9.js');
var Sheet = require('./Sheet-a6267b5f.js');
var Modal = require('./Modal-52fa4530.js');
var UNSAFE_Menu_themes_SheetMenuStyles_css = require('./UNSAFE_Menu/themes/SheetMenuStyles.css.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook for handling current key update due to user interaction including keyboard navigation.
 *
 * @param getPrev function to get the previous key based on the current key
 * @param getNext function to get the next key based on the current key
 * @param getFirstVisible function to get the key of the first available item
 * @param getLastVisible function to get the key of the last available item
 * @param onChange function to invoke if the current key has changed
 * @returns
 */
function useMenuCurrentKey(getPrev, getNext, getFirstVisible, getLastVisible, onChange) {
    const keyDownKeyFunctions = hooks.useMemo(() => {
        return {
            ArrowDown: getNext,
            ArrowUp: getPrev,
            Home: getFirstVisible,
            End: getLastVisible
        };
    }, [getNext, getPrev, getFirstVisible, getLastVisible]);
    const onKeyDown = hooks.useCallback((event) => {
        if (onChange) {
            // TODO: support horizontal layout on icon menu (left/right arrow key)
            const keyFunction = keyDownKeyFunctions[event.key];
            if (keyFunction && !event.shiftKey) {
                const key = keyFunction();
                if (key) {
                    onChange({ key, reason: 'keyboard' });
                }
                event.preventDefault();
            }
        }
    }, [onChange, keyDownKeyFunctions]);
    const currentKeyProps = onChange == null ? {} : { onKeyDown };
    return { currentKeyProps };
}

/*Component where general behavior is handled. Here we controled focus behavior, focus styling, submenu
opening behavior and current active item behavior. */
const MenuContainer = ({ children, 'aria-label': ariaLabel, currentFocus = 'menu', display, closeSubmenu, menuId, menuLevel, anchorRef }) => {
    const { onClose, testId } = MenuItem.useMenuContext();
    //Important to know direction so closeSubmenu is handled properly if needed.
    const { direction } = useUser.useUser();
    const menuContainerRef = hooks.useRef(null);
    /*We share same behavior as legacy menu on mouseLeave that is:
    1. If we mouse leave a menuItem but we still on menuContainer and we are not hovering any other menuItem, we keep
    the focus on the menuItem and hovering style.
    2. If we mouseLeave but next target is a submenu we open a submenu.
    3. If we mouseLeave the container and next target is not a submenu, we reset current key and set the focus on the
    menuContainer.If we mouseLeaved a submenuItem, submenu is closed.
    General information used by menuItems:
    -wasMouseMoved: Used to don't allow mouseEnter callbacks being triggered if mouse was not moved already.
    -lastMouseLeaveValidatedRelatedTarget: We use bubbling nature of events to first check/validate the related target in onMouseLeave events of
      menuItems. For menuItems we check if the related target is the menuContainer itself or a submenu. We validate there
      since at this level we don't have access to any submenu. Everytime mouseEnter triggers at menuContainer we have to compare if both
      relatedTargets are the same(menuContainer and last menuItem one), if not, this means mouse is now outside of the container.
    */
    const menuContainerGeneralInformation = hooks.useRef({
        wasMouseMoved: false,
        lastMouseLeaveMenuItemdRelatedTarget: null
    });
    //Key of the active element on this menu container
    const [currentKey, setCurrentKey] = hooks.useState();
    //State that represents if focused outline styles needs
    const [showFocusRing, setShowFocusRing] = hooks.useState(false);
    //Based on this we would include or not hovering styling. Same as legacy
    const [isContainerFocused, setIsContainerFocused] = hooks.useState(false);
    //Funtion triggered on blur. This is called since if focus is not anymore on the container we would need to do
    //some validation
    const blurFunction = () => {
        if (!menuContainerRef.current?.contains(document.activeElement)) {
            setShowFocusRing(false);
            setIsContainerFocused(false);
        }
    };
    const focusFunction = () => {
        setIsContainerFocused(true);
    };
    const mouseLeaveFunction = (e) => {
        //We have to validate if new hover target was already validated correctly, if not this means mouse is now outside container
        if (!e.relatedTarget ||
            !e.relatedTarget.isEqualNode(menuContainerGeneralInformation.current.lastMouseLeaveMenuItemdRelatedTarget)) {
            //We reset current key when mouse is outside the container or any submenu. This is how legacy menu works
            changeKey({
                key: undefined,
                reason: 'mouseEnter'
            });
            //We focus menuContainer so keyboard navigation can be still used
            menuContainerRef.current?.focus();
        }
    };
    //Function used to change the currentKey
    const changeKey = hooks.useCallback((detail) => {
        setCurrentKey(detail.key);
        if (detail.reason === 'keyboard') {
            setShowFocusRing(true);
        }
        else {
            setShowFocusRing(false);
        }
    }, []);
    //This is used since if mouse overlaps space when menu is rendered, menuItem could trigger menuEnter,
    // which is not desirable.Once mouse was moved inside container, we could trigger mouseEnter events normally.
    const selfDestructiveMouseMoveEvent = hooks.useCallback(() => {
        const handler = (e) => {
            const keyElem = MenuItem.keyElemExtractor(e.target);
            const key = keyElem?.key;
            const elem = keyElem?.elem;
            //We will trigger this event until a menuItem is found. Usually this don't take to much to happen
            if (key && elem) {
                menuContainerGeneralInformation.current.wasMouseMoved = true;
                const evt = new MouseEvent('mouseenter');
                elem.dispatchEvent(evt);
                menuContainerRef.current?.removeEventListener('mousemove', handler);
            }
        };
        menuContainerRef.current?.addEventListener('mousemove', handler);
    }, []);
    const { currentKeyProps } = useMenuCurrentKey(MenuItem.getPrevNext(menuContainerRef.current, true, currentKey), MenuItem.getPrevNext(menuContainerRef.current, false, currentKey), () => MenuItem.getNVisible(menuContainerRef.current, 0), () => MenuItem.getLastVisible(menuContainerRef.current), changeKey);
    hooks.useEffect(() => {
        const menuContainer = menuContainerRef.current;
        let timer;
        /*TODO: There are some cases where is not safe to focus since
        visibility initially is hidden at the Floating component at the initial render. Need a way to solve this in a
        less dirty way (we are now using timeouts). More details on the descripton of JET-57353 */
        if (currentFocus !== 'none' && menuContainer) {
            if (currentFocus === 'menu') {
                changeKey({ key: undefined, reason: 'click' });
                const focusMenuContainer = () => {
                    menuContainer.focus();
                };
                if (display === 'sheet') {
                    focusMenuContainer();
                }
                else {
                    // At this point floating has visibility set as hidden, so also menuContainer. Settimeout added so menuContainer
                    // is visible at that point and can be focused.
                    timer = setTimeout(() => {
                        focusMenuContainer();
                    }, FOCUS_SHIFT_TIMEOUT);
                }
            }
            else if (currentFocus === 'firstItem') {
                const firstItem = MenuItem.getNVisible(menuContainerRef.current, 0);
                if (firstItem) {
                    changeKey({ key: firstItem, reason: 'keyboard' });
                }
            }
            else if (currentFocus === 'secondItem') {
                //This is just used in sheet menu, so no need to set a timeout
                const item = MenuItem.getNVisible(menuContainerRef.current, 1);
                if (item) {
                    changeKey({ key: item, reason: 'keyboard' });
                }
            }
        }
        return () => {
            //We have to clean timers, because comp can be unmounted after finishing timeouts
            clearTimeout(timer);
        };
    }, [changeKey, currentFocus, menuLevel, display, anchorRef]); // Important to notice we look for a change on the ref object, not it's current value
    hooks.useEffect(() => {
        selfDestructiveMouseMoveEvent();
    }, [selfDestructiveMouseMoveEvent]);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { ...(menuId && { id: menuId }), ref: menuContainerRef, tabIndex: !currentKey && (menuLevel === 'main' || display === 'sheet') ? 0 : -1, role: "menu", "aria-label": ariaLabel, class: classNames.classNames([
            UNSAFE_Menu_themes_MenuStyles_css.menuStyles.menuContainerStyle,
            UNSAFE_Menu_themes_MenuStyles_css.menuStyles[`${display}MenuContainerStyle`]
        ]), ...mergeProps.mergeProps(currentKeyProps, MenuItem.getKeyboardCloseProps(onClose, menuLevel), MenuItem.getCloseSubmenuEvent(direction, closeSubmenu), MenuItem.getMenuContainerFocusMethods(blurFunction, focusFunction), MenuItem.getMenuContainerMouseLeave(mouseLeaveFunction), MenuItem.getMenuPointerDown()), ...testIdProps, children: jsxRuntime.jsx(MenuItem.MenuContainerContext.Provider, { value: {
                /*We use this ref on dropdownSubmenu since unhover only close the menu if menuContainer ref does not include
                the new element that receives the hovering */
                menuContainerRef,
                currentKey,
                showFocusRing,
                changeKey,
                menuContainerGeneralInformation,
                isContainerFocused
            }, children: children }) }));
};
//Temporal constant, will probably be removed with JET-57353
const FOCUS_SHIFT_TIMEOUT = 0;

//TODO: Start consuming PRIVATE_Dropdown. JET-53371
/*Component used to render a dropdown menu. For now this is just rendered when device is not a phone. */
const DropdownMenu = compat.forwardRef(({ anchorRef, defaultPlacement, offsetValue, closeSubmenu, children, 'aria-label': ariaLabel, currentFocus, menuId, menuLevel, flipOptions, isOpen }, ref) => {
    const floatingRef = compat.useRef(null);
    const { onClose } = MenuItem.useMenuContext();
    const useOutsideClickHandler = compat.useCallback((e) => {
        if (menuLevel === 'sub')
            return;
        // Outside click is not considered when menuItem was clicked
        const menuItemKey = MenuItem.keyElemExtractor(e.target)?.key;
        if (!menuItemKey) {
            onClose?.({ reason: 'outsideClick', target: e.target });
        }
    }, [onClose, menuLevel]);
    //This will be removed once we start using dropdown comp
    useOutsideMousedown.useOutsideMousedown({
        ref: [floatingRef],
        handler: useOutsideClickHandler,
        isDisabled: !isOpen
    });
    // TODO - Reuse a dropdown component instead of creating floating by ourselves.
    /*
    For this comment, we could divide menus in these categories:
    - Dropdown menus: "Attached" to an specific element.
    - Context menus: "Attached" to coords or an specific element.
    We are passing anchorRef as the logicalParent of the Layer used here, even if we pass coords. So we could say
    that we are passing an incorrect logicalParentRef for context menus. But, passing coords has no impacts either on
    accessibility or behavior since this logical parent is only used by legacy collections for dom searching to find
    dropdown menus. More information about that here: 
    This comment also applies for sheet menus that in this specific context(relation between logicalParentRef
    and menu) can be considered "dropdown menus"
    For now using type assertion is safe enough, but it's kind of a dirty solution. This is a point that can be included
    in near future conversation related to semantics of menus in favor of dividing dropdown and context menu:
    
    */
    return (jsxRuntime.jsx(jsxRuntime.Fragment, { children: isOpen ? (jsxRuntime.jsx(Layer.Layer, { logicalParentRef: anchorRef, children: jsxRuntime.jsx(Floating.Floating, { ref: floatingRef, class: UNSAFE_Menu_themes_DropdownMenuStyles_css.dropdownMenuStyles.base, anchorRef: anchorRef, flipOptions: flipOptions, shiftOptions: {
                    mainAxis: false,
                    crossAxis: false
                }, sizeOptions: { isMaxHeightAdjusted: true, isMaxWidthAdjusted: true }, 
                //TODO: JET-57950. Need to see how we set 24px boundary.
                //TODO: Boundaries need to match with the dropdowns used in other comps.  Also figure out how to make it themable.
                boundaryOptions: { padding: 0 }, placement: defaultPlacement, offsetValue: offsetValue, children: jsxRuntime.jsx("div", { 
                    //TODO: JET-60745. Add minWidth prop on menu
                    style: {
                        minWidth: MENU_MIN_WIDTH
                    }, ref: ref, children: jsxRuntime.jsx(MenuContainer, { menuLevel: menuLevel, closeSubmenu: closeSubmenu, "aria-label": ariaLabel, currentFocus: currentFocus, menuId: menuId, display: "dropdown", anchorRef: anchorRef, children: children }) }) }) })) : null }));
});
const MENU_MIN_WIDTH = 200;

const ModalWrapper = ({ children }) => (jsxRuntime.jsx("div", { class: UNSAFE_Menu_themes_SheetMenuStyles_css.sheetMenuStyles.modalWrapper, children: children }));
const ModalContainer = compat.forwardRef(({ children }, ref) => (jsxRuntime.jsx("div", { class: UNSAFE_Menu_themes_SheetMenuStyles_css.sheetMenuStyles.modalContainer, ref: ref, children: children })));
//ModalBackdrop on modal folder not setting the style on oj-c enviroment
//Creating it here so we don't see that issue
const ModalBackdrop = ({ backdropVisible = false }) => (jsxRuntime.jsx("div", { class: classNames.classNames([
        UNSAFE_Menu_themes_SheetMenuStyles_css.sheetMenuStyles.modalBackdrop,
        backdropVisible && UNSAFE_Menu_themes_SheetMenuStyles_css.sheetMenuStyles.modalBackdropVisible
    ]) }));
//TODO: Start consuming PRIVATE_Sheet. JET-56072
const SheetMenu = ({ children, 'aria-label': ariaLabel, currentFocus, anchorRef, closeSubmenu, menuLevel }) => {
    const { onClose } = MenuItem.useMenuContext();
    hooks.useEffect(() => {
        // We set the overflow body as hidden when mounted and revert to original overflow value when is
        // unmounted. This is done to don't allow backgound being scrolled
        // This will be handled by modal/popup when ready
        const initialOverflow = document.body.style.overflow;
        document.body.style.overflow = 'hidden';
        return () => {
            document.body.style.overflow = initialOverflow;
        };
    }, []);
    const dismissHandler = hooks.useCallback(() => {
        onClose?.({ reason: 'dismissed' });
    }, [onClose]);
    const { backdropRef } = Modal.useModal({ isOpen: true, onBackdropClick: dismissHandler });
    //TODO: Use useSwipe when it works on components that could scroll.
    const { swipeProps } = Sheet.useSheetSwipe(dismissHandler);
    // TODO: For now we are mimicking current modal but using a "different position setting" (using absolute positioning instead of flex).
    // Have to use modal/popup component directly instead doing this composition when that component could satisfy our requirments.
    return (jsxRuntime.jsx(Layer.Layer, { logicalParentRef: anchorRef, children: jsxRuntime.jsxs(ModalWrapper, { children: [jsxRuntime.jsx(ModalBackdrop, { backdropVisible: menuLevel === 'main' }), jsxRuntime.jsx(ModalContainer, { ref: backdropRef, children: jsxRuntime.jsx("div", { class: UNSAFE_Menu_themes_SheetMenuStyles_css.sheetMenuStyles.sheetMenuContainerWrapper, ...swipeProps, children: jsxRuntime.jsx(MenuContainer, { "aria-label": ariaLabel, currentFocus: currentFocus, display: "sheet", closeSubmenu: closeSubmenu, menuLevel: menuLevel, children: children }) }) })] }) }));
};

const isMobile = MenuItem.getIsMobile();
// TODO: For context menu case anchorRef is changed typically when trying to opening menu in other place
// menu initialFocus prop should react also when anchorRef is changed not just when isOpen is changed to true.
/* Component that is exposed to final user to create a menu. Important to notice that this component is just used by
the final user to express a main menu. It's not reused by us for submenus (we use SheetMenu and DropdownMenu directly there) */
const Menu = ({ onClose, isOpen, testId, initialFocus = 'menu', placement = 'bottom-start', offsetValue = 4, ...menuProps }) => {
    //On close is consumed by the whole menu structure including the main menu and submenu ones.
    return (jsxRuntime.jsx(MenuItem.MenuContext.Provider, { value: { onClose, isMobile, testId }, children: jsxRuntime.jsx(jsxRuntime.Fragment, { children: isMobile ? (jsxRuntime.jsx(jsxRuntime.Fragment, { children: isOpen ? (jsxRuntime.jsx(SheetMenu, { ...menuProps, currentFocus: initialFocus, menuLevel: "main" })) : null })) : (jsxRuntime.jsx(DropdownMenu, { ...menuProps, isOpen: isOpen, currentFocus: initialFocus, menuLevel: "main", defaultPlacement: placement, offsetValue: offsetValue, flipOptions: {
                    crossAxis: true,
                    mainAxis: true,
                    fallbackPlacements: [
                        'bottom-start',
                        'bottom-end',
                        'top-start',
                        'top-end',
                        'end-top',
                        'start-top',
                        'end-bottom',
                        'start-bottom'
                    ]
                } })) }) }));
};

exports.DropdownMenu = DropdownMenu;
exports.Menu = Menu;
exports.SheetMenu = SheetMenu;
//# sourceMappingURL=Menu-7f8ca235.js.map
