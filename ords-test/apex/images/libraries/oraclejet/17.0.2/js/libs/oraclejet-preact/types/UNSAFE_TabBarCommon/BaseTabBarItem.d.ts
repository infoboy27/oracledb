import { ComponentChildren, ComponentChild } from 'preact';
type Severity = 'warning' | 'info' | 'none' | 'error' | 'confirmation';
type AriaProps = {
    /**
     * Accepts the tabpanel element's ID associated with the tab item
     **/
    'aria-controls'?: string;
    /**
     * Used by an item that renders an interactive popup
     */
    'aria-haspopup'?: boolean;
};
export type BaseTabBarItemProps<K extends string | number> = {
    /**
     * Key of the TabBarItem
     */
    itemKey: K;
    /**
     * Label of the TabBarItem. For icon only display this label is the content
     * for aria-label and tooltip text of the Tab.
     */
    label: string;
    /**
     * The icon before the label in non-stack case, icon above the label in
     * stacked case or the stand alone icon when no label is specified.
     */
    icon?: ComponentChild;
    /**
     * The content to be rendered inside the Badge component.
     */
    badge?: string;
    /**
     * The content to be rendered inside the Text component as a metadata,
     * that appears after the label in non stack case only.
     */
    metadata?: string;
    /**
     * The status icon to be rendered after the label in non stack case only.
     */
    severity?: Severity;
    /**
     * The content to be rendered for remove icon
     */
    removeIcon?: ComponentChildren;
    /**
     * The control for enabling and disabling focusRing
     */
    showFocusRingOverride?: boolean;
    /**
     * The control for enabling and disabling selection indicator
     */
    selectionOverride?: boolean;
    /**
     * The control for overriding display value.
     */
    displayOverride?: string;
} & AriaProps;
export declare function BaseTabBarItem<K extends string | number>({ itemKey, label, icon, badge, metadata, severity, removeIcon, showFocusRingOverride, selectionOverride, displayOverride, 'aria-controls': ariaControls, 'aria-haspopup': ariaHasPopup }: BaseTabBarItemProps<K>): import("preact").JSX.Element;
export {};
