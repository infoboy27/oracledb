/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var IconButton = require('./IconButton-94f8ca5c.js');
var DeleteCircleS = require('./DeleteCircleS-5f54c539.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
require('preact/hooks');

/**
 * ClearIcon is used to clear an input value.
 * @param onClick Callback for clearing value when button is clicked
 * @param testId ID used for testing purposes
 */
function ClearIcon({ onClick, testId }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const clearStr = translations.formControl_clear();
    return (jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsxRuntime.jsx("div", { "aria-hidden": "true", children: jsxRuntime.jsx(IconButton.IconButton, { variant: "ghost", size: "sm", onAction: onClick, tooltip: clearStr, testId: testId, children: jsxRuntime.jsx(DeleteCircleS.SvgDeleteCircleS, {}) }) }) }));
}

exports.ClearIcon = ClearIcon;
//# sourceMappingURL=ClearIcon-50725213.js.map
