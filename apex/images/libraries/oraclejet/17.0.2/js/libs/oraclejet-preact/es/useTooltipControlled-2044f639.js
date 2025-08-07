/* @oracle/oraclejet-preact: undefined */
import { jsx, Fragment } from 'preact/jsx-runtime';
import { useRef, useEffect, useState, useCallback } from 'preact/hooks';
import { u as useId } from './useId-03dbfdf0.js';
import { F as Floating } from './Floating-9703160e.js';
import { L as Layer } from './Layer-9b06412e.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { u as useFocus } from './useFocus-38c95977.js';
import { u as useTouch } from './useTouch-4828df25.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useAnimation } from './useAnimation-fe9990dc.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useThemeInterpolations } from './useThemeInterpolations-9bddc683.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { TooltipContentRedwoodTheme } from './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js';
import { E as EnvironmentProvider } from './EnvironmentProvider-f543a463.js';
import { u as useColorScheme } from './useColorScheme-e1b17324.js';

const TooltipContent = ({ children, id, isOpen, isDatatip, onTransitionEnd, testId, ...props }) => {
    const wrapperRef = useRef(null);
    const popoverRef = useRef(null);
    const testIdProps = useTestId(testId);
    const { baseTheme, variantClasses, styles } = useComponentTheme(TooltipContentRedwoodTheme, {
        variant: isDatatip ? 'datatip' : 'tooltip'
    });
    const schemeClass = useThemeInterpolations();
    const { nodeRef } = useAnimation(isOpen ? 'mounted' : 'unmounted', {
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
    useEffect(() => {
        if (wrapperRef.current && popoverRef.current?.offsetHeight) {
            wrapperRef.current.style.height = `${popoverRef.current?.offsetHeight}px`;
        }
    }, []);
    return (jsx("div", { ref: wrapperRef, id: id, role: "tooltip", class: classNames([styles.wrapper, schemeClass, baseTheme]), ...testIdProps, children: jsx("div", { ref: nodeRef, class: styles.inner, ...props, children: jsx("div", { ref: popoverRef, class: classNames([variantClasses, styles.content]), children: children }) }) }));
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
    const isInitialRenderState = useRef(true);
    const [state, _setState] = useState(!disabled && isOpen ? 'mounting' : 'unmounted');
    const stateRef = useRef(state);
    const setState = (newState) => {
        stateRef.current = newState;
        _setState(newState);
    };
    // const tooltipId = useRef<string>(useId());
    const [needsUpdate, setNeedsUpdate] = useState(false);
    setNeedsUpdate(false);
    const isDatatip = variant === 'datatip';
    const [isLogicalFocus, setLogicalFocus] = useState(false);
    const isLogicalFocusStrategy = focusStrategy === 'logical';
    const isInitialRenderTrigger = useRef(true);
    const { hoverProps, isHover } = useHover({});
    const { touchProps, isTouch } = useTouch({ isDisabled }); // TODO replace by useLongPress actionhook
    // we only care about keyboard focus, don't enable useFocus hook if isHover or isTouch are active
    const { focusProps, isFocus } = useFocus({
        isDisabled: isLogicalFocusStrategy
    });
    const { hoverProps: popoverHoverProps, isHover: popoverIsHover } = useHover({ isDisabled });
    const isPointer = anchor.x === 'pointer' || anchor.y === 'pointer';
    const uniqueIdRef = useRef(useId());
    const targetRef = useRef(null);
    const coordsRef = useRef({ x: -9999, y: -9999 });
    // if anchor is set to pointer and target does not have keyboard focus, use coords
    const usedRef = isPointer && !isFocus ? coordsRef : targetRef;
    const delay = isDatatip ? 0 : 250;
    const toggleTimeoutRef = useRef(null);
    const currentColorScheme = useColorScheme();
    const newColorScheme = !currentColorScheme || currentColorScheme === 'light' ? 'dark' : 'light';
    const focusActive = useRef(false);
    const hoverActive = useRef(false);
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
    useEffect(() => {
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
    useEffect(() => {
        hoverActive.current = isHover;
        if (hoverActive.current) {
            focusActive.current = false;
        }
    }, [isHover]);
    useEffect(() => {
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
    const destroyCallback = useCallback(() => {
        focusActive.current = false;
        hoverActive.current = false;
        onToggle?.({ value: false });
    }, []); // cannot depend on the 'onToggle' prop as some clients tend to pass a new callback on each render
    useEffect(() => {
        if (isInitialRenderState.current) {
            // On onitial render do not trigger rerender
            isInitialRenderState.current = false;
            return;
        }
        setState(isOpen ? 'mounting' : 'unmounting');
    }, [isOpen]);
    useEffect(() => {
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
    useEffect(() => {
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
    useEffect(() => {
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
    const onFocusCallback = useCallback((event) => {
        if (event.eventPhase === Event.AT_TARGET ||
            (event.eventPhase === Event.BUBBLING_PHASE && isDatatip)) {
            targetRef.current = event.target;
        }
    }, [isDatatip]);
    const onBlurCallback = useCallback((event) => {
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
        onMouseEnter: useCallback((event) => {
            targetRef.current = event.target;
        }, [])
    };
    const keyInitProps = {
        onKeyDown: useCallback((event) => {
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
        actionableProps = mergeProps(hoverProps, focusProps, hoverInitProps, focusInitProps);
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
        actionableProps = mergeProps(hoverProps, focusProps, touchProps, hoverInitProps, focusInitProps, anchorInitProps, keyInitProps, isLogicalFocusStrategy ? { onLogicalFocus, onLogicalBlur } : {});
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
    const renderRawContent = (jsx(TooltipContent, { id: uniqueIdRef.current, testId: testId, isOpen: ['mounting', 'mounted', 'unmountPending'].includes(state), ...popoverHoverProps, isDatatip: isDatatip, onTransitionEnd: handleTransitionEnd, children: text }));
    const renderTooltipOrDatatip = () => {
        if (variant === 'tooltip') {
            return (jsx(EnvironmentProvider, { environment: { colorScheme: newColorScheme }, children: renderRawContent }));
        }
        else {
            return jsx(Fragment, { children: renderRawContent });
        }
    };
    const renderContent = (jsx(Layer, { children: jsx(Floating, { anchorRef: usedRef, placement: placement, offsetValue: offset, children: renderTooltipOrDatatip() }) }));
    return {
        tooltipContent: !['unmounted', 'mountPending'].includes(state) && renderContent,
        tooltipProps: actionableProps
    };
};

export { useTooltipControlled as u };
//# sourceMappingURL=useTooltipControlled-2044f639.js.map
