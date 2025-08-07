/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { L as Layer } from './Layer-9b06412e.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { F as Floating } from './Floating-9703160e.js';
import { useRef, useState } from 'preact/hooks';
import { styles } from './hooks/PRIVATE_useDatatip/themes/useDatatip.css.js';
import { u as useId } from './useId-03dbfdf0.js';
import { D as DATATIP_OFFSET } from './datatipUtils-5cb22909.js';
import { u as useVisHover } from './useVisHover-d7a0b2f3.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

/**
 * The hook to support custom datatip in visualization components.
 */
function useDatatip({ content, placement = 'top-end-corner', offset, borderColor, anchor, touchResponse }) {
    const uniqueIdRef = useRef(useId());
    const [coords, setCoords] = useState({ x: 0, y: 0 });
    const offsetValue = offset || { mainAxis: DATATIP_OFFSET, crossAxis: -1 * DATATIP_OFFSET };
    const [isVisible, setIsVisible] = useState(false);
    const targetRef = useRef(null);
    const toggleTimeoutRef = useRef();
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
    const hoverHandlers = useVisHover(onHover, onHoverEnter, onHoverLeave, touchResponse);
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
    const datatipContent = isVisible && content != null ? (jsx(Layer, { children: jsx(Floating, { anchorRef: anchorRef, placement: placement, offsetValue: offsetValue, flipOptions: { crossAxis: false, mainAxis: false }, shiftOptions: { crossAxis: true, mainAxis: true }, children: jsx("div", { role: "tooltip", id: uniqueIdRef.current, className: styles.visDatatipStyle, style: { borderColor }, onPointerEnter: onContentPointerEnter, onPointerLeave: onHoverLeave, children: content }) }) })) : null;
    return {
        datatipContent,
        datatipProps: {
            'aria-describedby': datatipContent !== null ? uniqueIdRef.current : undefined,
            ...mergeProps(hoverHandlers, {
                onKeyUp,
                onFocus,
                onBlur
            })
        }
    };
}

export { useDatatip as u };
//# sourceMappingURL=useDatatip-7c661980.js.map
