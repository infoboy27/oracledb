/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import './logger-c92f309c.js';
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
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './HiddenAccessibleStyles.styles.css';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { C as ComponentMessageContainer } from './ComponentMessageContainer-7d9228a3.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { I as InlineHelp } from './InlineHelp-95ca55a5.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { UserAssistanceRedwoodTheme } from './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';
import { c as classNames } from './classNames-4e12b00d.js';
import './InputGroupContext-20bdbd6e.js';
import { u as useInputGroupContext } from './useInputGroupContext-1d19411e.js';
import { u as useTestId } from './useTestId-adde554c.js';

function InlineRequired({ align = 'end', hasHelp = false, hasMessages = false }) {
    const { classes } = useComponentTheme(UserAssistanceRedwoodTheme, {
        align,
        visible: hasHelp || hasMessages ? 'hide' : 'show' // TODO: fix typing so that options autocomplete
    });
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const requiredStr = translations.userAssistance_required();
    return jsx("div", { class: classes, children: requiredStr });
}

// defaults to type='reflow'. If this is within an oj-form-layout, the o-f-l
// will pass down its type which defaults to 'efficient' (TODO).
function InlineUserAssistanceContainer({ variant = 'reflow', children, id, testId }) {
    const { classes, styles: { inlineContainerBaseStyles } } = useComponentTheme(UserAssistanceRedwoodTheme, {
        container: variant
    });
    const testIdProps = useTestId(testId);
    // we want to suppress the display of messages if it's in a group context
    const inputGroupContext = useInputGroupContext();
    if (inputGroupContext !== null)
        return null;
    const content = (jsx("div", { class: classNames([classes, inlineContainerBaseStyles]), id: id, ...testIdProps, children: children }));
    return content;
}

// This has the precedence rules for the user assistance.
function InlineUserAssistance({ assistiveText, fieldLabel, helpSourceLink, helpSourceText, id, isRequiredShown, requiredAlignment, messages = [], userAssistanceDensity, testId }) {
    const { isReadonly: isFormReadonly } = useFormContext();
    const needsUserAssistanceIfNoContent = userAssistanceDensity === 'efficient' && isFormReadonly === false;
    const { isFocused } = useFormFieldContext();
    const uaInlineContent = messages.length > 0 ? (jsx(ComponentMessageContainer, { fieldLabel: fieldLabel, messages: messages })) : (assistiveText || helpSourceLink) && isFocused ? (jsx(InlineHelp, { assistiveText: assistiveText, sourceLink: helpSourceLink, sourceText: helpSourceText })) : isRequiredShown ? (jsx(InlineRequired, { align: requiredAlignment })) : null;
    // when reflow we do not render unless it has content.
    // when efficient we render regardless of if it has content.
    // TODO: Get the userAssistanceDensity value from the FormContext
    return uaInlineContent || needsUserAssistanceIfNoContent ? (jsx(InlineUserAssistanceContainer, { id: id, variant: userAssistanceDensity, testId: testId, children: uaInlineContent })) : null;
}

export { InlineUserAssistanceContainer as I, InlineUserAssistance as a, InlineRequired as b };
//# sourceMappingURL=InlineUserAssistance-bb690d93.js.map
