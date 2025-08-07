/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { p as paddingInterpolations } from './padding-01bef196.js';
import { c as colorInterpolations } from './colors-aab9ed12.js';
import { a as ariaInterpolations } from './aria-efa0582c.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { baseStyle, hoverStyle, selectedHoverStyle, selectedStyle } from './UNSAFE_SelectionCard/themes/SelectionCardStyles.css.js';
import { u as useHover } from './useHover-d5088fcd.js';

const interpolations = [
    ...Object.values(dimensionInterpolations),
    ...Object.values(colorInterpolations),
    ...Object.values(ariaInterpolations),
    ...Object.values(paddingInterpolations)
];
const mergedInterpolations = mergeInterpolations(interpolations);
/**
 * A selection card is a container element that is a part of a collection of elements, and renders a group of related information in a styled rectangular area.
 * Width, height, and backgroundColor are set through props.
 */
const SelectionCard = ({ children, isSelected = false, testId, ...rest }) => {
    const { hoverProps, isHover } = useHover();
    const { class: mergedClasses, ...mergedStyles } = mergedInterpolations(rest);
    const selectionStyles = classNames([
        baseStyle,
        mergedClasses,
        isHover && hoverStyle,
        isSelected && (isHover ? selectedHoverStyle : selectedStyle)
    ]);
    const testIdProps = useTestId(testId);
    return (jsx("div", { role: "region", ...hoverProps, class: selectionStyles, style: mergedStyles, ...testIdProps, children: children }));
};

export { SelectionCard as S };
//# sourceMappingURL=SelectionCard-79044c5f.js.map
