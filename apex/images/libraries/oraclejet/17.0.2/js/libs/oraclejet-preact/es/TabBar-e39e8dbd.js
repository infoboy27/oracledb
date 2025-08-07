/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useRef, useImperativeHandle } from 'preact/hooks';
import './LayerHost-45f545d7.js';
import { forwardRef } from 'preact/compat';
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
import { T as TabBarLayout } from './TabBarLayout-a0d89ec4.js';
import { styles } from './UNSAFE_TabBar/themes/TabBarStyles.css.js';
import { u as useTabBar } from './useTabBar-8af19c50.js';

/**
 * A tab bar allows navigation between different content sections.
 */
const TabBar = forwardRef(({ children, layout = 'stretch', display = 'standard', size = 'md', edge = 'top', selection, onSelect, onRemove, 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby }, ref) => {
    const rootRef = useRef(null);
    //Allows to call focus on rootRef without having to expose it
    useImperativeHandle(ref, () => ({
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
    const { rootProps, tabBarContext } = useTabBar({
        class: styles.tabBarBase,
        edge: edge,
        onRemove,
        onSelect,
        ref: rootRef,
        selection,
        size,
        children
    });
    return (jsx(TabBarContext.Provider, { value: tabBarContext, children: jsx("div", { ...rootProps, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, "aria-describedby": ariaDescribedBy, children: jsx(TabBarLayout, { layout: layout, display: display, children: children }) }) }));
});

export { TabBar as T };
//# sourceMappingURL=TabBar-e39e8dbd.js.map
