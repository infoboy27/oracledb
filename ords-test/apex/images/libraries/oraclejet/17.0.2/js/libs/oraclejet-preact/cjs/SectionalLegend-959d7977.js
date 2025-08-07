/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useVisEvents = require('./useVisEvents-3d806e47.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var layoutUtils = require('./layoutUtils-56b6111c.js');
var useLegendContextMenu = require('./useLegendContextMenu-a10bd2fc.js');
var useItemFocus = require('./useItemFocus-0c5fbee7.js');
var Flex = require('./Flex-fbba4ad6.js');
var UNSAFE_Legend_themes_LegendStyles_css = require('./UNSAFE_Legend/themes/LegendStyles.css.js');
var useCssVars = require('./useCssVars-4f061513.js');
var classNames = require('./classNames-c14c6ef3.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useVisTouchResponse = require('./useVisTouchResponse-fb9c4e8f.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getItem(itemInfo, sections) {
    const { sectionIdx, itemIdx } = itemInfo;
    if (sectionIdx == -1 && itemIdx == -1) {
        const itemsLength = sections[sections.length - 1].items.length;
        return sections[sections.length - 1].items[itemsLength - 1];
    }
    return sections[sectionIdx].items[itemIdx];
}
function getNextItemInfo(itemInfo, sections) {
    let { itemIdx, sectionIdx } = itemInfo;
    if (sectionIdx == -1 && itemIdx == -1) {
        return {
            itemIdx: sections[sections.length - 1].items.length - 1,
            sectionIdx: sections.length - 1
        };
    }
    itemIdx += 1;
    const itemsLength = sections[sectionIdx].items.length;
    if (itemIdx >= itemsLength) {
        if (sectionIdx === sections.length - 1) {
            itemIdx = itemInfo.itemIdx;
        }
        else {
            sectionIdx += 1;
            itemIdx = 0;
        }
    }
    const item = sections[sectionIdx].items[itemIdx]; //TODO : Work for better fix instead of adding 'as LegendItem<D>'
    if (item?.actionable !== 'off') {
        return { itemIdx, sectionIdx };
    }
    return getNextItemInfo({ itemIdx, sectionIdx }, sections);
}
function getPrevItemInfo(itemInfo, sections) {
    let { itemIdx, sectionIdx } = itemInfo;
    if (sectionIdx == -1 && itemIdx == -1) {
        (itemIdx = sections[sections.length - 1].items.length - 1), (sectionIdx = sections.length - 1);
    }
    itemIdx -= 1;
    if (itemIdx < 0) {
        if (sectionIdx === 0) {
            itemIdx = 0;
        }
        else {
            itemIdx = sections[sectionIdx - 1].items.length - 1;
            sectionIdx -= 1;
        }
    }
    const item = sections[sectionIdx].items[itemIdx]; //TODO : Work for better fix instead of adding 'as LegendItem<D>'
    if (item?.actionable !== 'off') {
        return { itemIdx, sectionIdx };
    }
    return getPrevItemInfo({ itemIdx, sectionIdx }, sections);
}
/**
 * Returns utils functions for navigation in simple sectional legend.
 * @param items
 * @returns
 */
function getSectionalNavUtils(sections) {
    return {
        getItem: (itemInfo) => {
            return getItem(itemInfo, sections);
        },
        getDetailFromInfo: (itemInfo) => {
            if (!itemInfo) {
                return { itemId: undefined, sectionId: undefined, data: undefined };
            }
            const item = getItem(itemInfo, sections);
            const sectionId = sections[itemInfo.sectionIdx].id;
            return {
                itemId: item.id,
                sectionId: sectionId,
                data: sections[itemInfo.sectionIdx].items[itemInfo.itemIdx]
            };
        },
        getPrevItemInfo: (itemInfo) => {
            return getPrevItemInfo(itemInfo, sections);
        },
        getNextItemInfo: (itemInfo) => {
            return getNextItemInfo(itemInfo, sections);
        }
    };
}

/**
 * A Sectional Legend allows grouping of legend items in sections with a specific title.
 */
function SectionalLegend({ orientation = 'horizontal', sectionTitleHAlign = 'start', sections, isReadOnly = true, onItemAction, onItemHover, onItemFocus, testId, contextMenuConfig, hideAndShowBehavior = 'off', hoverBehavior = 'none', ...props }) {
    const testIdProps = useTestId.useTestId(testId);
    const rootRef = hooks.useRef(null);
    const rootDimsRef = hooks.useRef();
    const { resolvedVars, cssContent } = useCssVars.useCssVars(useLegendContextMenu.legendVars);
    const { getItem, getDetailFromInfo, getPrevItemInfo, getNextItemInfo } = getSectionalNavUtils(sections);
    const legendFontStylesObj = useLegendContextMenu.getLegendTextStyle({
        fontStyle: props.textFontStyle,
        fontSize: props.textFontSize?.toString(),
        fontWeight: props.textFontWeight?.toString(),
        fontFamily: props.textFontFamily
    }, resolvedVars);
    const isLegendItemActionable = useLegendContextMenu.getIsLegendItemActionable(sections, isReadOnly, true);
    const { textMeasureContent, layoutInfo } = useLegendContextMenu.useLegendLayout({
        rootRef,
        rootDimsRef,
        resolvedVars,
        sections,
        orientation,
        legendFontStylesObj,
        symbolWidth: props.symbolWidth
    });
    const { touchResponse, touchResponseStyle } = useVisTouchResponse.useVisTouchResponse({ type: 'touchStart' });
    const { focusedItemInfo, hoveredItemInfo, onContextMenuDismissed, activeId, eventsProps } = useVisEvents.useVisEvent(touchResponse, !isReadOnly, isLegendItemActionable, useLegendContextMenu.getKeyUpHandler, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, onItemAction, onItemHover, onItemFocus, useLegendContextMenu.isEqualItem, useLegendContextMenu.getItemInfo, { itemIdx: 0, sectionIdx: 0 });
    const { focusedItemRef } = useItemFocus.useItemFocus(focusedItemInfo);
    const text = useLegendContextMenu.getDatatipText(sections, getItem, focusedItemInfo, hoveredItemInfo);
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useLegendContextMenu.useLegendDatatip({
        text,
        rootDimsRef,
        focusedItemInfo,
        focusedItemRef,
        touchResponse
    });
    const ariaProps = useLegendContextMenu.getAriaProps(isReadOnly, props['aria-label'], props.hiddenIds, stringUtils.merge([props['aria-describedby'], datatipAriaDescribedby]), props['aria-labelledby']);
    const { contextMenuContent, contextMenuProps } = useLegendContextMenu.useLegendContextMenu({
        rootRef,
        contextMenuConfig,
        focusedItemInfo,
        sections,
        isReadOnly,
        onContextMenuDismissed
    });
    const mergedProps = mergeProps.mergeProps(eventsProps, datatipProps, contextMenuProps);
    const titleStyle = {
        fontFamily: props.sectionTitleFontFamily,
        fontSize: props.sectionTitleFontSize,
        color: props.sectionTitleColor,
        fontStyle: props.sectionTitleFontStyle,
        fontWeight: props.sectionTitleFontWeight,
        textDecoration: props.sectionTitleTextDecoration
    };
    const { sectionalLegendBaseStyles, renderedLegendStyle, preRenderedLegendStyle } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    const isHoriz = orientation === 'horizontal';
    const canRender = orientation === 'vertical' || !!layoutInfo;
    return (jsxRuntime.jsxs("div", { ref: rootRef, tabIndex: isReadOnly ? undefined : 0, role: "application", class: classNames.classNames([
            sectionalLegendBaseStyles,
            canRender ? renderedLegendStyle : preRenderedLegendStyle
        ]), style: touchResponseStyle, ...testIdProps, ...ariaProps, ...mergedProps, "aria-activedescendant": activeId, children: [canRender ? (jsxRuntime.jsx(Flex.Flex, { direction: isHoriz ? 'row' : 'column', wrap: 'wrap', gap: '4x', children: sections.map((section, index) => {
                    const labelledById = !isReadOnly ? layoutUtils.getRandomId() : '';
                    const isWrappedSection = layoutInfo ? layoutInfo.isWrapped : false;
                    const flexDirection = !isHoriz || isWrappedSection ? 'column' : 'row';
                    const alignItems = !isHoriz || isWrappedSection ? 'start' : 'center';
                    const { itemsPerCol, itemsPerRow } = useLegendContextMenu.getGridNums(section.items.length, layoutInfo);
                    return (jsxRuntime.jsxs(Flex.Flex, { align: alignItems, direction: flexDirection, maxWidth: '100%', justify: 'start', wrap: "wrap", children: [jsxRuntime.jsx(useLegendContextMenu.LegendText, { text: section.title, ...titleStyle, type: "title", id: labelledById, align: sectionTitleHAlign }), jsxRuntime.jsx(useLegendContextMenu.BaseLegend, { ...props, focusedItemRef: focusedItemRef, labelledBy: labelledById, sectionIdx: index, items: section.items, orientation: orientation, itemsPerRow: itemsPerRow, itemsPerCol: itemsPerCol, itemWidth: layoutInfo?.isWrapped ? layoutInfo?.maxItemWidth : undefined, isReadOnly: isReadOnly, focusedItemInfo: focusedItemInfo, hoveredItemInfo: hoveredItemInfo, activeId: activeId, hideAndShowBehavior: hideAndShowBehavior, hoverBehavior: hoverBehavior })] }));
                }) })) : null, datatipContent, textMeasureContent, cssContent, contextMenuContent] }));
}

exports.SectionalLegend = SectionalLegend;
//# sourceMappingURL=SectionalLegend-959d7977.js.map
