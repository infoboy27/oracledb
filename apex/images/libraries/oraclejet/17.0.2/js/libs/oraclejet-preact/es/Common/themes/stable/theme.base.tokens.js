/* @oracle/oraclejet-preact: undefined */
import { x as xUnits } from '../../../utils-6eab3a64.js';
import { colorSchemeVars, typographyVars } from '../themeContract.css.js';
import '../../../colorUtils-16eb823f.js';
import '../../../_curry1-25297e59.js';

/**
 * Stable theme tokens are manually updated and are not generated from Figma tokens
 */
const base = {
    cursor: {
        clickable: 'pointer'
    },
    boxShadow: {
        xs: `rgba(${colorSchemeVars.boxshadow.shadowcolor}, .12) 0 ${xUnits(0.25)} ${xUnits(1)} 0`,
        sm: `rgba(${colorSchemeVars.boxshadow.shadowcolor}, .16) 0 ${xUnits(1)} ${xUnits(2)} 0`,
        md: `rgba(${colorSchemeVars.boxshadow.shadowcolor}, .2) 0 ${xUnits(1.5)} ${xUnits(3)} 0`,
        lg: `rgba(${colorSchemeVars.boxshadow.shadowcolor}, .24) 0 ${xUnits(2)} ${xUnits(4)} 0`,
        xl: `rgba(${colorSchemeVars.boxshadow.shadowcolor}, .28) 0 ${xUnits(3)} ${xUnits(5)} 0`
    },
    borderRadius: {
        sm: xUnits(0.5),
        md: xUnits(1),
        lg: xUnits(1.5),
        xl: xUnits(2)
    }
};
const dvt = {
    label: {
        sm: {
            fontSize: typographyVars.body.xs.fontSize
        },
        md: {
            fontSize: typographyVars.body.sm.fontSize
        },
        lg: {
            fontSize: typographyVars.body.md.fontSize
        }
    },
    dimmedOpacity: '0.35'
};

export { base, dvt };
//# sourceMappingURL=theme.base.tokens.js.map
