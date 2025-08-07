/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { useMemo, useRef, useState, useEffect, useCallback } from 'preact/compat';
import { D as DirectionalExpandArrowIcon } from './DirectionalExpandArrowIcon-cf8fd7a8.js';
import { u as useId } from './useId-03dbfdf0.js';
import { m as useMenuContainerContext, B as BaseMenuItem, u as useMenuContext } from './MenuItem-a8f9c954.js';
import { D as DropdownMenu, S as SheetMenu } from './Menu-c7ab8412.js';
import { useRef as useRef$1, useState as useState$1, useEffect as useEffect$1, useCallback as useCallback$1 } from 'preact/hooks';
import { D as DirectionalCollapseArrowIcon } from './DirectionalCollapseArrowIcon-0298f5ef.js';

const DropdownSubmenu = ({ label, children, startIcon }) => {
    //Id of the submenu that will be used to connect via aria-owns, menuItem with its submenu
    const submenuId = useId();
    const preProcessedMenuItemID = useId();
    //MenuItem id
    const menuItemId = useMemo(() => `oj-menu-item-${preProcessedMenuItemID}`, [preProcessedMenuItemID]);
    const { changeKey, currentKey } = useMenuContainerContext();
    const submenuMenuItemRef = useRef(null);
    const dropdownSubmenuRef = useRef(null);
    const [isOpen, setIsOpen] = useState(false);
    const [currentFocus, setCurrentFocus] = useState('none');
    useEffect(() => {
        if (menuItemId !== currentKey) {
            setIsOpen(false);
        }
    }, [currentKey, menuItemId]);
    //This function is used when pressing submenuitem and hovering over it
    const openSubmenuAction = useCallback((e) => {
        submenuMenuItemRef.current?.focus();
        //If not click/touch we set the focus on the first item
        setIsOpen(true);
        if (e.type === 'keyup') {
            setCurrentFocus('firstItem');
        }
        else {
            setCurrentFocus('none');
        }
    }, []);
    //TODO: There is a bug in a Icon, once that bug is solved we have to check this again. JET-56980
    const hoverStatus = useRef({
        recentClose: false,
        pendingUnhover: false
    });
    return (jsxs(Fragment, { children: [jsx(BaseMenuItem, { startIcon: startIcon, id: menuItemId, submenuId: submenuId, ref: submenuMenuItemRef, label: label, endIcon: jsx(DirectionalExpandArrowIcon, {}), type: "submenu", role: "menuitem", onAction: openSubmenuAction, hoverInfo: {
                    //Specific hover events of submenuItem
                    hoverProps: {
                        onMouseEnter: (e) => {
                            openSubmenuAction(e);
                        }
                    },
                    hoverStatus
                }, 
                //Open submenu using right/left key
                openSubmenu: () => {
                    setIsOpen(true);
                    setCurrentFocus('firstItem');
                }, submenuRef: dropdownSubmenuRef, isSubmenuOpen: isOpen }), jsx(DropdownMenu, { isOpen: isOpen, menuLevel: "sub", menuId: submenuId, 
                //Close submenu with left/right key
                closeSubmenu: () => {
                    hoverStatus.current.recentClose = true;
                    changeKey({ key: currentKey, reason: 'keyboard' });
                    setTimeout(() => {
                        hoverStatus.current.recentClose = false;
                    }, HOVER_SHIFT_TIMEOUT);
                    setIsOpen(false);
                    //CurrentKey can be the same as submenuItem, because of that we explicitly focus it
                    submenuMenuItemRef.current?.focus();
                }, 
                /*For now we are exposing ref if this is exposed at some point we would look for other
                    mechanisms to use this ref */
                ref: dropdownSubmenuRef, anchorRef: submenuMenuItemRef, defaultPlacement: "end-top", currentFocus: currentFocus, offsetValue: {
                    mainAxis: -8, //TODO: need to figure out how to make this themable.
                    crossAxis: -8
                }, flipOptions: {
                    crossAxis: true,
                    mainAxis: true,
                    fallbackPlacements: ['start-top', 'end-bottom', 'start-bottom']
                }, children: children })] }));
};
const HOVER_SHIFT_TIMEOUT = 100;

const SheetSubmenu = ({ label, children, startIcon }) => {
    const submenuId = useId();
    const submenuItemId = useId();
    const submenuTitleId = useId();
    const submenuMenuItemRef = useRef$1(null);
    const [isOpen, setIsOpen] = useState$1(false);
    const [initialFocus, setInitialFocus] = useState$1('menu');
    const { menuContainerRef, changeKey } = useMenuContainerContext();
    /* We have to wrap opening display change inside a useEffect to avoid flashy effect when opening submenu*/
    useEffect$1(() => {
        if (isOpen) {
            if (menuContainerRef.current) {
                /*Menu hidden instead of unmounted for two main reasons:
              1. Children need to be updated even if menu is present.
              2. We can't unmount parent since all the submenus are children of main menuContainer*/
                menuContainerRef.current.style.display = 'none';
            }
        }
    }, [isOpen, menuContainerRef]);
    const openSubmenuDirectional = useCallback$1(() => {
        setIsOpen(true);
        setInitialFocus('secondItem');
    }, []);
    const openSubmenuAction = useCallback$1((e) => {
        //If the submenu is open using keyboard focus has to go to second item(first is the title), if not to the menu Container
        setIsOpen(true);
        if (e.type === 'keyup') {
            setInitialFocus('secondItem');
        }
        else {
            setInitialFocus('menu');
        }
    }, []);
    const returnFocusToSubmenuItem = useCallback$1(() => {
        changeKey({ key: submenuItemId, reason: 'keyboard' });
        submenuMenuItemRef.current?.focus();
    }, [changeKey, submenuItemId, submenuMenuItemRef]);
    /* No need to "save" these functions with useCallback */
    const closeSubmenu = () => {
        setIsOpen(false);
        if (menuContainerRef.current) {
            //Submenu is unmounted and prev menu is visible again.
            /*Dom manipulation is kind of dirty. Have to check for new approaches. JET-57239 */
            menuContainerRef.current.style.display = 'block';
        }
    };
    const closeSubmenuPressingTitleItem = (e) => {
        closeSubmenu();
        //If the submenu is closed using keyboard focus has to go to submenuItem that opened submenu, if not to the menu Container
        if (e.type === 'keyup') {
            returnFocusToSubmenuItem();
        }
        else {
            changeKey({ key: undefined, reason: 'click' });
            menuContainerRef.current?.focus();
        }
    };
    const closeDirectional = () => {
        closeSubmenu();
        returnFocusToSubmenuItem();
    };
    return (jsxs(Fragment, { children: [jsx(BaseMenuItem, { startIcon: startIcon, id: submenuItemId, submenuId: submenuId, ref: submenuMenuItemRef, label: label, endIcon: jsx(DirectionalExpandArrowIcon, {}), type: "submenu", role: "menuitem", onAction: openSubmenuAction, openSubmenu: openSubmenuDirectional, isSubmenuOpen: isOpen }), !isOpen ? null : (jsxs(SheetMenu, { menuId: submenuId, closeSubmenu: closeDirectional, menuLevel: "sub", anchorRef: submenuMenuItemRef, 
                //TODO: We need to check if this initial focus is desired based on some W3C specs
                currentFocus: initialFocus, children: [jsx(BaseMenuItem, { id: submenuTitleId, menuItemLabelWeight: "bold", role: "menuitem", type: "submenu", startIcon: jsx(DirectionalCollapseArrowIcon, {}), onAction: closeSubmenuPressingTitleItem, label: label }), children] }))] }));
};

/*Submenu behaves differently depending the device */
const Submenu = (props) => {
    const { isMobile } = useMenuContext();
    return (jsx(Fragment, { children: isMobile ? (jsx(SheetSubmenu, { ...props })) : (jsx(DropdownSubmenu, { ...props })) }));
};

export { Submenu as S };
//# sourceMappingURL=Submenu-8b3fa593.js.map
