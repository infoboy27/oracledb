declare const formLayoutVars: {
    maxColumnWidth: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
    columnGapWidthMd: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
    columnGapWidthSm: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
    rowGapWidth: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
};
export { formLayoutVars };
