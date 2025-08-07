/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { M as Menu } from './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import { useRef, useImperativeHandle } from 'preact/hooks';
import { Fragment } from 'preact';
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
 * A MenuButton is a combined action and menu button.
 */
const MenuButton = forwardRef(({ children, label, suffix, variant = 'outlined', isDisabled = false, isMenuOpen = false, onToggleMenu, size = 'md', type: buttonType = 'button', width, icon, testId, 'aria-describedby': ariaDescribedBy, onBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart }, ref) => {
    const buttonRef = useRef(null);
    useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { triggerProps, menuProps } = useMenuAction({
        isDisabled: isDisabled,
        onToggleMenu: onToggleMenu,
        isMenuOpen: isMenuOpen,
        anchorRef: buttonRef
    });
    const elementDetails = {
        type: 'button',
        buttonType: buttonType
    };
    const globalEventProps = {
        onBlur,
        onFocus,
        onMouseEnter,
        onMouseLeave,
        onTouchEnd,
        onTouchStart
    };
    const rootButton = (jsx(BaseButton, { ...mergeProps(triggerProps, globalEventProps), styling: isMenuOpen ? ['min', 'active'] : ['min'], elementDetails: elementDetails, isDisabled: isDisabled, variant: variant, width: width, size: size, ref: buttonRef, testId: testId, "aria-label": suffix ? `${label} ${suffix}` : label, "aria-describedby": ariaDescribedBy, children: jsx(ButtonLabelLayout, { display: 'all', suffix: suffix, startIcon: icon, endIcon: jsx(SvgChevronDown, {}), size: size, children: label }) }));
    /*TODO: Remove this hardcoded offsetValue so we have dropdown offset only set on one single place.
     Could be done via menu props or having a dropdownMenu component. JET-60595*/
    /*TODO: Once menu expose a prop to set min width we would need to calculate offset width of button
      so we set the correct min width since dropdown menus are 200px but if triggered element width is
      bigger should be that size. JET-60745 */
    return isDisabled ? (rootButton) : (jsxs(Fragment, { children: [rootButton, jsx(Menu, { ...menuProps, "aria-label": label, offsetValue: 4, children: children })] }));
});
MenuButton.displayName = 'MenuButton';

export { MenuButton as M };
//# sourceMappingURL=MenuButton-39563941.js.map
