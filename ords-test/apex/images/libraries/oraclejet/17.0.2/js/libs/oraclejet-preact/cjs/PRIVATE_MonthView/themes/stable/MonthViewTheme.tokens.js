/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var Common_themes_themeContract_css = require('../../../Common/themes/themeContract.css.js');
var utils = require('../../../utils-b7099be5.js');
var mergeDeepRight = require('../../../mergeDeepRight-2767a52a.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');
require('../../../_curry2-c15d89cd.js');
require('../../../mergeDeepWithKey-210b024d.js');
require('../../../_curry3-18677bca.js');
require('../../../_isObject-28636267.js');

// color scheme default vars
const monthViewColorSchemeDefault = {
    dayOfTheWeek: {
        color: Common_themes_themeContract_css.colorSchemeVars.textIcon.secondary
    }
};
// color scheme light extensions
const monthViewColorSchemeLight = mergeDeepRight.extendThemeContractVars(monthViewColorSchemeDefault, {}); // No overrides
// color scheme dark extensions
const monthViewColorSchemeDark = mergeDeepRight.extendThemeContractVars(monthViewColorSchemeDefault, {}); // No overrides
// scale default vars
const monthViewScaleSchemeDefault = {
    rowGap: utils.xUnits(3),
    columnGap: utils.xUnits(0),
    dayOfTheWeek: {
        lineHeight: Common_themes_themeContract_css.typographyVars.body.xs.lineHeight,
        fontSize: Common_themes_themeContract_css.typographyVars.body.xs.fontSize,
        fontWeight: Common_themes_themeContract_css.typographyVars.body.xs.fontWeight.semibold
    }
};
// scale lg extensions
const monthViewScaleSchemeLg = mergeDeepRight.extendThemeContractVars(monthViewScaleSchemeDefault, {}); // No overrides
// scale md extensions
const monthViewScaleSchemeMd = mergeDeepRight.extendThemeContractVars(monthViewScaleSchemeDefault, {}); // No overrides
// scale sm extensions
const monthViewScaleSchemeSm = mergeDeepRight.extendThemeContractVars(monthViewScaleSchemeDefault, {}); // No overrides

exports.monthViewColorSchemeDark = monthViewColorSchemeDark;
exports.monthViewColorSchemeDefault = monthViewColorSchemeDefault;
exports.monthViewColorSchemeLight = monthViewColorSchemeLight;
exports.monthViewScaleSchemeDefault = monthViewScaleSchemeDefault;
exports.monthViewScaleSchemeLg = monthViewScaleSchemeLg;
exports.monthViewScaleSchemeMd = monthViewScaleSchemeMd;
exports.monthViewScaleSchemeSm = monthViewScaleSchemeSm;
//# sourceMappingURL=MonthViewTheme.tokens.js.map
