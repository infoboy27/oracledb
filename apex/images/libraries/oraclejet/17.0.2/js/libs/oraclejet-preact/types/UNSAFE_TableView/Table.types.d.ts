/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren } from 'preact';
import { SelectionMode } from '../UNSAFE_Collection';
import { Keys } from '../utils/UNSAFE_keys';
export type TableViewHandle<K, C> = {
    getHorizontalScrollPosition: () => TableHorizontalScrollPosition<C>;
    getVerticalScrollPosition: () => TableVerticalScrollPosition<K>;
};
export type TableHorizontalScrollPosition<C> = {
    columnKey?: C;
    offsetX?: number;
    x?: number;
};
export type TableVerticalScrollPosition<K> = {
    offsetY?: number;
    rowKey?: K;
    y?: number;
};
export type TableRowContext<K, D> = {
    data: D;
    key: K;
};
export type TableRendererContext<K, D, C> = {
    rowData: D;
    rowKey: K;
    columnKey: C;
    field?: keyof D;
    selector?: () => ComponentChildren;
};
export type TableHeaderRendererContext<C> = {
    key: C;
    headerText?: string;
    sortable?: 'enabled' | 'disabled';
    sortDirection?: 'ascending' | 'descending';
    selector?: () => ComponentChildren;
    sortControl?: () => ComponentChildren;
};
export type TableFooterRendererContext<C> = {
    key: C;
    footerText?: string;
};
export type RowActionDetail<K, D> = {
    context: TableRowContext<K, D>;
    target: EventTarget | null;
};
export type SortCriterionDetail<C> = {
    key: C;
    sortDirection: 'ascending' | 'descending';
}[];
export type ColumnWidths<C extends string> = Record<C, number>;
export type ColumnResizeDetail<C extends string> = {
    key: C;
    delta: number;
    allColumnWidths: ColumnWidths<C>;
};
export type TableSelectionDetail<K, C> = {
    value: {
        row?: Keys<K>;
        column?: Keys<C>;
    };
    target: EventTarget | null;
};
/**
 * Type of the column object passed to the Table
 */
export type Column<K, D, C> = {
    /**
     * data attribue for the column
     */
    field?: keyof D;
    /**
     * text for the column footer
     */
    footerText?: string;
    /**
     * text for the column header
     */
    headerText?: string;
    /**
     * optional renderer for cell contents
     */
    renderer?: (context: TableRendererContext<K, D, C>) => ComponentChildren;
    /**
     * optional renderer for header cell contents
     */
    headerRenderer?: (context: TableHeaderRendererContext<C>) => ComponentChildren;
    /**
     * optional renderer for footer cell contents
     */
    footerRenderer?: (context: TableFooterRendererContext<C>) => ComponentChildren;
    /**
     * whether this column is selectable
     */
    selectable?: 'enabled' | 'disabled';
    /**
     * the edge this column should freeze at
     */
    stickyEdge?: 'start' | 'end' | 'none';
    /**
     * whether this column is sortable
     */
    sortable?: 'enabled' | 'disabled';
    /**
     * whether this column is resizable
     */
    edgeResizable?: 'enabled' | 'disabled';
    /**
     * the maximum width in pixels of this column
     */
    maxWidth?: number;
    /**
     * the minimum width in pixels of this column
     */
    minWidth?: number;
    /**
     * the weight of the column
     */
    weight?: number;
};
/**
 * Type for columns property of the Table.
 */
export type Columns<K, D, C extends string> = Record<C, Column<K, D, C>>;
/**
 * Type of the current cell passed to the Table
 */
export type Cell<K, C> = {
    rowKey: K;
    columnKey: C;
    type: 'data';
} | {
    rowKey?: never;
    columnKey: C;
    type: 'header' | 'footer';
} | {
    rowKey?: never;
    columnKey?: never;
    type: 'noData';
};
/**
 * useCurrentKey type for payload of current cell change event handler
 */
export type CurrentCellDetail<K, C> = {
    value?: Cell<K, C>;
};
/**
 * Type for current cell/row highlight mode.
 */
export type CurrentRowVariant = 'highlight' | 'none';
/**
 * Full set of props exposed in the Internal Table Component
 */
export type TableProps<K, D, C extends string> = {
    /**
     * An aria-label which defines a string value that labels this TableView.
     * Either aria-label or aria-labelledby should be specified in order to make TableView accessible.
     */
    'aria-label'?: string;
    /**
     * An aria-labelledby which identifies the element(s) that labels this TableView.
     * Either aria-label or aria-labelledby should be specified in order to make TableView accessible.
     */
    'aria-labelledby'?: string;
    /**
     * A callback function to determine the column keys corresponding to the accessible row headers for the
     * specified row. This is required in order for the table to be accessible.
     */
    getAccessibleRowHeaders: (context: TableRowContext<K, D>) => Set<C>;
    /**
     * The Table does not support children at this time
     */
    children?: never;
    /**
     * The column definitions for the TableView.
     */
    columns: Columns<K, D, C>;
    /**
     * An array of column keys representing the order of columns to be displayed. If not provided, all columns
     * defined in the 'columns' property will be displayed in the order returned by Object.entries(columns).
     */
    columnOrder?: C[];
    /**
     * The current cell to apply to the TableView. This will be applied each time its value instance changes.
     */
    currentCellOverride?: Cell<K, C>;
    /**
     * A property that can specify highlight styles on the row containing the current data cell.
     */
    currentRowVariant?: CurrentRowVariant;
    /**
     * Callback function to handle when the current cell has changed.
     */
    onPersistCurrentCell?: (detail: CurrentCellDetail<K, C>) => void;
    /**
     * What type of gridlines should be shown by the Table.
     */
    gridlines?: {
        horizontal?: 'visible' | 'hidden';
        vertical?: 'visible' | 'hidden';
    };
    /**
     * What type of columns layout is specified for the Table.
     */
    layout?: 'contents' | 'fixed';
    /**
     * The type of selection behavior that is enabled on the TableView. This property controls the number
     * of selections of rows and columns that can be made via selection gestures at any given time. When
     * multiple row selection is enabled, the application is responsible for including a 'selector' column
     * to ensure the TableView is fully accessible.
     */
    selectionMode?: {
        row?: SelectionMode;
        column?: SelectionMode;
    };
    /**
     * The keys of the current selected rows and columns in the TableView.
     */
    selected?: {
        row?: Keys<K>;
        column?: Keys<C>;
    };
    /**
     * Callback function to handle when selection has changed.  The function should update
     * the selected prop with a new set of selected keys.
     */
    onSelectionChange?: (detail: TableSelectionDetail<K, C>) => void;
    /**
     * Callback function to handle a row action gesture. (Click or spacebar)
     */
    onRowAction?: (detail: RowActionDetail<K, D>) => void;
    /**
     * Set of sort criterion representing the sort state of this Table's columns.
     */
    sortCriterion?: {
        key: C;
        sortDirection: 'ascending' | 'descending';
    }[];
    /**
     * Callback function to handle sort gesture from the Table.
     */
    onSortCriterionChange?: (detail: SortCriterionDetail<C>) => void;
    /**
     * The horizontal scroll position to apply to the TableView. This will be applied each time its value instance changes.
     */
    horizontalScrollPositionOverride?: TableHorizontalScrollPosition<C>;
    /**
     * The vertical scroll position to apply to the TableView. This will be applied each time its value instance changes.
     */
    verticalScrollPositionOverride?: TableVerticalScrollPosition<K>;
    /**
     * The static column width sizes to apply to the Table. Any column widths specified will be honored in all cases.
     */
    columnWidths?: ColumnWidths<C>;
    /**
     * Object representing the location of a column resize indicator line. When specified, a line will be rendered
     * on the end edge of the column corresponding to the provided key. Optionally, a delta from that location can
     * also be specified.
     */
    columnResizingIndicator?: {
        key: C;
        delta?: number;
    };
    /**
     * Callback function made during column resize gestures.
     */
    onColumnResizing?: (detail: ColumnResizeDetail<C>) => void;
    /**
     * Callback function made at the completion of a column resize gesture.
     */
    onColumnResize?: (detail: ColumnResizeDetail<C>) => void;
    /**
     * Optional custom renderer function to control the rendering of a Table when no rows are present.
     */
    noDataRenderer?: () => ComponentChildren;
};
