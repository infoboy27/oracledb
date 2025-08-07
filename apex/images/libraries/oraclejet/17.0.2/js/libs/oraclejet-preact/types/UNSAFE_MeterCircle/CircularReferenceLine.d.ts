/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { getCenterCoord } from '../utils/PRIVATE_meterUtils';
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { VisThresholdsColors } from '../utils/UNSAFE_meterUtils';
type getCenterCoordParamType = Parameters<typeof getCenterCoord>;
export type CircularReferenceLineProps = {
    color?: ColorProps['color'] | VisThresholdsColors;
    angle: number;
    radius: string;
    length: string;
    section: getCenterCoordParamType[0];
};
export declare function CircularReferenceLine({ color, angle, radius, length, section }: CircularReferenceLineProps): import("preact").JSX.Element;
export {};
