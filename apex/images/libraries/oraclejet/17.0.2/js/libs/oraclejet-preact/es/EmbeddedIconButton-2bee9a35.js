/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';

const EmbeddedIconButton = ({ isDisabled = false, size = 'sm', onAction, 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, 'aria-hidden': ariaHidden = false, ...props }) => {
    return (jsx(BaseButton, { elementDetails: { type: 'span', isFocusable: false }, isDisabled: isDisabled, size: size, variant: 'ghost', styling: ['min'], onAction: onAction, "aria-describedby": ariaDescribedBy, "aria-hidden": ariaHidden, "aria-label": accessibleLabel, children: jsx(ButtonLabelLayout, { display: 'icons', startIcon: props.children, size: size }) }));
};

export { EmbeddedIconButton as E };
//# sourceMappingURL=EmbeddedIconButton-2bee9a35.js.map
