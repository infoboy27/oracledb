/* @oracle/oraclejet-preact: undefined */
import { jsx, Fragment } from 'preact/jsx-runtime';
import { useRef, useEffect, useCallback } from 'preact/hooks';
import { F as Floating } from './Floating-9703160e.js';
import { L as Layer } from './Layer-9b06412e.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { K as KEYS } from './keyboardUtils-4db21770.js';
import { f as focusWithin } from './tabbableUtils-dca964ca.js';
import { u as usePopupAnimation } from './usePopupAnimation-4be04290.js';
import { g as getTransformOrigin } from './popupAnimationUtils-d4c27cd1.js';
import { dropdownStyles } from './UNSAFE_Dropdown/themes/dropdownStyles.css.js';
import { u as useOutsideMousedown } from './useOutsideMousedown-7307de8b.js';
import { m as mergeAnimationStateObjects, D as DURATION_LARGE, b as SCALE_UP_FULL } from './animationUtils-5f409a6c.js';

const DEFAULT_PLACEMENT = 'bottom-start';
const DEFAULT_OFFSET = { mainAxis: 4, crossAxis: 0 };
const DEFAULT_SIZE_OPTIONS = { isMaxWidthAdjusted: true, isMaxHeightAdjusted: true };
const DEFAULT_FLIP_OPTIONS = { mainAxis: true, crossAxis: true };
const animationStates = {
    opening: (node) => {
        return mergeAnimationStateObjects([
            SCALE_UP_FULL,
            {
                from: { transformOrigin: getTransformOrigin(node.placement, node.direction) },
                to: { transformOrigin: getTransformOrigin(node.placement, node.direction) }
            }
        ], {
            duration: DURATION_LARGE
        });
    }
};
//TODO: Add animation to dropdown. JET-62628
//TODO: Investigate best approach to have different virtual padding depending on the position and implement it.JET-57950
function Dropdown({ isOpen = false, anchorRef, children, id, onClose, minWidth, placement = DEFAULT_PLACEMENT, offset = DEFAULT_OFFSET, onPosition, flipOptions = DEFAULT_FLIP_OPTIONS, sizeOptions = DEFAULT_SIZE_OPTIONS, shiftOptions, initialFocus = 'none' }) {
    const dropdownRef = useRef(null);
    const { status, setAnimationElementRef, onPosition: onPositionAnimated } = usePopupAnimation({
        isOpen,
        placement,
        isAnimatedOnMount: true,
        animationStates,
        onPosition
    });
    useEffect(() => {
        if (status === 'opening') {
            if (initialFocus === 'firstFocusable') {
                const dropdownElement = dropdownRef.current;
                if (dropdownElement) {
                    focusWithin(dropdownElement);
                }
            }
        }
    }, [status, initialFocus]);
    const handleMousedownClose = useCallback((event) => {
        onClose?.({ reason: 'outsideMousedown', target: event.target });
    }, [onClose]);
    const handleKeyDown = useCallback((event) => {
        if (event.defaultPrevented) {
            return;
        }
        switch (event.code) {
            case KEYS.ESC:
                onClose?.({ reason: 'dismissed' });
                break;
            case KEYS.TAB:
                onClose?.({ reason: 'dismissed' });
                break;
        }
    }, [onClose]);
    // use the mousedown event to be consistent with legacy JET
    useOutsideMousedown({
        isDisabled: false,
        ref: [dropdownRef],
        handler: handleMousedownClose
    });
    return (jsx(Fragment, { children: status !== 'unmounted' ? (jsx(Layer, { logicalParentRef: anchorRef, children: jsx(Floating, { anchorRef: anchorRef, ref: setAnimationElementRef, placement: placement, flipOptions: flipOptions, shiftOptions: shiftOptions, sizeOptions: sizeOptions, offsetValue: offset, onPosition: onPositionAnimated, boundaryOptions: { padding: { top: 8, bottom: 8, left: 0, right: 0 } }, children: jsx("div", { ref: dropdownRef, id: id, class: dropdownStyles.base, style: { minWidth: `${minWidth || 0}px` }, onKeyDown: handleKeyDown, children: children }) }) })) : null }));
}

export { Dropdown as D };
//# sourceMappingURL=Dropdown-717319bb.js.map
