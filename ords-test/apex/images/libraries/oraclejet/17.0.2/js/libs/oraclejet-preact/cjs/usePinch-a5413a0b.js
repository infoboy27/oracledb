/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var usePointerGesture = require('./usePointerGesture-44fbeb65.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const getMidpoint = (p1, p2) => ({ x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2 });
const getDistance = (p1, p2) => Math.sqrt((p2.x - p1.x) ** 2 + (p2.y - p2.y) ** 2);
/**
 * Hook that enables and handles pinch gestures.
 */
const usePinch = ({ captureTargetRef, onPinchZoomStart, onPinchZoomChange, onPinchZoomEnd, isDisabled = false }) => {
    const origin = hooks.useRef({ x: -1, y: -1 });
    const prevDistance = hooks.useRef(-1);
    const reset = () => {
        origin.current = { x: -1, y: -1 };
        prevDistance.current = -1;
    };
    if (isDisabled)
        reset();
    const pinchProps = usePointerGesture.usePointerGesture({
        captureTargetRef,
        numPointers: 2, // Pinch gesture requires 2 pointers
        onPointerGestureDown: ({ pointers: [pointer1, pointer2] }) => {
            const p1 = { x: pointer1.offsetX, y: pointer1.offsetY };
            const p2 = { x: pointer2.offsetX, y: pointer2.offsetY };
            origin.current = getMidpoint(p1, p2);
            prevDistance.current = getDistance(p1, p2);
            onPinchZoomStart &&
                onPinchZoomStart({
                    origin: origin.current,
                    delta: 0
                });
        },
        onPointerGestureMove: ({ pointers: [pointer1, pointer2] }) => {
            const p1 = { x: pointer1.offsetX, y: pointer1.offsetY };
            const p2 = { x: pointer2.offsetX, y: pointer2.offsetY };
            const distance = getDistance(p1, p2);
            const delta = distance - prevDistance.current;
            prevDistance.current = distance;
            onPinchZoomChange &&
                onPinchZoomChange({
                    origin: origin.current,
                    delta
                });
        },
        onPointerGestureEnd: () => {
            reset();
            onPinchZoomEnd && onPinchZoomEnd();
        }
    });
    return isDisabled ? {} : pinchProps;
};

exports.usePinch = usePinch;
//# sourceMappingURL=usePinch-a5413a0b.js.map
