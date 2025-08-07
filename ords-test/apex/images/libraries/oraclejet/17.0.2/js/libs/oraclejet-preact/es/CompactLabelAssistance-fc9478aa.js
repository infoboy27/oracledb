/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx, Fragment } from 'preact/jsx-runtime';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { C as CompactHelpSource } from './CompactHelpSource-548938ff.js';
import { requiredIconBase, requiredIconLabelEdgeStart } from './UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js';

const CompactLabelAssistance = ({ helpIconId, helpSourceLink, helpSourceText, isRequiredShown, labelEdge }) => {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const requiredStr = translations.userAssistance_required();
    const { tooltipContent, tooltipProps } = useTooltip({
        text: requiredStr,
        offset: { mainAxis: 8 }
    });
    const requiredStyles = classNames([
        requiredIconBase,
        labelEdge === 'start' && requiredIconLabelEdgeStart
    ]);
    const requiredIndicator = isRequiredShown && (jsxs("span", { children: [jsx("span", { class: requiredStyles, ...tooltipProps }), tooltipContent] }));
    const helpIndicator = (helpSourceLink || helpSourceText) && (jsx(CompactHelpSource, { id: helpIconId, labelEdge: labelEdge, source: helpSourceLink, children: helpSourceText }));
    return (jsxs(Fragment, { children: [labelEdge !== 'start' && requiredIndicator, helpIndicator, labelEdge === 'start' && requiredIndicator] }));
};

export { CompactLabelAssistance as C };
//# sourceMappingURL=CompactLabelAssistance-fc9478aa.js.map
