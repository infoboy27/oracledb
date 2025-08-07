/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import type { PanState } from '../diagram.types';
import { Ref } from 'preact/hooks';
import { PanBounds } from '../utils/panUtils';
/**
 * Options for useDragPan hook
 */
type UseDragPanOptions = {
    panProps: {
        panning: 'centerContent' | 'fixed' | 'off';
        centerX: number;
        centerY: number;
        panDirection: 'x' | 'y' | 'any';
        onPan?: (detail: PanState) => void;
    };
    captureTargetRef: Ref<HTMLDivElement>;
    panBounds?: PanBounds;
    onDragPanStart?: () => void;
    onDragPanEnd?: () => void;
    zoom: number;
    width: number;
    height: number;
};
declare const useDragPan: ({ panProps, captureTargetRef, panBounds, width, height, zoom, onDragPanStart, onDragPanEnd }: UseDragPanOptions) => {
    onPointerDown?: undefined;
    onPointerMove?: undefined;
    onPointerUp?: undefined;
    onPointerCancel?: undefined;
    onPointerLeave?: undefined;
} | {
    onPointerDown: (e: PointerEvent) => void;
    onPointerMove: (e: PointerEvent) => void;
    onPointerUp: (e: PointerEvent) => void;
    onPointerCancel: (e: PointerEvent) => void;
    onPointerLeave: (e: PointerEvent) => void;
};
export { useDragPan };
