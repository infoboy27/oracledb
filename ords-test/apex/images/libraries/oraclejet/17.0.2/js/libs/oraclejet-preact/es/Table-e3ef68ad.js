/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { useState, useEffect, useRef, useCallback, useMemo, useImperativeHandle, useLayoutEffect } from 'preact/hooks';
import { memo, forwardRef } from 'preact/compat';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useId } from './useId-03dbfdf0.js';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
import { u as useUser } from './useUser-99920e02.js';
import { L as LOADMORE_STYLE_CLASS, a as LoadMoreCollection } from './LoadMoreCollection-95a49d2a.js';
import { tableSkeletonCellStyles, tableSkeletonBarContainerStyles, collectionStyles, tableHeaderCellTextStyles, tableHeaderSortContainerStyles, tableHeaderRowStyles, tableHeaderRowContainerStyles, tableFooterRowStyles, tableFooterRowContainerStyles, tableDragIndicatorStyles, innerTableStyles, focusTrackerStyles } from './PRIVATE_Table/themes/Table.css.js';
import { S as Skeleton } from './Skeleton-c1d24eea.js';
import { S as Selector } from './Selector-e56a73a8.js';
import { b as isSameKey, c as containsKey, a as addKey, r as removeKey } from './keys-df361af9.js';
import { T as Text } from './Text-da8588ce.js';
import { TableCellRedwoodTheme } from './PRIVATE_Table/themes/redwood/TableCellTheme.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { TableRowRedwoodTheme } from './PRIVATE_Table/themes/redwood/TableRowTheme.js';
import { u as useInteractionStyle } from './useInteractionStyle-d65c72b6.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { tableRowStyles } from './PRIVATE_Table/themes/TableRowStyles.css.js';
import { TableNoDataRedwoodTheme } from './PRIVATE_Table/themes/redwood/TableNoDataTheme.js';
import { S as SelectorAll } from './SelectorAll-6f080f88.js';
import { TableHeaderCellRedwoodTheme } from './PRIVATE_Table/themes/redwood/TableHeaderCellTheme.js';
import { S as SvgChevronUp } from './ChevronUp-8e0ac42c.js';
import { S as SvgChevronUpDown } from './ChevronUpDown-490c464a.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { E as EmbeddedIconButton } from './EmbeddedIconButton-2bee9a35.js';
import { TableFooterCellRedwoodTheme } from './PRIVATE_Table/themes/redwood/TableFooterCellTheme.js';
import { F as FocusTracker } from './FocusTracker-a0621449.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { k as keyExtractor, f as findElementByKey, g as getElementContainsFunc, n as handleEnterActionableMode, o as handleWrapActionableFocus } from './collectionUtils-d72c7c40.js';
import { a as allTabbableElements, g as getActiveElement, c as getBodyElement, i as isTabbableElement } from './tabbableUtils-dca964ca.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { g as getIsSelectionPending } from './textSelectionUtils-a6554a42.js';
import { tableStyles } from './PRIVATE_Table/themes/TableStyles.css.js';
import { TableRedwoodTheme } from './PRIVATE_Table/themes/redwood/TableTheme.js';
import { u as useResizeObserver } from './useResizeObserver-260ee12b.js';
import { u as useTestId } from './useTestId-adde554c.js';

/**
 * The internal component used to render a single colgroup in Table.
 */
function TableColGroup({ tableId, columnWidthsArray }) {
    const getColStyle = (columnWidth) => {
        return columnWidth == null ? '' : `width: ${columnWidth}px;`;
    };
    return (jsx("colgroup", { children: columnWidthsArray.map((columnWidth) => {
            return jsx("col", { style: getColStyle(columnWidth), "data-oj-table-col": tableId });
        }) }));
}

/**
 * Allows to specify the time delay for rendering the component
 **/
const _timerValue = 50;
/**
 * TableSkeletonRow renders 'minimumCount' number of skeletons
 * of the variant specified from its child element - Skeleton's prop after
 * 'timerValue' ms delay
 **/
function TableSkeletonRow({ colspan, preactKey, minimumCount = 1 }) {
    const [isVisible, setIsVisible] = useState(false);
    useEffect(() => {
        setTimeout(() => {
            setIsVisible(true);
        }, _timerValue);
    }, []);
    const cellClasses = classNames([tableSkeletonCellStyles.base]);
    return (jsx("tr", { class: LOADMORE_STYLE_CLASS, children: isVisible ? (jsx("td", { class: cellClasses, colSpan: colspan, role: "presentation", children: [...Array(minimumCount)].map((_element) => (jsx("div", { class: tableSkeletonBarContainerStyles.base, children: jsx(Skeleton, { height: "4x" }) }))) })) : null }, preactKey));
}

function _defaultCellRenderer({ rowData, field }) {
    return field != null ? (jsx(Text, { truncation: "ellipsis", variant: "primary", size: "md", children: String(rowData[field]) })) : null;
}
/**
 * The internal component used to render a single cell in a TableRow.
 */
function TableCell({ tableId, rowData, field, columnKey, columnIndex, rowKey, rowIndex, isFinalRowIndex, isFinalColumnIndex, hasVerticalGridlines, hasHorizontalGridlines, isRowSelected, isPreviousRowSelected, isColumnSelected, isPreviousColumnSelected, isShowFocusRing, isRowHeader, stickyColumn = 'none', renderer = _defaultCellRenderer, selectorRenderer, isRowSelectionEnabled, isRowSingleSelection, variant, applyActiveStyle, applyHoverStyle, applyPseudoHoverStyle, isStickyStartEdge, isStickyEndEdge, isRtl }) {
    const hasRenderer = renderer !== _defaultCellRenderer;
    const { classes: themeClasses } = useComponentTheme(TableCellRedwoodTheme, {
        defaultRenderer: !hasRenderer ? 'isDefaultRenderer' : 'notDefaultRenderer',
        firstRow: rowIndex === 0 ? 'isFirstRow' : 'notFirstRow',
        lastRow: isFinalRowIndex ? 'isLastRow' : 'notLastRow',
        firstColumn: columnIndex === 0 ? 'isFirstColumn' : 'notFirstColumn',
        lastColumn: isFinalColumnIndex ? 'isLastColumn' : 'notLastColumn',
        borderTopSpacer: !(isRowSingleSelection && (isRowSelected || isPreviousRowSelected)) &&
            (!hasHorizontalGridlines || rowIndex === 0)
            ? 'isBorderTopSpacer'
            : 'notBorderTopSpacer',
        borderBottomSpacer: isFinalRowIndex && !((isRowSingleSelection && isRowSelected) || hasHorizontalGridlines)
            ? 'isBorderBottomSpacer'
            : 'notBorderBottomSpacer',
        borderStartSpacer: !(isPreviousColumnSelected || isColumnSelected) &&
            (!hasVerticalGridlines || columnIndex === 0)
            ? 'isBorderStartSpacer'
            : 'notBorderStartSpacer',
        borderEndSpacer: isFinalColumnIndex && !isColumnSelected ? 'isBorderEndSpacer' : 'notBorderEndSpacer',
        verticalGrid: hasVerticalGridlines ? 'isVerticalGrid' : 'notVerticalGrid',
        horizontalGrid: hasHorizontalGridlines ? 'isHorizontalGrid' : 'notHorizontalGrid',
        rowSingleSelection: isRowSingleSelection ? 'isRowSingleSelection' : 'notRowSingleSelection',
        rowSelectable: isRowSelectionEnabled ? 'isRowSelectable' : 'notRowSelectable',
        rowSelected: isRowSelected ? 'isRowSelected' : 'notRowSelected',
        previousRowSelected: isPreviousRowSelected
            ? 'isPreviousRowSelected'
            : 'notPreviousRowSelected',
        columnSelected: isColumnSelected ? 'isColumnSelected' : 'notColumnSelected',
        previousColumnSelected: isPreviousColumnSelected
            ? 'isPreviousColumnSelected'
            : 'notPreviousColumnSelected',
        stickyStartColumn: stickyColumn === 'start' ? 'isStickyStartColumn' : 'notStickyStartColumn',
        stickyEndColumn: stickyColumn === 'end' ? 'isStickyEndColumn' : 'notStickyEndColumn',
        stickyStartEdge: isStickyStartEdge ? 'isStickyStartEdge' : 'notStickyStartEdge',
        stickyEndEdge: isStickyEndEdge ? 'isStickyEndEdge' : 'notStickyEndEdge',
        rowHighlight: variant === 'highlight' ? 'isRowHighlight' : 'notRowHighlight',
        showFocusRing: isShowFocusRing ? 'isShowFocusRing' : 'notShowFocusRing',
        active: applyActiveStyle ? 'isActive' : 'notActive',
        hover: applyHoverStyle ? 'isHover' : 'notHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        rtl: isRtl ? 'isRtl' : 'notRtl'
    });
    const cellClasses = classNames([themeClasses]);
    const cellRendererProps = {
        rowData: rowData,
        rowKey: rowKey,
        field: field,
        columnKey: columnKey,
        selector: selectorRenderer
    };
    return (jsx("td", { "aria-colindex": columnIndex + 1, class: cellClasses, id: useId(), tabIndex: -1, role: isRowHeader ? 'rowheader' : 'gridcell', "data-oj-cell-type": 'data', "data-oj-column-key": columnKey, "data-oj-table-focusable": tableId, "data-oj-table-data-cell": tableId, ...(typeof columnKey === 'number' && { 'data-oj-column-key-type': 'number' }), children: renderer(cellRendererProps) }));
}

/**
 * The internal component used to render a single row in Table.
 */
function TableRow({ tableId, rowKey, rowData, rowIndex, isFinalRow, columnsArray, rowHeaderColumnKeys, hasVerticalGridlines, hasHorizontalGridlines, isSelected, isPreviousSelected, isRowSelectionEnabled, isSingleRowSelectionEnabled, selectedRowKeys = { all: false, keys: new Set() }, focusRingColumnKey, selectedColumnKeys = { all: false, keys: new Set() }, variant, onSelectionChange, startStickyEdge, endStickyEdge, isRtl }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const { interactionProps, applyActiveStyle, applyHoverStyle, applyPseudoHoverStyle } = useInteractionStyle();
    const { classes: themeClasses } = useComponentTheme(TableRowRedwoodTheme, { lastRow: isFinalRow ? 'isLastRow' : 'notLastRow' });
    const classes = classNames([themeClasses]);
    const accessibleRowName = (rowIndex + 2).toString();
    const handleRowSelectorChange = (detail) => {
        if (onSelectionChange != null) {
            onSelectionChange({ value: { row: detail.value, column: selectedColumnKeys }, target: detail.target }, false);
        }
    };
    const selectorRenderer = isRowSelectionEnabled && !isSingleRowSelectionEnabled
        ? () => {
            // conversion from 0-based index and adding the header row as it is always rendered
            return (jsx(Selector, { "aria-label": translations.collection_selectRow({ ROW_NAME: accessibleRowName }), onChange: handleRowSelectorChange, rowKey: rowKey, selectedKeys: selectedRowKeys }));
        }
        : undefined;
    let isPreviousColumnSelected = false;
    return (jsx("tr", { "aria-rowindex": rowIndex + 1, class: classes, role: 'row', "data-oj-key": rowKey, "data-oj-table-data-row": tableId, ...(isRowSelectionEnabled
            ? isSelected
                ? { 'aria-selected': true }
                : { 'aria-selected': false }
            : {}), ...(typeof rowKey === 'number' && { 'data-oj-key-type': 'number' }), ...(isRowSelectionEnabled && interactionProps), children: columnsArray.map((column, columnIndex) => {
            const columnKey = column.key;
            const isColumnSelected = containsKey(selectedColumnKeys, columnKey);
            const cellProps = {
                tableId: tableId,
                rowData: rowData,
                field: column.value.field,
                stickyColumn: column.value.stickyEdge,
                columnKey: columnKey,
                columnIndex: columnIndex,
                rowKey: rowKey,
                rowIndex: rowIndex,
                isFinalRowIndex: isFinalRow,
                isFinalColumnIndex: columnIndex === columnsArray.length - 1,
                hasVerticalGridlines: hasVerticalGridlines,
                hasHorizontalGridlines: hasHorizontalGridlines,
                isRowSelected: isSelected,
                isPreviousRowSelected: isPreviousSelected,
                isColumnSelected: isColumnSelected,
                isPreviousColumnSelected: isPreviousColumnSelected,
                isShowFocusRing: column.key === focusRingColumnKey,
                isRowHeader: rowHeaderColumnKeys.has(column.key),
                renderer: column.value.renderer,
                selectorRenderer: selectorRenderer,
                isRowSelectionEnabled: isRowSelectionEnabled,
                variant: variant,
                isRowSingleSelection: isSingleRowSelectionEnabled,
                applyActiveStyle: applyActiveStyle,
                applyHoverStyle: applyHoverStyle,
                applyPseudoHoverStyle: applyPseudoHoverStyle,
                isStickyStartEdge: columnIndex === startStickyEdge,
                isStickyEndEdge: columnIndex === endStickyEdge,
                isRtl: isRtl
            };
            isPreviousColumnSelected = isColumnSelected;
            return jsx(TableCell, { ...cellProps });
        }) }));
}
const _areStringSetsEquivalent = (set1, set2) => {
    if (set1 == null) {
        return set2 == null;
    }
    if (set2 == null) {
        return false;
    }
    return set1.size === set2.size && [...set1].every((x) => set2.has(x));
};
const _areColumnsArraysEquivalent = (columnsArray1, columnsArray2) => {
    if (columnsArray1.length === columnsArray2.length) {
        for (let i = 0; i < columnsArray1.length; i++) {
            if (columnsArray1[i].key !== columnsArray2[i].key ||
                columnsArray1[i].value !== columnsArray2[i].value) {
                return false;
            }
        }
        return true;
    }
    return false;
};
const MemoizeTableRow = memo(TableRow, (prev, next) => {
    if (prev && next) {
        return (prev.tableId === next.tableId &&
            prev.rowKey === next.rowKey &&
            prev.rowData === next.rowData &&
            prev.rowIndex === next.rowIndex &&
            prev.isFinalRow === next.isFinalRow &&
            _areColumnsArraysEquivalent(prev.columnsArray, next.columnsArray) &&
            prev.horizontalGridlines === next.horizontalGridlines &&
            prev.verticalGridlines === next.verticalGridlines &&
            _areStringSetsEquivalent(prev.rowHeaderColumnKeys, next.rowHeaderColumnKeys) &&
            prev.isSelected === next.isSelected &&
            prev.isPreviousSelected === next.isPreviousSelected &&
            prev.isRowSelectionEnabled === next.isRowSelectionEnabled &&
            prev.isSingleRowSelectionEnabled === next.isSingleRowSelectionEnabled &&
            (prev.isRowSelectionEnabled && !prev.isSingleRowSelectionEnabled
                ? isSameKey(prev.selectedRowKeys, next.selectedRowKeys)
                : true) &&
            isSameKey(prev.selectedColumnKeys, next.selectedColumnKeys) &&
            prev.focusRingColumnKey === next.focusRingColumnKey &&
            prev.variant === next.variant &&
            prev.onSelectionChange === next.onSelectionChange &&
            prev.startStickyEdge === next.startStickyEdge &&
            prev.endStickyEdge === next.endStickyEdge &&
            prev.isRtl === next.isRtl);
    }
    return false;
});

/**
 * The internal component used to render a single cell in a TableRow.
 */
function TableNoData({ tableId, columnsCount, isShowFocusRing, renderer }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const rowClasses = classNames([tableRowStyles.base]);
    const { classes: themeClasses } = useComponentTheme(TableNoDataRedwoodTheme, {
        defaultRenderer: renderer == null ? 'isDefaultRenderer' : 'notDefaultRenderer',
        showFocusRing: isShowFocusRing ? 'isShowFocusRing' : 'notShowFocusRing'
    });
    const cellClasses = classNames([themeClasses]);
    function defaultContentRenderer() {
        return (jsx(Text, { truncation: "ellipsis", variant: "primary", size: "md", children: translations.collection_noData() }));
    }
    const contentRenderer = renderer != null ? renderer : defaultContentRenderer;
    return (jsx("tr", { "aria-rowindex": 2, class: rowClasses, role: 'row', children: jsx("td", { "aria-colindex": 1, class: cellClasses, id: useId(), tabIndex: -1, role: 'gridcell', colSpan: columnsCount, "data-oj-cell-type": 'noData', "data-oj-table-focusable": tableId, "data-oj-table-nodata-cell": tableId, children: contentRenderer() }) }));
}

/**
 * The internal component used to render a single cell in a TableRow.
 */
function TableBody({ tableId, getAccessibleRowHeaders, data, columnsArray, hasVerticalGridlines, hasHorizontalGridlines, isShowFocusRing, getRowKey, hasMore, onLoadMore, viewportConfig, currentCell, currentRowVariant, selected, isRowSelectionEnabled, isSingleRowSelectionEnabled, onSelectionChange, noDataRenderer, startStickyEdge, endStickyEdge, isRtl }) {
    // track the empty loading state and generate a new key when it changes to avoid
    // issues with skeleton animations becoming out of sync when more are added
    const loadIndicatorKeyRef = useRef(new Date().getTime());
    const isShowEmptyLoadingRef = useRef();
    const collectionClasses = classNames([collectionStyles.base]);
    // returns a TableRowContext based on ItemContext (added key)
    const getRowContext = useCallback((context) => {
        return {
            index: context.index,
            data: context.data.data,
            key: getRowKey(context.data.data)
        };
    }, [getRowKey]);
    let isPreviousSelected = false;
    const collectionChildrenFunc = (context) => {
        const tableRowContext = getRowContext(context);
        const rowKey = tableRowContext.key;
        const containsCurrentCell = currentCell?.rowKey === rowKey;
        const focusRingColumnKey = containsCurrentCell && isShowFocusRing ? currentCell.columnKey : undefined;
        const isSelected = containsKey(selected.row, rowKey);
        const rowProps = {
            tableId: tableId,
            columnsArray: columnsArray,
            rowHeaderColumnKeys: getAccessibleRowHeaders(tableRowContext),
            hasVerticalGridlines: hasVerticalGridlines,
            hasHorizontalGridlines: hasHorizontalGridlines,
            isSelected: isSelected,
            isPreviousSelected: isPreviousSelected,
            onSelectionChange: onSelectionChange,
            isRowSelectionEnabled: isRowSelectionEnabled,
            isSingleRowSelectionEnabled: isSingleRowSelectionEnabled,
            variant: containsCurrentCell ? currentRowVariant : 'none',
            focusRingColumnKey: focusRingColumnKey,
            selectedRowKeys: selected.row,
            selectedColumnKeys: selected.column,
            rowIndex: tableRowContext.index,
            rowKey: rowKey,
            rowData: tableRowContext.data,
            isFinalRow: tableRowContext.index === (data != null ? data.length - 1 : -1),
            startStickyEdge: startStickyEdge,
            endStickyEdge: endStickyEdge,
            isRtl: isRtl
        };
        isPreviousSelected = isSelected;
        return jsx(MemoizeTableRow, { ...rowProps });
    };
    const getNoDataProps = () => {
        return {
            tableId: tableId,
            columnsCount: columnsArray.length,
            isShowFocusRing: isShowFocusRing && currentCell?.type === 'noData',
            renderer: noDataRenderer
        };
    };
    const collectionData = data != null
        ? data.map((d) => {
            const key = getRowKey(d);
            return { data: d, metadata: key };
        })
        : [];
    const isShowEmptyLoading = data != null && data.length === 0 && hasMore;
    const isShowNoData = data == null || (data.length === 0 && !hasMore);
    const prevIsEmpty = isShowEmptyLoadingRef.current;
    if (prevIsEmpty !== isShowEmptyLoading) {
        loadIndicatorKeyRef.current = new Date().getTime();
    }
    isShowEmptyLoadingRef.current = isShowEmptyLoading;
    return (jsx("tbody", { class: collectionClasses, children: isShowNoData ? (jsx(TableNoData, { ...getNoDataProps() })) : (jsx(LoadMoreCollection, { data: collectionData, loadMoreIndicator: jsx(TableSkeletonRow, { colspan: columnsArray.length, preactKey: loadIndicatorKeyRef.current, minimumCount: isShowEmptyLoading ? 25 : 3 }), hasMore: hasMore, onLoadMore: onLoadMore, viewportConfig: viewportConfig, children: collectionChildrenFunc })) }));
}

/**
 * The internal component used to render a single cell in a TableHeaderRow.
 */
function TableHeaderCell({ tableId, columnKey, columnIndex, isFinalColumnIndex, hasVerticalGridlines, isSelected, isPreviousSelected, isColumnSelectable, isRowSelectionEnabled, selectedColumnKeys = { all: false, keys: new Set() }, selectedRowKeys = { all: false, keys: new Set() }, isShowFocusRing, headerText, stickyColumn = 'none', renderer, onSelectionChange, sortable = 'disabled', sortDirection, onSortCriterionChange, isStickyStartEdge, isStickyEndEdge, isRtl }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const { interactionProps, applyActiveStyle, applyHoverStyle, applyPseudoHoverStyle } = useInteractionStyle();
    const hasRenderer = renderer != null;
    const { classes: themeClasses } = useComponentTheme(TableHeaderCellRedwoodTheme, {
        defaultRenderer: !hasRenderer ? 'isDefaultRenderer' : 'notDefaultRenderer',
        firstColumn: columnIndex === 0 ? 'isFirstColumn' : 'notFirstColumn',
        lastColumn: isFinalColumnIndex ? 'isLastColumn' : 'notLastColumn',
        borderStartSpacer: !(isPreviousSelected || isSelected) && (!hasVerticalGridlines || columnIndex === 0)
            ? 'isBorderStartSpacer'
            : 'notBorderStartSpacer',
        borderEndSpacer: isFinalColumnIndex && !isSelected ? 'isBorderEndSpacer' : 'notBorderEndSpacer',
        verticalGrid: hasVerticalGridlines ? 'isVerticalGrid' : 'notVerticalGrid',
        columnSelectable: isColumnSelectable ? 'isColumnSelectable' : 'notColumnSelectable',
        columnSelected: isSelected ? 'isColumnSelected' : 'notColumnSelected',
        previousColumnSelected: isPreviousSelected
            ? 'isPreviousColumnSelected'
            : 'notPreviousColumnSelected',
        stickyStartColumn: stickyColumn === 'start' ? 'isStickyStartColumn' : 'notStickyStartColumn',
        stickyEndColumn: stickyColumn === 'end' ? 'isStickyEndColumn' : 'notStickyEndColumn',
        stickyStartEdge: isStickyStartEdge ? 'isStickyStartEdge' : 'notStickyStartEdge',
        stickyEndEdge: isStickyEndEdge ? 'isStickyEndEdge' : 'notStickyEndEdge',
        showFocusRing: isShowFocusRing ? 'isShowFocusRing' : 'notShowFocusRing',
        active: applyActiveStyle ? 'isActive' : 'notActive',
        hover: applyHoverStyle ? 'isHover' : 'notHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        rtl: isRtl ? 'isRtl' : 'notRtl'
    });
    const cellClasses = classNames([themeClasses]);
    let selectorAllState;
    if (isSameKey(selectedRowKeys, { all: true, deletedKeys: new Set() })) {
        selectorAllState = 'all';
    }
    else if (isSameKey(selectedRowKeys, { all: false, keys: new Set() })) {
        selectorAllState = 'none';
    }
    else {
        selectorAllState = 'partial';
    }
    const handleSelectorChange = (detail) => {
        if (onSelectionChange != null) {
            onSelectionChange({ value: { row: detail.value, column: selectedColumnKeys }, target: detail.target }, false);
        }
    };
    const selectorRenderer = isRowSelectionEnabled
        ? () => (jsx(SelectorAll, { "aria-label": translations.collection_selectAllRows(), onChange: handleSelectorChange, selected: selectorAllState }))
        : undefined;
    const sortIconRenderer = sortable === 'enabled' || sortDirection != null
        ? () => (jsx(EmbeddedIconButton, { "aria-label": sortable === 'enabled'
                ? translations.collection_sortEnabled()
                : translations.collection_sortDisabled(), isDisabled: sortable !== 'enabled', onAction: handleSortGesture, children: sortDirection === 'ascending' ? (jsx(SvgChevronUp, {})) : sortDirection === 'descending' ? (jsx(SvgChevronDown, {})) : (jsx(SvgChevronUpDown, {})) }))
        : undefined;
    const headerCellRendererProps = {
        key: columnKey,
        headerText: headerText,
        sortable: sortable,
        sortDirection: sortDirection,
        selector: selectorRenderer,
        sortControl: sortIconRenderer
    };
    const handleSortGesture = useCallback(() => {
        if (onSortCriterionChange != null) {
            const newDirection = sortDirection === 'ascending' ? 'descending' : 'ascending';
            onSortCriterionChange([{ key: columnKey, sortDirection: newDirection }]);
        }
    }, [columnKey, sortDirection, onSortCriterionChange]);
    const getHeaderCellRenderer = useCallback(() => {
        if (renderer != null) {
            return renderer;
        }
        return ({ headerText, sortControl }) => {
            const text = headerText != null ? (jsx("div", { class: tableHeaderCellTextStyles.base, children: jsx(Text, { overflowWrap: "normal", lineClamp: 2, variant: "primary", size: "md", children: headerText }) })) : null;
            if (sortControl != null) {
                return (jsxs("div", { class: tableHeaderSortContainerStyles.base, children: [text, sortControl()] }));
            }
            return text;
        };
    }, [renderer]);
    const getAriaSelected = () => {
        if (isSelected) {
            return { 'aria-selected': true };
        }
        return isColumnSelectable ? { 'aria-selected': false } : undefined;
    };
    const getAriaSort = () => {
        if (sortDirection === 'ascending' || sortDirection === 'descending') {
            return { 'aria-sort': sortDirection };
        }
        return undefined;
    };
    return (jsx("th", { "aria-colindex": columnIndex + 1, ...getAriaSelected(), ...getAriaSort(), class: cellClasses, id: useId(), tabIndex: -1, role: 'columnheader', "data-oj-cell-type": 'header', "data-oj-column-key": columnKey, "data-oj-table-focusable": tableId, "data-oj-table-header-cell": tableId, ...(typeof columnKey === 'number' && { 'data-oj-column-key-type': 'number' }), ...(isColumnSelectable && interactionProps), children: getHeaderCellRenderer()(headerCellRendererProps) }));
}

/**
 * The internal component used to render a header region in Table.
 */
function TableHeader({ tableId, columnsArray, hasVerticalGridlines, focusedKey, isShowFocusRing, selectedColumnKeys, selectedRowKeys, isColumnSelectionEnabled, isRowSelectionEnabled, onSelectionChange, sortCriterion, onSortCriterionChange, startStickyEdge, endStickyEdge, isResizeHover, isRtl }) {
    const rowClasses = classNames([tableHeaderRowStyles.base]);
    const containerClasses = classNames([tableHeaderRowContainerStyles.base]);
    const getStyle = () => {
        return isResizeHover ? 'cursor: col-resize;' : '';
    };
    let isPreviousSelected = false;
    return (jsx("thead", { class: containerClasses, children: jsx("tr", { class: rowClasses, role: 'row', style: getStyle(), "data-oj-table-header-row": tableId, children: columnsArray.map((column, columnIndex) => {
                const columnKey = column.key;
                let sortDirection;
                if (sortCriterion != null) {
                    for (const criterion of sortCriterion) {
                        if (criterion.key === columnKey) {
                            sortDirection = criterion.sortDirection;
                            break;
                        }
                    }
                }
                const isSelected = containsKey(selectedColumnKeys, columnKey);
                const headerCellProps = {
                    tableId: tableId,
                    hasVerticalGridlines: hasVerticalGridlines,
                    columnKey: columnKey,
                    columnIndex: columnIndex,
                    isFinalColumnIndex: columnIndex === columnsArray.length - 1,
                    stickyColumn: column.value.stickyEdge,
                    isSelected: isSelected,
                    isPreviousSelected: isPreviousSelected,
                    selectedColumnKeys: selectedColumnKeys,
                    selectedRowKeys: selectedRowKeys,
                    isColumnSelectable: isColumnSelectionEnabled && column.value.selectable !== 'disabled',
                    isRowSelectionEnabled: isRowSelectionEnabled,
                    isShowFocusRing: isShowFocusRing && columnKey === focusedKey,
                    headerText: column.value.headerText,
                    renderer: column.value.headerRenderer,
                    onSelectionChange: onSelectionChange,
                    sortable: column.value.sortable,
                    sortDirection: sortDirection,
                    onSortCriterionChange: onSortCriterionChange,
                    isStickyStartEdge: columnIndex === startStickyEdge,
                    isStickyEndEdge: columnIndex === endStickyEdge,
                    isRtl: isRtl
                };
                isPreviousSelected = isSelected;
                return jsx(TableHeaderCell, { ...headerCellProps });
            }) }) }));
}

function _defaultFooterCellRenderer({ footerText }) {
    return footerText != null ? (jsx(Text, { truncation: "ellipsis", variant: "primary", size: "md", children: footerText })) : null;
}
/**
 * The internal component used to render a single cell in a TableFooterRow.
 */
function TableFooterCell({ tableId, columnKey, columnIndex, isFinalColumnIndex, hasVerticalGridlines, isSelected, isPreviousSelected, isColumnSelectable, isShowFocusRing, stickyColumn = 'none', footerText, renderer = _defaultFooterCellRenderer, isStickyStartEdge, isStickyEndEdge, isRtl }) {
    const { interactionProps, applyActiveStyle, applyHoverStyle, applyPseudoHoverStyle } = useInteractionStyle();
    const hasRenderer = renderer !== _defaultFooterCellRenderer;
    const { classes: themeClasses } = useComponentTheme(TableFooterCellRedwoodTheme, {
        defaultRenderer: !hasRenderer ? 'isDefaultRenderer' : 'notDefaultRenderer',
        firstColumn: columnIndex === 0 ? 'isFirstColumn' : 'notFirstColumn',
        lastColumn: isFinalColumnIndex ? 'isLastColumn' : 'notLastColumn',
        borderStartSpacer: !(isPreviousSelected || isSelected) && (!hasVerticalGridlines || columnIndex === 0)
            ? 'isBorderStartSpacer'
            : 'notBorderStartSpacer',
        borderEndSpacer: isFinalColumnIndex && !isSelected ? 'isBorderEndSpacer' : 'notBorderEndSpacer',
        verticalGrid: hasVerticalGridlines ? 'isVerticalGrid' : 'notVerticalGrid',
        columnSelectable: isColumnSelectable ? 'isColumnSelectable' : 'notColumnSelectable',
        columnSelected: isSelected ? 'isColumnSelected' : 'notColumnSelected',
        previousColumnSelected: isPreviousSelected
            ? 'isPreviousColumnSelected'
            : 'notPreviousColumnSelected',
        stickyStartColumn: stickyColumn === 'start' ? 'isStickyStartColumn' : 'notStickyStartColumn',
        stickyEndColumn: stickyColumn === 'end' ? 'isStickyEndColumn' : 'notStickyEndColumn',
        stickyStartEdge: isStickyStartEdge ? 'isStickyStartEdge' : 'notStickyStartEdge',
        stickyEndEdge: isStickyEndEdge ? 'isStickyEndEdge' : 'notStickyEndEdge',
        showFocusRing: isShowFocusRing ? 'isShowFocusRing' : 'notShowFocusRing',
        active: applyActiveStyle ? 'isActive' : 'notActive',
        hover: applyHoverStyle ? 'isHover' : 'notHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        rtl: isRtl ? 'isRtl' : 'notRtl'
    });
    const cellClasses = classNames([themeClasses]);
    const footerCellRendererProps = { key: columnKey, footerText: footerText };
    return (jsx("td", { "aria-colindex": columnIndex + 1, ...(isSelected
            ? { 'aria-selected': true }
            : isColumnSelectable
                ? { 'aria-selected': false }
                : {}), class: cellClasses, id: useId(), tabIndex: -1, role: 'gridcell', "data-oj-cell-type": 'footer', "data-oj-column-key": columnKey, "data-oj-table-focusable": tableId, "data-oj-table-footer-cell": tableId, ...(typeof columnKey === 'number' && { 'data-oj-column-key-type': 'number' }), ...(isColumnSelectable && interactionProps), children: renderer(footerCellRendererProps) }));
}

/**
 * The internal component used to render a footer region in Table.
 */
function TableFooter({ tableId, isRendered, columnsArray, hasVerticalGridlines, focusedKey, isShowFocusRing, selectedKeys, isColumnSelectionEnabled, startStickyEdge, endStickyEdge, isRtl }) {
    const rowClasses = classNames([tableFooterRowStyles.base]);
    const containerClasses = classNames([tableFooterRowContainerStyles.base]);
    let isPreviousSelected = false;
    return isRendered ? (jsx("tfoot", { class: containerClasses, children: jsx("tr", { class: rowClasses, role: 'row', "data-oj-table-footer-row": tableId, children: columnsArray.map((column, columnIndex) => {
                const columnKey = column.key;
                const isSelected = containsKey(selectedKeys, columnKey);
                const footerCellProps = {
                    tableId: tableId,
                    columnKey: columnKey,
                    columnIndex: columnIndex,
                    isFinalColumnIndex: columnIndex === columnsArray.length - 1,
                    hasVerticalGridlines: hasVerticalGridlines,
                    stickyColumn: column.value.stickyEdge,
                    isSelected: isSelected,
                    isPreviousSelected: isPreviousSelected,
                    isColumnSelectable: isColumnSelectionEnabled && column.value.selectable !== 'disabled',
                    isShowFocusRing: isShowFocusRing && columnKey === focusedKey,
                    footerText: column.value.footerText,
                    renderer: column.value.footerRenderer,
                    isStickyStartEdge: columnIndex === startStickyEdge,
                    isStickyEndEdge: columnIndex === endStickyEdge,
                    isRtl: isRtl
                };
                isPreviousSelected = isSelected;
                return jsx(TableFooterCell, { ...footerCellProps });
            }) }) })) : null;
}

/**
 * The internal component used to render a drag indicator line in the Table.
 */
function TableDragIndicator({ position, isRtl }) {
    const tableDragIndicatorClasses = classNames([tableDragIndicatorStyles.base]);
    const getDragIndicatorStyle = () => {
        if (position != null) {
            return isRtl
                ? `right:${position}px;cursor:col-resize;`
                : `left:${position}px;cursor:col-resize;`;
        }
        return `display:none;`;
    };
    return jsx("div", { class: tableDragIndicatorClasses, style: getDragIndicatorStyle() });
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the cell type for the given cell element
 */
const getCellType = (element) => {
    return element.dataset['ojCellType'];
};
/**
 * Returns the row key for the given row element
 */
const getRowKey = (element) => {
    return element.dataset['ojKeyType'] === 'number'
        ? Number(element.dataset['ojKey'])
        : element.dataset['ojKey'];
};
/**
 * Returns the key for the row at the given index
 */
const getRowKeyForRowIndex = (root, tableId, index) => {
    if (root != null) {
        const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
        if (rowElements.length > index) {
            return getRowKey(rowElements[index]);
        }
    }
    return null;
};
/**
 * Returns the index of the given row element
 */
const getRowIndexForRowElement = (root, tableId, rowElement) => {
    if (root != null) {
        const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
        const index = Array.prototype.indexOf.call(rowElements, rowElement);
        if (index > -1) {
            return index;
        }
    }
    return null;
};
/**
 * Returns the index of the row for the given key.
 */
function getRowIndexForRowKey(root, tableId, rowKey) {
    if (root != null) {
        const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
        for (let i = 0; i < rowElements.length; i++) {
            if (rowKey === getRowKey(rowElements[i])) {
                return i;
            }
        }
    }
    return null;
}
/**
 * Returns the column key for the given cell element
 */
const getColumnKey = (element) => {
    return element.dataset['ojColumnKeyType'] === 'number'
        ? Number(element.dataset['ojColumnKey'])
        : element.dataset['ojColumnKey'];
};
/**
 * Returns the index of the given column header element or footer element
 */
const getColumnIndexForHeaderFooterElement = (root, tableId, cellElement, isHeader) => {
    if (root != null) {
        const columnElements = root.querySelectorAll(isHeader
            ? `[data-oj-table-header-cell='${tableId}']`
            : `[data-oj-table-footer-cell='${tableId}']`);
        const index = Array.prototype.indexOf.call(columnElements, cellElement);
        if (index > -1) {
            return index;
        }
    }
    return null;
};
/**
 * Helper method to get the cell key definition from an element
 */
function logicalCellExtractor(element, tableId, cellSelector, onlyAncestors) {
    const startingElement = onlyAncestors ? element.parentElement : element;
    if (startingElement != null) {
        const cellElement = startingElement.closest(cellSelector);
        if (cellElement != null) {
            const cellType = getCellType(cellElement);
            if (cellType === 'data') {
                return {
                    rowKey: keyExtractor(cellElement, `[data-oj-table-data-row='${tableId}']`),
                    columnKey: getColumnKey(cellElement),
                    type: cellType
                };
            }
            else if (cellType === 'header' || cellType === 'footer') {
                return {
                    columnKey: getColumnKey(cellElement),
                    type: cellType
                };
            }
            else if (cellType === 'noData') {
                return {
                    type: cellType
                };
            }
        }
    }
    return null;
}
/**
 * Helper method to get an element from a cell descriptor
 */
function getElementFromCell(root, tableId, cell) {
    if (cell.type === 'header') {
        // header case
        const headerElements = root.querySelectorAll(`[data-oj-table-header-cell='${tableId}']`);
        for (const headerElement of headerElements) {
            if (cell.columnKey === getColumnKey(headerElement)) {
                return headerElement;
            }
        }
    }
    else if (cell.type === 'footer') {
        // footer case
        const footerElements = root.querySelectorAll(`[data-oj-table-footer-cell='${tableId}']`);
        for (const footerElement of footerElements) {
            if (cell.columnKey === getColumnKey(footerElement)) {
                return footerElement;
            }
        }
    }
    else if (cell.type === 'data') {
        // data body case
        const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
        for (const rowElement of rowElements) {
            if (cell.rowKey === getRowKey(rowElement)) {
                const cellElements = rowElement.querySelectorAll(`[data-oj-table-focusable='${tableId}']`);
                for (const cellElement of cellElements) {
                    if (cell.columnKey === getColumnKey(cellElement)) {
                        return cellElement;
                    }
                }
            }
        }
    }
    else if (cell.type === 'noData') {
        // no data case
        return root.querySelector(`[data-oj-table-nodata-cell='${tableId}']`);
    }
    return null;
}
/**
 * Helper method to get the top scroller offset of the Table
 */
const getScrollerTopOffset = (root, tableId) => {
    const headerRowElement = root.querySelector(`[data-oj-table-header-row='${tableId}']`);
    return headerRowElement != null ? headerRowElement.getBoundingClientRect().height : 0;
};
/**
 * Helper method to get the bottom scroller offset of the Table
 */
const getScrollerBottomOffset = (root, tableId) => {
    const footerRowElement = root.querySelector(`[data-oj-table-footer-row='${tableId}']`);
    return footerRowElement != null ? footerRowElement.getBoundingClientRect().height : 0;
};
/**
 * Returns the key of the first focusable row in the Table
 */
const getFirstFocusableRowKey = (root, tableId) => {
    if (root != null) {
        const firstRowElement = root.querySelector(`[data-oj-table-data-row='${tableId}']`);
        if (firstRowElement != null) {
            return getRowKey(firstRowElement);
        }
    }
    return null;
};
/**
 * Returns the key of the last focusable row in the Table
 */
const getLastFocusableRowKey = (root, tableId) => {
    const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
    const rowCount = rowElements.length;
    if (rowCount > 0) {
        return getRowKey(rowElements[rowCount - 1]);
    }
    return null;
};
/**
 * Returns the cell definition of the first rendered cell in the Table
 */
const getFirstFocusableCell = (root, tableId) => {
    if (root != null) {
        const firstCellElement = root.querySelector(`[data-oj-table-focusable='${tableId}']`);
        if (firstCellElement != null) {
            const firstCellType = getCellType(firstCellElement);
            if (firstCellType === 'header' || firstCellType === 'footer') {
                return { columnKey: getColumnKey(firstCellElement), type: firstCellType };
            }
            else if (firstCellType === 'noData') {
                return { type: 'noData' };
            }
            return {
                rowKey: getRowKey(firstCellElement),
                columnKey: getColumnKey(firstCellElement),
                type: 'data'
            };
        }
    }
    return null;
};
/**
 * Helper method to determine if the no data cell is present in the Table
 */
const hasNoDataCell = (root, tableId) => {
    if (root != null) {
        return root.querySelectorAll(`[data-oj-table-nodata-cell='${tableId}']`).length > 0;
    }
    return false;
};
/**
 * Helper method to determine if footer cells are present in the Table
 */
const hasFooterCells = (root, tableId) => {
    if (root != null) {
        return root.querySelectorAll(`[data-oj-table-footer-row='${tableId}']`).length > 0;
    }
    return false;
};

/**
 * A helper function to make sure specified elem is visible in the specified container
 */
function _scrollColumnIntoView(columnElement, scrollerElement, columnsArray, scrollbarWidth, isRtl, fullColumnWidths, location) {
    const columnKey = getColumnKey(columnElement);
    let columnIndex;
    for (let i = 0; i < columnsArray.length; i++) {
        if (columnsArray[i].key === columnKey) {
            columnIndex = i;
            break;
        }
    }
    if (columnIndex != null && fullColumnWidths != null) {
        let startOffset = 0;
        let endOffset = 0;
        const stickyStartColumns = getStickyColumnIndicies(columnsArray, true);
        for (let i = 0; i < stickyStartColumns.length; i++) {
            const stickyIndex = stickyStartColumns[i];
            if (stickyIndex < columnIndex) {
                startOffset += fullColumnWidths[stickyIndex];
            }
            else {
                break;
            }
        }
        const stickyEndColumns = getStickyColumnIndicies(columnsArray, false);
        for (let i = stickyEndColumns.length - 1; i > -1; i--) {
            const stickyIndex = stickyEndColumns[i];
            if (stickyIndex > columnIndex) {
                endOffset += fullColumnWidths[stickyIndex];
            }
            else {
                break;
            }
        }
        const horizontalOverflowDiff = _getHorizontalOverflowDiff(columnElement, scrollerElement, startOffset, endOffset, scrollbarWidth, isRtl);
        const leftOverflowDiff = horizontalOverflowDiff.left;
        const hasLeftOverflow = leftOverflowDiff >= 0;
        const rightOverflowDiff = horizontalOverflowDiff.right;
        const hasRightOverflow = rightOverflowDiff >= 0;
        // don't adjust scroll position if row has overflow in both directions
        if (hasLeftOverflow && hasRightOverflow) {
            return;
        }
        if (location == null || location === 'inView') {
            // if column fits fully in viewport, scroll overflow side into view
            // otherwise, scroll the shortest amount to fill viewport with column
            if (hasLeftOverflow) {
                if (Math.abs(rightOverflowDiff) > Math.abs(leftOverflowDiff)) {
                    scrollerElement.scrollLeft = _roundScrollValue(scrollerElement.scrollLeft - leftOverflowDiff, false);
                }
                else {
                    scrollerElement.scrollLeft = _roundScrollValue(scrollerElement.scrollLeft + rightOverflowDiff, true);
                }
            }
            else if (hasRightOverflow) {
                if (Math.abs(leftOverflowDiff) > Math.abs(rightOverflowDiff)) {
                    scrollerElement.scrollLeft = _roundScrollValue(scrollerElement.scrollLeft + rightOverflowDiff, true);
                }
                else {
                    scrollerElement.scrollLeft = _roundScrollValue(scrollerElement.scrollLeft - leftOverflowDiff, false);
                }
            }
        }
        else if (location === 'start') {
            scrollerElement.scrollLeft = _roundScrollValue(scrollerElement.scrollLeft - leftOverflowDiff, false);
        }
        else {
            scrollerElement.scrollLeft = _roundScrollValue(scrollerElement.scrollLeft + rightOverflowDiff, true);
        }
    }
}
/**
 * A helper function to make sure specified elem is visible in the specified container
 */
const _scrollRowIntoView = (root, tableId, rowElement, scrollerElement, scrollbarHeight, location) => {
    const topOffset = getScrollerTopOffset(root, tableId);
    const bottomOffset = getScrollerBottomOffset(root, tableId);
    const verticalOverflowDiff = _getVerticalOverflowDiff(rowElement, scrollerElement, topOffset, bottomOffset, scrollbarHeight);
    const topOverflowDiff = verticalOverflowDiff.top;
    const hasTopOverflow = topOverflowDiff >= 0;
    const bottomOverflowDiff = verticalOverflowDiff.bottom;
    const hasBottomOverflow = bottomOverflowDiff >= 0;
    // don't adjust scroll position if row has overflow in both directions
    if (hasTopOverflow && hasBottomOverflow) {
        return;
    }
    if (location == null || location === 'inView') {
        // if row fits fully in viewport, scroll overflow side into view
        // otherwise, scroll the shortest amount to fill viewport with row
        if (hasBottomOverflow) {
            if (Math.abs(topOverflowDiff) > Math.abs(bottomOverflowDiff)) {
                scrollerElement.scrollTop = _roundScrollValue(scrollerElement.scrollTop + bottomOverflowDiff, true);
            }
            else {
                scrollerElement.scrollTop = _roundScrollValue(scrollerElement.scrollTop - topOverflowDiff, false);
            }
        }
        else if (hasTopOverflow) {
            if (Math.abs(bottomOverflowDiff) > Math.abs(topOverflowDiff)) {
                scrollerElement.scrollTop = _roundScrollValue(scrollerElement.scrollTop - topOverflowDiff, false);
            }
            else {
                scrollerElement.scrollTop = _roundScrollValue(scrollerElement.scrollTop + bottomOverflowDiff, true);
            }
        }
    }
    else if (location === 'top') {
        scrollerElement.scrollTop = _roundScrollValue(scrollerElement.scrollTop - topOverflowDiff, false);
    }
    else {
        scrollerElement.scrollTop = _roundScrollValue(scrollerElement.scrollTop + bottomOverflowDiff, true);
    }
};
/**
 * Helper method to round a desired scrollTop or scrollLeft value to the nearest valid value
 * depending on the client browser.
 */
const _roundScrollValue = (value, isOver) => {
    // use Math.floor() and Math.ceil() to ensure we round to nearest containing valid
    // pixel value in either direction as valid scrollTop values are only integers
    return isOver ? Math.ceil(value) : Math.floor(value);
};
/**
 * A helper to get the horizontal overflow diff of the given element
 */
const _getHorizontalOverflowDiff = (element, scrollerElement, startOffset, endOffset, scrollbarWidth, isRtl) => {
    const elementRect = element.getBoundingClientRect();
    const scrollerRect = scrollerElement.getBoundingClientRect();
    if (isRtl) {
        return {
            left: scrollerRect.left - elementRect.left + endOffset + scrollbarWidth,
            right: elementRect.right - scrollerRect.right + startOffset
        };
    }
    else {
        return {
            left: scrollerRect.left - elementRect.left + startOffset,
            right: elementRect.right - scrollerRect.right + endOffset + scrollbarWidth
        };
    }
};
/**
 * A helper to get the vertical overflow diff of the given element
 */
const _getVerticalOverflowDiff = (element, scrollerElement, topOffset, bottomOffset, scrollbarHeight) => {
    const elementRect = element.getBoundingClientRect();
    const scrollerRect = scrollerElement.getBoundingClientRect();
    return {
        top: scrollerRect.top - elementRect.top + topOffset,
        bottom: elementRect.bottom - scrollerRect.bottom + bottomOffset + scrollbarHeight
    };
};
/**
 * Helper to set the horizontal scroll position on the Table.
 */
function setHorizontalScrollPosition(root, columnsArray, fullColumnWidths, isRtl, horizontalScrollPosition) {
    const x = _getScrollLeftFromScrollPosition(root, columnsArray, fullColumnWidths, horizontalScrollPosition);
    root.scrollLeft = x != null ? (isRtl ? -x : x) : 0;
}
/**
 * Helper to set the vertical scroll position on the Table.
 */
function setVerticalScrollPosition(root, tableId, verticalScrollPosition) {
    const y = _getScrollTopFromScrollPosition(root, tableId, verticalScrollPosition);
    root.scrollTop = y != null ? y : 0;
}
/**
 * Helper to determine the 'x' value of a given scroll position.
 */
function _getScrollLeftFromScrollPosition(root, columnsArray, fullColumnWidths, scrollPosition) {
    if (scrollPosition != null) {
        let columnKey;
        let useColumn = false;
        if (scrollPosition.columnKey != null) {
            // columnKey takes precedence over everything else
            useColumn = true;
            columnKey = scrollPosition.columnKey;
        }
        else if (scrollPosition.offsetX != null && scrollPosition.x == null) {
            // offsetX can be used on its own if it is the only horizontal aspect provided
            useColumn = true;
            const currentHorizontalScrollPosition = getHorizontalScrollPosition(root, columnsArray, fullColumnWidths);
            columnKey = currentHorizontalScrollPosition.columnKey;
        }
        if (useColumn) {
            if (columnKey != null) {
                let x = 0;
                for (let i = 0; i < fullColumnWidths.length; i++) {
                    if (columnsArray[i].key === columnKey) {
                        return x + (scrollPosition.offsetX != null ? scrollPosition.offsetX : 0);
                    }
                    if (columnsArray[i].value.stickyEdge !== 'start') {
                        x += fullColumnWidths[i];
                    }
                }
            }
        }
        else if (scrollPosition.x != null) {
            return scrollPosition.x;
        }
    }
    // either nothing was provided, or what was provided was invalid
    return undefined;
}
/**
 * Helper to determine the 'y' value of a given scroll position.
 */
function _getScrollTopFromScrollPosition(root, tableId, scrollPosition) {
    if (scrollPosition != null) {
        let rowKey;
        let useRow = false;
        if (scrollPosition.rowKey != null) {
            // rowKey takes precedence over everything else
            useRow = true;
            rowKey = scrollPosition.rowKey;
        }
        else if (scrollPosition.offsetY != null && scrollPosition.y == null) {
            // offsetY can be used on its own if it is the only vertical aspect provided
            useRow = true;
            rowKey = getVerticalScrollPosition(root, tableId).rowKey;
        }
        if (useRow) {
            if (rowKey != null) {
                let y = 0;
                const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
                for (let i = 0; i < rowElements.length; i++) {
                    if (rowKey === getRowKey(rowElements[i])) {
                        return y + (scrollPosition.offsetY != null ? scrollPosition.offsetY : 0);
                    }
                    y += rowElements[i].getBoundingClientRect().height;
                }
            }
        }
        else if (scrollPosition.y != null) {
            return scrollPosition.y;
        }
    }
    // either nothing was provided, or what was provided was invalid
    return undefined;
}
/**
 * Helper to get the logical scroll position for the given scrollLeft value. If no scrollLeft value is given,
 * it will use the current scrollLeft value of the Table.
 */
function getHorizontalScrollPosition(root, columnsArray, fullColumnWidths, newScrollLeft) {
    // ensure scroll position x value is initialized
    const scrollLeft = Math.abs(newScrollLeft == null ? root.scrollLeft : newScrollLeft);
    const scrollPosition = {
        x: scrollLeft,
        columnKey: undefined,
        offsetX: undefined
    };
    let columnEnd = 0;
    if (columnsArray.length > 0) {
        if (scrollLeft === 0) {
            scrollPosition.columnKey = columnsArray[0].key;
            scrollPosition.offsetX = 0;
            return scrollPosition;
        }
    }
    for (let i = 0; i < columnsArray.length; i++) {
        if (columnsArray[i].value.stickyEdge !== 'start') {
            columnEnd += fullColumnWidths[i];
        }
        if (scrollLeft < columnEnd) {
            scrollPosition.columnKey = columnsArray[i].key;
            scrollPosition.offsetX = fullColumnWidths[i] + scrollLeft - columnEnd;
            break;
        }
    }
    return scrollPosition;
}
/**
 * Helper to get the logical scroll position for the given scrollTop value. If no scrollTop value is given,
 * it will use the current scrollTop value of the Table.
 */
function getVerticalScrollPosition(root, tableId, newScrollTop) {
    // ensure scroll position y value is initialized
    const scrollTop = Math.abs(newScrollTop == null ? root.scrollTop : newScrollTop);
    const scrollPosition = {
        y: scrollTop,
        rowKey: undefined,
        offsetY: undefined
    };
    let rowBottom = 0;
    const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
    if (rowElements.length > 0) {
        if (scrollTop === 0) {
            scrollPosition.rowKey = getRowKeyForRowIndex(root, tableId, 0);
            scrollPosition.offsetY = 0;
            return scrollPosition;
        }
    }
    for (let i = 0; i < rowElements.length; i++) {
        const rowHeight = rowElements[i].getBoundingClientRect().height;
        rowBottom += rowHeight;
        if (scrollTop < rowBottom) {
            scrollPosition.rowKey = getRowKeyForRowIndex(root, tableId, i);
            scrollPosition.offsetY = rowHeight + scrollTop - rowBottom;
            break;
        }
    }
    return scrollPosition;
}
function applyScrollDetail(root, tableId, columnsArray, sizingInfo, scrollDetail, isRtl, fullColumnWidths, viewportConfig) {
    const scroller = viewportConfig?.scroller() || root;
    if (scrollDetail.cell.type === 'data') {
        const rowElement = findElementByKey(root, scrollDetail.cell.rowKey, `[data-oj-table-data-row='${tableId}']`);
        if (rowElement != null) {
            _scrollRowIntoView(root, tableId, rowElement, scroller, sizingInfo.boxHeight - sizingInfo.contentHeight, scrollDetail.locationY);
        }
    }
    const cellElement = getElementFromCell(root, tableId, scrollDetail.cell);
    if (cellElement != null) {
        _scrollColumnIntoView(cellElement, scroller, columnsArray, sizingInfo.boxWidth - sizingInfo.contentWidth, isRtl, fullColumnWidths, scrollDetail.locationX);
    }
}
/**
 * Helper function to update the 'left' and 'right' values of all sticky columns to correspond
 * to the given sizing information.
 */
function updateStickyColumns(root, tableId, isRtl, columnsArray, fullColumnWidths, stickyEdgesState, setStickyEdgesState) {
    let stickyIndex;
    let stickyStartOffset = 0;
    let stickyEndOffset = 0;
    const stickyStartIndicies = getStickyColumnIndicies(columnsArray, true);
    for (let i = 0; i < stickyStartIndicies.length; i++) {
        stickyIndex = stickyStartIndicies[i];
        _applyStickyColumnOffset(root, tableId, isRtl, stickyIndex, stickyStartOffset, true);
        stickyStartOffset += fullColumnWidths[stickyIndex];
    }
    const stickyEndIndicies = getStickyColumnIndicies(columnsArray, false);
    for (let i = stickyEndIndicies.length - 1; i > -1; i--) {
        stickyIndex = stickyEndIndicies[i];
        _applyStickyColumnOffset(root, tableId, isRtl, stickyIndex, stickyEndOffset, false);
        stickyEndOffset += fullColumnWidths[stickyIndex];
    }
    updateStickyEdges(root, columnsArray, fullColumnWidths, stickyEdgesState, setStickyEdgesState);
}
/**
 * Helper function to get the column indicies corresponding to the given edge.
 */
const getStickyColumnIndicies = (columnsArray, isStart) => {
    const stickyColumns = [];
    const edge = isStart ? 'start' : 'end';
    for (let i = 0; i < columnsArray.length; i++) {
        if (columnsArray[i].value.stickyEdge === edge) {
            stickyColumns.push(i);
        }
    }
    return stickyColumns;
};
/**
 * Helper function to update the 'left' and 'right' values of a specific column.
 */
const _applyStickyColumnOffset = (root, tableId, isRtl, columnIndex, stickyOffset, isStart) => {
    const styleProperty = (isStart && !isRtl) || (!isStart && isRtl) ? 'left' : 'right';
    const styleValue = `${stickyOffset}px`;
    const headerElements = root.querySelectorAll(`[data-oj-table-header-cell='${tableId}']`);
    const headerElement = headerElements[columnIndex];
    headerElement.style[styleProperty] = styleValue;
    const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
    for (let j = 0; j < rowElements.length; j++) {
        const rowElement = rowElements[j];
        const cellElements = rowElement.querySelectorAll(`[data-oj-table-data-cell='${tableId}']`);
        const cellElement = cellElements[columnIndex];
        cellElement.style[styleProperty] = styleValue;
    }
    const footerElements = root.querySelectorAll(`[data-oj-table-footer-cell='${tableId}']`);
    if (footerElements.length > 0) {
        const footerElement = footerElements[columnIndex];
        footerElement.style[styleProperty] = styleValue;
    }
};
/**
 * Helper function to update the sticky edges based on the given scrollLeft value.
 */
function updateStickyEdges(root, columnsArray, fullColumnWidths, stickyEdgesState, setStickyEdgesState, scrollLeft) {
    if (columnsArray.length > 0) {
        let i;
        let currentScrollIndex;
        const newScrollPosition = getHorizontalScrollPosition(root, columnsArray, fullColumnWidths, scrollLeft);
        for (i = 0; i < columnsArray.length; i++) {
            if (columnsArray[i].key === newScrollPosition.columnKey) {
                currentScrollIndex = i;
                break;
            }
        }
        let startIndex;
        // browser zoom levels cause rounding issues where the start scroll
        // position may never be reached, but it should always be within 1
        if (newScrollPosition.x >= 1) {
            const stickyStartIndicies = getStickyColumnIndicies(columnsArray, true);
            for (i = 0; i < stickyStartIndicies.length; i++) {
                const currentIndex = stickyStartIndicies[i];
                if (currentIndex < currentScrollIndex) {
                    startIndex = currentIndex;
                }
                else {
                    break;
                }
            }
        }
        let endIndex;
        let currentWidth = 0;
        const maxScrollPos = root.scrollWidth - root.clientWidth;
        const endOverflow = maxScrollPos - newScrollPosition.x;
        // browser zoom levels cause rounding issues where the max scroll
        // position may never be reached, but it should always be within 1
        if (endOverflow >= 1) {
            const stickyEndIndicies = getStickyColumnIndicies(columnsArray, false);
            for (let i = columnsArray.length - 1; i > -1; i--) {
                if (stickyEndIndicies.indexOf(i) !== -1) {
                    endIndex = i;
                }
                else {
                    currentWidth += fullColumnWidths[i];
                    if (currentWidth > endOverflow) {
                        break;
                    }
                }
            }
        }
        if (stickyEdgesState.start != startIndex || stickyEdgesState.end != endIndex) {
            setStickyEdgesState({ start: startIndex, end: endIndex });
        }
    }
}
/**
 * Helper function to get the viewport config. TODO: this needs help for table still
 */
const getViewportConfig = (outerTableRef, config) => {
    return (config ?? {
        scroller: () => {
            return outerTableRef.current;
        }
    });
};

/**
 * Helper function to compare two given cell descriptors.
 */
function cellComparator(cell1, cell2) {
    if (cell1 == null) {
        return cell2 == null;
    }
    if (cell2 == null) {
        return false;
    }
    return (cell1?.rowKey === cell2?.rowKey &&
        cell1?.columnKey === cell2?.columnKey &&
        cell1?.type === cell2?.type);
}
/**
 * Helper function to handle an 'Up' or 'Down' arrow key press.
 * Up - Moves to the same cell in the previous row (including headers and footers). No op if already on the first row.
 * Down - Moves to the same cell in the next row (including headers and footers). No op if already on the last row.
 */
function handleAdjacentRowGesture(root, tableId, columnsArray, initialCell, onCurrentCellChanged, isPrevious) {
    let newCurrentCell;
    const cellType = initialCell.type;
    if (cellType !== 'noData') {
        const columnKey = initialCell.columnKey;
        if (cellType === 'data') {
            const currentRowKey = initialCell.rowKey;
            const currentRowElement = findElementByKey(root, currentRowKey, `[data-oj-table-data-row='${tableId}']`);
            if (currentRowElement != null) {
                const adjacentRowElement = isPrevious
                    ? currentRowElement.previousElementSibling
                    : currentRowElement.nextElementSibling;
                if (adjacentRowElement != null) {
                    const rowKey = getRowKey(adjacentRowElement);
                    if (rowKey != null) {
                        newCurrentCell = { rowKey: rowKey, columnKey: columnKey, type: 'data' };
                        onCurrentCellChanged({ value: newCurrentCell });
                    }
                }
                else if (isPrevious) {
                    newCurrentCell = { columnKey: initialCell.columnKey, type: 'header' };
                    onCurrentCellChanged({ value: newCurrentCell });
                }
                else if (hasFooterCells(root, tableId)) {
                    newCurrentCell = { columnKey: initialCell.columnKey, type: 'footer' };
                    onCurrentCellChanged({ value: newCurrentCell });
                }
            }
        }
        else if (cellType === 'header' && !isPrevious) {
            const rowKey = getFirstFocusableRowKey(root, tableId);
            if (rowKey != null) {
                newCurrentCell = { rowKey: rowKey, columnKey: columnKey, type: 'data' };
                onCurrentCellChanged({ value: newCurrentCell });
            }
            else if (hasNoDataCell(root, tableId)) {
                newCurrentCell = { type: 'noData' };
                onCurrentCellChanged({ value: newCurrentCell });
            }
            else if (hasFooterCells(root, tableId)) {
                newCurrentCell = { columnKey: initialCell.columnKey, type: 'footer' };
                onCurrentCellChanged({ value: newCurrentCell });
            }
        }
        else if (cellType === 'footer' && isPrevious) {
            const rowKey = getLastFocusableRowKey(root, tableId);
            if (rowKey != null) {
                newCurrentCell = { rowKey: rowKey, columnKey: columnKey, type: 'data' };
                onCurrentCellChanged({ value: newCurrentCell });
            }
            else if (hasNoDataCell(root, tableId)) {
                newCurrentCell = { type: 'noData' };
                onCurrentCellChanged({ value: newCurrentCell });
            }
            else {
                newCurrentCell = { columnKey: initialCell.columnKey, type: 'header' };
                onCurrentCellChanged({ value: newCurrentCell });
            }
        }
    }
    else {
        const newColumnKey = _getBoundaryColumnKey(columnsArray, true);
        if (isPrevious) {
            newCurrentCell = { columnKey: newColumnKey, type: 'header' };
            onCurrentCellChanged({ value: newCurrentCell });
        }
        else if (hasFooterCells(root, tableId)) {
            newCurrentCell = { columnKey: newColumnKey, type: 'footer' };
            onCurrentCellChanged({ value: newCurrentCell });
        }
    }
}
/**
 * Helper function to handle a 'PageUp' or 'PageDown' arrow key press.
 * PageUp - Moves to the same cell in the first visible row in the current viewport,
 * and scrolls the Table so it becomes the last visible row in the viewport when able.
 * PageDown - Moves to the same cell in the last visible row in the current viewport,
 * and scrolls the Table so it becomes the first visible row in the viewport when able.
 */
function handlePageRowGesture(root, tableId, columnsArray, sizingInfoRef, initialCell, onCurrentCellChanged, isPrevious, isRtl, fullColumnWidths) {
    const rowElements = root.querySelectorAll(`[data-oj-table-data-row='${tableId}']`);
    if (rowElements.length > 0) {
        const verticalScrollPosition = getVerticalScrollPosition(root, tableId);
        const verticalRowIndex = getRowIndexForRowKey(root, tableId, verticalScrollPosition.rowKey);
        let targetRowIndex;
        if (isPrevious) {
            if (verticalScrollPosition.offsetY === 0) {
                targetRowIndex = Math.max(verticalRowIndex - 1, 0);
            }
            else {
                targetRowIndex = verticalRowIndex;
            }
        }
        else {
            const scrollerRect = root.getBoundingClientRect();
            const scrollbarHeight = sizingInfoRef.current.boxHeight - sizingInfoRef.current.contentHeight;
            const scrollerBottom = scrollerRect.bottom + getScrollerBottomOffset(root, tableId) + scrollbarHeight;
            targetRowIndex = verticalRowIndex;
            while (rowElements.length > targetRowIndex + 1) {
                targetRowIndex += 1;
                const elementBottom = rowElements[targetRowIndex].getBoundingClientRect().bottom;
                if (elementBottom > scrollerBottom) {
                    break;
                }
            }
        }
        const newRowKey = getRowKeyForRowIndex(root, tableId, targetRowIndex);
        if (newRowKey != null) {
            const newCurrentCell = {
                rowKey: newRowKey,
                columnKey: initialCell.columnKey,
                type: 'data'
            };
            if (newRowKey !== initialCell.rowKey) {
                onCurrentCellChanged({ value: newCurrentCell });
            }
            applyScrollDetail(root, tableId, columnsArray, sizingInfoRef.current, { cell: newCurrentCell, locationX: 'inView', locationY: isPrevious ? 'bottom' : 'top' }, isRtl, fullColumnWidths);
        }
    }
}
/**
 * Helper function to get the column key next to the given column key in the specified direction. Returns
 * null if there is no adjacent column in the direction specified.
 */
function _getAdjacentColumnKey(initialKey, columnsArray, isPrevious) {
    let currentIndex = -1;
    const columnsCount = columnsArray.length;
    for (let i = 0; i < columnsCount; i++) {
        if (columnsArray[i].key === initialKey) {
            currentIndex = i;
            break;
        }
    }
    if (isPrevious && currentIndex !== 0) {
        return columnsArray[currentIndex - 1].key;
    }
    else if (!isPrevious && currentIndex !== columnsCount - 1) {
        return columnsArray[currentIndex + 1].key;
    }
    return null;
}
/**
 * Helper function to handle a 'Previous' or 'Next' arrow key press.
 * Previous - Moves to the previous cell in the current row. No op if already on the first cell in that row.
 * Next - Moves to the next cell in the current row. No op if already on the last cell in that row.
 */
function handleAdjacentColumnGesture(columnsArray, initialCell, onCurrentCellChanged, isPrevious) {
    let newCurrentCell;
    const cellType = initialCell.type;
    if (cellType !== 'noData') {
        const initialKey = initialCell.columnKey;
        const newKey = _getAdjacentColumnKey(initialKey, columnsArray, isPrevious);
        if (newKey != null) {
            if (cellType === 'data') {
                newCurrentCell = { rowKey: initialCell.rowKey, columnKey: newKey, type: cellType };
                onCurrentCellChanged({ value: newCurrentCell });
            }
            else {
                newCurrentCell = { columnKey: newKey, type: cellType };
                onCurrentCellChanged({ value: newCurrentCell });
            }
        }
    }
}
/**
 * Helper function to get the first or last column key.
 */
function _getBoundaryColumnKey(columnsArray, isFirst) {
    if (isFirst) {
        return columnsArray[0].key;
    }
    return columnsArray[columnsArray.length - 1].key;
}
/**
 * Helper function to handle a 'Home' or 'End' key press.
 * Home - Jumps to the first cell in the current row. No op if already on the first cell in that row.
 * Ctrl/Cmd + Home - Jumps to the first cell in the first data row. If no data rows are present,
 * jumps to the first cell in the current region (header or footer). No op if already on that cell.
 * End - Jumps to the last cell in the current row. No op if already on the last cell in that row.
 * Ctrl/Cmd + End - Jumps to the last cell in the last data row. If no data rows are present,
 * jumps to the last cell in the current region (header or footer). No op if already on that cell.
 */
function handleJumpColumnGesture(root, tableId, columnsArray, initialCell, onCurrentCellChanged, isPrevious, includeRows) {
    let newCurrentCell;
    const cellType = initialCell.type;
    if (cellType !== 'noData') {
        const initialKey = initialCell.columnKey;
        const newKey = _getBoundaryColumnKey(columnsArray, isPrevious);
        if (includeRows) {
            if (hasNoDataCell(root, tableId)) {
                newCurrentCell = {
                    type: 'noData'
                };
                if (!cellComparator(newCurrentCell, initialCell)) {
                    onCurrentCellChanged({ value: newCurrentCell });
                }
            }
            else {
                const newRowKey = isPrevious
                    ? getFirstFocusableRowKey(root, tableId)
                    : getLastFocusableRowKey(root, tableId);
                if (newRowKey != null) {
                    newCurrentCell = {
                        rowKey: newRowKey,
                        columnKey: newKey,
                        type: 'data'
                    };
                    if (!cellComparator(newCurrentCell, initialCell)) {
                        onCurrentCellChanged({ value: newCurrentCell });
                    }
                }
            }
        }
        else if (newKey !== initialKey) {
            if (cellType === 'data') {
                newCurrentCell = { rowKey: initialCell.rowKey, columnKey: newKey, type: cellType };
                onCurrentCellChanged({ value: newCurrentCell });
            }
            else {
                newCurrentCell = { columnKey: newKey, type: cellType };
                onCurrentCellChanged({ value: newCurrentCell });
            }
        }
    }
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
// constant timeout values for delays following a input gesture until enabling focus rings
const MOUSE_FOCUS_SHIFT_TIMEOUT = 0;
const TOUCH_FOCUS_SHIFT_TIMEOUT = 200;
// constant event.key values that trigger focus ring and 'scroll to current' logic
const NAVIGATION_KEYS = [
    ' ',
    'F2',
    'Enter',
    'Esc', // Firefox 36 and earlier uses 'Esc' instead of 'Escape'
    'Escape',
    'ArrowLeft',
    'ArrowUp',
    'ArrowRight',
    'ArrowDown',
    'Home',
    'End',
    'PageUp',
    'PageDown'
];
/**
 * Hook that manages focus interactions on the Preact Table
 */
function useFocusHandling({ outerTableRef, tableId, isRtl, columnsArray, sizingInfoRef, selectionExtensionElementRef, cellSupportsTabbable, fullColumnWidths, currentCellOverride, onPersistCurrentCell }) {
    // tracks whether the most recent 'blur' was caused by focus being lost by the browser window (or iframe)
    const blurFromWindowRef = useRef(false);
    // tracks focus loss during render cycle for potential focus recapture cases
    const isRenderCycle = useRef(true);
    isRenderCycle.current = true;
    const blurredRenderCycleElementRef = useRef(null);
    // track current 'focus info' state
    const hasFocusRef = useRef(false);
    const [isTabbableMode, setIsTabbableMode] = useState(false);
    const [isShowFocusRing, setIsShowFocusRing] = useState(false);
    // track pointer down information
    const recentPointerRef = useRef(false);
    const pointerTimerRef = useRef(null);
    const isShowFocusRingOverrideRef = useRef(null);
    // tracks the current cell information
    const [currentCell, setCurrentCell] = useState(currentCellOverride);
    const currentCellRef = useRef(currentCellOverride);
    // tracks whether the table is handling a tab gesture that should allow focus to leave the table
    const [isTabbing, setIsTabbing] = useState(false);
    // intercept onPersistCurrentCell calls to ensure internal state is updated appropriately
    const onCurrentCellChanged = useMemo(() => {
        return (detail) => {
            setCurrentCell(detail.value);
            currentCellRef.current = detail.value;
            selectionExtensionElementRef.current = undefined;
            if (onPersistCurrentCell != null) {
                onPersistCurrentCell(detail);
            }
        };
    }, [onPersistCurrentCell, selectionExtensionElementRef]);
    // ensure any new currentCellOverride settings are applied only on that render
    const currentCellOverrideRef = useRef(currentCellOverride);
    if (currentCellOverrideRef.current !== currentCellOverride) {
        currentCellOverrideRef.current = currentCellOverride;
        if (!cellComparator(currentCell, currentCellOverride)) {
            onCurrentCellChanged({ value: currentCellOverride });
        }
    }
    // Helper function to set the Table's focus tracking state to reflect that it is inactive.
    const _setAsInactive = useCallback(() => {
        hasFocusRef.current = false;
        setIsTabbableMode(false);
        setIsShowFocusRing(false);
    }, []);
    // Helper function to set the Table's focus tracking state to reflect that on of its cell has focus.
    const _enableNavigationMode = useCallback((cell, skipScrollCellIntoView) => {
        const rootElement = outerTableRef.current;
        if (rootElement != null) {
            setIsTabbableMode(false);
            setIsShowFocusRing(isShowFocusRingOverrideRef.current !== null
                ? isShowFocusRingOverrideRef.current
                : !recentPointerRef.current);
            if (!recentPointerRef.current && !skipScrollCellIntoView) {
                applyScrollDetail(rootElement, tableId, columnsArray, sizingInfoRef.current, { cell: cell, locationX: 'inView', locationY: 'inView' }, isRtl, fullColumnWidths);
            }
            if (!cellComparator(cell, currentCell)) {
                onCurrentCellChanged({ value: cell });
            }
        }
    }, [
        outerTableRef,
        tableId,
        columnsArray,
        sizingInfoRef,
        isRtl,
        currentCell,
        onCurrentCellChanged,
        fullColumnWidths
    ]);
    // Helper function to set the Table's focus tracking state to reflect that it is tabbable.
    const _enableTabbableMode = useCallback((cell, isKeyboard, skipScrollCellIntoView) => {
        const rootElement = outerTableRef.current;
        if (rootElement != null) {
            setIsTabbableMode(true);
            if (!isKeyboard) {
                setIsShowFocusRing(false);
                if (!cellComparator(cell, currentCell)) {
                    onCurrentCellChanged({ value: cell });
                }
                if (!recentPointerRef.current && !skipScrollCellIntoView) {
                    applyScrollDetail(rootElement, tableId, columnsArray, sizingInfoRef.current, { cell: cell, locationX: 'inView', locationY: 'inView' }, isRtl, fullColumnWidths);
                }
            }
        }
    }, [
        outerTableRef,
        tableId,
        columnsArray,
        sizingInfoRef,
        isRtl,
        currentCell,
        onCurrentCellChanged,
        fullColumnWidths
    ]);
    // Helper function to set the Table's focus tracking state to reflect that a user has
    // exited tabbable mode via the keyboard (esc or 'F2')
    const _disableTabbableMode = useCallback((cell) => {
        const rootElement = outerTableRef.current;
        if (rootElement != null) {
            setIsTabbableMode(false);
            const currentCellElement = getElementFromCell(rootElement, tableId, cell);
            if (currentCellElement != null) {
                currentCellElement.focus({ preventScroll: true });
            }
            else {
                rootElement.focus({ preventScroll: true });
            }
        }
    }, [outerTableRef, tableId]);
    // PointerDown handler for the outer Table. Focus transfers that occur following a pointerdown
    // on desktop devices should not result in a focus ring being shown on the focused element
    const _pointerDownHandler = useCallback((event) => {
        if (event.pointerType !== 'touch') {
            if (pointerTimerRef.current != null) {
                clearTimeout(pointerTimerRef.current);
            }
            recentPointerRef.current = true;
            pointerTimerRef.current = setTimeout(() => {
                recentPointerRef.current = false;
                if (isShowFocusRing) {
                    setIsShowFocusRing(false);
                }
            }, MOUSE_FOCUS_SHIFT_TIMEOUT);
        }
    }, [isShowFocusRing]);
    // TouchEnd handler for the outer Table. Focus transfers that occur following a touchend
    // on touch devices should not result in a focus ring being shown on the focused element
    const _touchEndHandler = useCallback(() => {
        if (pointerTimerRef.current != null) {
            clearTimeout(pointerTimerRef.current);
        }
        recentPointerRef.current = true;
        pointerTimerRef.current = setTimeout(() => {
            recentPointerRef.current = false;
            if (isShowFocusRing) {
                setIsShowFocusRing(false);
            }
        }, TOUCH_FOCUS_SHIFT_TIMEOUT);
    }, [isShowFocusRing]);
    // Focus handler for the outer Table. On focus, a focusable area needs to be 'current'.
    // If a 'current' area already exists, nothing further is needed. Otherwise, the first
    // focusable element should be made 'current'.
    const _onFocusHandler = useCallback((event) => {
        hasFocusRef.current = true;
        const rootElement = outerTableRef.current;
        if (rootElement != null) {
            // don't scroll current into view if previous blur was due to window focus loss
            const skipScrollCellIntoView = blurFromWindowRef.current;
            blurFromWindowRef.current = false;
            const targetElement = event.target;
            if (targetElement === rootElement) {
                // handle overall root element receiving focus
                const cell = currentCell != null
                    ? currentCell
                    : getFirstFocusableCell(rootElement, tableId);
                if (cell != null) {
                    _enableNavigationMode(cell, skipScrollCellIntoView);
                }
            }
            else {
                const cell = logicalCellExtractor(targetElement, tableId, `[data-oj-table-focusable='${tableId}']`);
                if (cell != null) {
                    if (getCellType(targetElement) != null) {
                        // handle individual focusable regions receiving focus
                        _enableNavigationMode(cell, skipScrollCellIntoView);
                    }
                    else {
                        _enableTabbableMode(cell, false, skipScrollCellIntoView);
                    }
                }
            }
        }
        if (pointerTimerRef.current != null) {
            clearTimeout(pointerTimerRef.current);
            pointerTimerRef.current = null;
        }
        recentPointerRef.current = false;
        isShowFocusRingOverrideRef.current = null;
    }, [outerTableRef, tableId, currentCell, _enableTabbableMode, _enableNavigationMode]);
    // Blur handler for the outer Table. When a blur is caused by the browser window itself
    // losing focus (changing tabs or leaving an iframe for example), an eventual re-focus due
    // to the window re-gaining focus needs to be handled differently (no auto-scroll mostly).
    const _onBlurHandler = useCallback((event) => {
        const rootElement = outerTableRef.current;
        if (rootElement != null) {
            if (event.target === document.activeElement) {
                // save focus ring state so it's set once focus comes back
                isShowFocusRingOverrideRef.current = isShowFocusRing;
            }
            const relatedTarget = event.relatedTarget;
            const isUnknownRelatedTarget = relatedTarget == null;
            blurFromWindowRef.current = isUnknownRelatedTarget;
            if (isUnknownRelatedTarget || !getElementContainsFunc(rootElement, true)(relatedTarget)) {
                _setAsInactive();
                if (isRenderCycle.current) {
                    // store element that loses focus during a render cycle for recapturing focus logic
                    blurredRenderCycleElementRef.current = event.target;
                }
            }
            setIsTabbing(false);
        }
    }, [outerTableRef, isShowFocusRing, _setAsInactive]);
    // KeyDown handler for the outer Table. This specific handler tracks 'focus' transfer keys
    // Esc, F2, Enter, and Tab. It also ensures the currentCell is scrolled into view on any key
    const _onKeyDownHandler = useCallback((event) => {
        const rootElement = outerTableRef.current;
        if (rootElement != null && currentCell != null) {
            if (cellSupportsTabbable(currentCell)) {
                if (event.key === 'F2') {
                    if (isTabbableMode) {
                        _disableTabbableMode(currentCell);
                    }
                    else {
                        _enableTabbableMode(currentCell, true);
                    }
                }
                else if (event.key === 'Esc' || event.key === 'Escape') {
                    // Firefox 36 and earlier uses 'Esc' instead of 'Escape'
                    _disableTabbableMode(currentCell);
                }
                else if (event.key === 'Enter' && !isTabbableMode) {
                    _enableTabbableMode(currentCell, true);
                }
            }
            if (NAVIGATION_KEYS.indexOf(event.key) > -1 && !isTabbableMode) {
                setIsShowFocusRing(true);
                applyScrollDetail(rootElement, tableId, columnsArray, sizingInfoRef.current, { cell: currentCell, locationX: 'inView', locationY: 'inView' }, isRtl, fullColumnWidths);
            }
        }
        if (event.key === 'Tab' && !isTabbableMode) {
            setIsTabbing(true);
        }
    }, [
        outerTableRef,
        tableId,
        columnsArray,
        sizingInfoRef,
        isRtl,
        isTabbableMode,
        currentCell,
        cellSupportsTabbable,
        fullColumnWidths,
        _enableTabbableMode,
        _disableTabbableMode
    ]);
    // Callback for the outer Table's FocusTracker usage.
    const onStartFocusTracking = useCallback((detail) => {
        const rootElement = outerTableRef.current;
        if (rootElement != null && currentCell != null) {
            handleEnterActionableMode(detail.hasFocusWithin && getCellType(detail.activeElement) == null, allTabbableElements(getElementFromCell(rootElement, tableId, currentCell)), (value) => {
                setIsTabbableMode(value != undefined);
            });
        }
    }, [outerTableRef, currentCell, tableId]);
    // Callback for the outer Table's FocusTracker usage.
    const onFocusStartEdge = useCallback((detail) => {
        handleWrapActionableFocus(true, detail.tabbableElements, (value) => {
            setIsTabbableMode(value != undefined);
        });
    }, []);
    // Callback for the outer Table's FocusTracker usage.
    const onFocusEndEdge = useCallback((detail) => {
        handleWrapActionableFocus(false, detail.tabbableElements, (value) => {
            setIsTabbableMode(value != undefined);
        });
    }, []);
    // Handle ensuring focus is properly set at the completion of every render cycle
    // NO DEPENDENCY ARRAY HERE TO ENSURE THIS RUNS ON EVERY RENDER CYCLE
    useEffect(() => {
        const blurredRenderCycleElement = blurredRenderCycleElementRef.current;
        blurredRenderCycleElementRef.current = null;
        isRenderCycle.current = false;
        const rootElement = outerTableRef.current;
        if (rootElement != null) {
            const activeElement = getActiveElement(rootElement);
            // if we were tracking focus during the render cycle, ensure we recapture focus if needed
            if (blurredRenderCycleElement != null &&
                !isTabbing &&
                activeElement === getBodyElement(rootElement) &&
                (!getElementContainsFunc(rootElement, true)(blurredRenderCycleElement) ||
                    !isTabbableElement(blurredRenderCycleElement, true))) {
                rootElement.focus({ preventScroll: true });
                return;
            }
            if (hasFocusRef.current &&
                currentCell != null &&
                !isTabbing &&
                cellComparator(currentCell, currentCellRef.current)) {
                // ensure real browser focus is on the correct cell element
                const currentCellElement = getElementFromCell(rootElement, tableId, currentCell);
                if (currentCellElement != null) {
                    // currentCell is valid, so set focus on it if needed
                    if ((!isTabbableMode && activeElement !== currentCellElement) ||
                        (isTabbableMode && !getElementContainsFunc(currentCellElement, true)(activeElement))) {
                        currentCellElement.focus({ preventScroll: true });
                    }
                }
                else {
                    // currentCell is not valid, so choose a new currentCell instead
                    const newCurrentCell = getFirstFocusableCell(rootElement, tableId);
                    if (newCurrentCell != null) {
                        onCurrentCellChanged({ value: newCurrentCell });
                    }
                }
            }
        }
    });
    return {
        focusHandlingProps: {
            onPointerDown: _pointerDownHandler,
            onTouchEnd: _touchEndHandler,
            onFocus: _onFocusHandler,
            onBlur: _onBlurHandler,
            onKeyDown: _onKeyDownHandler,
            tabIndex: isTabbing ? -1 : 0
        },
        currentCell,
        onCurrentCellChanged,
        isShowFocusRing,
        isTabbableMode,
        onStartFocusTracking,
        onFocusStartEdge,
        onFocusEndEdge
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
 * Helper function to handle a row action gesture from a pointer or keyboard event
 */
function handleRowActionGesture(root, tableId, data, onRowAction, targetElement, targetCell) {
    let rowKey;
    let rowElement;
    if (targetCell?.type === 'data') {
        rowKey = targetCell.rowKey;
        const targetCellElement = getElementFromCell(root, tableId, targetCell);
        if (targetCellElement != null) {
            rowElement = targetCellElement.parentElement;
        }
    }
    else {
        rowKey = keyExtractor(targetElement, `[data-oj-table-data-row='${tableId}']`);
        if (rowKey != null) {
            rowElement = targetElement.closest(`[data-oj-table-data-row='${tableId}']`);
        }
    }
    if (rowKey != null && rowElement != null) {
        const rowIndex = getRowIndexForRowElement(root, tableId, rowElement);
        if (rowIndex != null) {
            const rowContext = {
                key: rowKey,
                data: data[rowIndex]
            };
            onRowAction({ context: rowContext, target: targetElement });
            return true;
        }
    }
    return false;
}
/**
 * Helper function to handle a row action gesture
 */
function handleSortActionGesture(columnsArray, columnKey, onSortCriterionChange, sortCriterion) {
    for (const column of columnsArray) {
        if (column.key === columnKey) {
            if (column.value.sortable === 'enabled') {
                let sortDirection;
                if (sortCriterion != null) {
                    for (const criterion of sortCriterion) {
                        if (criterion.key === column.key) {
                            sortDirection = criterion.sortDirection;
                            break;
                        }
                    }
                }
                const newDirection = sortDirection === 'ascending' ? 'descending' : 'ascending';
                onSortCriterionChange([{ key: columnKey, sortDirection: newDirection }]);
                return true;
            }
            break;
        }
    }
    return false;
}

/**
 * Helper function to handle a selection gesture (click, spacebar, etc...)
 */
function handleSelectionGesture(root, tableId, columnsArray, targetElement, isMultiSelectGesture, onSelectionChange, selectionMode, selected) {
    const emptyKeys = { all: false, keys: new Set() };
    let selectedRows = selected?.row != null ? selected.row : emptyKeys;
    let selectedColumns = selected?.column != null ? selected.column : emptyKeys;
    const newRowKey = keyExtractor(targetElement, `[data-oj-table-data-row='${tableId}']`);
    if (newRowKey != null) {
        if (selectionMode?.row === 'single' || selectionMode?.row === 'multiple') {
            if (selectedRows == null) {
                selectedRows = { all: false, keys: new Set([newRowKey]) };
            }
            else if (!containsKey(selectedRows, newRowKey)) {
                if (isMultiSelectGesture && selectionMode.row === 'multiple') {
                    selectedRows = addKey(selectedRows, newRowKey);
                }
                else {
                    selectedRows = { all: false, keys: new Set([newRowKey]) };
                }
            }
            else if (isMultiSelectGesture) {
                selectedRows = removeKey(selectedRows, newRowKey, false);
            }
            else {
                selectedRows = { all: false, keys: new Set([newRowKey]) };
            }
            selectedColumns = emptyKeys;
        }
    }
    else if (selectionMode?.column === 'single' || selectionMode?.column === 'multiple') {
        const cellElement = targetElement.closest(`[data-oj-table-focusable='${tableId}']`);
        if (cellElement != null) {
            const cellType = getCellType(cellElement);
            if (cellType === 'header' || cellType === 'footer') {
                const index = getColumnIndexForHeaderFooterElement(root, tableId, cellElement, cellType === 'header');
                if (index != null) {
                    const column = columnsArray[index];
                    if (column.value.selectable !== 'disabled') {
                        if (selectedColumns == null) {
                            selectedColumns = { all: false, keys: new Set([column.key]) };
                        }
                        else if (!containsKey(selectedColumns, column.key)) {
                            if (isMultiSelectGesture && selectionMode.column === 'multiple') {
                                selectedColumns = addKey(selectedColumns, column.key);
                            }
                            else {
                                selectedColumns = { all: false, keys: new Set([column.key]) };
                            }
                        }
                        else if (isMultiSelectGesture) {
                            selectedColumns = removeKey(selectedColumns, column.key, false);
                        }
                        else {
                            selectedColumns = { all: false, keys: new Set([column.key]) };
                        }
                        selectedRows = emptyKeys;
                    }
                }
            }
        }
    }
    if (!isSameKey(selectedRows, selected?.row) || !isSameKey(selectedColumns, selected?.column)) {
        onSelectionChange({ value: { row: selectedRows, column: selectedColumns }, target: targetElement }, false);
    }
}
/**
 * Helper function to calculate and apply a new selection state corresponding to the range provided
 */
function _applyRangeSelection(root, tableId, columnsArray, targetElement, startIndex, endIndex, isRowGesture, onSelectionChange, selectionMode, selected) {
    const emptyKeys = { all: false, keys: new Set() };
    let selectedRows = selected?.row != null ? selected.row : emptyKeys;
    let selectedColumns = selected?.column != null ? selected.column : emptyKeys;
    if (isRowGesture) {
        selectedColumns = emptyKeys;
        if (selectionMode?.row === 'multiple') {
            selectedRows = emptyKeys;
            // selected rows should be added in the order that they are selected
            if (startIndex <= endIndex) {
                for (let i = startIndex; i <= endIndex; i++) {
                    const key = getRowKeyForRowIndex(root, tableId, i);
                    selectedRows = addKey(selectedRows, key);
                }
            }
            else {
                for (let i = startIndex; i >= endIndex; i--) {
                    const key = getRowKeyForRowIndex(root, tableId, i);
                    selectedRows = addKey(selectedRows, key);
                }
            }
        }
    }
    else {
        selectedRows = emptyKeys;
        if (selectionMode?.column === 'multiple') {
            selectedColumns = emptyKeys;
            // selected columns should be added in the order that they are selected
            if (startIndex <= endIndex) {
                for (let i = startIndex; i <= endIndex; i++) {
                    const column = columnsArray[i];
                    if (column.value.selectable !== 'disabled') {
                        selectedColumns = addKey(selectedColumns, column.key);
                    }
                }
            }
            else {
                for (let i = startIndex; i >= endIndex; i--) {
                    const column = columnsArray[i];
                    if (column.value.selectable !== 'disabled') {
                        selectedColumns = addKey(selectedColumns, column.key);
                    }
                }
            }
        }
    }
    if (!isSameKey(selectedRows, selected?.row) || !isSameKey(selectedColumns, selected?.column)) {
        onSelectionChange({ value: { row: selectedRows, column: selectedColumns }, target: targetElement }, true);
    }
}
/**
 * Determines whether a potential range selection gesture is valid based on the given target
 */
function isRangeSelectionGesture(root, tableId, targetElement, currentCell, selectionMode) {
    const targetCell = logicalCellExtractor(targetElement, tableId, `[data-oj-table-focusable='${tableId}']`);
    if (((selectionMode?.row === 'multiple' && currentCell.type === 'data') ||
        (selectionMode?.column === 'multiple' &&
            (currentCell.type === 'header' || currentCell.type === 'footer'))) &&
        targetCell?.type === currentCell.type) {
        const currentCellElement = getElementFromCell(root, tableId, currentCell);
        const targetCellElement = getElementFromCell(root, tableId, targetCell);
        if (currentCellElement != null && targetCellElement != null) {
            const isRow = targetCell?.type === 'data';
            if (isRow) {
                return (getRowIndexForRowElement(root, tableId, currentCellElement.parentElement) != null &&
                    getRowIndexForRowElement(root, tableId, targetCellElement.parentElement) !=
                        null);
            }
            else if (targetCell?.type === 'header' || targetCell?.type === 'footer') {
                const isHeader = targetCell?.type === 'header';
                return (getColumnIndexForHeaderFooterElement(root, tableId, currentCellElement, isHeader) !=
                    null &&
                    getColumnIndexForHeaderFooterElement(root, tableId, targetCellElement, isHeader) != null);
            }
        }
    }
    return false;
}
/**
 * Helper function to handle a range selection gesture (shift+click)
 */
function handleRangeSelectionGesture(root, tableId, columnsArray, targetElement, currentCell, selectionExtensionElementRef, onSelectionChange, selectionMode, selected) {
    const targetCell = logicalCellExtractor(targetElement, tableId, `[data-oj-table-focusable='${tableId}']`);
    const currentCellElement = getElementFromCell(root, tableId, currentCell);
    const targetCellElement = getElementFromCell(root, tableId, targetCell);
    if (currentCellElement != null && targetCellElement != null) {
        if (((selectionMode?.row === 'multiple' && targetCell?.type === 'data') ||
            (selectionMode?.column === 'multiple' &&
                (targetCell?.type === 'header' || targetCell?.type === 'footer'))) &&
            targetCell?.type === currentCell.type) {
            let startIndex;
            let endIndex;
            let endElement;
            const isRow = targetCell?.type === 'data';
            if (isRow) {
                endElement = targetCellElement.parentElement;
                startIndex = getRowIndexForRowElement(root, tableId, currentCellElement.parentElement);
                endIndex = getRowIndexForRowElement(root, tableId, endElement);
            }
            else if (targetCell?.type === 'header' || targetCell?.type === 'footer') {
                const isHeader = targetCell?.type === 'header';
                endElement = targetCellElement;
                startIndex = getColumnIndexForHeaderFooterElement(root, tableId, currentCellElement, isHeader);
                endIndex = getColumnIndexForHeaderFooterElement(root, tableId, targetCellElement, isHeader);
            }
            if (startIndex != null && endIndex != null) {
                selectionExtensionElementRef.current = endElement;
                _applyRangeSelection(root, tableId, columnsArray, targetElement, startIndex, endIndex, isRow, onSelectionChange, selectionMode, selected);
                return true;
            }
        }
    }
    return false;
}
/**
 * Helper function to handle a selection extension gesture (shift+arrow key)
 */
function handleExtendSelectionGesture(root, tableId, columnsArray, sizingInfoRef, targetElement, isPrevious, currentCell, selectionExtensionElementRef, onSelectionChange, isRtl, fullColumnWidths, selectionMode, selected) {
    const currentCellElement = getElementFromCell(root, tableId, currentCell);
    if (currentCellElement != null) {
        let startIndex;
        let startElement;
        const isRow = currentCell.type === 'data';
        const isHeader = currentCell.type === 'header';
        if (isRow) {
            startElement = currentCellElement.parentElement;
            startIndex = getRowIndexForRowElement(root, tableId, startElement);
        }
        else {
            startElement = currentCellElement;
            startIndex = getColumnIndexForHeaderFooterElement(root, tableId, startElement, isHeader);
        }
        if (startIndex != null) {
            let endIndex;
            let extendedElement;
            const cursorElement = selectionExtensionElementRef.current;
            if (cursorElement != null) {
                extendedElement = isPrevious
                    ? cursorElement.previousElementSibling
                    : cursorElement.nextElementSibling;
                if (extendedElement != null) {
                    selectionExtensionElementRef.current = extendedElement;
                    endIndex = isRow
                        ? getRowIndexForRowElement(root, tableId, extendedElement)
                        : getColumnIndexForHeaderFooterElement(root, tableId, extendedElement, isHeader);
                }
                else {
                    endIndex = isRow
                        ? getRowIndexForRowElement(root, tableId, cursorElement)
                        : getColumnIndexForHeaderFooterElement(root, tableId, cursorElement, isHeader);
                }
            }
            else {
                extendedElement = isPrevious
                    ? startElement.previousElementSibling
                    : startElement.nextElementSibling;
                if (extendedElement != null) {
                    selectionExtensionElementRef.current = extendedElement;
                    endIndex = isRow
                        ? getRowIndexForRowElement(root, tableId, extendedElement)
                        : getColumnIndexForHeaderFooterElement(root, tableId, extendedElement, isHeader);
                }
                else {
                    endIndex = startIndex;
                }
            }
            if (endIndex != null) {
                _applyRangeSelection(root, tableId, columnsArray, targetElement, startIndex, endIndex, isRow, onSelectionChange, selectionMode, selected);
            }
            // scroll 'extensionElement' into view
            const extensionElement = selectionExtensionElementRef.current != null
                ? selectionExtensionElementRef.current
                : currentCellElement;
            let extensionCell;
            if (isRow) {
                const rowKey = keyExtractor(extensionElement, `[data-oj-table-data-row='${tableId}']`);
                extensionCell = {
                    type: currentCell.type,
                    rowKey: rowKey,
                    columnKey: currentCell.columnKey
                };
            }
            else {
                extensionCell = logicalCellExtractor(extensionElement, tableId, `[data-oj-table-focusable='${tableId}']`);
            }
            applyScrollDetail(root, tableId, columnsArray, sizingInfoRef.current, { cell: extensionCell, locationX: 'inView', locationY: 'inView' }, isRtl, fullColumnWidths);
        }
    }
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that manages keyboard interactions on the Preact Table
 */
function useKeyboardHandling({ outerTableRef, tableId, data, isRtl, isTabbableMode, columnsArray, sizingInfoRef, selectionExtensionElementRef, fullColumnWidths, currentCell, onCurrentCellChanged, selectionMode, selected, onTableSelectionChange, onRowAction, sortCriterion, onSortCriterionChange }) {
    // Keydown handler for the outer Table. This handles all internal
    // keyboard navigation for the Table.
    const _keyDownHandler = useCallback((event) => {
        const platform = getClientHints().platform;
        const keyHandlers = {
            ' ': function (root) {
                if (outerTableRef.current != null) {
                    if (currentCell != null) {
                        if (!isTabbableMode) {
                            if (onTableSelectionChange != null) {
                                handleSelectionGesture(outerTableRef.current, tableId, columnsArray, getElementFromCell(root, tableId, currentCell), true, onTableSelectionChange, selectionMode, selected);
                            }
                            event.preventDefault();
                        }
                        if (onRowAction != null &&
                            data != null &&
                            handleRowActionGesture(outerTableRef.current, tableId, data, onRowAction, event.target, currentCell)) {
                            event.stopPropagation();
                        }
                    }
                }
            },
            Enter: function () {
                if (outerTableRef.current != null) {
                    if (currentCell != null) {
                        if (onRowAction != null &&
                            data != null &&
                            currentCell.type === 'data' &&
                            handleRowActionGesture(outerTableRef.current, tableId, data, onRowAction, event.target, currentCell)) {
                            event.stopPropagation();
                        }
                        else if (!isTabbableMode &&
                            onSortCriterionChange != null &&
                            currentCell.type === 'header' &&
                            handleSortActionGesture(columnsArray, currentCell.columnKey, onSortCriterionChange, sortCriterion)) {
                            event.stopPropagation();
                        }
                    }
                }
            },
            ArrowUp: function (root) {
                if (outerTableRef.current != null) {
                    if (!isTabbableMode && currentCell != null) {
                        if (currentCell.type === 'data' &&
                            event.shiftKey &&
                            onTableSelectionChange != null &&
                            selectionMode?.row === 'multiple') {
                            handleExtendSelectionGesture(outerTableRef.current, tableId, columnsArray, sizingInfoRef, root, true, currentCell, selectionExtensionElementRef, onTableSelectionChange, isRtl, fullColumnWidths, selectionMode, selected);
                        }
                        else {
                            handleAdjacentRowGesture(root, tableId, columnsArray, currentCell, onCurrentCellChanged, true);
                        }
                        event.preventDefault();
                    }
                }
            },
            ArrowDown: function (root) {
                if (outerTableRef.current != null) {
                    if (!isTabbableMode && currentCell != null) {
                        if (currentCell.type === 'data' &&
                            event.shiftKey &&
                            onTableSelectionChange != null &&
                            selectionMode?.row === 'multiple') {
                            handleExtendSelectionGesture(outerTableRef.current, tableId, columnsArray, sizingInfoRef, root, false, currentCell, selectionExtensionElementRef, onTableSelectionChange, isRtl, fullColumnWidths, selectionMode, selected);
                        }
                        else {
                            handleAdjacentRowGesture(root, tableId, columnsArray, currentCell, onCurrentCellChanged, false);
                        }
                        event.preventDefault();
                    }
                }
            },
            ArrowLeft: function (root) {
                if (outerTableRef.current != null) {
                    if (!isTabbableMode && currentCell != null) {
                        if ((currentCell.type === 'header' || currentCell.type === 'footer') &&
                            event.shiftKey &&
                            onTableSelectionChange != null &&
                            selectionMode?.column === 'multiple') {
                            handleExtendSelectionGesture(outerTableRef.current, tableId, columnsArray, sizingInfoRef, root, true, currentCell, selectionExtensionElementRef, onTableSelectionChange, isRtl, fullColumnWidths, selectionMode, selected);
                        }
                        else {
                            handleAdjacentColumnGesture(columnsArray, currentCell, onCurrentCellChanged, !isRtl);
                        }
                        event.preventDefault();
                    }
                }
            },
            ArrowRight: function (root) {
                if (outerTableRef.current != null) {
                    if (!isTabbableMode && currentCell != null) {
                        if ((currentCell.type === 'header' || currentCell.type === 'footer') &&
                            event.shiftKey &&
                            onTableSelectionChange != null &&
                            selectionMode?.column === 'multiple') {
                            handleExtendSelectionGesture(outerTableRef.current, tableId, columnsArray, sizingInfoRef, root, false, currentCell, selectionExtensionElementRef, onTableSelectionChange, isRtl, fullColumnWidths, selectionMode, selected);
                        }
                        else {
                            handleAdjacentColumnGesture(columnsArray, currentCell, onCurrentCellChanged, isRtl);
                        }
                        event.preventDefault();
                    }
                }
            },
            PageUp: function (root) {
                if (!isTabbableMode && currentCell != null) {
                    handlePageRowGesture(root, tableId, columnsArray, sizingInfoRef, currentCell, onCurrentCellChanged, true, isRtl, fullColumnWidths);
                    event.preventDefault();
                }
            },
            PageDown: function (root) {
                if (!isTabbableMode && currentCell != null) {
                    handlePageRowGesture(root, tableId, columnsArray, sizingInfoRef, currentCell, onCurrentCellChanged, false, isRtl, fullColumnWidths);
                    event.preventDefault();
                }
            },
            Home: function (root) {
                if (!isTabbableMode && currentCell != null) {
                    handleJumpColumnGesture(root, tableId, columnsArray, currentCell, onCurrentCellChanged, true, platform === 'mac' ? event.metaKey : event.ctrlKey);
                    event.preventDefault();
                }
            },
            End: function (root) {
                if (!isTabbableMode && currentCell != null) {
                    handleJumpColumnGesture(root, tableId, columnsArray, currentCell, onCurrentCellChanged, false, platform === 'mac' ? event.metaKey : event.ctrlKey);
                    event.preventDefault();
                }
            }
        };
        if (Object.keys(keyHandlers).includes(event.key) && outerTableRef.current != null) {
            keyHandlers[event.key](outerTableRef.current);
        }
    }, [
        outerTableRef,
        tableId,
        data,
        isRtl,
        isTabbableMode,
        columnsArray,
        sizingInfoRef,
        selectionExtensionElementRef,
        fullColumnWidths,
        currentCell,
        onCurrentCellChanged,
        selectionMode,
        selected,
        onTableSelectionChange,
        onRowAction,
        sortCriterion,
        onSortCriterionChange
    ]);
    return { onKeyDown: _keyDownHandler };
}

/**
 * Helper function to handle a hover over a resizable column region gesture.
 */
function handleOverResizeRegionGesture(root, tableId, event, columnsArray, resizeInfoRef, isRtl) {
    // handle hover feedback around potentially resizable columns
    _updateResizingState(root, tableId, event, columnsArray, resizeInfoRef, isRtl);
}
/**
 * Helper function to handle a column resize start gesture (pointer down).
 */
function handleColumnResizeStartGesture(root, tableId, event, columnsArray, appliedColumnWidths, resizeInfoRef, isRtl, fullColumnWidths, onColumnResizing) {
    if (fullColumnWidths != null) {
        if (resizeInfoRef.current.key == null) {
            _updateResizingState(root, tableId, event, columnsArray, resizeInfoRef, isRtl);
        }
        if (resizeInfoRef.current.key != null) {
            const innerTable = root.querySelector(`[data-oj-table-inner-table='${tableId}']`);
            if (innerTable != null) {
                const rect = innerTable.getBoundingClientRect();
                const pointerX = isRtl ? rect.right - event.clientX : event.clientX - rect.left;
                const resizeColumnWidths = [];
                for (let i = 0; i < fullColumnWidths.length; i++) {
                    const columnWidth = fullColumnWidths[i];
                    resizeColumnWidths.push(columnWidth);
                }
                resizeInfoRef.current = {
                    isResizing: true,
                    isResizeHover: true,
                    key: resizeInfoRef.current.key,
                    startX: pointerX,
                    delta: 0,
                    fullColumnWidths: resizeColumnWidths,
                    ignoreClick: resizeInfoRef.current.ignoreClick
                };
                if (onColumnResizing != null) {
                    onColumnResizing({
                        key: resizeInfoRef.current.key,
                        delta: 0,
                        allColumnWidths: appliedColumnWidths
                    });
                }
                return true;
            }
        }
    }
    return false;
}
/**
 * Helper function to ensure the resizing state is updated based on the latest pointer event.
 */
function _updateResizingState(root, tableId, event, columnsArray, resizeInfoRef, isRtl) {
    const headerRowElement = root.querySelector(`[data-oj-table-header-row='${tableId}']`);
    if (headerRowElement != null) {
        const headerElements = headerRowElement.querySelectorAll(`[data-oj-table-header-cell='${tableId}']`);
        if (getElementContainsFunc(headerRowElement)(event.target)) {
            let isResizeHover = false;
            for (let i = 0; i < headerElements.length; i++) {
                const headerElement = headerElements[i];
                const cellRect = headerElement.getBoundingClientRect();
                const endEdge = isRtl ? cellRect.left : cellRect.right;
                if (Math.abs(endEdge - event.pageX) <= 8) {
                    if (columnsArray[i].value.edgeResizable !== 'enabled') {
                        break;
                    }
                    // resize operation on end side of header cell
                    resizeInfoRef.current.key = columnsArray[i].key;
                    headerRowElement.style.cursor = 'col-resize';
                    isResizeHover = true;
                    resizeInfoRef.current.isResizeHover = true;
                }
            }
            if (!isResizeHover) {
                headerRowElement.style.cursor = '';
                resizeInfoRef.current.key = undefined;
                resizeInfoRef.current.isResizeHover = false;
            }
        }
        else {
            if (headerRowElement != null) {
                headerRowElement.style.cursor = '';
            }
            resizeInfoRef.current.key = undefined;
            resizeInfoRef.current.isResizeHover = false;
        }
    }
}
/**
 * Helper function to handle a pointer move gesture during a column resize.
 */
function handleColumnResizingGesture(root, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, fullColumnWidths, onColumnResizing) {
    if (resizeInfoRef.current.isResizing && fullColumnWidths != null) {
        const innerTable = root.querySelector(`[data-oj-table-inner-table='${tableId}']`);
        if (innerTable != null) {
            const rect = innerTable.getBoundingClientRect();
            const currentX = isRtl ? rect.right - event.clientX : event.clientX - rect.left;
            resizeInfoRef.current.delta = currentX - resizeInfoRef.current.startX;
            // handle resize move operation
            if (onColumnResizing != null) {
                onColumnResizing({
                    key: resizeInfoRef.current.key,
                    delta: resizeInfoRef.current.delta,
                    allColumnWidths: appliedColumnWidths
                });
            }
        }
    }
}
/**
 * Helper function to handle a column resize end gesture (pointer up).
 */
function handleColumnResizeEndGesture(root, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize) {
    if (resizeInfoRef.current.isResizing) {
        if (onColumnResize != null) {
            for (const columnWidth of resizeInfoRef.current.fullColumnWidths) {
            }
            const innerTable = root.querySelector(`[data-oj-table-inner-table='${tableId}']`);
            if (innerTable != null) {
                const rect = innerTable.getBoundingClientRect();
                const currentX = isRtl ? rect.right - event.clientX : event.clientX - rect.left;
                resizeInfoRef.current.delta = currentX - resizeInfoRef.current.startX;
                onColumnResize({
                    key: resizeInfoRef.current.key,
                    delta: resizeInfoRef.current.delta,
                    allColumnWidths: appliedColumnWidths
                });
            }
        }
    }
    resizeInfoRef.current = {
        isResizing: false,
        isResizeHover: resizeInfoRef.current.isResizeHover,
        ignoreClick: resizeInfoRef.current.ignoreClick
    };
}
/**
 * Helper function to handle the pointer leaving the entire Table when previously hovering
 * over a column resize region.
 */
function handleLeaveResizingGesture(root, tableId, resizeInfoRef) {
    if (!resizeInfoRef.current.isResizing) {
        const headerRowElement = root.querySelector(`[data-oj-table-header-row='${tableId}']`);
        if (headerRowElement != null) {
            headerRowElement.style.cursor = '';
        }
        resizeInfoRef.current.isResizeHover = false;
    }
}
/**
 * Helper function to handle a pointer entering the Table when it was previously handling
 * a column resize gesture.
 */
function handleEnterResizingGesture(root, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize) {
    // handle case where user was resizing, moved pointer out of the Table,
    // released the button, and has now entered the table once again
    if (resizeInfoRef.current.isResizing && event.buttons === 0) {
        handleColumnResizeEndGesture(root, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize);
    }
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that manages pointer interactions on the Preact Table
 */
function usePointerHandling({ outerTableRef, tableId, data, isRtl, columnsArray, appliedColumnWidths, resizeInfoRef, selectionExtensionElementRef, fullColumnWidths, onColumnResizing, onColumnResize, currentCell, selectionMode, selected, onTableSelectionChange, onRowAction }) {
    // tracks whether the most recent 'pointerdown' event was due to a touch gesture
    const selectionTouchRef = useRef(false);
    // Pointer move handler for the outer Table.
    const _pointerMoveHandler = useCallback((event) => {
        if (outerTableRef.current != null && onColumnResizing != null) {
            if (!resizeInfoRef.current.isResizing) {
                handleOverResizeRegionGesture(outerTableRef.current, tableId, event, columnsArray, resizeInfoRef, isRtl);
            }
            else {
                handleColumnResizingGesture(outerTableRef.current, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, fullColumnWidths, onColumnResizing);
            }
        }
    }, [
        outerTableRef,
        tableId,
        columnsArray,
        appliedColumnWidths,
        resizeInfoRef,
        isRtl,
        fullColumnWidths,
        onColumnResizing
    ]);
    // Pointer down handler for the outer Table. It ensures the area targeted is 'current'.
    // NOTE - This event handling is triggered prior to 'onFocus' handling and ensures the
    // 'pending current' area is set when an initial pointer interaction focuses the Table.
    const _pointerDownHandler = useCallback((event) => {
        if (outerTableRef.current != null) {
            selectionTouchRef.current = event.pointerType === 'touch';
            const targetElement = event.target;
            if (onTableSelectionChange != null &&
                currentCell != null &&
                event.shiftKey &&
                isRangeSelectionGesture(outerTableRef.current, tableId, targetElement, currentCell, selectionMode)) {
                // prevent focus change on selection extension gesture
                if (!getIsSelectionPending()) {
                    event.preventDefault();
                }
            }
            else if (handleColumnResizeStartGesture(outerTableRef.current, tableId, event, columnsArray, appliedColumnWidths, resizeInfoRef, isRtl, fullColumnWidths, onColumnResizing)) {
                // prevent focus change on column resize gesture
                event.preventDefault();
                resizeInfoRef.current.ignoreClick = true;
            }
        }
    }, [
        outerTableRef,
        tableId,
        columnsArray,
        appliedColumnWidths,
        resizeInfoRef,
        isRtl,
        currentCell,
        selectionMode,
        onTableSelectionChange,
        fullColumnWidths,
        onColumnResizing
    ]);
    // Pointer up handler for the outer Table.
    const _pointerUpHandler = useCallback((event) => {
        if (outerTableRef.current != null) {
            handleColumnResizeEndGesture(outerTableRef.current, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize);
        }
    }, [outerTableRef, tableId, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize]);
    // Pointer leave handler for the outer Table.
    const _pointerLeaveHandler = useCallback((_event) => {
        if (outerTableRef.current != null) {
            handleLeaveResizingGesture(outerTableRef.current, tableId, resizeInfoRef);
        }
    }, [outerTableRef, tableId, resizeInfoRef]);
    // Pointer leave handler for the outer Table.
    const _pointerEnterHandler = useCallback((event) => {
        if (outerTableRef.current != null) {
            handleEnterResizingGesture(outerTableRef.current, tableId, event, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize);
        }
    }, [outerTableRef, tableId, appliedColumnWidths, resizeInfoRef, isRtl, onColumnResize]);
    // Click handler for the outer Table. It ensures the Table's selection state is
    // updated to reflect the area targeted.
    const _clickHandler = useCallback((event) => {
        let isSelectionExtension = false;
        const platform = getClientHints().platform;
        const target = event.target;
        if (outerTableRef.current != null) {
            if (onTableSelectionChange != null &&
                !resizeInfoRef.current.ignoreClick &&
                !getIsSelectionPending()) {
                if (currentCell != null && event.shiftKey) {
                    isSelectionExtension = handleRangeSelectionGesture(outerTableRef.current, tableId, columnsArray, target, currentCell, selectionExtensionElementRef, onTableSelectionChange, selectionMode, selected);
                }
                if (!isSelectionExtension) {
                    handleSelectionGesture(outerTableRef.current, tableId, columnsArray, target, (platform === 'mac' ? event.metaKey : event.ctrlKey) || selectionTouchRef.current, onTableSelectionChange, selectionMode, selected);
                }
            }
            if (onRowAction != null &&
                data != null &&
                !getIsSelectionPending() &&
                handleRowActionGesture(outerTableRef.current, tableId, data, onRowAction, target)) {
                event.stopPropagation();
            }
        }
        resizeInfoRef.current.ignoreClick = false;
    }, [
        outerTableRef,
        tableId,
        columnsArray,
        data,
        resizeInfoRef,
        selectionExtensionElementRef,
        currentCell,
        selectionMode,
        selected,
        onTableSelectionChange,
        onRowAction
    ]);
    return {
        onPointerMove: _pointerMoveHandler,
        onPointerDown: _pointerDownHandler,
        onPointerUp: _pointerUpHandler,
        onPointerLeave: _pointerLeaveHandler,
        onPointerEnter: _pointerEnterHandler,
        onClick: _clickHandler
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
 * Hook that manages handling scroll events on the Preact Table
 */
function useScrollHandling({ outerTableRef, columnsArray, stickyEdgesState, setStickyEdgesState, fullColumnWidths }) {
    // Scroll hander for the outer Table. It ensures the Table's sticky edges are updated.
    const _scrollHandler = useCallback(() => {
        if (outerTableRef.current != null && fullColumnWidths != null) {
            updateStickyEdges(outerTableRef.current, columnsArray, fullColumnWidths, stickyEdgesState, setStickyEdgesState, outerTableRef.current.scrollLeft);
        }
    }, [outerTableRef, columnsArray, stickyEdgesState, setStickyEdgesState, fullColumnWidths]);
    return { onScroll: _scrollHandler };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that manages interactions and events on the Preact Table
 */
function useInteractionManager({ outerTableRef, tableId, data, isRtl, columnsArray, appliedColumnWidths, sizingInfoRef, resizeInfoRef, stickyEdgesState, setStickyEdgesState, cellHasRenderer, fullColumnWidths, onColumnResizing, onColumnResize, currentCellOverride, onPersistCurrentCell, selectionMode, selected, onSelectionChange, onRowAction, sortCriterion, onSortCriterionChange }) {
    // tracks the current selection extension element (if any)
    const selectionExtensionElementRef = useRef();
    // intercept onSelectionChange calls to ensure local selectionExtensionElementRef is cleared
    const onTableSelectionChange = useMemo(() => {
        return onSelectionChange != null
            ? (detail, isExtendableSelection) => {
                if (!isExtendableSelection) {
                    selectionExtensionElementRef.current = undefined;
                }
                onSelectionChange(detail);
            }
            : undefined;
    }, [onSelectionChange]);
    // setup focus tracking using the useFocusHandling hook
    const { focusHandlingProps, currentCell, onCurrentCellChanged, isShowFocusRing, isTabbableMode, onStartFocusTracking, onFocusStartEdge, onFocusEndEdge } = useFocusHandling({
        outerTableRef,
        tableId,
        columnsArray,
        sizingInfoRef,
        selectionExtensionElementRef,
        isRtl,
        cellSupportsTabbable: cellHasRenderer,
        fullColumnWidths,
        currentCellOverride,
        onPersistCurrentCell
    });
    const keyboardHandlingProps = useKeyboardHandling({
        outerTableRef,
        tableId,
        data,
        isRtl,
        isTabbableMode,
        columnsArray,
        sizingInfoRef,
        selectionExtensionElementRef,
        fullColumnWidths,
        currentCell,
        onCurrentCellChanged,
        selectionMode,
        selected,
        onTableSelectionChange,
        onRowAction,
        sortCriterion,
        onSortCriterionChange
    });
    const pointerHandlingProps = usePointerHandling({
        outerTableRef,
        tableId,
        data,
        isRtl,
        columnsArray,
        appliedColumnWidths,
        resizeInfoRef,
        selectionExtensionElementRef,
        fullColumnWidths,
        onColumnResizing,
        onColumnResize,
        currentCell,
        selectionMode,
        selected,
        onTableSelectionChange,
        onRowAction
    });
    const scrollHandlingProps = useScrollHandling({
        outerTableRef,
        columnsArray,
        stickyEdgesState,
        setStickyEdgesState,
        fullColumnWidths
    });
    const interactionManagerProps = mergeProps(focusHandlingProps, keyboardHandlingProps, pointerHandlingProps, scrollHandlingProps);
    return {
        interactionManagerProps,
        onTableSelectionChange,
        isShowFocusRing,
        isTabbableMode,
        currentCell,
        onStartFocusTracking,
        onFocusStartEdge,
        onFocusEndEdge
    };
}

/**
 * Helper method to extract the individual column widths of the Table
 * depending on its layout. With a 'fixed' layout, an initial 'availableWidth'
 * is required, while with a 'contents' layout, -1 can be provided as the
 * 'availableWidth' initially. This will trigger the layout logic to ensure
 * a non-contstrained Table width is supported, and is needed to match
 * current Redwood behaviors with a 'contents' layout.
 */
function getLayoutColumnWidths(outerTableElement, scrollbarWidth, tableId, isFixed, sampledColumnWidthsRef, availableWidth, columnsArray, staticColumnWidths) {
    if (isFixed) {
        return _getFixedLayoutColumnWidths(availableWidth, columnsArray, staticColumnWidths);
    }
    let newColumnWidths = _getContentsLayoutColumnWidths(outerTableElement, tableId, sampledColumnWidthsRef, availableWidth, columnsArray, staticColumnWidths);
    if (availableWidth === -1) {
        let totalWidth = 0;
        const widthsArray = [];
        for (let i = 0; i < columnsArray.length; i++) {
            const width = newColumnWidths[columnsArray[i].key];
            widthsArray.push(width);
            totalWidth += width;
        }
        // for content sizing, apply the new column widths immediately, and check to see
        // if all space is actually utilized - this supports no width constraint scenarios
        _udpateTableSizing(outerTableElement, tableId, widthsArray, totalWidth);
        availableWidth = outerTableElement.getBoundingClientRect().width - scrollbarWidth;
        if (Math.abs(totalWidth - availableWidth) > 0.005) {
            newColumnWidths = _getContentsLayoutColumnWidths(outerTableElement, tableId, sampledColumnWidthsRef, availableWidth, columnsArray, staticColumnWidths);
        }
    }
    return newColumnWidths;
}
/**
 * Helper method to extract the individual column widths of the Table
 * for a 'fixed' layout table that already has its root width applied.
 */
function _getFixedLayoutColumnWidths(availableWidth, columnsArray, staticColumnWidths) {
    const DEFAULT_COLUMN_WEIGHT = 1;
    const DEFAULT_COLUMN_MIN_WIDTH = 100;
    const DEFAULT_COLUMN_MAX_WIDTH = undefined;
    let requiresActiveSizing = false;
    let totalWorkingWeight = 0;
    let forcedTotalWidth = 0;
    let pendingTotalWidth = 0;
    const columnMaxWidthsArray = [];
    const columnWeightsArray = [];
    const forcedColumnWidthsArray = [];
    const newColumnWidthsArray = [];
    const appliedColumnWidthsArray = [];
    for (let i = 0; i < columnsArray.length; i++) {
        const column = columnsArray[i];
        let columnMinWidth = column.value.minWidth;
        if (columnMinWidth == null || columnMinWidth <= 0) {
            columnMinWidth = DEFAULT_COLUMN_MIN_WIDTH;
        }
        let columnMaxWidth = column.value.maxWidth;
        if (columnMaxWidth == null || columnMaxWidth < columnMinWidth) {
            columnMaxWidth = DEFAULT_COLUMN_MAX_WIDTH;
        }
        columnMaxWidthsArray.push(columnMaxWidth);
        let columnWeight = column.value.weight;
        if (columnWeight == null || columnWeight < 1) {
            columnWeight = DEFAULT_COLUMN_WEIGHT;
        }
        columnWeightsArray.push(columnWeight);
        const columnWidth = staticColumnWidths != null ? staticColumnWidths[column.key] : undefined;
        if (columnWidth != null) {
            forcedTotalWidth += columnWidth;
            pendingTotalWidth += columnWidth;
            forcedColumnWidthsArray.push(columnWidth);
            newColumnWidthsArray.push(columnWidth);
            appliedColumnWidthsArray.push(columnWidth);
        }
        else {
            requiresActiveSizing = true;
            pendingTotalWidth += columnMinWidth;
            totalWorkingWeight += columnWeight;
            forcedColumnWidthsArray.push(undefined);
            newColumnWidthsArray.push(columnMinWidth);
            appliedColumnWidthsArray.push(columnMinWidth);
        }
    }
    // enforce min and max rules if active sizing is required and available space remains
    if (requiresActiveSizing && pendingTotalWidth < availableWidth) {
        _enforceFixedMinMaxRules(columnsArray, availableWidth, totalWorkingWeight, forcedTotalWidth, forcedColumnWidthsArray, columnWeightsArray, columnMaxWidthsArray, newColumnWidthsArray, appliedColumnWidthsArray);
    }
    return _createColumnWidths(columnsArray, newColumnWidthsArray);
}
/**
 * Helper function to enforce all of the layout sizing rules on the Table's columns.
 */
function _enforceFixedMinMaxRules(columnsArray, availableWidth, totalWorkingWeight, forcedTotalWidth, forcedColumnWidthsArray, columnWeightsArray, columnMaxWidthsArray, newColumnWidthsArray, appliedColumnWidthsArray) {
    // try and honor the weights of each column combined with the min widths, and then check that against
    // any max widths once completed. if the final result doesn't fill the space AND at least 1 max width
    // rule was enforced, repeat the process until no max rules are enforced OR the space is filled.
    let isMaxRuleApplied = true;
    while (isMaxRuleApplied) {
        isMaxRuleApplied = false;
        _enforceWeightedMinRules(columnsArray, availableWidth, totalWorkingWeight, forcedTotalWidth, forcedColumnWidthsArray, columnWeightsArray, newColumnWidthsArray, appliedColumnWidthsArray);
        let pendingTotalWidth = 0;
        for (let i = 0; i < columnsArray.length; i++) {
            if (forcedColumnWidthsArray[i] == null) {
                const maxWidth = columnMaxWidthsArray[i];
                if (maxWidth != null && newColumnWidthsArray[i] > maxWidth) {
                    isMaxRuleApplied = true;
                    forcedColumnWidthsArray[i] = maxWidth;
                    forcedTotalWidth += maxWidth;
                    totalWorkingWeight -= columnWeightsArray[i];
                    newColumnWidthsArray[i] = maxWidth;
                    appliedColumnWidthsArray[i] = maxWidth;
                }
            }
            pendingTotalWidth += newColumnWidthsArray[i];
        }
        isMaxRuleApplied = isMaxRuleApplied && pendingTotalWidth < availableWidth;
    }
}
/**
 * Helper method to extract the individual column widths of the Table
 * for a 'contents' layout table that already has its root width applied.
 */
function _getContentsLayoutColumnWidths(outerTableElement, tableId, sampledColumnWidthsRef, availableWidth, columnsArray, staticColumnWidths) {
    const DEFAULT_COLUMN_MIN_WIDTH = undefined;
    const DEFAULT_COLUMN_MAX_WIDTH = undefined;
    let requiresActiveSizing = false;
    const columnMinWidthsArray = [];
    const columnMaxWidthsArray = [];
    const forcedColumnWidthsArray = [];
    const newColumnWidthsArray = [];
    for (let i = 0; i < columnsArray.length; i++) {
        const column = columnsArray[i];
        let columnMinWidth = column.value.minWidth;
        if (columnMinWidth == null || columnMinWidth <= 0) {
            columnMinWidth = DEFAULT_COLUMN_MIN_WIDTH;
        }
        columnMinWidthsArray.push(columnMinWidth);
        let columnMaxWidth = column.value.maxWidth;
        if (columnMaxWidth == null || columnMaxWidth < (columnMinWidth != null ? columnMinWidth : 0)) {
            columnMaxWidth = DEFAULT_COLUMN_MAX_WIDTH;
        }
        columnMaxWidthsArray.push(columnMaxWidth);
        const columnWidth = staticColumnWidths != null ? staticColumnWidths[column.key] : undefined;
        if (columnWidth != null) {
            forcedColumnWidthsArray.push(columnWidth);
            newColumnWidthsArray[i] = columnWidth;
        }
        else {
            requiresActiveSizing = true;
            forcedColumnWidthsArray.push(undefined);
        }
    }
    // short-circuit normal contents sizing if each column specifies a 'width' value
    if (requiresActiveSizing) {
        // if active sizing is required, update min width values to reflect actual widths
        // performance note - this should be the only logic that requires DOM measurements
        let forcedTotalWidth = 0;
        let pendingTotalWidth = 0;
        let totalPreferredWidth = 0;
        let totalWorkingWeight = 0;
        let totalRemainingWeight = 0;
        const sampledWidths = sampledColumnWidthsRef.current;
        const sampledMinWidthsArray = [];
        const sampledWeightWidthsArray = [];
        const appliedColumnWidthsArray = [];
        if (sampledWidths != null) {
            for (let i = 0; i < columnsArray.length; i++) {
                sampledMinWidthsArray.push(sampledWidths.minWidths[columnsArray[i].key]);
                sampledWeightWidthsArray.push(sampledWidths.weightWidths[columnsArray[i].key]);
            }
        }
        else {
            sampledColumnWidthsRef.current = {
                minWidths: {},
                weightWidths: {}
            };
            const headerElements = outerTableElement.querySelectorAll(`[data-oj-table-header-cell='${tableId}']`);
            // when sampledColumnWidths are not populated, content wrapping is disabled in the table
            // which allows for measurements to represent the column weights
            for (let i = 0; i < headerElements.length; i++) {
                const sampledWeightWidth = headerElements[i].getBoundingClientRect().width;
                sampledWeightWidthsArray.push(sampledWeightWidth);
                sampledColumnWidthsRef.current.weightWidths[columnsArray[i].key] = sampledWeightWidth;
            }
            // re-enable wrapping, allowing measurements to represent minimum auto-resizable column widths
            outerTableElement.classList.remove(tableStyles.disableWrapping);
            for (let i = 0; i < headerElements.length; i++) {
                const sampledMinWidth = headerElements[i].getBoundingClientRect().width;
                sampledMinWidthsArray.push(sampledMinWidth);
                sampledColumnWidthsRef.current.minWidths[columnsArray[i].key] = sampledMinWidth;
            }
        }
        for (let i = 0; i < sampledMinWidthsArray.length; i++) {
            const forcedWidth = forcedColumnWidthsArray[i];
            if (forcedWidth == null) {
                let columnWidth;
                const sampledMinWidth = sampledMinWidthsArray[i];
                const minWidth = columnMinWidthsArray[i];
                const maxWidth = columnMaxWidthsArray[i];
                if (minWidth != null && minWidth >= sampledMinWidth) {
                    columnWidth = minWidth;
                }
                else if (maxWidth != null && sampledMinWidth >= maxWidth) {
                    columnWidth = maxWidth;
                }
                else {
                    columnWidth = sampledMinWidth;
                }
                pendingTotalWidth += columnWidth;
                // replace sampled weight with min width if needed
                const columnWeight = minWidth != null && minWidth >= sampledWeightWidthsArray[i]
                    ? minWidth
                    : sampledWeightWidthsArray[i];
                sampledWeightWidthsArray[i] = columnWeight;
                totalPreferredWidth +=
                    maxWidth != null && maxWidth <= columnWeight ? maxWidth : columnWeight;
                totalWorkingWeight += columnWeight;
                totalRemainingWeight += columnWeight - columnWidth;
                // newColumnWidthsArray already has content, so update in place rather than 'push'
                newColumnWidthsArray[i] = columnWidth;
                appliedColumnWidthsArray.push(columnWidth);
            }
            else {
                forcedTotalWidth += forcedWidth;
                pendingTotalWidth += forcedWidth;
                totalPreferredWidth += forcedWidth;
                appliedColumnWidthsArray.push(forcedWidth);
            }
        }
        // special case for initial rendering where we don't know if overall width is constrained
        if (availableWidth === -1) {
            availableWidth = totalPreferredWidth;
        }
        if (pendingTotalWidth < availableWidth) {
            _enforceContentsMinMaxRules(columnsArray, availableWidth, totalPreferredWidth, totalRemainingWeight, totalWorkingWeight, pendingTotalWidth, forcedTotalWidth, forcedColumnWidthsArray, sampledWeightWidthsArray, columnMaxWidthsArray, newColumnWidthsArray, appliedColumnWidthsArray);
        }
    }
    return _createColumnWidths(columnsArray, newColumnWidthsArray);
}
/**
 * Helper function to enforce all of the layout sizing rules on the Table's columns.
 */
function _enforceContentsMinMaxRules(columnsArray, availableWidth, totalPreferredWidth, totalRemainingWeight, totalWorkingWeight, appliedPendingTotalWidth, forcedTotalWidth, forcedColumnWidthsArray, columnWeightsArray, columnMaxWidthsArray, newColumnWidthsArray, appliedColumnWidthsArray) {
    // try and honor the weights of each column combined with the min widths, and then check that against
    // any max widths once completed. if the final result doesn't fill the space AND at least 1 max width
    // rule was enforced, repeat the process until no max rules are enforced OR the space is filled.
    let isMaxRuleApplied = true;
    while (isMaxRuleApplied) {
        isMaxRuleApplied = false;
        if (totalPreferredWidth > availableWidth) {
            _enforceConstrainedWeightRules(columnsArray, availableWidth - appliedPendingTotalWidth, totalRemainingWeight, columnWeightsArray, forcedColumnWidthsArray, newColumnWidthsArray, appliedColumnWidthsArray);
        }
        else {
            _enforceWeightedMinRules(columnsArray, availableWidth, totalWorkingWeight, forcedTotalWidth, forcedColumnWidthsArray, columnWeightsArray, newColumnWidthsArray, appliedColumnWidthsArray);
        }
        let pendingTotalWidth = 0;
        for (let i = 0; i < columnsArray.length; i++) {
            if (forcedColumnWidthsArray[i] == null) {
                const maxWidth = columnMaxWidthsArray[i];
                if (maxWidth != null && newColumnWidthsArray[i] > maxWidth) {
                    isMaxRuleApplied = true;
                    forcedColumnWidthsArray[i] = maxWidth;
                    forcedTotalWidth += maxWidth;
                    appliedPendingTotalWidth += maxWidth - appliedColumnWidthsArray[i];
                    totalWorkingWeight -= columnWeightsArray[i];
                    newColumnWidthsArray[i] = maxWidth;
                    appliedColumnWidthsArray[i] = maxWidth;
                }
            }
            pendingTotalWidth += newColumnWidthsArray[i];
        }
        isMaxRuleApplied = isMaxRuleApplied && pendingTotalWidth < availableWidth;
    }
}
/**
 * Helper function to enforce constrained weights / min width rules on the Table's columns.
 */
function _enforceConstrainedWeightRules(columnsArray, initialExtraWidth, totalRemainingWeight, columnWeightsArray, forcedColumnWidthsArray, newColumnWidthsArray, appliedColumnWidthsArray) {
    if (initialExtraWidth > 0) {
        let availableWidth = initialExtraWidth;
        let currentWeightTotal = totalRemainingWeight;
        for (let i = 0; i < columnsArray.length; i++) {
            if (currentWeightTotal > 0 && forcedColumnWidthsArray[i] == null) {
                const currentWeight = columnWeightsArray[i] - appliedColumnWidthsArray[i];
                const weightWidth = (currentWeight / currentWeightTotal) * availableWidth;
                newColumnWidthsArray[i] = weightWidth + appliedColumnWidthsArray[i];
                availableWidth -= weightWidth;
                currentWeightTotal -= currentWeight;
            }
        }
    }
}
/**
 * Helper function to enforce the weights / min width rules on the Table's columns.
 */
function _enforceWeightedMinRules(columnsArray, availableWidth, totalWeight, forcedTotalWidth, forcedColumnWidthsArray, columnWeightsArray, newColumnWidthsArray, appliedColumnWidthsArray) {
    const pendingForcedColumnWidths = [];
    let isMinRuleApplied = true;
    while (isMinRuleApplied) {
        isMinRuleApplied = false;
        let currentWeightTotal = totalWeight;
        let widthDiff = availableWidth - forcedTotalWidth;
        if (widthDiff > 0) {
            for (let i = 0; i < columnsArray.length; i++) {
                if (currentWeightTotal > 0 &&
                    forcedColumnWidthsArray[i] == null &&
                    pendingForcedColumnWidths[i] == null) {
                    const currentWeight = columnWeightsArray[i];
                    const newWidth = (currentWeight / currentWeightTotal) * widthDiff;
                    // if calculated width breaks min width requirement, force min width as needed
                    const minWidth = appliedColumnWidthsArray[i];
                    if (newWidth < minWidth) {
                        // the preferred weighted size conflicts with the min size, so set pending to min size
                        pendingForcedColumnWidths[i] = minWidth;
                        forcedTotalWidth += minWidth;
                        newColumnWidthsArray[i] = minWidth;
                        isMinRuleApplied = true;
                        totalWeight -= currentWeight;
                        break;
                    }
                    newColumnWidthsArray[i] = newWidth;
                    widthDiff -= newWidth;
                    currentWeightTotal -= currentWeight;
                }
            }
        }
    }
}
/**
 * Helper function to create a ColumnWidths object from a TableColumn array and a widths array.
 */
function _createColumnWidths(columnsArray, columnWidthsArray) {
    const columnWidths = {};
    for (let i = 0; i < columnsArray.length; i++) {
        columnWidths[columnsArray[i].key] = columnWidthsArray[i];
    }
    return columnWidths;
}
/**
 * Helper method to apply the given sizing object to the currently rendered Table
 * and column elements.
 */
function _udpateTableSizing(root, tableId, widthsArray, totalWidth) {
    const tableCols = root.querySelectorAll(`[data-oj-table-col='${tableId}']`);
    for (let i = 0; i < tableCols.length; i++) {
        const tableCol = tableCols[i];
        tableCol.style.width = `${widthsArray[i]}px`;
    }
    const innerTableElem = root.querySelectorAll(`[data-oj-table-inner-table='${tableId}']`)[0];
    innerTableElem.style.width = `${totalWidth}px`;
    innerTableElem.style.tableLayout = 'fixed';
}

const _defaultSelected = {
    row: { all: false, keys: new Set() },
    column: { all: false, keys: new Set() }
};
/**
 * Component that renders items as a flat table.
 * In order to maximize performance, only items that are visible in the viewport are rendered.
 */
const Table = forwardRef(function Table({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, getAccessibleRowHeaders, columns, columnOrder, columnWidths, layout = 'contents', data, getRowKey, hasMore = false, onLoadMore = () => { }, currentCellOverride, onPersistCurrentCell, currentRowVariant, gridlines, selectionMode, selected = _defaultSelected, onSelectionChange, onRowAction, sortCriterion, onSortCriterionChange, horizontalScrollPositionOverride, verticalScrollPositionOverride, columnResizingIndicator, onColumnResizing, onColumnResize, noDataRenderer, testId }, ref) {
    const tableId = useId();
    const outerTableRef = useRef(null);
    const sizingInfoRef = useRef({ isInitialRender: true });
    const [appliedColumnWidths, setAppliedColumnWidths] = useState();
    const [contentHeight, setContentHeight] = useState();
    const isVerticalScrollRef = useRef(false);
    const sampledColumnWidthsRef = useRef();
    const horizontalScrollPositionOverrideRef = useRef();
    const verticalScrollPositionOverrideRef = useRef();
    const [stickyEdgesState, setStickyEdgesState] = useState({
        start: undefined,
        end: undefined
    });
    const resizeInfoRef = useRef({
        isResizing: false,
        isResizeHover: false,
        ignoreClick: false
    });
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const testIdProps = useTestId(testId);
    const columnsArray = useMemo(() => {
        const newColumnsArray = [];
        if (columnOrder != null) {
            for (const key of columnOrder) {
                if (columns[key] != null) {
                    newColumnsArray.push({
                        key: key,
                        value: columns[key]
                    });
                }
            }
        }
        else {
            for (const [key, value] of Object.entries(columns)) {
                newColumnsArray.push({
                    key: key,
                    value: value
                });
            }
        }
        return newColumnsArray;
    }, [columnOrder, columns]);
    let isLayoutRequired = false;
    const columnWidthsArray = [];
    if (appliedColumnWidths != null) {
        for (let i = 0; i < columnsArray.length; i++) {
            const key = columnsArray[i].key;
            const appliedWidth = appliedColumnWidths[key];
            const staticWidth = columnWidths != null ? columnWidths[key] : undefined;
            if (appliedWidth == null || (staticWidth != null && staticWidth !== appliedWidth)) {
                isLayoutRequired = true;
                break;
            }
            columnWidthsArray.push(appliedWidth);
        }
    }
    else {
        isLayoutRequired = true;
    }
    const layoutInfo = {
        isLayoutRequired: isLayoutRequired,
        columnWidthsArray: isLayoutRequired ? undefined : columnWidthsArray
    };
    useImperativeHandle(ref, () => {
        return {
            getHorizontalScrollPosition: () => {
                if (layoutInfo.isLayoutRequired) {
                    return {};
                }
                return getHorizontalScrollPosition(outerTableRef.current, columnsArray, layoutInfo.columnWidthsArray);
            },
            getVerticalScrollPosition: () => {
                if (layoutInfo.isLayoutRequired) {
                    return {};
                }
                return getVerticalScrollPosition(outerTableRef.current, tableId);
            }
        };
    }, [tableId, columnsArray, layoutInfo.isLayoutRequired, layoutInfo.columnWidthsArray]);
    const cellHasRenderer = useCallback((cell) => {
        let hasRenderer = false;
        if (cell.type === 'noData') {
            hasRenderer = noDataRenderer != null;
        }
        else {
            for (const column of columnsArray) {
                if (column.key === cell.columnKey) {
                    if (cell.type === 'data') {
                        hasRenderer = column.value.renderer != null;
                    }
                    else if (cell.type === 'header') {
                        hasRenderer = column.value.headerRenderer != null;
                    }
                    else if (cell.type === 'footer') {
                        hasRenderer = column.value.footerRenderer != null;
                    }
                    break;
                }
            }
        }
        return hasRenderer;
    }, [columnsArray, noDataRenderer]);
    const { interactionManagerProps, onTableSelectionChange, isShowFocusRing, isTabbableMode, currentCell, onStartFocusTracking, onFocusStartEdge, onFocusEndEdge } = useInteractionManager({
        outerTableRef,
        tableId,
        data,
        isRtl,
        columnsArray,
        appliedColumnWidths: appliedColumnWidths,
        sizingInfoRef,
        resizeInfoRef,
        stickyEdgesState,
        setStickyEdgesState,
        cellHasRenderer,
        fullColumnWidths: layoutInfo.isLayoutRequired ? undefined : layoutInfo.columnWidthsArray,
        onColumnResizing,
        onColumnResize,
        currentCellOverride,
        onPersistCurrentCell,
        selectionMode,
        selected,
        onSelectionChange,
        onRowAction,
        sortCriterion,
        onSortCriterionChange
    });
    // ensure sampled column sizes are cleared if 'columns' is updated
    useLayoutEffect(() => {
        sampledColumnWidthsRef.current = undefined;
        setAppliedColumnWidths(undefined);
    }, [columns]);
    // setup sizing calculation updates for subsequent renders
    useLayoutEffect(() => {
        const rootElement = outerTableRef.current;
        if (rootElement != null &&
            !sizingInfoRef.current.isInitialRender &&
            layoutInfo.isLayoutRequired &&
            sizingInfoRef.current.defaultScrollbarWidth != null) {
            const totalWidth = layout === 'fixed'
                ? sizingInfoRef.current.boxWidth - sizingInfoRef.current.defaultScrollbarWidth
                : -1;
            const newColumnWidths = getLayoutColumnWidths(rootElement, sizingInfoRef.current.defaultScrollbarWidth, tableId, layout === 'fixed', sampledColumnWidthsRef, totalWidth, columnsArray, columnWidths);
            setAppliedColumnWidths(newColumnWidths);
        }
    }, [tableId, columnsArray, columnWidths, layout, layoutInfo.isLayoutRequired]);
    // setup component resize-based sizing calculation updates
    const resizeObserverCallbackRef = useRef();
    resizeObserverCallbackRef.current = (entry) => {
        if (outerTableRef.current != null) {
            let availableWidth;
            let scrollbarWidth;
            const newContentWidth = entry.contentBoxSize[0].inlineSize;
            const newContentHeight = entry.contentBoxSize[0].blockSize;
            const newBoxWidth = entry.borderBoxSize[0].inlineSize;
            const newBoxHeight = entry.borderBoxSize[0].blockSize;
            if (newContentWidth !== 0 || newBoxWidth !== 0) {
                if (sizingInfoRef.current.isInitialRender) {
                    scrollbarWidth = newBoxWidth - newContentWidth;
                    availableWidth = layout === 'fixed' ? newContentWidth : -1;
                    sizingInfoRef.current = {
                        isInitialRender: false,
                        contentWidth: newContentWidth,
                        boxWidth: newBoxWidth,
                        contentHeight: newContentHeight,
                        boxHeight: newBoxHeight,
                        defaultScrollbarWidth: scrollbarWidth,
                        defaultScrollbarHeight: newBoxHeight - newContentHeight
                    };
                }
                else {
                    scrollbarWidth = sizingInfoRef.current.defaultScrollbarWidth;
                    availableWidth = isVerticalScrollRef.current
                        ? newContentWidth
                        : newBoxWidth - scrollbarWidth;
                    sizingInfoRef.current.contentWidth = newContentWidth;
                    sizingInfoRef.current.boxWidth = newBoxWidth;
                    sizingInfoRef.current.contentHeight = newContentHeight;
                    sizingInfoRef.current.boxHeight = newBoxHeight;
                }
                const newColumnWidths = getLayoutColumnWidths(outerTableRef.current, scrollbarWidth, tableId, layout === 'fixed', sampledColumnWidthsRef, availableWidth, columnsArray, columnWidths);
                setAppliedColumnWidths(newColumnWidths);
                if (contentHeight !== newContentHeight) {
                    setContentHeight(newContentHeight);
                }
            }
        }
    };
    // ensure resize observer callback function is static to avoid hook re-subscribing each render
    const staticResizeObserverCallback = useCallback((entry) => {
        resizeObserverCallbackRef.current(entry);
    }, []);
    useResizeObserver(outerTableRef, staticResizeObserverCallback);
    // after each additional render, update vertical scrollbar state if necessary
    useLayoutEffect(() => {
        const scrollbarWidth = sizingInfoRef.current.defaultScrollbarWidth;
        if (outerTableRef.current != null &&
            !sizingInfoRef.current.isInitialRender &&
            contentHeight != null &&
            scrollbarWidth != null) {
            const innerTable = outerTableRef.current.querySelector(`[data-oj-table-inner-table='${tableId}']`);
            if (innerTable != null) {
                const hasVerticalOverflow = contentHeight < innerTable.getBoundingClientRect().height;
                isVerticalScrollRef.current = hasVerticalOverflow;
                if (hasVerticalOverflow) {
                    outerTableRef.current.classList.remove(tableStyles.noVerticalScroll);
                    outerTableRef.current.classList.add(tableStyles.verticalScroll);
                    outerTableRef.current.style.paddingInlineEnd = '';
                }
                else {
                    outerTableRef.current.classList.remove(tableStyles.verticalScroll);
                    outerTableRef.current.classList.add(tableStyles.noVerticalScroll);
                    outerTableRef.current.style.paddingInlineEnd = `${scrollbarWidth}px`;
                }
            }
        }
    }, [tableId, contentHeight, data, noDataRenderer, appliedColumnWidths]);
    // update horizontal scroll position if a new value is provided
    useLayoutEffect(() => {
        if (horizontalScrollPositionOverrideRef.current !== horizontalScrollPositionOverride &&
            !layoutInfo.isLayoutRequired) {
            setHorizontalScrollPosition(outerTableRef.current, columnsArray, layoutInfo.columnWidthsArray, isRtl, horizontalScrollPositionOverride);
            horizontalScrollPositionOverrideRef.current = horizontalScrollPositionOverride;
        }
    }, [
        tableId,
        columnsArray,
        layoutInfo.isLayoutRequired,
        layoutInfo.columnWidthsArray,
        horizontalScrollPositionOverride,
        isRtl
    ]);
    // update vertical scroll position if a new value is provided
    useLayoutEffect(() => {
        if (verticalScrollPositionOverrideRef.current !== verticalScrollPositionOverride &&
            !layoutInfo.isLayoutRequired) {
            setVerticalScrollPosition(outerTableRef.current, tableId, verticalScrollPositionOverride);
            verticalScrollPositionOverrideRef.current = verticalScrollPositionOverride;
        }
    }, [tableId, layoutInfo.isLayoutRequired, verticalScrollPositionOverride]);
    // ensure sticky columns are updated appropriately
    useLayoutEffect(() => {
        if (outerTableRef.current != null && !layoutInfo.isLayoutRequired) {
            updateStickyColumns(outerTableRef.current, tableId, isRtl, columnsArray, layoutInfo.columnWidthsArray, stickyEdgesState, setStickyEdgesState);
        }
    }, [
        tableId,
        columnsArray,
        layoutInfo.isLayoutRequired,
        layoutInfo.columnWidthsArray,
        isRtl,
        stickyEdgesState
    ]);
    // initialize base Table style classes
    const { classes: themeClasses } = useComponentTheme(TableRedwoodTheme, {
        forceScroll: sizingInfoRef.current.isInitialRender ? 'isForceScroll' : 'notForceScroll',
        verticalScroll: isVerticalScrollRef.current ? 'isVerticalScroll' : 'notVerticalScroll',
        disableWrapping: layout === 'contents' && sampledColumnWidthsRef.current === undefined
            ? 'isDisableWrapping'
            : 'notDisableWrapping'
    });
    const classes = classNames([themeClasses]);
    const tableClasses = classNames([innerTableStyles.base]);
    const focusTrackerClasses = classNames([focusTrackerStyles.base]);
    // aria-rowcount includes header and footer rows
    const hasFooters = columnsArray.some((column) => {
        return column.value.footerRenderer != null || column.value.footerText != null;
    });
    const ariaRowCount = data == null ? undefined : hasMore ? -1 : data.length + (hasFooters ? 2 : 1);
    const startStickyEdge = stickyEdgesState.start;
    const endStickyEdge = stickyEdgesState.end;
    const hasVerticalGridlines = gridlines?.vertical === 'visible';
    const hasHorizontalGridlines = gridlines?.horizontal !== 'hidden';
    const isRowSelectionEnabled = selectionMode?.row === 'single' || selectionMode?.row === 'multiple';
    const isColumnSelectionEnabled = selectionMode?.column === 'single' || selectionMode?.column === 'multiple';
    const getTableBodyProps = () => {
        return {
            tableId: tableId,
            data: data,
            columnsArray: columnsArray,
            getAccessibleRowHeaders: getAccessibleRowHeaders,
            hasVerticalGridlines: hasVerticalGridlines,
            hasHorizontalGridlines: hasHorizontalGridlines,
            selected: selected,
            isRowSelectionEnabled: isRowSelectionEnabled,
            isSingleRowSelectionEnabled: selectionMode?.row === 'single',
            currentCell: currentCell,
            currentRowVariant: currentRowVariant,
            isShowFocusRing: isShowFocusRing,
            getRowKey: getRowKey,
            hasMore: hasMore,
            onLoadMore: onLoadMore,
            noDataRenderer: noDataRenderer,
            viewportConfig: getViewportConfig(outerTableRef),
            onSelectionChange: onTableSelectionChange,
            startStickyEdge: startStickyEdge,
            endStickyEdge: endStickyEdge,
            isRtl: isRtl
        };
    };
    const getTableColGroupProps = () => {
        let columnWidthsArray;
        if (!layoutInfo.isLayoutRequired) {
            columnWidthsArray = layoutInfo.columnWidthsArray;
        }
        else {
            columnWidthsArray = [];
            for (let i = 0; i < columnsArray.length; i++) {
                columnWidthsArray[i] = undefined;
            }
        }
        return {
            tableId: tableId,
            columnWidthsArray: columnWidthsArray
        };
    };
    const getTableHeaderProps = () => {
        return {
            tableId: tableId,
            columnsArray: columnsArray,
            hasVerticalGridlines: hasVerticalGridlines,
            focusedKey: currentCell?.type === 'header' ? currentCell.columnKey : undefined,
            selectedColumnKeys: selected.column,
            selectedRowKeys: selected.row,
            isColumnSelectionEnabled: isColumnSelectionEnabled,
            isRowSelectionEnabled: isRowSelectionEnabled,
            onSelectionChange: onTableSelectionChange,
            sortCriterion: sortCriterion,
            onSortCriterionChange: onSortCriterionChange,
            isShowFocusRing: isShowFocusRing,
            startStickyEdge: startStickyEdge,
            endStickyEdge: endStickyEdge,
            isResizeHover: resizeInfoRef.current.isResizeHover,
            isRtl: isRtl
        };
    };
    const getTableFooterProps = () => {
        return {
            tableId: tableId,
            isRendered: hasFooters,
            columnsArray: columnsArray,
            hasVerticalGridlines: hasVerticalGridlines,
            focusedKey: currentCell?.type === 'footer' ? currentCell.columnKey : undefined,
            selectedKeys: selected.column,
            isColumnSelectionEnabled: isColumnSelectionEnabled,
            isShowFocusRing: isShowFocusRing,
            startStickyEdge: startStickyEdge,
            endStickyEdge: endStickyEdge,
            isRtl: isRtl
        };
    };
    const getTableDragIndicator = () => {
        if (columnResizingIndicator != null && !layoutInfo.isLayoutRequired) {
            let position = 0;
            for (let i = 0; i < columnsArray.length; i++) {
                position += layoutInfo.columnWidthsArray[i];
                if (columnsArray[i].key === columnResizingIndicator.key) {
                    if (columnResizingIndicator.delta != null) {
                        position += columnResizingIndicator.delta;
                    }
                    break;
                }
            }
            return jsx(TableDragIndicator, { position: position, isRtl: isRtl });
        }
        return undefined;
    };
    const getTableStyle = () => {
        let widthString = '';
        let heightString = '';
        if (!layoutInfo.isLayoutRequired) {
            let totalWidth = 0;
            for (let i = 0; i < layoutInfo.columnWidthsArray.length; i++) {
                totalWidth += layoutInfo.columnWidthsArray[i];
            }
            widthString = `width: ${totalWidth}px; table-layout: fixed;`;
        }
        else {
            // shrink table down as much as possible when a 'contents' layout is required, otherwise
            // the sampled column widths will not reflect the true minimum sizes with line-clamping
            widthString = layout !== 'contents' ? 'width: 100%;' : 'width: 1px';
        }
        if (contentHeight != null) {
            heightString = data == null || data.length === 0 ? `min-height: ${contentHeight}px;` : '';
        }
        return `${widthString}${heightString}`;
    };
    return (jsx("div", { ...testIdProps, ref: outerTableRef, "aria-colcount": columnsArray.length, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-rowcount": ariaRowCount, ...(selectionMode?.column === 'multiple' || selectionMode?.row === 'multiple'
            ? { 'aria-multiselectable': true }
            : {}), class: classes, role: 'grid', ...interactionManagerProps, children: jsxs(FocusTracker, { styleClass: focusTrackerClasses, isDisabled: !isTabbableMode, onFocusStartEdge: onFocusStartEdge, onFocusEndEdge: onFocusEndEdge, onStartTracking: onStartFocusTracking, children: [jsx(TabbableModeContext.Provider, { value: { isTabbable: isTabbableMode }, children: jsxs("table", { class: tableClasses, role: 'presentation', style: getTableStyle(), "data-oj-table-inner-table": tableId, children: [jsx(TableColGroup, { ...getTableColGroupProps() }), jsx(TableHeader, { ...getTableHeaderProps() }), jsx(TableBody, { ...getTableBodyProps() }), jsx(TableFooter, { ...getTableFooterProps() })] }) }), getTableDragIndicator()] }) }));
});

export { Table as T };
//# sourceMappingURL=Table-e3ef68ad.js.map
