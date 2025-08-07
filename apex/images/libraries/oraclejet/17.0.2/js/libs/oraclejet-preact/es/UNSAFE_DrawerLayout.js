/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { useState, useEffect, useRef, useCallback } from 'preact/hooks';
import { n as normalizePosition } from './positionUtils-1ec41fd0.js';
import { F as Floating } from './Floating-9703160e.js';
import { L as Layer } from './Layer-9b06412e.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { d as getAutofocusFocusables, b as focusOn, f as focusWithin } from './tabbableUtils-dca964ca.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { u as useAnimation } from './useAnimation-fe9990dc.js';
import { u as useUser } from './useUser-99920e02.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useBreakpointValues } from './useBreakpointValues-de03c6fa.js';
import { u as useResizeObserver } from './useResizeObserver-260ee12b.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { DrawerLayoutRedwoodTheme } from './UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutTheme.js';
import './useFloating-c99976f8.js';
import './refUtils-b9d8d91a.js';
import './useOutsideClick-eb8324f6.js';
import './arrayUtils-35a58161.js';
import './utils-6eab3a64.js';
import './Common/themes/themeContract.css.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './UNSAFE_Floating/themes/redwood/FloatingTheme.js';
import './UNSAFE_Floating/themes/FloatingStyles.css.js';
import './FloatingStyles.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingVariants.css.js';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './vanilla-extract-dynamic.esm-2955d60a.js';
import './UNSAFE_Floating/themes/FloatingContract.css.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import 'preact';
import './Common/themes/redwood/theme.js';
import './head-6f17c50c.js';
import './_arity-be492b9e.js';
import './_isArray-694cc52d.js';
import './_isString-675f1de9.js';
import './useBreakpoints-13aa87e6.js';
import './logger-c92f309c.js';
import './UNSAFE_DrawerLayout/themes/DrawerLayoutStyles.css.js';
import './DrawerLayoutStyles.styles.css';
import './UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutBaseTheme.css.js';
import './UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutBaseTheme.styles.css';
import './UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutVariants.css.js';

/**
 * A drawer layout adds expandable side contents (drawers) alongside some primary content.
 *
 * These drawers automatically swap 'reflow' and 'overlay' display mode based on width of the page and can be placed at the 'start', 'end' or 'bottom' edge.
 */
const DrawerLayout = ({ children, startDrawer, endDrawer, bottomDrawer, isStartOpen = false, isEndOpen = false, isBottomOpen = false, startDisplay, endDisplay, bottomDisplay, onClose, onTransitionEnd, testId // ...props
 }) => {
    // Constants
    const zeroPx = '0px';
    const duration = 250;
    const verticalBreakpoint = 600;
    const stringStart = 'start';
    const stringEnd = 'end';
    const stringBottom = 'bottom';
    const stringInitial = 'initial';
    const stringOpening = 'opening';
    const stringOpen = 'open';
    const stringClosing = 'closing';
    const stringUnmounted = 'unmounted';
    const stringFullOverlay = 'full-overlay';
    const stringOverlay = 'overlay';
    const stringReflow = 'reflow';
    const stringHidden = 'hidden';
    const stringVisible = 'visible';
    // Initialize states
    const [startDrawerStatus, setStartDrawerStatus] = useState(isStartOpen ? stringInitial : stringUnmounted);
    const [endDrawerStatus, setEndDrawerStatus] = useState(isEndOpen ? stringInitial : stringUnmounted);
    const [bottomDrawerStatus, setBottomDrawerStatus] = useState(isBottomOpen ? stringInitial : stringUnmounted);
    const [startVisibility, setStartVisibility] = useState(stringHidden);
    const [endVisibility, setEndVisibility] = useState(stringHidden);
    const [bottomVisibility, setBottomVisibility] = useState(stringHidden);
    const [startOffset, setStartOffset] = useState();
    const [endOffset, setEndOffset] = useState();
    const [bottomOffset, setBottomOffset] = useState();
    // Breakpoints:
    // sm: 0-600px (full-overlay)
    // md: 600-1024px (overlay)
    // lg: >1024px (reflow)
    const displayMode = useBreakpointValues({
        sm: stringFullOverlay,
        md: stringOverlay,
        lg: stringReflow
    });
    const [viewportDisplayModeHorizontal, setViewportDisplayModeHorizontal] = useState(displayMode);
    const [viewportDisplayModeVertical, setViewportDisplayModeVertical] = useState(displayMode);
    useEffect(() => {
        // Size breakpoint crossed
        setViewportDisplayModeHorizontal(displayMode);
    }, [displayMode]);
    // Refs
    const rootRef = useRef(null);
    const centerRef = useRef(null);
    const startDrawerRef = useRef(null);
    const endDrawerRef = useRef(null);
    const bottomDrawerRef = useRef(null);
    const getElementHeight = (element) => {
        return element ? Math.round(element.offsetHeight) : 0;
    };
    const getElementHeightPx = useCallback((element) => {
        return `${getElementHeight(element)}px`;
    }, []);
    const getElementWidth = useCallback((element) => {
        return element ? Math.round(element.getBoundingClientRect().width) : 0;
    }, []);
    const getElementWidthPx = useCallback((element) => {
        return `${getElementWidth(element)}px`;
    }, [getElementWidth]);
    // Normalizing position
    const { direction } = useUser();
    const isLtr = direction === 'ltr';
    const getNormalizedPlacement = useCallback((placement) => {
        return normalizePosition(placement, direction);
    }, [direction]);
    const getTranslateX = (placement, ref) => {
        return `${getNormalizedPlacement(placement) === 'right' ? '' : '-'}${getElementWidthPx(ref.current)}`;
    };
    const getTranslateY = (ref) => {
        return getElementHeightPx(ref.current);
    };
    const isSidePlacement = (placement) => {
        return [stringStart, stringEnd].indexOf(placement) > -1;
    };
    const isBottomPlacement = (placement) => {
        return placement === stringBottom;
    };
    const isAnimationPending = (status) => {
        return [stringOpening, stringClosing].indexOf(status) > -1;
    };
    const isDrawerAnimationPending = (placement) => {
        switch (placement) {
            case stringStart:
                return isAnimationPending(startDrawerStatus);
            case stringEnd:
                return isAnimationPending(endDrawerStatus);
            case stringBottom:
                return isAnimationPending(bottomDrawerStatus);
        }
    };
    const isDrawerOpen = (placement) => {
        switch (placement) {
            case stringStart:
                return isStartOpen;
            case stringEnd:
                return isEndOpen;
            case stringBottom:
                return isBottomOpen;
        }
    };
    const getDrawerVisibility = (placement) => {
        switch (placement) {
            case stringStart:
                return startVisibility;
            case stringEnd:
                return endVisibility;
            case stringBottom:
                return bottomVisibility;
        }
    };
    const setDrawerVisibility = (placement, visibility) => {
        switch (placement) {
            case stringStart:
                return setStartVisibility(visibility);
            case stringEnd:
                return setEndVisibility(visibility);
            case stringBottom:
                return setBottomVisibility(visibility);
        }
    };
    const getDrawerRef = (placement) => {
        switch (placement) {
            case stringStart:
                return startDrawerRef;
            case stringEnd:
                return endDrawerRef;
            case stringBottom:
                return bottomDrawerRef;
        }
    };
    const getDrawerEl = (placement) => {
        return getDrawerRef(placement).current;
    };
    const getAnimatedNodeRef = (placement) => {
        switch (placement) {
            case stringStart:
                return startAnimatedNodeRef;
            case stringEnd:
                return endAnimatedNodeRef;
            case stringBottom:
                return bottomAnimatedNodeRef;
        }
    };
    const getDrawerStatus = (placement) => {
        switch (placement) {
            case stringStart:
                return startDrawerStatus;
            case stringEnd:
                return endDrawerStatus;
            case stringBottom:
                return bottomDrawerStatus;
        }
    };
    const setDrawerStatus = (placement, status) => {
        switch (placement) {
            case stringStart:
                setStartDrawerStatus(status);
                break;
            case stringEnd:
                setEndDrawerStatus(status);
                break;
            case stringBottom:
                setBottomDrawerStatus(status);
                break;
        }
    };
    const resetAnimatedNodeRef = (placement) => {
        switch (placement) {
            case stringStart:
                startAnimatedNodeRef(null);
                break;
            case stringEnd:
                endAnimatedNodeRef(null);
                break;
            case stringBottom:
                bottomAnimatedNodeRef(null);
                break;
        }
    };
    const getDrawerDisplayProp = (placement) => {
        switch (placement) {
            case stringStart:
                return startDisplay;
            case stringEnd:
                return endDisplay;
            case stringBottom:
                return bottomDisplay;
        }
    };
    const getDrawerDisplayMode = (placement) => {
        const displayProp = getDrawerDisplayProp(placement);
        if (displayProp) {
            return displayProp;
        }
        else {
            if (isSidePlacement(placement)) {
                return viewportDisplayModeHorizontal;
            }
            return viewportDisplayModeVertical;
        }
    };
    // Animation config
    const getAnimationStates = (placement, ref) => {
        const bottomPlacement = isBottomPlacement(placement);
        if (getDrawerDisplayMode(placement) === stringReflow) {
            // Reflow display mode
            // Effect: Expand/Collapse
            if (bottomPlacement) {
                return {
                    opening: () => {
                        return {
                            from: {
                                maxHeight: zeroPx,
                                overflowX: 'hidden'
                            },
                            to: {
                                maxHeight: getElementHeightPx(ref.current),
                                overflowX: 'hidden'
                            },
                            options: {
                                duration: duration
                            }
                        };
                    },
                    closing: () => {
                        return {
                            from: {
                                maxHeight: getElementHeightPx(ref.current)
                            },
                            to: {
                                maxHeight: zeroPx,
                                overflowX: 'hidden'
                            },
                            options: {
                                duration: duration
                            }
                        };
                    }
                };
            }
            else {
                return {
                    opening: () => {
                        return {
                            from: {
                                maxWidth: zeroPx,
                                overflowY: 'hidden'
                            },
                            to: {
                                maxWidth: getElementWidthPx(ref.current),
                                overflowY: 'hidden'
                            },
                            options: {
                                duration: duration
                            }
                        };
                    },
                    closing: () => {
                        return {
                            from: {
                                maxWidth: getElementWidthPx(ref.current)
                            },
                            to: {
                                maxWidth: zeroPx,
                                overflowY: 'hidden'
                            },
                            options: {
                                duration: duration
                            }
                        };
                    }
                };
            }
        }
        else {
            // FullOverlay or Overlay display mode
            // Effect: Slidein/Slideout
            if (bottomPlacement) {
                return {
                    opening: () => {
                        return {
                            from: {
                                translateY: getTranslateY(ref)
                            },
                            to: {
                                translateY: zeroPx
                            },
                            options: {
                                duration: duration
                            }
                        };
                    },
                    closing: () => {
                        return {
                            from: {
                                translateY: zeroPx
                            },
                            to: {
                                translateY: getTranslateY(ref)
                            },
                            options: {
                                duration: duration
                            }
                        };
                    }
                };
            }
            else {
                return {
                    opening: () => {
                        return {
                            from: {
                                translateX: getTranslateX(placement, ref)
                            },
                            to: {
                                translateX: zeroPx
                            },
                            options: {
                                duration: duration
                            }
                        };
                    },
                    closing: () => {
                        return {
                            from: {
                                translateX: zeroPx
                            },
                            to: {
                                translateX: getTranslateX(placement, ref)
                            },
                            options: {
                                duration: duration
                            }
                        };
                    }
                };
            }
        }
    };
    const handleFocus = (placement) => {
        // Set focus to the first match:
        const drawerRef = getDrawerRef(placement);
        // 1. First element inside the drawer matching [autofocus]
        const autofocusItems = getAutofocusFocusables(drawerRef.current);
        if (autofocusItems.length > 0) {
            focusOn(autofocusItems[0]);
            return;
        }
        // 2. Tabbable element inside the content element
        // 3. The drawer itself
        focusWithin(drawerRef.current);
    };
    // Custom hook to be shared for each side
    // It can't be a function as a hook can only be called within a custom hook
    function useNodeRef(placement, ref) {
        const isOpen = isDrawerOpen(placement);
        const status = getDrawerStatus(placement);
        return useAnimation(status, {
            animationStates: getAnimationStates(placement, ref),
            isAnimatedOnMount: true,
            onAnimationEnd: () => {
                if (status === stringOpening) {
                    setDrawerStatus(placement, stringOpen);
                    handleFocus(placement);
                    onTransitionEnd?.({
                        placement: placement,
                        value: true
                    });
                }
                else if (!isOpen) {
                    resetAnimatedNodeRef(placement);
                    setDrawerVisibility(placement, stringHidden);
                    setDrawerStatus(placement, stringUnmounted);
                    onTransitionEnd?.({
                        placement: placement,
                        value: false
                    });
                }
            }
        }).nodeRef;
    }
    // Drawer refs
    const startAnimatedNodeRef = useNodeRef(stringStart, startDrawerRef);
    const endAnimatedNodeRef = useNodeRef(stringEnd, endDrawerRef);
    const bottomAnimatedNodeRef = useNodeRef(stringBottom, bottomDrawerRef);
    //testId support
    const testIdProps = useTestId(testId);
    // Custom hook to be shared for each side
    // It can't be a function as a hook can only be called within a custom hook
    function useDrawerStatus(placement) {
        const isOpen = isDrawerOpen(placement);
        const drawerStatus = getDrawerStatus(placement);
        useEffect(() => {
            // Ignore initial render
            // 1. Ignore status update on initial render
            if (drawerStatus === stringUnmounted && !isOpen) {
                return;
            }
            // 2. Unmounted
            // Mount visually hidden component.
            // Component gets mounted, but will be visually hidden to avoid flickering.
            // Flickering happens because it gets rendered before animation hook repositions
            // it in next render cycle
            if (drawerStatus === stringUnmounted && isOpen) {
                setDrawerStatus(placement, stringInitial);
                return;
            }
            // 3. Initial
            // Setup animation
            // Component has been mounted.
            // We will kick out animation as node is already present in DOM.
            // To avoid flickering, we still keep it visually hidden until the next render cycle.
            if (drawerStatus === stringInitial && isOpen) {
                const drawerRef = getDrawerRef(placement);
                const animatedNodeRef = getAnimatedNodeRef(placement);
                animatedNodeRef(drawerRef.current);
                setDrawerStatus(placement, stringOpening);
                return;
            }
            // 4. Opening
            // Unhide component. It becomes visible.
            if (drawerStatus === stringOpening && isOpen) {
                setDrawerVisibility(placement, stringVisible);
                return;
            }
            // 5. Open
            // Status 'open' is set in 'onAnimationEnd' handler
            // 6. Closing
            if (!isOpen) {
                setDrawerStatus(placement, stringClosing);
            }
        }, [isOpen, drawerStatus, placement]);
    }
    // Drawers' status handler±
    useDrawerStatus(stringStart);
    useDrawerStatus(stringEnd);
    useDrawerStatus(stringBottom);
    // Keydown handlers
    const handleKeyDownStart = (event) => {
        handleKeyDown(stringStart, event);
    };
    const handleKeyDownEnd = (event) => {
        handleKeyDown(stringEnd, event);
    };
    const handleKeyDownBottom = (event) => {
        handleKeyDown(stringBottom, event);
    };
    const handleKeyDown = (placement, event) => {
        if (event.code === 'Escape') {
            // Handle only in overlay mode
            if (isOverlay(placement)) {
                onClose?.({
                    placement,
                    reason: 'escapeKey'
                });
            }
        }
    };
    // Styles
    const { classes, styles } = useComponentTheme(DrawerLayoutRedwoodTheme);
    const getVisibilityClass = (visibility) => {
        return visibility === stringHidden ? styles.visibilityHidden : styles.visibilityVisible;
    };
    const isOverlay = (placement) => {
        return [stringFullOverlay, stringOverlay].indexOf(getDrawerDisplayMode(placement)) > -1;
    };
    const isFullOverlay = (placement) => {
        return getDrawerDisplayMode(placement) === stringFullOverlay;
    };
    const getDrawerClassNames = (placement) => {
        // Visibility style is always added
        const visibility = getDrawerVisibility(placement);
        const classNamesArr = [getVisibilityClass(visibility)];
        // Styles for overlay vs. full-overlay vs. reflow
        if (isOverlay(placement)) {
            classNamesArr.push(styles.overlayDrawer);
            if (isSidePlacement(placement) && !isFullOverlay(placement)) {
                classNamesArr.push(styles.overlaySideDrawerNonFullWidth);
            }
        }
        else {
            classNamesArr.push(styles.reflowDrawer);
        }
        // Styles for animation
        if (isDrawerAnimationPending(placement)) {
            classNamesArr.push(styles.animatedDrawer);
        }
        const getPlacementSpecificStyles = (placement) => {
            switch (placement) {
                case stringStart:
                    if (isOverlay(stringStart)) {
                        return isLtr ? styles.overlayDrawerLeft : styles.overlayDrawerRight;
                    }
                    else {
                        return isLtr ? styles.reflowDrawerLeft : styles.reflowDrawerRight;
                    }
                case stringEnd:
                    if (isOverlay(stringEnd)) {
                        return isLtr ? styles.overlayDrawerRight : styles.overlayDrawerLeft;
                    }
                    else {
                        return isLtr ? styles.reflowDrawerRight : styles.reflowDrawerLeft;
                    }
                case stringBottom:
                    return isOverlay(stringBottom) ? styles.overlayDrawerBottom : styles.reflowDrawerBottom;
            }
        };
        // Placement specific styles
        classNamesArr.push(getPlacementSpecificStyles(placement));
        return classNames(classNamesArr);
    };
    const getDrawerProp = (placement) => {
        switch (placement) {
            case stringStart:
                return startDrawer;
            case stringEnd:
                return endDrawer;
            case stringBottom:
                return bottomDrawer;
        }
    };
    const getKeyDownHandler = (placement) => {
        switch (placement) {
            case stringStart:
                return handleKeyDownStart;
            case stringEnd:
                return handleKeyDownEnd;
            case stringBottom:
                return handleKeyDownBottom;
        }
    };
    // Single drawer template
    const renderDrawer = (placement) => {
        return (jsx("div", { ref: getDrawerRef(placement), className: getDrawerClassNames(placement), tabIndex: isOverlay(placement) ? -1 : undefined, onKeyDown: getKeyDownHandler(placement), children: getDrawerProp(placement) }));
    };
    const clientHints = getClientHints();
    const getViewportHeight = useCallback(() => {
        if (clientHints.platform === 'ios') {
            // On ios window.innerHeight is not recommended way of measuring the viewport
            return document.documentElement.clientHeight;
        }
        return window.innerHeight;
    }, [clientHints.platform]);
    const handleVerticalResize = useCallback(() => {
        const viewportHeight = getViewportHeight();
        if (viewportHeight >= verticalBreakpoint) {
            if (viewportDisplayModeVertical != stringReflow) {
                setViewportDisplayModeVertical(stringReflow);
            }
        }
        else {
            if (viewportDisplayModeVertical != stringOverlay) {
                setViewportDisplayModeVertical(stringOverlay);
            }
        }
    }, [viewportDisplayModeVertical, getViewportHeight]);
    // Window resize listener
    // useBreakpoint hook is designed for horizontal breakpoints only
    // This listener is used for 600px (overlay vs. reflow) breakpoint
    // used for bottom drawer
    useEffect(() => {
        const resizeObserver = new ResizeObserver(() => {
            handleVerticalResize();
        });
        resizeObserver.observe(document.body);
        // Deregister resize observer when Drawer layout unmounts
        return () => {
            resizeObserver.unobserve(document.body);
        };
    }, [handleVerticalResize]);
    const getOffset = (placement) => {
        const drawerEl = getDrawerEl(placement);
        if (drawerEl) {
            return isSidePlacement(placement) ? -getElementWidth(drawerEl) : -getElementHeight(drawerEl);
        }
        return 0;
    };
    const getOffsetState = (placement) => {
        switch (placement) {
            case stringStart:
                return startOffset;
            case stringEnd:
                return endOffset;
            case stringBottom:
                return bottomOffset;
        }
    };
    const setSideOverlayDrawerFullHeight = useCallback((placement) => {
        // By default PopupElements have no predefined height.
        // In 'overlay' mode drawers should be
        // of the same height as their parent <oj-drawer-layout>
        const centerSectionHeight = getElementHeightPx(centerRef.current);
        const drawerEl = getDrawerRef(placement).current;
        if (drawerEl && isDrawerOpen(placement) && isOverlay(placement)) {
            drawerEl.style.height = centerSectionHeight;
        }
    }, [getElementHeightPx, isDrawerOpen, isOverlay]);
    const handleSideDrawerFullWidth = (placement) => {
        const drawerEl = getDrawerRef(placement).current;
        if (drawerEl) {
            if (isDrawerOpen(placement)) {
                const drawerInlineStyle = drawerEl.style;
                if (isFullOverlay(placement)) {
                    drawerInlineStyle.width = getElementWidthPx(rootRef.current);
                }
                else {
                    drawerInlineStyle.removeProperty('width');
                }
            }
        }
    };
    const setBottomOverlayDrawerWidth = useCallback(() => {
        const bottomDrawerElement = bottomDrawerRef.current;
        if (bottomDrawerElement && isDrawerOpen(stringBottom) && isOverlay(stringBottom)) {
            const centerSectionWidth = getElementWidthPx(centerRef.current);
            bottomDrawerElement.style.width = centerSectionWidth;
        }
    }, [getElementWidthPx, isDrawerOpen, isOverlay]);
    const setDrawerSize = (placement) => {
        if (isSidePlacement(placement)) {
            setSideOverlayDrawerFullHeight(placement);
            handleSideDrawerFullWidth(placement);
        }
        if (isBottomPlacement(placement)) {
            setBottomOverlayDrawerWidth();
        }
    };
    const handleDrawerLayoutResize = useCallback(() => {
        // If the DrawerLayout (page content) changes size,
        // adjust OVERLAY side drawers (start/end) height to fit the drawer
        // Note that these two functions checks that 'overlay' condition is fulfilled
        setSideOverlayDrawerFullHeight(stringStart);
        setSideOverlayDrawerFullHeight(stringEnd);
        setBottomOverlayDrawerWidth();
    }, [setSideOverlayDrawerFullHeight, setBottomOverlayDrawerWidth]);
    // DrawerLayout resize observer
    useResizeObserver(rootRef, handleDrawerLayoutResize);
    const setOffsetState = (placement) => {
        const offset = getOffset(placement);
        switch (placement) {
            case stringStart:
                setStartOffset(offset);
                break;
            case stringEnd:
                setEndOffset(offset);
                break;
            case stringBottom:
                setBottomOffset(offset);
                break;
        }
    };
    // Start drawer resize observer
    const handleStartDrawerResize = () => {
        setOffsetState(stringStart);
    };
    useResizeObserver(startDrawerRef, handleStartDrawerResize);
    // End drawer resize observer
    const handleEndDrawerResize = () => {
        setOffsetState(stringEnd);
    };
    useResizeObserver(endDrawerRef, handleEndDrawerResize);
    // Bottom drawer resize observer
    const handleBottomDrawerResize = () => {
        setOffsetState(stringBottom);
    };
    useResizeObserver(bottomDrawerRef, handleBottomDrawerResize);
    const getReflowOrOverlayDrawer = (placement) => {
        const shiftOptions = {
            mainAxis: false,
            crossAxis: false
        };
        const flipOptions = {
            mainAxis: false,
            crossAxis: false
        };
        // Reflow vs. overlay drawer
        if (isOverlay(placement)) {
            setDrawerSize(placement);
            // Initial offset
            if (!getOffsetState(placement)) {
                setOffsetState(placement);
            }
            return (
            // Reconciliation issue. Reparented node must
            // be a single child of a <div>
            jsx("div", { children: jsx(Layer, { children: jsx(Floating, { anchorRef: placement === stringBottom ? centerRef : rootRef, placement: placement, class: isDrawerAnimationPending(placement) ? styles.floating : '', offsetValue: getOffsetState(placement), flipOptions: flipOptions, shiftOptions: shiftOptions, children: renderDrawer(placement) }) }) }));
        }
        else {
            return renderDrawer(placement);
        }
    };
    // Render drawer conditionally
    const getDrawer = (placement) => {
        const isMounted = getDrawerStatus(placement) !== stringUnmounted;
        return isMounted ? getReflowOrOverlayDrawer(placement) : null;
    };
    return (jsxs("div", { ref: rootRef, className: classes, ...testIdProps, children: [getDrawer(stringStart), jsxs("div", { ref: centerRef, className: styles.centerSection, children: [jsx("div", { className: styles.mainContent, children: children }), getDrawer(stringBottom)] }), getDrawer(stringEnd)] }));
};

export { DrawerLayout };
//# sourceMappingURL=UNSAFE_DrawerLayout.js.map
