/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var padding = require('./padding-b9ee87ac.js');
var colors = require('./colors-ac3041c6.js');
var aria = require('./aria-889aedd0.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var useTestId = require('./useTestId-8234ec1e.js');
var UNSAFE_SelectionCard_themes_SelectionCardStyles_css = require('./UNSAFE_SelectionCard/themes/SelectionCardStyles.css.js');
var useHover = require('./useHover-910b8e32.js');

const interpolations = [
    ...Object.values(dimensions.dimensionInterpolations),
    ...Object.values(colors.colorInterpolations),
    ...Object.values(aria.ariaInterpolations),
    ...Object.values(padding.paddingInterpolations)
];
const mergedInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * A selection card is a container element that is a part of a collection of elements, and renders a group of related information in a styled rectangular area.
 * Width, height, and backgroundColor are set through props.
 */
const SelectionCard = ({ children, isSelected = false, testId, ...rest }) => {
    const { hoverProps, isHover } = useHover.useHover();
    const { class: mergedClasses, ...mergedStyles } = mergedInterpolations(rest);
    const selectionStyles = classNames.classNames([
        UNSAFE_SelectionCard_themes_SelectionCardStyles_css.baseStyle,
        mergedClasses,
        isHover && UNSAFE_SelectionCard_themes_SelectionCardStyles_css.hoverStyle,
        isSelected && (isHover ? UNSAFE_SelectionCard_themes_SelectionCardStyles_css.selectedHoverStyle : UNSAFE_SelectionCard_themes_SelectionCardStyles_css.selectedStyle)
    ]);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { role: "region", ...hoverProps, class: selectionStyles, style: mergedStyles, ...testIdProps, children: children }));
};

exports.SelectionCard = SelectionCard;
//# sourceMappingURL=SelectionCard-aa300118.js.map
