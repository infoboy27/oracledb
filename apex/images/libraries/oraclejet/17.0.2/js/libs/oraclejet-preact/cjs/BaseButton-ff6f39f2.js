/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var usePress = require('./usePress-00deca01.js');
var useHover = require('./useHover-910b8e32.js');
var useActive = require('./useActive-b15c9e7e.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useColorScheme = require('./useColorScheme-d2c4adcc.js');
var classNames = require('./classNames-c14c6ef3.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var clientHints$1 = require('./clientHints-9e411b6e.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var UNSAFE_BaseButton_themes_redwood_BaseButtonTheme = require('./UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useTestId = require('./useTestId-8234ec1e.js');

const interpolations = [...Object.values(dimensions.dimensionInterpolations)];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
const clientHints = clientHints$1.getClientHints();
// :active only works on IOS devices if a touch handler exists
const iosProps = clientHints.platform === 'ios' ? { ontouchstart: function () { } } : {};
const isHybrid = clientHints$1.getClientHints().hoverSupport === 'events';
const roleProps = (elType, hidden, isFocusable, isLabel, isSwitch) => {
    switch (elType) {
        case 'link':
            return { role: 'link' };
        case 'button':
            return isSwitch ? { role: 'switch' } : {};
        case 'span':
            return isLabel
                ? {}
                : hidden
                    ? { role: 'none' }
                    : isFocusable
                        ? isSwitch
                            ? { role: 'switch' }
                            : { role: 'button' }
                        : { role: 'img' };
        default:
            return hidden ? { role: 'none' } : isFocusable ? { role: 'button' } : { role: 'img' };
    }
};
const BaseButton = compat.forwardRef(({ variant, isDisabled = false, isRepeat = false, size, elementDetails = { type: 'button', buttonType: 'button' }, styling = ['default'], edge = 'none', 'aria-label': accessibleLabel, 'aria-hidden': ariaHidden, 'aria-expanded': ariaExpanded, 'aria-roledescription': ariaRoledescription, 'aria-haspopup': ariaHasPopup, 'aria-describedby': ariaDescribedBy, 'aria-pressed': ariaPressed, 'aria-checked': ariaChecked, testId, onBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart, onKeyDown, ...props }, ref) => {
    const pressHandler = (e) => {
        if (props.onAction) {
            props.onAction({
                reason: e.type == 'keyup' ? 'keyboard' : 'pointer'
            });
        }
    };
    const { pressProps } = usePress.usePress(pressHandler, {
        isDisabled,
        isRepeat
    });
    const isStyled = (name) => {
        return styling.indexOf(name) > -1;
    };
    const { hoverProps, isHover } = useHover.useHover({ isDisabled: !isHybrid });
    const { activeProps, isActive } = useActive.useActive();
    const { class: cls, ...styles } = styleInterpolations(props);
    const { type: elementType = 'button', isFocusable: isElementFocusable = true, isLabel: isElementLabel = false, isSwitch: isElementSwitch = false, buttonType = 'button', ...elementProps } = { ...elementDetails };
    const typeProps = elementType === 'button' && buttonType === 'button' ? { type: buttonType } : {};
    // 'role' should be 'none' when aria-hidden is true or 'img' when false and not focusable
    const role = roleProps(elementType, ariaHidden ?? false, isElementFocusable, isElementLabel, isElementSwitch);
    const ElementType = elementDetails.type;
    const isSpan = ElementType == 'span';
    const isBaseButton = ElementType == 'button';
    const { tabbableModeProps } = useTabbableMode.useTabbableMode(isDisabled);
    const colorScheme = useColorScheme.useColorScheme();
    const { variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_BaseButton_themes_redwood_BaseButtonTheme.BaseButtonRedwoodTheme, {
        size,
        variant,
        unstyled: isStyled('unstyled') ? 'isUnstyled' : 'notUnstyled',
        embedded: isStyled('embedded') ? 'isEmbedded' : 'notEmbedded',
        container: isStyled('container') ? 'isContainer' : 'notContainer',
        noBorderRadiusStart: isStyled('noBorderRadiusStart')
            ? 'isNoBorderRadiusStart'
            : 'notNoBorderRadiusStart',
        noBorderRadiusEnd: isStyled('noBorderRadiusEnd')
            ? 'isNoBorderRadiusEnd'
            : 'notNoBorderRadiusEnd',
        noBorderStart: isStyled('noBorderStart') ? 'isNoBorderStart' : 'notNoBorderStart',
        noBorderEnd: isStyled('noBorderEnd') ? 'isNoBorderEnd' : 'notNoBorderEnd',
        activeStyle: isStyled('active') ? 'isActiveStyle' : 'notActiveStyle',
        selectedStyle: isStyled('selected') ? 'isSelectedStyle' : 'notSelectedStyle',
        buttonSetItem: isStyled('buttonSetItem') ? 'isButtonSetItem' : 'notButtonSetItem',
        trailingItem: isStyled('trailingItem') ? 'isTrailingItem' : 'notTrailingItem',
        fill: isStyled('fill') ? 'isFill' : 'notFill',
        min: isStyled('min') ? 'isMin' : 'notMin',
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        edge,
        hybrid: isHybrid ? 'isHybrid' : 'notHybrid',
        active: isActive ? 'isActive' : 'notActive',
        hover: isHover ? 'isHover' : 'notHover',
        span: isSpan ? 'isSpan' : 'notSpan',
        widthEqual: isStyled('widthEqual') ? 'isWidthEqual' : 'notWidthEqual',
        widthAuto: isStyled('widthAuto') ? 'isWidthAuto' : 'notWidthAuto',
        colorScheme
    });
    const globalEventProps = {
        onBlur,
        onFocus,
        onMouseEnter,
        onMouseLeave,
        onTouchEnd,
        onTouchStart,
        onKeyDown
    };
    const arDisabled = isBaseButton ? {} : isDisabled ? { 'aria-disabled': isDisabled } : {};
    const arHaspopups = ariaHasPopup ? { 'aria-haspopup': ariaHasPopup } : {};
    const ariaProps = role.role === 'none'
        ? {}
        : {
            'aria-label': accessibleLabel,
            'aria-describedby': ariaDescribedBy,
            'aria-hidden': ariaHidden,
            'aria-roledescription': ariaRoledescription,
            'aria-expanded': ariaExpanded,
            'aria-pressed': ariaPressed,
            'aria-checked': ariaChecked,
            ...arDisabled,
            ...arHaspopups
        };
    const mergedProps = mergeProps.mergeProps(elementProps, pressProps, iosProps, hoverProps, isStyled('container') ? {} : activeProps, globalEventProps);
    const wrapperClasses = classNames.classNames([cls, variantClasses]);
    const testIdProps = useTestId.useTestId(testId);
    const getTabIndex = () => {
        if ((isSpan && (isElementFocusable === false || isDisabled)) ||
            (isBaseButton && isDisabled)) {
            // no tabIndex value should be defined for disabled button elements and non-focusable or disabled span elements
            return { tabIndex: undefined };
        }
        return tabbableModeProps;
    };
    return (jsxRuntime.jsx(ElementType
    // The ref casting was done to satisfy TS compiler, when the forwardRef had to be updated to ForwardedRef.
    , { 
        // The ref casting was done to satisfy TS compiler, when the forwardRef had to be updated to ForwardedRef.
        ref: ref, disabled: isDisabled, class: wrapperClasses, style: styles, autofocus: props['autofocus'], title: props.title, ...ariaProps, ...getTabIndex(), ...typeProps, ...testIdProps, ...mergedProps, ...role, children: props.children }));
});
BaseButton.displayName = 'BaseButton';

exports.BaseButton = BaseButton;
//# sourceMappingURL=BaseButton-ff6f39f2.js.map
