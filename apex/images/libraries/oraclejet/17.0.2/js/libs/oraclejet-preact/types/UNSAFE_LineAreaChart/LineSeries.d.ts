/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { Point } from '../utils/PRIVATE_visSVGUtils';
import { Property } from 'csstype';
type LineSeriesProps = {
    color: ColorProps['color'];
    lineStyle?: 'dotted' | 'dashed' | 'solid';
    lineColor?: Property.Color;
    lineWidth?: number;
    lineType?: 'straight' | 'curved';
    isHorizontal: boolean;
    lineSegmentCoords: Point[][];
    isHighlighted: boolean;
    seriesIndex: number;
};
export declare function LineSeries({ color, isHorizontal, lineType, lineColor, lineStyle, lineWidth, isHighlighted, lineSegmentCoords, seriesIndex }: LineSeriesProps): import("preact").JSX.Element;
export {};
