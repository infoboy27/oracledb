import { ComponentThemeType, CompoundVariantStyles, VariantOptions } from '../../UNSAFE_Theme';
type MenuItemVariant = typeof variants;
type MenuItemVariantOptions = VariantOptions<MenuItemVariant>;
type MenuItemStyles = typeof styles;
type MenuItemTheme = ComponentThemeType<MenuItemVariant, MenuItemStyles>;
declare const baseStyle: string;
declare const styles: {
    iconLabelContainer: string;
    labelContainer: string;
    iconContainer: string;
    startIconContainer: string;
    endIconContainer: string;
};
declare const variants: {
    readonly variant: {
        readonly standard: {
            selectors: {
                '&:active': object;
            };
        };
        readonly destructive: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
            selectors: {
                '&:active': object;
            };
        };
        readonly disabled: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
            cursor: string;
        };
    };
    readonly focusRing: {
        readonly isFocusRing: "";
        readonly notFocusRing: "";
    };
    readonly containerFocused: {
        readonly isContainerFocused: "";
        readonly notContainerFocused: "";
    };
    readonly current: {
        readonly isCurrent: "";
        readonly notCurrent: "";
    };
    readonly submenuOpen: {
        readonly isSubmenuOpen: "";
        readonly notSubmenuOpen: "";
    };
};
declare const compoundVariants: CompoundVariantStyles<MenuItemVariantOptions>;
export type { MenuItemVariantOptions, MenuItemStyles, MenuItemTheme };
export { variants, compoundVariants, baseStyle, styles };
