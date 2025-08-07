/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useButtonSetContext = require('./useButtonSetContext-a2f31c8e.js');
var ToggleButtonLabel = require('./ToggleButtonLabel-821e9c09.js');
var toggleButtonUtils = require('./toggleButtonUtils-0da9d88d.js');
var buttonUtils = require('./buttonUtils-252661e7.js');

/**
 * A ButtonSetIconButton is an icon button that allows users to switch
 * between states when pressed.
 */
const ButtonSetIconButton = compat.forwardRef(({ children, tooltip, value, accessibleLabel, isSelected = false, onToggle, position, testId, width, 'aria-describedby': ariaDescribedBy, ...props }, ref) => {
    const buttonSetProps = useButtonSetContext.useButtonSetContext();
    const { inputProps, buttonSetButtonProps, isDisabled } = buttonUtils.processSetButtonProps(props, buttonSetProps);
    const buttonRef = hooks.useRef(null);
    hooks.useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: tooltip ?? accessibleLabel,
        isDisabled: isDisabled
    });
    const styling = toggleButtonUtils.toggleStyling(buttonSetButtonProps.layoutWidth, isSelected, false, true, buttonSetButtonProps.variant === 'outlined', position, undefined, true);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(buttonSetButtonProps, ariaProps), elementDetails: { type: 'span', isFocusable: false, isLabel: true }, styling: styling, width: buttonSetProps.width ? '100%' : width, ref: buttonRef, testId: testId, children: jsxRuntime.jsx(ToggleButtonLabel.ToggleButtonLabel, { ...tooltipProps, label: accessibleLabel ?? tooltip, onAction: () => onToggle?.({ value: isSelected }), display: 'icons', isSelected: isSelected, ...inputProps, value: value, startIcon: children }) }), tooltipContent] }));
});
ButtonSetIconButton.displayName = 'ButtonSetIconButton';

exports.ButtonSetIconButton = ButtonSetIconButton;
//# sourceMappingURL=ButtonSetIconButton-50543cd6.js.map
