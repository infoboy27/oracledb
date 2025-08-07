/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { Threshold, MeterSize, ThresholdDisplay } from '../utils/UNSAFE_meterUtils';
import { Sector } from '../utils/PRIVATE_meterUtils';
import { MeterProps, CircularRefLine } from './meterCircle.types';
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
export type MeterInfo = Required<Pick<MeterProps, 'min' | 'max' | 'value' | 'size' | 'startAngle' | 'angleExtent'>> & {
    section: Sector;
    isRtl: boolean;
    innerRadius: number;
};
/**
 * Returns the calculated css variable string for the inner radius when given size and innerRadius of meter circle.
 * @param size The size of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns {string} CSS varible string for the calculated inner radius of the meter circle.
 */
export declare function getInnerRadius(size: MeterSize, innerRadius?: number, diameter?: number): string;
/**
 * Returns the calculated css variable string for meter circle track for a given size and innerRadius of meter circle.
 * @param size The size of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns {string} CSS variable for the calculated track size of the meter circle.
 */
export declare function getTrackSize(size: MeterSize, innerRadius?: number, diameter?: number): string;
/**
 * Returns the calculated length of reference line for given size and inner radius of meter circle.
 * The length of reference line runs from the inner radius to slight outside the outer radius.
 * The length outside the outer radius depends on size of the meter circle.
 * @param size The size of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns The calculated CSS var for the length of reference line.
 */
export declare function getRefLineLength(size: MeterSize, innerRadius?: number, isXsSize?: boolean, diameter?: number): string;
/**
 * Returns the array of calculated props for InnerCircle representing each threshold.
 * @param meterInfo MeterInfo object containing info about given meter circle.
 * @param thresholds thresholds array of the meter circle.
 * @param isTrackRendered Whether track is rendered.
 * @param trackColor The track color of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns Array of calculated props object for InnerCircle representing each threshold.
 */
export declare function getThresholdsProps(meterInfo: MeterInfo, thresholds: Threshold[], isTrackRendered: boolean, trackColor?: ColorProps['color'], innerRadius?: number, diameter?: number): Array<{
    clipPath: string;
    color?: ColorProps['color'];
    section: Sector;
    size: string;
}>;
/**
 * Returns the calculated props for CircularReferenceLine.
 * @param meterInfo MeterInfo object containing info about the meter circle.
 * @param refLine The CircularRefLine object
 * @param innerRadius The innerRadius of the meter circle.
 * @returns An bject with calculated props for CircularReferenceLine.
 */
export declare function getReferenceLinesProps(meterInfo: MeterInfo, refLine: CircularRefLine, innerRadius?: number, isXsSize?: boolean, diameter?: number): {
    radius: string;
    length: string;
    angle: number;
    color?: ColorProps['color'];
};
/**
 * Returns the calculated props for InnerCircle representing the track.
 * @param meterInfo MeterInfo object containing info about the meter circle.
 * @param trackColor The color of the track.
 * @param istrackRendered Whether the track is rendered.
 * @param thresholdDisplay Specifies whether the current threshold is displayed in the track, on the indicator, or if all thresholds are displayed in the track.
 * @param innerRadius The innerRadius of the meter circle.
 * @param thresholds thresholds array of the meter circle.
 * @returns An object with calculated props for InnerCircle that represents the track.
 */
export declare function getTrackProps(meterInfo: MeterInfo, isTrackRendered: boolean, thresholdDisplay: ThresholdDisplay, trackColor?: ColorProps['color'], innerRadius?: number, thresholds?: Threshold[], diameter?: number): {
    section: Sector;
    color?: ColorProps['color'];
    clipPath: string;
    size: string;
};
/**
 * Returns the calculated props for InnerCircle representing the indicator.
 * @param meterInfo MeterInfo object containing info about the meter circle.
 * @param indicatorSize Relative thickness of the indicator to the track.
 * @param innerRadius The innerRadius of the meter circle.
 * @returns An object with calculated props for InnerCircle that represents the indicator.
 */
export declare function getIndicatorProps(meterInfo: MeterInfo, indicatorSize: number, innerRadius?: number, fitDiameter?: number): {
    section: Sector;
    width: string;
    height: string;
    size: string;
    clipPath: string;
};
export declare function getWidthAndHeight(width: number, height: number, section: Sector): {
    height: number;
    width: number;
};
export declare function getWidthAndHeightWithReferenceLine(_width: number, _height: number, hasReferenceLine: boolean, isXsSize: boolean, section: Sector): {
    width: number;
    height: number;
};
