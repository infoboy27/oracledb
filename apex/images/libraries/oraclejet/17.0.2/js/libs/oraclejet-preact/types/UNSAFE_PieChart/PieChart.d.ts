/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import type { PieChartProps } from './pieChart.types';
/**
 * Pie charts are useful for visualizing parts of a whole, but do not display zero or negative values so they are not recommended for data sets that may have negative or null data
 */
export declare function PieChart({ width, height, ...props }: PieChartProps): import("preact").JSX.Element;
