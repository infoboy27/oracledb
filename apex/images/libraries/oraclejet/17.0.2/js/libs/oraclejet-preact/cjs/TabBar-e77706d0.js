/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
require('./LayerHost-46e4d858.js');
var compat = require('preact/compat');
require('./UNSAFE_Text/themes/TextStyles.css.js');
require('./Flex-fbba4ad6.js');
var useTabBarContext = require('./useTabBarContext-2a6a796c.js');
require('./flexitem-fee13e26.js');
require('./dimensions-b48bf1ab.js');
require('./boxalignment-5ef612ee.js');
require('./logger-2b636482.js');


require('./UNSAFE_TabBarCommon/themes/redwood/TabBarItemVariants.css.js');
require('./ConveyorBeltContext-bfe84b44.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./NavigationList-5218562e.js');
require('./useNavigationListItem-74009187.js');
require('./UNSAFE_NavigationList/themes/NavigationListItemStyles.css.js');

require('./UNSAFE_NavigationList/themes/redwood/NavigationListItemVariants.css.js');
require('./Floating-1280c2ce.js');

require('./keyboardUtils-f835e1ee.js');
require('./tabbableUtils-b49673af.js');

require('./Sheet-a6267b5f.js');

var TabBarLayout = require('./TabBarLayout-c2efbeb3.js');
var UNSAFE_TabBar_themes_TabBarStyles_css = require('./UNSAFE_TabBar/themes/TabBarStyles.css.js');
var useTabBar = require('./useTabBar-35edcdb1.js');

/**
 * A tab bar allows navigation between different content sections.
 */
const TabBar = compat.forwardRef(({ children, layout = 'stretch', display = 'standard', size = 'md', edge = 'top', selection, onSelect, onRemove, 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby }, ref) => {
    const rootRef = hooks.useRef(null);
    //Allows to call focus on rootRef without having to expose it
    hooks.useImperativeHandle(ref, () => ({
        focus: () => {
            if (rootRef.current) {
                rootRef.current.focus();
            }
        },
        blur: () => {
            if (rootRef.current) {
                rootRef.current.focus();
            }
        }
    }));
    const { rootProps, tabBarContext } = useTabBar.useTabBar({
        class: UNSAFE_TabBar_themes_TabBarStyles_css.styles.tabBarBase,
        edge: edge,
        onRemove,
        onSelect,
        ref: rootRef,
        selection,
        size,
        children
    });
    return (jsxRuntime.jsx(useTabBarContext.TabBarContext.Provider, { value: tabBarContext, children: jsxRuntime.jsx("div", { ...rootProps, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, "aria-describedby": ariaDescribedBy, children: jsxRuntime.jsx(TabBarLayout.TabBarLayout, { layout: layout, display: display, children: children }) }) }));
});

exports.TabBar = TabBar;
//# sourceMappingURL=TabBar-e77706d0.js.map
