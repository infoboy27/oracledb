/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var useToggleAction = require('./useToggleAction-e4f15550.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var toggleButtonUtils = require('./toggleButtonUtils-0da9d88d.js');
var buttonUtils = require('./buttonUtils-252661e7.js');
var ToggleButtonLabel = require('./ToggleButtonLabel-821e9c09.js');

/**
 * ToggleButtons direct users to toggle a state with a single tap, click, or keystroke.
 */
const ToggleButton = compat.forwardRef(({ startIcon, endIcon, variant = 'outlined', size = 'md', isDisabled = false, isSelected = false, onToggle, display = 'all', autofocus, testId, label, 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const { globalEventProps } = buttonUtils.processGlobals(props);
    const labelOnly = (!startIcon && !endIcon) || display === 'label';
    const { triggerProps } = useToggleAction.useToggleAction({
        isDisabled: isDisabled,
        onToggle: onToggle
    });
    const styling = toggleButtonUtils.toggleStyling('auto', isSelected, false, false, variant === 'outlined', undefined, labelOnly);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(triggerProps, globalEventProps, ariaProps), ref: ref, variant: variant, isDisabled: isDisabled, size: size, width: width, "aria-pressed": isSelected, autofocus: autofocus, styling: styling, "aria-label": accessibleLabel ?? label, testId: testId, ...globalEventProps, children: jsxRuntime.jsx(ToggleButtonLabel.ToggleButtonLabel, { onAction: () => onToggle?.({ value: isSelected }), label: label, isDisabled: isDisabled, display: display, startIcon: startIcon, endIcon: endIcon }) }));
});
ToggleButton.displayName = 'ToggleButton';

exports.ToggleButton = ToggleButton;
//# sourceMappingURL=ToggleButton-d54a249c.js.map
