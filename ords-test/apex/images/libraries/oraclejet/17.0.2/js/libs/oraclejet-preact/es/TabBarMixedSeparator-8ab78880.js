/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { V as View } from './View-6013acac.js';
import { styles } from './UNSAFE_TabBarMixed/themes/TabBarMixedSeparator.css.js';

/**
 * TabBarMixedSeparator is a component that renders a visual separator (displayed
 * as a vertical line) between collections of tabs within TabBarMixed.
 *
 * @param {TabBarMixedSeparatorProps} props Component props for TabBarMixedSeparator.
 * @returns {JSX.Element} Component element for TabBarMixedSeparator.
 */
function TabBarMixedSeparator(props) {
    const { padding = 0 } = props;
    return (jsx(View, { padding: [0, padding, 0, padding], children: jsx("div", { class: styles.separator, role: "presentation" }) }));
}

export { TabBarMixedSeparator as T };
//# sourceMappingURL=TabBarMixedSeparator-8ab78880.js.map
