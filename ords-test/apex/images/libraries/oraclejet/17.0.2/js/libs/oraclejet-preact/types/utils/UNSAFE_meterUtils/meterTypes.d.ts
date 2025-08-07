/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../UNSAFE_interpolations/colors';
export type MeterSize = 'sm' | 'md' | 'lg' | 'fit';
export type ThresholdDisplay = 'all' | 'track' | 'indicator';
export type VisThresholdsColors = 'danger' | 'warning' | 'success';
export type Threshold = {
    /**
     * The max value of the threshold.
     */
    max: number;
    /**
     * The color for the threshold range.
     * <p>It also supports 'danger', 'warning', 'success' enums which are mapped to colors depending on theme.</p>
     */
    color?: ColorProps['color'] | VisThresholdsColors;
    /**
     * A label to be used for accessibility purposes for the threshold.
     */
    accessibleLabel?: string;
};
export type ReferenceLine = {
    /**
     * The color of the reference line.
     * <p>It also supports 'danger', 'warning', 'success' enums which are mapped to colors depending on theme.</p>
     */
    color?: ColorProps['color'] | VisThresholdsColors;
    /**
     * The value of the reference line.
     */
    value: number;
    /**
     * The position of the reference line.
     */
    position?: 'start' | 'end';
};
export type CommitDetail = {
    value: number;
};
export type InputDetail = {
    value?: number;
};
