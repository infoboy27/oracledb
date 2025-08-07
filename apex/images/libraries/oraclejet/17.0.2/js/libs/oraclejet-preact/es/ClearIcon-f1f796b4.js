/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { I as IconButton } from './IconButton-37310d21.js';
import { S as SvgDeleteCircleS } from './DeleteCircleS-9f2988b6.js';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
import 'preact/hooks';

/**
 * ClearIcon is used to clear an input value.
 * @param onClick Callback for clearing value when button is clicked
 * @param testId ID used for testing purposes
 */
function ClearIcon({ onClick, testId }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const clearStr = translations.formControl_clear();
    return (jsx(TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsx("div", { "aria-hidden": "true", children: jsx(IconButton, { variant: "ghost", size: "sm", onAction: onClick, tooltip: clearStr, testId: testId, children: jsx(SvgDeleteCircleS, {}) }) }) }));
}

export { ClearIcon as C };
//# sourceMappingURL=ClearIcon-f1f796b4.js.map
