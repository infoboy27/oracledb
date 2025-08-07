import { ComponentProps } from 'preact';
import { RefObject } from 'preact/compat';
import { Menu } from '../../UNSAFE_Menu';
type InitialFocusType = ComponentProps<typeof Menu>['initialFocus'];
type MenuProps = {
    isOpen?: ComponentProps<typeof Menu>['isOpen'];
    anchorRef: ComponentProps<typeof Menu>['anchorRef'];
    initialFocus?: InitialFocusType;
    onClose: ComponentProps<typeof Menu>['onClose'];
};
export type MenuToggleDetail = {
    value: boolean;
};
export type MenuActionOptions = {
    isDisabled?: boolean;
    anchorRef: RefObject<HTMLElement>;
    onToggleMenu?: (details: MenuToggleDetail) => void;
    isMenuOpen?: boolean;
};
export type MenuActionReturnType = {
    triggerProps: Record<string, any>;
    menuProps: MenuProps;
};
/**
 * Use to associate a popup menu with a target that supports onAction
 *
 * @returns
 */
export declare function useMenuAction({ isDisabled, isMenuOpen, onToggleMenu, anchorRef }: MenuActionOptions): MenuActionReturnType;
export {};
