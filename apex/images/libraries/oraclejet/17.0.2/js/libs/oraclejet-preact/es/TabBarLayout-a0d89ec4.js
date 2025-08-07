/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { F as Flex } from './Flex-24628925.js';
import { u as useTabBarContext, T as TabBarContext } from './useTabBarContext-0071d2a7.js';

/**
 * TabBarLayout is used to manage the display and layout of tab items within
 * its children.
 *
 * @param {TabBarLayoutProps} props TabBarLayout component props.
 * @returns {JSX.Element} TabBarLayout component element.
 */
function TabBarLayout(props) {
    const { children, display, layout } = props;
    const context = useTabBarContext();
    return (jsx(TabBarContext.Provider, { value: {
            ...context,
            display,
            layout
        }, children: jsx(Flex, { direction: "row", gap: "8x", flex: "1 0 auto", children: children }) }));
}

export { TabBarLayout as T };
//# sourceMappingURL=TabBarLayout-a0d89ec4.js.map
