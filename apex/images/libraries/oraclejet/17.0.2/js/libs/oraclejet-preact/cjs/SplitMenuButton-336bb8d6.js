/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var ButtonLabelLayout = require('./ButtonLabelLayout-3399b9e1.js');
var ChevronDown = require('./ChevronDown-ec558844.js');
var Menu = require('./Menu-7f8ca235.js');
require('./MenuItem-9a73694f.js');
var hooks = require('preact/hooks');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var classNames = require('./classNames-c14c6ef3.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
var compat = require('preact/compat');
require('./LayerHost-46e4d858.js');
var Text = require('./Text-aaacb6a0.js');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var UNSAFE_SplitMenuButton_themes_redwood_SplitMenuButtonTheme_css = require('./UNSAFE_SplitMenuButton/themes/redwood/SplitMenuButtonTheme.css.js');
var mergeProps = require('./mergeProps-e3da7237.js');

const menuButtonStyling = [
    'embedded',
    'min',
    'noBorderRadiusStart',
    'noBorderStart'
];
const menuButtonActiveStyling = [...menuButtonStyling, 'active'];
const actionbuttonStyling = [
    'embedded',
    'fill',
    'noBorderRadiusEnd',
    'noBorderEnd'
];
const actionButtonActiveStyling = [...actionbuttonStyling, 'active'];
const interpolations = [...Object.values(dimensions.dimensionInterpolations)];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * A SplitMenuButton is a combined action and menu button.
 */
const SplitMenuButton = compat.forwardRef(({ children, label = '', variant = 'outlined', isDisabled = false, size = 'md', testId, onAction, 'aria-describedby': ariaDescribedBy, onBlur: propsOnBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart, ...props }, ref) => {
    const [isMenuOpen, setIsMenuOpen] = hooks.useState(false);
    const [isActive, setIsActive] = hooks.useState(false);
    const { class: cls, ...styles } = styleInterpolations(props);
    // SPACE or ENTER on root area invokes action, as does CLICK/TAP on LEFT SIDE ACTION AREA
    // DOWN ARROW invokes menu, as does CLICK/TAP on RIGHT SIDE MENU AREA
    const onKeyDown = hooks.useCallback((event) => {
        if (event.key === ' ' || event.key === 'Enter') {
            setIsActive(true);
        }
        else if (event.key == 'ArrowDown') {
            !isDisabled && setIsMenuOpen((menuOpen) => !menuOpen);
            // Prevent page scroll for down arrow, user definitely wanted to show menu in this case.
            // Don't prevent other keypress defaults, as user may want to hold SPACE down to scroll page.
            event.preventDefault();
        }
    }, [isDisabled, setIsMenuOpen, setIsActive]);
    const onKeyUp = hooks.useCallback((event) => {
        if (event.key === ' ' || event.key === 'Enter') {
            !isDisabled && onAction && onAction();
            setIsActive(false);
        }
    }, [isDisabled, onAction, setIsActive]);
    const onBlur = hooks.useCallback(() => {
        setIsActive(false);
    }, [setIsActive]);
    const _ref = hooks.useRef(null);
    hooks.useImperativeHandle(ref, () => _ref.current, [_ref]);
    const menuHandler = () => {
        setIsMenuOpen(!isMenuOpen);
    };
    const handleClose = (e) => {
        //Focus has to be set on the launcher when menu is dismissed or
        //item is "selected"
        if (e.reason === 'dismissed' || e.reason === 'itemAction') {
            _ref.current?.focus();
        }
        setIsMenuOpen(false);
    };
    const { classes, styles: themeStyles } = useComponentTheme.useComponentTheme(UNSAFE_SplitMenuButton_themes_redwood_SplitMenuButtonTheme_css.SplitMenuButtonRedwoodTheme, {
        styleVariant: variant
    });
    const dividerStyles = classNames.classNames([
        themeStyles.divider,
        isDisabled && themeStyles.disabledDivider
    ]);
    const globalEventProps = {
        onBlur: propsOnBlur,
        onFocus,
        onMouseEnter,
        onMouseLeave,
        onTouchEnd,
        onTouchStart
    };
    const customGlobalEventProps = {
        onKeyDown: isDisabled ? undefined : onKeyDown,
        onKeyUp: onKeyUp,
        onBlur: onBlur
    };
    const rootStyles = classNames.classNames([classes, cls]);
    // Using Span for top button allows us to avoid :hover state rendering by
    // taking advantage of :enabled not on spans
    const rootButton = () => {
        return (jsxRuntime.jsx(BaseButton.BaseButton, { elementDetails: { type: 'span' }, ref: _ref, isDisabled: isDisabled, styling: ['container', 'min'], variant: variant, size: size, testId: testId, "aria-label": label, "aria-roledescription": "split menu button, press down arrow to invoke menu", "aria-describedby": ariaDescribedBy, "aria-expanded": isMenuOpen, children: jsxRuntime.jsxs(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: false }, children: [jsxRuntime.jsx(BaseButton.BaseButton, { elementDetails: { type: 'span', isFocusable: false }, variant: variant, styling: getActionButtonStyling(isActive), size: size, isDisabled: isDisabled, "aria-hidden": true, onAction: onAction, children: jsxRuntime.jsx(Text.Text, { truncation: 'ellipsis', weight: 'inherit', children: label }) }), jsxRuntime.jsx("div", { class: `${dividerStyles}` }), jsxRuntime.jsx(BaseButton.BaseButton, { elementDetails: { type: 'span', isFocusable: false }, variant: variant, styling: getMenuButtonStyling(isMenuOpen), size: size, isDisabled: isDisabled, "aria-hidden": true, onAction: menuHandler, children: jsxRuntime.jsx(ButtonLabelLayout.ButtonLabelLayout, { display: "icons", startIcon: jsxRuntime.jsx(ChevronDown.SvgChevronDown, {}), size: size, styling: "embedded" }) })] }) }));
    };
    if (isDisabled) {
        return (jsxRuntime.jsx("span", { role: "toolbar", class: rootStyles, style: styles, children: rootButton() }));
    }
    else {
        /*TODO: Remove this hardcoded offsetValue so we have dropdown offset only set on one single place.
          Could be done via menu props or having a dropdownMenu component. JET-60595*/
        /*TODO: Once menu expose a prop to set min width we would need to calculate offset width of button
         so we set the correct min width since dropdown menus are 200px but if triggered element width is
         bigger should be that size. JET-60745 */
        return (jsxRuntime.jsxs("span", { role: "toolbar", class: rootStyles, ...mergeProps.mergeProps(globalEventProps, customGlobalEventProps), style: styles, children: [rootButton(), jsxRuntime.jsx(Menu.Menu, { anchorRef: _ref, isOpen: isMenuOpen, onClose: handleClose, children: children })] }));
    }
});
function getMenuButtonStyling(isActive) {
    return isActive ? menuButtonActiveStyling : menuButtonStyling;
}
function getActionButtonStyling(isActive) {
    return isActive ? actionButtonActiveStyling : actionbuttonStyling;
}
SplitMenuButton.displayName = 'SplitMenuButton';

exports.SplitMenuButton = SplitMenuButton;
//# sourceMappingURL=SplitMenuButton-336bb8d6.js.map
