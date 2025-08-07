/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { c as classNames } from './classNames-4e12b00d.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import './TabbableModeContext-7d8ad946.js';
import 'preact/hooks';
import './LayerHost-45f545d7.js';
import 'preact/compat';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
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
import './logger-c92f309c.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './HiddenAccessibleStyles.styles.css';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './Popup-8889a781.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import { C as CompactLabelAssistance } from './CompactLabelAssistance-fc9478aa.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { TextFieldRedwoodTheme } from './UNSAFE_TextField/themes/redwood/TextFieldTheme.js';
import { LabelRedwoodTheme } from './UNSAFE_Label/themes/redwood/LabelTheme.js';

const StyledLabel = ({ hasValue, readonly, disabled, isFocused, isRequiredShown, helpIconId, helpSourceLink, helpSourceText, userAssistanceDensity = 'reflow', variant = 'inside', parentComponentVariant = 'textField', ...props }) => {
    const { isFormLayout, isReadonly: isReadonlyForm, labelWrapping } = useFormContext();
    const isInside = variant === 'inside';
    const isTextField = parentComponentVariant === 'textField';
    // because variants have to match strings, we have to take any boolean props and convert
    // them to a string value, (ie prefixed with "is" or "non")
    const { classes, styles: { uaDensityCompactLabel, uaDensityCompactLabelStart, uaDensityCompactLabelTopInside } } = useComponentTheme(LabelRedwoodTheme, {
        labelWrapping,
        position: variant,
        inside: isInside ? 'isInside' : 'notInside',
        inEnabledForm: isFormLayout && !isReadonlyForm ? 'isInEnabledForm' : 'notInEnabledForm',
        readonly: readonly ? 'isReadonly' : 'notReadonly',
        focused: isFocused ? 'isFocused' : 'nonFocused',
        formLayout: isFormLayout ? 'isFormLayout' : 'nonFormLayout',
        readonlyForm: isReadonlyForm ? 'isReadonlyForm' : 'notReadonlyForm',
        textField: isTextField ? 'isTextField' : 'notTextField',
        value: hasValue ? 'hasValue' : 'noValue',
        valueOrFocus: hasValue || isFocused ? 'hasValueOrFocus' : 'noValueOrFocus',
        animatedWhenInside: isTextField ? 'isAnimated' : 'notAnimated',
        disabled: isTextField && disabled ? 'isDisabled' : 'nonDisabled',
        userAssistanceDensity
    });
    const { baseTheme: textFieldTheme } = useComponentTheme(TextFieldRedwoodTheme);
    // TODO: We need to decide whether to standardize on 'class' or 'className'.  Otherwise, we'll
    // run into issues destructuring style interpolations, for example having to concatenate both.
    const compactLabelStyles = classNames([
        uaDensityCompactLabel,
        variant === 'start' ? uaDensityCompactLabelStart : uaDensityCompactLabelTopInside
    ]);
    const compactUADLabel = jsx("label", { ...props, class: compactLabelStyles });
    return userAssistanceDensity === 'compact' ? (jsxs("div", { class: classNames([classes, textFieldTheme]), children: [variant !== 'start' && compactUADLabel, jsx(CompactLabelAssistance, { isRequiredShown: isRequiredShown, helpIconId: helpIconId, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, labelEdge: variant === 'top' || variant === 'start' ? variant : 'inside' }), variant === 'start' && compactUADLabel] })) : (jsx("label", { ...props, class: classNames([classes, textFieldTheme]) }));
};
const Label = ({ forId, ...props }) => {
    const { hasValue, isDisabled, isFocused, isReadonly } = useFormFieldContext();
    return (jsx(StyledLabel, { for: forId, hasValue: hasValue, disabled: isDisabled, isFocused: isFocused, readonly: isReadonly, ...props }));
};

export { Label as L };
//# sourceMappingURL=Label-6674b3f2.js.map
