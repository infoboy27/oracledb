/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useRef, useState, useMemo, useCallback, useEffect, useLayoutEffect } from 'preact/hooks';
import { F as Floating } from './Floating-9703160e.js';
import { b as focusOn, g as getActiveElement, f as focusWithin } from './tabbableUtils-dca964ca.js';
import { m as mergeRefs } from './refUtils-b9d8d91a.js';
import { F as FocusTrap } from './FocusTrap-8ddd383f.js';
import { L as Layer } from './Layer-9b06412e.js';
import { forwardRef } from 'preact/compat';
import './LayerHost-45f545d7.js';
import { M as Modal } from './Modal-6b11d8cb.js';
import { W as WindowOverlay } from './WindowOverlay-e14f8324.js';
import { u as usePopupAnimation } from './usePopupAnimation-4be04290.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useOutsideClick } from './useOutsideClick-eb8324f6.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { popupVars } from './UNSAFE_Popup/themes/PopupContract.css.js';
import { g as getVarName } from './stringUtils-16f617bc.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { PopupRedwoodTheme } from './UNSAFE_Popup/themes/redwood/PopupTheme.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';

/**
 * A popup temporarily 'pops up' content in the foreground.
 */
const Popup = forwardRef(({ anchorRef, launcherRef, children, isOpen = false, modality = 'modeless', offset = { mainAxis: 0, crossAxis: 0 }, flipOptions = { mainAxis: true, crossAxis: true }, shiftOptions = { mainAxis: false, crossAxis: false }, onClickOutside, onClose, initialFocus = 'auto', placement = anchorRef ? 'top' : 'center', tail = 'none', onTransitionEnd, onFocusSet, role = modality === 'modeless' ? 'tooltip' : 'dialog', 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy, testId, ...props }, ref) => {
    const localLauncherRef = useRef(null);
    const [popupBgColor, setPopupBgColor] = useState();
    const contentWrapperRef = useRef(null);
    // testId support
    const testIdProps = useTestId(testId);
    // We can not merge outsideClick to onClose event with {reason: 'outsideClick'} payload
    // The reason is that we allow outsideClick/autodismiss in modeless mode and
    // we need to detect outsideClick which is
    useOutsideClick({
        isDisabled: !(isOpen && contentWrapperRef.current),
        ref: contentWrapperRef,
        handler: (event) => {
            onClickOutside?.(event);
        }
    });
    function launcherKeyDownCallback(event) {
        if (localLauncherRef.current === getActiveElement() &&
            event.code === 'F6' &&
            modality === 'modeless') {
            // Prevent default F6 handlers.
            // F6 is a standard Chrome address bar shortcut on Windows.
            event.preventDefault();
            event.stopPropagation();
            focusWithin(contentWrapperRef.current);
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
    const { setAnimationElementRef, status, onPosition } = usePopupAnimation({
        isOpen,
        isAnimatedOnMount: true,
        onTransitionEnd: _onTransitionEnd,
        placement: placement
    });
    const stableRef = useMemo(() => mergeRefs(setAnimationElementRef, ref), [setAnimationElementRef, ref]);
    const returnFocus = useCallback(() => {
        // Try to return focus to 1.launcher or 2.anchor
        const launcherEl = localLauncherRef.current;
        const anchorEl = anchorRef?.current;
        if (launcherEl) {
            focusOn(launcherEl);
            // Checking instanceof to avoid Coords type that can not be focused
        }
        else if (anchorEl && anchorEl instanceof Element) {
            focusOn(anchorEl);
        }
    }, [localLauncherRef, anchorRef?.current]);
    useEffect(() => {
        // Init closing
        if (!isOpen && status === 'opening') {
            // Only actively return focus to the launcher or anchor if the popup contained focus.
            // Otherwise, focus is already elsewhere on the page and should not be forced back
            // because that could reopen the popup again, which essentially prevents the user from
            // moving focus out of the launcher.
            if (contentWrapperRef.current?.contains(getActiveElement())) {
                returnFocus();
            }
        }
    }, [isOpen, status, returnFocus]);
    // Initialize launcher
    useEffect(() => {
        if (isOpen) {
            if (!launcherRef?.current) {
                // 1. If launcher is not defined, most frequent scenario is,
                // that element, that has focus before opening a popup is considered launcher
                localLauncherRef.current = getActiveElement();
            }
            else if (launcherRef.current instanceof Element) {
                // 2. launcherRef element was provided.
                // Verify, if it exists in DOM, otherwise use the last active element
                localLauncherRef.current = document.body.contains(launcherRef.current)
                    ? launcherRef.current
                    : getActiveElement();
            }
            else {
                localLauncherRef.current = getActiveElement();
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
            focusOn(contentWrapperRef.current);
            onFocusSet?.();
            onTransitionEnd?.(false);
        }
        // Case: 'firstFocusable'
        // Focus on first tabbable in the Popup container or container itself if there is none
        if (derivedInitialFocus === 'firstFocusable') {
            focusWithin(contentWrapperRef.current);
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
        const currentlyFocusedEl = getActiveElement();
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
                        focusOn(launcherEl);
                    }
                    break;
            }
        }
    };
    useLayoutEffect(() => {
        if (status === 'unmounted' ||
            contentWrapperRef.current == null ||
            popupBgColor != null ||
            tail === 'none')
            return;
        const backgroundColorVar = getVarName(popupVars.backgroundColor);
        const computedStyle = getComputedStyle(contentWrapperRef.current);
        setPopupBgColor(computedStyle.getPropertyValue(backgroundColorVar));
    }, [status, contentWrapperRef, popupBgColor, tail]);
    // Styles
    const { baseTheme, classes } = useComponentTheme(PopupRedwoodTheme);
    const isMounted = status !== 'unmounted';
    const interpolations = [...Object.values(dimensionInterpolations)];
    const styleInterpolations = mergeInterpolations(interpolations);
    const { ...styles } = styleInterpolations(props);
    const renderPopup = () => {
        return (jsx("div", { ref: contentWrapperRef, tabIndex: -1, role: role, className: classNames([baseTheme, classes]), style: styles, onKeyDown: handlePopupKeyDown, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, ...testIdProps, children: jsx(FocusTrap, { restoreFocusRef: false, children: children }) }));
    };
    const renderFloatingOrOverlayPopup = () => {
        if (!anchorRef || !anchorRef.current) {
            return (jsx(WindowOverlay, { placement: placement, offset: finalOffset, children: jsx("div", { ref: stableRef, children: renderPopup() }) }));
        }
        else {
            return (jsx(Floating, { ref: stableRef, backgroundColor: popupBgColor, anchorRef: anchorRef, placement: placement, offsetValue: finalOffset, flipOptions: flipOptions, shiftOptions: shiftOptions, tail: tail, onPosition: onPosition, children: renderPopup() }));
        }
    };
    if (isMounted) {
        if (modality === 'modal') {
            return jsx(Modal, { isOpen: isMounted, children: renderFloatingOrOverlayPopup() });
        }
        else {
            return jsx(Layer, { children: renderFloatingOrOverlayPopup() });
        }
    }
    else
        return null;
});

export { Popup as P };
//# sourceMappingURL=Popup-8889a781.js.map
