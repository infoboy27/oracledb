/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import type { Ref } from 'preact/hooks';
import { ReferenceLine } from '../utils/UNSAFE_meterUtils';
type Dimensions = {
    width: number;
    height: number;
};
/**
 * Returns the metric value of the clicked point.
 * @param event The PointerEvent
 * @param dimensionsRef Ref to stored dimensions of the meter bar.
 * @param min The minimum value of the meter bar.
 * @param max The maximum value of the meter bar.
 * @param step The step value of the meter bar.
 * @param orientation The orientation of the meter bar.
 * @param isRtl Whether the reading mode is 'rtl'
 * @returns The metric value of the clicked point.
 */
export declare function getValue(event: PointerEvent, dimensionsRef: Ref<Dimensions>, min: number, max: number, step: number, orientation?: 'horizontal' | 'vertical', isRtl?: boolean): number | undefined;
/**
 * Returns the true dimension of the meter bar after first render. All dimensions are 0 for initial render.
 * @param element The meter bar track HTML element
 * @returns The dimension of the meter bar.
 */
export declare function getDimensions(element: HTMLElement | null): Dimensions;
/**
 * Returns object with 'start' and 'end' keys. Value for each key will be true if at least one ref line with correposnding position is present in meter bar.
 * @param lines The array of reference lines.
 * @returns Returns object with start and end keys.
 */
export declare function getRefLinesInfo(lines?: ReferenceLine[]): {
    start: boolean;
    end: boolean;
};
export declare const getMarginClass: (info: {
    start: boolean;
    end: boolean;
}, isHoriz: boolean, barTrackMarginTopStyle: string, barTrackMarginStartStyle: string, barTrackMarginBottomStyle: string, barTrackMarginEndStyle: string) => string[];
export declare const getFitMarginClass: (info: {
    start: boolean;
    end: boolean;
}, isHoriz: boolean, barTrackMarginTopFitStyle: string, barTrackMarginStartFitStyle: string, barTrackMarginBottomFitStyle: string, barTrackMarginEndFitStyle: string) => string[];
export declare const getFitTrackWidth: (info: {
    start: boolean;
    end: boolean;
}, width?: number, isHoriz?: boolean) => number | undefined;
export declare const getFitTrackHeight: (info: {
    start: boolean;
    end: boolean;
}, height?: number, isHoriz?: boolean) => number | undefined;
export {};
