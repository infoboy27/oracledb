/* @oracle/oraclejet-preact: undefined */
import { x as xUnits, b as max } from '../../../utils-6eab3a64.js';
import '../themeContract.css.js';
import '../../../colorUtils-16eb823f.js';
import '../../../_curry1-25297e59.js';

/**
 * This has been changed to manually entered for now.  We need the fontSize to be based on the scale units.
 *
 * Do not edit directly
 * Generated on Tue, 27 Sep 2022 21:27:57 GMT
 */
const typography = {
    heading: {
        xs: {
            fontSize: xUnits(5), //'1.25rem',
            lineHeight: '1.4',
            fontWeight: '800'
        },
        sm: {
            fontSize: xUnits(6), //'1.5rem',
            lineHeight: '1.3333',
            fontWeight: '800'
        },
        md: {
            fontSize: xUnits(7), //'1.75rem',
            lineHeight: '1.2857',
            fontWeight: '800'
        },
        lg: {
            fontSize: xUnits(8), //'2rem',
            lineHeight: '1.25',
            fontWeight: '800'
        },
        xl: {
            fontSize: xUnits(9), //'2.25rem',
            lineHeight: '1.222',
            fontWeight: '800'
        },
        '2xl': {
            fontSize: xUnits(10), //'2.5rem',
            lineHeight: '1.3',
            fontWeight: '800'
        }
    },
    subheading: {
        '2xs': {
            fontSize: xUnits(3.5), //'.875rem',
            lineHeight: '1.4286',
            fontWeight: '700'
        },
        xs: {
            fontSize: xUnits(4), //'1rem',
            lineHeight: '1.5',
            fontWeight: '700'
        },
        sm: {
            fontSize: xUnits(5), //'1.25rem',
            lineHeight: '1.4',
            fontWeight: '700'
        },
        md: {
            fontSize: xUnits(6), //'1.5rem',
            lineHeight: '1.3333',
            fontWeight: '700'
        },
        lg: {
            fontSize: xUnits(7), //'1.75rem',
            lineHeight: '1.2857',
            fontWeight: '700'
        },
        xl: {
            fontSize: xUnits(8), //'2rem',
            lineHeight: '1.25',
            fontWeight: '700'
        },
        '2xl': {
            fontSize: xUnits(9), //'2.25rem',
            lineHeight: '1.2222',
            fontWeight: '700'
        }
    },
    // min values are px units as they are absolute minimums and shouldn't get smaller (or bigger) if the
    // root font-size changes.
    body: {
        '2xs': {
            fontSize: max(xUnits(2.5), '10px'), //'0.625rem'
            lineHeight: '1.2',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        xs: {
            fontSize: max(xUnits(3), '12px'), //'0.75rem'
            lineHeight: '1.3333',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        sm: {
            fontSize: max(xUnits(3.4375), '12px'), //'0.859375rem'
            lineHeight: '1.2',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        md: {
            fontSize: max(xUnits(4), '12px'), //'1rem'
            lineHeight: '1.25',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        lg: {
            fontSize: max(xUnits(4.5), '14px'), //'1.125rem'
            lineHeight: '1.3333',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        },
        xl: {
            fontSize: max(xUnits(5), '16px'), //'1.25rem'
            lineHeight: '1.4',
            fontWeight: {
                regular: '400',
                semibold: '600',
                bold: '700'
            }
        }
    }
};

export { typography };
//# sourceMappingURL=theme.typography.tokens.js.map
