/**
 * Stable theme tokens are manually updated and are not generated from Figma tokens
 */
export declare const base: {
    cursor: {
        clickable: string;
    };
    boxShadow: {
        xs: string;
        sm: string;
        md: string;
        lg: string;
        xl: string;
    };
    borderRadius: {
        sm: string;
        md: string;
        lg: string;
        xl: string;
    };
};
export declare const dvt: {
    label: {
        sm: {
            fontSize: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
        };
        md: {
            fontSize: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
        };
        lg: {
            fontSize: `var(--${string})` | `var(--${string}, ${string})` | `var(--${string}, ${number})`;
        };
    };
    dimmedOpacity: string;
};
