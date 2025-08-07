/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { I as InlineHelpSource } from './InlineHelpSource-b43def76.js';
import { UserAssistanceRedwoodTheme } from './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';

function InlineHelp({ assistiveText, sourceLink, sourceText }) {
    const { styles: { helpTextStyles } } = useComponentTheme(UserAssistanceRedwoodTheme);
    return (jsxs("div", { children: [assistiveText && sourceLink ? (jsx("span", { class: helpTextStyles, children: assistiveText })) : (assistiveText), sourceLink && jsx(InlineHelpSource, { source: sourceLink, children: sourceText })] }));
}

export { InlineHelp as I };
//# sourceMappingURL=InlineHelp-95ca55a5.js.map
