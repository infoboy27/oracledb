/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var hooks = require('preact/hooks');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const _defaultMinWidth = 33;
/**
 * Utility hook for controlling a TableView's sizing
 */
function useTableViewColumnResizing({ columnOrder, columnWidths, onColumnWidthsChange, applyWidths = 'onResizing', minColumnWidth = 33, resizeBehavior = 'dividerOnly' }) {
    const minWidth = minColumnWidth != null ? minColumnWidth : _defaultMinWidth;
    const columnWidthsRef = hooks.useRef(columnWidths);
    columnWidthsRef.current = columnWidths;
    const [columnResizingIndicator, setColumnResizingIndicator] = hooks.useState();
    const columnResizingStartingColumnWidthsRef = hooks.useRef();
    const _cloneColumnWidths = hooks.useCallback((columnWidths) => {
        const newColumnWidths = {};
        for (const key of columnOrder) {
            newColumnWidths[key] = columnWidths[key];
        }
        return newColumnWidths;
    }, [columnOrder]);
    /**
     * Helper method to update the Table's column widths while a column resize operation is ongoing.
     */
    const onColumnResizing = hooks.useCallback((detail) => {
        // save the initial state when column resize begins
        if (columnResizingStartingColumnWidthsRef.current == null) {
            columnResizingStartingColumnWidthsRef.current = detail.allColumnWidths;
        }
        const newStaticColumnWidths = _cloneColumnWidths(columnWidthsRef.current != null ? columnWidthsRef.current : {});
        const startKey = detail.key;
        const endKey = columnOrder[columnOrder.indexOf(startKey) + 1];
        const initialStartWidth = columnResizingStartingColumnWidthsRef.current[startKey];
        const initialEndWidth = columnResizingStartingColumnWidthsRef.current[endKey];
        const newStartWidth = Math.min(Math.max(initialStartWidth + detail.delta, minWidth), initialStartWidth + initialEndWidth - minWidth);
        newStaticColumnWidths[startKey] = newStartWidth;
        const newEndWidth = initialEndWidth + initialStartWidth - newStartWidth;
        newStaticColumnWidths[endKey] = newEndWidth;
        if (onColumnWidthsChange != null) {
            onColumnWidthsChange(newStaticColumnWidths);
            columnWidthsRef.current = newStaticColumnWidths;
        }
        setColumnResizingIndicator({ key: startKey, delta: 0 });
    }, [onColumnWidthsChange, minWidth, columnOrder, _cloneColumnWidths]);
    /**
     * Helper method to update the Table's column resize indicator line only.
     */
    const onColumnIndicatorResizing = hooks.useCallback((detail) => {
        const startKey = detail.key;
        const endKey = columnOrder[columnOrder.indexOf(startKey) + 1];
        const initialStartWidth = detail.allColumnWidths[startKey];
        const initialEndWidth = detail.allColumnWidths[endKey];
        const newStartWidth = Math.min(Math.max(initialStartWidth + detail.delta, minWidth), initialStartWidth + initialEndWidth - minWidth);
        setColumnResizingIndicator({ key: startKey, delta: newStartWidth - initialStartWidth });
    }, [columnOrder, minWidth]);
    /**
     * Helper method to update the Table's column widths at the end of column resize operation. This is
     * the same as during an ongoing resize operation, but additionally pushes back the resized column widths
     * to the consumer if a 'setInitialColumnWidths' callback is provided, and removes the indicator line.
     */
    const onColumnResize = hooks.useCallback((detail) => {
        const initialWidths = columnResizingStartingColumnWidthsRef.current != null
            ? columnResizingStartingColumnWidthsRef.current
            : detail.allColumnWidths;
        const newStaticColumnWidths = _cloneColumnWidths(columnWidthsRef.current != null ? columnWidthsRef.current : {});
        const startKey = detail.key;
        const endKey = columnOrder[columnOrder.indexOf(startKey) + 1];
        const initialStartWidth = initialWidths[startKey];
        const initialEndWidth = initialWidths[endKey];
        const newStartWidth = Math.min(Math.max(initialStartWidth + detail.delta, minWidth), initialStartWidth + initialEndWidth - minWidth);
        newStaticColumnWidths[startKey] = newStartWidth;
        const newEndWidth = initialEndWidth + initialStartWidth - newStartWidth;
        newStaticColumnWidths[endKey] = newEndWidth;
        if (onColumnWidthsChange != null) {
            onColumnWidthsChange(newStaticColumnWidths);
            columnWidthsRef.current = newStaticColumnWidths;
        }
        columnResizingStartingColumnWidthsRef.current = undefined;
        setColumnResizingIndicator(undefined);
    }, [onColumnWidthsChange, minWidth, columnOrder, _cloneColumnWidths]);
    /**
     * Helper method to update the Table's column widths while a column resize operation is ongoing.
     */
    const onSingleColumnResizing = hooks.useCallback((detail) => {
        // save the initial state when column resize begins
        if (columnResizingStartingColumnWidthsRef.current == null) {
            columnResizingStartingColumnWidthsRef.current = detail.allColumnWidths;
        }
        const newStaticColumnWidths = _cloneColumnWidths(columnResizingStartingColumnWidthsRef.current != null
            ? columnResizingStartingColumnWidthsRef.current
            : detail.allColumnWidths);
        const startKey = detail.key;
        const initialStartWidth = columnResizingStartingColumnWidthsRef.current[startKey];
        const newStartWidth = Math.max(initialStartWidth + detail.delta, minWidth);
        newStaticColumnWidths[startKey] = newStartWidth;
        if (onColumnWidthsChange != null) {
            onColumnWidthsChange(newStaticColumnWidths);
            columnWidthsRef.current = newStaticColumnWidths;
        }
        setColumnResizingIndicator({ key: startKey, delta: 0 });
    }, [onColumnWidthsChange, minWidth, _cloneColumnWidths]);
    /**
     * Helper method to update the Table's column resize indicator line only.
     */
    const onSingleColumnIndicatorResizing = hooks.useCallback((detail) => {
        const startKey = detail.key;
        const initialStartWidth = detail.allColumnWidths[startKey];
        const newStartWidth = Math.max(initialStartWidth + detail.delta, minWidth);
        setColumnResizingIndicator({ key: startKey, delta: newStartWidth - initialStartWidth });
    }, [minWidth]);
    /**
     * Helper method to update the Table's column widths at the end of column resize operation. This is
     * the same as during an ongoing resize operation, but additionally pushes back the resized column widths
     * to the consumer if a 'setInitialColumnWidths' callback is provided, and removes the indicator line.
     */
    const onSingleColumnResize = hooks.useCallback((detail) => {
        const initialWidths = columnResizingStartingColumnWidthsRef.current != null
            ? columnResizingStartingColumnWidthsRef.current
            : detail.allColumnWidths;
        const newStaticColumnWidths = _cloneColumnWidths(columnResizingStartingColumnWidthsRef.current != null
            ? columnResizingStartingColumnWidthsRef.current
            : detail.allColumnWidths);
        const startKey = detail.key;
        const initialStartWidth = initialWidths[startKey];
        const newStartWidth = Math.max(initialStartWidth + detail.delta, minWidth);
        newStaticColumnWidths[startKey] = newStartWidth;
        if (onColumnWidthsChange != null) {
            onColumnWidthsChange(newStaticColumnWidths);
            columnWidthsRef.current = newStaticColumnWidths;
        }
        columnResizingStartingColumnWidthsRef.current = undefined;
        setColumnResizingIndicator(undefined);
    }, [onColumnWidthsChange, minWidth, _cloneColumnWidths]);
    const onColumnResizingHandler = applyWidths === 'onResize'
        ? resizeBehavior === 'singleColumn'
            ? onSingleColumnIndicatorResizing
            : onColumnIndicatorResizing
        : resizeBehavior === 'singleColumn'
            ? onSingleColumnResizing
            : onColumnResizing;
    const onColumnResizeHandler = resizeBehavior === 'singleColumn' ? onSingleColumnResize : onColumnResize;
    return {
        columnResizingProps: {
            onColumnResizing: onColumnResizingHandler,
            onColumnResize: onColumnResizeHandler,
            columnResizingIndicator: columnResizingIndicator
        }
    };
}

exports.useTableViewColumnResizing = useTableViewColumnResizing;
//# sourceMappingURL=UNSAFE_useTableViewColumnResizing.js.map
