/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useAccessibleContext = require('./useAccessibleContext-c49d8d1b.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useTextFieldInputHandlers = require('./useTextFieldInputHandlers-7d653f39.js');
var classNames = require('./classNames-c14c6ef3.js');
var textAlign = require('./textAlign-f41f49db.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var TextFieldUtils = require('./TextFieldUtils-96baac38.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var UNSAFE_TextField_themes_redwood_TextFieldInputTheme = require('./UNSAFE_TextField/themes/redwood/TextFieldInputTheme.js');

const interpolations = [...Object.values(textAlign.textInterpolations)];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
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
    const { isDisabled, isFocused, isLoading, isReadonly } = useFormFieldContext.useFormFieldContext();
    const { class: styleInterpolationClasses } = styleInterpolations(props);
    const hasValue = value !== '';
    const isTextArea = as === 'textarea';
    const isInput = as === 'input';
    const isPassword = type === 'password';
    const renderPrefix = !isDisabled && hasPrefix;
    const renderSuffix = !isDisabled && hasSuffix;
    const myPlaceholder = TextFieldUtils.isInputPlaceholderShown(hasInsideLabel, hasValue, isFocused)
        ? placeholder
        : undefined;
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldInputTheme.TextFieldInputRedwoodTheme, {
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
    const inputClasses = classNames.classNames([classes, styleInterpolationClasses]);
    const Comp = as || 'input';
    // ref to hold the text selection to restore.
    const selectionRef = hooks.useRef({
        start: 0,
        end: 0
    });
    const textFieldInputHandlers = useTextFieldInputHandlers.useTextFieldInputHandlers({
        currentCommitValue,
        // Enter should not commit for textarea.
        isCommitOnEnter: as === 'input',
        value,
        onInput,
        onCommit,
        onKeyDown,
        selectionRef
    });
    const handlers = mergeProps.mergeProps(textFieldInputHandlers, { onBlur, onFocus });
    // the implicit default for tabindex on an input is 0, so do not explicitly set it.
    // JET-52914 - Implement Tabbable mode API contract in InputText
    // if not tabbable, spread tabbableModeProps on component
    const { isTabbable, tabbableModeProps } = useTabbableMode.useTabbableMode();
    // TODO: for autoComplete='off', need to configure attrs appropriately to make sure it
    // works across browsers and versions  (from review on 3/11/22)
    // JET-52089: add unsafe API for specifying an external label which is added to ariaLabelledBy on the input,
    // only when labelEdge is 'none' and label is ''. Since ariaLabelledBy takes precedence over all other
    // kinds of labels, this helps to ensure we don't override a meaningful label.
    const { UNSAFE_ariaLabelledBy } = useAccessibleContext.useAccessibleContext();
    const ariaLabelledBy = hasEmptyLabel
        ? mergeIDs(inputLabelledBy, UNSAFE_ariaLabelledBy)
        : inputLabelledBy;
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const loadingAriaLabel = translations.formControl_loading();
    // Restore the saved selection when the value changes.  See JET-62763 for info on why this is needed.
    hooks.useLayoutEffect(() => {
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
    return (jsxRuntime.jsx(Comp, { "aria-autocomplete": ariaAutoComplete, "aria-controls": ariaControls, "aria-describedby": ariaDescribedBy, "aria-expanded": ariaExpanded, "aria-invalid": ariaInvalid, "aria-label": isLoading ? loadingAriaLabel : ariaLabel ? ariaLabel : undefined, "aria-labelledby": ariaLabelledBy, "aria-required": isRequired ? true : undefined, "aria-valuemax": ariaValueMax, "aria-valuemin": ariaValueMin, "aria-valuenow": ariaValueNow, "aria-valuetext": ariaValueText, autocomplete: autoComplete, autofocus: autoFocus, class: inputClasses, disabled: isDisabled, id: id, onKeyUp: onKeyUp, placeholder: myPlaceholder, readonly: isReadonly, 
        // @ts-ignore
        ref: inputRef, role: role, rows: rows, spellcheck: spellcheck, type: type, value: value, ...handlers, ...(!isTabbable && tabbableModeProps) }));
};

exports.TextFieldInput = TextFieldInput;
//# sourceMappingURL=TextFieldInput-4904c227.js.map
