/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var utils = require('../../../utils-b7099be5.js');
var Common_themes_themeContract_css = require('../../../Common/themes/themeContract.css.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');

const colorSchemeDark = {
    variants: {
        outlined: {
            base: {
                backgroundColor: 'transparent',
                borderColor: Common_themes_themeContract_css.colorSchemeVars.border.enabled,
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: 'transparent',
                borderColor: Common_themes_themeContract_css.colorSchemeVars.border.disabled,
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.hover
            },
            active: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.active
            }
        },
        callToAction: {
            base: {
                backgroundColor: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[200]),
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.inverse
            },
            disabled: {
                backgroundColor: Common_themes_themeContract_css.colorSchemeVars.surface.disabled,
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.inverseHover
            },
            active: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.inverseActive
            }
        },
        borderless: {
            base: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.hover
            },
            active: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.active
            }
        },
        ghost: {
            base: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.disabled
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
                backgroundColor: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.08),
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.primary
            },
            disabled: {
                backgroundColor: Common_themes_themeContract_css.colorSchemeVars.surface.disabled,
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.hover
            },
            active: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.active
            }
        },
        danger: {
            base: {
                backgroundColor: Common_themes_themeContract_css.colorSchemeVars.surface.danger.strong,
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.inverse
            },
            disabled: {
                backgroundColor: Common_themes_themeContract_css.colorSchemeVars.surface.disabled,
                borderColor: 'transparent',
                color: Common_themes_themeContract_css.colorSchemeVars.textIcon.disabled
            },
            hover: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.dangerHover
            },
            active: {
                backgroundOverlayColor: Common_themes_themeContract_css.colorSchemeVars.overlay.dangerActive
            }
        }
    }
};

exports.colorSchemeDark = colorSchemeDark;
//# sourceMappingURL=BaseButtonTheme.dark.tokens.js.map
