/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useId = require('./useId-6c0eeb27.js');
var Floating = require('./Floating-1280c2ce.js');
var Layer = require('./Layer-3700cd37.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var useHover = require('./useHover-910b8e32.js');
var useFocus = require('./useFocus-1b288fb9.js');
var useTouch = require('./useTouch-4dec8729.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useAnimation = require('./useAnimation-2f7dd313.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useThemeInterpolations = require('./useThemeInterpolations-25313f34.js');
var classNames = require('./classNames-c14c6ef3.js');
var hooks_UNSAFE_useTooltip_themes_redwood_TooltipContentTheme = require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');
var useColorScheme = require('./useColorScheme-d2c4adcc.js');

const TooltipContent = ({ children, id, isOpen, isDatatip, onTransitionEnd, testId, ...props }) => {
    const wrapperRef = hooks.useRef(null);
    const popoverRef = hooks.useRef(null);
    const testIdProps = useTestId.useTestId(testId);
    const { baseTheme, variantClasses, styles } = useComponentTheme.useComponentTheme(hooks_UNSAFE_useTooltip_themes_redwood_TooltipContentTheme.TooltipContentRedwoodTheme, {
        variant: isDatatip ? 'datatip' : 'tooltip'
    });
    const schemeClass = useThemeInterpolations.useThemeInterpolations();
    const { nodeRef } = useAnimation.useAnimation(isOpen ? 'mounted' : 'unmounted', {
        animationStates: {
            mounted: (_node) => {
                const childNode = _node.firstChild;
                return {
                    from: {
                        maxHeight: '0',
                        opacity: '0%'
                    },
                    to: {
                        maxHeight: `${childNode?.offsetHeight}px`,
                        opacity: isDatatip ? '100%' : '95%'
                    },
                    options: {
                        duration: isDatatip ? 1 : 100,
                        easing: [0.0, 0.0, 0.2, 1]
                    }
                };
            },
            unmounted: (_node) => {
                return {
                    from: {
                        opacity: isDatatip ? '100%' : '95%'
                    },
                    to: {
                        maxHeight: '0',
                        opacity: '0%'
                    },
                    options: {
                        duration: isDatatip ? 1 : 100,
                        easing: [0.0, 0.0, 0.2, 1]
                    }
                };
            }
        },
        isAnimatedOnMount: true,
        onAnimationEnd: () => onTransitionEnd?.()
    });
    // Set up initial wrapper height so Tooltip can animate from the bottom to the top
    hooks.useEffect(() => {
        if (wrapperRef.current && popoverRef.current?.offsetHeight) {
            wrapperRef.current.style.height = `${popoverRef.current?.offsetHeight}px`;
        }
    }, []);
    return (jsxRuntime.jsx("div", { ref: wrapperRef, id: id, role: "tooltip", class: classNames.classNames([styles.wrapper, schemeClass, baseTheme]), ...testIdProps, children: jsxRuntime.jsx("div", { ref: nodeRef, class: styles.inner, ...props, children: jsxRuntime.jsx("div", { ref: popoverRef, class: classNames.classNames([variantClasses, styles.content]), children: children }) }) }));
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * A global tooltip manager that
 * - ensures that only one tooltip is shown at a time
 * - detects a Tab key press and allows tooltips to check if their target was focused via keyboard
 */
class TooltipManager {
    constructor() {
        this.keyDownHandler = (event) => {
            if (event.key === 'Tab') {
                this.tabKeyActive = true;
                setTimeout(() => {
                    this.tabKeyActive = false;
                }, 100);
            }
        };
        /**
         * notifies the previously registered active tooltip callback and registers a new one
         */
        this.register = (callback) => {
            if (this.activeCallback && this.activeCallback !== callback) {
                this.activeCallback();
            }
            this.activeCallback = callback;
        };
        /**
         * resets the registered active callback
         */
        this.unregister = (callback) => {
            if (this.activeCallback === callback) {
                this.activeCallback = null;
            }
        };
        /**
         * returns the active Tab key status ('active' means a Tab key press within the last 100ms)
         */
        this.isTabKeyActive = () => {
            return this.tabKeyActive;
        };
        this.activeCallback = null;
        this.tabKeyActive = false;
        window.addEventListener('keydown', this.keyDownHandler, true);
    }
}

// Global TooltipManager singleton instance
const globalTooltipManager = new TooltipManager();
const positionToPlacement = (position) => {
    let placement = 'bottom';
    switch (position) {
        case 'top':
        case 'end':
        case 'bottom':
        case 'start':
            placement = position;
            break;
        case 'top-end':
            placement = 'top-end-corner';
            break;
        case 'bottom-end':
            placement = 'bottom-end-corner';
            break;
        case 'bottom-start':
            placement = 'bottom-start-corner';
            break;
        case 'top-start':
            placement = 'top-start-corner';
            break;
    }
    return placement;
};
const useTooltipControlled = ({ text, isOpen = false, variant = 'tooltip', position = 'bottom', focusStrategy = 'browser', isDisabled = false, anchor = { x: 'element', y: 'element' }, offset = { mainAxis: 0, crossAxis: 0 }, onToggle, testId }) => {
    const disabled = isDisabled || !text;
    const isInitialRenderState = hooks.useRef(true);
    const [state, _setState] = hooks.useState(!disabled && isOpen ? 'mounting' : 'unmounted');
    const stateRef = hooks.useRef(state);
    const setState = (newState) => {
        stateRef.current = newState;
        _setState(newState);
    };
    // const tooltipId = useRef<string>(useId());
    const [needsUpdate, setNeedsUpdate] = hooks.useState(false);
    setNeedsUpdate(false);
    const isDatatip = variant === 'datatip';
    const [isLogicalFocus, setLogicalFocus] = hooks.useState(false);
    const isLogicalFocusStrategy = focusStrategy === 'logical';
    const isInitialRenderTrigger = hooks.useRef(true);
    const { hoverProps, isHover } = useHover.useHover({});
    const { touchProps, isTouch } = useTouch.useTouch({ isDisabled }); // TODO replace by useLongPress actionhook
    // we only care about keyboard focus, don't enable useFocus hook if isHover or isTouch are active
    const { focusProps, isFocus } = useFocus.useFocus({
        isDisabled: isLogicalFocusStrategy
    });
    const { hoverProps: popoverHoverProps, isHover: popoverIsHover } = useHover.useHover({ isDisabled });
    const isPointer = anchor.x === 'pointer' || anchor.y === 'pointer';
    const uniqueIdRef = hooks.useRef(useId.useId());
    const targetRef = hooks.useRef(null);
    const coordsRef = hooks.useRef({ x: -9999, y: -9999 });
    // if anchor is set to pointer and target does not have keyboard focus, use coords
    const usedRef = isPointer && !isFocus ? coordsRef : targetRef;
    const delay = isDatatip ? 0 : 250;
    const toggleTimeoutRef = hooks.useRef(null);
    const currentColorScheme = useColorScheme.useColorScheme();
    const newColorScheme = !currentColorScheme || currentColorScheme === 'light' ? 'dark' : 'light';
    const focusActive = hooks.useRef(false);
    const hoverActive = hooks.useRef(false);
    const toggleTimeoutClear = () => {
        if (toggleTimeoutRef.current) {
            clearTimeout(toggleTimeoutRef.current);
            toggleTimeoutRef.current = null;
        }
    };
    /*
     * This effect executes when isFocus/isLogicalFocus changes
     * - focusActive ref is set if the focus change follows a Tab key
     * - hoverActive ref is reset, if focusActive becomes true
     */
    hooks.useEffect(() => {
        if (isLogicalFocusStrategy) {
            focusActive.current = isLogicalFocus;
        }
        else {
            focusActive.current = isFocus && globalTooltipManager.isTabKeyActive();
        }
        if (focusActive.current) {
            hoverActive.current = false;
        }
    }, [isFocus, isLogicalFocus, isLogicalFocusStrategy]);
    /*
     * This effect executes when isHover state changes
     * - focusActive ref is reset, if hoverActive becomes true
     */
    hooks.useEffect(() => {
        hoverActive.current = isHover;
        if (hoverActive.current) {
            focusActive.current = false;
        }
    }, [isHover]);
    hooks.useEffect(() => {
        // inner function for state transitions on various trigger changes
        const updateState = (open) => {
            if (open) {
                // At least one toggle event is set to true
                switch (state) {
                    case 'unmounted':
                        setState('mountPending'); // Set mount pending state if tooltip is unmounted
                        break;
                    case 'unmounting': // Switch back to mounting when unmounting was in progress and the tooltip should stay on
                        setState('mounting');
                        onToggle?.({ value: true });
                        break;
                    case 'unmountPending':
                        toggleTimeoutClear();
                        setState('mounted'); // Clear timers immediately and keep the tooltip mounted
                        break;
                }
            }
            else {
                // No toggle events are set to true
                switch (state) {
                    case 'mounting':
                    case 'mounted':
                        setState('unmountPending'); // Set unmount pending state if tooltip is mounted or in mounting transition
                        break;
                    case 'mountPending':
                        toggleTimeoutClear();
                        __resetCoords();
                        setState('unmounted'); // Unmount tooltip immediately if mounting is pending
                        break;
                }
            }
        };
        if (isInitialRenderTrigger.current) {
            // On onitial render do not trigger rerender
            isInitialRenderTrigger.current = false;
            return;
        }
        // When pointer is used, handleMouseMove method is responsible for state updates
        // until the tooltip is mounted
        if (isPointer && isHover && state === 'unmounted') {
            return;
        }
        updateState((isHover && hoverActive.current) ||
            ((isFocus || isLogicalFocus) && focusActive.current) ||
            popoverIsHover ||
            isTouch);
    }, [isHover, isFocus, isLogicalFocus, popoverIsHover, isTouch, isPointer, state, onToggle]);
    const destroyCallback = hooks.useCallback(() => {
        focusActive.current = false;
        hoverActive.current = false;
        onToggle?.({ value: false });
    }, []); // cannot depend on the 'onToggle' prop as some clients tend to pass a new callback on each render
    hooks.useEffect(() => {
        if (isInitialRenderState.current) {
            // On onitial render do not trigger rerender
            isInitialRenderState.current = false;
            return;
        }
        setState(isOpen ? 'mounting' : 'unmounting');
    }, [isOpen]);
    hooks.useEffect(() => {
        return () => {
            // make sure to clear the toggle timeout on unmount
            toggleTimeoutClear();
            // reset focusActive and hoverActive refs
            focusActive.current = false;
            hoverActive.current = false;
        };
    }, []);
    /*
     * This effect executes when the component state changes.
     * On 'mounted' state, the tooltip registers itself with the global tooltip manager.
     * On 'unmounted', the tooltip unregisters from the global tooltip manager.
     */
    hooks.useEffect(() => {
        if (state === 'mounted') {
            globalTooltipManager.register(destroyCallback);
        }
        else if (state === 'unmounted') {
            globalTooltipManager.unregister(destroyCallback);
        }
    }, [state, destroyCallback]);
    /*
     * Set a timer to toggle the state afer the 'pending' period expires
     */
    hooks.useEffect(() => {
        if (!toggleTimeoutRef.current && (state === 'mountPending' || state === 'unmountPending')) {
            toggleTimeoutRef.current = setTimeout(() => {
                toggleTimeoutClear();
                // make sure the state has not changed in the mean time before onToggle
                if ((state === 'mountPending' || state === 'unmountPending') &&
                    state === stateRef.current) {
                    onToggle?.({ value: state === 'mountPending' });
                }
            }, delay);
        }
        return () => {
            toggleTimeoutClear();
        };
    }, [state, delay, onToggle]);
    const handleMouseMove = (event) => {
        // we only want track mouse move while the state is 'unmounted' or when moving a 'mounted' datatip
        if (state !== 'unmounted' && !(variant === 'datatip' && state === 'mounted')) {
            return;
        }
        const targetRect = targetRef?.current?.getBoundingClientRect();
        // Tooltip maintains static offset from left side of window
        const distanceX = document.body.scrollLeft + (targetRect?.left || 0) + (targetRect?.width || 0);
        // Tooltip maintains static offset from top side of the window
        const distanceY = document.body.scrollTop + (targetRect?.top || 0) + (targetRect?.height || 0);
        // Display tooltip at the mouse position if both anchors are set to pointer
        const x = anchor.x === 'pointer' ? event.clientX : distanceX;
        const y = anchor.y === 'pointer' ? event.clientY : distanceY;
        if (state === 'mounted') {
            coordsRef.current = { x, y };
            if (needsUpdate !== true)
                setNeedsUpdate(true);
        }
        else if (state === 'unmounted') {
            toggleTimeoutClear();
            toggleTimeoutRef.current = setTimeout(() => {
                if (state === 'unmounted') {
                    coordsRef.current = { x, y };
                    onToggle?.({ value: true });
                }
            }, delay);
        }
    };
    const onLogicalFocus = (target) => {
        setLogicalFocus(true);
        targetRef.current = target;
        usedRef.current = target;
    };
    const onLogicalBlur = () => {
        setLogicalFocus(false);
    };
    const onFocusCallback = hooks.useCallback((event) => {
        if (event.eventPhase === Event.AT_TARGET ||
            (event.eventPhase === Event.BUBBLING_PHASE && isDatatip)) {
            targetRef.current = event.target;
        }
    }, [isDatatip]);
    const onBlurCallback = hooks.useCallback((event) => {
        if (event.eventPhase === Event.AT_TARGET) {
            // reset focusActive flag
            focusActive.current = false;
        }
    }, []);
    const focusInitProps = isLogicalFocusStrategy
        ? {}
        : {
            onFocus: onFocusCallback,
            onBlur: onBlurCallback
        };
    const hoverInitProps = {
        onMouseEnter: hooks.useCallback((event) => {
            targetRef.current = event.target;
        }, [])
    };
    const keyInitProps = {
        onKeyDown: hooks.useCallback((event) => {
            if (event.code === 'Escape' && focusActive.current) {
                event.preventDefault();
                // focus no longer active after Escape
                focusActive.current = false;
                onToggle?.({ value: false });
            }
        }, [onToggle])
    };
    let actionableProps;
    const __resetCoords = () => {
        coordsRef.current = { x: -9999, y: -9999 };
    };
    if (disabled) {
        actionableProps = mergeProps.mergeProps(hoverProps, focusProps, hoverInitProps, focusInitProps);
    }
    else {
        const anchorInitProps = {
            'aria-describedby': uniqueIdRef.current,
            ...(isPointer && {
                onMouseLeave: () => {
                    if (state === 'mounting') {
                        return;
                    }
                    toggleTimeoutClear();
                },
                onMouseMove: (event) => {
                    handleMouseMove(event);
                }
            })
        };
        actionableProps = mergeProps.mergeProps(hoverProps, focusProps, touchProps, hoverInitProps, focusInitProps, anchorInitProps, keyInitProps, isLogicalFocusStrategy ? { onLogicalFocus, onLogicalBlur } : {});
    }
    // No need to process tooltip if disabled or no text is provided
    // Include actionableProps to detect mouseenter in components
    // hovered state won't update unless actionableProps are already present in the component when mouse enters
    if (disabled) {
        toggleTimeoutClear();
        __resetCoords();
        return {
            tooltipContent: null,
            tooltipProps: actionableProps
        };
    }
    const placement = positionToPlacement(position);
    const handleTransitionEnd = () => {
        if (state === 'mounting') {
            setState('mounted');
        }
        if (state === 'unmounting') {
            __resetCoords();
            setState('unmounted');
        }
    };
    const renderRawContent = (jsxRuntime.jsx(TooltipContent, { id: uniqueIdRef.current, testId: testId, isOpen: ['mounting', 'mounted', 'unmountPending'].includes(state), ...popoverHoverProps, isDatatip: isDatatip, onTransitionEnd: handleTransitionEnd, children: text }));
    const renderTooltipOrDatatip = () => {
        if (variant === 'tooltip') {
            return (jsxRuntime.jsx(EnvironmentProvider.EnvironmentProvider, { environment: { colorScheme: newColorScheme }, children: renderRawContent }));
        }
        else {
            return jsxRuntime.jsx(jsxRuntime.Fragment, { children: renderRawContent });
        }
    };
    const renderContent = (jsxRuntime.jsx(Layer.Layer, { children: jsxRuntime.jsx(Floating.Floating, { anchorRef: usedRef, placement: placement, offsetValue: offset, children: renderTooltipOrDatatip() }) }));
    return {
        tooltipContent: !['unmounted', 'mountPending'].includes(state) && renderContent,
        tooltipProps: actionableProps
    };
};

exports.useTooltipControlled = useTooltipControlled;
//# sourceMappingURL=useTooltipControlled-706a3651.js.map
