/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.̦
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { SectionalLegendProps } from './sectionalLegend.type';
import { LegendItemData, LegendSectionData } from '../utils/UNSAFE_visTypes/legend';
/**
 * A Sectional Legend allows grouping of legend items in sections with a specific title.
 */
export declare function SectionalLegend<K extends string | number, D extends LegendItemData<K>, S extends LegendSectionData<K, D>>({ orientation, sectionTitleHAlign, sections, isReadOnly, onItemAction, onItemHover, onItemFocus, testId, contextMenuConfig, hideAndShowBehavior, hoverBehavior, ...props }: SectionalLegendProps<K, D, S>): import("preact").JSX.Element;
