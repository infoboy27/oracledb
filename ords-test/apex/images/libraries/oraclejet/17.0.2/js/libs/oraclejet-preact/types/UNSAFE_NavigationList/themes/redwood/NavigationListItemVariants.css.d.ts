declare const multiVariantStyles: import("@vanilla-extract/recipes").RuntimeFn<{
    readonly focusRing: {
        readonly isFocusRing: "";
        readonly notFocusRing: "";
    };
    readonly current: {
        readonly isCurrent: "";
        readonly notCurrtent: "";
    };
    readonly selected: {
        readonly isSelected: {
            backgroundColor: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            borderColor: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
            color: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
        };
        readonly notSelected: "";
    };
    readonly hybridHover: {
        readonly isHybridHover: "";
        readonly notHybridHover: "";
    };
    readonly pseudoHover: {
        readonly isPseudoHover: "";
        readonly notPseudoHover: "";
    };
    readonly active: {
        readonly isActive: "";
        readonly notActive: "";
    };
}>;
export { multiVariantStyles };
