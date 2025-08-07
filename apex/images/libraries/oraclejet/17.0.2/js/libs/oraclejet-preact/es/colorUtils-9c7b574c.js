/* @oracle/oraclejet-preact: undefined */
import { a as rgb } from './utils-6eab3a64.js';
import { colorSchemeVars } from './Common/themes/themeContract.css.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the dvt categorical colors.
 */
function getColorRamp() {
    return Array.from({ length: 12 }, (_, index) => {
        return rgb(colorSchemeVars.dvt.paletteQualitative[(index + 1)]);
    });
}

export { getColorRamp as g };
//# sourceMappingURL=colorUtils-9c7b574c.js.map
