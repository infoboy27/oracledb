/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { T as TrackResizeContainer } from './TrackResizeContainer-8360f2c2.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { g as getContrastingTextColor } from './colorUtils-16eb823f.js';
import { i as intersects, a as getUnion } from './layoutUtils-2374ab3e.js';
import { c as cancelEvent } from './eventsUtils-d544e874.js';
import { g as generateAriaLabel } from './accUtils-dc32d20b.js';
import { styles, baseStyles, dimensionStyle } from './UNSAFE_TagCloud/themes/TagCloudStyles.css.js';
import { u as useVisEvent } from './useVisEvents-4cfe354c.js';
import { useState, useLayoutEffect, useRef, useMemo } from 'preact/hooks';
import { u as useUser } from './useUser-99920e02.js';
import { u as useDatatip } from './useDatatip-7c661980.js';
import { c as calculateOffset } from './util-c1d41418.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useTextDimensions } from './useTextDimensions-e48f2781.js';
import { u as useSelection } from './useSelection-c12f7802.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useContextMenu } from './useContextMenu-81db2534.js';
import './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import './logger-c92f309c.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import { u as useVisTouchResponse } from './useVisTouchResponse-e9ca4766.js';
import { m as merge } from './stringUtils-16f617bc.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the item based on item info in a tag cloud.
 * @param itemInfo
 * @param items
 * @returns
 */
function getItem(itemInfo, items) {
    const { idx } = itemInfo;
    return items[idx];
}
function getItemPadding(height) {
    return height != null ? 0.15 * height : 0;
}
/**
 * Returns the next item's info in a tag cloud.
 * @param itemInfo
 * @param items
 * @returns
 */
function getNextItemInfo(itemInfo, items) {
    let idx = itemInfo.idx;
    idx = Math.min(items.length - 1, idx + 1);
    return { idx, id: items[idx].id };
}
/**
 * Returns the previous item's info in a tag cloud.
 * @param itemInfo
 * @param items
 * @returns
 */
function getPrevItemInfo(itemInfo, items) {
    let idx = itemInfo.idx;
    idx = Math.max(0, idx - 1);
    return { idx, id: items[idx].id };
}
/**
 * Returns utils functions for navigation in a tag cloud.
 * @param items
 * @returns
 */
function getTagCloudNavUtils(items) {
    return {
        getItem: (itemInfo) => {
            return getItem(itemInfo, items);
        },
        getDetailFromInfo: (itemInfo) => {
            if (!itemInfo) {
                return { id: undefined, data: undefined };
            }
            const item = getItem(itemInfo, items);
            return { id: item.id, data: item };
        },
        getPrevItemInfo: (itemInfo) => {
            return getPrevItemInfo(itemInfo, items);
        },
        getNextItemInfo: (itemInfo) => {
            return getNextItemInfo(itemInfo, items);
        }
    };
}

const BOTTOM_PADDING = 20;
const DEFAULT_FONT_SIZE = 12;
/**
 * helper layout functions for font size calc
 * @param {number} minValue
 * @param {number} maxValue
 * @param {number} range
 * @return {number}
 */
const fontSizeCalc = (value, minValue, maxValue, range) => {
    return minValue === maxValue
        ? DEFAULT_FONT_SIZE
        : DEFAULT_FONT_SIZE +
            Math.ceil((((range - 1) * (value - minValue)) / (maxValue - minValue)) * DEFAULT_FONT_SIZE);
};
/**
 * returns initial font size arr of items for layout
 * @param {Array} items
 * @return {Array}
 */
function getInitialFontSize(items) {
    const fontSizeArr = [];
    let minValue = Number.MAX_VALUE;
    let maxValue = -Number.MAX_VALUE;
    // First iterate thru data items to find the min and max values
    for (let i = 0; i < items.length; i++) {
        minValue = Math.min(minValue, items[i].value);
        maxValue = Math.max(maxValue, items[i].value);
    }
    for (let i = 0; i < items.length; i++) {
        const x = fontSizeCalc(items[i].value, minValue, maxValue, 3);
        fontSizeArr.push({ ...items[i], fontSize: x });
    }
    return fontSizeArr;
}
/**
 * Calculates the line breaks for rectangular layout
 * @param {Array} arDims an array of Dimension objects for each tag
 * @param {number} width the available width
 * @return {Array} an array containing the starting tag index for each line in the layout
 * @private
 */
function calculateLineBreaks(arDims, width) {
    const hPadding = 2;
    const lines = [0];
    let curWidth = arDims[0].w + hPadding;
    if (arDims.length > 1) {
        for (let i = 1; i < arDims.length; i++) {
            if (curWidth + arDims[i].w > width) {
                lines.push(i);
                curWidth = 0;
            }
            curWidth += arDims[i].w + hPadding;
        }
    }
    return lines;
}
/**
 * Returns the items position and font size in cloud layout.
 * @param items
 * @param tagcloudH
 * @param tagcloudW
 */
function getCloudLayout(items, tagcloudW, tagcloudH, isRTL, getTextDimensions) {
    const positions = [];
    const steps = 180;
    let xrStep = 10 / steps;
    let yrStep = 10 / steps;
    if (tagcloudW > tagcloudH)
        xrStep *= tagcloudW / tagcloudH;
    else
        yrStep *= tagcloudH / tagcloudW;
    const thetaStep = (2 * Math.PI) / steps;
    let bounds = null;
    let maxFontSize = 0;
    const cosCache = [];
    const sinCache = [];
    const tagWordData = [];
    const tagCloudX = 0; // availSpace.x
    const tagCloudY = 0; // availSpace.y
    const initialFontItems = getInitialFontSize(items);
    for (let i = 0; i < initialFontItems.length; i++) {
        let placed = false;
        let step = 0;
        let stepIncrement = 4;
        const tag = initialFontItems[i];
        const tagDimensions = getTextDimensions(tag.label, {
            fontSize: tag.fontSize + 'px'
        });
        maxFontSize = Math.max(maxFontSize, tag.fontSize);
        let lastCollisionIndex = -1;
        while (!placed) {
            // cache sin/cos values because Chrome is slow at these calculations
            const lookup = step % steps;
            if (cosCache[lookup] === undefined)
                cosCache[lookup] = Math.cos(step * thetaStep);
            if (sinCache[lookup] === undefined)
                sinCache[lookup] = Math.sin(step * thetaStep);
            const _x = xrStep * step * cosCache[lookup];
            const _y = yrStep * step * sinCache[lookup];
            const padding = getItemPadding(tagDimensions.height);
            const tagCloudDiv = {
                x: _x,
                y: _y,
                w: tagDimensions.width + 2 * padding,
                h: tagDimensions.height + 2 * padding
            }; // this needs to change
            placed = true;
            if (lastCollisionIndex !== -1) {
                if (intersects(positions[lastCollisionIndex], tagCloudDiv)) {
                    placed = false;
                }
            }
            if (placed) {
                for (let j = 0; j < i; j++) {
                    if (intersects(positions[j], tagCloudDiv)) {
                        lastCollisionIndex = j;
                        placed = false;
                        break;
                    }
                }
            }
            if (placed) {
                if (!bounds) {
                    bounds = tagCloudDiv;
                }
                else {
                    bounds = getUnion(bounds, tagCloudDiv);
                }
                lastCollisionIndex = -1;
                positions[i] = tagCloudDiv;
                tag.x = _x; // tag.setX(x)
                tag.y = _y; // tag.setY(-tagCloudDiv.y + y);
                tag.w = tagDimensions.width;
                tag.h = tagDimensions.height;
            }
            // Adjust stepIncrement so we check smaller degrees as spiral loops out
            if (step == 3600) {
                // 20 loops
                stepIncrement = 3;
            }
            else if (step == 5400) {
                // 30 loops
                stepIncrement = 2;
            }
            else if (step == 10800) {
                // 60 loops
                stepIncrement = 1;
            }
            step += stepIncrement;
        }
    }
    if (bounds) {
        const scale = Math.max(bounds.w / tagcloudW, bounds.h / tagcloudH);
        const cx = bounds.x + bounds.w / 2;
        const cy = bounds.y + bounds.h / 2;
        for (let k = 0; k < initialFontItems.length; k++) {
            let tagItemX;
            const tagItem = initialFontItems[k];
            if (!isRTL) {
                tagItemX =
                    tagItem.x != null ? tagCloudX + tagItem.x / scale + (tagcloudW / 2 - cx / scale) : 0;
            }
            else {
                tagItemX =
                    tagItem.x != null ? tagCloudX - tagItem.x / scale - (tagcloudW / 2 - cx / scale) : 0;
            }
            const tagItemY = tagItem.y != null ? tagCloudY + tagItem.y / scale + (tagcloudH / 2 - cy / scale) : 0;
            const tagItemW = tagItem.w != null ? tagItem.w / scale : 0;
            const tagItemH = tagItem.h != null ? tagItem.h / scale : 0;
            const fontSize = tagItem.fontSize;
            const tagItemFontSize = fontSize / scale;
            tagWordData.push({
                ...tagItem,
                x: tagItemX,
                y: tagItemY,
                fontSize: tagItemFontSize,
                w: tagItemW,
                h: tagItemH
            });
        }
    }
    return tagWordData;
}
/**
 * Returns the items position and font size in rectangle layout.
 * @param items
 * @param tagcloudH
 * @param tagcloudW
 * @param isRTL
 * @param getTextDimensions
 */
function getRectangleLayout(items, tagcloudW, tagcloudH, isRTL, getTextDimensions) {
    const tagWordData = [];
    const arDims = [];
    let maxWidth = 0;
    let maxHeight = 0;
    let maxFontSize = 0;
    const vPadding = 2;
    const margin = 0;
    const tagCloudX = 0; // availSpace.x
    const tagCloudY = 0; // availSpace.y
    // initial items processing
    const initialFontItems = getInitialFontSize(items);
    // Get the unscaled dimensions
    for (let i = 0; i < initialFontItems.length; i++) {
        const tag = initialFontItems[i];
        const tagDimensions = getTextDimensions(tag.label, {
            fontSize: tag.fontSize + 'px'
        });
        maxWidth = Math.max(maxWidth, tagDimensions.width);
        maxHeight = Math.max(maxHeight, tagDimensions.height);
        maxFontSize = Math.max(maxFontSize, tag.fontSize);
        arDims.push({
            w: tagDimensions.width,
            h: tagDimensions.height,
            x: tagDimensions.x,
            y: tagDimensions.y
        });
    }
    // Iteratively calculate the ideal font scale
    let minScale = 0;
    let maxScale = (tagcloudW - 2 * margin) / maxWidth; // This is the max scale that can be applied before the longest word will no longer fit
    let scale;
    let arLines;
    while (maxScale - minScale > 0.001) {
        scale = (minScale + maxScale) / 2;
        arLines = calculateLineBreaks(arDims, (tagcloudW - 2 * margin) / scale);
        const h = arLines.length * (scale * maxHeight + vPadding) - vPadding;
        if (h > tagcloudH - 2 * margin) {
            maxScale = scale;
        }
        else {
            minScale = scale;
        }
    }
    // Calculate final line breaks
    scale = minScale;
    arLines = calculateLineBreaks(arDims, (tagcloudW - 2 * margin) / scale);
    arLines.push(initialFontItems.length);
    for (let k = 0; k < arLines.length - 1; k++) {
        const lineStart = arLines[k];
        const lineEnd = arLines[k + 1];
        let hPadding = 5;
        let maxLineHeight = 0;
        let justified = true;
        if (lineEnd - lineStart > 1) {
            let lineWidth = 0;
            for (let j = lineStart; j < lineEnd; j++) {
                lineWidth += arDims[j].w * scale;
                maxLineHeight = Math.max(maxLineHeight, arDims[j].h * scale);
            }
            hPadding = (tagcloudW - 2 * margin - lineWidth) / (lineEnd - lineStart - 1);
            if (k == arLines.length - 2) {
                // Don't justify the last line unless flowing it with a gap of .5 * maxLineHeight fills more than
                // 90% of the width
                const flowPadding = 0.5 * maxLineHeight;
                if (flowPadding < hPadding &&
                    lineWidth + (lineEnd - lineStart) * flowPadding < 0.9 * (tagcloudW - 2 * margin)) {
                    hPadding = flowPadding;
                    justified = false;
                }
            }
        }
        const bottomY = margin + (k + 1) * (maxHeight * scale + vPadding) - vPadding;
        let curX = margin;
        for (let m = lineStart; m < lineEnd; m++) {
            const tagLine = initialFontItems[m];
            const fontSize = tagLine.fontSize;
            const tagItemFontSize = fontSize * scale;
            tagLine.fontSize = tagItemFontSize;
            const tagDimensionsWidth = arDims[m].w * scale;
            tagLine.y = tagCloudY + bottomY + arDims[m].y * scale - BOTTOM_PADDING;
            if (justified && m === lineEnd - 1 && m !== lineStart) {
                if (!isRTL)
                    tagLine.x = tagCloudX + tagcloudW - tagDimensionsWidth - margin;
                else
                    tagLine.x = tagCloudX + tagDimensionsWidth + margin - tagcloudW;
                // alignRight(tagLine);
            }
            else {
                // alignLeft(tagLine);
                tagLine.x = tagCloudX + curX;
                if (!isRTL) {
                    curX += arDims[m].w * scale + hPadding;
                }
                else {
                    // tagLine.alignRight();
                    curX -= arDims[m].w * scale + hPadding;
                }
            }
            tagWordData.push({ ...tagLine, w: tagDimensionsWidth, h: arDims[m].h * scale });
        }
    }
    return tagWordData;
}
/**
 * Calls the right layout algorithm based on tagcloud type.
 * @param layout cloud or rectangle. cloud if not defined.
 * @param items
 * @param tagcloudW tagcloud width
 * @param tagcloudH tagcloud height
 * @param isRTL
 * @param getTextDimensions
 */
function getLayout(layout, items, tagcloudW, tagcloudH, isRTL, getTextDimensions) {
    let layoutTagCloud;
    if (layout === 'cloud' || !layout) {
        layoutTagCloud = getCloudLayout(items, tagcloudW, tagcloudH, isRTL, getTextDimensions);
    }
    else {
        layoutTagCloud = getRectangleLayout(items, tagcloudW, tagcloudH, isRTL, getTextDimensions);
    }
    return layoutTagCloud;
}
/**
 * Checks if the item is highlighted.
 * @param id Id of the item
 * @param highlighted The set of highlighted item
 */
function isItemHighlighted(id, highlightedIds) {
    if (!highlightedIds) {
        return;
    }
    if (highlightedIds.length === 0) {
        return true;
    }
    return new Set(highlightedIds).has(id);
}
/**
 * Checks if the item is highlighted.
 * @param id Id of the item
 * @param selectedIds The set of highlighted item
 */
function isItemSelected(id, selectedIds) {
    if (!selectedIds || selectedIds.length === 0) {
        return false;
    }
    return new Set(selectedIds).has(id);
}
/**
 * Returns the aria properties for the tag cloud.
 * @param isReadOnly { boolean } If the tag cloud is readonly.
 * @param accessibleLabel { string } The aria-label set by the app.
 * @returns The aria props.
 */
function getAriaProps(translations, hasData, accessibleLabel, ariaDescribedBy, ariaLabelledBy) {
    return {
        'aria-label': `${accessibleLabel || ''} ${hasData ? '' : translations.vis_noData()}`,
        role: 'application',
        'aria-describedby': ariaDescribedBy,
        'aria-labelledby': ariaLabelledBy
    };
}
/**
 * Returns the aria properties for the tag cloud.
 * @param isReadOnly { boolean } If the tag cloud is readonly.
 * @param accessibleLabel { string } The aria-label set by the app.
 * @returns The aria props.
 */
function getItemAriaProps(supportsSelection, translations, isSelected, accessibleLabel, role) {
    return {
        'aria-label': generateAriaLabel(translations, accessibleLabel, {
            isSelected: !supportsSelection ? undefined : isSelected
        }) || undefined,
        role: role || 'img'
    };
}
/**
 * Returns the item props for BaseTagCloudItem.
 * @param item The tagcloud item.
 * @param itemIdx The item index of the item.
 * @param supportsSelection Whether the tagcloud supports selection
 * @param isReadOnly Whether the tagcloud is readonly.
 * @param hoveredItem The info of the currently hovered item.
 * @param selectedIds The selected ids.
 * @param focusedItem The info of currently focused item.
 * @param highlightedIds The highlighted ids.
 * @param activeId The active Id
 */
function getItemProps(item, itemIdx, supportsSelection, isReadOnly, hoveredItem, selectedIds, focusedItem, highlightedIds, activeId) {
    let isCurrent = false;
    let style;
    if (!isReadOnly) {
        const isFocusedItem = itemIdx === focusedItem?.idx;
        const isHoveredItem = itemIdx === hoveredItem?.idx;
        isCurrent = !!((isFocusedItem && focusedItem?.isCurrent) ||
            (isHoveredItem && hoveredItem?.isCurrent));
    }
    const isHighlighted = isItemHighlighted(item.id, highlightedIds);
    const isSelected = isItemSelected(item.id, selectedIds);
    if (item.color) {
        let color, backgroundColor, backgroundImage;
        if (isSelected) {
            backgroundColor = item.color;
            color = getContrastingTextColor(backgroundColor);
        }
        // hovered and selection supported
        else
            color = item.color;
        style = {
            color,
            backgroundColor,
            backgroundImage
        };
    }
    else if (!supportsSelection) {
        style = {
            backgroundColor: 'none'
        };
    }
    return {
        isCurrent,
        isHighlighted: isHighlighted,
        isSelected: isSelected,
        isFocused: focusedItem ? hasFocusRing(focusedItem, itemIdx) : false,
        key: item.id,
        itemIdx,
        style,
        activeId: isCurrent ? activeId : undefined,
        isReadOnly,
        ...item
    };
}
/**
 * Returns the text for the tag cloud datatip.
 * @param items The tag cloud items data.
 * @param focusedItem The item currently keyboard focused.
 * @param hoveredItem The item that is currently hovered.
 * @param datatip The datatip.
 */
function getDatatipContent(items, getItem, focusedItem, hoveredItem, datatip) {
    const activeItem = focusedItem.isCurrent
        ? focusedItem
        : hoveredItem?.isCurrent && hoveredItem.idx != null
            ? hoveredItem
            : undefined;
    if (!activeItem) {
        return {
            content: undefined,
            borderColor: undefined
        };
    }
    const item = getItem(activeItem, items);
    if (datatip && item) {
        return datatip({ data: item });
    }
    return {
        content: item?.accessibleLabel,
        borderColor: undefined
    };
}
/**
 * Returns the value of the data-oj-item-index attribute for a given element.
 * @param element The HTML element.
 */
function getItemInfo(element) {
    const itemIdx = element.dataset['idx'];
    if (itemIdx == null)
        return;
    return {
        idx: Number(itemIdx)
    };
}
/**
 * Compares if two ItemInfo are equal
 * @param item1
 * @param item2
 * @returns
 */
function isEqualItem(item1, item2) {
    return item1?.idx === item2?.idx;
}
/**
 * Checks if the item is the currentItem and if the focus ring
 * is visible.
 * @param itemInfo ItemInfo
 * @param itemId Item index
 */
function hasFocusRing(itemInfo, itemIdx) {
    if (!itemInfo.isFocusVisible)
        return false;
    const { idx: idx } = itemInfo;
    return idx === itemIdx;
}
/**
 * Returns KeyUp handler for Tagcloud.
 * @param triggerOnAction
 * @param updatefocusedItemInfo
 * @param focusedItemInfo
 * @returns
 */
function getKeyUpHandler(triggerOnAction, updatefocusedItemInfo, focusedItemInfo) {
    return (event) => {
        const key = event.code;
        switch (key) {
            case 'Space': {
                triggerOnAction();
                cancelEvent(event);
                break;
            }
            case 'Enter': {
                triggerOnAction();
                cancelEvent(event);
                break;
            }
            case 'Tab': {
                updatefocusedItemInfo({
                    ...focusedItemInfo,
                    isCurrent: true,
                    isFocusVisible: true
                });
                cancelEvent(event);
                break;
            }
        }
    };
}

const TagCloudItem = (props) => {
    const { itemBase, itemStyle, hoverUnselectedItemStyle, selectedItemStyle, hoveredSelectedItemStyle, dimmedItemStyle, interactiveCursorStyle } = styles;
    const isNotDimmed = props.isHighlighted || props.isHighlighted == null; // null means no highlighting feature
    const itemClasses = classNames([
        itemBase,
        props.isSelected ? selectedItemStyle : itemStyle,
        props.isCurrent
            ? props.isSelected
                ? hoveredSelectedItemStyle
                : props.isFocused || props.supportsSelection
                    ? hoverUnselectedItemStyle
                    : ''
            : '',
        isNotDimmed ? '' : dimmedItemStyle,
        props.supportsAction || props.supportsSelection ? interactiveCursorStyle : ''
    ]);
    const itemAriaProps = getItemAriaProps(!!props.supportsSelection, props.translations, props.isSelected, props.accessibleLabel, props.role);
    const padding = getItemPadding(props.h);
    return (jsx("div", { class: itemClasses, "data-id": `${props.id}`, "data-idx": props.itemIdx, style: {
            ...props.style,
            transform: `translate(${(props.x || 0) - padding}px,${(props.y || 0) - padding}px)`,
            fontSize: props.fontSize,
            padding: `${padding}px`,
            lineHeight: props.fontSize + 'px'
        }, id: props.activeId, ...itemAriaProps, children: props.label }));
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
 * @param rootRef The ref for root of the tag cloud.
 * @param currentItem The ItemInfo of the current keyboard focused item.
 * @param isRtl The direction.
 * @param focusedItemRef The ref for currentItem node.
 * @returns
 */
const calculateTagcloudOffset = (rootRef, currentItem, isRtl, focusedItemRef) => {
    if (focusedItemRef?.current &&
        currentItem.isCurrent &&
        rootRef.current &&
        focusedItemRef?.current.x != null &&
        focusedItemRef?.current.w != null &&
        focusedItemRef?.current.y != null &&
        focusedItemRef?.current.h != null) {
        const bounds = {
            x: focusedItemRef.current.x,
            y: focusedItemRef.current.y,
            width: focusedItemRef.current.w,
            height: focusedItemRef.current.h
        };
        const rootDims = rootRef.current.getBoundingClientRect();
        return calculateOffset(isRtl, rootDims.width, bounds);
    }
    // fallback to default
    return calculateOffset(isRtl, 0, undefined);
};
/**
 * Returns the datatip.
 * @param text The text string for the tag cloud item.
 * @param rootRef The ref for root of the tag cloud.
 * @param focusedItemRef The ref for focused item node.
 * @param focusedItemInfo The ItemInfo for focused item node.
 * @returns
 */
const useTagCloudDatatip = ({ touchResponse, datatip, rootRef, focusedItemRef, focusedItemInfo }) => {
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const [offset, setOffset] = useState(calculateTagcloudOffset(rootRef, focusedItemInfo, isRtl, focusedItemRef));
    useLayoutEffect(() => {
        setOffset(calculateTagcloudOffset(rootRef, focusedItemInfo, isRtl, focusedItemRef));
    }, [focusedItemInfo, focusedItemRef, isRtl, rootRef]);
    const anchor = focusedItemInfo?.isCurrent ? 'element' : 'pointer';
    const placement = 'top-start';
    const { datatipContent, datatipProps } = useDatatip({
        content: datatip?.content,
        borderColor: datatip?.borderColor,
        anchor,
        placement,
        offset: offset,
        touchResponse
    });
    return { datatipContent, datatipProps };
};

const useTagCloudContextMenu = ({ getItemInfo, focusedItemInfo, rootRef, contextMenuConfig, items, onContextMenuDismissed }) => {
    const { contextMenuProps, contextMenuContent } = useContextMenu({
        onContextMenuHandler: ({ gesture, target }) => {
            let idx;
            let elem;
            if (gesture === 'keyboard') {
                idx = focusedItemInfo.idx;
                elem = rootRef.current?.querySelector(`[data-idx="${idx}"]`);
            }
            else {
                //We search for the key using the target of the event
                idx = getItemInfo(target)?.idx;
            }
            const data = idx !== undefined ? items[idx] : null;
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
            isDisabled: !contextMenuConfig //If there is no context menu renderer we disable the hook
        },
        rootRef,
        contextMenuConfig,
        onContextMenuDismissed
    });
    return { contextMenuContent, contextMenuProps };
};

function TagCloudWithDimensions({ selectionMode = 'none', layout = 'cloud', width, height, items, onItemAction, onItemHover, onItemFocus, testId, contextMenuConfig, ...props }) {
    const testIdProps = useTestId(testId);
    const rootRef = useRef(null);
    const focusedItemRef = useRef(null);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const hasData = items && items.length !== 0;
    const supportsSelection = !!(selectionMode && selectionMode !== 'none');
    const supportsAction = onItemAction != null;
    const isReadOnly = supportsAction && onItemHover === null && onItemFocus === null;
    const idToDataMap = new Map(items.map((obj) => [obj.id, obj]));
    const { getItem, getDetailFromInfo, getPrevItemInfo, getNextItemInfo } = getTagCloudNavUtils(items);
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({
        type: 'auto',
        supportsTouchDragGestures: false,
        rootRef
    });
    const { focusedItemInfo, hoveredItemInfo, onContextMenuDismissed, activeId, eventsProps } = useVisEvent(touchResponse, !isReadOnly && hasData, () => !isReadOnly, getKeyUpHandler, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, onItemAction, onItemHover, onItemFocus, isEqualItem, getItemInfo, { idx: 0 });
    const content = getDatatipContent(items, getItem, focusedItemInfo, hoveredItemInfo, props.datatip);
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useTagCloudDatatip({
        touchResponse,
        datatip: content,
        rootRef,
        focusedItemInfo,
        focusedItemRef
    });
    const ariaProps = getAriaProps(translations, hasData, props.accessibleLabel, merge([props['aria-describedby'], datatipAriaDescribedby]), props['aria-labelledby']);
    const idExtracter = (event) => {
        // return focused item for keyboard event.
        // eventsProps should have already updated the focused item
        const info = event.type === 'keyup' ? focusedItemInfo : getItemInfo(event.target);
        return getDetailFromInfo(info).id;
    };
    const { selectionContent, selectionProps } = useSelection({
        idExtracter,
        selection: props.selectedIds,
        selectionMode: selectionMode,
        onChange: props.onSelectionChange,
        getDataById: (id) => idToDataMap.get(id)
    });
    const { direction } = useUser();
    const { textMeasureContent, getTextDimensions } = useTextDimensions();
    const layoutTags = useMemo(() => {
        return getTextDimensions && hasData
            ? getLayout(layout, items, width, height, direction === 'rtl', getTextDimensions)
            : [];
    }, [layout, items, hasData, width, height, direction, getTextDimensions]);
    const { contextMenuContent, contextMenuProps } = useTagCloudContextMenu({
        getItemInfo,
        focusedItemInfo,
        rootRef,
        contextMenuConfig,
        items,
        onContextMenuDismissed
    });
    const mergedProps = mergeProps(eventsProps, datatipProps, selectionProps, contextMenuProps);
    return (jsxs("div", { ref: rootRef, tabIndex: isReadOnly ? undefined : 0, style: { width, height, ...touchResponseStyle }, class: baseStyles, ...testIdProps, ...ariaProps, ...mergedProps, "aria-activedescendant": activeId, children: [layoutTags.map((item, itemIndex) => {
                const itemProps = getItemProps(item, itemIndex, supportsSelection, isReadOnly, hoveredItemInfo, props.selectedIds, focusedItemInfo, props.highlightedIds, activeId);
                const isFocusedItem = focusedItemInfo.idx === itemIndex;
                isFocusedItem ? (focusedItemRef.current = item) : null;
                return (jsx(TagCloudItem, { fontSize: item.fontSize, x: item.x, y: item.y, accessibleLabel: item.accessibleLabel, supportsSelection: supportsSelection, supportsAction: supportsAction, translations: translations, ...itemProps }));
            }), textMeasureContent, datatipContent, contextMenuContent, selectionContent] }));
}

/**
 * Tag clouds are used to display text data with the importance of each tag shown with font size and/or color.
 */
function TagCloud({ height, width, ...props }) {
    return (jsx(TrackResizeContainer, { width: width, height: height, class: dimensionStyle, children: (tagCloudWidth, tagCloudHeight) => (jsx(TagCloudWithDimensions, { width: tagCloudWidth, height: tagCloudHeight, ...props })) }));
}

export { TagCloud as T };
//# sourceMappingURL=TagCloud-78991c29.js.map
