/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { tableViewStyles } from './UNSAFE_TableView/themes/TableViewStyles.css.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { T as Table } from './Table-e3ef68ad.js';

const mergedInterpolations = mergeInterpolations([
    ...Object.values(dimensionInterpolations)
]);
/**
 * Component that renders data in rows of columns.
 * This component is non-virtualized and renders all rows provided in the data prop.
 */
const TableView = forwardRef(({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, getAccessibleRowHeaders, children, columns, columnOrder, columnWidths, layout = 'contents', data, getRowKey, hasMore = false, onLoadMore, currentCellOverride, onPersistCurrentCell, currentRowVariant = 'none', gridlines = { horizontal: 'visible', vertical: 'hidden' }, selectionMode = { row: 'none', column: 'none' }, selected, onSelectionChange, onRowAction, sortCriterion = [], onSortCriterionChange, horizontalScrollPositionOverride, verticalScrollPositionOverride, columnResizingIndicator, onColumnResizing, onColumnResize, noDataRenderer, testId, ...dimensions }, ref) => {
    const { ...mergedStyles } = mergedInterpolations(dimensions);
    const tableViewClasses = classNames([tableViewStyles.base]);
    return (jsx("div", { class: tableViewClasses, style: mergedStyles, children: jsx(Table, { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, getAccessibleRowHeaders: getAccessibleRowHeaders, children: children, columns: columns, columnOrder: columnOrder, columnWidths: columnWidths, layout: layout, data: data, getRowKey: getRowKey, hasMore: hasMore, onLoadMore: onLoadMore, currentCellOverride: currentCellOverride, onPersistCurrentCell: onPersistCurrentCell, currentRowVariant: currentRowVariant, gridlines: gridlines, selectionMode: selectionMode, selected: selected, onSelectionChange: onSelectionChange, onRowAction: onRowAction, horizontalScrollPositionOverride: horizontalScrollPositionOverride, verticalScrollPositionOverride: verticalScrollPositionOverride, sortCriterion: sortCriterion, onSortCriterionChange: onSortCriterionChange, columnResizingIndicator: columnResizingIndicator, onColumnResizing: onColumnResizing, onColumnResize: onColumnResize, noDataRenderer: noDataRenderer, testId: testId, ref: ref }) }));
});

export { TableView as T };
//# sourceMappingURL=TableView-321b1fdf.js.map
