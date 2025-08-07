import { ComponentThemeType, VariantOptions } from '../../UNSAFE_Theme';
type DialogVariants = typeof variants;
type DialogVariantOptions = VariantOptions<DialogVariants>;
type DialogStyles = typeof styles;
type DialogTheme = ComponentThemeType<DialogVariants, DialogStyles>;
/*******************
 * Component Styles
 *******************/
declare const baseStyle: string;
declare const styles: {
    readonly dialogContainerStyle: string;
    readonly dialogContentStyle: string;
    readonly dialogTitleStyle: string;
    readonly dialogHeaderStyle: string;
    readonly dialogBodyStyle: string;
    readonly dialogFooterStyle: string;
};
/*******************
 * Component Variants
 *******************/
declare const variants: {};
export type { DialogTheme, DialogVariantOptions, DialogStyles };
export { baseStyle, styles, variants };
