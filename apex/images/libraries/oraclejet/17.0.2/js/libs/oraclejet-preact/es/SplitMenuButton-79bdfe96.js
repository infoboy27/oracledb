/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { M as Menu } from './Menu-c7ab8412.js';
import './MenuItem-a8f9c954.js';
import { useState, useCallback, useRef, useImperativeHandle } from 'preact/hooks';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { c as classNames } from './classNames-4e12b00d.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import { forwardRef } from 'preact/compat';
import './LayerHost-45f545d7.js';
import { T as Text } from './Text-da8588ce.js';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { SplitMenuButtonRedwoodTheme } from './UNSAFE_SplitMenuButton/themes/redwood/SplitMenuButtonTheme.css.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

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
const interpolations = [...Object.values(dimensionInterpolations)];
const styleInterpolations = mergeInterpolations(interpolations);
/**
 * A SplitMenuButton is a combined action and menu button.
 */
const SplitMenuButton = forwardRef(({ children, label = '', variant = 'outlined', isDisabled = false, size = 'md', testId, onAction, 'aria-describedby': ariaDescribedBy, onBlur: propsOnBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart, ...props }, ref) => {
    const [isMenuOpen, setIsMenuOpen] = useState(false);
    const [isActive, setIsActive] = useState(false);
    const { class: cls, ...styles } = styleInterpolations(props);
    // SPACE or ENTER on root area invokes action, as does CLICK/TAP on LEFT SIDE ACTION AREA
    // DOWN ARROW invokes menu, as does CLICK/TAP on RIGHT SIDE MENU AREA
    const onKeyDown = useCallback((event) => {
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
    const onKeyUp = useCallback((event) => {
        if (event.key === ' ' || event.key === 'Enter') {
            !isDisabled && onAction && onAction();
            setIsActive(false);
        }
    }, [isDisabled, onAction, setIsActive]);
    const onBlur = useCallback(() => {
        setIsActive(false);
    }, [setIsActive]);
    const _ref = useRef(null);
    useImperativeHandle(ref, () => _ref.current, [_ref]);
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
    const { classes, styles: themeStyles } = useComponentTheme(SplitMenuButtonRedwoodTheme, {
        styleVariant: variant
    });
    const dividerStyles = classNames([
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
    const rootStyles = classNames([classes, cls]);
    // Using Span for top button allows us to avoid :hover state rendering by
    // taking advantage of :enabled not on spans
    const rootButton = () => {
        return (jsx(BaseButton, { elementDetails: { type: 'span' }, ref: _ref, isDisabled: isDisabled, styling: ['container', 'min'], variant: variant, size: size, testId: testId, "aria-label": label, "aria-roledescription": "split menu button, press down arrow to invoke menu", "aria-describedby": ariaDescribedBy, "aria-expanded": isMenuOpen, children: jsxs(TabbableModeContext.Provider, { value: { isTabbable: false }, children: [jsx(BaseButton, { elementDetails: { type: 'span', isFocusable: false }, variant: variant, styling: getActionButtonStyling(isActive), size: size, isDisabled: isDisabled, "aria-hidden": true, onAction: onAction, children: jsx(Text, { truncation: 'ellipsis', weight: 'inherit', children: label }) }), jsx("div", { class: `${dividerStyles}` }), jsx(BaseButton, { elementDetails: { type: 'span', isFocusable: false }, variant: variant, styling: getMenuButtonStyling(isMenuOpen), size: size, isDisabled: isDisabled, "aria-hidden": true, onAction: menuHandler, children: jsx(ButtonLabelLayout, { display: "icons", startIcon: jsx(SvgChevronDown, {}), size: size, styling: "embedded" }) })] }) }));
    };
    if (isDisabled) {
        return (jsx("span", { role: "toolbar", class: rootStyles, style: styles, children: rootButton() }));
    }
    else {
        /*TODO: Remove this hardcoded offsetValue so we have dropdown offset only set on one single place.
          Could be done via menu props or having a dropdownMenu component. JET-60595*/
        /*TODO: Once menu expose a prop to set min width we would need to calculate offset width of button
         so we set the correct min width since dropdown menus are 200px but if triggered element width is
         bigger should be that size. JET-60745 */
        return (jsxs("span", { role: "toolbar", class: rootStyles, ...mergeProps(globalEventProps, customGlobalEventProps), style: styles, children: [rootButton(), jsx(Menu, { anchorRef: _ref, isOpen: isMenuOpen, onClose: handleClose, children: children })] }));
    }
});
function getMenuButtonStyling(isActive) {
    return isActive ? menuButtonActiveStyling : menuButtonStyling;
}
function getActionButtonStyling(isActive) {
    return isActive ? actionButtonActiveStyling : actionbuttonStyling;
}
SplitMenuButton.displayName = 'SplitMenuButton';

export { SplitMenuButton as S };
//# sourceMappingURL=SplitMenuButton-79bdfe96.js.map
