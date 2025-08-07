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
import { p as processGlobals } from './buttonUtils-6f35c4f4.js';
import { T as ToggleButtonLabel } from './ToggleButtonLabel-8c23fab3.js';

/**
 * IconToggleButtons direct users to toggle a state with
 * a single tap, click, or keystroke.
 */
const IconToggleButton = forwardRef(({ children, variant = 'outlined', size = 'md', isDisabled = false, tooltip, accessibleLabel, isSelected = false, onToggle, testId, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const { globalEventProps } = processGlobals(props);
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
    const styling = toggleStyling('auto', isSelected, false, false, variant === 'outlined', undefined, undefined, true);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxs(Fragment, { children: [jsx(BaseButton, { ...mergeProps(tooltipProps, triggerProps, globalEventProps, ariaProps), variant: variant, isDisabled: isDisabled, size: size, width: width, "aria-pressed": isSelected, styling: styling, ref: buttonRef, "aria-label": accessibleLabel ?? tooltip, testId: testId, children: jsx(ToggleButtonLabel, { onAction: () => onToggle?.({ value: isSelected }), isDisabled: isDisabled, display: 'icons', startIcon: children }) }), tooltipContent] }));
});
IconToggleButton.displayName = 'IconToggleButton';

export { IconToggleButton as I };
//# sourceMappingURL=IconToggleButton-f57e5484.js.map
