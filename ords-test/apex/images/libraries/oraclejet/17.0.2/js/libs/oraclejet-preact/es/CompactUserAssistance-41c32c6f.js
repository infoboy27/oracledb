/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import 'preact/hooks';
import './Flex-24628925.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './IconButton-37310d21.js';
import './LayerHost-45f545d7.js';
import 'preact/compat';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import './logger-c92f309c.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './HiddenAccessibleStyles.styles.css';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import { UserAssistanceRedwoodTheme } from './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';
import { C as ComponentMessageContainer } from './ComponentMessageContainer-7d9228a3.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { P as Popup } from './Popup-8889a781.js';
import { S as Separator } from './Separator-93c70737.js';
import { u as usePopupFocusWithin } from './CompactHelpSource-548938ff.js';
import { dividerStyle, assistiveStyles } from './UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js';

function CompactUserAssistance({ anchorRef, assistiveText, fieldLabel, id, messages = [] }) {
    const { isInputFocused, isReadonly } = useFormFieldContext();
    const flip = { mainAxis: true, crossAxis: false };
    const { isFocused: isPopupFocused, popupProps } = usePopupFocusWithin();
    const isOpen = isInputFocused === true || isPopupFocused === true;
    const { baseTheme } = useComponentTheme(UserAssistanceRedwoodTheme);
    const uaCompactContent = isReadonly !== true && (messages.length > 0 || assistiveText) ? (jsx(Popup, { ...popupProps, placement: "end-top-corner", isOpen: isOpen, anchorRef: anchorRef, flipOptions: flip, tail: "simple", maxWidth: '296px', children: jsxs("div", { id: id, class: baseTheme, children: [messages.length > 0 && (jsx(ComponentMessageContainer, { fieldLabel: fieldLabel, messages: messages })), messages.length > 0 && assistiveText && (jsx("span", { class: dividerStyle, children: jsx(Separator, {}) })), assistiveText && jsx("span", { class: assistiveStyles, children: assistiveText })] }) })) : null;
    return uaCompactContent;
}

export { CompactUserAssistance as C };
//# sourceMappingURL=CompactUserAssistance-41c32c6f.js.map
