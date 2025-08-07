/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { UserAssistanceRedwoodTheme } from './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';

function InlineHelpSource({ children, source }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const userAssistance_learnMoreStr = translations.userAssistance_learnMore();
    children = children ?? userAssistance_learnMoreStr;
    // JET-52914 - Implement Tabbable mode API contract in InputText
    // if not tabbable, spread tabbableModeProps on component
    const { isTabbable, tabbableModeProps } = useTabbableMode();
    // TODO: Implement and use a preact Link component instead of using an anchor tag
    const { classes, styles } = useComponentTheme(UserAssistanceRedwoodTheme);
    const { helpSourceStyles } = styles; // TODO: refactor types so inferring works properly
    return (jsx("a", { class: classNames([classes, helpSourceStyles]), target: "_blank", href: source, ...(!isTabbable && tabbableModeProps), children: children }));
}

export { InlineHelpSource as I };
//# sourceMappingURL=InlineHelpSource-b43def76.js.map
