/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { M as Menu } from './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import { useRef, useImperativeHandle } from 'preact/hooks';
import { Fragment } from 'preact';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import './logger-c92f309c.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import { forwardRef } from 'preact/compat';
import './LayerHost-45f545d7.js';
import { u as useMenuAction } from './useMenuAction-3e362802.js';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

/**
 * A IconMenuButton is a combined action and menu button.
 */
const IconMenuButton = forwardRef(({ children, tooltip, accessibleLabel, variant = 'outlined', isDisabled = false, isMenuOpen = false, isIconOnly = false, onToggleMenu, size = 'md', type: buttonType = 'button', testId, width, icon, 'aria-describedby': ariaDescribedBy }, ref) => {
    const buttonRef = useRef(null);
    useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { triggerProps, menuProps } = useMenuAction({
        isDisabled: isDisabled,
        onToggleMenu: onToggleMenu,
        isMenuOpen: isMenuOpen,
        anchorRef: buttonRef
    });
    const { tooltipContent, tooltipProps } = useTooltip({
        text: tooltip ? tooltip : accessibleLabel,
        isDisabled: isMenuOpen || isDisabled
    });
    const elementDetails = {
        type: 'button',
        buttonType: buttonType
    };
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    const rootButton = (jsx(Fragment, { children: jsxs(BaseButton, { ...mergeProps(tooltipProps, triggerProps, ariaProps), styling: isMenuOpen ? ['min', 'active'] : ['min'], elementDetails: elementDetails, isDisabled: isDisabled, variant: variant, width: width, size: size, ref: buttonRef, "aria-label": accessibleLabel ?? tooltip, testId: testId, children: [jsx(ButtonLabelLayout, { display: 'icons', startIcon: icon, endIcon: isIconOnly ? null : jsx(SvgChevronDown, {}), size: size }), tooltipContent] }) }));
    /*TODO: Remove this hardcoded offsetValue so we have dropdown offset only set on one single place.
     Could be done via menu props or having a dropdownMenu component. JET-60595*/
    return isDisabled ? (rootButton) : (jsxs(Fragment, { children: [rootButton, jsx(Menu, { ...menuProps, offsetValue: 4, "aria-label": accessibleLabel ?? tooltip, children: children })] }));
});
IconMenuButton.displayName = 'IconMenuButton';

export { IconMenuButton as I };
//# sourceMappingURL=IconMenuButton-9fe6cbf9.js.map
