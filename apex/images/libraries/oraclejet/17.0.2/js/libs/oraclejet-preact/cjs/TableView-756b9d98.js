/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var UNSAFE_TableView_themes_TableViewStyles_css = require('./UNSAFE_TableView/themes/TableViewStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var Table = require('./Table-ecf57a09.js');

const mergedInterpolations = mergeInterpolations.mergeInterpolations([
    ...Object.values(dimensions.dimensionInterpolations)
]);
/**
 * Component that renders data in rows of columns.
 * This component is non-virtualized and renders all rows provided in the data prop.
 */
const TableView = compat.forwardRef(({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, getAccessibleRowHeaders, children, columns, columnOrder, columnWidths, layout = 'contents', data, getRowKey, hasMore = false, onLoadMore, currentCellOverride, onPersistCurrentCell, currentRowVariant = 'none', gridlines = { horizontal: 'visible', vertical: 'hidden' }, selectionMode = { row: 'none', column: 'none' }, selected, onSelectionChange, onRowAction, sortCriterion = [], onSortCriterionChange, horizontalScrollPositionOverride, verticalScrollPositionOverride, columnResizingIndicator, onColumnResizing, onColumnResize, noDataRenderer, testId, ...dimensions }, ref) => {
    const { ...mergedStyles } = mergedInterpolations(dimensions);
    const tableViewClasses = classNames.classNames([UNSAFE_TableView_themes_TableViewStyles_css.tableViewStyles.base]);
    return (jsxRuntime.jsx("div", { class: tableViewClasses, style: mergedStyles, children: jsxRuntime.jsx(Table.Table, { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, getAccessibleRowHeaders: getAccessibleRowHeaders, children: children, columns: columns, columnOrder: columnOrder, columnWidths: columnWidths, layout: layout, data: data, getRowKey: getRowKey, hasMore: hasMore, onLoadMore: onLoadMore, currentCellOverride: currentCellOverride, onPersistCurrentCell: onPersistCurrentCell, currentRowVariant: currentRowVariant, gridlines: gridlines, selectionMode: selectionMode, selected: selected, onSelectionChange: onSelectionChange, onRowAction: onRowAction, horizontalScrollPositionOverride: horizontalScrollPositionOverride, verticalScrollPositionOverride: verticalScrollPositionOverride, sortCriterion: sortCriterion, onSortCriterionChange: onSortCriterionChange, columnResizingIndicator: columnResizingIndicator, onColumnResizing: onColumnResizing, onColumnResize: onColumnResize, noDataRenderer: noDataRenderer, testId: testId, ref: ref }) }));
});

exports.TableView = TableView;
//# sourceMappingURL=TableView-756b9d98.js.map
