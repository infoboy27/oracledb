/**
 * Utility hook for consuming the ButtonSetContext
 *
 * @returns The value of closest ButtonSetControl provider
 */
declare function useButtonSetContext(): {
    width?: import("../../utils/UNSAFE_size").Size | undefined;
} & {
    variant?: "borderless" | "outlined" | undefined;
    isDisabled: boolean;
    size: "sm" | "md" | "lg";
    inputType?: import("../../utils/UNSAFE_buttonUtils").InputTypes | undefined;
    inputName?: string | undefined;
    layoutWidth?: import("../../utils/UNSAFE_buttonUtils").LayoutWidths | undefined;
    display?: "all" | "label" | "icons" | undefined;
    buttonSetValue?: string[] | undefined;
    onCommit?: ((detail: import("../../utils/UNSAFE_valueUpdateDetail").ValueUpdateDetail<string[]>) => void) | undefined;
};
export { useButtonSetContext };
