import { ComponentChildren } from 'preact';
type Severity = 'warning' | 'info' | 'none' | 'error' | 'confirmation';
export type BaseNavigationListItemProps<K extends string | number> = {
    /**
     * Key of the NavigationListItem.
     */
    itemKey: K;
    /**
     * Label of the NavigationListItem.
     */
    label?: string;
    /**
     * The content to be rendered inside the Badge component.
     */
    badge?: string;
    /**
     * The content to be rendered inside the Text component as a metadata.
     */
    metadata?: string;
    /**
     * The status icon to be rendered after the label.
     */
    severity?: Severity;
    /**
     * The content to be rendered for remove icon
     */
    removeIcon?: ComponentChildren;
};
export declare function BaseNavigationListItem<K extends string | number>({ itemKey, label, badge, metadata, severity, removeIcon }: BaseNavigationListItemProps<K>): import("preact").JSX.Element;
export {};
