/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { userSelectStyles, baseStyles } from './UNSAFE_VisStatusMessage/themes/VisStatusMessageStyles.css.js';
import { F as Flex } from './Flex-24628925.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { g as getRandomId } from './layoutUtils-2374ab3e.js';

function VisStatusMessage({ children, ...otherProps }) {
    const itemClasses = classNames([otherProps.isSelectable ? '' : userSelectStyles, baseStyles]);
    return (jsx("div", { class: itemClasses, tabIndex: 0, role: "application", id: otherProps.id, "aria-label": otherProps['aria-label'], "aria-describedby": otherProps['aria-describedby'], "aria-labelledby": otherProps['aria-labelledby'], children: jsx(Flex, { width: "100%", height: "100%", justify: "center", align: "center", children: children }) }));
}

function VisNoData(props) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const noDataMsg = translations.vis_noData();
    const textId = getRandomId();
    const { ariaLabelledBy, id } = getAriaLabelledBy({
        ariaLabel: props['aria-label'],
        ariaLabelledby: props['aria-labelledby'],
        textId
    });
    return (jsx(VisStatusMessage, { id: id, "aria-label": props['aria-label'], "aria-describedby": props['aria-describedby'], "aria-labelledby": ariaLabelledBy, children: jsx("span", { id: textId, children: noDataMsg }) }));
}
const getAriaLabelledBy = (props) => {
    const id = props.ariaLabel ? getRandomId() : undefined;
    const ariaLabelledBy = `${props.ariaLabelledby ?? ''} ${id ?? ''} ${props.textId}`.trim();
    return { ariaLabelledBy, id };
};

export { VisStatusMessage as V, VisNoData as a };
//# sourceMappingURL=VisNoData-8593beaa.js.map
