/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useTheme } from '../useTheme-1f6035d2.js';
import 'preact/hooks';
import '../LayerHost-45f545d7.js';
import 'preact';
import '../Common/themes/redwood/theme.js';
import '../Common/themes/themeContract.css.js';
import 'preact/compat';

// Returns a component that renders one of the given icon components based on theme
const withThemeIcon = (themeIcons) => {
    return (props) => {
        const { name } = useTheme();
        const Component = themeIcons[name];
        return jsx(Component, { ...props });
    };
};

export { withThemeIcon };
//# sourceMappingURL=PRIVATE_withThemeIcon.js.map
