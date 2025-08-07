/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { Fragment } from 'preact';
import { forwardRef } from 'preact/compat';
import { useRef, useImperativeHandle } from 'preact/hooks';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { u as useToggleAction } from './useToggleAction-fc0f5399.js';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { a as toggleStyling } from './toggleButtonUtils-039c4eae.js';
import { u as useId } from './useId-03dbfdf0.js';
import { T as ToggleButtonLabel } from './ToggleButtonLabel-8c23fab3.js';

/**
 * A IconSwitchButton is an icon button that allows users to switch
 * between states when pressed.  It differs from a toggle button in not
 * providing any visual indication of the state; instead, switch the
 * icon to provide the state indication.
 */
const IconSwitchButton = forwardRef(({ children, tooltip, size = 'md', isDisabled = false, accessibleLabel, isSelected = false, onToggle, testId, width, 'aria-describedby': ariaDescribedBy }, ref) => {
    const buttonRef = useRef(null);
    useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { triggerProps } = useToggleAction({
        isDisabled: isDisabled,
        onToggle: onToggle
    });
    const { tooltipContent, tooltipProps } = useTooltip({
        text: tooltip ?? accessibleLabel,
        isDisabled: isDisabled
    });
    const styling = toggleStyling('auto', isSelected, true, false, false, undefined, undefined, true);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxs(Fragment, { children: [jsx(BaseButton, { ...mergeProps(tooltipProps, triggerProps, ariaProps), elementDetails: { type: 'button', isSwitch: true }, "aria-checked": isSelected, variant: "ghost", size: size, isDisabled: isDisabled, styling: styling, width: width, ref: buttonRef, "aria-label": accessibleLabel ?? tooltip, testId: testId, children: jsx(ToggleButtonLabel, { isDisabled: isDisabled, label: accessibleLabel ?? tooltip, isToggle: true, inputName: useId(), inputType: 'switch', onAction: () => onToggle?.({ value: isSelected }), isSelected: isSelected, display: 'icons', startIcon: children, size: size }) }), tooltipContent] }));
});
IconSwitchButton.displayName = 'IconSwitchButton';

export { IconSwitchButton as I };
//# sourceMappingURL=IconSwitchButton-61cabbfe.js.map
