/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var View = require('./View-011404a7.js');
var UNSAFE_TabBarMixed_themes_TabBarMixedSeparator_css = require('./UNSAFE_TabBarMixed/themes/TabBarMixedSeparator.css.js');

/**
 * TabBarMixedSeparator is a component that renders a visual separator (displayed
 * as a vertical line) between collections of tabs within TabBarMixed.
 *
 * @param {TabBarMixedSeparatorProps} props Component props for TabBarMixedSeparator.
 * @returns {JSX.Element} Component element for TabBarMixedSeparator.
 */
function TabBarMixedSeparator(props) {
    const { padding = 0 } = props;
    return (jsxRuntime.jsx(View.View, { padding: [0, padding, 0, padding], children: jsxRuntime.jsx("div", { class: UNSAFE_TabBarMixed_themes_TabBarMixedSeparator_css.styles.separator, role: "presentation" }) }));
}

exports.TabBarMixedSeparator = TabBarMixedSeparator;
//# sourceMappingURL=TabBarMixedSeparator-6388ccda.js.map
