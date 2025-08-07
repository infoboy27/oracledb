/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var compat = require('preact/compat');
require('./LayerHost-46e4d858.js');
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

var UNSAFE_TabBarMixed_themes_TabBarMixedStyles_css = require('./UNSAFE_TabBarMixed/themes/TabBarMixedStyles.css.js');
var useTabBar = require('./useTabBar-35edcdb1.js');

/**
 * A thin wrapper around useTabBar hook
 */
function useTabBarMixed(options) {
    return useTabBar.useTabBar(options);
}

/**
 * A navigation component that enables horizontal navigation between distinct content with a mixture of static and dynamic tabs.
 *
 * @param {TabBarMixedProps} props TabBarMixed component props.
 * @returns {JSX.Element} TabBarMixed component element.
 */
const TabBarMixed = compat.forwardRef((props, focusHandleRef) => {
    const { children, onRemove, onSelect, selection, size, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby } = props;
    const rootRef = hooks.useRef(null);
    const { rootProps, tabBarContext } = useTabBarMixed({
        class: UNSAFE_TabBarMixed_themes_TabBarMixedStyles_css.styles.tabBarBase,
        edge: 'bottom',
        onRemove,
        onSelect,
        ref: rootRef,
        selection,
        size,
        children
    });
    //Allows to call focus on rootRef without having to expose it
    compat.useImperativeHandle(focusHandleRef, () => ({
        focus: () => {
            if (rootRef.current) {
                rootRef.current.focus();
            }
        },
        blur: () => {
            if (rootRef.current) {
                rootRef.current.blur();
            }
        }
    }));
    return (jsxRuntime.jsx(useTabBarContext.TabBarContext.Provider, { value: tabBarContext, children: jsxRuntime.jsx("div", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, ...rootProps, children: children }) }));
});

exports.TabBarMixed = TabBarMixed;
//# sourceMappingURL=TabBarMixed-bc696a46.js.map
