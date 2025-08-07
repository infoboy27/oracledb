/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var ButtonLabelLayout = require('./ButtonLabelLayout-3399b9e1.js');
var ChevronDown = require('./ChevronDown-ec558844.js');
var Menu = require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
var hooks = require('preact/hooks');
var preact = require('preact');
var useTooltip = require('./useTooltip-468c1c92.js');
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
 * A IconMenuButton is a combined action and menu button.
 */
const IconMenuButton = compat.forwardRef(({ children, tooltip, accessibleLabel, variant = 'outlined', isDisabled = false, isMenuOpen = false, isIconOnly = false, onToggleMenu, size = 'md', type: buttonType = 'button', testId, width, icon, 'aria-describedby': ariaDescribedBy }, ref) => {
    const buttonRef = hooks.useRef(null);
    hooks.useImperativeHandle(ref, () => buttonRef.current, [buttonRef]);
    const { triggerProps, menuProps } = useMenuAction.useMenuAction({
        isDisabled: isDisabled,
        onToggleMenu: onToggleMenu,
        isMenuOpen: isMenuOpen,
        anchorRef: buttonRef
    });
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: tooltip ? tooltip : accessibleLabel,
        isDisabled: isMenuOpen || isDisabled
    });
    const elementDetails = {
        type: 'button',
        buttonType: buttonType
    };
    const ariaProps = { 'aria-describedby': ariaDescribedBy };
    const rootButton = (jsxRuntime.jsx(preact.Fragment, { children: jsxRuntime.jsxs(BaseButton.BaseButton, { ...mergeProps.mergeProps(tooltipProps, triggerProps, ariaProps), styling: isMenuOpen ? ['min', 'active'] : ['min'], elementDetails: elementDetails, isDisabled: isDisabled, variant: variant, width: width, size: size, ref: buttonRef, "aria-label": accessibleLabel ?? tooltip, testId: testId, children: [jsxRuntime.jsx(ButtonLabelLayout.ButtonLabelLayout, { display: 'icons', startIcon: icon, endIcon: isIconOnly ? null : jsxRuntime.jsx(ChevronDown.SvgChevronDown, {}), size: size }), tooltipContent] }) }));
    /*TODO: Remove this hardcoded offsetValue so we have dropdown offset only set on one single place.
     Could be done via menu props or having a dropdownMenu component. JET-60595*/
    return isDisabled ? (rootButton) : (jsxRuntime.jsxs(preact.Fragment, { children: [rootButton, jsxRuntime.jsx(Menu.Menu, { ...menuProps, offsetValue: 4, "aria-label": accessibleLabel ?? tooltip, children: children })] }));
});
IconMenuButton.displayName = 'IconMenuButton';

exports.IconMenuButton = IconMenuButton;
//# sourceMappingURL=IconMenuButton-426f2aa8.js.map
