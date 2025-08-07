/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useActionable } from './useActionable-706fa57b.js';
import { useCallback } from 'preact/hooks';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { multiVariantStyles } from './UNSAFE_Chip/themes/ChipStyles.css.js';
import { u as useInteractionStyle } from './useInteractionStyle-d65c72b6.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useTestId } from './useTestId-adde554c.js';

function Chip({ isSelected, isDisabled, 'aria-label': accessibleLabel, children, testId, onToggle }) {
    const handleAction = useCallback(() => {
        onToggle?.({ previousValue: isSelected, value: !isSelected });
    }, [isSelected, onToggle]);
    const { actionableProps } = useActionable(handleAction);
    const { interactionProps, applyActiveStyle, applyHoverStyle, applyPseudoHoverStyle } = useInteractionStyle();
    const mergedProps = mergeProps(actionableProps, interactionProps);
    const classes = multiVariantStyles({
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        hover: applyHoverStyle && !isDisabled && !isSelected ? 'isHover' : 'notHover',
        pseudoHover: applyPseudoHoverStyle && !isDisabled && !isSelected ? 'isPseudoHover' : 'notPseudoHover',
        active: isSelected || applyActiveStyle ? 'isActive' : 'notActive'
    });
    const { isTabbable } = useTabbableMode();
    const testIdProps = useTestId(testId);
    return isDisabled ? (jsx("div", { class: classes, ...testIdProps, children: children })) : (jsx("div", { ...mergedProps, class: classes, ...testIdProps, tabIndex: isTabbable ? 0 : -1, "aria-label": accessibleLabel, role: "switch", "aria-checked": isSelected ? 'true' : 'false', children: children }));
}

export { Chip as C };
//# sourceMappingURL=Chip-2c86a76f.js.map
