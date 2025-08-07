/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { useRef } from 'preact/hooks';
import { u as useVisEvent } from './useVisEvents-4cfe354c.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { g as getRandomId } from './layoutUtils-2374ab3e.js';
import { l as legendVars, g as getLegendTextStyle, u as useLegendLayout, a as getItemInfo, i as isEqualItem, j as getKeyUpHandler, b as getDatatipText, c as useLegendDatatip, d as getAriaProps, e as useLegendContextMenu, f as getGridNums, L as LegendText, B as BaseLegend, h as getIsLegendItemActionable } from './useLegendContextMenu-d88be99d.js';
import { u as useItemFocus } from './useItemFocus-c12e2756.js';
import { F as Flex } from './Flex-24628925.js';
import { styles } from './UNSAFE_Legend/themes/LegendStyles.css.js';
import { u as useCssVars } from './useCssVars-64d9b696.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useVisTouchResponse } from './useVisTouchResponse-e9ca4766.js';
import { m as merge } from './stringUtils-16f617bc.js';

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
    const testIdProps = useTestId(testId);
    const rootRef = useRef(null);
    const rootDimsRef = useRef();
    const { resolvedVars, cssContent } = useCssVars(legendVars);
    const { getItem, getDetailFromInfo, getPrevItemInfo, getNextItemInfo } = getSectionalNavUtils(sections);
    const legendFontStylesObj = getLegendTextStyle({
        fontStyle: props.textFontStyle,
        fontSize: props.textFontSize?.toString(),
        fontWeight: props.textFontWeight?.toString(),
        fontFamily: props.textFontFamily
    }, resolvedVars);
    const isLegendItemActionable = getIsLegendItemActionable(sections, isReadOnly, true);
    const { textMeasureContent, layoutInfo } = useLegendLayout({
        rootRef,
        rootDimsRef,
        resolvedVars,
        sections,
        orientation,
        legendFontStylesObj,
        symbolWidth: props.symbolWidth
    });
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({ type: 'touchStart' });
    const { focusedItemInfo, hoveredItemInfo, onContextMenuDismissed, activeId, eventsProps } = useVisEvent(touchResponse, !isReadOnly, isLegendItemActionable, getKeyUpHandler, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, onItemAction, onItemHover, onItemFocus, isEqualItem, getItemInfo, { itemIdx: 0, sectionIdx: 0 });
    const { focusedItemRef } = useItemFocus(focusedItemInfo);
    const text = getDatatipText(sections, getItem, focusedItemInfo, hoveredItemInfo);
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useLegendDatatip({
        text,
        rootDimsRef,
        focusedItemInfo,
        focusedItemRef,
        touchResponse
    });
    const ariaProps = getAriaProps(isReadOnly, props['aria-label'], props.hiddenIds, merge([props['aria-describedby'], datatipAriaDescribedby]), props['aria-labelledby']);
    const { contextMenuContent, contextMenuProps } = useLegendContextMenu({
        rootRef,
        contextMenuConfig,
        focusedItemInfo,
        sections,
        isReadOnly,
        onContextMenuDismissed
    });
    const mergedProps = mergeProps(eventsProps, datatipProps, contextMenuProps);
    const titleStyle = {
        fontFamily: props.sectionTitleFontFamily,
        fontSize: props.sectionTitleFontSize,
        color: props.sectionTitleColor,
        fontStyle: props.sectionTitleFontStyle,
        fontWeight: props.sectionTitleFontWeight,
        textDecoration: props.sectionTitleTextDecoration
    };
    const { sectionalLegendBaseStyles, renderedLegendStyle, preRenderedLegendStyle } = styles;
    const isHoriz = orientation === 'horizontal';
    const canRender = orientation === 'vertical' || !!layoutInfo;
    return (jsxs("div", { ref: rootRef, tabIndex: isReadOnly ? undefined : 0, role: "application", class: classNames([
            sectionalLegendBaseStyles,
            canRender ? renderedLegendStyle : preRenderedLegendStyle
        ]), style: touchResponseStyle, ...testIdProps, ...ariaProps, ...mergedProps, "aria-activedescendant": activeId, children: [canRender ? (jsx(Flex, { direction: isHoriz ? 'row' : 'column', wrap: 'wrap', gap: '4x', children: sections.map((section, index) => {
                    const labelledById = !isReadOnly ? getRandomId() : '';
                    const isWrappedSection = layoutInfo ? layoutInfo.isWrapped : false;
                    const flexDirection = !isHoriz || isWrappedSection ? 'column' : 'row';
                    const alignItems = !isHoriz || isWrappedSection ? 'start' : 'center';
                    const { itemsPerCol, itemsPerRow } = getGridNums(section.items.length, layoutInfo);
                    return (jsxs(Flex, { align: alignItems, direction: flexDirection, maxWidth: '100%', justify: 'start', wrap: "wrap", children: [jsx(LegendText, { text: section.title, ...titleStyle, type: "title", id: labelledById, align: sectionTitleHAlign }), jsx(BaseLegend, { ...props, focusedItemRef: focusedItemRef, labelledBy: labelledById, sectionIdx: index, items: section.items, orientation: orientation, itemsPerRow: itemsPerRow, itemsPerCol: itemsPerCol, itemWidth: layoutInfo?.isWrapped ? layoutInfo?.maxItemWidth : undefined, isReadOnly: isReadOnly, focusedItemInfo: focusedItemInfo, hoveredItemInfo: hoveredItemInfo, activeId: activeId, hideAndShowBehavior: hideAndShowBehavior, hoverBehavior: hoverBehavior })] }));
                }) })) : null, datatipContent, textMeasureContent, cssContent, contextMenuContent] }));
}

export { SectionalLegend as S };
//# sourceMappingURL=SectionalLegend-6ffb4255.js.map
