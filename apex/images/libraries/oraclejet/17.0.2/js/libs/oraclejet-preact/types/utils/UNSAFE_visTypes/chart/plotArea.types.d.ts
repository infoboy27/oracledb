/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../../UNSAFE_interpolations/colors';
export type ChartPlotArea = {
    /**
     * The major tick properties corresponding to y values.
     */
    yMajorTick?: MajorTick;
    /**
     * The major tick properties corresponding to y values.
     */
    xMajorTick?: MajorTick;
    /**
     * The minor tick properties corresponding to y values.
     */
    yMinorTick?: MinorTick;
    /**
     * The color of the plot area background.
     */
    color?: ColorProps['color'];
};
export type MajorTick = {
    /**
     * The line color of the major tick.
     */
    lineColor?: ColorProps['color'];
    /**
     * The line style of the major tick.
     */
    lineStyle?: 'dashed' | 'dotted' | 'solid';
    /**
     * The line width of the major tick.
     */
    lineWidth?: number;
    /**
     * Whether the line tick is rendered or not.
     */
    isRendered?: boolean;
};
export type MinorTick = {
    /**
     * The line color of the major tick.
     */
    lineColor?: ColorProps['color'];
    /**
     * The line style of the major tick.
     */
    lineStyle?: 'dashed' | 'dotted' | 'solid';
    /**
     * The line width of the major tick.
     */
    lineWidth?: number;
    /**
     * Whether the line tick is rendered or not.
     */
    isRendered?: boolean;
};
