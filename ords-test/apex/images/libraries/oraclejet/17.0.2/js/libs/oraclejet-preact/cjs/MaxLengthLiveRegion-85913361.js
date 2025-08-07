/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useDebounce = require('./useDebounce-4304cfbd.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');

const MAX_LENGTH_UPDATE_DELAY = 500;
function MaxLengthLiveRegion({ maxLength, testId, valueLength = 0 }) {
    // Comment copied from InputBase.js in Big JET:
    // Only update the aria-live div when the user has paused for more than
    // 500 milliseconds. That way, we avoid queued up aria-live messages which
    // would be annoying and not helpful. The 500ms was agreed upon in the
    // accessibility review meeting.
    const debouncedRemainingChars = useDebounce.useDebounce(maxLength - valueLength, MAX_LENGTH_UPDATE_DELAY);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const remainingCharsTranslatedString = translations.formControl_maxLengthRemaining({
        CHARACTER_COUNT: `${debouncedRemainingChars}`
    });
    return jsxRuntime.jsx(LiveRegion.LiveRegion, { testId: testId, children: remainingCharsTranslatedString });
}

exports.MaxLengthLiveRegion = MaxLengthLiveRegion;
//# sourceMappingURL=MaxLengthLiveRegion-85913361.js.map
