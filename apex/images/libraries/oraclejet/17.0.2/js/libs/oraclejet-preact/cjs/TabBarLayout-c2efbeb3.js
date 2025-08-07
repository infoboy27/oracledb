/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Flex = require('./Flex-fbba4ad6.js');
var useTabBarContext = require('./useTabBarContext-2a6a796c.js');

/**
 * TabBarLayout is used to manage the display and layout of tab items within
 * its children.
 *
 * @param {TabBarLayoutProps} props TabBarLayout component props.
 * @returns {JSX.Element} TabBarLayout component element.
 */
function TabBarLayout(props) {
    const { children, display, layout } = props;
    const context = useTabBarContext.useTabBarContext();
    return (jsxRuntime.jsx(useTabBarContext.TabBarContext.Provider, { value: {
            ...context,
            display,
            layout
        }, children: jsxRuntime.jsx(Flex.Flex, { direction: "row", gap: "8x", flex: "1 0 auto", children: children }) }));
}

exports.TabBarLayout = TabBarLayout;
//# sourceMappingURL=TabBarLayout-c2efbeb3.js.map
