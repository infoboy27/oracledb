/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useCallback, useState, useRef } from 'preact/hooks';
import { M as Menu } from './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import './logger-c92f309c.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { u as useContextMenuGesture } from './useContextMenuGesture-e8f99ce3.js';

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
    const handleCloseContextMenu = useCallback((detail) => {
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
    return (jsx(Menu, { ...menuProps, onClose: handleCloseContextMenu, "aria-label": contextMenuConfig.accessibleLabel, children: menuProps.isOpen && contextMenuConfig.itemsRenderer(contextMenuContext) }));
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
    const [contextMenuContext, setContextMenuContext] = useState();
    const [menuProps, setMenuProps] = useState(initialMenuProps);
    const gestureRef = useRef(null);
    const onVisContextMenuHandler = useCallback(({ gesture, anchor, target }) => {
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
    const contextMenuContent = contextMenuConfig && (jsx(ContextMenu, { ...menuProps, onContextMenuDismissed: onContextMenuDismissed, gestureRef: gestureRef, setMenuProps: setMenuProps, rootRef: rootRef, contextMenuConfig: contextMenuConfig, contextMenuContext: contextMenuContext }));
    const { triggerProps } = useContextMenuGesture(onVisContextMenuHandler, contextMenuOptions);
    return { contextMenuProps: triggerProps, contextMenuContent };
}

export { ContextMenu as C, useContextMenu as u };
//# sourceMappingURL=useContextMenu-81db2534.js.map
