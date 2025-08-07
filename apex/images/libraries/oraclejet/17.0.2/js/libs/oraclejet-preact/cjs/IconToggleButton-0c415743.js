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
var buttonUtils = require('./buttonUtils-252661e7.js');
var ToggleButtonLabel = require('./ToggleButtonLabel-821e9c09.js');

/**
 * IconToggleButtons direct users to toggle a state with
 * a single tap, click, or keystroke.
 */
const IconToggleButton = compat.forwardRef(({ children, variant = 'outlined', size = 'md', isDisabled = false, tooltip, accessibleLabel, isSelected = false, onToggle, testId, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const { globalEventProps } = buttonUtils.processGlobals(props);
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
    const styling = toggleButtonUtils.toggleStyling('auto', isSelected, false, false, variant === 'outlined', undefined, undefined, true);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(tooltipProps, triggerProps, globalEventProps, ariaProps), variant: variant, isDisabled: isDisabled, size: size, width: width, "aria-pressed": isSelected, styling: styling, ref: buttonRef, "aria-label": accessibleLabel ?? tooltip, testId: testId, children: jsxRuntime.jsx(ToggleButtonLabel.ToggleButtonLabel, { onAction: () => onToggle?.({ value: isSelected }), isDisabled: isDisabled, display: 'icons', startIcon: children }) }), tooltipContent] }));
});
IconToggleButton.displayName = 'IconToggleButton';

exports.IconToggleButton = IconToggleButton;
//# sourceMappingURL=IconToggleButton-0c415743.js.map
