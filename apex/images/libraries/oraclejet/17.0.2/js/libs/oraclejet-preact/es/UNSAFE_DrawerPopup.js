/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useState, useRef, useEffect, useCallback } from 'preact/hooks';
import { L as Layer } from './Layer-9b06412e.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { M as Modal } from './Modal-6b11d8cb.js';
import { F as FocusTrap } from './FocusTrap-8ddd383f.js';
import { g as getActiveElement, f as focusWithin, b as focusOn, d as getAutofocusFocusables } from './tabbableUtils-dca964ca.js';
import { n as normalizePosition } from './positionUtils-1ec41fd0.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { u as useOutsideClick } from './useOutsideClick-eb8324f6.js';
import { u as useAnimation } from './useAnimation-fe9990dc.js';
import { u as useUser } from './useUser-99920e02.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useSwipe } from './useSwipe-818b0c1c.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { c as colorInterpolations } from './colors-aab9ed12.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { DrawerPopupRedwoodTheme } from './UNSAFE_DrawerPopup/themes/redwood/DrawerPopupTheme.js';
import './classNames-4e12b00d.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import 'preact';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import './UNSAFE_Modal/themes/ModalStyles.css.js';
import './ModalStyles.styles.css';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './FocusTracker-a0621449.js';
import './PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js';
import './FocusTrackerStyles.styles.css';
import './head-6f17c50c.js';
import './_arity-be492b9e.js';
import './_curry3-0b4222d7.js';
import './_curry1-25297e59.js';
import './_curry2-34316bcf.js';
import './_isArray-694cc52d.js';
import './_isString-675f1de9.js';
import './arrayUtils-35a58161.js';
import './logger-c92f309c.js';
import './mergeDeepWithKey-08531060.js';
import './_isObject-1fab0f5b.js';
import './UNSAFE_DrawerPopup/themes/redwood/DrawerPopupBaseTheme.css.js';
import './UNSAFE_DrawerPopup/themes/redwood/DrawerPopupBaseTheme.styles.css';
import './UNSAFE_DrawerPopup/themes/DrawerPopupStyles.css.js';
import './DrawerPopupStyles.styles.css';
import './UNSAFE_DrawerPopup/themes/redwood/DrawerPopupVariants.css.js';
import './DrawerPopupVariants.styles.css';

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
    const [status, setStatus] = useState(isOpen ? 'initial' : 'unmounted');
    const [visibility, setVisibility] = useState('hidden');
    const [isOutsideClickDisabled, setIsOutsideClickDisabled] = useState(!isOpen);
    const [displayModeHorizontal, setDisplayModeHorizontal] = useState('overlay');
    const rootRef = useRef(null);
    const launcherRef = useRef(null);
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
    const testIdProps = useTestId(testId);
    // Normalizing position
    const { direction } = useUser();
    const getNormalizedPlacement = () => {
        return normalizePosition(placement, direction);
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
        const autofocusItems = getAutofocusFocusables(rootRef.current);
        if (autofocusItems.length > 0) {
            focusOn(autofocusItems[0]);
            return;
        }
        // 2. Tabbable element inside the content element
        // 3. The drawer itself
        focusWithin(rootRef.current);
    };
    // Animation
    const { nodeRef } = useAnimation(status, {
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
    useEffect(() => {
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
    useEffect(() => {
        if (modality === 'modeless') {
            if (status === 'opening') {
                // Remember launcher
                launcherRef.current = getActiveElement();
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
        if (launcherRef.current === getActiveElement() && event.code === 'F6') {
            // Prevent default F6 handlers.
            // F6 is a standard Chrome address bar shortcut on Windows.
            event.preventDefault();
            event.stopPropagation();
            // Focus on first tabbable in a container or container itself if there is none
            focusWithin(rootRef.current);
        }
    };
    const handleKeyDown = useCallback((event) => {
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
                        focusOn(launcherEl);
                    }
                    break;
                }
        }
    }, [onClose]);
    // OutsideClick handler
    const handleOutsideClick = useCallback(() => {
        // Trigger onClose event with outside click detail
        onClose?.({ reason: 'outsideClick' });
    }, [onClose]);
    useOutsideClick({
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
    const clientHints = getClientHints();
    const getViewportWidth = useCallback(() => {
        if (clientHints.platform === 'ios') {
            // On ios window.innerWidth is not recommended way of measuring the viewport
            return document.documentElement.clientWidth;
        }
        return window.innerWidth;
    }, [clientHints.platform]);
    // Window resize handler
    // Handles display mode: Overlay <> Full overlay (full width side drawers)
    const handleResize = useCallback(() => {
        const viewportWidth = getViewportWidth();
        if (displayModeHorizontal === 'overlay' && viewportWidth < displayModefullWidthThreshold) {
            setDisplayModeHorizontal('fullOverlay');
        }
        if (displayModeHorizontal === 'fullOverlay' && viewportWidth > displayModefullWidthThreshold) {
            setDisplayModeHorizontal('overlay');
        }
    }, [getViewportWidth, displayModeHorizontal]);
    useEffect(() => {
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
    const swipeHandler = useCallback((event) => {
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
    const { swipeProps } = useSwipe(swipeHandler, swipeOptions);
    // Styles
    const { classes } = useComponentTheme(DrawerPopupRedwoodTheme, {
        placement: getDrawerPlacement(),
        visibility,
        displayModeHorizontal: ['start', 'end'].indexOf(placement) > -1 ? displayModeHorizontal : undefined
    });
    const interpolations = [...Object.values(colorInterpolations)];
    const styleInterpolations = mergeInterpolations(interpolations);
    const { ...styles } = styleInterpolations(props);
    const renderDrawer = () => {
        return (jsx("div", { ref: rootRef, className: classes, style: styles, tabIndex: -1, role: "dialog", onKeyDown: handleKeyDown, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, ...swipeProps, ...testIdProps, children: jsx(FocusTrap, { autoFocusRef: autoFocusRef, children: children }) }));
    };
    const isMounted = status !== 'unmounted';
    if (isMounted) {
        // Modal vs. modelss upper wrapper
        if (modality === 'modal') {
            return jsx(Modal, { isOpen: isMounted, children: renderDrawer() });
        }
        else {
            return jsx(Layer, { children: renderDrawer() });
        }
    }
    return null;
};

export { DrawerPopup };
//# sourceMappingURL=UNSAFE_DrawerPopup.js.map
