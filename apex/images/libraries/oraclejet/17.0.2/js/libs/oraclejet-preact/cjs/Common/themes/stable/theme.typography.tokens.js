/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var utils = require('../../../utils-b7099be5.js');
require('../themeContract.css.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');

/**
 * Stable theme tokens are manually updated and are not generated from Figma tokens
 */
const typography = {
    heading: {
        xs: {
            fontSize: utils.xUnits(5), //'1.25rem',
            lineHeight: '1.25',
            fontWeight: '800'
        },
        sm: {
            fontSize: utils.xUnits(6), //'1.5rem',
            lineHeight: '1.25',
            fontWeight: '800'
        },
        md: {
            fontSize: utils.xUnits(7), //'1.75rem',
            lineHeight: '1.25',
            fontWeight: '800'
        },
        lg: {
            fontSize: utils.xUnits(8), //'2rem',
            lineHeight: '1.25',
            fontWeight: '800'
        },
        xl: {
            fontSize: utils.xUnits(9), //'2.25rem',
            lineHeight: '1.25',
            fontWeight: '800'
        },
        '2xl': {
            fontSize: utils.xUnits(10), //'2.5rem',
            lineHeight: '1.25',
            fontWeight: '800'
        }
    },
    subheading: {
        '2xs': {
            fontSize: utils.xUnits(3), //'.75rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        xs: {
            fontSize: utils.xUnits(4), //'1rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        sm: {
            fontSize: utils.xUnits(5), //'1.25rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        md: {
            fontSize: utils.xUnits(6), //'1.5rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        lg: {
            fontSize: utils.xUnits(7), //'1.75rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        xl: {
            fontSize: utils.xUnits(8), //'2rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        '2xl': {
            fontSize: utils.xUnits(9), //'2.25rem',
            lineHeight: '1.25',
            fontWeight: '700'
        }
    },
    // min values are px units as they are absolute minimums and shouldn't get smaller (or bigger) if the
    // root font-size changes.
    body: {
        '2xs': {
            fontSize: utils.max(utils.xUnits(2.5), '10px'), //'0.625rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        xs: {
            fontSize: utils.max(utils.xUnits(3), '12px'), //'0.75rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        sm: {
            fontSize: utils.max(utils.xUnits(3.4375), '12px'), //'0.859375rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        md: {
            fontSize: utils.max(utils.xUnits(4), '12px'), //'1rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        lg: {
            fontSize: utils.max(utils.xUnits(4.5), '14px'), //'1.125rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        xl: {
            fontSize: utils.max(utils.xUnits(5), '16px'), //'1.25rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        }
    }
};

exports.typography = typography;
//# sourceMappingURL=theme.typography.tokens.js.map
