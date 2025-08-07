/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var utils = require('../../../utils-b7099be5.js');
var Common_themes_themeContract_css = require('../themeContract.css.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');

/**
 * Stable theme tokens are manually updated and are not generated from Figma tokens
 */
const base = {
    cursor: {
        clickable: 'pointer'
    },
    boxShadow: {
        xs: `rgba(${Common_themes_themeContract_css.colorSchemeVars.boxshadow.shadowcolor}, .12) 0 ${utils.xUnits(0.25)} ${utils.xUnits(1)} 0`,
        sm: `rgba(${Common_themes_themeContract_css.colorSchemeVars.boxshadow.shadowcolor}, .16) 0 ${utils.xUnits(1)} ${utils.xUnits(2)} 0`,
        md: `rgba(${Common_themes_themeContract_css.colorSchemeVars.boxshadow.shadowcolor}, .2) 0 ${utils.xUnits(1.5)} ${utils.xUnits(3)} 0`,
        lg: `rgba(${Common_themes_themeContract_css.colorSchemeVars.boxshadow.shadowcolor}, .24) 0 ${utils.xUnits(2)} ${utils.xUnits(4)} 0`,
        xl: `rgba(${Common_themes_themeContract_css.colorSchemeVars.boxshadow.shadowcolor}, .28) 0 ${utils.xUnits(3)} ${utils.xUnits(5)} 0`
    },
    borderRadius: {
        sm: utils.xUnits(0.5),
        md: utils.xUnits(1),
        lg: utils.xUnits(1.5),
        xl: utils.xUnits(2)
    }
};
const dvt = {
    label: {
        sm: {
            fontSize: Common_themes_themeContract_css.typographyVars.body.xs.fontSize
        },
        md: {
            fontSize: Common_themes_themeContract_css.typographyVars.body.sm.fontSize
        },
        lg: {
            fontSize: Common_themes_themeContract_css.typographyVars.body.md.fontSize
        }
    },
    dimmedOpacity: '0.35'
};

exports.base = base;
exports.dvt = dvt;
//# sourceMappingURL=theme.base.tokens.js.map
