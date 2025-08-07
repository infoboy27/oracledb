/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { S as SvgCheck } from './Check-c76fe451.js';
import { S as SvgCheckboxOff } from './CheckboxOff-d9693a93.js';
import { S as SvgCheckboxOn } from './CheckboxOn-965ecd2f.js';
import { S as SvgCheckboxMixed } from './CheckboxMixed-a08ccbb6.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { checkboxIconVars } from './UNSAFE_Checkbox/themes/CheckboxIconContract.css.js';
import { CheckboxIconRedwoodTheme } from './UNSAFE_Checkbox/themes/redwood/CheckboxIconTheme.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import './StyledCheckbox.styles.css';
import { u as useCollectionGestureContext } from './useCollectionGestureContext-f18b492f.js';

var hoverStyle = 'StyledCheckbox_hoverStyle__gne78f0';

/**
 * StyledCheckbox is a controlled component that displays a stylized checkbox for 'checked',
 * 'unchecked', and 'partial'. It passes intrinsic props to the native input element. This should be used
 * in conjunction with a label and be passed an onChange handler. If used within a collection use
 * 'useCollectionFocusRing', or use 'useCheckboxRadioContext' within RadioSet/CheckboxSet, to determine if you
 * should display the focus ring using keyboard navigation.
 */
const StyledCheckbox = forwardRef(({ onClick, isActive, isFocusRingShown, isDisabled, isReadonly, isRequired, isChecked: propIsChecked = 'unchecked', 
// Remaining props should be intrinsic input props only. If you need additional input props exposed,
// add to the picked items from InputProps.
id, name, value, onKeyUp, onKeyDown, onChange, onFocus, onBlur, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy, isHover }, ref = null) => {
    const { isTabbable } = useTabbableMode();
    const isPartial = propIsChecked === 'partial';
    const isChecked = propIsChecked === 'checked' || isPartial;
    const ariaChecked = isChecked ? (isPartial ? 'mixed' : true) : false;
    const { classes } = useComponentTheme(CheckboxIconRedwoodTheme, {
        disabled: isDisabled ? 'isDisabled' : 'notDisabled',
        checked: isChecked ? 'isChecked' : 'notChecked',
        readonly: isReadonly ? 'isReadonly' : 'notReadonly',
        active: isActive ? 'isActive' : 'notActive',
        focus: isFocusRingShown ? 'isFocused' : 'notFocused',
        iconSize: '4xUnits'
    });
    const IconComp = isReadonly
        ? isChecked
            ? SvgCheck
            : SvgCheckboxOff
        : isChecked
            ? isPartial
                ? SvgCheckboxMixed
                : SvgCheckboxOn
            : SvgCheckboxOff;
    const spanClass = isHover ? classes + ' ' + hoverStyle : classes;
    // JET-65187 oatb: Interactive controls must not be nested
    // For accessibility, we want aria-hidden to be true and disabled to be true when
    // the checkbox is 'embedded' in a collection in the dropdown of a SelectMultiple component.
    const isEmbedded = useCollectionGestureContext() === 'embedded';
    return (jsxs(Fragment, { children: [jsx(HiddenAccessible, { children: jsx("input", { ...(isReadonly ? { 'aria-readonly': true } : {}), "aria-checked": ariaChecked, ...(isEmbedded ? { 'aria-hidden': true } : {}), "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, "aria-required": isRequired, ref: ref, name: name, value: value, onKeyUp: onKeyUp, onKeyDown: onKeyDown, onBlur: onBlur, onChange: onChange, onFocus: onFocus, id: id, type: "checkbox", disabled: isDisabled || isEmbedded, checked: isChecked, tabIndex: isTabbable ? 0 : -1 }) }), jsx("span", { className: spanClass, "aria-hidden": "true", onClick: onClick, role: "img", children: jsx(IconComp, { size: checkboxIconVars.iconSize, color: "currentColor" }) })] }));
});

export { StyledCheckbox as S };
//# sourceMappingURL=StyledCheckbox-7dc33a92.js.map
