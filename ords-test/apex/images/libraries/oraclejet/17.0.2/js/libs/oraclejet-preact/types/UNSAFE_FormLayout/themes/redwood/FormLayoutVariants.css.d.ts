/*******************
 * Variants Utility
 *******************/
declare const multiVariantStyles: import("@vanilla-extract/recipes").RuntimeFn<{
    columnBehavior: {
        responsive: string;
        fixed: string;
    };
    direction: {
        row: string;
        column: string;
    };
}>;
/*******************
 * Exports
 *******************/
export { multiVariantStyles };
