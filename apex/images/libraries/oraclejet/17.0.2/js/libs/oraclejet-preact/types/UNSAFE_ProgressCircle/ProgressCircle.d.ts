/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren } from 'preact';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'class'>;
type ProgressCircleProps = IntrinsicProps & {
    /**
     * Specifies the id of the progress circle.  If the progress circle is being used to describe the loading process of a particular region
     * of the page, then the aria-describedby attribute of the region must point to the id of the ProgressCircle
     */
    id?: HTMLAttributesSignalExcluded<HTMLDivElement>['id'];
    /**
     * The value of the progress circle.  If the value is 'indeterminate', an indeterminate progress circle will be shown.
     */
    value?: 'indeterminate' | number;
    /**
     * The maximum value of the progress circle.
     */
    max?: number;
    /**
     * The size of the progress circle. The default value of this property is theme driven.
     */
    size?: 'sm' | 'md' | 'lg';
    /**
     * A label to be used for accessibility purposes when value is set to 'indeterminate'. This will be used for the aria-valuetext of the DOM element.
     */
    'aria-valuetext'?: string;
    /**
     * Specifies the children.
     */
    children?: ComponentChildren;
};
/**
 * A progress circle allows the user to visualize the progression of an extended computer operation.
 */
export declare function ProgressCircle({ value, max, ...otherProps }: ProgressCircleProps): import("preact").JSX.Element;
export {};
