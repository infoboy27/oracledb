/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { VisThresholdsColors } from '../utils/UNSAFE_meterUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'class'>;
type ThresholdBarProps = IntrinsicProps & {
    color?: ColorProps['color'] | VisThresholdsColors;
    length: string;
    orientation: 'horizontal' | 'vertical';
};
export declare function ThresholdBar({ color, length, orientation, ...otherProps }: ThresholdBarProps): import("preact").JSX.Element;
export {};
