/* @oracle/oraclejet-preact: undefined */
import { D as DATATIP_OFFSET } from './datatipUtils-5cb22909.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const calculateOffset = (isRtl, width, bounds) => {
    if (!bounds) {
        return { mainAxis: DATATIP_OFFSET, crossAxis: DATATIP_OFFSET };
    }
    const center = {
        x: bounds.x + bounds.width / 2,
        y: bounds.y + bounds.height / 2
    };
    return {
        mainAxis: -center.y + DATATIP_OFFSET,
        crossAxis: isRtl ? width - center.x : center.x
    };
};

export { calculateOffset as c };
//# sourceMappingURL=util-c1d41418.js.map
