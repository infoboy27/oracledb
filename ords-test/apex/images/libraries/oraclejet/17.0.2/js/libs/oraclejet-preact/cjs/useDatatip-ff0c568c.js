/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Layer = require('./Layer-3700cd37.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');
var Floating = require('./Floating-1280c2ce.js');
var hooks = require('preact/hooks');
var hooks_PRIVATE_useDatatip_themes_useDatatip_css = require('./hooks/PRIVATE_useDatatip/themes/useDatatip.css.js');
var useId = require('./useId-6c0eeb27.js');
var datatipUtils = require('./datatipUtils-ed3682ed.js');
var useVisHover = require('./useVisHover-ad36112d.js');
var mergeProps = require('./mergeProps-e3da7237.js');

/**
 * The hook to support custom datatip in visualization components.
 */
function useDatatip({ content, placement = 'top-end-corner', offset, borderColor, anchor, touchResponse }) {
    const uniqueIdRef = hooks.useRef(useId.useId());
    const [coords, setCoords] = hooks.useState({ x: 0, y: 0 });
    const offsetValue = offset || { mainAxis: datatipUtils.DATATIP_OFFSET, crossAxis: -1 * datatipUtils.DATATIP_OFFSET };
    const [isVisible, setIsVisible] = hooks.useState(false);
    const targetRef = hooks.useRef(null);
    const toggleTimeoutRef = hooks.useRef();
    const onHover = (event) => {
        setCoords({ x: event.clientX, y: event.clientY });
        setIsVisible(true);
    };
    const onHoverEnter = (event, currentTarget) => {
        if (event.pointerType === 'touch' ||
            event.eventPhase === Event.AT_TARGET ||
            event.eventPhase === Event.BUBBLING_PHASE) {
            targetRef.current = currentTarget;
            setIsVisible(true);
        }
    };
    const onHoverLeave = () => {
        toggleTimeoutRef.current = setTimeout(() => {
            setIsVisible(false);
        }, 20);
    };
    const hoverHandlers = useVisHover.useVisHover(onHover, onHoverEnter, onHoverLeave, touchResponse);
    const onFocus = (event) => {
        if (event.eventPhase === Event.AT_TARGET || event.eventPhase === Event.BUBBLING_PHASE) {
            targetRef.current = event.target;
            setIsVisible(true);
        }
    };
    const onBlur = () => {
        setIsVisible(false);
    };
    const onContentPointerEnter = () => {
        clearTimeout(toggleTimeoutRef.current);
    };
    const onKeyUp = (event) => {
        if (event.code === 'Escape') {
            event.preventDefault();
            setIsVisible(false);
        }
        else if (event.code === 'ArrowUp' ||
            event.code === 'ArrowDown' ||
            event.code === 'ArrowRight' ||
            event.code === 'ArrowLeft' ||
            event.code === 'Tab') {
            setIsVisible(true);
        }
    };
    const anchorRef = anchor === 'element' ? targetRef : { current: coords };
    const datatipContent = isVisible && content != null ? (jsxRuntime.jsx(Layer.Layer, { children: jsxRuntime.jsx(Floating.Floating, { anchorRef: anchorRef, placement: placement, offsetValue: offsetValue, flipOptions: { crossAxis: false, mainAxis: false }, shiftOptions: { crossAxis: true, mainAxis: true }, children: jsxRuntime.jsx("div", { role: "tooltip", id: uniqueIdRef.current, className: hooks_PRIVATE_useDatatip_themes_useDatatip_css.styles.visDatatipStyle, style: { borderColor }, onPointerEnter: onContentPointerEnter, onPointerLeave: onHoverLeave, children: content }) }) })) : null;
    return {
        datatipContent,
        datatipProps: {
            'aria-describedby': datatipContent !== null ? uniqueIdRef.current : undefined,
            ...mergeProps.mergeProps(hoverHandlers, {
                onKeyUp,
                onFocus,
                onBlur
            })
        }
    };
}

exports.useDatatip = useDatatip;
//# sourceMappingURL=useDatatip-ff0c568c.js.map
