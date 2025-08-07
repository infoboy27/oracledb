/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Layer = require('./Layer-3700cd37.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var Modal = require('./Modal-52fa4530.js');
var FocusTrap = require('./FocusTrap-0a03f5a2.js');
var tabbableUtils = require('./tabbableUtils-b49673af.js');
var positionUtils = require('./positionUtils-ae9279d7.js');
var clientHints = require('./clientHints-9e411b6e.js');
var useOutsideClick = require('./useOutsideClick-7420644b.js');
var useAnimation = require('./useAnimation-2f7dd313.js');
var useUser = require('./useUser-a6d15333.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useSwipe = require('./useSwipe-45174423.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var colors = require('./colors-ac3041c6.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var UNSAFE_DrawerPopup_themes_redwood_DrawerPopupTheme = require('./UNSAFE_DrawerPopup/themes/redwood/DrawerPopupTheme.js');
require('./classNames-c14c6ef3.js');
require('./UNSAFE_Layer/themes/LayerStyles.css.js');

require('./useThemeInterpolations-25313f34.js');
require('./useColorScheme-d2c4adcc.js');
require('./useScale-74bd6456.js');
require('./theme-dfd6a9fe.js');
require('./Theme-f06687af.js');
require('preact');
require('./Common/themes/redwood/theme.js');
require('./Common/themes/themeContract.css.js');
require('./UNSAFE_Modal/themes/ModalStyles.css.js');

require('./vanilla-extract-recipes-createRuntimeFn.esm-d1301b2d.js');
require('./FocusTracker-9cc329a3.js');
require('./PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js');

require('./head-68d0992f.js');
require('./_arity-c228159c.js');
require('./_curry3-18677bca.js');
require('./_curry1-e8f0d7ea.js');
require('./_curry2-c15d89cd.js');
require('./_isArray-73160ad5.js');
require('./_isString-f4443c9e.js');
require('./arrayUtils-7d8dcfc3.js');
require('./logger-2b636482.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_isObject-28636267.js');
require('./UNSAFE_DrawerPopup/themes/redwood/DrawerPopupBaseTheme.css.js');

require('./UNSAFE_DrawerPopup/themes/DrawerPopupStyles.css.js');

require('./UNSAFE_DrawerPopup/themes/redwood/DrawerPopupVariants.css.js');


// Constants
const displayModefullWidthThreshold = 600;
const zero = '0px';
const duration = 250;
const getElementHeight = (element) => {
    return Math.round(element.offsetHeight);
};
const getElementWidth = (element) => {
    return Math.round(element.getBoundingClientRect().width);
};
/**
 * A drawer popup adds a single slide-in side content alongside some primary content to an application window.
 *
 * This drawer always overlays the page and can be placed at the 'start', 'end' or 'bottom' edge.
 */
const DrawerPopup = ({ children, isOpen = false, autoFocusRef, placement = 'start', modality = 'modal', onClose, onTransitionEnd, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy, testId, ...props }) => {
    // Initialize states
    const [status, setStatus] = hooks.useState(isOpen ? 'initial' : 'unmounted');
    const [visibility, setVisibility] = hooks.useState('hidden');
    const [isOutsideClickDisabled, setIsOutsideClickDisabled] = hooks.useState(!isOpen);
    const [displayModeHorizontal, setDisplayModeHorizontal] = hooks.useState('overlay');
    const rootRef = hooks.useRef(null);
    const launcherRef = hooks.useRef(null);
    const isBottomPlacement = placement === 'bottom';
    // Animation config
    const animationStates = {
        opening: () => {
            if (isBottomPlacement) {
                return {
                    from: {
                        translateY: getTranslateY()
                    },
                    to: {
                        translateY: zero
                    },
                    options: {
                        duration: duration
                    }
                };
            }
            else {
                return {
                    from: {
                        translateX: getTranslateX()
                    },
                    to: {
                        translateX: zero
                    },
                    options: {
                        duration: duration
                    }
                };
            }
        },
        closing: () => {
            if (isBottomPlacement) {
                return {
                    from: {
                        translateY: zero
                    },
                    to: {
                        translateY: getTranslateY()
                    },
                    options: {
                        duration: duration
                    }
                };
            }
            else {
                return {
                    from: {
                        translateX: zero
                    },
                    to: {
                        translateX: getTranslateX()
                    },
                    options: {
                        duration: duration
                    }
                };
            }
        }
    };
    // testId support
    const testIdProps = useTestId.useTestId(testId);
    // Normalizing position
    const { direction } = useUser.useUser();
    const getNormalizedPlacement = () => {
        return positionUtils.normalizePosition(placement, direction);
    };
    const getTranslateX = () => {
        return `${getNormalizedPlacement() === 'right' ? '' : '-'}${getElementWidth(rootRef.current)}px`;
    };
    const getTranslateY = () => {
        return `${getElementHeight(rootRef.current)}px`;
    };
    const handleFocus = () => {
        // Set focus to the first match:
        // 1. First element inside the drawer matching [autofocus]
        const autofocusItems = tabbableUtils.getAutofocusFocusables(rootRef.current);
        if (autofocusItems.length > 0) {
            tabbableUtils.focusOn(autofocusItems[0]);
            return;
        }
        // 2. Tabbable element inside the content element
        // 3. The drawer itself
        tabbableUtils.focusWithin(rootRef.current);
    };
    // Animation
    const { nodeRef } = useAnimation.useAnimation(status, {
        animationStates,
        isAnimatedOnMount: true,
        onAnimationEnd: () => {
            if (status === 'opening') {
                handleFocus();
                onTransitionEnd?.(true);
            }
            else if (!isOpen) {
                nodeRef(null);
                setVisibility('hidden');
                setStatus('unmounted');
                onTransitionEnd?.(false);
            }
        }
    });
    hooks.useEffect(() => {
        // 1. Ignore status update on initial render
        if (status === 'unmounted' && !isOpen) {
            return;
        }
        // 2. Mount visually hidden component
        // Component gets mounted, but will be visually hidden to avoid flickering
        // Flickering happens because it gets rendered before animation hook repositions
        // it in next render cycle
        if (status === 'unmounted' && isOpen) {
            setStatus('initial');
            return;
        }
        // 3. Setup animation
        // Component has been mounted.
        // We will kick out animation as node is already present in DOM.
        // To avoid flickering, we still keep it visually hidden until the next render cycle.
        if (status === 'initial' && isOpen) {
            nodeRef(rootRef.current);
            setIsOutsideClickDisabled(false);
            setStatus('opening');
            return;
        }
        // 3. Unhide component. It becomes visible.
        if (status === 'opening' && isOpen) {
            setVisibility('visible');
            return;
        }
        // 4. Closing
        if (!isOpen) {
            setIsOutsideClickDisabled(true);
            setStatus('closing');
        }
    }, [isOpen, status, nodeRef]);
    // Launcher handler
    hooks.useEffect(() => {
        if (modality === 'modeless') {
            if (status === 'opening') {
                // Remember launcher
                launcherRef.current = tabbableUtils.getActiveElement();
                // Register F6 key handler to enter the Popup
                launcherRef.current?.addEventListener('keydown', launcherKeyDownCallback);
            }
            if (status === 'closing') {
                return () => {
                    // Deregister F6 key handler
                    launcherRef.current?.removeEventListener('keydown', launcherKeyDownCallback);
                };
            }
        }
        return;
    }, [modality, status]);
    const launcherKeyDownCallback = (event) => {
        // Moves focus from launcher (must have focus) back to the Drawer
        if (launcherRef.current === tabbableUtils.getActiveElement() && event.code === 'F6') {
            // Prevent default F6 handlers.
            // F6 is a standard Chrome address bar shortcut on Windows.
            event.preventDefault();
            event.stopPropagation();
            // Focus on first tabbable in a container or container itself if there is none
            tabbableUtils.focusWithin(rootRef.current);
        }
    };
    const handleKeyDown = hooks.useCallback((event) => {
        const launcherEl = launcherRef.current;
        switch (event.code) {
            case 'Escape': {
                onClose?.({ reason: 'escapeKey' });
                break;
            }
            case 'F6':
                if (modality === 'modeless') {
                    // Prevent default F6 handlers.
                    // F6 is a standard Chrome address bar shortcut on Windows.
                    event.preventDefault();
                    event.stopPropagation();
                    // Focus launcher
                    if (launcherEl) {
                        tabbableUtils.focusOn(launcherEl);
                    }
                    break;
                }
        }
    }, [onClose]);
    // OutsideClick handler
    const handleOutsideClick = hooks.useCallback(() => {
        // Trigger onClose event with outside click detail
        onClose?.({ reason: 'outsideClick' });
    }, [onClose]);
    useOutsideClick.useOutsideClick({
        isDisabled: isOutsideClickDisabled,
        ref: rootRef,
        handler: handleOutsideClick
    });
    // Drawer placement
    const getDrawerPlacement = () => {
        if (isBottomPlacement) {
            return placement;
        }
        else {
            if (direction === 'rtl') {
                return placement === 'start' ? 'right' : 'left';
            }
            else {
                return placement === 'start' ? 'left' : 'right';
            }
        }
    };
    const clientHints$1 = clientHints.getClientHints();
    const getViewportWidth = hooks.useCallback(() => {
        if (clientHints$1.platform === 'ios') {
            // On ios window.innerWidth is not recommended way of measuring the viewport
            return document.documentElement.clientWidth;
        }
        return window.innerWidth;
    }, [clientHints$1.platform]);
    // Window resize handler
    // Handles display mode: Overlay <> Full overlay (full width side drawers)
    const handleResize = hooks.useCallback(() => {
        const viewportWidth = getViewportWidth();
        if (displayModeHorizontal === 'overlay' && viewportWidth < displayModefullWidthThreshold) {
            setDisplayModeHorizontal('fullOverlay');
        }
        if (displayModeHorizontal === 'fullOverlay' && viewportWidth > displayModefullWidthThreshold) {
            setDisplayModeHorizontal('overlay');
        }
    }, [getViewportWidth, displayModeHorizontal]);
    hooks.useEffect(() => {
        const root = rootRef.current;
        if (root && status === 'opening') {
            const resizeObserver = new ResizeObserver(() => {
                handleResize();
            });
            resizeObserver.observe(document.body);
            return () => {
                resizeObserver.unobserve(document.body);
            };
        }
        return undefined;
    }, [status, handleResize]);
    // OutsideClick handler
    const swipeHandler = hooks.useCallback((event) => {
        const swipeDir = event.direction;
        if ((direction === 'ltr' && placement === 'start' && swipeDir === 'left') ||
            (placement === 'end' && swipeDir === 'right') ||
            (direction === 'rtl' && placement === 'start' && swipeDir === 'right') ||
            (placement === 'end' && swipeDir === 'left') ||
            (placement === 'bottom' && swipeDir === 'down')) {
            onClose?.({ reason: 'swipe' });
        }
    }, [direction, placement, onClose]);
    const swipeOptions = {
        threshold: 50,
        maximumTime: 750,
        tolerance: 40
    };
    const { swipeProps } = useSwipe.useSwipe(swipeHandler, swipeOptions);
    // Styles
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_DrawerPopup_themes_redwood_DrawerPopupTheme.DrawerPopupRedwoodTheme, {
        placement: getDrawerPlacement(),
        visibility,
        displayModeHorizontal: ['start', 'end'].indexOf(placement) > -1 ? displayModeHorizontal : undefined
    });
    const interpolations = [...Object.values(colors.colorInterpolations)];
    const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
    const { ...styles } = styleInterpolations(props);
    const renderDrawer = () => {
        return (jsxRuntime.jsx("div", { ref: rootRef, className: classes, style: styles, tabIndex: -1, role: "dialog", onKeyDown: handleKeyDown, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, ...swipeProps, ...testIdProps, children: jsxRuntime.jsx(FocusTrap.FocusTrap, { autoFocusRef: autoFocusRef, children: children }) }));
    };
    const isMounted = status !== 'unmounted';
    if (isMounted) {
        // Modal vs. modelss upper wrapper
        if (modality === 'modal') {
            return jsxRuntime.jsx(Modal.Modal, { isOpen: isMounted, children: renderDrawer() });
        }
        else {
            return jsxRuntime.jsx(Layer.Layer, { children: renderDrawer() });
        }
    }
    return null;
};

exports.DrawerPopup = DrawerPopup;
//# sourceMappingURL=UNSAFE_DrawerPopup.js.map
