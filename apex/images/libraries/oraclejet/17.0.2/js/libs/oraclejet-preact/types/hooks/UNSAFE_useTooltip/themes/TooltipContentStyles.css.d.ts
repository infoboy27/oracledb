import { ComponentThemeType, VariantOptions } from '../../../UNSAFE_Theme';
type TooltipContentVariants = typeof variants;
type TooltipContentVariantOptions = VariantOptions<TooltipContentVariants>;
type TooltipContentStyles = typeof styles;
type TooltipContentTheme = ComponentThemeType<TooltipContentVariants, TooltipContentStyles>;
declare const baseStyle: string;
declare const styles: {
    wrapper: string;
    inner: string;
    content: string;
};
/*******************
 * Component Variants
 *******************/
declare const variants: {
    variant: {
        tooltip: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
        datatip: {
            vars: {
                [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
    };
};
export type { TooltipContentTheme, TooltipContentVariantOptions, TooltipContentStyles };
export { baseStyle, styles, variants };
