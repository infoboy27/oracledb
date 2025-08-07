declare const layoutLocalVars: {
    columnCount: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
};
declare const layoutSpanStyles: {
    layoutSpanColumn: {
        '1': string;
        '2': string;
        '3': string;
        '4': string;
        '5': string;
        '6': string;
    };
};
export { layoutLocalVars, layoutSpanStyles };
