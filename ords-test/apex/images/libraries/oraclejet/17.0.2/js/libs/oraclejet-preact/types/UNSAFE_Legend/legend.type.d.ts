/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { CommonProps, LegendItemData } from '../utils/UNSAFE_visTypes/legend';
export type LegendProps<K, D extends LegendItemData<K>> = CommonProps<K, D> & {
    /**
     * The data for the legend.
     */
    items: D[];
};
