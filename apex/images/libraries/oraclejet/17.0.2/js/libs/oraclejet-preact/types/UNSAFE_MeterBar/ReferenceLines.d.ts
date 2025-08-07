/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { VisThresholdsColors } from '../utils/UNSAFE_meterUtils';
type ReferenceLineProps = {
    orientation: 'horizontal' | 'vertical';
    percentage: string;
    position?: 'start' | 'end';
    color?: ColorProps['color'] | VisThresholdsColors;
    width?: string;
    height?: string;
};
export declare function ReferenceLineBar({ orientation, percentage, color, position, width, height }: ReferenceLineProps): import("preact").JSX.Element;
export {};
