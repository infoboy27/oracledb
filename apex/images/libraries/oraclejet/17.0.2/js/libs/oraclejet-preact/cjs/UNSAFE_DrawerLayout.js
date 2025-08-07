/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var positionUtils = require('./positionUtils-ae9279d7.js');
var Floating = require('./Floating-1280c2ce.js');
var Layer = require('./Layer-3700cd37.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var tabbableUtils = require('./tabbableUtils-b49673af.js');
var clientHints = require('./clientHints-9e411b6e.js');
var useAnimation = require('./useAnimation-2f7dd313.js');
var useUser = require('./useUser-a6d15333.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useBreakpointValues = require('./useBreakpointValues-77cb15bb.js');
var useResizeObserver = require('./useResizeObserver-819b1236.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_DrawerLayout_themes_redwood_DrawerLayoutTheme = require('./UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutTheme.js');
require('./useFloating-7800fd56.js');
require('./refUtils-915b985d.js');
require('./useOutsideClick-7420644b.js');
require('./arrayUtils-7d8dcfc3.js');
require('./utils-b7099be5.js');
require('./Common/themes/themeContract.css.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./UNSAFE_Floating/themes/redwood/FloatingTheme.js');
require('./UNSAFE_Floating/themes/FloatingStyles.css.js');

require('./UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js');

require('./UNSAFE_Floating/themes/redwood/FloatingVariants.css.js');
require('./vanilla-extract-recipes-createRuntimeFn.esm-d1301b2d.js');
require('./vanilla-extract-dynamic.esm-d5dffce7.js');
require('./UNSAFE_Floating/themes/FloatingContract.css.js');
require('./UNSAFE_Layer/themes/LayerStyles.css.js');

require('./useThemeInterpolations-25313f34.js');
require('./useColorScheme-d2c4adcc.js');
require('./useScale-74bd6456.js');
require('./theme-dfd6a9fe.js');
require('./Theme-f06687af.js');
require('./mergeInterpolations-6727b536.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');
require('preact');
require('./Common/themes/redwood/theme.js');
require('./head-68d0992f.js');
require('./_arity-c228159c.js');
require('./_isArray-73160ad5.js');
require('./_isString-f4443c9e.js');
require('./useBreakpoints-f5c06998.js');
require('./logger-2b636482.js');
require('./UNSAFE_DrawerLayout/themes/DrawerLayoutStyles.css.js');

require('./UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutBaseTheme.css.js');

require('./UNSAFE_DrawerLayout/themes/redwood/DrawerLayoutVariants.css.js');

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
    const [startDrawerStatus, setStartDrawerStatus] = hooks.useState(isStartOpen ? stringInitial : stringUnmounted);
    const [endDrawerStatus, setEndDrawerStatus] = hooks.useState(isEndOpen ? stringInitial : stringUnmounted);
    const [bottomDrawerStatus, setBottomDrawerStatus] = hooks.useState(isBottomOpen ? stringInitial : stringUnmounted);
    const [startVisibility, setStartVisibility] = hooks.useState(stringHidden);
    const [endVisibility, setEndVisibility] = hooks.useState(stringHidden);
    const [bottomVisibility, setBottomVisibility] = hooks.useState(stringHidden);
    const [startOffset, setStartOffset] = hooks.useState();
    const [endOffset, setEndOffset] = hooks.useState();
    const [bottomOffset, setBottomOffset] = hooks.useState();
    // Breakpoints:
    // sm: 0-600px (full-overlay)
    // md: 600-1024px (overlay)
    // lg: >1024px (reflow)
    const displayMode = useBreakpointValues.useBreakpointValues({
        sm: stringFullOverlay,
        md: stringOverlay,
        lg: stringReflow
    });
    const [viewportDisplayModeHorizontal, setViewportDisplayModeHorizontal] = hooks.useState(displayMode);
    const [viewportDisplayModeVertical, setViewportDisplayModeVertical] = hooks.useState(displayMode);
    hooks.useEffect(() => {
        // Size breakpoint crossed
        setViewportDisplayModeHorizontal(displayMode);
    }, [displayMode]);
    // Refs
    const rootRef = hooks.useRef(null);
    const centerRef = hooks.useRef(null);
    const startDrawerRef = hooks.useRef(null);
    const endDrawerRef = hooks.useRef(null);
    const bottomDrawerRef = hooks.useRef(null);
    const getElementHeight = (element) => {
        return element ? Math.round(element.offsetHeight) : 0;
    };
    const getElementHeightPx = hooks.useCallback((element) => {
        return `${getElementHeight(element)}px`;
    }, []);
    const getElementWidth = hooks.useCallback((element) => {
        return element ? Math.round(element.getBoundingClientRect().width) : 0;
    }, []);
    const getElementWidthPx = hooks.useCallback((element) => {
        return `${getElementWidth(element)}px`;
    }, [getElementWidth]);
    // Normalizing position
    const { direction } = useUser.useUser();
    const isLtr = direction === 'ltr';
    const getNormalizedPlacement = hooks.useCallback((placement) => {
        return positionUtils.normalizePosition(placement, direction);
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
        const autofocusItems = tabbableUtils.getAutofocusFocusables(drawerRef.current);
        if (autofocusItems.length > 0) {
            tabbableUtils.focusOn(autofocusItems[0]);
            return;
        }
        // 2. Tabbable element inside the content element
        // 3. The drawer itself
        tabbableUtils.focusWithin(drawerRef.current);
    };
    // Custom hook to be shared for each side
    // It can't be a function as a hook can only be called within a custom hook
    function useNodeRef(placement, ref) {
        const isOpen = isDrawerOpen(placement);
        const status = getDrawerStatus(placement);
        return useAnimation.useAnimation(status, {
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
    const testIdProps = useTestId.useTestId(testId);
    // Custom hook to be shared for each side
    // It can't be a function as a hook can only be called within a custom hook
    function useDrawerStatus(placement) {
        const isOpen = isDrawerOpen(placement);
        const drawerStatus = getDrawerStatus(placement);
        hooks.useEffect(() => {
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
    const { classes, styles } = useComponentTheme.useComponentTheme(UNSAFE_DrawerLayout_themes_redwood_DrawerLayoutTheme.DrawerLayoutRedwoodTheme);
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
        return classNames.classNames(classNamesArr);
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
        return (jsxRuntime.jsx("div", { ref: getDrawerRef(placement), className: getDrawerClassNames(placement), tabIndex: isOverlay(placement) ? -1 : undefined, onKeyDown: getKeyDownHandler(placement), children: getDrawerProp(placement) }));
    };
    const clientHints$1 = clientHints.getClientHints();
    const getViewportHeight = hooks.useCallback(() => {
        if (clientHints$1.platform === 'ios') {
            // On ios window.innerHeight is not recommended way of measuring the viewport
            return document.documentElement.clientHeight;
        }
        return window.innerHeight;
    }, [clientHints$1.platform]);
    const handleVerticalResize = hooks.useCallback(() => {
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
    hooks.useEffect(() => {
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
    const setSideOverlayDrawerFullHeight = hooks.useCallback((placement) => {
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
    const setBottomOverlayDrawerWidth = hooks.useCallback(() => {
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
    const handleDrawerLayoutResize = hooks.useCallback(() => {
        // If the DrawerLayout (page content) changes size,
        // adjust OVERLAY side drawers (start/end) height to fit the drawer
        // Note that these two functions checks that 'overlay' condition is fulfilled
        setSideOverlayDrawerFullHeight(stringStart);
        setSideOverlayDrawerFullHeight(stringEnd);
        setBottomOverlayDrawerWidth();
    }, [setSideOverlayDrawerFullHeight, setBottomOverlayDrawerWidth]);
    // DrawerLayout resize observer
    useResizeObserver.useResizeObserver(rootRef, handleDrawerLayoutResize);
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
    useResizeObserver.useResizeObserver(startDrawerRef, handleStartDrawerResize);
    // End drawer resize observer
    const handleEndDrawerResize = () => {
        setOffsetState(stringEnd);
    };
    useResizeObserver.useResizeObserver(endDrawerRef, handleEndDrawerResize);
    // Bottom drawer resize observer
    const handleBottomDrawerResize = () => {
        setOffsetState(stringBottom);
    };
    useResizeObserver.useResizeObserver(bottomDrawerRef, handleBottomDrawerResize);
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
            jsxRuntime.jsx("div", { children: jsxRuntime.jsx(Layer.Layer, { children: jsxRuntime.jsx(Floating.Floating, { anchorRef: placement === stringBottom ? centerRef : rootRef, placement: placement, class: isDrawerAnimationPending(placement) ? styles.floating : '', offsetValue: getOffsetState(placement), flipOptions: flipOptions, shiftOptions: shiftOptions, children: renderDrawer(placement) }) }) }));
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
    return (jsxRuntime.jsxs("div", { ref: rootRef, className: classes, ...testIdProps, children: [getDrawer(stringStart), jsxRuntime.jsxs("div", { ref: centerRef, className: styles.centerSection, children: [jsxRuntime.jsx("div", { className: styles.mainContent, children: children }), getDrawer(stringBottom)] }), getDrawer(stringEnd)] }));
};

exports.DrawerLayout = DrawerLayout;
//# sourceMappingURL=UNSAFE_DrawerLayout.js.map
