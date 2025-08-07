/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { forwardRef, useRef } from 'preact/compat';
import { u as useCheckboxRadioContext } from './CheckboxRadioContext-fe425383.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useFocus } from './useFocus-38c95977.js';
import { c as classNames } from './classNames-4e12b00d.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import 'preact/hooks';
import './Flex-24628925.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './IconButton-37310d21.js';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import './LayerHost-45f545d7.js';
import './logger-c92f309c.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './FormContext-4d71f9c7.js';
import './FormFieldContext-68eb5946.js';
import './InputGroupContext-20bdbd6e.js';
import './Popup-8889a781.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import { u as useFocusWithin } from './useFocusWithin-30b1e2d8.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import { I as IconUserAssistance } from './IconUserAssistance-c226cb4f.js';
import { u as useId } from './useId-03dbfdf0.js';
import { S as StyledCheckbox } from './StyledCheckbox-7dc33a92.js';
import { CheckboxRedwoodTheme } from './UNSAFE_Checkbox/themes/redwood/CheckboxTheme.js';
import { u as useActive } from './useActive-7d9737a5.js';
import { m as merge } from './stringUtils-16f617bc.js';
import { l as layoutSpanStyles } from './LayoutStyles.css-a679044e.js';

/**
 * CheckboxControl is an internal subcomponent used by both Checkbox and CheckboxItem.
 * It handles styling, placement of label, assistive text, and accessibility text for both parent components.
 * onCommit handling is handled in the parent components.
 */
const CheckboxControl = forwardRef(({ 'aria-describedby': ariaDescribedBy, name, value, children, isChecked, isDisabled, isReadonly, isRequired, onChange, onKeyUp, assistiveText, helpSourceLink, helpSourceText, columnSpan = 1 }, ref = null) => {
    // hooks
    const id = useId();
    const childWrapperRef = useRef(null);
    const { isTabbable } = useTabbableMode();
    const { isActive, activeProps } = useActive();
    const { isFocusRingShown } = useCheckboxRadioContext();
    const { isFocus, focusProps: { onFocus, onBlur } } = useFocus();
    // styling
    const { classes: checkboxClasses, styles: { valueLabelStyle, checkboxSpanStyle } } = useComponentTheme(CheckboxRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        focused: isFocus && isFocusRingShown ? 'isFocused' : 'notFocused'
    });
    // help available
    const hasUserAssistive = !isDisabled && !isReadonly && !!(assistiveText || helpSourceLink);
    const helpAvailableId = hasUserAssistive ? `${id}-help-available` : undefined;
    const uaId = hasUserAssistive ? `${id}-icon-ua` : undefined;
    const { formControl_helpAvailable } = useTranslationBundle('@oracle/oraclejet-preact');
    const helpAvailableString = formControl_helpAvailable();
    const userAssistiveHelp = hasUserAssistive ? (jsx(HiddenAccessible, { id: helpAvailableId, children: helpAvailableString })) : undefined;
    // prevent auto scrolling
    const onKeyDown = (event) => {
        const { key } = event;
        if (!isReadonly && key !== undefined && key === ' ') {
            event.preventDefault();
        }
    };
    // we want to prevent mouseDown on Links to set active
    const onMouseDownHandler = (e) => {
        // check to see if the target is within an <a> tag and the tag is within the label
        const closestAnchor = e.target.closest('a');
        closestAnchor && childWrapperRef.current?.contains(closestAnchor)
            ? e.stopPropagation()
            : activeProps['onMouseDown']?.(e);
    };
    // don't allow key down to set active state
    delete activeProps['onKeyDown'];
    const { focusProps, isFocused: isFocusedWithin } = useFocusWithin();
    // The top level element needs the column span class on it.
    const classes = layoutSpanStyles.layoutSpanColumn[columnSpan];
    return (jsxs("label", { class: classNames([checkboxClasses, classes]), children: [jsx("span", { class: checkboxSpanStyle, ...activeProps, children: jsx(StyledCheckbox, { "aria-describedby": merge([ariaDescribedBy, helpAvailableId]), name: name, value: value, onChange: onChange, onBlur: onBlur, onFocus: onFocus, onKeyUp: onKeyUp, onKeyDown: onKeyDown, isActive: isActive, isChecked: isChecked ? 'checked' : 'unchecked', isDisabled: isDisabled, isReadonly: isReadonly, isRequired: isRequired, ref: ref }) }), userAssistiveHelp, jsxs("span", { class: valueLabelStyle, children: [jsx("span", { ...activeProps, ...focusProps, onMouseDown: onMouseDownHandler, ref: childWrapperRef, children: children }), hasUserAssistive && (jsx(IconUserAssistance, { assistiveText: assistiveText, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isTabbable: isTabbable && (isFocus || isFocusedWithin), id: uaId }))] })] }));
});

export { CheckboxControl as C };
//# sourceMappingURL=CheckboxControl-7174e0b2.js.map
