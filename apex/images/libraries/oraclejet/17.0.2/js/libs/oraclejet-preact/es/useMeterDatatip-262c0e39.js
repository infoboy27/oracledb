/* @oracle/oraclejet-preact: undefined */
import { useRef } from 'preact/hooks';
import { h as handleInput } from './useKeyboardEvents-102b4feb.js';
import { u as useDatatip } from './useDatatip-7c661980.js';
import './datatipUtils-5cb22909.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function usePointerEvents(value, getValue, targetRef, currentInputRef, isPointerActiveRef, onCommit, onInput) {
    const isPointerDown = useRef(false);
    const pointerUpHandler = (event) => {
        isPointerDown.current = false;
        const val = getValue(event);
        if (val !== undefined) {
            onCommit?.({ value: val });
        }
        isPointerActiveRef.current = true;
    };
    const hoverHandler = (event) => {
        if (isPointerDown.current) {
            const val = getValue(event);
            if (val !== undefined && val != currentInputRef.current) {
                handleInput(val, currentInputRef, onInput);
            }
        }
        isPointerActiveRef.current = true;
    };
    const pointerDownHandler = (event) => {
        isPointerDown.current = true;
        targetRef.current?.setPointerCapture(event.pointerId);
        const val = getValue(event);
        if (val !== undefined && val != currentInputRef.current) {
            handleInput(val, currentInputRef, onInput);
        }
        isPointerActiveRef.current = true;
    };
    const blurHandler = () => {
        isPointerDown.current = false;
        onCommit?.({ value: value });
        isPointerActiveRef.current = false;
    };
    const pointerLeaveHandler = () => {
        isPointerActiveRef.current = false;
    };
    return {
        onPointerUp: pointerUpHandler,
        onBlur: blurHandler,
        onPointerMove: hoverHandler,
        onPointerDown: pointerDownHandler,
        onPointerLeave: pointerLeaveHandler
    };
}

function useMeterDatatip(value, isPointerActiveRef, datatip, ariaDescribedBy) {
    const datatipText = datatip === undefined ? `${value}` : datatip;
    const { datatipContent, datatipProps } = useDatatip({
        content: datatipText,
        anchor: isPointerActiveRef.current ? 'pointer' : 'element',
        offset: {
            mainAxis: 8,
            crossAxis: 0
        },
        placement: 'top',
        touchResponse: 'touchStart'
    });
    datatipProps['aria-describedby'] = [ariaDescribedBy, datatipProps['aria-describedby']]
        .filter(Boolean)
        .join(' ');
    return { datatipContent, datatipProps };
}

export { useMeterDatatip as a, usePointerEvents as u };
//# sourceMappingURL=useMeterDatatip-262c0e39.js.map
