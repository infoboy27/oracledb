import { ComponentThemeType, VariantOptions } from '../../UNSAFE_Theme';
type ProgressCircleVariants = typeof variants;
type ProgressCircleVariantOptions = VariantOptions<ProgressCircleVariants>;
type ProgressCircleStyles = typeof styles;
type ProgressCircleTheme = ComponentThemeType<ProgressCircleVariants, ProgressCircleStyles>;
/*******************
 * Style Variants
 *******************/
declare const variants: {
    readonly size: {
        readonly sm: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        readonly md: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        readonly lg: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
    };
    readonly type: {
        readonly indeterminate: {
            animationName: string;
            animationDuration: string;
            animationTimingFunction: string;
            animationIterationCount: string;
        };
    };
};
declare const styles: {
    base: string;
    indeterminate: string;
    determinate: string;
    track: string;
    valueStyle: string;
};
export type { ProgressCircleVariantOptions, ProgressCircleStyles, ProgressCircleTheme };
export { variants, styles };
