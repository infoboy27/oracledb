/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useActionable = require('./useActionable-c6f17f0f.js');
var classNames = require('./classNames-c14c6ef3.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var padding = require('./padding-b9ee87ac.js');
var colors = require('./colors-ac3041c6.js');
var aria = require('./aria-889aedd0.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var UNSAFE_ActionCard_themes_ActionCardStyles_css = require('./UNSAFE_ActionCard/themes/ActionCardStyles.css.js');
var useTestId = require('./useTestId-8234ec1e.js');

const interpolations = [
    ...Object.values(dimensions.dimensionInterpolations),
    ...Object.values(colors.colorInterpolations),
    ...Object.values(padding.paddingInterpolations),
    ...Object.values(aria.ariaInterpolations)
];
const mergedInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * An action card is a container that renders a group of related information in a styled rectangular area, provides enhanced styling for hover and focus states, and invokes an action event when clicked.
 * Width, height, padding, and background color are set through props.
 */
const ActionCard = compat.forwardRef(({ children, onAction, testId, ...rest }, ref) => {
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const pressHandler = (e) => {
        if (onAction) {
            onAction({
                reason: e.type == 'keyup' ? 'keyboard' : 'pointer'
            });
        }
    };
    const { actionableProps, isHover, isActive } = useActionable.useActionable(pressHandler);
    const { class: mergedClasses, ariaLabel, ariaLabelledBy, ...mergedStyles } = mergedInterpolations(rest);
    const actionStyles = classNames.classNames([
        UNSAFE_ActionCard_themes_ActionCardStyles_css.baseStyle,
        mergedClasses,
        isHover && UNSAFE_ActionCard_themes_ActionCardStyles_css.hoverStyle,
        isActive && UNSAFE_ActionCard_themes_ActionCardStyles_css.activeStyle
    ]);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, ref: ref, ...actionableProps, class: actionStyles, tabIndex: isTabbable ? 0 : -1, role: "button", style: mergedStyles, ...testIdProps, children: children }));
});

exports.ActionCard = ActionCard;
//# sourceMappingURL=ActionCard-aade4e40.js.map
