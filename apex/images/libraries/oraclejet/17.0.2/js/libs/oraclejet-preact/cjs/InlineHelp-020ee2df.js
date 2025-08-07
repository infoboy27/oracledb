/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var InlineHelpSource = require('./InlineHelpSource-7b793104.js');
var UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme = require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js');

function InlineHelp({ assistiveText, sourceLink, sourceText }) {
    const { styles: { helpTextStyles } } = useComponentTheme.useComponentTheme(UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme.UserAssistanceRedwoodTheme);
    return (jsxRuntime.jsxs("div", { children: [assistiveText && sourceLink ? (jsxRuntime.jsx("span", { class: helpTextStyles, children: assistiveText })) : (assistiveText), sourceLink && jsxRuntime.jsx(InlineHelpSource.InlineHelpSource, { source: sourceLink, children: sourceText })] }));
}

exports.InlineHelp = InlineHelp;
//# sourceMappingURL=InlineHelp-020ee2df.js.map
