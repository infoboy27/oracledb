/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { T as TrackResizeContainer } from './TrackResizeContainer-8360f2c2.js';
import { createContext } from 'preact';
import { useContext, useState, useRef, useCallback } from 'preact/hooks';
import { DEFAULT_SIZE, styles, baseStyles } from './UNSAFE_PictoChart/themes/PictoChartStyles.css.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useSelection } from './useSelection-c12f7802.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { colorSchemeVars } from './Common/themes/themeContract.css.js';
import { a as rgb, r as rgba } from './utils-6eab3a64.js';
import { S as SvgSymbol } from './SvgSymbol-bef4c0e7.js';
import { g as generateAriaLabel } from './accUtils-dc32d20b.js';
import { u as useUser } from './useUser-99920e02.js';
import { g as getRandomId } from './layoutUtils-2374ab3e.js';
import { c as cancelEvent } from './eventsUtils-d544e874.js';
import { u as useVisHover } from './useVisHover-d7a0b2f3.js';
import { u as useVisDrill } from './useVisDrill-4a6dcb23.js';
import { u as useDatatip } from './useDatatip-7c661980.js';
import { c as calculateOffset } from './util-c1d41418.js';
import { u as useItemFocus } from './useItemFocus-c12e2756.js';
import './LayerHost-45f545d7.js';
import 'preact/compat';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useVisTouchResponse } from './useVisTouchResponse-e9ca4766.js';
import { m as merge } from './stringUtils-16f617bc.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const PictoChartContext = createContext({});
const usePictoChartContext = () => useContext(PictoChartContext);

const GAP_RATIO = 0.25;
function _ceil(a, b) {
    return Math.ceil(a / b) * b;
}
function getFlowingInfo(items, isVert, width, height, isFlowingWidth, isFlowingHeight, colCount, rowCount, colWidth, rowHeight) {
    let numCells = 0;
    let maxColSpan = 1;
    let maxRowSpan = 1;
    let minSpan = Infinity;
    for (let i = 0; i < items.length; i++) {
        const item = items[i];
        const columnSpan = item.columnSpan || 1;
        const rowSpan = item.rowSpan || 1;
        if (columnSpan <= 0 || rowSpan <= 0)
            continue;
        // Compute the maximum columnSpan and rowSpan
        if (columnSpan > maxColSpan)
            maxColSpan = columnSpan;
        if (rowSpan > maxRowSpan)
            maxRowSpan = rowSpan;
        // Compute minimum span for gap computation
        if (columnSpan < minSpan)
            minSpan = columnSpan;
        if (rowSpan < minSpan)
            minSpan = rowSpan;
        numCells += columnSpan * rowSpan * (item.count || 1);
    }
    if (numCells === 0)
        return {};
    // Default colWidth and rowHeight for flowing layout
    if (isFlowingWidth || isFlowingHeight) {
        if (!colWidth)
            colWidth = rowHeight ? rowHeight : DEFAULT_SIZE;
        if (!rowHeight)
            rowHeight = colWidth;
    }
    // Default colCount and rowCount for both layouts
    // We set the default colCount (or rowCount) to be an integer multiple of the maxColSpan (or maxRowSpan) to
    // ensure that all the items can find a spot to occupy in the mixed sizes case.
    if (!colCount && !rowCount) {
        // Try to achieve square cells, (width / colCount) = (height / rowCount)
        if (!isFlowingWidth && !isFlowingHeight) {
            if (isVert)
                rowCount = _ceil(Math.sqrt((numCells * height) / width), maxRowSpan);
            else
                colCount = _ceil(Math.sqrt((numCells * width) / height), maxColSpan);
        }
        else if (!isFlowingWidth)
            colCount = Math.max(Math.floor(width / (colWidth || 1)), 1);
        else if (!isFlowingHeight)
            rowCount = Math.max(Math.floor(height / (rowHeight || 1)), 1);
        else {
            if (isVert)
                rowCount = _ceil(Math.sqrt(numCells), maxRowSpan);
            else
                colCount = _ceil(Math.sqrt(numCells), maxColSpan);
        }
    }
    // Now only either colCount or rowCount is undefined
    if (!colCount)
        colCount = _ceil(numCells / (rowCount || 1), maxColSpan);
    else if (!rowCount)
        rowCount = _ceil(numCells / colCount, maxRowSpan);
    const gridGap = GAP_RATIO * minSpan;
    // Default colWidth and rowHeight for fixed layout
    if (!isFlowingWidth && !isFlowingHeight) {
        if (!colWidth)
            colWidth = rowHeight ? rowHeight : Math.min(width / colCount, height / (rowCount || 1));
        if (!rowHeight)
            rowHeight = colWidth;
    }
    if (colCount <= 0 ||
        !rowCount ||
        rowCount <= 0 ||
        !colWidth ||
        colWidth <= 0 ||
        !rowHeight ||
        rowHeight <= 0)
        return {};
    return {
        calcColCount: colCount,
        calcRowCount: rowCount,
        calcColWidth: colWidth ? colWidth - gridGap : colWidth,
        calcRowHeight: rowHeight ? rowHeight - gridGap : rowHeight,
        gridGap: gridGap
    };
}
/**
 * Returns whether the pictoChart is layout from bottom to top.
 */
const isOriginBottom = (origin) => {
    return origin === 'bottomStart' || origin === 'bottomEnd';
};
/**
 * Returns whether the pictoChart is layout from right to left.
 */
const isOriginRight = (origin) => {
    const isEnd = origin === 'topEnd' || origin === 'bottomEnd';
    return isEnd;
};
/**
 * Returns whether the cells are available given col, row and columnSpan, rowSpan needed.
 */
const areCellsAvailable = (map, col, row, columnSpan, rowSpan) => {
    for (let r = 0; r < rowSpan; r++) {
        for (let c = 0; c < columnSpan; c++) {
            if (map[row + r][col + c])
                return false;
        }
    }
    return true;
};
/**
 * Occupies the cell in the map given col, row and columnSpan, rowSpan.
 */
const occupyCells = (map, col, row, columnSpan, rowSpan) => {
    for (let r = 0; r < rowSpan; r++) {
        for (let c = 0; c < columnSpan; c++) {
            map[row + r][col + c] = true;
        }
    }
};
/**
 * Returns whether the cells are available given col, row and the colCount and rowCount of the pictochart.
 */
const findNextAvailableCell = (map, columnSpan, rowSpan, colCount, rowCount, isVert) => {
    if (isVert) {
        // For vertical layout, switch row and col in the computation, and switch the result back
        const cell = findNextAvailableCell(map, rowSpan, columnSpan, rowCount, colCount, false);
        return cell ? { col: cell.row, row: cell.col } : undefined;
    }
    for (let r = 0; r < rowCount - rowSpan + 1; r++) {
        for (let c = 0; c < colCount - columnSpan + 1; c++) {
            if (areCellsAvailable(map, c, r, columnSpan, rowSpan)) {
                occupyCells(map, c, r, columnSpan, rowSpan);
                return { col: c, row: r };
            }
        }
    }
    return;
};
/**
 * Returns the picto items with row and col of the pictochart.
 */
function generateElementCoords(items, row, column, layoutOrigin, isVert) {
    const rowCount = row;
    const colCount = column;
    const isLayoutBottom = isOriginBottom(layoutOrigin);
    const isLayoutRight = isOriginRight(layoutOrigin);
    const pictoItems = [];
    const map = new Array(rowCount);
    for (let i = 0; i < rowCount; i++) {
        map[i] = new Array(colCount).fill(false);
    }
    for (let i = 0; i < items.length; i++) {
        const currItem = items[i];
        let count = 0;
        const rowSpan = currItem.rowSpan ?? 1;
        const columnSpan = currItem.columnSpan ?? 1;
        const totalCount = currItem.count ?? 1;
        while (count < totalCount) {
            const cell = findNextAvailableCell(map, columnSpan, rowSpan, colCount, rowCount, isVert);
            if (cell !== undefined) {
                pictoItems.push({
                    row: isLayoutBottom ? rowCount - cell.row - rowSpan : cell.row,
                    col: isLayoutRight ? colCount - cell.col - columnSpan : cell.col,
                    countIdx: count,
                    itemIdx: i,
                    item: currItem
                });
            }
            count += 1;
        }
    }
    return pictoItems;
}

/**
 * Checks if the item is highlighted.
 * @param id Id of the item
 * @param highlighted The set of highlighted item
 */
function isItemHighlighted(id, highlightedIds) {
    if (!highlightedIds || highlightedIds.length === 0) {
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
 * Returns the value of the data-oj-item-index attribute for a given element.
 * @param element The HTML element.
 */
function getItemInfo(element) {
    const itemIdx = element.dataset['idx'];
    if (itemIdx === undefined)
        return;
    return {
        idx: Number(itemIdx)
    };
}
/**
 * Returns the item props for PictoChart.
 * @param item The picto chart item.
 * @param itemIdx The item index of the item.
 * @param countIdx The item count of the item.
 * @param isReadOnly Whether the picto chart is readonly.
 * @param hoveredItem The info of the currently hovered item.
 * @param selectedIds The selected Ids
 * @param focusedItem The info of currently focused item.
 * @param highlightedIds The highlighted ids.
 * @param activeId The active Id
 */
function getItemProps(item, itemIdx, countIdx, isReadOnly, hoveredItem, selectedIds, focusedItem, highlightedIds, activeId) {
    let isCurrent = false;
    if (!isReadOnly) {
        const isFocusedItem = !!focusedItem && itemIdx === focusedItem.idx;
        const isHoveredItem = !!hoveredItem && itemIdx === hoveredItem.idx;
        isCurrent = !!((isFocusedItem && focusedItem?.isCurrent) ||
            (isHoveredItem && hoveredItem?.isCurrent));
    }
    const isHighlighted = isItemHighlighted(item.id, highlightedIds);
    const isSelected = isItemSelected(item.id, selectedIds);
    const hasSelection = selectedIds && selectedIds.length !== 0;
    return {
        isCurrent,
        isHighlighted: isHighlighted,
        isSelected: isSelected,
        hasSelection,
        isFocused: focusedItem ? hasFocusRing(focusedItem, itemIdx) : false,
        key: item.id,
        itemIdx,
        countIdx,
        activeId: isCurrent ? activeId : undefined,
        isReadOnly,
        item: item
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
 * @param itemIdx Item index
 */
function hasFocusRing(itemInfo, itemIdx) {
    if (!itemInfo.isFocusVisible)
        return false;
    return itemInfo.idx === itemIdx;
}
/**
 *
 */
function getCountWithTotal(itemCount, totalCount, translations) {
    const totalWithCountLabel = `${translations?.vis_labelCountWithTotal({
        itemCount: itemCount.toString(),
        totalCount: totalCount.toString()
    })}`;
    return totalWithCountLabel;
}
/**
 * Returns the aria properties for the picto chart.
 * @param isReadOnly { boolean } If the picto chart is readonly.
 * @param accessibleLabel { string } The aria-label set by the app.
 * @returns The aria props.
 */
function getItemAriaProps(itemCount, totalCount, supportsSelection, label, translations, isSelected, hasSelection, accessibleLabel, activeId) {
    const totalWithCountLabel = translations
        ? getCountWithTotal(itemCount, totalCount, translations)
        : '';
    accessibleLabel = accessibleLabel || `${label ? label + ': ' : ''}${totalWithCountLabel}`; // TODO: use a translation string for :
    return {
        'aria-label': generateAriaLabel(translations, accessibleLabel, {
            isSelected: !supportsSelection && !hasSelection ? undefined : isSelected
        }) || undefined,
        role: 'img',
        id: activeId
    };
}
/**
 * Returns the marker props for SVGSymbol
 */
function getMarkerProps(shape, color, isFocused, isSelected, isCurrent, supportsSelection) {
    const isHuman = shape === 'human';
    const applyHover = isFocused || (isCurrent && supportsSelection);
    const isNoneEqualSides = shape === 'ellipse' || shape === 'rectangle';
    color = color !== '' ? color : rgba(colorSchemeVars.palette.neutral['190'], 0.15);
    const outerBorderColor = isSelected ? colorSchemeVars.textIcon.primary : applyHover ? color : '';
    return {
        markerShape: shape,
        tx: isHuman ? 70 : undefined,
        ty: isHuman ? 60 : undefined,
        markerColor: color,
        borderColor: isSelected || applyHover ? rgb(colorSchemeVars.palette.neutral[0]) : color,
        outerBorderColor,
        markerScale: isNoneEqualSides && !outerBorderColor ? 1 : 0.85,
        setAspectRatioNone: isNoneEqualSides ? true : false
    };
}
// Creating component to read the context
const PictoRenderer = ({ context, markerProps }) => {
    const { supportsSelection } = usePictoChartContext();
    const markerProp = getMarkerProps(markerProps.shape, markerProps.color, context.state.focused, context.state.selected, context.state.hovered, supportsSelection);
    return jsx(SvgSymbol, { ...markerProp });
};
/**
 * Returns the marker renderer for SVGSymbol
 */
function getPictoDefaultRenderers(rendererOptions) {
    return {
        markerRenderer: (context) => {
            const props = rendererOptions(context.data); // TODO: should we add default values
            return jsx(PictoRenderer, { context: context, markerProps: props });
        },
        datatipRenderer: (context) => {
            const props = rendererOptions(context.data);
            return { borderColor: props.color };
        }
    };
}
function getTotalCount(items) {
    let totalCount = 0;
    for (let i = 0; i < items.length; i++) {
        totalCount += items[i].count || 1;
    }
    return totalCount;
}
/**
 * Returns the text for the picto chart datatip.
 * @param items The picto chart items data.
 * @param focusedItem The item currently keyboard focused.
 * @param hoveredItem The item that is currently hovered.
 * @param datatip The datatip.
 */
function getDatatipContent(items, getItem, totalCount, focusedItem, hoveredItem, datatip, translations) {
    let itemInfo;
    const isPointerActive = hoveredItem?.isCurrent;
    if (isPointerActive && items[hoveredItem.idx].id != null) {
        itemInfo = hoveredItem;
    }
    if (focusedItem && focusedItem.isCurrent) {
        itemInfo = focusedItem;
    }
    let _content, countWithTotal;
    let _borderColor = rgba(colorSchemeVars.palette.neutral['190'], 0.15);
    const item = itemInfo && getItem(itemInfo, items);
    if (item && datatip) {
        // custom datatip
        const datatipContext = item && { data: item };
        const { content, borderColor } = datatip(datatipContext);
        _content = content;
        _borderColor = borderColor || _borderColor;
        countWithTotal = translations
            ? getCountWithTotal(item.count || 1, totalCount, translations)
            : '';
    }
    return {
        borderColor: _borderColor,
        content: _content ||
            (itemInfo && getItem(itemInfo, items)?.accessibleLabel) ||
            (itemInfo && getItem(itemInfo, items)?.label + ': ' + countWithTotal) ||
            countWithTotal
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the item based on item info in a picto chart.
 * @param itemInfo
 * @param items
 * @returns
 */
function getItem(itemInfo, items) {
    const { idx } = itemInfo;
    return items[idx];
}
/**
 * Returns the next item's info in a picto chart.
 * @param itemInfo
 * @param items
 * @returns
 */
function getNextItemInfo(itemInfo, items) {
    let idx = itemInfo.idx;
    idx = Math.min(items.length - 1, idx + 1);
    return { idx: idx };
}
/**
 * Returns the previous item's info in a picto chart.
 * @param itemInfo
 * @returns
 */
function getPrevItemInfo(itemInfo) {
    let idx = itemInfo.idx;
    idx = Math.max(0, idx - 1);
    return { idx: idx };
}
/**
 * Returns utils functions for navigation in a picto chart.
 * @param items
 * @returns
 */
function getPictoChartNavUtils(items) {
    return {
        getItem: (itemInfo) => {
            return getItem(itemInfo, items);
        },
        getDetailFromInfo: (itemInfo) => {
            if (!itemInfo) {
                return { id: undefined, data: undefined };
            }
            const item = getItem(itemInfo, items);
            return { id: item ? item.id : undefined, data: item };
        },
        getPrevItemInfo: (itemInfo) => {
            return getPrevItemInfo(itemInfo);
        },
        getNextItemInfo: (itemInfo) => {
            return getNextItemInfo(itemInfo, items);
        }
    };
}

function useEvents(touchResponse, isInteractive, selectionMode, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, drilling, onItemDrill, onItemHover, onItemFocus) {
    const [focusedItemInfo, setfocusedItemInfo] = useState({ idx: 0 });
    const [hoveredItemInfo, sethoveredItemInfo] = useState();
    const activeId = useRef();
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const onHover = (event) => {
        const itemInfo = getItemInfo(event.target);
        if (!isEqualItem(itemInfo, hoveredItemInfo)) {
            sethoveredItemInfo(itemInfo && { ...itemInfo, isCurrent: true });
            activeId.current = getRandomId();
            if (isInteractive) {
                setfocusedItemInfo({ ...focusedItemInfo, isCurrent: false });
                onItemHover?.(getDetailFromInfo(itemInfo));
            }
        }
    };
    const onHoverLeave = () => {
        sethoveredItemInfo(undefined);
        activeId.current = undefined;
        if (isInteractive) {
            onItemHover?.(getDetailFromInfo());
        }
    };
    const hoverHandlers = useVisHover(onHover, undefined, onHoverLeave, touchResponse);
    const processDrill = useCallback((info) => {
        const { id, data } = getDetailFromInfo(info);
        if (id != null && data) {
            onItemDrill?.({ id, data });
            activeId.current = getRandomId();
        }
    }, [getDetailFromInfo, onItemDrill]);
    const onDrill = useCallback((event) => {
        if (event.type === 'keydown') {
            if (drilling == 'on')
                processDrill(focusedItemInfo);
        }
        else {
            processDrill(getItemInfo(event.target));
        }
    }, [drilling, focusedItemInfo, processDrill]);
    const drillProps = useVisDrill(selectionMode, onDrill);
    if (!isInteractive) {
        return {
            focusedItemInfo,
            hoveredItemInfo,
            // include relevant hover handlers for datatip
            eventsProps: hoverHandlers
        };
    }
    function updatefocusedItemInfo(itemInfo) {
        onItemFocus?.(getDetailFromInfo(itemInfo));
        activeId.current = getRandomId();
        setfocusedItemInfo(itemInfo);
    }
    function handleKeyboardInput(item) {
        if (!isEqualItem(item, focusedItemInfo)) {
            item.isCurrent = true;
            item.isFocusVisible = true;
            if (hoveredItemInfo) {
                sethoveredItemInfo({ ...hoveredItemInfo, isCurrent: false });
            }
            updatefocusedItemInfo(item);
        }
    }
    const onKeyDown = (event) => {
        const key = event.key;
        switch (key) {
            case 'Tab':
                return;
            case 'ArrowDown': {
                const nextItemInfo = getNextItemInfo(focusedItemInfo);
                handleKeyboardInput(nextItemInfo);
                cancelEvent(event);
                break;
            }
            case 'ArrowUp': {
                const nextItemInfo = getPrevItemInfo(focusedItemInfo);
                handleKeyboardInput(nextItemInfo);
                cancelEvent(event);
                break;
            }
            case 'ArrowRight': {
                const nextItemInfo = isRtl
                    ? getPrevItemInfo(focusedItemInfo)
                    : getNextItemInfo(focusedItemInfo);
                handleKeyboardInput(nextItemInfo);
                cancelEvent(event);
                break;
            }
            case 'ArrowLeft': {
                const nextItemInfo = isRtl
                    ? getNextItemInfo(focusedItemInfo)
                    : getPrevItemInfo(focusedItemInfo);
                handleKeyboardInput(nextItemInfo);
                cancelEvent(event);
                break;
            }
        }
    };
    const onKeyUp = (event) => {
        const key = event.code;
        switch (key) {
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
    const onBlur = () => {
        if (hoveredItemInfo != null || focusedItemInfo.isCurrent) {
            onItemFocus?.(getDetailFromInfo(undefined));
        }
        const itemInfo = { ...focusedItemInfo, isCurrent: false, isFocusVisible: false };
        setfocusedItemInfo(itemInfo);
    };
    return {
        focusedItemInfo,
        hoveredItemInfo,
        activeId: activeId.current,
        eventsProps: mergeProps(drillProps, hoverHandlers, {
            onKeyUp,
            onKeyDown,
            onBlur
        })
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the datatip.
 * @param content The text string for the picto chart item.
 * @param focusedItemRef The ref for focused item node.
 * @param focusedItemInfo The ItemInfo for focused item node.
 * @returns
 */
const usePictoChartDatatip = ({ touchResponse, content, borderColor, width, focusedItemRef, focusedItemInfo }) => {
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const itemDim = focusedItemRef.current?.getBoundingClientRect();
    const { datatipContent, datatipProps } = useDatatip({
        content,
        placement: 'top-start',
        offset: calculateOffset(isRtl, width, focusedItemInfo.isCurrent ? itemDim : undefined),
        borderColor,
        anchor: focusedItemInfo?.isCurrent ? 'element' : 'pointer',
        touchResponse
    });
    return { datatipContent: datatipContent, datatipProps: datatipProps };
};

const PictoChartElement = (props) => {
    const isInteractive = props.supportsSelection || props.supportsDrill;
    const { dimmedItemStyle, interactiveItemStyle } = styles;
    const itemClasses = classNames([
        isInteractive && interactiveItemStyle,
        !props.isHighlighted && dimmedItemStyle
    ]);
    const isFirstElement = props.countIdx === 0;
    const itemAriaProps = (isFirstElement &&
        getItemAriaProps(props.item.count || 1, props.totalCount, !!props.supportsSelection, props.item.label, props.translations, props.isSelected, props.hasSelection, props.item.accessibleLabel, props.activeId)) ||
        {};
    return (jsx("div", { ref: isFirstElement ? props.focusedItemRef : undefined, id: props.activeId, "data-idx": props.itemIdx, "data-count-idx": props.countIdx, style: {
            gridRow: `${props.row + 1} / span ${props.item.rowSpan || 1}`,
            gridColumn: `${props.column + 1} / span ${props.item.columnSpan || 1}`
        }, class: itemClasses, ...itemAriaProps, children: props.children }));
};

function PictoChartWithDimensions({ width, height, columnWidth, rowHeight, items, columnCount, rowCount, layout, layoutOrigin = 'topStart', selectionMode = 'none', highlightedIds = [], selectedIds = [], drilling = 'off', onItemDrill, onItemHover, isFlowingWidth, isFlowingHeight, onItemFocus, ...props }) {
    const hasData = items.length !== 0;
    const totalCount = getTotalCount(items);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const supportsSelection = !!(selectionMode && selectionMode !== 'none');
    const supportsDrill = onItemDrill != null;
    const isReadOnly = !supportsSelection && !supportsDrill && onItemHover === null && onItemFocus === null;
    const testIdProps = useTestId(props.testId);
    const idToDataMap = new Map(items.map((obj) => [obj.id, obj]));
    const { getItem, getDetailFromInfo, getPrevItemInfo, getNextItemInfo } = getPictoChartNavUtils(items);
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({ type: 'touchStart' });
    const { hoveredItemInfo, focusedItemInfo, activeId, eventsProps } = useEvents(touchResponse, !isReadOnly && hasData, selectionMode, getDetailFromInfo, getPrevItemInfo, getNextItemInfo, drilling, onItemDrill, onItemHover, onItemFocus);
    const idExtracter = (event) => {
        // return focused item for keyboard event.
        // eventsProps should have already updated the focused item
        const info = event.type === 'keyup' ? focusedItemInfo : getItemInfo(event.target);
        return getDetailFromInfo(info).id;
    };
    const { selectionContent, selectionProps } = useSelection({
        idExtracter,
        isDrillEnabled: drilling != 'off',
        selection: selectedIds,
        selectionMode: selectionMode,
        getDataById: (id) => idToDataMap.get(id),
        onChange: props.onSelectionChange
    });
    const rectangleWidth = columnWidth && parseFloat(columnWidth);
    const rectangleHeight = rowHeight && parseFloat(rowHeight);
    const pictoStyleClasses = classNames([baseStyles]);
    const { focusedItemRef } = useItemFocus(focusedItemInfo);
    const { content, borderColor } = getDatatipContent(items, getItem, totalCount, focusedItemInfo, hoveredItemInfo, props.datatip, translations);
    const { calcColCount, calcRowCount, calcColWidth, calcRowHeight, gridGap } = getFlowingInfo(items, layout === 'vertical', width, height, isFlowingWidth, isFlowingHeight, columnCount, rowCount, rectangleWidth, rectangleHeight);
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = usePictoChartDatatip({
        touchResponse,
        content,
        width,
        borderColor,
        focusedItemRef,
        focusedItemInfo
    });
    if (!calcColCount)
        // Nothing to render.
        return null;
    const elements = generateElementCoords(items, calcRowCount, calcColCount, layoutOrigin, layout === 'vertical');
    const mergedEventProps = mergeProps(eventsProps, datatipProps, selectionProps);
    return (jsxs("div", { tabIndex: 0, "aria-label": props['aria-label'], "aria-describedby": merge([props['aria-describedby'], datatipAriaDescribedby]), "aria-labelledby": props['aria-labelledby'], "aria-activedescendant": activeId, role: "application", style: {
            width: isFlowingWidth ? 'max-content' : `${width}px`,
            height: isFlowingHeight ? 'max-content' : `${height}px`,
            gridTemplateRows: `repeat(${calcRowCount}, ${calcRowHeight}px)`,
            gridTemplateColumns: `repeat(${calcColCount}, ${calcColWidth}px)`,
            gap: `${gridGap}px`,
            ...touchResponseStyle
        }, class: pictoStyleClasses, ...testIdProps, ...mergedEventProps, children: [elements.map((elt) => {
                const isFocusedItem = focusedItemInfo.idx === elt.itemIdx;
                const itemProps = getItemProps(elt.item, elt.itemIdx, elt.countIdx, isReadOnly, hoveredItemInfo, selectedIds, focusedItemInfo, highlightedIds, activeId);
                const context = {
                    data: elt.item,
                    state: {
                        selected: itemProps.isSelected,
                        focused: itemProps.isFocused,
                        hovered: itemProps.isCurrent
                    }
                };
                return (jsx(PictoChartElement, { focusedItemRef: isFocusedItem ? focusedItemRef : undefined, row: elt.row, column: elt.col, supportsSelection: supportsSelection, supportsDrill: supportsDrill, translations: translations, totalCount: totalCount, ...itemProps, children: props.children(context) }));
            }), datatipContent, selectionContent] }));
}

/**
 * A picto chart displays information using icons to visualize an absolute number or the relative sizes of the different parts of a population.
 */
function PictoChart({ width, height, ...props }) {
    //  TODO: investigate if we need to handle empty items for performance reasons.
    const supportsSelection = !!(props.selectionMode && props.selectionMode !== 'none');
    const isFlowingWidth = width === undefined;
    const isFlowingHeight = height === undefined;
    return (jsx(PictoChartContext.Provider, { value: { supportsSelection }, children: jsx(TrackResizeContainer, { width: isFlowingWidth ? 'initial' : width, height: isFlowingHeight ? 'initial' : height, children: (width, height) => (jsx(PictoChartWithDimensions, { width: width, height: height, isFlowingWidth: isFlowingWidth, isFlowingHeight: isFlowingHeight, ...props })) }) }));
}

export { PictoChart as P, getPictoDefaultRenderers as g };
//# sourceMappingURL=PictoChart-20c9a0c2.js.map
