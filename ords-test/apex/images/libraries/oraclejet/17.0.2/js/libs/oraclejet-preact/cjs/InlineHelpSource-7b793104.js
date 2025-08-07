/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme = require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js');

function InlineHelpSource({ children, source }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const userAssistance_learnMoreStr = translations.userAssistance_learnMore();
    children = children ?? userAssistance_learnMoreStr;
    // JET-52914 - Implement Tabbable mode API contract in InputText
    // if not tabbable, spread tabbableModeProps on component
    const { isTabbable, tabbableModeProps } = useTabbableMode.useTabbableMode();
    // TODO: Implement and use a preact Link component instead of using an anchor tag
    const { classes, styles } = useComponentTheme.useComponentTheme(UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme.UserAssistanceRedwoodTheme);
    const { helpSourceStyles } = styles; // TODO: refactor types so inferring works properly
    return (jsxRuntime.jsx("a", { class: classNames.classNames([classes, helpSourceStyles]), target: "_blank", href: source, ...(!isTabbable && tabbableModeProps), children: children }));
}

exports.InlineHelpSource = InlineHelpSource;
//# sourceMappingURL=InlineHelpSource-7b793104.js.map
