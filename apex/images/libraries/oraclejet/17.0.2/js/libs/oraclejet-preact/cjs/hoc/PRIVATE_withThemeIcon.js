/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var useTheme = require('../useTheme-9b0dc066.js');
require('preact/hooks');
require('../LayerHost-46e4d858.js');
require('preact');
require('../Common/themes/redwood/theme.js');
require('../Common/themes/themeContract.css.js');
require('preact/compat');

// Returns a component that renders one of the given icon components based on theme
const withThemeIcon = (themeIcons) => {
    return (props) => {
        const { name } = useTheme.useTheme();
        const Component = themeIcons[name];
        return jsxRuntime.jsx(Component, { ...props });
    };
};

exports.withThemeIcon = withThemeIcon;
//# sourceMappingURL=PRIVATE_withThemeIcon.js.map
