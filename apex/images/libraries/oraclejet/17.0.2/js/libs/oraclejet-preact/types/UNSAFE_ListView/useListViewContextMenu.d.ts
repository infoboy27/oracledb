import { ComponentProps, RefObject } from 'preact';
import { DataState, ListItemContext } from "../UNSAFE_Collection";
import { ListView } from './ListView';
type ListViewProps<K extends string | number, D> = ComponentProps<typeof ListView<K, D>>;
export declare const useListViewContextMenu: <K extends string | number, D>(dataState: DataState<K, D> | null, contextMenuConfig: ListViewProps<K, D>['contextMenuConfig'], currentKey: ListViewProps<K, D>['currentKey'], onCurrentKeyChange: ListViewProps<K, D>['onCurrentKeyChange'], scrollListRef: RefObject<HTMLElement | null>) => {
    readonly menuProps: {
        readonly onClose: (detail: {
            reason: "dismissed" | "itemAction";
        } | {
            reason: "outsideClick";
            target: Element;
        }) => void;
        readonly placement?: import("../UNSAFE_Floating").Placement | undefined;
        readonly anchorRef: RefObject<Element | import("../UNSAFE_Floating").Coords>;
        readonly offsetValue?: import("../UNSAFE_Floating").Offset | undefined;
        readonly isOpen?: boolean | undefined;
        readonly initialFocus?: "menu" | "firstItem" | undefined;
    };
    readonly onClose: (detail: {
        reason: "dismissed" | "itemAction";
    } | {
        reason: "outsideClick";
        target: Element;
    }) => void;
    readonly contextMenuContext: ListItemContext<K, D>;
    readonly triggerProps: Record<string, any>;
};
export {};
