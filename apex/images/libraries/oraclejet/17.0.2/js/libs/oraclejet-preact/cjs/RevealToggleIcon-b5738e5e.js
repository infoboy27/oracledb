/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var ViewHide = require('./ViewHide-28d21a7a.js');
var View = require('./View-02f558de.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var IconSwitchButton = require('./IconSwitchButton-094ace3a.js');

/**
 * RevealToggleIcon is a controlled toggle icon component with tooltip that displays
 * hide or show icons. It is used internally for input components that hide and show the content.
 */
function RevealToggleIcon({ accessibleLabel, isRevealed, onToggle, testId, tooltipHide, tooltipShow }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const hide = tooltipHide || translations.formControl_hide();
    const show = tooltipShow || translations.formControl_show();
    return (jsxRuntime.jsx(IconSwitchButton.IconSwitchButton
    // we want to display the tooltip title of the expected action on toggle
    , { 
        // we want to display the tooltip title of the expected action on toggle
        tooltip: isRevealed ? hide : show, accessibleLabel: accessibleLabel, 
        // denote that the switch is selected when in the "masked" state
        isSelected: !isRevealed, onToggle: onToggle, testId: testId, size: "sm", children: isRevealed ? jsxRuntime.jsx(ViewHide.SvgViewHide, {}) : jsxRuntime.jsx(View.SvgView, {}) }));
}

exports.RevealToggleIcon = RevealToggleIcon;
//# sourceMappingURL=RevealToggleIcon-b5738e5e.js.map
