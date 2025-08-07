/* @oracle/oraclejet-preact: undefined */
'use strict';

var Common_themes_themeContract_css = require('./Common/themes/themeContract.css.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the color of the threshold.
 * @param color The color provided via prop of the visualization component.
 * @returns The color of the threshold.
 */
function getVisThresholdColor(color) {
    const colorAsString = color;
    if (colorAsString === 'danger' || colorAsString === 'warning' || colorAsString === 'success') {
        return Common_themes_themeContract_css.colorSchemeVars.dvt.threshold[colorAsString];
    }
    return color;
}

exports.getVisThresholdColor = getVisThresholdColor;
//# sourceMappingURL=utils-395027fe.js.map
