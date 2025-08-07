/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useFocus = require('./useFocus-1b288fb9.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var useId = require('./useId-6c0eeb27.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useInteractionStyle = require('./useInteractionStyle-442c6a12.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var CheckboxRadioContext = require('./CheckboxRadioContext-3b134bd1.js');
var Check = require('./Check-f72ac53c.js');
var RadiobuttonOff = require('./RadiobuttonOff-01086880.js');
var RadiobuttonOn = require('./RadiobuttonOn-7aa0ab08.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var RadioItemContext = require('./RadioItemContext-3a86c17d.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
require('preact/hooks');
require('./Flex-fbba4ad6.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');

require('./MessageFormattingUtils-42d84399.js');
require('./LayerHost-46e4d858.js');
require('preact/compat');
require('./logger-2b636482.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');


require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
require('./InputGroupContext-05f2a46f.js');
require('./Popup-881aae20.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
var IconUserAssistance = require('./IconUserAssistance-c31c2875.js');
var UNSAFE_RadioItem_themes_RadioIconContract_css = require('./UNSAFE_RadioItem/themes/RadioIconContract.css.js');
var UNSAFE_RadioItem_themes_redwood_RadioIconTheme = require('./UNSAFE_RadioItem/themes/redwood/RadioIconTheme.js');
var UNSAFE_RadioItem_themes_redwood_RadioTheme = require('./UNSAFE_RadioItem/themes/redwood/RadioTheme.js');

/**
 * RadioItem is an input element of type radio.
 */
const RadioItem = ({ value, children, ...assistanceProps }) => {
    const { isReadonly: isFormReadonly, isDisabled: isFormDisabled } = useFormContext.useFormContext();
    const { isDisabled: isFieldDisabled, isReadonly: isFieldReadonly } = useFormFieldContext.useFormFieldContext();
    const { name, value: groupValue, onCommit } = RadioItemContext.useRadioSetContext();
    const { isFocusRingShown } = CheckboxRadioContext.useCheckboxRadioContext();
    const { index } = RadioItemContext.useRadioItemContext();
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const id = useId.useId();
    const { isFocus, focusProps } = useFocus.useFocus();
    const isSelected = groupValue === value;
    const isDisabled = isFieldDisabled ?? isFormDisabled;
    const isReadonly = isFieldReadonly ?? isFormReadonly;
    const { interactionProps, applyActiveStyle } = useInteractionStyle.useInteractionStyle();
    const { classes: radioClasses, styles: { valueLabelStyle } } = useComponentTheme.useComponentTheme(UNSAFE_RadioItem_themes_redwood_RadioTheme.RadioRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        focused: isFocus && isFocusRingShown ? 'isFocused' : ''
    });
    const { classes: radioIconClasses } = useComponentTheme.useComponentTheme(UNSAFE_RadioItem_themes_redwood_RadioIconTheme.RadioIconRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        selected: isSelected ? 'isSelected' : 'notSelected',
        readonly: isReadonly ? 'isReadonly' : 'notReadonly',
        active: applyActiveStyle ? 'isActive' : 'notActive'
    });
    const { assistiveText, helpSourceLink } = assistanceProps;
    const hasUserAssistive = !isDisabled && !isReadonly && !!(assistiveText || helpSourceLink);
    const helpAvailableId = hasUserAssistive ? `${id}-help-available` : undefined;
    const uaId = hasUserAssistive ? `${id}-icon-ua` : undefined;
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const helpAvailableString = translations.formControl_helpAvailable();
    const IconComp = isReadonly
        ? isSelected
            ? Check.SvgCheck
            : RadiobuttonOff.SvgRadiobuttonOff
        : isSelected
            ? RadiobuttonOn.SvgRadiobuttonOn
            : RadiobuttonOff.SvgRadiobuttonOff;
    const tabIndex = isTabbable !== false && ((index === 0 && !groupValue) || isSelected) ? 0 : -1;
    return (jsxRuntime.jsx("div", { children: jsxRuntime.jsxs("label", { class: radioClasses, children: [jsxRuntime.jsxs(HiddenAccessible.HiddenAccessible, { children: [jsxRuntime.jsx("input", { type: "radio", name: name, id: id, value: value, ...(!isReadonly &&
                                !isDisabled && {
                                onChange: (e) => {
                                    e.stopPropagation();
                                    onCommit?.({ previousValue: groupValue, value });
                                }
                            }), checked: isSelected, disabled: isDisabled, "aria-describedby": helpAvailableId, tabIndex: tabIndex, ...focusProps }), hasUserAssistive && (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: helpAvailableId, isHidden: true, children: helpAvailableString }))] }), jsxRuntime.jsx("span", { "aria-hidden": "true", class: radioIconClasses, ...interactionProps, children: jsxRuntime.jsx(IconComp, { size: UNSAFE_RadioItem_themes_RadioIconContract_css.radioIconVars.iconSize, color: "currentColor" }) }), jsxRuntime.jsxs("span", { class: valueLabelStyle, children: [jsxRuntime.jsx("span", { ...interactionProps, children: children }), hasUserAssistive && (jsxRuntime.jsx(IconUserAssistance.IconUserAssistance, { ...assistanceProps, isTabbable: isTabbable && isFocus, id: uaId }))] })] }) }));
};

exports.RadioItem = RadioItem;
//# sourceMappingURL=RadioItem-f53a057a.js.map
