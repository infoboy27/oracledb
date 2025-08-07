import { ComponentChildren } from 'preact';
import type { States, LinkRendererContext, DiagramLinkData } from './diagram.types';
type Props<K2, K1, D2> = {
    links: D2[];
    states: States<K1, K2>;
    previousStates: States<K1, K2>;
    linkRenderer: (context: LinkRendererContext<D2>) => ComponentChildren;
    width: number;
    height: number;
    supportsSelection: boolean;
};
export declare function DiagramLinkLayer<K2, K1, D2 extends DiagramLinkData<K2, K1> = DiagramLinkData<K2, K1>>({ links, states, previousStates, linkRenderer, width, height, supportsSelection }: Props<K2, K1, D2>): import("preact").JSX.Element;
export {};
