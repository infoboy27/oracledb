/* @oracle/oraclejet-preact: undefined */
import { jsx, Fragment, jsxs } from 'preact/jsx-runtime';
import { forwardRef, useRef as useRef$1, useCallback as useCallback$1 } from 'preact/compat';
import { F as Floating } from './Floating-9703160e.js';
import { L as Layer } from './Layer-9b06412e.js';
import './LayerHost-45f545d7.js';
import { useMemo, useCallback, useRef, useState, useEffect } from 'preact/hooks';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useUser } from './useUser-99920e02.js';
import { u as useMenuContext, g as getPrevNext, a as getNVisible, b as getMenuPointerDown, c as getMenuContainerMouseLeave, d as getMenuContainerFocusMethods, e as getCloseSubmenuEvent, f as getKeyboardCloseProps, M as MenuContainerContext, k as keyElemExtractor, h as getLastVisible, i as getIsMobile, j as MenuContext } from './MenuItem-a8f9c954.js';
import { menuStyles } from './UNSAFE_Menu/themes/MenuStyles.css.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { dropdownMenuStyles } from './UNSAFE_Menu/themes/DropdownMenuStyles.css.js';
import { u as useOutsideMousedown } from './useOutsideMousedown-7307de8b.js';
import { u as useSheetSwipe } from './Sheet-e4121f4a.js';
import { u as useModal } from './Modal-6b11d8cb.js';
import { sheetMenuStyles } from './UNSAFE_Menu/themes/SheetMenuStyles.css.js';

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
    const keyDownKeyFunctions = useMemo(() => {
        return {
            ArrowDown: getNext,
            ArrowUp: getPrev,
            Home: getFirstVisible,
            End: getLastVisible
        };
    }, [getNext, getPrev, getFirstVisible, getLastVisible]);
    const onKeyDown = useCallback((event) => {
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
    const { onClose, testId } = useMenuContext();
    //Important to know direction so closeSubmenu is handled properly if needed.
    const { direction } = useUser();
    const menuContainerRef = useRef(null);
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
    const menuContainerGeneralInformation = useRef({
        wasMouseMoved: false,
        lastMouseLeaveMenuItemdRelatedTarget: null
    });
    //Key of the active element on this menu container
    const [currentKey, setCurrentKey] = useState();
    //State that represents if focused outline styles needs
    const [showFocusRing, setShowFocusRing] = useState(false);
    //Based on this we would include or not hovering styling. Same as legacy
    const [isContainerFocused, setIsContainerFocused] = useState(false);
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
    const changeKey = useCallback((detail) => {
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
    const selfDestructiveMouseMoveEvent = useCallback(() => {
        const handler = (e) => {
            const keyElem = keyElemExtractor(e.target);
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
    const { currentKeyProps } = useMenuCurrentKey(getPrevNext(menuContainerRef.current, true, currentKey), getPrevNext(menuContainerRef.current, false, currentKey), () => getNVisible(menuContainerRef.current, 0), () => getLastVisible(menuContainerRef.current), changeKey);
    useEffect(() => {
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
                const firstItem = getNVisible(menuContainerRef.current, 0);
                if (firstItem) {
                    changeKey({ key: firstItem, reason: 'keyboard' });
                }
            }
            else if (currentFocus === 'secondItem') {
                //This is just used in sheet menu, so no need to set a timeout
                const item = getNVisible(menuContainerRef.current, 1);
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
    useEffect(() => {
        selfDestructiveMouseMoveEvent();
    }, [selfDestructiveMouseMoveEvent]);
    const testIdProps = useTestId(testId);
    return (jsx("div", { ...(menuId && { id: menuId }), ref: menuContainerRef, tabIndex: !currentKey && (menuLevel === 'main' || display === 'sheet') ? 0 : -1, role: "menu", "aria-label": ariaLabel, class: classNames([
            menuStyles.menuContainerStyle,
            menuStyles[`${display}MenuContainerStyle`]
        ]), ...mergeProps(currentKeyProps, getKeyboardCloseProps(onClose, menuLevel), getCloseSubmenuEvent(direction, closeSubmenu), getMenuContainerFocusMethods(blurFunction, focusFunction), getMenuContainerMouseLeave(mouseLeaveFunction), getMenuPointerDown()), ...testIdProps, children: jsx(MenuContainerContext.Provider, { value: {
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
const DropdownMenu = forwardRef(({ anchorRef, defaultPlacement, offsetValue, closeSubmenu, children, 'aria-label': ariaLabel, currentFocus, menuId, menuLevel, flipOptions, isOpen }, ref) => {
    const floatingRef = useRef$1(null);
    const { onClose } = useMenuContext();
    const useOutsideClickHandler = useCallback$1((e) => {
        if (menuLevel === 'sub')
            return;
        // Outside click is not considered when menuItem was clicked
        const menuItemKey = keyElemExtractor(e.target)?.key;
        if (!menuItemKey) {
            onClose?.({ reason: 'outsideClick', target: e.target });
        }
    }, [onClose, menuLevel]);
    //This will be removed once we start using dropdown comp
    useOutsideMousedown({
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
    return (jsx(Fragment, { children: isOpen ? (jsx(Layer, { logicalParentRef: anchorRef, children: jsx(Floating, { ref: floatingRef, class: dropdownMenuStyles.base, anchorRef: anchorRef, flipOptions: flipOptions, shiftOptions: {
                    mainAxis: false,
                    crossAxis: false
                }, sizeOptions: { isMaxHeightAdjusted: true, isMaxWidthAdjusted: true }, 
                //TODO: JET-57950. Need to see how we set 24px boundary.
                //TODO: Boundaries need to match with the dropdowns used in other comps.  Also figure out how to make it themable.
                boundaryOptions: { padding: 0 }, placement: defaultPlacement, offsetValue: offsetValue, children: jsx("div", { 
                    //TODO: JET-60745. Add minWidth prop on menu
                    style: {
                        minWidth: MENU_MIN_WIDTH
                    }, ref: ref, children: jsx(MenuContainer, { menuLevel: menuLevel, closeSubmenu: closeSubmenu, "aria-label": ariaLabel, currentFocus: currentFocus, menuId: menuId, display: "dropdown", anchorRef: anchorRef, children: children }) }) }) })) : null }));
});
const MENU_MIN_WIDTH = 200;

const ModalWrapper = ({ children }) => (jsx("div", { class: sheetMenuStyles.modalWrapper, children: children }));
const ModalContainer = forwardRef(({ children }, ref) => (jsx("div", { class: sheetMenuStyles.modalContainer, ref: ref, children: children })));
//ModalBackdrop on modal folder not setting the style on oj-c enviroment
//Creating it here so we don't see that issue
const ModalBackdrop = ({ backdropVisible = false }) => (jsx("div", { class: classNames([
        sheetMenuStyles.modalBackdrop,
        backdropVisible && sheetMenuStyles.modalBackdropVisible
    ]) }));
//TODO: Start consuming PRIVATE_Sheet. JET-56072
const SheetMenu = ({ children, 'aria-label': ariaLabel, currentFocus, anchorRef, closeSubmenu, menuLevel }) => {
    const { onClose } = useMenuContext();
    useEffect(() => {
        // We set the overflow body as hidden when mounted and revert to original overflow value when is
        // unmounted. This is done to don't allow backgound being scrolled
        // This will be handled by modal/popup when ready
        const initialOverflow = document.body.style.overflow;
        document.body.style.overflow = 'hidden';
        return () => {
            document.body.style.overflow = initialOverflow;
        };
    }, []);
    const dismissHandler = useCallback(() => {
        onClose?.({ reason: 'dismissed' });
    }, [onClose]);
    const { backdropRef } = useModal({ isOpen: true, onBackdropClick: dismissHandler });
    //TODO: Use useSwipe when it works on components that could scroll.
    const { swipeProps } = useSheetSwipe(dismissHandler);
    // TODO: For now we are mimicking current modal but using a "different position setting" (using absolute positioning instead of flex).
    // Have to use modal/popup component directly instead doing this composition when that component could satisfy our requirments.
    return (jsx(Layer, { logicalParentRef: anchorRef, children: jsxs(ModalWrapper, { children: [jsx(ModalBackdrop, { backdropVisible: menuLevel === 'main' }), jsx(ModalContainer, { ref: backdropRef, children: jsx("div", { class: sheetMenuStyles.sheetMenuContainerWrapper, ...swipeProps, children: jsx(MenuContainer, { "aria-label": ariaLabel, currentFocus: currentFocus, display: "sheet", closeSubmenu: closeSubmenu, menuLevel: menuLevel, children: children }) }) })] }) }));
};

const isMobile = getIsMobile();
// TODO: For context menu case anchorRef is changed typically when trying to opening menu in other place
// menu initialFocus prop should react also when anchorRef is changed not just when isOpen is changed to true.
/* Component that is exposed to final user to create a menu. Important to notice that this component is just used by
the final user to express a main menu. It's not reused by us for submenus (we use SheetMenu and DropdownMenu directly there) */
const Menu = ({ onClose, isOpen, testId, initialFocus = 'menu', placement = 'bottom-start', offsetValue = 4, ...menuProps }) => {
    //On close is consumed by the whole menu structure including the main menu and submenu ones.
    return (jsx(MenuContext.Provider, { value: { onClose, isMobile, testId }, children: jsx(Fragment, { children: isMobile ? (jsx(Fragment, { children: isOpen ? (jsx(SheetMenu, { ...menuProps, currentFocus: initialFocus, menuLevel: "main" })) : null })) : (jsx(DropdownMenu, { ...menuProps, isOpen: isOpen, currentFocus: initialFocus, menuLevel: "main", defaultPlacement: placement, offsetValue: offsetValue, flipOptions: {
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

export { DropdownMenu as D, Menu as M, SheetMenu as S };
//# sourceMappingURL=Menu-c7ab8412.js.map
