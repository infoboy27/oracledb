/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Text = require('./Text-aaacb6a0.js');
var useNavigationListItem = require('./useNavigationListItem-74009187.js');
var Flex = require('./Flex-fbba4ad6.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var classNames = require('./classNames-c14c6ef3.js');
var WarningS = require('./WarningS-d9a02d39.js');
var ErrorS = require('./ErrorS-bfe081e3.js');
var InformationS = require('./InformationS-5bf32f4c.js');
var SuccessS = require('./SuccessS-862e9e4b.js');
var UNSAFE_NavigationListCommon_themes_redwood_NavigationListItemTheme = require('./UNSAFE_NavigationListCommon/themes/redwood/NavigationListItemTheme.js');
var Badge = require('./Badge-0e522f12.js');

/*TODO: JET-58535. Add ripple effect when touching navigationListItem. */
function BaseNavigationListItem({ itemKey, label, badge, metadata, severity = 'none', removeIcon }) {
    const itemRef = hooks.useRef(null);
    //Logic of the component handled here
    const { itemId, itemHandlers, itemClasses, isSelected, labelContainerClasses, labelContainerStyle } = useNavigationListItem.useNavigationListItem({
        itemKey
    });
    const severityRequirement = !(severity === 'none' || severity === undefined);
    const IconComponent = (severityValue) => {
        switch (severityValue) {
            case 'error':
                return jsxRuntime.jsx(ErrorS.SvgErrorS, { color: "danger" });
            case 'warning':
                return jsxRuntime.jsx(WarningS.SvgWarningS, { color: "warning" });
            case 'info':
                return jsxRuntime.jsx(InformationS.SvgInformationS, { color: "info" });
            case 'confirmation':
                return jsxRuntime.jsx(SuccessS.SvgSuccessS, { color: "success" });
            default:
                return null;
        }
    };
    const { styles: { iconLabelContainer, iconContainer, navigationItemMetadata } } = useComponentTheme.useComponentTheme(UNSAFE_NavigationListCommon_themes_redwood_NavigationListItemTheme.NavigationListItemRedwoodTheme);
    const navigationItemMatadata = classNames.classNames([navigationItemMetadata]);
    const endIconContainerClasses = classNames.classNames([iconLabelContainer, iconContainer]);
    const { styles: { navigationlistRemoveIcon } } = useComponentTheme.useComponentTheme(UNSAFE_NavigationListCommon_themes_redwood_NavigationListItemTheme.NavigationListItemRedwoodTheme);
    const removeClass = classNames.classNames([navigationlistRemoveIcon]);
    return (jsxRuntime.jsxs("li", { role: "tab", ...itemHandlers, "data-oj-key": itemKey, id: itemId, class: itemClasses, "aria-selected": isSelected, ref: itemRef, children: [label && (jsxRuntime.jsx("span", { class: labelContainerClasses, style: labelContainerStyle, children: jsxRuntime.jsx(Text.Text, { size: "inherit", weight: "inherit", variant: "inherit", children: label }) })), (metadata || severityRequirement || badge || removeIcon) && (jsxRuntime.jsxs(Flex.Flex, { gap: "2x", align: "center", justify: "end", flex: "1 1 auto", children: [' ', badge && (jsxRuntime.jsx("span", { class: endIconContainerClasses, children: jsxRuntime.jsx(Badge.Badge, { size: "md", variant: "neutralSubtle", children: badge }) })), metadata && (jsxRuntime.jsx("span", { class: navigationItemMatadata, children: jsxRuntime.jsx(Text.Text, { children: '( ' + metadata + ' )' }) })), severityRequirement && (jsxRuntime.jsx("span", { class: endIconContainerClasses, children: IconComponent(severity) })), removeIcon && jsxRuntime.jsx("span", { class: removeClass, children: removeIcon })] }))] }));
}

exports.BaseNavigationListItem = BaseNavigationListItem;
//# sourceMappingURL=BaseNavigationListItem-175a3f35.js.map
