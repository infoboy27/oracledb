/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var classNames = require('./classNames-c14c6ef3.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
require('./TabbableModeContext-e99d527e.js');
require('preact/hooks');
require('./LayerHost-46e4d858.js');
require('preact/compat');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
require('./Flex-fbba4ad6.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');

require('./MessageFormattingUtils-42d84399.js');
require('./logger-2b636482.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');



require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
require('./InputGroupContext-05f2a46f.js');
require('./Popup-881aae20.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');
var CompactLabelAssistance = require('./CompactLabelAssistance-ae678fbd.js');

require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var UNSAFE_TextField_themes_redwood_TextFieldTheme = require('./UNSAFE_TextField/themes/redwood/TextFieldTheme.js');
var UNSAFE_Label_themes_redwood_LabelTheme = require('./UNSAFE_Label/themes/redwood/LabelTheme.js');

const StyledLabel = ({ hasValue, readonly, disabled, isFocused, isRequiredShown, helpIconId, helpSourceLink, helpSourceText, userAssistanceDensity = 'reflow', variant = 'inside', parentComponentVariant = 'textField', ...props }) => {
    const { isFormLayout, isReadonly: isReadonlyForm, labelWrapping } = useFormContext.useFormContext();
    const isInside = variant === 'inside';
    const isTextField = parentComponentVariant === 'textField';
    // because variants have to match strings, we have to take any boolean props and convert
    // them to a string value, (ie prefixed with "is" or "non")
    const { classes, styles: { uaDensityCompactLabel, uaDensityCompactLabelStart, uaDensityCompactLabelTopInside } } = useComponentTheme.useComponentTheme(UNSAFE_Label_themes_redwood_LabelTheme.LabelRedwoodTheme, {
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
    const { baseTheme: textFieldTheme } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldTheme.TextFieldRedwoodTheme);
    // TODO: We need to decide whether to standardize on 'class' or 'className'.  Otherwise, we'll
    // run into issues destructuring style interpolations, for example having to concatenate both.
    const compactLabelStyles = classNames.classNames([
        uaDensityCompactLabel,
        variant === 'start' ? uaDensityCompactLabelStart : uaDensityCompactLabelTopInside
    ]);
    const compactUADLabel = jsxRuntime.jsx("label", { ...props, class: compactLabelStyles });
    return userAssistanceDensity === 'compact' ? (jsxRuntime.jsxs("div", { class: classNames.classNames([classes, textFieldTheme]), children: [variant !== 'start' && compactUADLabel, jsxRuntime.jsx(CompactLabelAssistance.CompactLabelAssistance, { isRequiredShown: isRequiredShown, helpIconId: helpIconId, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, labelEdge: variant === 'top' || variant === 'start' ? variant : 'inside' }), variant === 'start' && compactUADLabel] })) : (jsxRuntime.jsx("label", { ...props, class: classNames.classNames([classes, textFieldTheme]) }));
};
const Label = ({ forId, ...props }) => {
    const { hasValue, isDisabled, isFocused, isReadonly } = useFormFieldContext.useFormFieldContext();
    return (jsxRuntime.jsx(StyledLabel, { for: forId, hasValue: hasValue, disabled: isDisabled, isFocused: isFocused, readonly: isReadonly, ...props }));
};

exports.Label = Label;
//# sourceMappingURL=Label-d9ad059f.js.map
