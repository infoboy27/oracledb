import { ComponentChildren } from 'preact';
import { ViewportConfig } from '../hooks/UNSAFE_useViewportIntersect';
import { Keys } from '../utils/UNSAFE_keys';
import { ListItemRendererContext, CurrentKeyDetail, SelectionDetail, SelectionMode } from '../UNSAFE_Collection';
import { ReorderProps, ReorderDetail } from '../UNSAFE_Collection/Reorderable.types';
/**
 * Public props shared between CardGridView and CardFlexView components
 */
export type BaseCardViewPublicProps<K, D> = {
    /**
     * An array of shaped data that provide information to this component.
     * If the value is null, the component will show loading indicator until the value is set.
     */
    data: D[] | null;
    /**
     * Callback function to handle when viewport has changed, including the case
     * where user scrolls to the end of the component and there are more items to load.
     */
    onLoadMore?: () => void;
    /**
     * A boolean that indicates whether there are still more data to load.
     */
    hasMore?: boolean;
    /**
     * A callback function to get the key for a given row
     */
    getRowKey: (data: D) => K;
    /**
     * A function to render each item
     */
    children: (context: ListItemRendererContext<K, D>) => ComponentChildren;
    /**
     * The key of the item that currently have keyboard focus. Ignored if the current item is not
     * currently in the viewport.
     */
    currentKey?: K;
    /**
     * Callback function to handle when current focused item has changed.  The function should
     * update the currentKey prop with a new current key.
     */
    onCurrentKeyChange?: (detail: CurrentKeyDetail<K>) => void;
    /**
     * The type of selection behavior that is enabled on the component. This property controls the number
     * of selections that can be made via selection gestures at any given time.
     */
    selectionMode?: SelectionMode;
    /**
     * The keys of the current selected items in the component.
     */
    selectedKeys?: Keys<K>;
    /**
     * Callback function to handle when selection has changed.  The function should update
     * the selectedKeys prop with a new set of selected keys.
     */
    onSelectionChange?: (detail: SelectionDetail<K>) => void;
    /**
     * The ViewportConfig currently contains only one property which allows application to specify what the scroller element should be.
     * If not specified, then the root element of the component itself will be the scroller element.
     */
    viewportConfig?: ViewportConfig;
    /**
     * A props that determines which focus behavior we should use for an item that has single focusable element during keyboard navigation.
     * When the focusBehavior is 'card', the focus will be on the root of the component and we will do logical focus on the card. When the focusBehavior
     * is 'content', the first focusable element within the card will get focus. Note that when set to 'content', there should only be one focusable
     * element within the card. If that's not the case, a warning will be logged and the focus behavior will be reset to 'card'.
     */
    focusBehavior?: 'card' | 'content';
    /**
     * An aria-label which defines a string value that labels this component.
     * Either aria-label or aria-labelledby should be specified in order to make the component accessible.
     */
    'aria-label'?: string;
    /**
     * An aria-labelledby which identifies the element(s) that labels this component.
     * Either aria-label or aria-labelledby should be specified in order to make the component accessible.
     */
    'aria-labelledby'?: string;
    /**
     * Specify animation when cards are initially rendered.
     */
    initialAnimation?: 'slideUp' | 'slideDown';
    /**
     * Size of the gutter between columns.
     */
    gutterSize?: GutterSize;
} & ReorderProps<K>;
export type CardViewReorderDetail<K> = ReorderDetail<K>;
type GutterSize = 'xs' | 'sm' | 'md' | 'lg' | 'xl';
export {};
