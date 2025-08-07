/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var ListItemText = require('./ListItemText-4c20b365.js');
var UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css = require('./UNSAFE_ListItemLayout/themes/ListItemLayoutStyles.css.js');

function ListItemTextLayout({ primary, secondary, tertiary, overline }) {
    return (jsxRuntime.jsxs("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.flexColumnStyles, children: [jsxRuntime.jsx(ListItemText.ListItemText, { variant: "overline", children: overline }), jsxRuntime.jsx(ListItemText.ListItemText, { variant: "primary", children: primary }), jsxRuntime.jsx(ListItemText.ListItemText, { variant: "secondary", children: secondary }), jsxRuntime.jsx(ListItemText.ListItemText, { variant: "tertiary", children: tertiary })] }));
}

exports.ListItemTextLayout = ListItemTextLayout;
//# sourceMappingURL=ListItemTextLayout-b5a48ffa.js.map
