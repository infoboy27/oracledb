/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var DirectionalExpandArrowIcon = require('./DirectionalExpandArrowIcon-adf981f6.js');
var useId = require('./useId-6c0eeb27.js');
var MenuItem = require('./MenuItem-9a73694f.js');
var Menu = require('./Menu-7f8ca235.js');
var hooks = require('preact/hooks');
var DirectionalCollapseArrowIcon = require('./DirectionalCollapseArrowIcon-d2b24ac3.js');

const DropdownSubmenu = ({ label, children, startIcon }) => {
    //Id of the submenu that will be used to connect via aria-owns, menuItem with its submenu
    const submenuId = useId.useId();
    const preProcessedMenuItemID = useId.useId();
    //MenuItem id
    const menuItemId = compat.useMemo(() => `oj-menu-item-${preProcessedMenuItemID}`, [preProcessedMenuItemID]);
    const { changeKey, currentKey } = MenuItem.useMenuContainerContext();
    const submenuMenuItemRef = compat.useRef(null);
    const dropdownSubmenuRef = compat.useRef(null);
    const [isOpen, setIsOpen] = compat.useState(false);
    const [currentFocus, setCurrentFocus] = compat.useState('none');
    compat.useEffect(() => {
        if (menuItemId !== currentKey) {
            setIsOpen(false);
        }
    }, [currentKey, menuItemId]);
    //This function is used when pressing submenuitem and hovering over it
    const openSubmenuAction = compat.useCallback((e) => {
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
    const hoverStatus = compat.useRef({
        recentClose: false,
        pendingUnhover: false
    });
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(MenuItem.BaseMenuItem, { startIcon: startIcon, id: menuItemId, submenuId: submenuId, ref: submenuMenuItemRef, label: label, endIcon: jsxRuntime.jsx(DirectionalExpandArrowIcon.DirectionalExpandArrowIcon, {}), type: "submenu", role: "menuitem", onAction: openSubmenuAction, hoverInfo: {
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
                }, submenuRef: dropdownSubmenuRef, isSubmenuOpen: isOpen }), jsxRuntime.jsx(Menu.DropdownMenu, { isOpen: isOpen, menuLevel: "sub", menuId: submenuId, 
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
    const submenuId = useId.useId();
    const submenuItemId = useId.useId();
    const submenuTitleId = useId.useId();
    const submenuMenuItemRef = hooks.useRef(null);
    const [isOpen, setIsOpen] = hooks.useState(false);
    const [initialFocus, setInitialFocus] = hooks.useState('menu');
    const { menuContainerRef, changeKey } = MenuItem.useMenuContainerContext();
    /* We have to wrap opening display change inside a useEffect to avoid flashy effect when opening submenu*/
    hooks.useEffect(() => {
        if (isOpen) {
            if (menuContainerRef.current) {
                /*Menu hidden instead of unmounted for two main reasons:
              1. Children need to be updated even if menu is present.
              2. We can't unmount parent since all the submenus are children of main menuContainer*/
                menuContainerRef.current.style.display = 'none';
            }
        }
    }, [isOpen, menuContainerRef]);
    const openSubmenuDirectional = hooks.useCallback(() => {
        setIsOpen(true);
        setInitialFocus('secondItem');
    }, []);
    const openSubmenuAction = hooks.useCallback((e) => {
        //If the submenu is open using keyboard focus has to go to second item(first is the title), if not to the menu Container
        setIsOpen(true);
        if (e.type === 'keyup') {
            setInitialFocus('secondItem');
        }
        else {
            setInitialFocus('menu');
        }
    }, []);
    const returnFocusToSubmenuItem = hooks.useCallback(() => {
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
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(MenuItem.BaseMenuItem, { startIcon: startIcon, id: submenuItemId, submenuId: submenuId, ref: submenuMenuItemRef, label: label, endIcon: jsxRuntime.jsx(DirectionalExpandArrowIcon.DirectionalExpandArrowIcon, {}), type: "submenu", role: "menuitem", onAction: openSubmenuAction, openSubmenu: openSubmenuDirectional, isSubmenuOpen: isOpen }), !isOpen ? null : (jsxRuntime.jsxs(Menu.SheetMenu, { menuId: submenuId, closeSubmenu: closeDirectional, menuLevel: "sub", anchorRef: submenuMenuItemRef, 
                //TODO: We need to check if this initial focus is desired based on some W3C specs
                currentFocus: initialFocus, children: [jsxRuntime.jsx(MenuItem.BaseMenuItem, { id: submenuTitleId, menuItemLabelWeight: "bold", role: "menuitem", type: "submenu", startIcon: jsxRuntime.jsx(DirectionalCollapseArrowIcon.DirectionalCollapseArrowIcon, {}), onAction: closeSubmenuPressingTitleItem, label: label }), children] }))] }));
};

/*Submenu behaves differently depending the device */
const Submenu = (props) => {
    const { isMobile } = MenuItem.useMenuContext();
    return (jsxRuntime.jsx(jsxRuntime.Fragment, { children: isMobile ? (jsxRuntime.jsx(SheetSubmenu, { ...props })) : (jsxRuntime.jsx(DropdownSubmenu, { ...props })) }));
};

exports.Submenu = Submenu;
//# sourceMappingURL=Submenu-b7daab71.js.map
