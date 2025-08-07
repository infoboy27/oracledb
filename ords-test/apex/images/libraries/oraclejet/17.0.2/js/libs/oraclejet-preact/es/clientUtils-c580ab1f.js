/* @oracle/oraclejet-preact: undefined */
import { g as getClientHints } from './clientHints-c76a913b.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const clientHints = getClientHints();
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if runnning on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = clientHints.deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}
/**
 * Helper function to determine whether the current device supports touch.
 */
function isTouch() {
    const touchSupport = clientHints.touchSupport;
    return touchSupport === 'primary';
}

export { isMobile as a, isTouch as i };
//# sourceMappingURL=clientUtils-c580ab1f.js.map
