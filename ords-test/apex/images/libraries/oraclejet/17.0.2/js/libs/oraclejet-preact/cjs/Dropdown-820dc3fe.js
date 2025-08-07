/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Floating = require('./Floating-1280c2ce.js');
var Layer = require('./Layer-3700cd37.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var keyboardUtils = require('./keyboardUtils-f835e1ee.js');
var tabbableUtils = require('./tabbableUtils-b49673af.js');
var usePopupAnimation = require('./usePopupAnimation-78a173e8.js');
var popupAnimationUtils = require('./popupAnimationUtils-a3dfbdfd.js');
var UNSAFE_Dropdown_themes_dropdownStyles_css = require('./UNSAFE_Dropdown/themes/dropdownStyles.css.js');
var useOutsideMousedown = require('./useOutsideMousedown-a8c09ad9.js');
var animationUtils = require('./animationUtils-54852d03.js');

const DEFAULT_PLACEMENT = 'bottom-start';
const DEFAULT_OFFSET = { mainAxis: 4, crossAxis: 0 };
const DEFAULT_SIZE_OPTIONS = { isMaxWidthAdjusted: true, isMaxHeightAdjusted: true };
const DEFAULT_FLIP_OPTIONS = { mainAxis: true, crossAxis: true };
const animationStates = {
    opening: (node) => {
        return animationUtils.mergeAnimationStateObjects([
            animationUtils.SCALE_UP_FULL,
            {
                from: { transformOrigin: popupAnimationUtils.getTransformOrigin(node.placement, node.direction) },
                to: { transformOrigin: popupAnimationUtils.getTransformOrigin(node.placement, node.direction) }
            }
        ], {
            duration: animationUtils.DURATION_LARGE
        });
    }
};
//TODO: Add animation to dropdown. JET-62628
//TODO: Investigate best approach to have different virtual padding depending on the position and implement it.JET-57950
function Dropdown({ isOpen = false, anchorRef, children, id, onClose, minWidth, placement = DEFAULT_PLACEMENT, offset = DEFAULT_OFFSET, onPosition, flipOptions = DEFAULT_FLIP_OPTIONS, sizeOptions = DEFAULT_SIZE_OPTIONS, shiftOptions, initialFocus = 'none' }) {
    const dropdownRef = hooks.useRef(null);
    const { status, setAnimationElementRef, onPosition: onPositionAnimated } = usePopupAnimation.usePopupAnimation({
        isOpen,
        placement,
        isAnimatedOnMount: true,
        animationStates,
        onPosition
    });
    hooks.useEffect(() => {
        if (status === 'opening') {
            if (initialFocus === 'firstFocusable') {
                const dropdownElement = dropdownRef.current;
                if (dropdownElement) {
                    tabbableUtils.focusWithin(dropdownElement);
                }
            }
        }
    }, [status, initialFocus]);
    const handleMousedownClose = hooks.useCallback((event) => {
        onClose?.({ reason: 'outsideMousedown', target: event.target });
    }, [onClose]);
    const handleKeyDown = hooks.useCallback((event) => {
        if (event.defaultPrevented) {
            return;
        }
        switch (event.code) {
            case keyboardUtils.KEYS.ESC:
                onClose?.({ reason: 'dismissed' });
                break;
            case keyboardUtils.KEYS.TAB:
                onClose?.({ reason: 'dismissed' });
                break;
        }
    }, [onClose]);
    // use the mousedown event to be consistent with legacy JET
    useOutsideMousedown.useOutsideMousedown({
        isDisabled: false,
        ref: [dropdownRef],
        handler: handleMousedownClose
    });
    return (jsxRuntime.jsx(jsxRuntime.Fragment, { children: status !== 'unmounted' ? (jsxRuntime.jsx(Layer.Layer, { logicalParentRef: anchorRef, children: jsxRuntime.jsx(Floating.Floating, { anchorRef: anchorRef, ref: setAnimationElementRef, placement: placement, flipOptions: flipOptions, shiftOptions: shiftOptions, sizeOptions: sizeOptions, offsetValue: offset, onPosition: onPositionAnimated, boundaryOptions: { padding: { top: 8, bottom: 8, left: 0, right: 0 } }, children: jsxRuntime.jsx("div", { ref: dropdownRef, id: id, class: UNSAFE_Dropdown_themes_dropdownStyles_css.dropdownStyles.base, style: { minWidth: `${minWidth || 0}px` }, onKeyDown: handleKeyDown, children: children }) }) })) : null }));
}

exports.Dropdown = Dropdown;
//# sourceMappingURL=Dropdown-820dc3fe.js.map
