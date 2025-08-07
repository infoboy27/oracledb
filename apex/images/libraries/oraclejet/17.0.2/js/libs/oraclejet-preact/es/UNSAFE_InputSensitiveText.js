/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { useCallback, useRef } from 'preact/hooks';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { u as useLengthFilter } from './useLengthFilter-f72f45ac.js';
import { L as Label } from './Label-6674b3f2.js';
import { O as ObfuscatedTextFieldInput } from './ObfuscatedTextFieldInput-48b8c60e.js';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import { T as TextField } from './TextField-323fe0e9.js';
import './TextFieldInput-3c39cb7b.js';
import { M as MaxLengthLiveRegion } from './MaxLengthLiveRegion-cd15b075.js';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useId } from './useId-03dbfdf0.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import { C as CompactUserAssistance } from './CompactUserAssistance-41c32c6f.js';
import './useTooltipControlled-2044f639.js';
import 'preact';
import './IconStyle.styles.css';
import './Popup-8889a781.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './LayerHost-45f545d7.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { u as useToggle } from './useToggle-8b7fcefe.js';
import { u as useClearIcon } from './useClearIcon-f0ff8de3.js';
import { b as beforeVNode } from './componentUtils-4681ea5c.js';
import { C as ClearIcon } from './ClearIcon-f1f796b4.js';
import { u as useCurrentValueReducer } from './useCurrentValueReducer-bdf796fa.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { R as RevealToggleIcon } from './RevealToggleIcon-9236963e.js';
import './useFocusWithin-30b1e2d8.js';
import './useMessageSeverity-65295e8f.js';
import './stringUtils-16f617bc.js';
import './useFormFieldContextProps-d07cd618.js';
import './lengthFilter-d249a7ab.js';
import './useFormFieldContext-626574fd.js';
import './classNames-4e12b00d.js';
import './useComponentTheme-d2f9e47f.js';
import './Flex-24628925.js';
import './useTestId-adde554c.js';
import './boxalignment-486c5ac9.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './Common/themes/themeContract.css.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './arrayUtils-35a58161.js';
import './boxalignment.styles.css';
import './vanilla-extract-sprinkles-createRuntimeSprinkles.esm-2d655d37.js';
import './dimensions-5229d942.js';
import './flexbox-529f25da.js';
import './flexbox.styles.css';
import './flexitem-7b7f7920.js';
import './flexitem.styles.css';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './FlexStyles.styles.css';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import './MessageBannerVariants.styles.css';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './IconButton-37310d21.js';
import './BaseButton-5b2791b1.js';
import './usePress-97fc1cf1.js';
import './useActive-7d9737a5.js';
import './useTabbableMode-a3a351d0.js';
import './useColorScheme-e1b17324.js';
import './mergeProps-88ea8306.js';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js';
import './UNSAFE_BaseButton/themes/BaseButtonStyles.css.js';
import './BaseButtonStyles.styles.css';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonVariants.css.js';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonBaseTheme.styles.css';
import './ButtonLabelLayout-03cfed16.js';
import './Text-da8588ce.js';
import './UNSAFE_Text/themes/TextStyles.css.js';
import './TextStyles.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js';
import './UNSAFE_ButtonLabelLayout/themes/ButtonLabelLayoutStyles.css.js';
import './ButtonLabelLayoutStyles.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.css.js';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutVariants.css.js';
import './ButtonLabelLayoutVariants.styles.css';
import './useTooltip-9dec25b3.js';
import './buttonUtils-6f35c4f4.js';
import './id-83adac50.js';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import './getLocale-1c41e86a.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './HiddenAccessibleStyles.styles.css';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './SeparatorStyles.styles.css';
import './CompactLabelAssistance-fc9478aa.js';
import './CompactHelpSource-548938ff.js';
import './Help-6b4bade1.js';
import './Icon-90c3a630.js';
import './UNSAFE_Icon/themes/IconStyle.css.js';
import './UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js';
import './UNSAFE_Label/themes/redwood/LabelTheme.js';
import './UNSAFE_Label/themes/LabelStyles.css.js';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.css.js';
import './UNSAFE_TextField/themes/redwood/TextFieldTheme.js';
import './UNSAFE_TextField/themes/TextFieldStyles.css.js';
import './SkeletonStyles.styles.css';
import './TextFieldLoadingStyles.styles.css';
import './TextFieldStyles.styles.css';
import './UNSAFE_TextField/themes/redwood/TextFieldBaseTheme.css.js';
import './UNSAFE_TextField/themes/redwood/TextFieldBaseTheme.styles.css';
import './UNSAFE_TextField/themes/redwood/TextFieldVariants.css.js';
import './TextFieldVariants.styles.css';
import './useEffectEvent-e320381e.js';
import './refUtils-b9d8d91a.js';
import './UNSAFE_TextField/themes/ObfuscatedTextFieldInputStyles.css.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import './useAccessibleContext-5744de8b.js';
import './textAlign-ad252afa.js';
import './text.styles.css';
import './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputTheme.js';
import './UNSAFE_TextField/themes/ReadonlyTextFieldInputStyles.css.js';
import './ReadonlyTextFieldInputStyles.styles.css';
import './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputVariants.css.js';
import './LabelValueLayout-23b74176.js';
import './LabelValueLayoutStyles.styles.css';
import './UNSAFE_RadioItem/themes/redwood/RadioTheme.js';
import './UNSAFE_RadioItem/themes/RadioStyles.css.js';
import './RadioStyles.styles.css';
import './UNSAFE_RadioItem/themes/redwood/RadioBaseTheme.css.js';
import './UNSAFE_RadioItem/themes/redwood/RadioBaseTheme.styles.css';
import './UNSAFE_RadioItem/themes/redwood/RadioVariants.css.js';
import './UNSAFE_TextField/themes/redwood/FormLayoutTheme.js';
import './UNSAFE_TextField/themes/FormLayoutStyles.css.js';
import './UNSAFE_TextField/themes/redwood/FormLayoutBaseTheme.css.js';
import './UNSAFE_TextField/themes/redwood/FormLayoutBaseTheme.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxTheme.js';
import './UNSAFE_Checkbox/themes/CheckboxStyles.css.js';
import './CheckboxStyles.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxBaseTheme.css.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxBaseTheme.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxVariants.css.js';
import './CheckboxVariants.styles.css';
import './UNSAFE_Skeleton/themes/redwood/SkeletonTheme.js';
import './UNSAFE_Skeleton/themes/SkeletonStyles.css.js';
import './UNSAFE_Skeleton/themes/redwood/SkeletonBaseTheme.css.js';
import './UNSAFE_Skeleton/themes/redwood/SkeletonBaseTheme.styles.css';
import './UNSAFE_Skeleton/themes/redwood/SkeletonVariants.css.js';
import './LayoutStyles.css-a679044e.js';
import './LayoutStyles.styles.css';
import './useInputGroupContext-1d19411e.js';
import './useUser-99920e02.js';
import './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldTheme.js';
import './UNSAFE_TextField/themes/ReadonlyTextFieldStyles.css.js';
import './ReadonlyTextFieldStyles.styles.css';
import './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldVariants.css.js';
import './ReadonlyTextFieldVariants.styles.css';
import './useTextFieldInputHandlers-fb7c06b4.js';
import './TextFieldUtils-8232bca7.js';
import './UNSAFE_TextField/themes/redwood/TextFieldInputTheme.js';
import './UNSAFE_TextField/themes/TextFieldInputStyles.css.js';
import './TextFieldInputStyles.styles.css';
import './UNSAFE_TextField/themes/redwood/TextFieldInputVariants.css.js';
import './TextFieldInputVariants.styles.css';
import './useDebounce-fa5a80e9.js';
import './LiveRegion-81216fe6.js';
import './LiveRegionStyles.styles.css';
import './ComponentMessageContainer-7d9228a3.js';
import './MessagesManager-0d60fea1.js';
import './SuccessS-b342103c.js';
import './ErrorS-e6e7e0e2.js';
import './InformationS-170eee52.js';
import './WarningS-67afbb93.js';
import './PRIVATE_Message/themes/MessageStyles.css.js';
import './soundUtils-88264cb5.js';
import './useAnimation-fe9990dc.js';
import './useMessagesContext-9e1dbe91.js';
import './Transition-f9501682.js';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageTheme.js';
import './UNSAFE_ComponentMessage/themes/ComponentMessageStyles.css.js';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.css.js';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.css.js';
import './InlineHelp-95ca55a5.js';
import './InlineHelpSource-b43def76.js';
import './Separator-93c70737.js';
import './Floating-9703160e.js';
import './useFloating-c99976f8.js';
import './positionUtils-1ec41fd0.js';
import './useOutsideClick-eb8324f6.js';
import './Layer-9b06412e.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import './UNSAFE_Floating/themes/redwood/FloatingTheme.js';
import './UNSAFE_Floating/themes/FloatingStyles.css.js';
import './FloatingStyles.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingVariants.css.js';
import './vanilla-extract-dynamic.esm-2955d60a.js';
import './UNSAFE_Floating/themes/FloatingContract.css.js';
import './useFocus-38c95977.js';
import './useTouch-4828df25.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js';
import './hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js';
import './TooltipContentStyles.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js';
import './TooltipContentVariants.styles.css';
import './EnvironmentProvider-f543a463.js';
import './LayerManager-625d2503.js';
import './tabbableUtils-dca964ca.js';
import './head-6f17c50c.js';
import './_arity-be492b9e.js';
import './_isArray-694cc52d.js';
import './_isString-675f1de9.js';
import './FocusTrap-8ddd383f.js';
import './FocusTracker-a0621449.js';
import './PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js';
import './FocusTrackerStyles.styles.css';
import './Modal-6b11d8cb.js';
import './UNSAFE_Modal/themes/ModalStyles.css.js';
import './ModalStyles.styles.css';
import './WindowOverlay-e14f8324.js';
import './UNSAFE_WindowOverlay/themes/WindowOverlayStyles.css.js';
import './WindowOverlayStyles.styles.css';
import './UNSAFE_WindowOverlay/themes/WindowOverlayContract.css.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayTheme.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.css.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.styles.css';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayVariants.css.js';
import './usePopupAnimation-4be04290.js';
import './useAnimationStatus-9ef65f0c.js';
import './popupAnimationUtils-d4c27cd1.js';
import './UNSAFE_Popup/themes/PopupContract.css.js';
import './UNSAFE_Popup/themes/redwood/PopupTheme.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.css.js';
import './PopupStyles.styles.css';
import './Common/themes/redwood/theme.js';
import './DeleteCircleS-9f2988b6.js';
import './ViewHide-fbe3f8fe.js';
import './View-0f9eaf88.js';
import './IconSwitchButton-61cabbfe.js';
import './useToggleAction-fc0f5399.js';
import './toggleButtonUtils-039c4eae.js';
import './ToggleButtonLabel-8c23fab3.js';

/**
 * An InputSensitiveText allows you to enter/edit sensitive data, obfuscating the input as the user types.
 * The obfuscation can be toggled off and on via a reveal toggle button.
 * Examples: Credit Card Number, Social Security Number, etc.
 */
const InputSensitiveText = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, autoFocus = false, columnSpan, hasClearIcon = 'never', hasRevealToggle = 'always', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, maxLength, maxLengthUnit, messages, placeholder, revealToggleLabel, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant = 'default', virtualKeyboard, onInput, onCommit, testId }, ref) => {
    const { currentCommitValue, dispatch } = useCurrentValueReducer({ value });
    const onInputAndDispatch = useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'input', payload: detail.value });
        onInput?.(detail);
    }, [onInput, dispatch]);
    const onCommitAndDispatch = useCallback((detail) => {
        // Should dispatch happen first? This will queue up a re-render, ordering should not cause issues (this is async)
        dispatch({ type: 'commit', payload: detail.value });
        onCommit?.(detail);
    }, [onCommit, dispatch]);
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const maxLengthDescribedByIdRef = useRef(useId());
    // The enabledAriaDescribedBy includes the maxLengthDescribedById in addition to what was passed in to aria-describedby.
    // We don't need to announce the max length message for readonly, as it only applies when editing the value.
    const enabledAriaDescribedBy = ariaDescribedBy
        ? `${ariaDescribedBy} ${maxLengthDescribedByIdRef.current}`
        : maxLengthDescribedByIdRef.current;
    const { bool: isRevealed, setFalse: setRevealedFalse, setTrue: setRevealedTrue } = useToggle(false);
    const { enabledElementRef, focusProps, isFocused, readonlyElementRef } = useFocusableTextField({ isDisabled, isReadonly, ref, onBlurWithin: setRevealedFalse });
    const { hoverProps, isHover } = useHover({ isDisabled: isReadonly || isDisabled || false });
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
        ariaDescribedBy: isReadonly || isDisabled ? ariaDescribedBy : enabledAriaDescribedBy,
        helpSourceLink,
        helpSourceText,
        isDisabled,
        isFocused,
        isReadonly,
        isRequiredShown,
        labelEdge,
        messages,
        styleVariant: variant,
        userAssistanceDensity,
        value
    });
    // Callback on the RevealToggleButton.
    // When the user clicks on the reveal button,
    // toggle revealing/masking password
    const onRevealIconToggle = useCallback(() => {
        isRevealed ? setRevealedFalse() : setRevealedTrue();
    }, [isRevealed, setRevealedFalse, setRevealedTrue]);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    // I'm using || and not ?? here because if they provide an empty string for the label, we want
    // to use our translated string, as an empty string would be an accessibility violation.
    const revealToggleAriaLabel = revealToggleLabel || translations.inputSensitiveText_hidden();
    // When hasRevealToggle === 'always', we still don't render the revealToggleButton when:
    // - isDisabled is true
    // - isReadonly is true and the value is empty or undefined.
    const revealToggleIcon = !isDisabled && (!isReadonly || !!value) && hasRevealToggle === 'always' ? (jsx(RevealToggleIcon, { onToggle: onRevealIconToggle, isRevealed: isRevealed, accessibleLabel: revealToggleAriaLabel })) : null;
    const onClickClearIcon = useCallback(() => {
        // Clicking the clear icon should put the focus on the input field
        enabledElementRef.current?.focus();
        // Send an event to clear the field's value
        onInputAndDispatch?.({ previousValue: value, value: '' });
    }, [onInputAndDispatch, value, enabledElementRef]);
    const maybeClearIcon = useClearIcon({
        clearIcon: jsx(ClearIcon, { onClick: onClickClearIcon, testId: `${testId}_clearicon` }),
        display: hasClearIcon,
        hasValue: formFieldContext.hasValue,
        isFocused,
        isEnabled: !isReadonly && !isDisabled,
        isHover
    });
    const endContentCombined = beforeVNode(revealToggleIcon, maybeClearIcon);
    // Handle length filter for user-typed inputs and controlled inputs
    const { valueLength, onFilteredInput } = useLengthFilter({
        maxLength,
        maxLengthUnit,
        value,
        onInput: onInputAndDispatch,
        onCommit: onCommitAndDispatch
    });
    const labelComp = labelEdge !== 'none' ? jsx(Label, { ...labelProps, children: label }) : undefined;
    const fieldLabelProps = {
        label: labelEdge !== 'none' ? labelComp : undefined,
        labelEdge: labelEdge !== 'none' ? labelEdge : undefined,
        labelStartWidth: labelEdge !== 'none' ? labelStartWidth : undefined
    };
    const ariaLabel = labelEdge === 'none' ? label : undefined;
    const isInlineDensity = userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow';
    const inlineUserAssistance = isInlineDensity ? (isDisabled || isReadonly ? (
    // save space for user assistance if density is 'efficient', even though we don't
    // render user assistance for disabled or readonly fields
    userAssistanceDensity !== 'efficient' ? undefined : (jsx(InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsx(InlineUserAssistance, { assistiveText: assistiveText, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const anchorRef = useRef(null);
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsx(CompactUserAssistance, { anchorRef: anchorRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    const obfuscationChar = '•';
    if (isReadonly) {
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "input", autoFocus: autoFocus, elementRef: readonlyElementRef, textAlign: textAlign, type: 'text', value: isRevealed ? value : obfuscationChar.repeat(value ? value.length : 0), hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside' }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, endContent: revealToggleIcon, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: anchorRef, testId: testId, ...fieldLabelProps }) }));
    }
    const hasMaxLength = maxLength !== undefined;
    const mainContent = (jsxs(Fragment, { children: [jsx(ObfuscatedTextFieldInput, { "aria-label": ariaLabel, autoFocus: autoFocus, character: obfuscationChar, currentCommitValue: currentCommitValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', inputRef: enabledElementRef, isRequired: isRequired, onInput: onFilteredInput, onCommit: onCommitAndDispatch, placeholder: placeholder, textAlign: textAlign, type: isMobile() ? virtualKeyboard : undefined, value: value, isRevealed: isRevealed, hasEndContent: !!(maybeClearIcon || revealToggleIcon), ...inputProps }), hasMaxLength && (jsx(HiddenAccessible, { id: maxLengthDescribedByIdRef.current, children: translations.formControl_maxLength({
                    MAX_LENGTH: `${maxLength}`
                }) })), hasMaxLength && isFocused && (jsx(MaxLengthLiveRegion, { maxLength: maxLength, valueLength: valueLength, testId: testId + '_remainingChars' }))] }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { columnSpan: columnSpan, endContent: endContentCombined, inlineUserAssistance: inlineUserAssistance, compactUserAssistance: compactUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...hoverProps }) }));
});
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if running on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}

export { InputSensitiveText };
//# sourceMappingURL=UNSAFE_InputSensitiveText.js.map
