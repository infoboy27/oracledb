/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import 'preact/hooks';
import './Flex-24628925.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import './logger-c92f309c.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './IconButton-37310d21.js';
import './LayerHost-45f545d7.js';
import 'preact/compat';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { i as isSeverityIconNeeded, M as MessageStartIcon, a as MessageSummary, b as MessagesManager } from './MessagesManager-0d60fea1.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { c as classNames } from './classNames-4e12b00d.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { ComponentMessageRedwoodTheme } from './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageTheme.js';
import { UserAssistanceRedwoodTheme } from './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';
import { componentMessageContainerBase } from './UNSAFE_ComponentMessage/themes/ComponentMessageStyles.css.js';

/**
 * The component that renders an individual message for inline component messaging.
 */
function ComponentMessage({ detail, fieldLabel, severity = 'error', testId }) {
    const { classes } = useComponentTheme(ComponentMessageRedwoodTheme, {
        severity: severity ?? 'none'
    });
    const { baseTheme } = useComponentTheme(UserAssistanceRedwoodTheme);
    const styleClasses = classNames([classes, baseTheme]);
    const testIdProps = useTestId(testId);
    return (jsxs("div", { class: styleClasses, "aria-live": "assertive", "aria-atomic": "true", ...testIdProps, children: [fieldLabel && jsx(HiddenAccessible, { children: fieldLabel }), isSeverityIconNeeded(severity) && (jsx(MessageStartIcon, { severity: severity, testId: testId ? `${testId}-icon` : undefined, variant: "inline" })), jsx(MessageSummary, { testId: testId ? `${testId}-summary` : undefined, text: detail, variant: "inline" })] }));
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
    const testIdProps = useTestId(testId);
    return (jsx("div", { class: componentMessageContainerBase, ...testIdProps, children: jsx(MessagesManager, { data: generateMessagesData(messages), children: ({ item }) => (jsx(ComponentMessage, { detail: item.data.detail, fieldLabel: fieldLabel, severity: item.data.severity, testId: testId ? `${testId}-message-${item.key}` : undefined }, item.key)) }) }));
}

export { ComponentMessageContainer as C, ComponentMessage as a };
//# sourceMappingURL=ComponentMessageContainer-7d9228a3.js.map
