/* @oracle/oraclejet-preact: undefined */
import { useRef, useCallback } from 'preact/hooks';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useSwipe(onSwipe, { threshold = 10, maximumTime = 300, tolerance = 50, isDisabled = false } = {
    threshold: 10,
    maximumTime: 300,
    tolerance: 50,
    isDisabled: false
}) {
    const ref = useRef({
        pointerDownId: 0,
        startTime: null,
        prevoffsetX: 0,
        prevoffsetY: 0
    });
    const clearSwipe = useCallback(() => {
        ref.current = {
            pointerDownId: null,
            startTime: 0,
            prevoffsetX: 0,
            prevoffsetY: 0
        };
    }, []);
    const onPointerDown = useCallback((e) => {
        if (!ref.current.pointerDownId) {
            ref.current = {
                pointerDownId: e.pointerId,
                startTime: e.timeStamp,
                prevoffsetX: e.offsetX,
                prevoffsetY: e.offsetY
            };
        }
        else {
            clearSwipe();
        }
    }, [clearSwipe]);
    const onPointerUp = useCallback((ev) => {
        if (ev.pointerId === ref.current.pointerDownId) {
            if (ref.current.startTime && ev.timeStamp - ref.current.startTime < maximumTime) {
                if (ref.current.prevoffsetX - ev.offsetX > threshold &&
                    Math.abs(ev.offsetY - ref.current.prevoffsetY) <= tolerance) {
                    onSwipe?.({ direction: 'left' });
                }
                else if (ev.offsetX - ref.current.prevoffsetX > threshold &&
                    Math.abs(ev.offsetY - ref.current.prevoffsetY) <= tolerance) {
                    onSwipe?.({ direction: 'right' });
                }
                else if (ref.current.prevoffsetY - ev.offsetY > threshold &&
                    Math.abs(ev.offsetX - ref.current.prevoffsetX) <= tolerance) {
                    onSwipe?.({ direction: 'up' });
                }
                else if (ev.offsetY - ref.current.prevoffsetY > threshold &&
                    Math.abs(ev.offsetX - ref.current.prevoffsetX) <= tolerance) {
                    onSwipe?.({ direction: 'down' });
                }
            }
        }
        // state would be reset to its original state whether swipe is completed or cancelled
        clearSwipe();
    }, [threshold, onSwipe, clearSwipe, maximumTime, tolerance]);
    const swipeProps = isDisabled
        ? {}
        : {
            /** event handlers to spread on the target element. */
            onPointerDown,
            onPointerUp,
            onPointerCancel: clearSwipe
        };
    return {
        swipeProps
    };
}

export { useSwipe as u };
//# sourceMappingURL=useSwipe-818b0c1c.js.map
