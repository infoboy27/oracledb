/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { G as Grid } from './Grid-cfeac922.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { styles } from './UNSAFE_ListItemLayout/themes/ListItemLayoutStyles.css.js';

// TODO: revisit idea of negative margin when selector has a proper API for handling spacing
// Jira: JET-54543
/**
 * A ListItemLayout component represents a layout used for list view item elements.
 */
function ListItemLayout({ children, selector, leading, primary, secondary, tertiary, overline, metadata, trailing, action, quaternary, navigation }) {
    // generate grid skeleton, adding cells based on which props are defined
    const { columnsTemplate, firstCell, secondCell, lastCell, hasSecondRow } = getColumnsTemplate(selector, leading, metadata, trailing, action, quaternary, navigation);
    // if ListItemLayout component has a child (ListItemTextLayout) then render that instead of individual props
    const textArea = children ? (jsx("div", { className: styles.childrenStyles, children: children })) : (jsxs("div", { className: styles.flexColumnStyles, children: [jsx("div", { children: overline }), jsx("div", { children: primary }), jsx("div", { children: secondary }), jsx("div", { children: tertiary })] }));
    // a second row is needed when quaternary or navigation are defined
    const secondRow = hasSecondRow
        ? [
            firstCell && jsx("span", { children: " " }),
            secondCell && jsx("span", { children: " " }),
            jsx("div", { className: styles.rowAlignStyles, children: quaternary }),
            lastCell && jsx("div", { className: styles.endJustifyStyles, children: navigation })
        ]
        : null;
    return (jsxs(Grid, { gap: "4x", gridTemplateColumns: columnsTemplate, children: [firstCell, secondCell, jsx("div", { className: styles.centerVerticalStyles, children: textArea }), lastCell, secondRow] }));
}
function getColumnsTemplate(selector, leading, metadata, trailing, action, quaternary, navigation) {
    const columnsTemplateBuilder = [];
    let firstCell = null;
    if (selector) {
        columnsTemplateBuilder.push('auto');
        firstCell = jsx("div", { className: styles.selectorStyles, children: selector });
    }
    let secondCell = null;
    if (leading) {
        columnsTemplateBuilder.push('auto');
        secondCell = jsx("div", { className: styles.centerVerticalStyles, children: leading });
    }
    columnsTemplateBuilder.push('1fr'); // Text area always gets 1 full fraction of allotted space
    let lastCell = null;
    if (metadata || trailing || action || navigation) {
        columnsTemplateBuilder.push('auto');
        lastCell = (jsxs("div", { className: styles.flexRowStyles, children: [jsx("div", { className: classNames([
                        styles.centerVerticalStyles,
                        metadata ? styles.leftPaddingStyles : ''
                    ]), children: metadata }), jsx("div", { className: classNames([
                        styles.centerVerticalStyles,
                        trailing ? styles.leftPaddingStyles : ''
                    ]), children: trailing }), jsx("div", { className: classNames([styles.centerVerticalStyles, action ? styles.actionStyles : '']), children: action })] }));
    }
    const columnsTemplate = columnsTemplateBuilder.join(' ');
    const hasSecondRow = quaternary || navigation ? true : false;
    return { columnsTemplate, firstCell, secondCell, lastCell, hasSecondRow };
}

export { ListItemLayout as L };
//# sourceMappingURL=ListItemLayout-695ec1a5.js.map
