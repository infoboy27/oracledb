import { ReorderableItemProps } from '../UNSAFE_Collection/Reorderable.types';
export type ListReorderableItemProps<K> = ReorderableItemProps<K> & {
    currentKey: K | undefined;
};
/**
 * A private item that will be used by ReorderableCardFlexView, location TBD (could be moved to PRIVATE_CardFlexView)
 */
export declare function ListViewReorderableItem<K extends string | number>({ currentKey, children, dragKey, setDragKey, onReorder, rootRef, itemKey }: ListReorderableItemProps<K> & {
    itemKey: K;
}): import("preact/compat").JSX.Element;
export declare const MemoizeListViewReorderableItem: typeof ListViewReorderableItem;
