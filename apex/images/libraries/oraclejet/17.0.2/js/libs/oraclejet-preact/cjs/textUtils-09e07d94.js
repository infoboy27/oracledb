/* @oracle/oraclejet-preact: undefined */
'use strict';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const isOverlap = (L1, R1, L2, R2) => L1 <= R2 && L2 <= R1;
/**
 * Checks if the two dimensions are overlapping horizontally.
 * @param dimsA
 * @param dimsB
 * @returns
 */
function isWidthOverlap(dimsA, dimsB) {
    return isOverlap(dimsA.x, dimsA.x + dimsA.width, dimsB.x, dimsB.x + dimsB.width);
}
/**
 * Checks if the two dimensions are overlapping vertically.
 * @param dimsA
 * @param dimsB
 * @returns
 */
function isHeightOverlap(dimsA, dimsB) {
    return isOverlap(dimsA.y, dimsA.y + dimsA.height, dimsB.y, dimsB.y + dimsB.height);
}

exports.isHeightOverlap = isHeightOverlap;
exports.isWidthOverlap = isWidthOverlap;
//# sourceMappingURL=textUtils-09e07d94.js.map
