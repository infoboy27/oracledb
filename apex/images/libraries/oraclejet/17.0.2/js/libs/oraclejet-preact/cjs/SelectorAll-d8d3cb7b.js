/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Flex = require('./Flex-fbba4ad6.js');
var usePress = require('./usePress-00deca01.js');
var UNSAFE_Selector_themes_SelectorStyles_css = require('./UNSAFE_Selector/themes/SelectorStyles.css.js');
var StyledCheckbox = require('./StyledCheckbox-7576d44a.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useActive = require('./useActive-b15c9e7e.js');
var useFocus = require('./useFocus-1b288fb9.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var useHover = require('./useHover-910b8e32.js');

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
    const inputRef = hooks.useRef(null);
    const { isActive, activeProps } = useActive.useActive();
    const { isFocus, focusProps } = useFocus.useFocus();
    const { pressProps } = usePress.usePress(pressHandler);
    const { isHover, hoverProps } = useHover.useHover();
    const isChecked = selected === 'partial' || selected === 'partial-all'
        ? 'partial'
        : selected === 'all'
            ? 'checked'
            : 'unchecked';
    const testIdProps = useTestId.useTestId(testId);
    const onClick = () => {
        // ensure the checkbox is focused after click
        inputRef.current?.focus();
    };
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const tooltipLabel = selected === 'none' || selected === 'partial'
        ? translations.selectorAll_selectAll()
        : translations.selectorAll_deselectAll();
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: tooltipLabel,
        isDisabled: showTooltip === 'disabled' ? true : false
    });
    const ariaLabelText = !ariaLabel && !ariaLabelledby ? tooltipLabel : undefined;
    return (jsxRuntime.jsx("div", { class: UNSAFE_Selector_themes_SelectorStyles_css.styles.container, ...mergeProps.mergeProps({ onClick }, pressProps, tooltipProps), ...testIdProps, children: jsxRuntime.jsx("div", { class: UNSAFE_Selector_themes_SelectorStyles_css.styles.base, ...activeProps, ...hoverProps, children: jsxRuntime.jsxs(Flex.Flex, { align: "center", justify: "center", children: [jsxRuntime.jsx(StyledCheckbox.StyledCheckbox, { ref: inputRef, isHover: isHover, isChecked: isChecked, isActive: isActive, isFocusRingShown: isFocus, "aria-label": ariaLabel ? ariaLabel : ariaLabelText, "aria-labelledby": ariaLabelledby, onKeyDown: handleKeyboardEvent, onKeyUp: handleKeyboardEvent, ...focusProps }), tooltipContent] }) }) }));
}
const handleKeyboardEvent = (event) => {
    if (event.key == 'Enter') {
        // prevent active styles applied to checkbox
        event.stopPropagation();
    }
};

exports.SelectorAll = SelectorAll;
//# sourceMappingURL=SelectorAll-d8d3cb7b.js.map
