/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var dimensions = require('./dimensions-b48bf1ab.js');
var padding = require('./padding-b9ee87ac.js');
var colors = require('./colors-ac3041c6.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var aria = require('./aria-889aedd0.js');
var UNSAFE_Card_themes_CardStyles_css = require('./UNSAFE_Card/themes/CardStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');

const interpolations = [
    ...Object.values(dimensions.dimensionInterpolations),
    ...Object.values(colors.colorInterpolations),
    ...Object.values(padding.paddingInterpolations),
    ...Object.values(aria.ariaInterpolations)
];
const mergedInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * A card is a simple container that renders a group of related information in a styled rectangular area.
 * Width, height, padding, and background color are set through props.
 * The aria role for card is normally "group" but this changes to "button" for action cards.
 */
const Card = ({ children, ...rest }) => {
    const { class: mergedClasses, ariaLabel, ariaLabelledBy, ...mergedStyles } = mergedInterpolations(rest);
    const styles = classNames.classNames([UNSAFE_Card_themes_CardStyles_css.baseStyle, mergedClasses]);
    return (jsxRuntime.jsx("div", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, role: "group", className: styles, style: mergedStyles, children: children }));
};

exports.Card = Card;
//# sourceMappingURL=Card-65e11c68.js.map
