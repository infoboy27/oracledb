/* @oracle/oraclejet-preact: undefined */
import { colorSchemeVars, typographyVars } from '../../../Common/themes/themeContract.css.js';
import { x as xUnits } from '../../../utils-6eab3a64.js';
import { e as extendThemeContractVars } from '../../../mergeDeepRight-9af9863b.js';
import '../../../colorUtils-16eb823f.js';
import '../../../_curry1-25297e59.js';
import '../../../_curry2-34316bcf.js';
import '../../../mergeDeepWithKey-08531060.js';
import '../../../_curry3-0b4222d7.js';
import '../../../_isObject-1fab0f5b.js';

// color scheme default vars
const monthViewColorSchemeDefault = {
    dayOfTheWeek: {
        color: colorSchemeVars.textIcon.secondary
    }
};
// color scheme light extensions
const monthViewColorSchemeLight = extendThemeContractVars(monthViewColorSchemeDefault, {}); // No overrides
// color scheme dark extensions
const monthViewColorSchemeDark = extendThemeContractVars(monthViewColorSchemeDefault, {}); // No overrides
// scale default vars
const monthViewScaleSchemeDefault = {
    rowGap: xUnits(3),
    columnGap: xUnits(0),
    dayOfTheWeek: {
        lineHeight: typographyVars.body.xs.lineHeight,
        fontSize: typographyVars.body.xs.fontSize,
        fontWeight: typographyVars.body.xs.fontWeight.semibold
    }
};
// scale lg extensions
const monthViewScaleSchemeLg = extendThemeContractVars(monthViewScaleSchemeDefault, {}); // No overrides
// scale md extensions
const monthViewScaleSchemeMd = extendThemeContractVars(monthViewScaleSchemeDefault, {}); // No overrides
// scale sm extensions
const monthViewScaleSchemeSm = extendThemeContractVars(monthViewScaleSchemeDefault, {}); // No overrides

export { monthViewColorSchemeDark, monthViewColorSchemeDefault, monthViewColorSchemeLight, monthViewScaleSchemeDefault, monthViewScaleSchemeLg, monthViewScaleSchemeMd, monthViewScaleSchemeSm };
//# sourceMappingURL=MonthViewTheme.tokens.js.map
