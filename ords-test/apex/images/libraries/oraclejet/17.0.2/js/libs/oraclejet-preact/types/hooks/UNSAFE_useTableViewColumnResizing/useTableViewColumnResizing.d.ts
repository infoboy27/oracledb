import { ColumnResizeDetail, ColumnWidths } from '../../UNSAFE_TableView';
export type TableViewColumnResizingProps<C extends string> = {
    columnOrder: C[];
    applyWidths?: 'onResizing' | 'onResize';
    columnWidths?: ColumnWidths<C>;
    onColumnWidthsChange?: (columnWidths: ColumnWidths<C>) => void;
    minColumnWidth?: number;
    resizeBehavior?: 'dividerOnly' | 'singleColumn';
};
/**
 * Utility hook for controlling a TableView's sizing
 */
declare function useTableViewColumnResizing<C extends string>({ columnOrder, columnWidths, onColumnWidthsChange, applyWidths, minColumnWidth, resizeBehavior }: TableViewColumnResizingProps<C>): {
    columnResizingProps: {
        onColumnResizing: (detail: ColumnResizeDetail<C>) => void;
        onColumnResize: (detail: ColumnResizeDetail<C>) => void;
        columnResizingIndicator: {
            key: C;
            delta: number;
        } | undefined;
    };
};
export { useTableViewColumnResizing };
