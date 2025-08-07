/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { Fragment } from 'preact';
import { forwardRef } from 'preact/compat';
import { useRef, useImperativeHandle } from 'preact/hooks';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useButtonSetContext } from './useButtonSetContext-6a483d7f.js';
import { T as ToggleButtonLabel } from './ToggleButtonLabel-8c23fab3.js';
import { a as toggleStyling } from './toggleButtonUtils-039c4eae.js';
import { a as processSetButtonProps } from './buttonUtils-6f35c4f4.js';

/**
 * A ButtonSetIconButton is an icon button that allows users to switch
 * between states when pressed.
 */
const ButtonSetIconButton = forwardRef(({ children, tooltip, value, accessibleLabel, isSelected = false, onToggle, position, testId, width, 'aria-describedby': ariaDescribedBy, ...props }, ref) => {
    const buttonSetProps = useButtonSetContext();
    const { inputProps, buttonSetButtonProps, isDisabled } = processSetButtonProps(props, buttonSetProps);
    const buttonRef = useRef(null);
    useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { tooltipContent, tooltipProps } = useTooltip({
        text: tooltip ?? accessibleLabel,
        isDisabled: isDisabled
    });
    const styling = toggleStyling(buttonSetButtonProps.layoutWidth, isSelected, false, true, buttonSetButtonProps.variant === 'outlined', position, undefined, true);
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    return (jsxs(Fragment, { children: [jsx(BaseButton, { ...mergeProps(buttonSetButtonProps, ariaProps), elementDetails: { type: 'span', isFocusable: false, isLabel: true }, styling: styling, width: buttonSetProps.width ? '100%' : width, ref: buttonRef, testId: testId, children: jsx(ToggleButtonLabel, { ...tooltipProps, label: accessibleLabel ?? tooltip, onAction: () => onToggle?.({ value: isSelected }), display: 'icons', isSelected: isSelected, ...inputProps, value: value, startIcon: children }) }), tooltipContent] }));
});
ButtonSetIconButton.displayName = 'ButtonSetIconButton';

export { ButtonSetIconButton as B };
//# sourceMappingURL=ButtonSetIconButton-c5860cc1.js.map
