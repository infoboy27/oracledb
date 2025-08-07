/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var CheckboxRadioContext = require('./CheckboxRadioContext-3b134bd1.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useFocus = require('./useFocus-1b288fb9.js');
var classNames = require('./classNames-c14c6ef3.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
require('preact/hooks');
require('./Flex-fbba4ad6.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');

require('./MessageFormattingUtils-42d84399.js');
require('./LayerHost-46e4d858.js');
require('./logger-2b636482.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');


require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
require('./FormContext-9452bd30.js');
require('./FormFieldContext-8418dc68.js');
require('./InputGroupContext-05f2a46f.js');
require('./Popup-881aae20.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');
var useFocusWithin = require('./useFocusWithin-eb7f956a.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
var IconUserAssistance = require('./IconUserAssistance-c31c2875.js');
var useId = require('./useId-6c0eeb27.js');
var StyledCheckbox = require('./StyledCheckbox-7576d44a.js');
var UNSAFE_Checkbox_themes_redwood_CheckboxTheme = require('./UNSAFE_Checkbox/themes/redwood/CheckboxTheme.js');
var useActive = require('./useActive-b15c9e7e.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');
var LayoutStyles_css = require('./LayoutStyles.css-8af668b9.js');

/**
 * CheckboxControl is an internal subcomponent used by both Checkbox and CheckboxItem.
 * It handles styling, placement of label, assistive text, and accessibility text for both parent components.
 * onCommit handling is handled in the parent components.
 */
const CheckboxControl = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, name, value, children, isChecked, isDisabled, isReadonly, isRequired, onChange, onKeyUp, assistiveText, helpSourceLink, helpSourceText, columnSpan = 1 }, ref = null) => {
    // hooks
    const id = useId.useId();
    const childWrapperRef = compat.useRef(null);
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { isActive, activeProps } = useActive.useActive();
    const { isFocusRingShown } = CheckboxRadioContext.useCheckboxRadioContext();
    const { isFocus, focusProps: { onFocus, onBlur } } = useFocus.useFocus();
    // styling
    const { classes: checkboxClasses, styles: { valueLabelStyle, checkboxSpanStyle } } = useComponentTheme.useComponentTheme(UNSAFE_Checkbox_themes_redwood_CheckboxTheme.CheckboxRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        focused: isFocus && isFocusRingShown ? 'isFocused' : 'notFocused'
    });
    // help available
    const hasUserAssistive = !isDisabled && !isReadonly && !!(assistiveText || helpSourceLink);
    const helpAvailableId = hasUserAssistive ? `${id}-help-available` : undefined;
    const uaId = hasUserAssistive ? `${id}-icon-ua` : undefined;
    const { formControl_helpAvailable } = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const helpAvailableString = formControl_helpAvailable();
    const userAssistiveHelp = hasUserAssistive ? (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: helpAvailableId, children: helpAvailableString })) : undefined;
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
    const { focusProps, isFocused: isFocusedWithin } = useFocusWithin.useFocusWithin();
    // The top level element needs the column span class on it.
    const classes = LayoutStyles_css.layoutSpanStyles.layoutSpanColumn[columnSpan];
    return (jsxRuntime.jsxs("label", { class: classNames.classNames([checkboxClasses, classes]), children: [jsxRuntime.jsx("span", { class: checkboxSpanStyle, ...activeProps, children: jsxRuntime.jsx(StyledCheckbox.StyledCheckbox, { "aria-describedby": stringUtils.merge([ariaDescribedBy, helpAvailableId]), name: name, value: value, onChange: onChange, onBlur: onBlur, onFocus: onFocus, onKeyUp: onKeyUp, onKeyDown: onKeyDown, isActive: isActive, isChecked: isChecked ? 'checked' : 'unchecked', isDisabled: isDisabled, isReadonly: isReadonly, isRequired: isRequired, ref: ref }) }), userAssistiveHelp, jsxRuntime.jsxs("span", { class: valueLabelStyle, children: [jsxRuntime.jsx("span", { ...activeProps, ...focusProps, onMouseDown: onMouseDownHandler, ref: childWrapperRef, children: children }), hasUserAssistive && (jsxRuntime.jsx(IconUserAssistance.IconUserAssistance, { assistiveText: assistiveText, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isTabbable: isTabbable && (isFocus || isFocusedWithin), id: uaId }))] })] }));
});

exports.CheckboxControl = CheckboxControl;
//# sourceMappingURL=CheckboxControl-24658cde.js.map
