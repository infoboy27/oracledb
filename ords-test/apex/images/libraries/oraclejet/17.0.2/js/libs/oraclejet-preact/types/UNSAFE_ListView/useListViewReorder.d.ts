import { RefObject } from 'preact';
import { ViewportConfig } from '../hooks/UNSAFE_useViewportIntersect';
import { ListProps } from './List.types';
type useListViewReorderProps<K, D> = Pick<ListProps<K, D>, 'currentKey' | 'onReorder'> & {
    rootRef: RefObject<HTMLDivElement>;
    viewportConfig?: ViewportConfig;
};
export declare const useListViewReorder: <K extends string | number, D>({ currentKey, onReorder, rootRef, viewportConfig }: useListViewReorderProps<K, D>) => {
    readonly reorderProps: {
        onKeyDown?: undefined;
    } | {
        onKeyDown: (e: KeyboardEvent) => void;
    };
    readonly reorderContext: {
        readonly currentItemKey: import("preact/hooks").MutableRef<K | undefined>;
    };
    readonly reorderInstructionsId: string;
    readonly reorderInstructions: string;
    readonly reorderItemProps?: undefined;
} | {
    readonly reorderProps: {
        onKeyDown: (event: KeyboardEvent) => void;
        onDragOver: (event: DragEvent) => void;
    };
    readonly reorderItemProps: {
        currentKey: K | undefined;
        dragKey: K | undefined;
        setDragKey: import("preact/hooks").Dispatch<import("preact/hooks").StateUpdater<K | undefined>>;
        onReorder: (detail: import("../UNSAFE_Collection/Reorderable.types").ReorderDetail<K>) => void;
        rootRef: RefObject<HTMLDivElement>;
    };
    readonly reorderContext: {
        readonly currentItemKey: import("preact/hooks").MutableRef<K | undefined>;
    };
    readonly reorderInstructionsId: string;
    readonly reorderInstructions: string;
};
export {};
