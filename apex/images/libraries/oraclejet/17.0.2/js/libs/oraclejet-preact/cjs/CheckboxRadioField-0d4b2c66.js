/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var useCollectionFocusRing = require('./useCollectionFocusRing-ca37785b.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var Flex = require('./Flex-fbba4ad6.js');
var Label = require('./Label-d9ad059f.js');
var InlineHelp = require('./InlineHelp-020ee2df.js');
require('./logger-2b636482.js');
require('./TabbableModeContext-e99d527e.js');
require('preact/hooks');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
var utils = require('./utils-b7099be5.js');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');

require('./MessageFormattingUtils-42d84399.js');
var useTestId = require('./useTestId-8234ec1e.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');


require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
require('./FormFieldContext-8418dc68.js');
require('./Popup-881aae20.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');

require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var useMessageSeverity = require('./useMessageSeverity-cfc4ae9d.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');

var LabelValueLayout = require('./LabelValueLayout-24937fa5.js');
var CheckboxRadioContext = require('./CheckboxRadioContext-3b134bd1.js');
var LayoutStyles_css = require('./LayoutStyles.css-8af668b9.js');

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
    const highestMessageSeverity = useMessageSeverity.useMessageSeverity(messages);
    const hasErrorMessage = highestMessageSeverity === 'error';
    return {
        groupProps: {
            'aria-describedby': stringUtils.merge([topUaId, bottomUaId, readonlyId, ariaDescribedBy]),
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

const CheckboxRadioField = compat.forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, baseId, direction = 'column', columnSpan = 1, hasValue, helpSourceLink, helpSourceText, isDisabled, isReadonly, isRequired, label, labelEdge, labelStartWidth = '33%', parentComponentVariant, messages, userAssistanceDensity, role, children, testId }, ref = null) => {
    const testIdProps = useTestId.useTestId(testId);
    const UAtestId = `${testId}-inline-user-assistance`;
    const UAtestIdTop = testId ? `${UAtestId}-top` : undefined;
    const UAtestIdBottom = testId ? `${UAtestId}-bottom` : undefined;
    const hasTopUserAssistance = !isDisabled && !isReadonly && (!!assistiveText || (!!helpSourceLink && !!helpSourceText));
    // we still render <InlineUserAssistance/> if density is 'efficient' or 'compact' to save space,
    // even though we don't render user assistance for disabled or readonly fields
    const hasBottomUserAssistance = !isDisabled && !isReadonly;
    const groupRef = compat.useRef(null);
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
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const readonlyLabel = translations.formControl_readOnly();
    const isRadioSet = parentComponentVariant === 'radioSet';
    compat.useImperativeHandle(ref, () => ({
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
    const [isFocusRingShown, focusRingProps] = useCollectionFocusRing.useCollectionFocusRing(groupRef, isRadioSet ? ['ArrowUp', 'ArrowRight', 'ArrowDown', 'ArrowLeft'] : ['Tab']);
    const content = (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [hasTopUserAssistance && (jsxRuntime.jsx("div", { id: `${baseId}-top-ua-container`, class: labelEdge === 'start' ? topUAContainerStyles.start : topUAContainerStyles.top, children: jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistanceContainer, { ...topUserAssistanceProps, testId: UAtestIdTop, children: jsxRuntime.jsx(InlineHelp.InlineHelp, { assistiveText: assistiveText, sourceLink: helpSourceLink, sourceText: helpSourceText }) }) })), jsxRuntime.jsx(Flex.Flex, { direction: direction, ...(direction === 'row' && { gap: [0, utils.xUnits(8)], wrap: 'wrap' }), children: jsxRuntime.jsx(CheckboxRadioContext.CheckboxRadioContext.Provider, { value: { isFocusRingShown }, children: children }) }), hasBottomUserAssistance ? (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { ...bottomUserAssistanceProps, requiredAlignment: "start", messages: messages, userAssistanceDensity: userAssistanceDensity === 'reflow' ? 'reflow' : 'efficient', testId: UAtestIdBottom })) : userAssistanceDensity === 'reflow' ? undefined : (
            /* save space for user assistance if density is 'efficient' or 'compact', even though we don't
               render user assistance for disabled or readonly fields */
            jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { id: bottomUserAssistanceProps?.id, userAssistanceDensity: "efficient", testId: UAtestIdBottom }))] }));
    // The top level element needs the column span class on it.
    const classes = LayoutStyles_css.layoutSpanStyles.layoutSpanColumn[columnSpan];
    return (jsxRuntime.jsxs("div", { role: role, ref: groupRef, class: classes, ...groupProps, ...focusRingProps, ...testIdProps, children: [labelEdge === 'none' && content, labelEdge !== 'none' && (jsxRuntime.jsx(LabelValueLayout.LabelValueLayout, { parentComponentVariant: parentComponentVariant, hasTopUserAssistance: hasTopUserAssistance, label: jsxRuntime.jsx(Label.Label, { ...labelProps, variant: labelEdge, userAssistanceDensity: "efficient", parentComponentVariant: parentComponentVariant, children: label }), labelEdge: labelEdge, labelStartWidth: labelStartWidth, children: content })), isReadonly && (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: readonlyId, isHidden: true, children: readonlyLabel }))] }));
});

exports.CheckboxRadioField = CheckboxRadioField;
//# sourceMappingURL=CheckboxRadioField-0d4b2c66.js.map
