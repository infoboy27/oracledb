/* @oracle/oraclejet-preact: undefined */
import { g as generateId } from './id-83adac50.js';

/**
 *
 * @param buttonProps
 * @returns globalEventProps that can be spread onto target element
 */
function processGlobals(buttonProps) {
    const globalEventProps = {
        onBlur: buttonProps.onBlur,
        onFocus: buttonProps.onFocus,
        onMouseEnter: buttonProps.onMouseEnter,
        onMouseLeave: buttonProps.onMouseLeave,
        onTouchEnd: buttonProps.onTouchEnd,
        onTouchStart: buttonProps.onTouchStart
    };
    return {
        globalEventProps
    };
}
/**
 * Merge buttonset props with toggle props for spreadable properties and flags
 * @param toggleProps
 * @param buttonSetProps
 * @returns
 */
function processSetButtonProps(toggleProps, buttonSetProps) {
    const isDisabled = toggleProps.isDisabled ?? buttonSetProps.isDisabled ? true : undefined;
    const commonProps = {
        size: toggleProps.size ?? buttonSetProps.size,
        isDisabled: isDisabled
    };
    const buttonProps = {
        variant: toggleProps.variant ?? buttonSetProps.variant,
        ...commonProps
    };
    const buttonSetButtonProps = {
        layoutWidth: toggleProps.layoutWidth ?? buttonSetProps.layoutWidth,
        ...buttonProps
    };
    const inputProps = {
        inputType: buttonSetProps.inputType ?? toggleProps.inputType ?? 'checkbox',
        inputName: buttonSetProps.inputName ?? toggleProps.inputName ?? generateId(),
        ...commonProps
    };
    const { globalEventProps } = processGlobals(toggleProps);
    return {
        isDisabled,
        buttonSetButtonProps,
        inputProps,
        globalEventProps
    };
}

export { processSetButtonProps as a, processGlobals as p };
//# sourceMappingURL=buttonUtils-6f35c4f4.js.map
