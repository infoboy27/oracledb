/* @oracle/oraclejet-preact: undefined */
'use strict';

const defaultClientHints = {
    browser: 'unknown',
    browserMajorVersion: -1,
    deviceType: 'unknown',
    platform: 'unknown',
    touchSupport: 'unknown',
    hoverSupport: 'unknown'
};
let cachedClientHints;
function getClientHints(uaString) {
    // Compute if there is no cached result, OR if a userAgent string
    //  was passed in as an argument
    if (cachedClientHints === undefined || uaString) {
        let hints;
        // NOTE:  userAgentData only available from modern Chromium-based browsers
        //        executing in a secure context - otherwise, fall back to processing
        //        userAgent string
        const userAgentData = navigator?.['userAgentData'];
        if (userAgentData) {
            hints = getHintsFromUserAgentData(userAgentData);
        }
        else {
            hints = getHintsFromUserAgentString(uaString ?? navigator?.userAgent ?? '');
        }
        // If no argument was passed in then this was computed from Navigator properties:
        //    * determine touchSupport, hoverSupport
        //    * cache the results
        if (uaString === undefined) {
            // NOTE:  Order is important (determination of hoverSupport depends upon touchSupport)
            determineTouchSupport(hints);
            determineHoverSupport(hints);
            cachedClientHints = { ...hints };
            Object.freeze(cachedClientHints);
        }
        // Otherwise, return the one-off User-Agent string results without touching the cache
        else {
            return hints;
        }
    }
    return cachedClientHints;
}
function getHintsFromUserAgentData(userAgentData) {
    const hints = { ...defaultClientHints };
    // Loop through brands => browser, browserMajorVersion
    for (const item of userAgentData.brands) {
        const brand = item.brand.toLowerCase();
        if (brand.indexOf('chrome') > -1) {
            hints.browser = 'chrome';
        }
        else if (brand.indexOf('edge') > -1) {
            hints.browser = 'edge';
        }
        if (hints.browser !== 'unknown') {
            hints.browserMajorVersion = Number(item.version);
            break;
        }
    }
    // Set deviceType, platform
    const platform = userAgentData.platform.toLowerCase();
    if (platform === 'windows') {
        hints.platform = 'windows';
    }
    else if (platform === 'android') {
        hints.platform = 'android';
        hints.deviceType = userAgentData.mobile ? 'phone' : 'tablet';
    }
    else if (platform === 'macos') {
        hints.platform = 'mac';
    }
    // TODO: Verify userAgentData support in Chrome 100 on iPhone/iPad when available
    /*
    else if (platform.indexOf('iphone') > -1) {
      hints.platform = 'ios';
      hints.deviceType = 'phone';
    } else if (platform.indexOf('ipad') > -1) {
      hints.platform = 'ios';
      hints.deviceType = 'tablet';
    } else if (platform.indexOf('ios') > -1) {
      hints.platform = 'ios';
      hints.deviceType = (userAgentData.mobile ? 'phone' : 'tablet');
    }
    */
    return hints;
}
function getHintsFromUserAgentString(userAgent) {
    const hints = { ...defaultClientHints };
    // Normalize the userAgent string
    userAgent = userAgent.toLowerCase();
    // Check platform, deviceType
    if (userAgent.indexOf('iphone') > -1) {
        hints.platform = 'ios';
        hints.deviceType = 'phone';
    }
    else if (userAgent.indexOf('ipad') > -1 ||
        // handle iPad/iPhone safari requesting desktop version of site
        (userAgent.indexOf('macintosh') > -1 && navigator?.maxTouchPoints > 0)) {
        hints.platform = 'ios';
        hints.deviceType = 'tablet';
    }
    else if (userAgent.indexOf('mac') > -1) {
        hints.platform = 'mac';
    }
    else if (userAgent.indexOf('android') > -1) {
        hints.platform = 'android';
    }
    else if (userAgent.indexOf('win') > -1) {
        hints.platform = 'windows';
    }
    // Now work on browser, browserMajorVersion
    if (userAgent.indexOf('edg') > -1) {
        hints.browser = 'edge';
        hints.browserMajorVersion = parseMajorVersion(userAgent, /edg\/(\d+)/);
    }
    else if (userAgent.indexOf('chrome') > -1) {
        hints.browser = 'chrome';
        hints.browserMajorVersion = parseMajorVersion(userAgent, /chrome\/(\d+)/);
    }
    else if (userAgent.indexOf('crios') > -1) {
        hints.browser = 'chrome';
        hints.browserMajorVersion = parseMajorVersion(userAgent, /crios\/(\d+)/);
    }
    else if (userAgent.indexOf('fxios') > -1) {
        hints.browser = 'firefox';
        hints.browserMajorVersion = parseMajorVersion(userAgent, /fxios\/(\d+)/);
    }
    else if (userAgent.indexOf('firefox') > -1) {
        hints.browser = 'firefox';
        hints.browserMajorVersion = parseMajorVersion(userAgent, /rv:(\d+)/);
    }
    else if (userAgent.indexOf('safari') > -1) {
        hints.browser = 'safari';
        hints.browserMajorVersion = parseMajorVersion(userAgent, /version\/(\d+)/);
    }
    return hints;
}
function parseMajorVersion(userAgent, majorVersionPattern) {
    let majorVer;
    const matches = userAgent.match(majorVersionPattern);
    if (matches) {
        const majorVerString = matches[1];
        if (majorVerString) {
            majorVer = parseInt(majorVerString);
        }
    }
    return majorVer ?? -1;
}
function determineTouchSupport(hints) {
    // if no global window object, or if ontouchstart handler not supported & no touch points,
    // then no touch support
    if (typeof window === 'undefined' ||
        (!('ontouchstart' in window) && navigator.maxTouchPoints === 0)) {
        hints.touchSupport = 'none';
    }
    // otherwise if primary input pointer is 'coarse', then touch is the primary input method
    else if (window.matchMedia?.('(pointer: coarse)').matches) {
        hints.touchSupport = 'primary';
    }
    // otherwise if ANY input pointer is 'coarse', then touch is a secondary input method
    else if (window.matchMedia?.('(any-pointer: coarse)').matches) {
        hints.touchSupport = 'secondary';
    }
    // NOTES:
    //  - Pixel 7 devices have a bug (https://bugs.chromium.org/p/chromium/issues/detail?id=1384181) whereby
    //    ALL pointer media queries return 'fine', causing us to report hints.touchSupport as 'unknown'.
}
function determineHoverSupport(hints) {
    // if no global window object, or if primary input does not support hover, then specify no hover support
    if (typeof window === 'undefined' || window.matchMedia?.('(hover: none)').matches) {
        hints.hoverSupport = 'none';
    }
    // otherwise primary input must support hover - if there is some level of touch support and the primary
    // input pointer is 'fine' (indicating the presence of a hover-able pointer), then component code
    // should use event listeners to implement hover support
    else if (hints.touchSupport !== 'none' && window.matchMedia?.('(pointer: fine)').matches) {
        hints.hoverSupport = 'events';
    }
    // otherwise specify that component code can assume native CSS support for hover
    else {
        hints.hoverSupport = 'pseudo-classes';
    }
}

exports.getClientHints = getClientHints;
//# sourceMappingURL=clientHints-9e411b6e.js.map
