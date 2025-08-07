/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { ComponentChildren } from 'preact';
import type { TestIdProps } from '../hooks/UNSAFE_useTestId';
import { Size } from '../utils/UNSAFE_size';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
import { Property } from 'csstype';
export type Bounds = {
    /**
     * The width of the bounding rectangle. The default value for this is theme driven.
     */
    width: number;
    /**
     * The height of the bounding rectangle. The default value for this is theme driven.
     */
    height: number;
    /**
     * The x position of the bounding rectangle.
     */
    x: number;
    /**
     * The y position of the bounding rectangle.
     */
    y: number;
};
export type PieChartCenterContext = {
    /**
     * Object containing (x, y, width, height) of the rectangle inscribed in the center area.
     * The inner bounds are useful for inserting content that is guaranteed to fit within the center area.
     */
    innerBounds: Bounds;
    /**
     * Object containing (x, y, width, height) of the rectangle circumscribing the center area.
     * The outer bounds are useful for creating background for the entire center area when used with a CSS border-radius.
     */
    outerBounds: Bounds;
};
export type PieChartProps = {
    /**
     * The function to get the datatip of the pie item.
     */
    datatip?: (context: {
        data: PieChartItemData;
    }) => {
        content?: ComponentChildren;
        borderColor?: Property.BorderColor;
    };
    /**
     * The width of the pie chart.
     *
     */
    width?: Size;
    /**
     * The height of the pie chart.
     */
    height?: Size;
    /**
     * The aria label of the pie chart.
     */
    'aria-label'?: HTMLAttributesSignalExcluded['aria-label'];
    /**
     * One or more ids (separated by spaces) of elements that label the pie chart. This will be used for the aria-labelledby of the DOM element.
     */
    'aria-labelledby'?: HTMLAttributesSignalExcluded['aria-labelledby'];
    /**
     * One or more ids (separated by spaces) of elements that describe the pie chart. This will be used for the aria-describedby of the DOM element.
     */
    'aria-describedby'?: HTMLAttributesSignalExcluded['aria-describedby'];
    /**
     * The data for the pie chart.
     */
    data: PieChartItemData[];
    /**
     * Specifies the radius of the inner circle of the pie chart. Valid values range from 0 (default) to 1
     */
    innerRadius?: number;
    /**
     * The pie chart center content.
     */
    children?: (context: PieChartCenterContext) => ComponentChildren;
} & TestIdProps;
/**
 * The pie chart item.
 */
export type PieChartItemData = {
    /**
     * The value of the pie item.
     */
    value: number;
    /**
     * The color of the pie item.
     */
    color?: ColorProps['color'];
    /**
     * The id of the pie item.
     */
    id: string | number;
    /**
     * The label to be used for accessibility purposes.
     */
    accessibleLabel?: string;
};
/**
 * The type that contains info about a pie slice layout.
 */
export type PieSliceInfo = {
    /**
     * The start angle of the pie slice.
     */
    startAngle: number;
    /**
     * The extent of the pie slice.
     */
    angleExtent: number;
    /**
     * The index of the slice in original data.
     */
    index: number;
} & PieChartItemData;
