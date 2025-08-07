/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useLegendContextMenu = require('./useLegendContextMenu-a10bd2fc.js');
var useVisEvents = require('./useVisEvents-3d806e47.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useItemFocus = require('./useItemFocus-0c5fbee7.js');
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
    const testIdProps = useTestId.useTestId(testId);
    const rootRef = hooks.useRef(null);
    const rootDimsRef = hooks.useRef();
    const { getItem, getDetailFromInfo, getPrevItemInfo, getNextItemInfo } = getLegendNavUtils(items);
    const { resolvedVars, cssContent } = useCssVars.useCssVars(useLegendContextMenu.legendVars);
    const legendFontStylesObj = useLegendContextMenu.getLegendTextStyle({
        fontStyle: props.textFontStyle,
        fontSize: props.textFontSize?.toString(),
        fontWeight: props.textFontWeight?.toString(),
        fontFamily: props.textFontFamily
    }, resolvedVars);
    const isLegendItemActionable = useLegendContextMenu.getIsLegendItemActionable(items, isReadOnly);
    const { textMeasureContent, layoutInfo } = useLegendContextMenu.useLegendLayout({
        resolvedVars,
        items,
        rootRef,
        rootDimsRef,
        orientation,
        legendFontStylesObj,
        symbolWidth: props.symbolWidth
    });
    const legendKeyUpHandler = (triggerOnAction, updatefocusedItemInfo, focusedItemInfo) => useLegendContextMenu.getKeyUpHandler(triggerOnAction, updatefocusedItemInfo, focusedItemInfo, props.hiddenIds != null);
    const { touchResponse, touchResponseStyle } = useVisTouchResponse.useVisTouchResponse({ type: 'touchStart' });
    //shall we put the below useEvent specific snipped in a useLegendEvents?
    const { focusedItemInfo, hoveredItemInfo, onContextMenuDismissed, activeId, eventsProps } = useVisEvents.useVisEvent(touchResponse, !isReadOnly, isLegendItemActionable, legendKeyUpHandler, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, onItemAction, onItemHover, onItemFocus, useLegendContextMenu.isEqualItem, useLegendContextMenu.getItemInfo, { itemIdx: 0, sectionIdx: 0 }, props.hiddenIds != null);
    const { focusedItemRef } = useItemFocus.useItemFocus(focusedItemInfo);
    const datatipText = useLegendContextMenu.getDatatipText(items, getItem, focusedItemInfo, hoveredItemInfo);
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useLegendContextMenu.useLegendDatatip({
        text: datatipText,
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
        items,
        isReadOnly,
        onContextMenuDismissed
    });
    const mergedProps = mergeProps.mergeProps(eventsProps, datatipProps, contextMenuProps);
    const { itemsPerCol, itemsPerRow } = useLegendContextMenu.getGridNums(items.length, layoutInfo);
    const { legendStyle, renderedLegendStyle, preRenderedLegendStyle } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    const canRender = orientation === 'vertical' || !!layoutInfo;
    return (jsxRuntime.jsxs("div", { ref: rootRef, tabIndex: isReadOnly ? undefined : 0, role: "application", class: classNames.classNames([legendStyle, canRender ? renderedLegendStyle : preRenderedLegendStyle]), style: touchResponseStyle, ...testIdProps, ...ariaProps, ...mergedProps, "aria-activedescendant": activeId, children: [canRender ? (jsxRuntime.jsx(useLegendContextMenu.BaseLegend, { ...props, focusedItemRef: focusedItemRef, items: items, isReadOnly: isReadOnly, orientation: orientation, sectionIdx: 0, itemsPerRow: itemsPerRow, itemsPerCol: itemsPerCol, itemWidth: layoutInfo?.isWrapped ? layoutInfo?.maxItemWidth : undefined, focusedItemInfo: focusedItemInfo, hoveredItemInfo: hoveredItemInfo, activeId: activeId, hideAndShowBehavior: hideAndShowBehavior, hoverBehavior: hoverBehavior })) : null, datatipContent, textMeasureContent, cssContent, contextMenuContent] }));
}

exports.Legend = Legend;
//# sourceMappingURL=Legend-a03cbeb5.js.map
