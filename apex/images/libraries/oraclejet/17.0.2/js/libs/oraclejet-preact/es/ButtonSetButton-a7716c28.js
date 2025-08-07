/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useButtonSetContext } from './useButtonSetContext-6a483d7f.js';
import { T as ToggleButtonLabel } from './ToggleButtonLabel-8c23fab3.js';
import { a as toggleStyling } from './toggleButtonUtils-039c4eae.js';
import { a as processSetButtonProps } from './buttonUtils-6f35c4f4.js';

/**
 * Toggle buttons allow users to switch between states when pressed.
 */
const ButtonSetButton = forwardRef(({ startIcon, endIcon, isSelected = false, onToggle, position, autofocus, testId, label, value, 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const buttonSetProps = useButtonSetContext();
    const { inputProps: baseInputProps, buttonSetButtonProps, globalEventProps, isDisabled } = processSetButtonProps(props, buttonSetProps);
    const inputProps = {
        ...baseInputProps,
        display: buttonSetProps.display ?? props.display ?? 'all'
    };
    const styling = toggleStyling(buttonSetButtonProps.layoutWidth, isSelected, false, // switch
    true, // label
    buttonSetButtonProps.variant === 'outlined', position, true, // hasLabel
    false // iconOnly
    );
    return (jsx(BaseButton, { ...mergeProps(globalEventProps, buttonSetButtonProps), ref: ref, elementDetails: { type: 'span', isFocusable: false, isLabel: true }, width: buttonSetProps.width ? '100%' : width, autofocus: autofocus, styling: styling, "aria-describedby": ariaDescribedBy, testId: testId, children: jsx(ToggleButtonLabel, { onAction: () => onToggle?.({ value: isSelected }), label: label, isSelected: isSelected, isDisabled: isDisabled, startIcon: startIcon, endIcon: endIcon, value: value, ...inputProps }) }));
});
ButtonSetButton.displayName = 'ButtonSetButton';

export { ButtonSetButton as B };
//# sourceMappingURL=ButtonSetButton-a7716c28.js.map
