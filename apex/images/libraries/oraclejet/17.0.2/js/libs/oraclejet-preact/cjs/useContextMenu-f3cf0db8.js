/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Menu = require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
require('./logger-2b636482.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var useContextMenuGesture = require('./useContextMenuGesture-67bf952e.js');

const initialMenuProps = {
    isOpen: false,
    initialFocus: 'menu',
    placement: 'bottom-start',
    offsetValue: 0,
    anchorRef: { current: null }
};

/**
 * The internal component used to render a custom context menu
 */
function ContextMenu({ contextMenuConfig, contextMenuContext, rootRef, setMenuProps, onContextMenuDismissed, gestureRef, ...menuProps }) {
    const handleCloseContextMenu = hooks.useCallback((detail) => {
        /*
        TODO: Focus ring should be visible when context menu was closed because of selecting an item using keyboard,
        but should not be visible when the selection was done using mouse or touch. This would probably means menu
        onClose API is going to be changed a little bit so we can satisfy this requirement. JET-62372
        */
        //Focus has to be set on the current target that was obtained
        //during context menu gesture when menu is dismissed or item is "selected"
        if (detail.reason === 'dismissed' || detail.reason === 'itemAction') {
            rootRef.current?.focus({ preventScroll: true });
            onContextMenuDismissed?.(gestureRef.current);
        }
        // We close the menu.The only prop that matters here is isOpen
        setMenuProps(initialMenuProps);
    }, [rootRef, setMenuProps, onContextMenuDismissed]);
    return (jsxRuntime.jsx(Menu.Menu, { ...menuProps, onClose: handleCloseContextMenu, "aria-label": contextMenuConfig.accessibleLabel, children: menuProps.isOpen && contextMenuConfig.itemsRenderer(contextMenuContext) }));
}

const TOUCH_OFFSET_VALUE = 30;
const menuPropGestureStates = {
    mouse: {
        initialFocus: 'menu',
        placement: 'bottom-start',
        offsetValue: 0
    },
    keyboard: {
        initialFocus: 'firstItem',
        placement: 'bottom-start',
        offsetValue: 0
    },
    touch: {
        initialFocus: 'menu',
        placement: 'end',
        offsetValue: TOUCH_OFFSET_VALUE
    }
};
function useContextMenu({ onContextMenuHandler, contextMenuOptions, rootRef, contextMenuConfig, onContextMenuDismissed }) {
    const [contextMenuContext, setContextMenuContext] = hooks.useState();
    const [menuProps, setMenuProps] = hooks.useState(initialMenuProps);
    const gestureRef = hooks.useRef(null);
    const onVisContextMenuHandler = hooks.useCallback(({ gesture, anchor, target }) => {
        gestureRef.current = gesture;
        const { context, elem } = onContextMenuHandler({
            gesture,
            target
        });
        setContextMenuContext(context);
        setMenuProps({
            ...menuPropGestureStates[gesture],
            anchorRef: { current: elem ? elem : anchor },
            isOpen: true
        });
    }, [onContextMenuHandler]);
    const contextMenuContent = contextMenuConfig && (jsxRuntime.jsx(ContextMenu, { ...menuProps, onContextMenuDismissed: onContextMenuDismissed, gestureRef: gestureRef, setMenuProps: setMenuProps, rootRef: rootRef, contextMenuConfig: contextMenuConfig, contextMenuContext: contextMenuContext }));
    const { triggerProps } = useContextMenuGesture.useContextMenuGesture(onVisContextMenuHandler, contextMenuOptions);
    return { contextMenuProps: triggerProps, contextMenuContent };
}

exports.ContextMenu = ContextMenu;
exports.useContextMenu = useContextMenu;
//# sourceMappingURL=useContextMenu-f3cf0db8.js.map
