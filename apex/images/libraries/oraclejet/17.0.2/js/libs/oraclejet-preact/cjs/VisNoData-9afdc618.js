/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var UNSAFE_VisStatusMessage_themes_VisStatusMessageStyles_css = require('./UNSAFE_VisStatusMessage/themes/VisStatusMessageStyles.css.js');
var Flex = require('./Flex-fbba4ad6.js');
var classNames = require('./classNames-c14c6ef3.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var layoutUtils = require('./layoutUtils-56b6111c.js');

function VisStatusMessage({ children, ...otherProps }) {
    const itemClasses = classNames.classNames([otherProps.isSelectable ? '' : UNSAFE_VisStatusMessage_themes_VisStatusMessageStyles_css.userSelectStyles, UNSAFE_VisStatusMessage_themes_VisStatusMessageStyles_css.baseStyles]);
    return (jsxRuntime.jsx("div", { class: itemClasses, tabIndex: 0, role: "application", id: otherProps.id, "aria-label": otherProps['aria-label'], "aria-describedby": otherProps['aria-describedby'], "aria-labelledby": otherProps['aria-labelledby'], children: jsxRuntime.jsx(Flex.Flex, { width: "100%", height: "100%", justify: "center", align: "center", children: children }) }));
}

function VisNoData(props) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const noDataMsg = translations.vis_noData();
    const textId = layoutUtils.getRandomId();
    const { ariaLabelledBy, id } = getAriaLabelledBy({
        ariaLabel: props['aria-label'],
        ariaLabelledby: props['aria-labelledby'],
        textId
    });
    return (jsxRuntime.jsx(VisStatusMessage, { id: id, "aria-label": props['aria-label'], "aria-describedby": props['aria-describedby'], "aria-labelledby": ariaLabelledBy, children: jsxRuntime.jsx("span", { id: textId, children: noDataMsg }) }));
}
const getAriaLabelledBy = (props) => {
    const id = props.ariaLabel ? layoutUtils.getRandomId() : undefined;
    const ariaLabelledBy = `${props.ariaLabelledby ?? ''} ${id ?? ''} ${props.textId}`.trim();
    return { ariaLabelledBy, id };
};

exports.VisNoData = VisNoData;
exports.VisStatusMessage = VisStatusMessage;
//# sourceMappingURL=VisNoData-9afdc618.js.map
