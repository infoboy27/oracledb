/* @oracle/oraclejet-preact: undefined */
'use strict';

var id = require('./id-86356250.js');

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
        inputName: buttonSetProps.inputName ?? toggleProps.inputName ?? id.generateId(),
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

exports.processGlobals = processGlobals;
exports.processSetButtonProps = processSetButtonProps;
//# sourceMappingURL=buttonUtils-252661e7.js.map
