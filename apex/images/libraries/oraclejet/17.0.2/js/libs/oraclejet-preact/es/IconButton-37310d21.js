/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { Fragment } from 'preact';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';
import { forwardRef } from 'preact/compat';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { p as processGlobals } from './buttonUtils-6f35c4f4.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

/**
 * Icon buttons are buttons that only show an icon and no label. They direct users to initiate or take actions and work with a single tap, click, or keystroke.
 */
const IconButton = forwardRef(({ variant = 'outlined', isDisabled = false, isRepeat = false, size = 'md', type: buttonType = 'button', autofocus, onAction, width, tooltip, testId, 'aria-haspopup': ariaHasPopup, 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, ...props }, ref) => {
    const { globalEventProps } = processGlobals(props);
    const { tooltipContent, tooltipProps } = useTooltip({
        text: tooltip ? tooltip : accessibleLabel,
        isDisabled
    });
    const elementDetails = {
        type: 'button',
        buttonType: buttonType
    };
    const ariaProps = ariaDescribedBy ? { 'aria-describedby': ariaDescribedBy } : {};
    return (jsxs(Fragment, { children: [jsx(BaseButton, { ...mergeProps(tooltipProps, globalEventProps, ariaProps), ref: ref, elementDetails: elementDetails, isDisabled: isDisabled, isRepeat: isRepeat, size: size, autofocus: autofocus, variant: variant, width: width, styling: ['min'], onAction: onAction, "aria-label": accessibleLabel ?? tooltip, "aria-haspopup": ariaHasPopup, testId: testId, children: jsx(ButtonLabelLayout, { display: 'icons', startIcon: props.children, size: size }) }), tooltipContent] }));
});
IconButton.displayName = 'IconButton';

export { IconButton as I };
//# sourceMappingURL=IconButton-37310d21.js.map
