import { ComponentProps } from 'preact';
import { Floating } from '../UNSAFE_Floating';
import { BaseMenuProps } from './Menu';
type DropdownMenuProps = BaseMenuProps & DropdownMenuFloatingProps;
type FloatingProps = ComponentProps<typeof Floating>;
type DropdownMenuFloatingProps = {
    defaultPlacement: FloatingProps['placement'];
    offsetValue: FloatingProps['offsetValue'];
    flipOptions: FloatingProps['flipOptions'];
};
export declare const DropdownMenu: import("preact").FunctionalComponent<import("preact/compat").PropsWithoutRef<DropdownMenuProps> & {
    ref?: import("preact").Ref<HTMLDivElement> | undefined;
}>;
export {};
