/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useActionable } from './useActionable-706fa57b.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { p as paddingInterpolations } from './padding-01bef196.js';
import { c as colorInterpolations } from './colors-aab9ed12.js';
import { a as ariaInterpolations } from './aria-efa0582c.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { baseStyle, hoverStyle, activeStyle } from './UNSAFE_ActionCard/themes/ActionCardStyles.css.js';
import { u as useTestId } from './useTestId-adde554c.js';

const interpolations = [
    ...Object.values(dimensionInterpolations),
    ...Object.values(colorInterpolations),
    ...Object.values(paddingInterpolations),
    ...Object.values(ariaInterpolations)
];
const mergedInterpolations = mergeInterpolations(interpolations);
/**
 * An action card is a container that renders a group of related information in a styled rectangular area, provides enhanced styling for hover and focus states, and invokes an action event when clicked.
 * Width, height, padding, and background color are set through props.
 */
const ActionCard = forwardRef(({ children, onAction, testId, ...rest }, ref) => {
    const { isTabbable } = useTabbableMode();
    const pressHandler = (e) => {
        if (onAction) {
            onAction({
                reason: e.type == 'keyup' ? 'keyboard' : 'pointer'
            });
        }
    };
    const { actionableProps, isHover, isActive } = useActionable(pressHandler);
    const { class: mergedClasses, ariaLabel, ariaLabelledBy, ...mergedStyles } = mergedInterpolations(rest);
    const actionStyles = classNames([
        baseStyle,
        mergedClasses,
        isHover && hoverStyle,
        isActive && activeStyle
    ]);
    const testIdProps = useTestId(testId);
    return (jsx("div", { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, ref: ref, ...actionableProps, class: actionStyles, tabIndex: isTabbable ? 0 : -1, role: "button", style: mergedStyles, ...testIdProps, children: children }));
});

export { ActionCard as A };
//# sourceMappingURL=ActionCard-623c6191.js.map
