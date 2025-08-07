/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var SvgSymbol = require('./SvgSymbol-cd5eab42.js');
var UNSAFE_Legend_themes_LegendStyles_css = require('./UNSAFE_Legend/themes/LegendStyles.css.js');
var Text = require('./Text-aaacb6a0.js');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var useUser = require('./useUser-a6d15333.js');
var datatipUtils = require('./datatipUtils-ed3682ed.js');
var useDatatip = require('./useDatatip-ff0c568c.js');
var useTextDimensions = require('./useTextDimensions-0eabedd5.js');
var useContextMenu = require('./useContextMenu-f3cf0db8.js');
require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
require('./logger-2b636482.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
require('./LayerHost-46e4d858.js');
var Common_themes_themeContract_css = require('./Common/themes/themeContract.css.js');
var utils = require('./utils-b7099be5.js');
var eventsUtils = require('./eventsUtils-8680c9d7.js');

function ImageMarker(props) {
    const { imageMarkerStyle } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    return jsxRuntime.jsx("img", { class: imageMarkerStyle, src: props.source });
}

const LegendSymbol = ({ 
// The default color is not in the redwood pallete.
// TODO: replace default legend color with UX approved pallete color when available.
markerColor = '#a6acb1', lineColor = '#a6acb1', markerShape = 'square', isHidden = false, lineStyle = 'none', ...props }) => {
    const { legendSymbolBaseStyle } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    const dimensionsNotSet = props.width == null && props.height == null;
    const setAspectRatioNone = !dimensionsNotSet && (markerShape === 'rectangle' || markerShape === 'ellipse');
    const defaultLineWidth = lineStyle != 'none' && markerShape != 'none' ? 2 : 3;
    return (jsxRuntime.jsx("div", { className: legendSymbolBaseStyle, style: { width: props.width, height: props.height }, children: props.source ? (jsxRuntime.jsx(ImageMarker, { source: props.source })) : (jsxRuntime.jsx(SvgSymbol.SvgSymbol, { setAspectRatioNone: setAspectRatioNone, markerShape: isHidden ? 'square' : markerShape, lineStyle: isHidden ? 'none' : lineStyle, lineColor: lineColor, lineLength: props.lineLength, lineWidth: props.lineWidth != null ? props.lineWidth : defaultLineWidth, markerColor: isHidden ? 'transparent' : markerColor, borderColor: isHidden ? markerColor || lineColor : props.borderColor, setAbsolutePos: true })) }));
};

/**
 * Returns the legend text component.
 */
const LegendText = ({ text, type = 'label', id, align = 'start', ...props }) => {
    const { legendTextBaseStyle, legendTextTitle, legendTitleStartAlign, legendTitleCenterAlign, legendTitleEndAlign } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    const isTitle = type === 'title';
    return (jsxRuntime.jsx("div", { class: classNames.classNames([
            legendTextBaseStyle,
            isTitle ? legendTextTitle : '',
            isTitle && align === 'start' ? legendTitleStartAlign : '',
            isTitle && align === 'center' ? legendTitleCenterAlign : '',
            isTitle && align === 'end' ? legendTitleEndAlign : ''
        ]), style: {
            ...props
        }, children: jsxRuntime.jsx(Text.Text, { size: "inherit", variant: "inherit", weight: "inherit", truncation: 'ellipsis', id: id, children: text }) }));
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the value of the data-oj-item-index attribute for a given element.
 * @param element The HTML element.
 * @returns
 */
const getItemInfo = (element) => {
    const item = element.dataset['ojItem'];
    const section = element.dataset['ojSection'];
    if (item == null || section == null) {
        return;
    }
    return {
        itemIdx: Number(item),
        sectionIdx: Number(section)
    };
};
/**
 * Checks if the item is highlighted.
 * @param id Id of the item
 * @param highlighted The set of highlighted item
 */
function isItemHighlighted(id, highlighted) {
    if (!highlighted) {
        return;
    }
    if (highlighted.length === 0) {
        return true;
    }
    return new Set(highlighted).has(id);
}
/**
 * Checks if the item is hidden.
 * @param id Id of the item.
 * @param hiddenIds The set of hidden items.
 * @returns
 */
function isItemHidden(id, hiddenIds) {
    if (!hiddenIds) {
        return;
    }
    return new Set(hiddenIds).has(id);
}
/**
 * Checks if the item is the currentItem and if the focus ring
 * is visible.
 * @param itemInfo ItemInfo
 * @param itemIdx Item index
 * @param sectionIdx Section index
 */
const hasFocusRing = (itemInfo, itemIdx, sectionIdx) => {
    if (!itemInfo.isFocusVisible)
        return false;
    const { itemIdx: item, sectionIdx: section } = itemInfo;
    if (sectionIdx == null) {
        return item === itemIdx;
    }
    return item === itemIdx && section === sectionIdx;
};
/**
 * Returns the text for the legend datatip.
 * @param items The legend items data.
 * @param itemInfoRef The item currently hovered.
 * @param currentItem The item that is currently keyboard focused.
 */
function getDatatipText(items, getItem, focusedItem, hoveredItem) {
    const isPointerActive = hoveredItem?.isCurrent;
    if (isPointerActive && hoveredItem.itemIdx != null) {
        return getItem(hoveredItem, items)?.datatip;
    }
    if (focusedItem && focusedItem.isCurrent) {
        return getItem(focusedItem, items)?.datatip;
    }
    return;
}
/**
 * Returns the aria properties for the legend.
 * @param isReadOnly { boolean } If the legend is readonly.
 * @param ariaLabel { string } The aria-label set by the app.
 * @returns The aria props.
 */
function getAriaProps(isReadOnly, ariaLabel, hiddenIds, ariaDescribedBy, ariaLabelledBy) {
    const hideAndShow = hiddenIds && !isReadOnly;
    return {
        'aria-label': ariaLabel,
        'aria-disabled': isReadOnly,
        role: hideAndShow ? 'menu' : 'application',
        'aria-describedby': ariaDescribedBy,
        'aria-labelledby': ariaLabelledBy
    };
}
/**
 * Returns the item props for BaseLegendItem.
 * @param item The legend item.
 * @param itemIdx The item index of the item.
 * @param sectionIdx The section index of section of the item.
 * @param focusedItem The info of currently focused item.
 * @param isReadOnly Whether the legend is readonly.
 * @param hoveredItem The info of the currently hovered item.
 * @param hiddenIds The hidden ids.
 * @param highlightedIds The highlighted ids.
 */
function getItemProps(item, itemIdx, sectionIdx, focusedItem, isReadOnly, hoveredItem, hiddenIds, highlightedIds) {
    let isCurrent = false;
    if (!isReadOnly) {
        const isFocusedItem = itemIdx === focusedItem.itemIdx && sectionIdx === focusedItem.sectionIdx;
        const isHoveredItem = itemIdx === hoveredItem?.itemIdx && sectionIdx === hoveredItem?.sectionIdx;
        isCurrent = !!((isFocusedItem && focusedItem.isCurrent) ||
            (isHoveredItem && hoveredItem?.isCurrent));
    }
    return {
        isCurrent,
        isHighlighted: isItemHighlighted(item.id, highlightedIds),
        isHidden: isItemHidden(item.id, hiddenIds),
        isFocused: hasFocusRing(focusedItem, itemIdx, sectionIdx),
        key: item.id,
        ...item
    };
}
/**
 * Compares if two ItemInfo are equal
 * @param item1
 * @param item2
 * @returns
 */
const isEqualItem = (item1, item2) => {
    return item1?.itemIdx === item2?.itemIdx && item1?.sectionIdx === item2?.sectionIdx;
};
/**
 * Returns the num of cols and rows for the legend.
 */
const getGridNums = (numItems, layoutInfo) => {
    let itemsPerRow;
    let itemsPerCol;
    if (layoutInfo?.isWrapped) {
        itemsPerRow = layoutInfo.itemsPerRow;
        itemsPerCol = Math.ceil(numItems / itemsPerRow);
        itemsPerRow = Math.ceil(numItems / itemsPerCol);
    }
    return { itemsPerRow, itemsPerCol };
};
/**
 * Returns the grid row and column for given item.
 * @param noOfItems The number of items in the section.
 * @param index The index of the item.
 * @param itemsPerRow The num of items per row in the grid.
 * @param itemsPerCol The num of items per col in the grid.
 * @returns
 */
function getGridCellIndices(noOfItems, index, itemsPerRow, itemsPerCol) {
    let gridRow;
    let gridCol;
    if (itemsPerRow && itemsPerCol && noOfItems > itemsPerRow) {
        gridRow = (index % itemsPerCol) + 1;
        gridCol = Math.floor(index / itemsPerCol) + 1;
    }
    return { gridRow, gridCol };
}
/**
 * Returns the resolved values for the legend vars.
 */
const legendVars = [
    {
        tokenVar: utils.xUnits(1),
        key: 'unit',
        cssProp: 'padding'
    },
    {
        tokenVar: Common_themes_themeContract_css.dvtVars.label.sm.fontSize,
        key: 'fontSize',
        cssProp: 'font-size'
    }
];
/**
 * Returns the resolved values for the legend vars.
 */
function getLegendTextStyle(props, resolvedVars) {
    return {
        fontStyle: props.fontStyle,
        fontSize: (resolvedVars['fontSize'] ?? props.fontSize),
        fontWeight: props.fontWeight,
        fontFamily: props.fontFamily
    };
}
/**
 * Returns the style for current legend item.
 */
function getLegendCurrentItemStyle(isCurrent, isHighlighted, hideAndShowBehavior, hoverBehavior, isHidden, actionable) {
    if (isCurrent) {
        if (isHighlighted == null && isHidden == null && actionable !== 'off')
            return UNSAFE_Legend_themes_LegendStyles_css.styles.legendItemIsCurrentWithCursor;
        else if (isHighlighted == null && hideAndShowBehavior === 'on' && actionable !== 'off')
            return UNSAFE_Legend_themes_LegendStyles_css.styles.legendItemIsCurrentWithCursor;
        else if (isHidden == null && hoverBehavior === 'dim' && actionable !== 'off')
            return UNSAFE_Legend_themes_LegendStyles_css.styles.legendItemIsCurrentWithoutCursor;
    }
    return '';
}
function getIsLegendItemActionable(legendData, isReadOnly, isSectional) {
    return (itemInfo) => {
        let item;
        if (isSectional && itemInfo.sectionIdx != null) {
            item = legendData[itemInfo.sectionIdx].items[itemInfo.itemIdx];
        }
        else {
            item = legendData[itemInfo.itemIdx];
        }
        return !isReadOnly && item?.actionable !== 'off';
    };
}
/*
 * Returns KeyUp handler for legend.
 * @param triggerOnAction
 * @param updatefocusedItemInfo
 * @param focusedItemInfo
 * @returns
 */
function getKeyUpHandler(triggerOnAction, updatefocusedItemInfo, focusedItemInfo, isHideShow) {
    return (event) => {
        const key = event.code;
        switch (key) {
            case 'Space': {
                if (isHideShow) {
                    triggerOnAction();
                    eventsUtils.cancelEvent(event);
                }
                break;
            }
            case 'Enter': {
                triggerOnAction();
                eventsUtils.cancelEvent(event);
                break;
            }
            case 'Home': {
                updatefocusedItemInfo({
                    itemIdx: 0,
                    sectionIdx: 0,
                    isFocusVisible: true,
                    isCurrent: true
                });
                eventsUtils.cancelEvent(event);
                break;
            }
            case 'End': {
                updatefocusedItemInfo({
                    itemIdx: -1,
                    sectionIdx: -1,
                    isCurrent: true,
                    isFocusVisible: true
                });
                eventsUtils.cancelEvent(event);
                break;
            }
            case 'Tab': {
                updatefocusedItemInfo({
                    ...focusedItemInfo,
                    isCurrent: true,
                    isFocusVisible: true
                });
                eventsUtils.cancelEvent(event);
                break;
            }
        }
    };
}

const BaseLegendItem = compat.forwardRef(({ id, text, sectionIdx, itemIdx, isHighlighted, symbolHeight, symbolWidth, isFocused, isCurrent, isHidden, actionable = 'inherit', hoverBehavior = 'none', hideAndShowBehavior = 'off', ...props }, ref) => {
    const textStyles = {
        fontFamily: props.textFontFamily,
        fontSize: props.textFontSize,
        color: props.textColor,
        fontStyle: props.textFontStyle,
        fontWeight: props.textFontWeight,
        textDecoration: props.textTextDecoration
    };
    const symbolProps = {
        lineStyle: props.lineStyle,
        lineWidth: props.lineWidth,
        markerShape: props.markerShape,
        markerColor: props.markerColor,
        source: props.source,
        borderColor: props.borderColor,
        lineColor: props.lineColor
    };
    const isNotDimmed = isHighlighted || isHighlighted == null;
    const { legendItemBaseStyle, legendItemOpacity, legendItemFocusRing } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    return (jsxRuntime.jsxs("div", { class: classNames.classNames([
            legendItemBaseStyle,
            getLegendCurrentItemStyle(isCurrent, isHighlighted, hideAndShowBehavior, hoverBehavior, isHidden, actionable),
            !isNotDimmed ? legendItemOpacity : '',
            isFocused ? legendItemFocusRing : '',
            props.class
        ]), style: {
            gridRow: props.gridRow,
            gridColumn: props.gridCol,
            minWidth: props.minWidth !== undefined ? `${props.minWidth}px` : undefined
        }, id: id, ref: ref, "data-oj-section": sectionIdx, "data-oj-item": itemIdx, role: isHidden != null ? 'menuitemcheckbox' : 'img', "aria-checked": isHidden != null ? !isHidden : undefined, "aria-label": props['aria-label'] || text, children: [jsxRuntime.jsx(LegendSymbol, { ...symbolProps, isHidden: isHidden, lineLength: symbolWidth, width: symbolWidth != null ? `${symbolWidth}px` : undefined, height: symbolHeight != null ? `${symbolHeight}px` : undefined }), jsxRuntime.jsx(LegendText, { ...textStyles, text: text, type: "label" })] }));
});

/**
 * The controlled legend reponsible only for rendering the legend items.
 */
const BaseLegend = ({ orientation = 'horizontal', highlightedIds, hiddenIds, focusedItemInfo, hoveredItemInfo, sectionIdx, activeId, isReadOnly, items, symbolHeight, symbolWidth, hideAndShowBehavior = 'off', hoverBehavior = 'none', ...props }) => {
    const isHoriz = orientation === 'horizontal';
    const columTemplates = isHoriz ? `repeat(${props.itemsPerRow}, ${props.itemWidth})` : undefined;
    const { baseLegendStyles, baseLegendHorizontal, baseLegendVertical, baseLegendVerticalItem, baseLegendPaddingBottom, baseLegendPaddingTop, baseLegendPaddingEnd } = UNSAFE_Legend_themes_LegendStyles_css.styles;
    return (jsxRuntime.jsx("div", { className: classNames.classNames([
            baseLegendStyles,
            isHoriz ? baseLegendHorizontal : baseLegendVertical
        ]), style: {
            gridTemplateColumns: columTemplates,
            // set maxWidth to 100% on second render for text truncation to work.
            maxWidth: '100%'
        }, children: items.map((item, index) => {
            const { markerColor, markerShape, source, borderColor, lineColor, isCurrent, isFocused, isHidden, isHighlighted, key, actionable, text, lineStyle, lineWidth } = getItemProps(item, index, sectionIdx, focusedItemInfo, isReadOnly, hoveredItemInfo, hiddenIds, highlightedIds);
            const isFocusedItem = focusedItemInfo.sectionIdx === sectionIdx && focusedItemInfo.itemIdx === index;
            const { gridRow, gridCol } = getGridCellIndices(items.length, index, props.itemsPerRow, props.itemsPerCol);
            const needsBottomSpace = gridRow != null && gridRow != props.itemsPerCol;
            const needsTopSpace = gridRow != null && gridRow != 1;
            return (jsxRuntime.jsx(BaseLegendItem, { ref: isFocusedItem ? props.focusedItemRef : undefined, text: text, itemIdx: index, sectionIdx: sectionIdx, symbolHeight: symbolHeight, symbolWidth: symbolWidth, markerColor: markerColor, markerShape: markerShape, lineStyle: lineStyle, lineWidth: lineWidth, source: source, borderColor: borderColor, "aria-label": item['aria-label'], lineColor: lineColor, isCurrent: isCurrent, isFocused: isFocused, isHidden: isHidden, isHighlighted: isHighlighted, gridRow: gridRow, gridCol: gridCol, minWidth: props.itemWidth, id: isCurrent ? activeId : '', textColor: props.textColor, textFontFamily: props.textFontFamily, textFontSize: props.textFontSize, textFontStyle: props.textFontStyle, textFontWeight: props.textFontWeight, textTextDecoration: props.textTextDecoration, class: classNames.classNames([
                    isHoriz ? '' : baseLegendVerticalItem,
                    needsTopSpace ? baseLegendPaddingTop : '',
                    needsBottomSpace ? baseLegendPaddingBottom : '',
                    baseLegendPaddingEnd
                ]), hideAndShowBehavior: hideAndShowBehavior, hoverBehavior: hoverBehavior, actionable: actionable }, key));
        }) }));
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Calculate the datatip offset for datatip when keyboard focus is active.
 * @param focusedItemRef The ref for currentItem node.
 * @param rootRef The ref for root of the legend.
 * @param currentItem The ItemInfo of the current keyboard focused item.
 * @returns
 */
const calculateOffset = (focusedItemRef, rootDimsRef, currentItem, isRtl) => {
    let crossAxis = 0;
    let mainAxisOffset = datatipUtils.DATATIP_OFFSET;
    if (focusedItemRef.current && currentItem.isCurrent && rootDimsRef.current) {
        const rootDim = rootDimsRef.current;
        const itemDim = focusedItemRef.current.getBoundingClientRect();
        crossAxis = itemDim.x + itemDim.width / 2 - (rootDim.x + rootDim.width / 2);
        crossAxis = isRtl ? -1 * crossAxis : crossAxis;
        mainAxisOffset += rootDim.y - itemDim.y;
        mainAxisOffset = Math.min(datatipUtils.DATATIP_OFFSET, Math.max(mainAxisOffset, itemDim.height - rootDim.height + datatipUtils.DATATIP_OFFSET));
    }
    return { crossAxis, mainAxis: mainAxisOffset };
};
const useLegendDatatip = ({ text, rootDimsRef, focusedItemRef, focusedItemInfo, touchResponse }) => {
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    const [offset, setOffset] = hooks.useState(calculateOffset(focusedItemRef, rootDimsRef, focusedItemInfo, isRtl));
    hooks.useLayoutEffect(() => {
        setOffset(calculateOffset(focusedItemRef, rootDimsRef, focusedItemInfo, isRtl));
    }, [focusedItemInfo, focusedItemRef, isRtl, rootDimsRef]);
    const anchor = focusedItemInfo?.isCurrent ? 'element' : 'pointer';
    return useDatatip.useDatatip({
        content: text,
        placement: 'top',
        anchor,
        offset,
        touchResponse
    });
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns maximum of the width among the items in a section of legend also return the width of the entire section.
 * @param items Legend items array
 * @param unitLength Base  element
 * @param getTextDimensions Text width measurement function
 * @param legendFontStylesObj Legend text font style properties object
 * @param symbolWidth Width of legend symbol
 * @returns
 */
const getMaxWidth = (items, unitLength, getTextDimensions, legendFontStylesObj, symbolWidth) => {
    let maxItemWidth = 0;
    let horizontalSectionWidth = 0;
    let itemSymbolWidth = 0;
    if (symbolWidth) {
        itemSymbolWidth = unitLength * 1.5 + symbolWidth;
    }
    else {
        //itemSymbolWidth = marginLeft + marginRight + width below expression is simplified
        itemSymbolWidth = 4 * unitLength;
    }
    items?.forEach((item) => {
        const legendItem = item;
        const { width } = getTextDimensions(legendItem.text, legendFontStylesObj);
        //itemTextWidth = paddingLeft + paddingRight + width
        const itemTextWidth = unitLength * 2.5 + width;
        //horizontalSectionWidth = total width of the section
        horizontalSectionWidth += itemSymbolWidth + itemTextWidth;
        maxItemWidth = Math.max(maxItemWidth, Math.ceil(itemSymbolWidth + itemTextWidth));
    });
    return { maxItemWidth, horizontalSectionWidth };
};
function useLegendLayout({ resolvedVars, sections, items, rootRef, rootDimsRef, orientation, legendFontStylesObj = {}, symbolWidth }) {
    const { textMeasureContent, getTextDimensions } = useTextDimensions.useTextDimensions();
    const orientationRef = hooks.useRef(orientation);
    const hasOrientationChanged = orientationRef.current !== orientation;
    const [needsRerender, setRerender] = hooks.useState(false);
    hooks.useLayoutEffect(() => {
        if (hasOrientationChanged) {
            //rerender the Legend
            orientationRef.current = orientation;
            setRerender(!needsRerender);
        }
    }, [hasOrientationChanged, needsRerender, orientation]);
    const layoutInfo = hooks.useMemo(() => {
        if (!rootRef.current ||
            !Object.keys(resolvedVars).length ||
            !getTextDimensions ||
            hasOrientationChanged ||
            orientation === 'vertical') {
            return;
        }
        const unitLength = parseFloat(resolvedVars['unit']);
        // recalculate rootDims everytime items change.
        rootDimsRef.current = rootRef?.current?.getBoundingClientRect();
        let maxWidth = 0;
        let isWrapped = false;
        if (sections) {
            sections.forEach((section) => {
                const { maxItemWidth, horizontalSectionWidth } = getMaxWidth(section.items, unitLength, getTextDimensions, legendFontStylesObj, symbolWidth);
                if (!isWrapped) {
                    isWrapped = horizontalSectionWidth > Math.ceil(rootDimsRef.current?.width);
                }
                maxWidth = Math.max(maxWidth, maxItemWidth);
            });
        }
        if (items) {
            const { maxItemWidth, horizontalSectionWidth } = getMaxWidth(items, unitLength, getTextDimensions, legendFontStylesObj, symbolWidth);
            maxWidth = maxItemWidth;
            isWrapped = horizontalSectionWidth > Math.ceil(rootDimsRef.current?.width);
        }
        const legendLayoutInfo = {
            maxItemWidth: Math.min(maxWidth, rootDimsRef.current?.width),
            itemsPerRow: Math.max(1, Math.floor(rootDimsRef.current?.width / maxWidth)),
            isWrapped
        };
        return legendLayoutInfo;
    }, [
        sections,
        items,
        rootDimsRef,
        rootRef,
        legendFontStylesObj,
        resolvedVars,
        symbolWidth,
        getTextDimensions,
        orientation,
        hasOrientationChanged
    ]);
    return {
        textMeasureContent,
        layoutInfo
    };
}

const useLegendContextMenu = ({ rootRef, contextMenuConfig, focusedItemInfo, items, sections, isReadOnly, onContextMenuDismissed }) => {
    const { contextMenuProps, contextMenuContent } = useContextMenu.useContextMenu({
        onContextMenuHandler: ({ gesture, target }) => {
            let elem, itemIdx, sectionIdx;
            if (gesture === 'keyboard') {
                itemIdx = focusedItemInfo.itemIdx;
                sectionIdx = focusedItemInfo.sectionIdx;
                if (items) {
                    elem = rootRef.current?.querySelector(`[data-oj-item="${itemIdx}"]`);
                }
                else if (sections) {
                    elem = rootRef.current?.querySelector(`[data-oj-item="${itemIdx}"][data-oj-section="${sectionIdx}"]`);
                }
            }
            else {
                //We search for the key using the target of the event
                itemIdx = getItemInfo(target)?.itemIdx;
                if (sections) {
                    sectionIdx = getItemInfo(target)?.sectionIdx;
                }
            }
            let data;
            if (items) {
                data = itemIdx !== undefined ? items[itemIdx] : null;
            }
            else if (sections) {
                data =
                    sectionIdx !== undefined && itemIdx !== undefined
                        ? sections[sectionIdx]?.items[itemIdx]
                        : null;
            }
            let context;
            if (data) {
                context = {
                    type: 'item',
                    data: data
                };
            }
            else {
                context = { type: 'background' };
            }
            return {
                context,
                elem
            };
        },
        contextMenuOptions: {
            isDisabled: !contextMenuConfig || isReadOnly //If there is no context menu renderer or if isReadOnly is true, we disable the hook
        },
        rootRef,
        contextMenuConfig,
        onContextMenuDismissed
    });
    return { contextMenuContent, contextMenuProps };
};

exports.BaseLegend = BaseLegend;
exports.LegendText = LegendText;
exports.getAriaProps = getAriaProps;
exports.getDatatipText = getDatatipText;
exports.getGridNums = getGridNums;
exports.getIsLegendItemActionable = getIsLegendItemActionable;
exports.getItemInfo = getItemInfo;
exports.getKeyUpHandler = getKeyUpHandler;
exports.getLegendTextStyle = getLegendTextStyle;
exports.isEqualItem = isEqualItem;
exports.legendVars = legendVars;
exports.useLegendContextMenu = useLegendContextMenu;
exports.useLegendDatatip = useLegendDatatip;
exports.useLegendLayout = useLegendLayout;
//# sourceMappingURL=useLegendContextMenu-a10bd2fc.js.map
