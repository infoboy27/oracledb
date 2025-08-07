/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { ChartCommonProps, ChartSeriesData, ChartItemData } from '../utils/UNSAFE_visTypes/chart';
import { MarkerShapes } from '../utils/UNSAFE_visTypes/common';
export type LineAreaItem<K> = ChartItemData<K> & {
    /**
     * The id of the data item.
     */
    id: K;
    /**
     * Whether a marker is displayed for the data item. Defaults to false.
     */
    isMarkerDisplayed?: boolean;
    /**
     * The color of the marker for the data item. If not specified, chart will choose the marker color based on the series.
     * All data items belonging to a particular series will have the same marker color.
     */
    markerColor?: ColorProps['color'];
    /**
     * The shape of the marker for the data item. If not specified, chart will choose the marker shape based on the series.
     * All data items belonging to a particular series will have same marker shape.
     */
    markerType?: MarkerShapes;
    /**
     * The size of the marker for the data item. If not specified, theme specific default is used.
     */
    markerSize?: number;
};
export type LineAreaSeriesData<K, D> = ChartSeriesData<K, D> & {
    /**
     * The color of the series line. If not specified, chart will choose a color from redwood categorical colors palette.
     */
    lineColor?: ColorProps['color'];
    /**
     * Whether the series line is solid, dotted or dashed. Defaults to 'solid'.
     */
    lineStyle?: 'solid' | 'dotted' | 'dashed';
    /**
     * The line width of the line series. If not specified, theme specific default is used.
     */
    lineWidth?: number;
    /**
     * The type of the line. Defaults to 'straight'.
     */
    lineType?: 'curved' | 'straight';
    /**
     * The color of the area for 'lineWithArea' and 'area' type LineWithArea chart.
     * If not specified, chart will choose color from redwood categorical color palette.
     */
    areaColor?: ColorProps['color'];
};
export type LineAreaChartProps<K, D extends LineAreaItem<K>> = ChartCommonProps<K, D> & {
    /**
     * The array of series for the chart.
     */
    series: LineAreaSeriesData<K, D>[];
    /**
     * A function that returns a LineAreaChartItem for each group and series.
     */
    getDataItem: (seriesIndex: number, groupIndex: number) => D | undefined;
    /**
     * Whether the chart is 'line', 'area', or 'lineWithArea' chart. 'area' and 'lineWithArea' charts feature a opaque and translucent
     * area respectively between the line traced by a series and the X-Axis.
     */
    type?: 'line' | 'area' | 'lineWithArea';
};
