/* @oracle/oraclejet-preact: undefined */
import { scaleVars, densityVars } from './Common/themes/themeContract.css.js';
import { r as rgb$1 } from './colorUtils-16eb823f.js';

const rgb = (rgb) => rgb$1(rgb);
// TODO: create rgba function in PRIVATE_colorUtils
const rgba = (rgb, alpha) => `rgba(${rgb}, ${alpha})`;
// JET-59344 refactor of 'fallbackVar' from '@vanilla-extract/css'.
// directly importing the function was causing vanilla-extract to be bundled into
// the preact packages and causing issues with testing
const fallbackVar = (...values) => {
    const finalValue = values.reverse().reduce((acc, value) => {
        if (acc === '') {
            acc = String(value);
        }
        else {
            if (typeof value !== 'string' || !/^var\(--.*\)$/.test(value)) {
                throw new Error(`Invalid variable name: ${value}`);
            }
            acc = value.replace(/\)$/, `, ${acc})`);
        }
        return acc;
    }, '');
    return finalValue;
};
// For the default, where no scale var is specified, we use rem units, so that it will scale based on the root font-size.
const scaleFallback = () => fallbackVar(scaleVars.size.units, '0.25rem');
const xUnits = (unit) => unit === 1 ? scaleFallback() : `calc(${unit} * ${scaleFallback()})`;
// For the default, where no density var is specified, we set it to 0px.
const densityFallback = () => fallbackVar(densityVars.density.units, '0px');
const densityUnits = (unit) => unit === 1 ? densityFallback() : `calc(${unit} * ${densityFallback()})`;
const min = (val, minVal) => `min(${val},${minVal})`;
const max = (val, minVal) => `max(${val},${minVal})`;

export { rgb as a, max as b, densityUnits as d, fallbackVar as f, min as m, rgba as r, xUnits as x };
//# sourceMappingURL=utils-6eab3a64.js.map
