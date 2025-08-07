import { ComponentThemeType, VariantOptions } from '../../UNSAFE_Theme';
type MeterCircleVariants = typeof variants;
type MeterCircleVariantOptions = VariantOptions<MeterCircleVariants>;
type MeterCircleStyles = typeof styles;
type MeterCircleTheme = ComponentThemeType<MeterCircleVariants, MeterCircleStyles>;
/*******************
 * Component Styles
 *******************/
declare const baseStyle: string;
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
        readonly fit: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
    };
    readonly trackSize: {
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
        readonly fit: {
            readonly vars: {
                readonly [x: string]: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            };
        };
    };
    readonly interaction: {
        readonly isInteractive: string;
    };
};
declare const styles: {
    centerDiv: string;
    fullStyle: string;
    topStyle: string;
    bottomStyle: string;
    rightStyle: string;
    leftStyle: string;
    smtopStyle: string;
    mdtopStyle: string;
    lgtopStyle: string;
    fitSmtopStyle: string;
    fitLgtopStyle: string;
    smbottomStyle: string;
    mdbottomStyle: string;
    lgbottomStyle: string;
    fitSmbottomStyle: string;
    fitLgbottomStyle: string;
    smleftStyle: string;
    mdleftStyle: string;
    lgleftStyle: string;
    fitSmleftStyle: string;
    fitLgleftStyle: string;
    smrightStyle: string;
    mdrightStyle: string;
    lgrightStyle: string;
    fitSmrightStyle: string;
    fitLgrightStyle: string;
    smfullStyle: string;
    mdfullStyle: string;
    lgfullStyle: string;
    fitSmfullStyle: string;
    fitLgfullStyle: string;
    meterCircleHorizontalSizeStyle: string;
    meterCircleVerticalSizeStyle: string;
    meterCircleFullSizeStyle: string;
    meterCircleCenterContent: string;
    circleWrapperBaseStyle: string;
    circleTrackBaseStyle: string;
    circleValueBaseStyle: string;
    circleValuefullStyle: string;
    circleValuetopStyle: string;
    circleValuerightStyle: string;
    circleValueleftStyle: string;
    circleValuebottomStyle: string;
    referenceBaseLineStyle: string;
    referenceBorderStyle: string;
};
export type { MeterCircleVariantOptions, MeterCircleStyles, MeterCircleTheme };
export { variants, baseStyle, styles };
