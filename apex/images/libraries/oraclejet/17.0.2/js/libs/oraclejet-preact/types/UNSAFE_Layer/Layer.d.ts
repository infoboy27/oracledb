import { VNode, RefObject } from 'preact';
import { LayerLevel, LayerPriority } from './LayerContext';
export declare const LOGICAL_PARENT: unique symbol;
type Props = {
    /**
     * The content to be re-parented using Portal
     */
    children: VNode;
    /**
     * Logical parent of the re-parented content. Typically the 'launcher' associated
     * with the popup.
     */
    logicalParentRef?: RefObject<Element> | null;
    /**
     * Determines Layer's stacking context. Components that always need to render on top of other popup
     * elements (such as Messages) should use respective priority value. The default priority level is 'popup'.
     */
    priority?: LayerPriority;
    /**
     * Determines Layer's nesting context. By default, new layers will render in the context of a parent Layer,
     * if it exists (nearestAncestor)). Some popup components (such as Dialog and Message) may need to set up
     * a new nesting context as(topLevel).
     */
    level?: LayerLevel;
};
declare const Layer: ({ children, logicalParentRef, priority, level }: Props) => import("preact").JSX.Element;
export default Layer;
