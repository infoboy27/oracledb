/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import type { DiagramProps, DiagramNodeData, DiagramLinkData } from './diagram.types';
type DiagramWithDimensionsProps<K1, K2, D1, D2> = Omit<DiagramProps<K1, K2, D1, D2>, 'width' | 'height'> & {
    width: number;
    height: number;
};
export declare function DiagramWithDimensions<K1 extends string | number, K2 extends string | number, D1 extends DiagramNodeData<K1> = DiagramNodeData<K1>, D2 extends DiagramLinkData<K2, K1> = DiagramLinkData<K2, K1>>({ nodes, links, width, height, selectedIds, selectionMode, layout, nodeRenderer, linkRenderer, onSelectionChange, onItemHover, onItemFocus, highlightedIds, datatip, ...otherProps }: DiagramWithDimensionsProps<K1, K2, D1, D2>): import("preact").JSX.Element;
export {};
