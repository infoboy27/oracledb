/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { LegendProps } from './legend.type';
import { LegendItemData } from '../utils/UNSAFE_visTypes/legend';
/**
 * A legend displays an interactive description of symbols, colors, etc., used in graphical information representations.
 */
export declare function Legend<K extends string | number, D extends LegendItemData<K> = LegendItemData<K>>({ orientation, items, isReadOnly, onItemAction, onItemHover, onItemFocus, testId, contextMenuConfig, hideAndShowBehavior, hoverBehavior, ...props }: LegendProps<K, D>): import("preact").JSX.Element;
