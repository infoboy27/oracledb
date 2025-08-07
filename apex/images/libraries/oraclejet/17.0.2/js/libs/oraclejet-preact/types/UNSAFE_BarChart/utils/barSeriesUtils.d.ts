/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * The function that calculates the barWidth and offset from group center for each series.
 * @param groupWidth The width of the group.
 * @param noOfSeries The number of series present in the chart.
 * @param barGapRatio The ratio of gap to groupWidth.
 * @param dataItemGaps The ratio that determines the gap between the bars.
 */
export declare function getBarGapsInfo(seriesIndex: number, groupWidth: number, barGapRatio: number, numOfSeries: number, dataItemGaps: number, isStacked: boolean, isRtl: boolean): {
    barWidth: number;
    offset: number;
    itemsGaps: number;
};
/**
 * Returns the bar gap ratio.
 * @param isStacked Whether the chart is a stacked bar chart.
 * @param startIndex The viewport start index.
 * @param endIndex The viewport end index.
 */
export declare function getBarGapRatio(isStacked: boolean, startIndex: number, endIndex: number): number;
