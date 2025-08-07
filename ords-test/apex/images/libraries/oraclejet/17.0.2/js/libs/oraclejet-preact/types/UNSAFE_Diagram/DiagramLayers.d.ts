import type { NodeRendererContext, LinkRendererContext, States, Bounds, DiagramLabelPosition, DiagramNodeData, DiagramLinkData } from './diagram.types';
import { ComponentChildren } from 'preact';
import type { TextDimensions } from '../hooks/PRIVATE_useTextDimensions';
/**
 * Props for Diagram layers component
 */
type DiagramLayersProps<K1, K2, D1, D2> = {
    nodes: D1[];
    links: D2[];
    nodeRenderer: (context: NodeRendererContext<D1>) => ComponentChildren;
    linkRenderer?: (context: LinkRendererContext<D2>) => ComponentChildren;
    states: States<K1, K2>;
    previousStates: States<K1, K2>;
    nodeBounds: Bounds[];
    width: number;
    height: number;
    onNodeSizeChanged: (width: number, height: number, idx: number) => void;
    nodeLabelPositions?: (DiagramLabelPosition | undefined)[];
    linkLabelPositions?: (DiagramLabelPosition | undefined)[];
    labelDimensions?: Map<K1 | K2, TextDimensions>;
    supportsSelection: boolean;
};
export declare function DiagramLayers<K1, K2, D1 extends DiagramNodeData<K1>, D2 extends DiagramLinkData<K2, K1>>({ nodes, links, nodeRenderer, linkRenderer, states, previousStates, nodeBounds, onNodeSizeChanged, width, height, nodeLabelPositions, linkLabelPositions, labelDimensions, supportsSelection }: DiagramLayersProps<K1, K2, D1, D2>): import("preact").JSX.Element;
export {};
