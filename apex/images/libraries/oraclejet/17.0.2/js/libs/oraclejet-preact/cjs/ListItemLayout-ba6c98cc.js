/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Grid = require('./Grid-03d487e5.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css = require('./UNSAFE_ListItemLayout/themes/ListItemLayoutStyles.css.js');

// TODO: revisit idea of negative margin when selector has a proper API for handling spacing
// Jira: JET-54543
/**
 * A ListItemLayout component represents a layout used for list view item elements.
 */
function ListItemLayout({ children, selector, leading, primary, secondary, tertiary, overline, metadata, trailing, action, quaternary, navigation }) {
    // generate grid skeleton, adding cells based on which props are defined
    const { columnsTemplate, firstCell, secondCell, lastCell, hasSecondRow } = getColumnsTemplate(selector, leading, metadata, trailing, action, quaternary, navigation);
    // if ListItemLayout component has a child (ListItemTextLayout) then render that instead of individual props
    const textArea = children ? (jsxRuntime.jsx("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.childrenStyles, children: children })) : (jsxRuntime.jsxs("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.flexColumnStyles, children: [jsxRuntime.jsx("div", { children: overline }), jsxRuntime.jsx("div", { children: primary }), jsxRuntime.jsx("div", { children: secondary }), jsxRuntime.jsx("div", { children: tertiary })] }));
    // a second row is needed when quaternary or navigation are defined
    const secondRow = hasSecondRow
        ? [
            firstCell && jsxRuntime.jsx("span", { children: " " }),
            secondCell && jsxRuntime.jsx("span", { children: " " }),
            jsxRuntime.jsx("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.rowAlignStyles, children: quaternary }),
            lastCell && jsxRuntime.jsx("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.endJustifyStyles, children: navigation })
        ]
        : null;
    return (jsxRuntime.jsxs(Grid.Grid, { gap: "4x", gridTemplateColumns: columnsTemplate, children: [firstCell, secondCell, jsxRuntime.jsx("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.centerVerticalStyles, children: textArea }), lastCell, secondRow] }));
}
function getColumnsTemplate(selector, leading, metadata, trailing, action, quaternary, navigation) {
    const columnsTemplateBuilder = [];
    let firstCell = null;
    if (selector) {
        columnsTemplateBuilder.push('auto');
        firstCell = jsxRuntime.jsx("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.selectorStyles, children: selector });
    }
    let secondCell = null;
    if (leading) {
        columnsTemplateBuilder.push('auto');
        secondCell = jsxRuntime.jsx("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.centerVerticalStyles, children: leading });
    }
    columnsTemplateBuilder.push('1fr'); // Text area always gets 1 full fraction of allotted space
    let lastCell = null;
    if (metadata || trailing || action || navigation) {
        columnsTemplateBuilder.push('auto');
        lastCell = (jsxRuntime.jsxs("div", { className: UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.flexRowStyles, children: [jsxRuntime.jsx("div", { className: classNames.classNames([
                        UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.centerVerticalStyles,
                        metadata ? UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.leftPaddingStyles : ''
                    ]), children: metadata }), jsxRuntime.jsx("div", { className: classNames.classNames([
                        UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.centerVerticalStyles,
                        trailing ? UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.leftPaddingStyles : ''
                    ]), children: trailing }), jsxRuntime.jsx("div", { className: classNames.classNames([UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.centerVerticalStyles, action ? UNSAFE_ListItemLayout_themes_ListItemLayoutStyles_css.styles.actionStyles : '']), children: action })] }));
    }
    const columnsTemplate = columnsTemplateBuilder.join(' ');
    const hasSecondRow = quaternary || navigation ? true : false;
    return { columnsTemplate, firstCell, secondCell, lastCell, hasSecondRow };
}

exports.ListItemLayout = ListItemLayout;
//# sourceMappingURL=ListItemLayout-ba6c98cc.js.map
