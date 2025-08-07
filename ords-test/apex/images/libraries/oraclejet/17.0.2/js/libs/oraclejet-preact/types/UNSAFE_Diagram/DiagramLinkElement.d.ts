import type { State, LinkRendererContext } from './diagram.types';
import { ComponentChildren } from 'preact';
/**
 * Props for Link
 */
export type LinkProps<K2, D2> = {
    id: K2;
    label?: string;
    state: State;
    previousState: State;
    isDimmed?: boolean;
    activeId?: string;
    accessibleLabel?: string;
    data: D2;
    linkRenderer: (context: LinkRendererContext<D2>) => ComponentChildren;
    supportsSelection: boolean;
};
export declare const DiagramLinkElement: <K2, D2>({ id, state, previousState, activeId, data, linkRenderer, accessibleLabel, isDimmed, supportsSelection }: LinkProps<K2, D2>) => import("preact").JSX.Element;
