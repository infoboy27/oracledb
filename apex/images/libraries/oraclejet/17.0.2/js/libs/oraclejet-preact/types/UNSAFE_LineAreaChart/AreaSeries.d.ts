/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { Point } from '../utils/PRIVATE_visSVGUtils';
import { Scale } from '../utils/UNSAFE_visTypes/chart';
type AreaSeriesProps = {
    yScale: Scale;
    color: ColorProps['color'];
    lineType?: 'straight' | 'curved';
    isHorizontal: boolean;
    isLog: boolean;
    areaColorOpacity: number;
    lineSegmentCoords: Point[][];
    bottomCoords?: Point[];
    isHighlighted: boolean;
    isBottomSegmentCurved: boolean;
    seriesIndex: number;
};
export declare function AreaSeries({ yScale, lineType, color, isHorizontal, isLog, areaColorOpacity, lineSegmentCoords, bottomCoords, isHighlighted, isBottomSegmentCurved, seriesIndex }: AreaSeriesProps): import("preact").JSX.Element;
export {};
