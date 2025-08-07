import { ComponentProps, ContextType, RefObject } from 'preact';
import type { TabBarContext, TabBarLayout } from '../UNSAFE_TabBarCommon';
type TabBarContextValue = ContextType<typeof TabBarContext>;
export type useTabBarOptions = {
    class?: string;
    display?: TabBarContextValue['display'];
    edge?: 'bottom' | 'top';
    onRemove?: TabBarContextValue['onRemove'];
    onSelect?: TabBarContextValue['onSelect'];
    ref?: RefObject<HTMLDivElement>;
    selection?: TabBarContextValue['selection'];
    size?: TabBarContextValue['size'];
    children?: ComponentProps<typeof TabBarLayout>['children'];
};
/**
 * A thin wrapper around useTabBar hook
 */
export declare function useTabBarMixed(options: useTabBarOptions): {
    readonly rootProps: {};
    readonly tabBarContext: {
        readonly currentKey: string | number | undefined;
        readonly display: "standard" | "icons" | "stacked" | undefined;
        readonly isEdgeBottom: boolean;
        readonly layout: "condense";
        readonly onRemove: (<K extends string | number>(detail: {
            value: K;
        }) => void) | undefined;
        readonly onSelect: (<K_1 extends string | number>(detail: {
            value: K_1;
        }) => void) | undefined;
        readonly showFocusRing: boolean;
        readonly hideTooltip: boolean;
        readonly selection: string | number | undefined;
        readonly size: "never" | "md" | "lg" | undefined;
        readonly tabItemPrefix: string;
    };
};
export {};
