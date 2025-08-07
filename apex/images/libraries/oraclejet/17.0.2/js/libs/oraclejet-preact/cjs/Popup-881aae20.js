/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Floating = require('./Floating-1280c2ce.js');
var tabbableUtils = require('./tabbableUtils-b49673af.js');
var refUtils = require('./refUtils-915b985d.js');
var FocusTrap = require('./FocusTrap-0a03f5a2.js');
var Layer = require('./Layer-3700cd37.js');
var compat = require('preact/compat');
require('./LayerHost-46e4d858.js');
var Modal = require('./Modal-52fa4530.js');
var WindowOverlay = require('./WindowOverlay-d255542f.js');
var usePopupAnimation = require('./usePopupAnimation-78a173e8.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useOutsideClick = require('./useOutsideClick-7420644b.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_Popup_themes_PopupContract_css = require('./UNSAFE_Popup/themes/PopupContract.css.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_Popup_themes_redwood_PopupTheme = require('./UNSAFE_Popup/themes/redwood/PopupTheme.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');

/**
 * A popup temporarily 'pops up' content in the foreground.
 */
const Popup = compat.forwardRef(({ anchorRef, launcherRef, children, isOpen = false, modality = 'modeless', offset = { mainAxis: 0, crossAxis: 0 }, flipOptions = { mainAxis: true, crossAxis: true }, shiftOptions = { mainAxis: false, crossAxis: false }, onClickOutside, onClose, initialFocus = 'auto', placement = anchorRef ? 'top' : 'center', tail = 'none', onTransitionEnd, onFocusSet, role = modality === 'modeless' ? 'tooltip' : 'dialog', 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy, testId, ...props }, ref) => {
    const localLauncherRef = hooks.useRef(null);
    const [popupBgColor, setPopupBgColor] = hooks.useState();
    const contentWrapperRef = hooks.useRef(null);
    // testId support
    const testIdProps = useTestId.useTestId(testId);
    // We can not merge outsideClick to onClose event with {reason: 'outsideClick'} payload
    // The reason is that we allow outsideClick/autodismiss in modeless mode and
    // we need to detect outsideClick which is
    useOutsideClick.useOutsideClick({
        isDisabled: !(isOpen && contentWrapperRef.current),
        ref: contentWrapperRef,
        handler: (event) => {
            onClickOutside?.(event);
        }
    });
    function launcherKeyDownCallback(event) {
        if (localLauncherRef.current === tabbableUtils.getActiveElement() &&
            event.code === 'F6' &&
            modality === 'modeless') {
            // Prevent default F6 handlers.
            // F6 is a standard Chrome address bar shortcut on Windows.
            event.preventDefault();
            event.stopPropagation();
            tabbableUtils.focusWithin(contentWrapperRef.current);
            onFocusSet?.();
        }
    }
    const _onTransitionEnd = (isOpen) => {
        if (isOpen) {
            setInitialFocus();
            onTransitionEnd?.(true);
        }
        else {
            onTransitionEnd?.(false);
        }
    };
    // Animation
    const { setAnimationElementRef, status, onPosition } = usePopupAnimation.usePopupAnimation({
        isOpen,
        isAnimatedOnMount: true,
        onTransitionEnd: _onTransitionEnd,
        placement: placement
    });
    const stableRef = hooks.useMemo(() => refUtils.mergeRefs(setAnimationElementRef, ref), [setAnimationElementRef, ref]);
    const returnFocus = hooks.useCallback(() => {
        // Try to return focus to 1.launcher or 2.anchor
        const launcherEl = localLauncherRef.current;
        const anchorEl = anchorRef?.current;
        if (launcherEl) {
            tabbableUtils.focusOn(launcherEl);
            // Checking instanceof to avoid Coords type that can not be focused
        }
        else if (anchorEl && anchorEl instanceof Element) {
            tabbableUtils.focusOn(anchorEl);
        }
    }, [localLauncherRef, anchorRef?.current]);
    hooks.useEffect(() => {
        // Init closing
        if (!isOpen && status === 'opening') {
            // Only actively return focus to the launcher or anchor if the popup contained focus.
            // Otherwise, focus is already elsewhere on the page and should not be forced back
            // because that could reopen the popup again, which essentially prevents the user from
            // moving focus out of the launcher.
            if (contentWrapperRef.current?.contains(tabbableUtils.getActiveElement())) {
                returnFocus();
            }
        }
    }, [isOpen, status, returnFocus]);
    // Initialize launcher
    hooks.useEffect(() => {
        if (isOpen) {
            if (!launcherRef?.current) {
                // 1. If launcher is not defined, most frequent scenario is,
                // that element, that has focus before opening a popup is considered launcher
                localLauncherRef.current = tabbableUtils.getActiveElement();
            }
            else if (launcherRef.current instanceof Element) {
                // 2. launcherRef element was provided.
                // Verify, if it exists in DOM, otherwise use the last active element
                localLauncherRef.current = document.body.contains(launcherRef.current)
                    ? launcherRef.current
                    : tabbableUtils.getActiveElement();
            }
            else {
                localLauncherRef.current = tabbableUtils.getActiveElement();
            }
            // Register F6 key handler to enter the Popup
            localLauncherRef.current?.addEventListener('keydown', launcherKeyDownCallback);
        }
        return () => {
            // Deregister F6 key handler
            localLauncherRef.current?.removeEventListener('keydown', launcherKeyDownCallback);
        };
    }, [isOpen, launcherRef]);
    // Note: unlike oj-c-popup we do not default anchorRef to launcherRef in Preact Popup
    // If anchorRef is undefined, we use WindowOverlay as anchor
    const setInitialFocus = () => {
        let derivedInitialFocus = initialFocus;
        if (initialFocus === 'auto') {
            if (modality === 'modal') {
                // modal mode - set focus to first focusable
                derivedInitialFocus = 'firstFocusable';
            }
            else {
                // modeless mode - do not steal focus by default
                derivedInitialFocus = 'none';
            }
        }
        // Case: 'popup'
        // Focus on Popup container
        if (derivedInitialFocus === 'popup') {
            tabbableUtils.focusOn(contentWrapperRef.current);
            onFocusSet?.();
            onTransitionEnd?.(false);
        }
        // Case: 'firstFocusable'
        // Focus on first tabbable in the Popup container or container itself if there is none
        if (derivedInitialFocus === 'firstFocusable') {
            tabbableUtils.focusWithin(contentWrapperRef.current);
            onFocusSet?.();
        }
    };
    const getMainAxisOffset = (offset) => {
        let calcOffset = 0;
        if (offset) {
            // @ts-ignore as OffsetFunction is going to be removed
            // Property 'mainAxis' does not exist on type 'OffsetFunction'.
            calcOffset = typeof offset === 'number' ? offset : offset.mainAxis || 0;
            if (tail === 'simple') {
                calcOffset += 5;
            }
        }
        return calcOffset;
    };
    const getCrossAxisOffset = (offset) => {
        if (!offset) {
            return 0;
        }
        else {
            // @ts-ignore as OffsetFunction is going to be removed
            // Property 'crossAxis' does not exist on type 'OffsetFunction'.
            return typeof offset === 'number' ? 0 : offset.crossAxis || 0;
        }
    };
    const finalOffset = {
        mainAxis: getMainAxisOffset(offset),
        crossAxis: getCrossAxisOffset(offset)
    };
    const handlePopupKeyDown = (event) => {
        const currentlyFocusedEl = tabbableUtils.getActiveElement();
        const wrapperEl = contentWrapperRef.current;
        const launcherEl = localLauncherRef.current;
        if (wrapperEl === currentlyFocusedEl || wrapperEl?.contains(currentlyFocusedEl)) {
            switch (event.code) {
                case 'Escape': {
                    // Trigger onClose event with outside click detail
                    onClose?.({ reason: 'escapeKey' });
                    break;
                }
                case 'F6':
                    // Prevent default F6 handlers.
                    // F6 is a standard Chrome address bar shortcut on Windows.
                    event.preventDefault();
                    event.stopPropagation();
                    // Focus launcher
                    if (launcherEl && modality === 'modeless') {
                        tabbableUtils.focusOn(launcherEl);
                    }
                    break;
            }
        }
    };
    hooks.useLayoutEffect(() => {
        if (status === 'unmounted' ||
            contentWrapperRef.current == null ||
            popupBgColor != null ||
            tail === 'none')
            return;
        const backgroundColorVar = stringUtils.getVarName(UNSAFE_Popup_themes_PopupContract_css.popupVars.backgroundColor);
        const computedStyle = getComputedStyle(contentWrapperRef.current);
        setPopupBgColor(computedStyle.getPropertyValue(backgroundColorVar));
    }, [status, contentWrapperRef, popupBgColor, tail]);
    // Styles
    const { baseTheme, classes } = useComponentTheme.useComponentTheme(UNSAFE_Popup_themes_redwood_PopupTheme.PopupRedwoodTheme);
    const isMounted = status !== 'unmounted';
    const interpolations = [...Object.values(dimensions.dimensionInterpolations)];
    const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
    const { ...styles } = styleInterpolations(props);
    const renderPopup = () => {
        return (jsxRuntime.jsx("div", { ref: contentWrapperRef, tabIndex: -1, role: role, className: classNames.classNames([baseTheme, classes]), style: styles, onKeyDown: handlePopupKeyDown, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, ...testIdProps, children: jsxRuntime.jsx(FocusTrap.FocusTrap, { restoreFocusRef: false, children: children }) }));
    };
    const renderFloatingOrOverlayPopup = () => {
        if (!anchorRef || !anchorRef.current) {
            return (jsxRuntime.jsx(WindowOverlay.WindowOverlay, { placement: placement, offset: finalOffset, children: jsxRuntime.jsx("div", { ref: stableRef, children: renderPopup() }) }));
        }
        else {
            return (jsxRuntime.jsx(Floating.Floating, { ref: stableRef, backgroundColor: popupBgColor, anchorRef: anchorRef, placement: placement, offsetValue: finalOffset, flipOptions: flipOptions, shiftOptions: shiftOptions, tail: tail, onPosition: onPosition, children: renderPopup() }));
        }
    };
    if (isMounted) {
        if (modality === 'modal') {
            return jsxRuntime.jsx(Modal.Modal, { isOpen: isMounted, children: renderFloatingOrOverlayPopup() });
        }
        else {
            return jsxRuntime.jsx(Layer.Layer, { children: renderFloatingOrOverlayPopup() });
        }
    }
    else
        return null;
});

exports.Popup = Popup;
//# sourceMappingURL=Popup-881aae20.js.map
