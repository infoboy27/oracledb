/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useRef, useLayoutEffect } from 'preact/hooks';
import { u as useAccessibleContext } from './useAccessibleContext-5744de8b.js';
import './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useTextFieldInputHandlers } from './useTextFieldInputHandlers-fb7c06b4.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { t as textInterpolations } from './textAlign-ad252afa.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { i as isInputPlaceholderShown } from './TextFieldUtils-8232bca7.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { TextFieldInputRedwoodTheme } from './UNSAFE_TextField/themes/redwood/TextFieldInputTheme.js';

const interpolations = [...Object.values(textInterpolations)];
const styleInterpolations = mergeInterpolations(interpolations);
// The WHATWG forms spec specifies the following input types that support setSelectedRange
const supportsSetSelection = ['text', 'search', 'url', 'tel', 'password', 'textarea'];
/**
 * Merge multiple ids into a space-separated list
 * @param ids The ids to be merged
 * @returns The space separated string of ids
 */
function mergeIDs(...ids) {
    return ids.filter(Boolean).join(' ') || undefined;
}
const TextFieldInput = ({ as = 'input', 'aria-autocomplete': ariaAutoComplete, 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, 'aria-expanded': ariaExpanded, 'aria-invalid': ariaInvalid, 'aria-label': ariaLabel, 'aria-labelledby': inputLabelledBy, 'aria-valuemax': ariaValueMax, 'aria-valuemin': ariaValueMin, 'aria-valuenow': ariaValueNow, 'aria-valuetext': ariaValueText, autoComplete, autoFocus, currentCommitValue, hasEmptyLabel, hasEndContent = false, hasInsideLabel = false, hasPrefix = false, hasStartContent = false, hasSuffix = false, id, inputRef, placeholder, isRequired, role, rows, spellcheck, type, value = '', variant = 'default', onInput, onCommit, onKeyDown, onKeyUp, onBlur, onFocus, ...props }) => {
    const { isDisabled, isFocused, isLoading, isReadonly } = useFormFieldContext();
    const { class: styleInterpolationClasses } = styleInterpolations(props);
    const hasValue = value !== '';
    const isTextArea = as === 'textarea';
    const isInput = as === 'input';
    const isPassword = type === 'password';
    const renderPrefix = !isDisabled && hasPrefix;
    const renderSuffix = !isDisabled && hasSuffix;
    const myPlaceholder = isInputPlaceholderShown(hasInsideLabel, hasValue, isFocused)
        ? placeholder
        : undefined;
    const { classes } = useComponentTheme(TextFieldInputRedwoodTheme, {
        type: isPassword ? 'isPassword' : 'notPassword',
        styleVariant: variant,
        textarea: isTextArea ? 'isTextArea' : 'notTextArea',
        input: isInput ? 'isInput' : 'notInput',
        div: 'notDiv',
        prefix: renderPrefix ? 'hasPrefix' : 'noPrefix',
        suffix: renderSuffix ? 'hasSuffix' : 'noSuffix',
        startContent: hasStartContent ? 'hasStartContent' : 'noStartContent',
        endContent: hasEndContent ? 'hasEndContent' : 'noEndContent',
        insideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel',
        value: hasValue ? 'hasValue' : 'noValue',
        focused: isFocused ? 'isFocused' : 'notFocused',
        disabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    const inputClasses = classNames([classes, styleInterpolationClasses]);
    const Comp = as || 'input';
    // ref to hold the text selection to restore.
    const selectionRef = useRef({
        start: 0,
        end: 0
    });
    const textFieldInputHandlers = useTextFieldInputHandlers({
        currentCommitValue,
        // Enter should not commit for textarea.
        isCommitOnEnter: as === 'input',
        value,
        onInput,
        onCommit,
        onKeyDown,
        selectionRef
    });
    const handlers = mergeProps(textFieldInputHandlers, { onBlur, onFocus });
    // the implicit default for tabindex on an input is 0, so do not explicitly set it.
    // JET-52914 - Implement Tabbable mode API contract in InputText
    // if not tabbable, spread tabbableModeProps on component
    const { isTabbable, tabbableModeProps } = useTabbableMode();
    // TODO: for autoComplete='off', need to configure attrs appropriately to make sure it
    // works across browsers and versions  (from review on 3/11/22)
    // JET-52089: add unsafe API for specifying an external label which is added to ariaLabelledBy on the input,
    // only when labelEdge is 'none' and label is ''. Since ariaLabelledBy takes precedence over all other
    // kinds of labels, this helps to ensure we don't override a meaningful label.
    const { UNSAFE_ariaLabelledBy } = useAccessibleContext();
    const ariaLabelledBy = hasEmptyLabel
        ? mergeIDs(inputLabelledBy, UNSAFE_ariaLabelledBy)
        : inputLabelledBy;
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const loadingAriaLabel = translations.formControl_loading();
    // Restore the saved selection when the value changes.  See JET-62763 for info on why this is needed.
    useLayoutEffect(() => {
        // This should never be a function in this case, This is here because of the Ref type.
        if (typeof inputRef !== 'function') {
            const inpElem = inputRef?.current;
            // only set the selection range if the element has focus
            // only set the selection range on supported types.
            if (document.activeElement === inpElem &&
                inpElem &&
                supportsSetSelection.includes(inpElem.type)) {
                inpElem.setSelectionRange(selectionRef.current.start, selectionRef.current.end);
            }
        }
    }, [value, inputRef]);
    return (jsx(Comp, { "aria-autocomplete": ariaAutoComplete, "aria-controls": ariaControls, "aria-describedby": ariaDescribedBy, "aria-expanded": ariaExpanded, "aria-invalid": ariaInvalid, "aria-label": isLoading ? loadingAriaLabel : ariaLabel ? ariaLabel : undefined, "aria-labelledby": ariaLabelledBy, "aria-required": isRequired ? true : undefined, "aria-valuemax": ariaValueMax, "aria-valuemin": ariaValueMin, "aria-valuenow": ariaValueNow, "aria-valuetext": ariaValueText, autocomplete: autoComplete, autofocus: autoFocus, class: inputClasses, disabled: isDisabled, id: id, onKeyUp: onKeyUp, placeholder: myPlaceholder, readonly: isReadonly, 
        // @ts-ignore
        ref: inputRef, role: role, rows: rows, spellcheck: spellcheck, type: type, value: value, ...handlers, ...(!isTabbable && tabbableModeProps) }));
};

export { TextFieldInput as T };
//# sourceMappingURL=TextFieldInput-3c39cb7b.js.map
