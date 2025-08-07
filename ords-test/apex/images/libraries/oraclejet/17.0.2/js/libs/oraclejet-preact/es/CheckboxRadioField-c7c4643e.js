/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { forwardRef, useRef, useImperativeHandle } from 'preact/compat';
import { u as useCollectionFocusRing } from './useCollectionFocusRing-d0c80397.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { F as Flex } from './Flex-24628925.js';
import { L as Label } from './Label-6674b3f2.js';
import { I as InlineHelp } from './InlineHelp-95ca55a5.js';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import 'preact/hooks';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { I as InlineUserAssistanceContainer, a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import 'preact';
import { x as xUnits } from './utils-6eab3a64.js';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './IconButton-37310d21.js';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import { u as useTestId } from './useTestId-adde554c.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './FormFieldContext-68eb5946.js';
import './Popup-8889a781.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { u as useMessageSeverity } from './useMessageSeverity-65295e8f.js';
import { m as merge } from './stringUtils-16f617bc.js';
import './CheckboxRadioFieldStyles.styles.css';
import { L as LabelValueLayout } from './LabelValueLayout-23b74176.js';
import { C as CheckboxRadioContext } from './CheckboxRadioContext-fe425383.js';
import { l as layoutSpanStyles } from './LayoutStyles.css-a679044e.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useCheckboxRadioField({ ariaDescribedBy, baseId, hasValue, hasTopUserAssistance, hasBottomUserAssistance, isReadonly, isRequired = false, isDisabled, label, labelEdge, messages, parentComponentVariant }) {
    const optionsGroupId = `${baseId}-group`;
    const labelId = `${baseId}-label`;
    const topUaId = hasTopUserAssistance ? `${baseId}-top-ua` : undefined;
    const bottomUaId = hasBottomUserAssistance ? `${baseId}-bottom-ua` : undefined;
    const readonlyId = isReadonly ? `${baseId}-readonly` : undefined;
    const ariaLabel = label && label.length > 0 && labelEdge === 'none' ? label : undefined;
    const ariaLabelledBy = ariaLabel ? undefined : labelId;
    const isRadioSet = parentComponentVariant === 'radioSet';
    const highestMessageSeverity = useMessageSeverity(messages);
    const hasErrorMessage = highestMessageSeverity === 'error';
    return {
        groupProps: {
            'aria-describedby': merge([topUaId, bottomUaId, readonlyId, ariaDescribedBy]),
            ...(isRadioSet && { 'aria-required': isRequired }),
            ...(ariaLabelledBy && { 'aria-labelledby': ariaLabelledBy }),
            ...(ariaLabel && { 'aria-label': ariaLabel }),
            ...(isReadonly && isRadioSet && { 'aria-readonly': true }),
            ...(hasErrorMessage && { 'aria-invalid': true }),
            ...(isDisabled && { 'aria-disabled': true }),
            id: optionsGroupId
        },
        labelProps: {
            forId: optionsGroupId,
            id: labelId
        },
        // TOP UA is assistive text and help link/text
        ...(hasTopUserAssistance && {
            topUserAssistanceProps: {
                id: topUaId,
                // Use reflow variant so that top UA doesn't have min height
                variant: 'reflow'
            }
        }),
        // Bottom UA is required indicator or messages
        ...(hasBottomUserAssistance && {
            bottomUserAssistanceProps: {
                id: bottomUaId,
                isRequiredShown: !!isRequired && !hasValue
            }
        }),
        ...(isReadonly && {
            readonlyId
        })
    };
}

var topUAContainerStyles = {top:'CheckboxRadioFieldStyles_topUAContainerStyles_top__j1xru60',start:'CheckboxRadioFieldStyles_topUAContainerStyles_start__j1xru61'};

const CheckboxRadioField = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, baseId, direction = 'column', columnSpan = 1, hasValue, helpSourceLink, helpSourceText, isDisabled, isReadonly, isRequired, label, labelEdge, labelStartWidth = '33%', parentComponentVariant, messages, userAssistanceDensity, role, children, testId }, ref = null) => {
    const testIdProps = useTestId(testId);
    const UAtestId = `${testId}-inline-user-assistance`;
    const UAtestIdTop = testId ? `${UAtestId}-top` : undefined;
    const UAtestIdBottom = testId ? `${UAtestId}-bottom` : undefined;
    const hasTopUserAssistance = !isDisabled && !isReadonly && (!!assistiveText || (!!helpSourceLink && !!helpSourceText));
    // we still render <InlineUserAssistance/> if density is 'efficient' or 'compact' to save space,
    // even though we don't render user assistance for disabled or readonly fields
    const hasBottomUserAssistance = !isDisabled && !isReadonly;
    const groupRef = useRef(null);
    const { groupProps, labelProps, topUserAssistanceProps, bottomUserAssistanceProps, readonlyId } = useCheckboxRadioField({
        ariaDescribedBy,
        baseId,
        isRequired,
        isReadonly,
        isDisabled,
        label,
        labelEdge,
        messages,
        hasValue,
        hasTopUserAssistance,
        hasBottomUserAssistance,
        parentComponentVariant
    });
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const readonlyLabel = translations.formControl_readOnly();
    const isRadioSet = parentComponentVariant === 'radioSet';
    useImperativeHandle(ref, () => ({
        focus: () => {
            if (!isDisabled) {
                const inputChildren = groupRef.current?.querySelectorAll('input') ?? [];
                const selectedChild = Array.from(inputChildren).find((child) => child.checked);
                if (selectedChild) {
                    selectedChild.focus();
                }
                else {
                    inputChildren[0].focus();
                }
            }
        },
        blur: () => {
            if (groupRef.current?.contains(document.activeElement)) {
                document.activeElement.blur();
            }
        }
    }));
    // the props from the hook are used for focus management on the radioset variant to allow for arrow navigation
    // while checkboxset uses tabbing
    const [isFocusRingShown, focusRingProps] = useCollectionFocusRing(groupRef, isRadioSet ? ['ArrowUp', 'ArrowRight', 'ArrowDown', 'ArrowLeft'] : ['Tab']);
    const content = (jsxs(Fragment, { children: [hasTopUserAssistance && (jsx("div", { id: `${baseId}-top-ua-container`, class: labelEdge === 'start' ? topUAContainerStyles.start : topUAContainerStyles.top, children: jsx(InlineUserAssistanceContainer, { ...topUserAssistanceProps, testId: UAtestIdTop, children: jsx(InlineHelp, { assistiveText: assistiveText, sourceLink: helpSourceLink, sourceText: helpSourceText }) }) })), jsx(Flex, { direction: direction, ...(direction === 'row' && { gap: [0, xUnits(8)], wrap: 'wrap' }), children: jsx(CheckboxRadioContext.Provider, { value: { isFocusRingShown }, children: children }) }), hasBottomUserAssistance ? (jsx(InlineUserAssistance, { ...bottomUserAssistanceProps, requiredAlignment: "start", messages: messages, userAssistanceDensity: userAssistanceDensity === 'reflow' ? 'reflow' : 'efficient', testId: UAtestIdBottom })) : userAssistanceDensity === 'reflow' ? undefined : (
            /* save space for user assistance if density is 'efficient' or 'compact', even though we don't
               render user assistance for disabled or readonly fields */
            jsx(InlineUserAssistance, { id: bottomUserAssistanceProps?.id, userAssistanceDensity: "efficient", testId: UAtestIdBottom }))] }));
    // The top level element needs the column span class on it.
    const classes = layoutSpanStyles.layoutSpanColumn[columnSpan];
    return (jsxs("div", { role: role, ref: groupRef, class: classes, ...groupProps, ...focusRingProps, ...testIdProps, children: [labelEdge === 'none' && content, labelEdge !== 'none' && (jsx(LabelValueLayout, { parentComponentVariant: parentComponentVariant, hasTopUserAssistance: hasTopUserAssistance, label: jsx(Label, { ...labelProps, variant: labelEdge, userAssistanceDensity: "efficient", parentComponentVariant: parentComponentVariant, children: label }), labelEdge: labelEdge, labelStartWidth: labelStartWidth, children: content })), isReadonly && (jsx(HiddenAccessible, { id: readonlyId, isHidden: true, children: readonlyLabel }))] }));
});

export { CheckboxRadioField as C };
//# sourceMappingURL=CheckboxRadioField-c7c4643e.js.map
