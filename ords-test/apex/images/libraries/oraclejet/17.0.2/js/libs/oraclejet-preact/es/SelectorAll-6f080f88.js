/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { useRef } from 'preact/hooks';
import { F as Flex } from './Flex-24628925.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { styles } from './UNSAFE_Selector/themes/SelectorStyles.css.js';
import { S as StyledCheckbox } from './StyledCheckbox-7dc33a92.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useActive } from './useActive-7d9737a5.js';
import { u as useFocus } from './useFocus-38c95977.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useHover } from './useHover-d5088fcd.js';

/**
 * The SelectorAll component renders checkboxes for select all case.
 */
function SelectorAll({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby, selected, onChange, showTooltip = 'disabled', testId }) {
    const pressHandler = (event) => {
        if (selected == 'none' || selected == 'partial') {
            onChange?.({ value: { all: true, deletedKeys: new Set() }, target: event.target });
        }
        else {
            onChange?.({ value: { all: false, keys: new Set() }, target: event.target });
        }
    };
    const inputRef = useRef(null);
    const { isActive, activeProps } = useActive();
    const { isFocus, focusProps } = useFocus();
    const { pressProps } = usePress(pressHandler);
    const { isHover, hoverProps } = useHover();
    const isChecked = selected === 'partial' || selected === 'partial-all'
        ? 'partial'
        : selected === 'all'
            ? 'checked'
            : 'unchecked';
    const testIdProps = useTestId(testId);
    const onClick = () => {
        // ensure the checkbox is focused after click
        inputRef.current?.focus();
    };
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const tooltipLabel = selected === 'none' || selected === 'partial'
        ? translations.selectorAll_selectAll()
        : translations.selectorAll_deselectAll();
    const { tooltipContent, tooltipProps } = useTooltip({
        text: tooltipLabel,
        isDisabled: showTooltip === 'disabled' ? true : false
    });
    const ariaLabelText = !ariaLabel && !ariaLabelledby ? tooltipLabel : undefined;
    return (jsx("div", { class: styles.container, ...mergeProps({ onClick }, pressProps, tooltipProps), ...testIdProps, children: jsx("div", { class: styles.base, ...activeProps, ...hoverProps, children: jsxs(Flex, { align: "center", justify: "center", children: [jsx(StyledCheckbox, { ref: inputRef, isHover: isHover, isChecked: isChecked, isActive: isActive, isFocusRingShown: isFocus, "aria-label": ariaLabel ? ariaLabel : ariaLabelText, "aria-labelledby": ariaLabelledby, onKeyDown: handleKeyboardEvent, onKeyUp: handleKeyboardEvent, ...focusProps }), tooltipContent] }) }) }));
}
const handleKeyboardEvent = (event) => {
    if (event.key == 'Enter') {
        // prevent active styles applied to checkbox
        event.stopPropagation();
    }
};

export { SelectorAll as S };
//# sourceMappingURL=SelectorAll-6f080f88.js.map
