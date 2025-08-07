import { ComponentThemeType, CompoundVariantStyles, VariantOptions } from '../../UNSAFE_Theme';
type NavigationListItemVariant = typeof variants;
type NavigationListItemVariantOptions = VariantOptions<NavigationListItemVariant>;
type NavigationListItemStyles = typeof styles;
type NavigationListItemTheme = ComponentThemeType<NavigationListItemVariant, NavigationListItemStyles>;
declare const baseStyle: string;
declare const styles: {
    labelContainerClasses: string;
    iconContainer: string;
    iconLabelContainer: string;
    navigationItemMetadata: string;
    navigationlistRemoveIcon: string;
};
declare const variants: {
    readonly focusRing: {
        readonly isFocusRing: "";
        readonly notFocusRing: "";
    };
    readonly current: {
        readonly isCurrent: "";
        readonly notCurrtent: "";
    };
    readonly selected: {
        readonly isSelected: {
            backgroundColor: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            borderColor: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            color: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
        };
        readonly notSelected: "";
    };
    readonly hybridHover: {
        readonly isHybridHover: "";
        readonly notHybridHover: "";
    };
    readonly pseudoHover: {
        readonly isPseudoHover: "";
        readonly notPseudoHover: "";
    };
    readonly active: {
        readonly isActive: "";
        readonly notActive: "";
    };
};
declare const compoundVariants: CompoundVariantStyles<NavigationListItemVariantOptions>;
export type { NavigationListItemVariantOptions, NavigationListItemStyles, NavigationListItemTheme };
export { variants, compoundVariants, baseStyle, styles };
