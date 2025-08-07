/* @oracle/oraclejet-preact: undefined */
'use strict';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the normalized Position depending on the reading direction
 * @param side The side that should be normalized
 * @param direction The reading direction
 * @returns The normalized 'right' or 'left' position if the side was 'start' or 'end', otherwise returns unchanged position
 */
const normalizePosition = (side, direction) => {
    const sideHashLtr = {
        start: 'left',
        end: 'right'
    };
    const sideHashRtl = {
        start: 'right',
        end: 'left'
    };
    if (direction === 'rtl') {
        return side.replace(/start|end/g, (matched) => sideHashRtl[matched]);
    }
    else {
        return side.replace(/start|end/g, (matched) => sideHashLtr[matched]);
    }
};
/**
 * Returns the reversed normalized Position depending on the reading direction
 * @param side The side that should be reversed
 * @param direction The reading direction
 * @returns The 'start' or 'end' position if the side was 'right' or 'left', otherwise returns unchanged position
 */
const reverseNormalizePosition = (side, direction) => {
    const sideHashLtr = {
        left: 'start',
        right: 'end'
    };
    const sideHashRtl = {
        right: 'start',
        left: 'end'
    };
    if (direction === 'rtl') {
        return side.replace(/left|right/g, (matched) => sideHashRtl[matched]);
    }
    else {
        return side.replace(/left|right/g, (matched) => sideHashLtr[matched]);
    }
};

exports.normalizePosition = normalizePosition;
exports.reverseNormalizePosition = reverseNormalizePosition;
//# sourceMappingURL=positionUtils-ae9279d7.js.map
