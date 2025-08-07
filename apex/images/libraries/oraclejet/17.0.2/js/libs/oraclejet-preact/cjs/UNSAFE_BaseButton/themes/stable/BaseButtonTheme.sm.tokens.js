/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var utils = require('../../../utils-b7099be5.js');
var Common_themes_themeContract_css = require('../../../Common/themes/themeContract.css.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');

const scaleSchemeSm = {
    borderRadius: Common_themes_themeContract_css.baseVars.borderRadius.md,
    fontSize: Common_themes_themeContract_css.typographyVars.body.md.fontSize,
    sizes: {
        xs: {
            textToEdgePadding: utils.xUnits(5.33),
            // 24px x 24px is the minimum size per WCAG Success Criterion 2.5.8 Target Size (Minimum)
            height: utils.max(`calc(${utils.xUnits(8)} + ${utils.densityUnits(3)})`, '24px')
        },
        sm: {
            textToEdgePadding: utils.xUnits(4),
            // 24px x 24px is the minimum size per WCAG Success Criterion 2.5.8 Target Size (Minimum)
            height: utils.max(`calc(${utils.xUnits(9)} + ${utils.densityUnits(3)})`, '24px')
        },
        md: {
            textToEdgePadding: utils.xUnits(4),
            // 24px x 24px is the minimum size per WCAG Success Criterion 2.5.8 Target Size (Minimum)
            height: utils.max(`calc(${utils.xUnits(9.33)} + ${utils.densityUnits(2)})`, '24px')
        },
        lg: {
            textToEdgePadding: utils.xUnits(6),
            height: `calc(${utils.xUnits(13)} + ${utils.densityUnits(2)})`
        }
    }
};

exports.scaleSchemeSm = scaleSchemeSm;
//# sourceMappingURL=BaseButtonTheme.sm.tokens.js.map
