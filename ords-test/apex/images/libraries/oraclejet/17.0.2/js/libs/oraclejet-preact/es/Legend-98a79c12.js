/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { useRef } from 'preact/hooks';
import { l as legendVars, g as getLegendTextStyle, u as useLegendLayout, a as getItemInfo, i as isEqualItem, b as getDatatipText, c as useLegendDatatip, d as getAriaProps, e as useLegendContextMenu, f as getGridNums, B as BaseLegend, h as getIsLegendItemActionable, j as getKeyUpHandler } from './useLegendContextMenu-d88be99d.js';
import { u as useVisEvent } from './useVisEvents-4cfe354c.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useItemFocus } from './useItemFocus-c12e2756.js';
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
function getItem(itemInfo, items) {
    const { itemIdx } = itemInfo;
    if (itemIdx == -1) {
        return items[items.length - 1];
    }
    return items[itemIdx];
}
function getNextItemInfo(itemInfo, items) {
    let itemIdx = itemInfo.itemIdx;
    if (itemIdx == -1) {
        itemIdx = items.length - 1;
    }
    itemIdx = Math.min(items.length - 1, itemIdx + 1);
    if (items[itemIdx].actionable !== 'off') {
        return { sectionIdx: 0, itemIdx };
    }
    else if (itemIdx === items.length - 1) {
        itemIdx = itemIdx - 1;
        return { sectionIdx: 0, itemIdx };
    }
    return getNextItemInfo({ sectionIdx: 0, itemIdx }, items);
}
function getPrevItemInfo(itemInfo, items) {
    let itemIdx = itemInfo.itemIdx;
    if (itemIdx == -1) {
        itemIdx = items.length - 1;
    }
    itemIdx = Math.max(0, itemIdx - 1);
    if (items[itemIdx].actionable !== 'off') {
        return { sectionIdx: 0, itemIdx };
    }
    return getPrevItemInfo({ sectionIdx: 0, itemIdx }, items);
}
/**
 * Returns utils functions for navigation in simple legend.
 * @param items
 * @returns
 */
function getLegendNavUtils(items) {
    return {
        getItem: (itemInfo) => {
            return getItem(itemInfo, items);
        },
        getDetailFromInfo: (itemInfo) => {
            if (!itemInfo) {
                return { itemId: undefined, data: undefined };
            }
            const item = getItem(itemInfo, items);
            return { itemId: item.id, data: item };
        },
        getPrevItemInfo: (itemInfo) => {
            return getPrevItemInfo(itemInfo, items);
        },
        getNextItemInfo: (itemInfo) => {
            return getNextItemInfo(itemInfo, items);
        }
    };
}

/**
 * A legend displays an interactive description of symbols, colors, etc., used in graphical information representations.
 */
function Legend({ orientation = 'horizontal', items, isReadOnly = true, onItemAction, onItemHover, onItemFocus, testId, contextMenuConfig, hideAndShowBehavior = 'off', hoverBehavior = 'none', ...props }) {
    const testIdProps = useTestId(testId);
    const rootRef = useRef(null);
    const rootDimsRef = useRef();
    const { getItem, getDetailFromInfo, getPrevItemInfo, getNextItemInfo } = getLegendNavUtils(items);
    const { resolvedVars, cssContent } = useCssVars(legendVars);
    const legendFontStylesObj = getLegendTextStyle({
        fontStyle: props.textFontStyle,
        fontSize: props.textFontSize?.toString(),
        fontWeight: props.textFontWeight?.toString(),
        fontFamily: props.textFontFamily
    }, resolvedVars);
    const isLegendItemActionable = getIsLegendItemActionable(items, isReadOnly);
    const { textMeasureContent, layoutInfo } = useLegendLayout({
        resolvedVars,
        items,
        rootRef,
        rootDimsRef,
        orientation,
        legendFontStylesObj,
        symbolWidth: props.symbolWidth
    });
    const legendKeyUpHandler = (triggerOnAction, updatefocusedItemInfo, focusedItemInfo) => getKeyUpHandler(triggerOnAction, updatefocusedItemInfo, focusedItemInfo, props.hiddenIds != null);
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({ type: 'touchStart' });
    //shall we put the below useEvent specific snipped in a useLegendEvents?
    const { focusedItemInfo, hoveredItemInfo, onContextMenuDismissed, activeId, eventsProps } = useVisEvent(touchResponse, !isReadOnly, isLegendItemActionable, legendKeyUpHandler, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, onItemAction, onItemHover, onItemFocus, isEqualItem, getItemInfo, { itemIdx: 0, sectionIdx: 0 }, props.hiddenIds != null);
    const { focusedItemRef } = useItemFocus(focusedItemInfo);
    const datatipText = getDatatipText(items, getItem, focusedItemInfo, hoveredItemInfo);
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useLegendDatatip({
        text: datatipText,
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
        items,
        isReadOnly,
        onContextMenuDismissed
    });
    const mergedProps = mergeProps(eventsProps, datatipProps, contextMenuProps);
    const { itemsPerCol, itemsPerRow } = getGridNums(items.length, layoutInfo);
    const { legendStyle, renderedLegendStyle, preRenderedLegendStyle } = styles;
    const canRender = orientation === 'vertical' || !!layoutInfo;
    return (jsxs("div", { ref: rootRef, tabIndex: isReadOnly ? undefined : 0, role: "application", class: classNames([legendStyle, canRender ? renderedLegendStyle : preRenderedLegendStyle]), style: touchResponseStyle, ...testIdProps, ...ariaProps, ...mergedProps, "aria-activedescendant": activeId, children: [canRender ? (jsx(BaseLegend, { ...props, focusedItemRef: focusedItemRef, items: items, isReadOnly: isReadOnly, orientation: orientation, sectionIdx: 0, itemsPerRow: itemsPerRow, itemsPerCol: itemsPerCol, itemWidth: layoutInfo?.isWrapped ? layoutInfo?.maxItemWidth : undefined, focusedItemInfo: focusedItemInfo, hoveredItemInfo: hoveredItemInfo, activeId: activeId, hideAndShowBehavior: hideAndShowBehavior, hoverBehavior: hoverBehavior })) : null, datatipContent, textMeasureContent, cssContent, contextMenuContent] }));
}

export { Legend as L };
//# sourceMappingURL=Legend-98a79c12.js.map
