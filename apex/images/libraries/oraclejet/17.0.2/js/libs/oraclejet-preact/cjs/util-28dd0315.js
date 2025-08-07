/* @oracle/oraclejet-preact: undefined */
'use strict';

var datatipUtils = require('./datatipUtils-ed3682ed.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const calculateOffset = (isRtl, width, bounds) => {
    if (!bounds) {
        return { mainAxis: datatipUtils.DATATIP_OFFSET, crossAxis: datatipUtils.DATATIP_OFFSET };
    }
    const center = {
        x: bounds.x + bounds.width / 2,
        y: bounds.y + bounds.height / 2
    };
    return {
        mainAxis: -center.y + datatipUtils.DATATIP_OFFSET,
        crossAxis: isRtl ? width - center.x : center.x
    };
};

exports.calculateOffset = calculateOffset;
//# sourceMappingURL=util-28dd0315.js.map
