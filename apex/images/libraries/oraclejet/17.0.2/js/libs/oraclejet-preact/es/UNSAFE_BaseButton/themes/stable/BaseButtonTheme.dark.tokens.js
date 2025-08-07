/* @oracle/oraclejet-preact: undefined */
import { a as rgb, r as rgba } from '../../../utils-6eab3a64.js';
import { colorSchemeVars } from '../../../Common/themes/themeContract.css.js';
import '../../../colorUtils-16eb823f.js';
import '../../../_curry1-25297e59.js';

const colorSchemeDark = {
    variants: {
        outlined: {
            base: {
                backgroundColor: 'transparent',
                borderColor: colorSchemeVars.border.enabled,
                color: colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: 'transparent',
                borderColor: colorSchemeVars.border.disabled,
                color: colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: colorSchemeVars.overlay.hover
            },
            active: {
                backgroundOverlayColor: colorSchemeVars.overlay.active
            }
        },
        callToAction: {
            base: {
                backgroundColor: rgb(colorSchemeVars.palette.neutral[200]),
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.inverse
            },
            disabled: {
                backgroundColor: colorSchemeVars.surface.disabled,
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: colorSchemeVars.overlay.inverseHover
            },
            active: {
                backgroundOverlayColor: colorSchemeVars.overlay.inverseActive
            }
        },
        borderless: {
            base: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: colorSchemeVars.overlay.hover
            },
            active: {
                backgroundOverlayColor: colorSchemeVars.overlay.active
            }
        },
        ghost: {
            base: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: 'transparent'
            },
            active: {
                backgroundOverlayColor: 'transparent'
            }
        },
        solid: {
            base: {
                backgroundColor: rgba(colorSchemeVars.palette.neutral['190'], 0.08),
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: colorSchemeVars.surface.disabled,
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: colorSchemeVars.overlay.hover
            },
            active: {
                backgroundOverlayColor: colorSchemeVars.overlay.active
            }
        },
        danger: {
            base: {
                backgroundColor: colorSchemeVars.surface.danger.strong,
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.inverse
            },
            disabled: {
                backgroundColor: colorSchemeVars.surface.disabled,
                borderColor: 'transparent',
                color: colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: colorSchemeVars.overlay.dangerHover
            },
            active: {
                backgroundOverlayColor: colorSchemeVars.overlay.dangerActive
            }
        }
    }
};

export { colorSchemeDark };
//# sourceMappingURL=BaseButtonTheme.dark.tokens.js.map
