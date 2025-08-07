/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useDebounce } from './useDebounce-fa5a80e9.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { L as LiveRegion } from './LiveRegion-81216fe6.js';

const MAX_LENGTH_UPDATE_DELAY = 500;
function MaxLengthLiveRegion({ maxLength, testId, valueLength = 0 }) {
    // Comment copied from InputBase.js in Big JET:
    // Only update the aria-live div when the user has paused for more than
    // 500 milliseconds. That way, we avoid queued up aria-live messages which
    // would be annoying and not helpful. The 500ms was agreed upon in the
    // accessibility review meeting.
    const debouncedRemainingChars = useDebounce(maxLength - valueLength, MAX_LENGTH_UPDATE_DELAY);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const remainingCharsTranslatedString = translations.formControl_maxLengthRemaining({
        CHARACTER_COUNT: `${debouncedRemainingChars}`
    });
    return jsx(LiveRegion, { testId: testId, children: remainingCharsTranslatedString });
}

export { MaxLengthLiveRegion as M };
//# sourceMappingURL=MaxLengthLiveRegion-cd15b075.js.map
