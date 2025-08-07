import { ComponentProps } from 'preact';
import { TestIdProps } from '../hooks/UNSAFE_useTestId';
import { TabBar } from '../UNSAFE_TabBar';
import { Item } from '../UNSAFE_TabBarCommon';
type OverflowTabBarProps<K extends string | number> = {
    /**
     * An array of data to render individual tabs
     */
    items: Item<K>[];
} & Omit<ComponentProps<typeof TabBar>, 'children' | 'aria-describedby' | 'ref'>;
/**
 * OverflowTabBar handles the rendering of overflowing tab items.
 */
export declare function OverflowTabBar<K extends string | number>({ items, layout, display, size, edge, selection, onSelect, onRemove, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby, testId }: OverflowTabBarProps<K> & TestIdProps): import("preact").JSX.Element;
export {};
