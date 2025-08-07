/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { L as ListItemText } from './ListItemText-b03ca283.js';
import { styles } from './UNSAFE_ListItemLayout/themes/ListItemLayoutStyles.css.js';

function ListItemTextLayout({ primary, secondary, tertiary, overline }) {
    return (jsxs("div", { className: styles.flexColumnStyles, children: [jsx(ListItemText, { variant: "overline", children: overline }), jsx(ListItemText, { variant: "primary", children: primary }), jsx(ListItemText, { variant: "secondary", children: secondary }), jsx(ListItemText, { variant: "tertiary", children: tertiary })] }));
}

export { ListItemTextLayout as L };
//# sourceMappingURL=ListItemTextLayout-97a68a8c.js.map
