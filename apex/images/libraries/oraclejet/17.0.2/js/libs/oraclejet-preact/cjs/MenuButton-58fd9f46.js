/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var ButtonLabelLayout = require('./ButtonLabelLayout-3399b9e1.js');
var ChevronDown = require('./ChevronDown-ec558844.js');
var Menu = require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
var hooks = require('preact/hooks');
var preact = require('preact');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
require('./logger-2b636482.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
var compat = require('preact/compat');
require('./LayerHost-46e4d858.js');
var useMenuAction = require('./useMenuAction-191c66a9.js');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var mergeProps = require('./mergeProps-e3da7237.js');

/**
 * A MenuButton is a combined action and menu button.
 */
const MenuButton = compat.forwardRef(({ children, label, suffix, variant = 'outlined', isDisabled = false, isMenuOpen = false, onToggleMenu, size = 'md', type: buttonType = 'button', width, icon, testId, 'aria-describedby': ariaDescribedBy, onBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart }, ref) => {
    const buttonRef = hooks.useRef(null);
    hooks.useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { triggerProps, menuProps } = useMenuAction.useMenuAction({
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
    const rootButton = (jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(triggerProps, globalEventProps), styling: isMenuOpen ? ['min', 'active'] : ['min'], elementDetails: elementDetails, isDisabled: isDisabled, variant: variant, width: width, size: size, ref: buttonRef, testId: testId, "aria-label": suffix ? `${label} ${suffix}` : label, "aria-describedby": ariaDescribedBy, children: jsxRuntime.jsx(ButtonLabelLayout.ButtonLabelLayout, { display: 'all', suffix: suffix, startIcon: icon, endIcon: jsxRuntime.jsx(ChevronDown.SvgChevronDown, {}), size: size, children: label }) }));
    /*TODO: Remove this hardcoded offsetValue so we have dropdown offset only set on one single place.
     Could be done via menu props or having a dropdownMenu component. JET-60595*/
    /*TODO: Once menu expose a prop to set min width we would need to calculate offset width of button
      so we set the correct min width since dropdown menus are 200px but if triggered element width is
      bigger should be that size. JET-60745 */
    return isDisabled ? (rootButton) : (jsxRuntime.jsxs(preact.Fragment, { children: [rootButton, jsxRuntime.jsx(Menu.Menu, { ...menuProps, "aria-label": label, offsetValue: 4, children: children })] }));
});
MenuButton.displayName = 'MenuButton';

exports.MenuButton = MenuButton;
//# sourceMappingURL=MenuButton-58fd9f46.js.map
