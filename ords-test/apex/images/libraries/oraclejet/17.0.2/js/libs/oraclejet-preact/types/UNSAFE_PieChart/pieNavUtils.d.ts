/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import type { PieChartItemData } from './pieChart.types';
/**
 * Returns the nav util for pie chart.
 * @param data
 * @param isRtl
 * @returns
 */
export declare function getPieChartNavUtils(data: PieChartItemData[], isRtl: boolean): ({ itemIndex }: {
    itemIndex: number;
}, arrow: 'ArrowLeft' | 'ArrowRight' | 'ArrowDown' | 'ArrowUp') => {
    itemIndex: number;
};
