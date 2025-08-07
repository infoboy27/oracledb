/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
require('preact/hooks');
require('./Flex-fbba4ad6.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('./logger-2b636482.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');
require('./LayerHost-46e4d858.js');
require('preact/compat');

require('./MessageFormattingUtils-42d84399.js');
var useTestId = require('./useTestId-8234ec1e.js');
var MessagesManager = require('./MessagesManager-9cc43d3a.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var classNames = require('./classNames-c14c6ef3.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var UNSAFE_ComponentMessage_themes_redwood_ComponentMessageTheme = require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageTheme.js');
var UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme = require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js');
var UNSAFE_ComponentMessage_themes_ComponentMessageStyles_css = require('./UNSAFE_ComponentMessage/themes/ComponentMessageStyles.css.js');

/**
 * The component that renders an individual message for inline component messaging.
 */
function ComponentMessage({ detail, fieldLabel, severity = 'error', testId }) {
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_ComponentMessage_themes_redwood_ComponentMessageTheme.ComponentMessageRedwoodTheme, {
        severity: severity ?? 'none'
    });
    const { baseTheme } = useComponentTheme.useComponentTheme(UNSAFE_UserAssistance_themes_redwood_UserAssistanceTheme.UserAssistanceRedwoodTheme);
    const styleClasses = classNames.classNames([classes, baseTheme]);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsxs("div", { class: styleClasses, "aria-live": "assertive", "aria-atomic": "true", ...testIdProps, children: [fieldLabel && jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { children: fieldLabel }), MessagesManager.isSeverityIconNeeded(severity) && (jsxRuntime.jsx(MessagesManager.MessageStartIcon, { severity: severity, testId: testId ? `${testId}-icon` : undefined, variant: "inline" })), jsxRuntime.jsx(MessagesManager.MessageSummary, { testId: testId ? `${testId}-summary` : undefined, text: detail, variant: "inline" })] }));
}

/**
 * Converts the messages data into Item
 *
 * @param messages The messages data passed down as prop
 * @returns The messages data as Item
 */
function generateMessagesData(messages) {
    return messages.map((message, index) => {
        return {
            key: index,
            data: {
                closeAffordance: 'off',
                severity: message.severity || 'error',
                detail: message.detail
            }
        };
    });
}
function ComponentMessageContainer({ fieldLabel, messages = [], testId }) {
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { class: UNSAFE_ComponentMessage_themes_ComponentMessageStyles_css.componentMessageContainerBase, ...testIdProps, children: jsxRuntime.jsx(MessagesManager.MessagesManager, { data: generateMessagesData(messages), children: ({ item }) => (jsxRuntime.jsx(ComponentMessage, { detail: item.data.detail, fieldLabel: fieldLabel, severity: item.data.severity, testId: testId ? `${testId}-message-${item.key}` : undefined }, item.key)) }) }));
}

exports.ComponentMessage = ComponentMessage;
exports.ComponentMessageContainer = ComponentMessageContainer;
//# sourceMappingURL=ComponentMessageContainer-a9195577.js.map
