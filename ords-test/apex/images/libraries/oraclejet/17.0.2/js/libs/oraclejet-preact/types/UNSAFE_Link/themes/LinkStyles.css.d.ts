import { ComponentThemeType, VariantOptions, CompoundVariantStyles } from '../../UNSAFE_Theme';
type LinkVariants = typeof variants;
type LinkVariantOptions = VariantOptions<LinkVariants>;
type LinkStyles = typeof styles;
type LinkTheme = ComponentThemeType<LinkVariants, LinkStyles>;
declare const styles: {
    standard: string;
};
/*******************
 * Style Variants
 *******************/
declare const variants: {
    readonly variant: {
        readonly standard: {};
        readonly primary: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        readonly secondary: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
    };
    readonly placement: {
        readonly standalone: {
            readonly textDecorationLine: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            readonly selectors: {
                readonly '&:active': {
                    readonly textDecorationLine: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
                };
            };
        };
        readonly embedded: {
            readonly textDecorationLine: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            readonly selectors: {
                readonly '&:active': {
                    readonly textDecorationLine: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
                };
            };
        };
    };
    readonly needsEventsHover: {
        readonly isNeedsEventsHover: "";
        readonly notNeedsEventsHover: "";
    };
    readonly pseudoHover: {
        readonly isPseudoHover: "";
        readonly notPseudoHover: "";
    };
    readonly disabled: {
        readonly notDisabled: {};
        readonly isDisabled: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
            readonly selectors: {
                readonly '&:active': {
                    readonly textDecorationLine: "none";
                };
            };
        };
    };
};
declare const compoundVariants: CompoundVariantStyles<LinkVariantOptions>;
export type { LinkVariantOptions, LinkStyles, LinkTheme };
export { variants, styles, compoundVariants };
