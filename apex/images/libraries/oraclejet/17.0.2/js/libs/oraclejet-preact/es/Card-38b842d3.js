/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { p as paddingInterpolations } from './padding-01bef196.js';
import { c as colorInterpolations } from './colors-aab9ed12.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { a as ariaInterpolations } from './aria-efa0582c.js';
import { baseStyle } from './UNSAFE_Card/themes/CardStyles.css.js';
import { c as classNames } from './classNames-4e12b00d.js';

const interpolations = [
    ...Object.values(dimensionInterpolations),
    ...Object.values(colorInterpolations),
    ...Object.values(paddingInterpolations),
    ...Object.values(ariaInterpolations)
];
const mergedInterpolations = mergeInterpolations(interpolations);
/**
 * A card is a simple container that renders a group of related information in a styled rectangular area.
 * Width, height, padding, and background color are set through props.
 * The aria role for card is normally "group" but this changes to "button" for action cards.
 */
const Card = ({ children, ...rest }) => {
    const { class: mergedClasses, ariaLabel, ariaLabelledBy, ...mergedStyles } = mergedInterpolations(rest);
    const styles = classNames([baseStyle, mergedClasses]);
    return (jsx("div", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, role: "group", className: styles, style: mergedStyles, children: children }));
};

export { Card as C };
//# sourceMappingURL=Card-38b842d3.js.map
