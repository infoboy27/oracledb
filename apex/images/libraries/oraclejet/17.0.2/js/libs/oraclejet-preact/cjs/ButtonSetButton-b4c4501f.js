/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useButtonSetContext = require('./useButtonSetContext-a2f31c8e.js');
var ToggleButtonLabel = require('./ToggleButtonLabel-821e9c09.js');
var toggleButtonUtils = require('./toggleButtonUtils-0da9d88d.js');
var buttonUtils = require('./buttonUtils-252661e7.js');

/**
 * Toggle buttons allow users to switch between states when pressed.
 */
const ButtonSetButton = compat.forwardRef(({ startIcon, endIcon, isSelected = false, onToggle, position, autofocus, testId, label, value, 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const buttonSetProps = useButtonSetContext.useButtonSetContext();
    const { inputProps: baseInputProps, buttonSetButtonProps, globalEventProps, isDisabled } = buttonUtils.processSetButtonProps(props, buttonSetProps);
    const inputProps = {
        ...baseInputProps,
        display: buttonSetProps.display ?? props.display ?? 'all'
    };
    const styling = toggleButtonUtils.toggleStyling(buttonSetButtonProps.layoutWidth, isSelected, false, // switch
    true, // label
    buttonSetButtonProps.variant === 'outlined', position, true, // hasLabel
    false // iconOnly
    );
    return (jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(globalEventProps, buttonSetButtonProps), ref: ref, elementDetails: { type: 'span', isFocusable: false, isLabel: true }, width: buttonSetProps.width ? '100%' : width, autofocus: autofocus, styling: styling, "aria-describedby": ariaDescribedBy, testId: testId, children: jsxRuntime.jsx(ToggleButtonLabel.ToggleButtonLabel, { onAction: () => onToggle?.({ value: isSelected }), label: label, isSelected: isSelected, isDisabled: isDisabled, startIcon: startIcon, endIcon: endIcon, value: value, ...inputProps }) }));
});
ButtonSetButton.displayName = 'ButtonSetButton';

exports.ButtonSetButton = ButtonSetButton;
//# sourceMappingURL=ButtonSetButton-b4c4501f.js.map
