/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { u as usePress } from './usePress-97fc1cf1.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { u as useActive } from './useActive-7d9737a5.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useColorScheme } from './useColorScheme-e1b17324.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { BaseButtonRedwoodTheme } from './UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useTestId } from './useTestId-adde554c.js';

const interpolations = [...Object.values(dimensionInterpolations)];
const styleInterpolations = mergeInterpolations(interpolations);
const clientHints = getClientHints();
// :active only works on IOS devices if a touch handler exists
const iosProps = clientHints.platform === 'ios' ? { ontouchstart: function () { } } : {};
const isHybrid = getClientHints().hoverSupport === 'events';
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
const BaseButton = forwardRef(({ variant, isDisabled = false, isRepeat = false, size, elementDetails = { type: 'button', buttonType: 'button' }, styling = ['default'], edge = 'none', 'aria-label': accessibleLabel, 'aria-hidden': ariaHidden, 'aria-expanded': ariaExpanded, 'aria-roledescription': ariaRoledescription, 'aria-haspopup': ariaHasPopup, 'aria-describedby': ariaDescribedBy, 'aria-pressed': ariaPressed, 'aria-checked': ariaChecked, testId, onBlur, onFocus, onMouseEnter, onMouseLeave, onTouchEnd, onTouchStart, onKeyDown, ...props }, ref) => {
    const pressHandler = (e) => {
        if (props.onAction) {
            props.onAction({
                reason: e.type == 'keyup' ? 'keyboard' : 'pointer'
            });
        }
    };
    const { pressProps } = usePress(pressHandler, {
        isDisabled,
        isRepeat
    });
    const isStyled = (name) => {
        return styling.indexOf(name) > -1;
    };
    const { hoverProps, isHover } = useHover({ isDisabled: !isHybrid });
    const { activeProps, isActive } = useActive();
    const { class: cls, ...styles } = styleInterpolations(props);
    const { type: elementType = 'button', isFocusable: isElementFocusable = true, isLabel: isElementLabel = false, isSwitch: isElementSwitch = false, buttonType = 'button', ...elementProps } = { ...elementDetails };
    const typeProps = elementType === 'button' && buttonType === 'button' ? { type: buttonType } : {};
    // 'role' should be 'none' when aria-hidden is true or 'img' when false and not focusable
    const role = roleProps(elementType, ariaHidden ?? false, isElementFocusable, isElementLabel, isElementSwitch);
    const ElementType = elementDetails.type;
    const isSpan = ElementType == 'span';
    const isBaseButton = ElementType == 'button';
    const { tabbableModeProps } = useTabbableMode(isDisabled);
    const colorScheme = useColorScheme();
    const { variantClasses } = useComponentTheme(BaseButtonRedwoodTheme, {
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
    const mergedProps = mergeProps(elementProps, pressProps, iosProps, hoverProps, isStyled('container') ? {} : activeProps, globalEventProps);
    const wrapperClasses = classNames([cls, variantClasses]);
    const testIdProps = useTestId(testId);
    const getTabIndex = () => {
        if ((isSpan && (isElementFocusable === false || isDisabled)) ||
            (isBaseButton && isDisabled)) {
            // no tabIndex value should be defined for disabled button elements and non-focusable or disabled span elements
            return { tabIndex: undefined };
        }
        return tabbableModeProps;
    };
    return (jsx(ElementType
    // The ref casting was done to satisfy TS compiler, when the forwardRef had to be updated to ForwardedRef.
    , { 
        // The ref casting was done to satisfy TS compiler, when the forwardRef had to be updated to ForwardedRef.
        ref: ref, disabled: isDisabled, class: wrapperClasses, style: styles, autofocus: props['autofocus'], title: props.title, ...ariaProps, ...getTabIndex(), ...typeProps, ...testIdProps, ...mergedProps, ...role, children: props.children }));
});
BaseButton.displayName = 'BaseButton';

export { BaseButton as B };
//# sourceMappingURL=BaseButton-5b2791b1.js.map
