/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useRef } from 'preact/hooks';
import { forwardRef, useImperativeHandle } from 'preact/compat';
import './LayerHost-45f545d7.js';
import './UNSAFE_Text/themes/TextStyles.css.js';
import './Flex-24628925.js';
import { T as TabBarContext } from './useTabBarContext-0071d2a7.js';
import './flexitem-7b7f7920.js';
import './dimensions-5229d942.js';
import './boxalignment-486c5ac9.js';
import './logger-c92f309c.js';
import './TabBarItemStyles.styles.css';
import './UNSAFE_TabBarCommon/themes/redwood/TabBarItemBaseTheme.styles.css';
import './UNSAFE_TabBarCommon/themes/redwood/TabBarItemVariants.css.js';
import './ConveyorBeltContext-76a29c59.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './Floating-9703160e.js';
import './LayerStyles.styles.css';
import './keyboardUtils-4db21770.js';
import './tabbableUtils-dca964ca.js';
import './dropdownStyles.styles.css';
import './Sheet-e4121f4a.js';
import './OverflowTabBarItemStyles.styles.css';
import { styles } from './UNSAFE_TabBarMixed/themes/TabBarMixedStyles.css.js';
import { u as useTabBar } from './useTabBar-8af19c50.js';

/**
 * A thin wrapper around useTabBar hook
 */
function useTabBarMixed(options) {
    return useTabBar(options);
}

/**
 * A navigation component that enables horizontal navigation between distinct content with a mixture of static and dynamic tabs.
 *
 * @param {TabBarMixedProps} props TabBarMixed component props.
 * @returns {JSX.Element} TabBarMixed component element.
 */
const TabBarMixed = forwardRef((props, focusHandleRef) => {
    const { children, onRemove, onSelect, selection, size, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby } = props;
    const rootRef = useRef(null);
    const { rootProps, tabBarContext } = useTabBarMixed({
        class: styles.tabBarBase,
        edge: 'bottom',
        onRemove,
        onSelect,
        ref: rootRef,
        selection,
        size,
        children
    });
    //Allows to call focus on rootRef without having to expose it
    useImperativeHandle(focusHandleRef, () => ({
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
    return (jsx(TabBarContext.Provider, { value: tabBarContext, children: jsx("div", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, ...rootProps, children: children }) }));
});

export { TabBarMixed as T };
//# sourceMappingURL=TabBarMixed-3658d3d2.js.map
