/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
require('preact/hooks');
require('./Flex-fbba4ad6.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');
require('./LayerHost-46e4d858.js');
require('preact/compat');

require('./MessageFormattingUtils-42d84399.js');
require('./logger-2b636482.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');



require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
var UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme = require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js');
var ComponentMessageContainer = require('./ComponentMessageContainer-a9195577.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var Popup = require('./Popup-881aae20.js');
var Separator = require('./Separator-85962472.js');
var CompactHelpSource = require('./CompactHelpSource-f4e9198b.js');
var UNSAFE_UserAssistance_themes_UserAssistanceStyles_css = require('./UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js');

function CompactUserAssistance({ anchorRef, assistiveText, fieldLabel, id, messages = [] }) {
    const { isInputFocused, isReadonly } = useFormFieldContext.useFormFieldContext();
    const flip = { mainAxis: true, crossAxis: false };
    const { isFocused: isPopupFocused, popupProps } = CompactHelpSource.usePopupFocusWithin();
    const isOpen = isInputFocused === true || isPopupFocused === true;
    const { baseTheme } = useComponentTheme.useComponentTheme(UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme.UserAssistanceRedwoodTheme);
    const uaCompactContent = isReadonly !== true && (messages.length > 0 || assistiveText) ? (jsxRuntime.jsx(Popup.Popup, { ...popupProps, placement: "end-top-corner", isOpen: isOpen, anchorRef: anchorRef, flipOptions: flip, tail: "simple", maxWidth: '296px', children: jsxRuntime.jsxs("div", { id: id, class: baseTheme, children: [messages.length > 0 && (jsxRuntime.jsx(ComponentMessageContainer.ComponentMessageContainer, { fieldLabel: fieldLabel, messages: messages })), messages.length > 0 && assistiveText && (jsxRuntime.jsx("span", { class: UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.dividerStyle, children: jsxRuntime.jsx(Separator.Separator, {}) })), assistiveText && jsxRuntime.jsx("span", { class: UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.assistiveStyles, children: assistiveText })] }) })) : null;
    return uaCompactContent;
}

exports.CompactUserAssistance = CompactUserAssistance;
//# sourceMappingURL=CompactUserAssistance-f88519f9.js.map
