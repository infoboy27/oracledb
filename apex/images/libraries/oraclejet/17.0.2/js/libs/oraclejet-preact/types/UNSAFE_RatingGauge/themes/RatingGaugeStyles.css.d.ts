import { ComponentThemeType, VariantOptions, CompoundVariantStyles } from '../../UNSAFE_Theme';
type RatingGaugeVariants = typeof variants;
type RatingGaugeVariantOptions = VariantOptions<RatingGaugeVariants>;
type RatingGaugeStyles = typeof styles;
type RatingGaugeTheme = ComponentThemeType<RatingGaugeVariants, RatingGaugeStyles>;
/*******************
 * Style Variants
 *******************/
declare const variants: {
    size: {
        sm: {
            vars: {
                [x: string]: string;
            };
        };
        md: {
            vars: {
                [x: string]: string;
            };
        };
        lg: {
            vars: {
                [x: string]: string;
            };
        };
    };
    color: {
        neutral: {};
        gold: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        success: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        warning: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        danger: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
    };
    selectionState: {
        isSelected: string;
        isNotSelected: string;
    };
    disabledState: {
        isDisabled: string;
        isNotDisabled: string;
    };
    readonlyState: {
        isReadonly: string;
        isNotReadonly: string;
    };
    highContrastState: {
        isHighContrast: string;
        isNotHighContrast: string;
    };
};
declare const compoundVariants: CompoundVariantStyles<RatingGaugeVariantOptions>;
declare const styles: {
    baseStyle: string;
    interactiveStyle: string;
    sizeStyle: string;
    itemStyle: string;
    fractionalStarBaseStyle: string;
    ratingStarBaseStyle: string;
    innerRatingStarColor: string;
    outerRatingStarColor: string;
    outerDisabledHighContrastBaseStyle: string;
    outerDisabledHighContrastSelectedStyle: string;
    outerDisabledHighContrastUnselectedStyle: string;
};
export type { RatingGaugeVariantOptions, RatingGaugeStyles, RatingGaugeTheme };
export { variants, compoundVariants, styles };
