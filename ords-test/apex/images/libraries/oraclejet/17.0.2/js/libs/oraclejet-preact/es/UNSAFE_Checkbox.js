/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { forwardRef, useRef, useCallback, useImperativeHandle } from 'preact/compat';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import 'preact/hooks';
import { u as useId } from './useId-03dbfdf0.js';
import './LayerHost-45f545d7.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import './Flex-24628925.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './IconButton-37310d21.js';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './HiddenAccessibleStyles.styles.css';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './FormFieldContext-68eb5946.js';
import './Popup-8889a781.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { C as CheckboxRadioContext } from './CheckboxRadioContext-fe425383.js';
import { C as CheckboxControl } from './CheckboxControl-7174e0b2.js';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './ComponentMessageContainer-7d9228a3.js';
import './useTestId-adde554c.js';
import './MessagesManager-0d60fea1.js';
import './classNames-4e12b00d.js';
import './SuccessS-b342103c.js';
import './Icon-90c3a630.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './useTooltip-9dec25b3.js';
import './UNSAFE_Icon/themes/IconStyle.css.js';
import './ErrorS-e6e7e0e2.js';
import './InformationS-170eee52.js';
import './WarningS-67afbb93.js';
import './PRIVATE_Message/themes/MessageStyles.css.js';
import './useTranslationBundle-cd815e10.js';
import './soundUtils-88264cb5.js';
import './useAnimation-fe9990dc.js';
import './useMessagesContext-9e1dbe91.js';
import './Transition-f9501682.js';
import './useComponentTheme-d2f9e47f.js';
import './HiddenAccessible-61197e7c.js';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageTheme.js';
import './UNSAFE_ComponentMessage/themes/ComponentMessageStyles.css.js';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.css.js';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceTheme.js';
import './UNSAFE_UserAssistance/themes/UserAssistanceStyles.css.js';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.css.js';
import './useFormFieldContext-626574fd.js';
import './InlineHelp-95ca55a5.js';
import './InlineHelpSource-b43def76.js';
import './useTabbableMode-a3a351d0.js';
import './useInputGroupContext-1d19411e.js';
import './boxalignment-486c5ac9.js';
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
import './MessageBannerVariants.styles.css';
import './Floating-9703160e.js';
import './useFloating-c99976f8.js';
import './useUser-99920e02.js';
import './positionUtils-1ec41fd0.js';
import './refUtils-b9d8d91a.js';
import './useOutsideClick-eb8324f6.js';
import './Layer-9b06412e.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
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
import './useHover-d5088fcd.js';
import './useToggle-8b7fcefe.js';
import './useFocus-38c95977.js';
import './useTouch-4828df25.js';
import './mergeProps-88ea8306.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js';
import './hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js';
import './TooltipContentStyles.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js';
import './TooltipContentVariants.styles.css';
import './EnvironmentProvider-f543a463.js';
import './LayerManager-625d2503.js';
import './BaseButton-5b2791b1.js';
import './usePress-97fc1cf1.js';
import './useActive-7d9737a5.js';
import './clientHints-c76a913b.js';
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
import './buttonUtils-6f35c4f4.js';
import './id-83adac50.js';
import './getLocale-1c41e86a.js';
import './stringUtils-16f617bc.js';
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
import './SeparatorStyles.styles.css';
import './useFocusWithin-30b1e2d8.js';
import './IconUserAssistance-c226cb4f.js';
import './Help-6b4bade1.js';
import './StyledCheckbox-7dc33a92.js';
import './Check-c76fe451.js';
import './CheckboxOff-d9693a93.js';
import './CheckboxOn-965ecd2f.js';
import './CheckboxMixed-a08ccbb6.js';
import './UNSAFE_Checkbox/themes/CheckboxIconContract.css.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconTheme.js';
import './UNSAFE_Checkbox/themes/CheckboxIconStyles.css.js';
import './CheckboxIconStyles.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconBaseTheme.css.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconBaseTheme.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconVariants.css.js';
import './CheckboxIconVariants.styles.css';
import './StyledCheckbox.styles.css';
import './useCollectionGestureContext-f18b492f.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxTheme.js';
import './UNSAFE_Checkbox/themes/CheckboxStyles.css.js';
import './CheckboxStyles.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxBaseTheme.css.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxBaseTheme.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxVariants.css.js';
import './CheckboxVariants.styles.css';
import './LayoutStyles.css-a679044e.js';
import './LayoutStyles.styles.css';

/**
 * Checkbox is a single standalone checkbox control. It represents a boolean value.
 */
const Checkbox = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired = false, messages, onCommit, userAssistanceDensity: propUserAssistanceDensity, value: propValue, testId, children }, ref = null) => {
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    const checkboxRef = useRef(null);
    const id = useId();
    const UAtestId = testId ? `${testId}-inline-user-assistance` : undefined;
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    // we still render <InlineUserAssistance/> if density is 'efficient' or 'compact' to save space,
    // even though we don't render user assistance for disabled or readonly fields
    const hasBottomUserAssistance = !isDisabled && !isReadonly;
    const bottomUaId = hasBottomUserAssistance ? `${id}-bottom-ua` : undefined;
    const onChangeHandler = useCallback((e) => {
        // return early on keyup if key isn't spacebar
        const { key } = e;
        const hasKey = key !== undefined;
        if (hasKey && key !== ' ') {
            return;
        }
        const input = e.target;
        // While mouse clicking StyledCheckbox results in toggling the checked state on an input element, spacebar key events do not.
        // If it is a spacebar key event, we will return the toggled value of its current state.
        const value = hasKey ? !input.checked : input.checked;
        const previousValue = !!propValue;
        if (previousValue !== value) {
            onCommit({
                value,
                previousValue
            });
        }
    }, [onCommit, propValue]);
    useImperativeHandle(ref, () => ({
        focus: () => {
            !isDisabled && checkboxRef.current?.focus();
        },
        blur: () => {
            const activeElement = document.activeElement;
            checkboxRef.current === activeElement && activeElement.blur();
        }
    }));
    // TODO fix issue with tooltip and link in label
    // 
    return (jsxs(CheckboxRadioContext.Provider, { value: { isFocusRingShown: !isDisabled }, children: [jsx(CheckboxControl, { ...(hasBottomUserAssistance
                    ? {
                        onChange: onChangeHandler,
                        onKeyUp: onChangeHandler
                    }
                    : {}), "aria-describedby": ariaDescribedBy, assistiveText: assistiveText, columnSpan: columnSpan, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isChecked: propValue, isDisabled: isDisabled, isReadonly: isReadonly, isRequired: isRequired, ref: checkboxRef, children: children }), hasBottomUserAssistance ? (jsx(InlineUserAssistance, { id: bottomUaId, isRequiredShown: !!isRequired && !propValue, requiredAlignment: "start", messages: messages, userAssistanceDensity: userAssistanceDensity === 'reflow' ? 'reflow' : 'efficient', testId: UAtestId })) : userAssistanceDensity === 'reflow' ? undefined : (
            /* save space for user assistance if density is 'efficient' or 'compact', even though we don't
               render user assistance for disabled or readonly fields */
            jsx(InlineUserAssistance, { userAssistanceDensity: "efficient", testId: UAtestId }))] }));
});

export { Checkbox };
//# sourceMappingURL=UNSAFE_Checkbox.js.map
