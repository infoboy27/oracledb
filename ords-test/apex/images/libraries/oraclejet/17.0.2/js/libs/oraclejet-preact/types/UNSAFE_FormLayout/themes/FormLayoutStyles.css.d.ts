import { ComponentThemeType, CompoundVariantStyles, VariantOptions } from '../../UNSAFE_Theme';
type FormLayoutVariants = typeof variants;
type FormLayoutVariantOptions = VariantOptions<FormLayoutVariants>;
type FormLayoutStyles = typeof styles;
type FormLayoutTheme = ComponentThemeType<FormLayoutVariants, FormLayoutStyles>;
declare const variants: {
    columnBehavior: {
        responsive: string;
        fixed: string;
    };
    direction: {
        row: string;
        column: string;
    };
};
declare const compoundVariants: CompoundVariantStyles<FormLayoutVariantOptions>;
declare const styles: {
    readonly baseRowDirectionStyle: string;
    readonly baseColumnDirectionStyle: string;
    readonly rootWrapperStyle: string;
    readonly rootWrapperFullWidthStyle: string;
};
export type { FormLayoutTheme, FormLayoutVariantOptions, FormLayoutStyles };
export { styles, variants, compoundVariants };
