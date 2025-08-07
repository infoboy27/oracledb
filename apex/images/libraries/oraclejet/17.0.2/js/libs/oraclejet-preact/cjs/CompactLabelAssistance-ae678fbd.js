/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var classNames = require('./classNames-c14c6ef3.js');
var CompactHelpSource = require('./CompactHelpSource-f4e9198b.js');
var UNSAFE_UserAssistance_themes_UserAssistanceStyles_css = require('./UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js');

const CompactLabelAssistance = ({ helpIconId, helpSourceLink, helpSourceText, isRequiredShown, labelEdge }) => {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const requiredStr = translations.userAssistance_required();
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: requiredStr,
        offset: { mainAxis: 8 }
    });
    const requiredStyles = classNames.classNames([
        UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.requiredIconBase,
        labelEdge === 'start' && UNSAFE_UserAssistance_themes_UserAssistanceStyles_css.requiredIconLabelEdgeStart
    ]);
    const requiredIndicator = isRequiredShown && (jsxRuntime.jsxs("span", { children: [jsxRuntime.jsx("span", { class: requiredStyles, ...tooltipProps }), tooltipContent] }));
    const helpIndicator = (helpSourceLink || helpSourceText) && (jsxRuntime.jsx(CompactHelpSource.CompactHelpSource, { id: helpIconId, labelEdge: labelEdge, source: helpSourceLink, children: helpSourceText }));
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [labelEdge !== 'start' && requiredIndicator, helpIndicator, labelEdge === 'start' && requiredIndicator] }));
};

exports.CompactLabelAssistance = CompactLabelAssistance;
//# sourceMappingURL=CompactLabelAssistance-ae678fbd.js.map
