import { ComponentThemeType, VariantOptions } from '../../UNSAFE_Theme';
type MessageBannerVariants = typeof variants;
type MessageBannerVariantOptions = VariantOptions<MessageBannerVariants>;
type MessageBannerStyles = typeof styles;
type MessageBannerTheme = ComponentThemeType<MessageBannerVariants, MessageBannerStyles>;
/*******************
 * Component Variants
 *******************/
declare const variants: {
    severity: {
        error: {
            vars: {
                [x: string]: import("@vanilla-extract/private").CSSVarFunction;
            };
        };
        warning: {
            vars: {
                [x: string]: import("@vanilla-extract/private").CSSVarFunction;
            };
        };
        confirmation: string;
        info: string;
        none: string;
    };
};
declare const styles: {};
export type { MessageBannerVariantOptions, MessageBannerTheme, MessageBannerStyles };
export { variants };
