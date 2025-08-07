/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var useToggleAction = require('./useToggleAction-e4f15550.js');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var toggleButtonUtils = require('./toggleButtonUtils-0da9d88d.js');
var useId = require('./useId-6c0eeb27.js');
var ToggleButtonLabel = require('./ToggleButtonLabel-821e9c09.js');

/**
 * A IconSwitchButton is an icon button that allows users to switch
 * between states when pressed.  It differs from a toggle button in not
 * providing any visual indication of the state; instead, switch the
 * icon to provide the state indication.
 */
const IconSwitchButton = compat.forwardRef(({ children, tooltip, size = 'md', isDisabled = false, accessibleLabel, isSelected = false, onToggle, testId, width, 'aria-describedby': ariaDescribedBy }, ref) => {
    const buttonRef = hooks.useRef(null);
    hooks.useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { triggerProps } = useToggleAction.useToggleAction({
        isDisabled: isDisabled,
        onToggle: onToggle
    });
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: tooltip ?? accessibleLabel,
        isDisabled: isDisabled
    });
    const styling = toggleButtonUtils.toggleStyling('auto', isSelected, true, false, false, undefined, undefined, true);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(tooltipProps, triggerProps, ariaProps), elementDetails: { type: 'button', isSwitch: true }, "aria-checked": isSelected, variant: "ghost", size: size, isDisabled: isDisabled, styling: styling, width: width, ref: buttonRef, "aria-label": accessibleLabel ?? tooltip, testId: testId, children: jsxRuntime.jsx(ToggleButtonLabel.ToggleButtonLabel, { isDisabled: isDisabled, label: accessibleLabel ?? tooltip, isToggle: true, inputName: useId.useId(), inputType: 'switch', onAction: () => onToggle?.({ value: isSelected }), isSelected: isSelected, display: 'icons', startIcon: children, size: size }) }), tooltipContent] }));
});
IconSwitchButton.displayName = 'IconSwitchButton';

exports.IconSwitchButton = IconSwitchButton;
//# sourceMappingURL=IconSwitchButton-094ace3a.js.map
