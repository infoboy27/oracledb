/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { S as SvgViewHide } from './ViewHide-fbe3f8fe.js';
import { S as SvgView } from './View-0f9eaf88.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { I as IconSwitchButton } from './IconSwitchButton-61cabbfe.js';

/**
 * RevealToggleIcon is a controlled toggle icon component with tooltip that displays
 * hide or show icons. It is used internally for input components that hide and show the content.
 */
function RevealToggleIcon({ accessibleLabel, isRevealed, onToggle, testId, tooltipHide, tooltipShow }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const hide = tooltipHide || translations.formControl_hide();
    const show = tooltipShow || translations.formControl_show();
    return (jsx(IconSwitchButton
    // we want to display the tooltip title of the expected action on toggle
    , { 
        // we want to display the tooltip title of the expected action on toggle
        tooltip: isRevealed ? hide : show, accessibleLabel: accessibleLabel, 
        // denote that the switch is selected when in the "masked" state
        isSelected: !isRevealed, onToggle: onToggle, testId: testId, size: "sm", children: isRevealed ? jsx(SvgViewHide, {}) : jsx(SvgView, {}) }));
}

export { RevealToggleIcon as R };
//# sourceMappingURL=RevealToggleIcon-9236963e.js.map
