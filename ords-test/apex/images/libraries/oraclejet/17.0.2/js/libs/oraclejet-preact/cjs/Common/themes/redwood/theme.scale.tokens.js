/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

// This file contains all of the scale definitions since each (currently) has only one value to specify.
// If this contract grows, we can split this into individual files like colorScheme has.
// For the scale 'sm, 'md' and 'lg', we specify units in px so that they won't be affected by the root font-size.
// This is similar to what spectrum does.
const scale_sm = {
    size: {
        units: '3px'
    }
};
const scale_md = {
    size: {
        units: '3.5px'
    }
};
const scale_lg = {
    size: {
        units: '4px'
    }
};
// For the default, where no scale is specified, we use rem units, so that it will scale based on the root font-size.
const scale_default = {
    size: {
        units: '0.25rem'
    }
};

exports.scale_default = scale_default;
exports.scale_lg = scale_lg;
exports.scale_md = scale_md;
exports.scale_sm = scale_sm;
//# sourceMappingURL=theme.scale.tokens.js.map
