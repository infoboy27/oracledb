/* @oracle/oraclejet-preact: undefined */
'use strict';

var utils = require('./utils-b7099be5.js');
var Common_themes_themeContract_css = require('./Common/themes/themeContract.css.js');

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
        return utils.rgb(Common_themes_themeContract_css.colorSchemeVars.dvt.paletteQualitative[(index + 1)]);
    });
}

exports.getColorRamp = getColorRamp;
//# sourceMappingURL=colorUtils-0d6ee5fe.js.map
