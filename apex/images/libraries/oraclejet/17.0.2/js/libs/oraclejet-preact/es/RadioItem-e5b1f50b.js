/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useFocus } from './useFocus-38c95977.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { u as useId } from './useId-03dbfdf0.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useInteractionStyle } from './useInteractionStyle-d65c72b6.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useCheckboxRadioContext } from './CheckboxRadioContext-fe425383.js';
import { S as SvgCheck } from './Check-c76fe451.js';
import { S as SvgRadiobuttonOff } from './RadiobuttonOff-3f1fd9dc.js';
import { S as SvgRadiobuttonOn } from './RadiobuttonOn-185d0fa4.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { u as useRadioSetContext, a as useRadioItemContext } from './RadioItemContext-fe419b75.js';
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
import 'preact/compat';
import './logger-c92f309c.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './Popup-8889a781.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import { I as IconUserAssistance } from './IconUserAssistance-c226cb4f.js';
import { radioIconVars } from './UNSAFE_RadioItem/themes/RadioIconContract.css.js';
import { RadioIconRedwoodTheme } from './UNSAFE_RadioItem/themes/redwood/RadioIconTheme.js';
import { RadioRedwoodTheme } from './UNSAFE_RadioItem/themes/redwood/RadioTheme.js';

/**
 * RadioItem is an input element of type radio.
 */
const RadioItem = ({ value, children, ...assistanceProps }) => {
    const { isReadonly: isFormReadonly, isDisabled: isFormDisabled } = useFormContext();
    const { isDisabled: isFieldDisabled, isReadonly: isFieldReadonly } = useFormFieldContext();
    const { name, value: groupValue, onCommit } = useRadioSetContext();
    const { isFocusRingShown } = useCheckboxRadioContext();
    const { index } = useRadioItemContext();
    const { isTabbable } = useTabbableMode();
    const id = useId();
    const { isFocus, focusProps } = useFocus();
    const isSelected = groupValue === value;
    const isDisabled = isFieldDisabled ?? isFormDisabled;
    const isReadonly = isFieldReadonly ?? isFormReadonly;
    const { interactionProps, applyActiveStyle } = useInteractionStyle();
    const { classes: radioClasses, styles: { valueLabelStyle } } = useComponentTheme(RadioRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        focused: isFocus && isFocusRingShown ? 'isFocused' : ''
    });
    const { classes: radioIconClasses } = useComponentTheme(RadioIconRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        selected: isSelected ? 'isSelected' : 'notSelected',
        readonly: isReadonly ? 'isReadonly' : 'notReadonly',
        active: applyActiveStyle ? 'isActive' : 'notActive'
    });
    const { assistiveText, helpSourceLink } = assistanceProps;
    const hasUserAssistive = !isDisabled && !isReadonly && !!(assistiveText || helpSourceLink);
    const helpAvailableId = hasUserAssistive ? `${id}-help-available` : undefined;
    const uaId = hasUserAssistive ? `${id}-icon-ua` : undefined;
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const helpAvailableString = translations.formControl_helpAvailable();
    const IconComp = isReadonly
        ? isSelected
            ? SvgCheck
            : SvgRadiobuttonOff
        : isSelected
            ? SvgRadiobuttonOn
            : SvgRadiobuttonOff;
    const tabIndex = isTabbable !== false && ((index === 0 && !groupValue) || isSelected) ? 0 : -1;
    return (jsx("div", { children: jsxs("label", { class: radioClasses, children: [jsxs(HiddenAccessible, { children: [jsx("input", { type: "radio", name: name, id: id, value: value, ...(!isReadonly &&
                                !isDisabled && {
                                onChange: (e) => {
                                    e.stopPropagation();
                                    onCommit?.({ previousValue: groupValue, value });
                                }
                            }), checked: isSelected, disabled: isDisabled, "aria-describedby": helpAvailableId, tabIndex: tabIndex, ...focusProps }), hasUserAssistive && (jsx(HiddenAccessible, { id: helpAvailableId, isHidden: true, children: helpAvailableString }))] }), jsx("span", { "aria-hidden": "true", class: radioIconClasses, ...interactionProps, children: jsx(IconComp, { size: radioIconVars.iconSize, color: "currentColor" }) }), jsxs("span", { class: valueLabelStyle, children: [jsx("span", { ...interactionProps, children: children }), hasUserAssistive && (jsx(IconUserAssistance, { ...assistanceProps, isTabbable: isTabbable && isFocus, id: uaId }))] })] }) }));
};

export { RadioItem as R };
//# sourceMappingURL=RadioItem-e5b1f50b.js.map
