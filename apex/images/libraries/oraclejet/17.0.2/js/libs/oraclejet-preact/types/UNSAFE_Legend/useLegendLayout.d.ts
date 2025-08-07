/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { RefObject } from 'preact';
import { Font } from '../hooks/PRIVATE_useTextDimensions';
import { LegendItemData, LegendSectionData } from '../utils/UNSAFE_visTypes/legend';
type Props<K, D extends LegendItemData<K>> = {
    sections?: LegendSectionData<K, D>[];
    items?: LegendItemData<K>[];
    resolvedVars: Record<string, any>;
    rootRef: RefObject<HTMLDivElement>;
    rootDimsRef: RefObject<DOMRect | undefined>;
    orientation?: 'vertical' | 'horizontal';
    legendFontStylesObj?: Font;
    symbolWidth?: number;
};
export type LayoutInfo = {
    isWrapped: boolean;
    maxItemWidth: number;
    itemsPerRow: number;
};
export declare function useLegendLayout<K, D extends LegendItemData<K>>({ resolvedVars, sections, items, rootRef, rootDimsRef, orientation, legendFontStylesObj, symbolWidth }: Props<K, D>): {
    textMeasureContent: import("preact").JSX.Element;
    layoutInfo: {
        maxItemWidth: number;
        itemsPerRow: number;
        isWrapped: boolean;
    } | undefined;
};
export {};
