/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';
import { forwardRef } from 'preact/compat';

/**
 * A button is a pressable element that invokes an action.
 */
const Button = forwardRef(({ variant = 'outlined', isDisabled = false, isRepeat = false, size = 'md', display = 'all', type: buttonType = 'button', endIcon, startIcon, autofocus, edge, testId, onAction, label = '', 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, width, onBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart }, ref) => {
    const labelOnly = (!startIcon && !endIcon) || display === 'label';
    const elementDetails = {
        type: 'button',
        buttonType: buttonType
    };
    const content = labelOnly ? (label) : (jsx(ButtonLabelLayout, { display: display, startIcon: startIcon, endIcon: endIcon, size: size, children: label }));
    return (jsx(BaseButton, { ref: ref, elementDetails: elementDetails, isDisabled: isDisabled, isRepeat: isRepeat, size: size, width: width, autofocus: autofocus, edge: edge, variant: variant, styling: [labelOnly ? 'default' : 'min'], onAction: onAction, "aria-label": accessibleLabel ?? label, "aria-describedby": ariaDescribedBy, onBlur: onBlur, onFocus: onFocus, onMouseEnter: onMouseEnter, onMouseLeave: onMouseLeave, onTouchEnd: onTouchEnd, onTouchStart: onTouchStart, testId: testId, children: content }));
});
Button.displayName = 'Button';

export { Button as B };
//# sourceMappingURL=Button-50c5589f.js.map
