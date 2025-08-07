/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { useCallback, useContext, useState } from 'preact/hooks';
import { createContext, toChildArray } from 'preact';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { TrainRedwoodTheme } from './UNSAFE_Train/themes/redwood/TrainTheme.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { u as useInteractionStyle } from './useInteractionStyle-d65c72b6.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { S as SvgSuccessS } from './SuccessS-b342103c.js';
import { S as SvgErrorS } from './ErrorS-e6e7e0e2.js';
import { S as SvgInformationS } from './InformationS-170eee52.js';
import { S as SvgWarningS } from './WarningS-67afbb93.js';
import { u as useActive } from './useActive-7d9737a5.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import './logger-c92f309c.js';
import './LayerHost-45f545d7.js';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import 'preact/compat';
import './UNSAFE_Train/themes/TrainStyles.css.js';
import './TrainStyles.styles.css';
import './UNSAFE_Train/themes/redwood/TrainBaseTheme.css.js';
import './UNSAFE_Train/themes/redwood/TrainBaseTheme.styles.css';
import './UNSAFE_Train/themes/redwood/TrainVariants.css.js';
import './TrainVariants.styles.css';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './clientHints-c76a913b.js';
import './useHover-d5088fcd.js';
import './useToggle-8b7fcefe.js';
import './Icon-90c3a630.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import './useId-03dbfdf0.js';
import './Floating-9703160e.js';
import './useFloating-c99976f8.js';
import './useUser-99920e02.js';
import './positionUtils-1ec41fd0.js';
import './refUtils-b9d8d91a.js';
import './useOutsideClick-eb8324f6.js';
import './arrayUtils-35a58161.js';
import './Layer-9b06412e.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
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
import './useAnimation-fe9990dc.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js';
import './hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js';
import './TooltipContentStyles.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js';
import './TooltipContentVariants.styles.css';
import './EnvironmentProvider-f543a463.js';
import './LayerManager-625d2503.js';
import './UNSAFE_Icon/themes/IconStyle.css.js';
import './IconStyle.styles.css';
import './HiddenAccessibleStyles.styles.css';

const Context = createContext(null);

/**
The JET Train component serves as a visual navigator enabling users to traverse through different 'steps'. Each 'step' is represented by the Step sub-component which can manifest its own state - 'visited', 'unvisited', or 'disabled', and is capable of communicating various message types including 'error', 'confirmation', 'warning', or 'info'.
 */
function Train({ onSelect, selectedStep, children, testId }) {
    const { classes, styles } = useComponentTheme(TrainRedwoodTheme);
    const testIdProps = useTestId(testId);
    const selectedStepIndex = children.findIndex((step) => step.props.id === selectedStep);
    const onStepSelect = useCallback((event, stepId) => {
        onSelect?.({
            event: event,
            toStep: stepId
        });
    }, [onSelect]);
    const trainContext = {
        onSelect: onStepSelect,
        selectedStep: selectedStep,
        selectedStepIndex: selectedStepIndex,
        numberOfSteps: children.length,
        index: 0
    };
    const childrenArray = toChildArray(children).filter(Boolean);
    return (jsx("div", { class: classes, ...testIdProps, children: childrenArray.map((step, index) => (jsx(Context.Provider, { value: { ...trainContext, index }, children: jsx("div", { class: styles.baseListStyle, children: step }) }))) }));
}

const Connector = ({ isConnected }) => {
    const { styles, variantClasses } = useComponentTheme(TrainRedwoodTheme, {
        connectorConnected: isConnected ? 'isConnected' : 'notConnected'
    });
    return jsx("span", { class: classNames([styles.connectorBaseStyle, variantClasses]) });
};

const messageTypeIcons = {
    confirmation: SvgSuccessS,
    error: SvgErrorS,
    fatal: SvgErrorS,
    info: SvgInformationS,
    warning: SvgWarningS
};
/**
 * UserChosenIcon Component for rendering the severity based icon in Message
 */
function UserChosenIcon({ messageType, isDisabled = false }) {
    const IconComponent = messageTypeIcons[messageType];
    const { styles, variantClasses } = useComponentTheme(TrainRedwoodTheme, {
        messageType: messageType,
        stepIconDisabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    return (jsx("div", { class: classNames([styles.messageTypeIconBaseStyle, variantClasses]), role: "presentation", children: jsx(IconComponent, {}) }));
}

/**
 * Step icon
 */
const StepIcon = ({ isDisabled, isVisited, messageType }) => {
    const { index, selectedStepIndex } = useContext(Context);
    const isCurrent = selectedStepIndex === index;
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle(isDisabled || isCurrent);
    const { isActive, activeProps } = useActive({ isDisabled: isDisabled || isCurrent });
    const mergedProps = mergeProps(interactionProps, activeProps);
    const { styles, variantClasses } = useComponentTheme(TrainRedwoodTheme, {
        stepIconDisabled: isDisabled ? 'isDisabled' : 'notDisabled',
        stepIconCurrent: isCurrent ? 'isCurrent' : 'notCurrent',
        stepIconVisited: isVisited ? 'isVisited' : 'notVisited',
        stepIconNeedsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        stepIconPseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        stepIconActive: isActive ? 'isActive' : 'notActive'
    });
    const iconStyles = () => {
        if (messageType) {
            return jsx(UserChosenIcon, { messageType: messageType, isDisabled: isDisabled });
        }
        else {
            return (jsx("span", { ...mergedProps, class: classNames([styles.stepIconBaseStyle, variantClasses]), children: index + 1 }));
        }
    };
    return jsx("span", { class: styles.stepIconContainerStyle, children: iconStyles() });
};

/**
 * Step label component
 */
const StepLabel = ({ label, isDisabled, isVisited, messageType }) => {
    const { numberOfSteps, index, selectedStepIndex } = useContext(Context);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const isCurrent = selectedStepIndex === index;
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle(isDisabled || isCurrent);
    const currentStepStatus = isCurrent
        ? translations.train_current()
        : isVisited
            ? translations.train_visited()
            : translations.train_not_visited();
    const currentStep = index + 1;
    const statusTextForCurrentStep = messageType
        ? `${translations.train_status({
            currentStep: currentStep.toString(),
            numberOfSteps: numberOfSteps.toString()
        })}. ${currentStepStatus}, ${translations.train_message_type()}: ${messageType}`
        : `${translations.train_status({
            currentStep: currentStep.toString(),
            numberOfSteps: numberOfSteps.toString()
        })}. ${currentStepStatus}`;
    const { styles, variantClasses } = useComponentTheme(TrainRedwoodTheme, {
        stepLabelDisabled: isDisabled ? 'isDisabled' : 'notDisabled',
        stepLabelCurrent: isCurrent ? 'isCurrent' : 'notCurrent',
        stepLabelVisited: isVisited ? 'isVisited' : 'notVisited',
        stepLabelNeedsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        stepLabelPseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover'
    });
    const handleClick = (event) => {
        event.preventDefault();
    };
    return (jsx("span", { class: styles.stepLabelWrapperStyle, children: jsxs("a", { ...interactionProps, href: "#", class: classNames([styles.stepLabelBaseStyle, variantClasses]), onClick: handleClick, children: [label, jsx(HiddenAccessible, { children: statusTextForCurrentStep })] }) }));
};

/**
 * Step component
 */
const Step = ({ id, isDisabled, isVisited, messageType, label }) => {
    const { onSelect, /* selectedStep ,*/ numberOfSteps, selectedStepIndex, index } = useContext(Context) || // get the context object or...
        (() => {
            // if there's no context object, throw an error
            throw new Error('Step component must be rendered within a Train component.');
        })();
    const isCurrent = selectedStepIndex === index;
    const [isActive, setIsActive] = useState(false);
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle(isDisabled || isCurrent);
    const isConnectorConnected = selectedStepIndex > index;
    const onSelectHandler = useCallback((event) => {
        if (!isDisabled && !isCurrent) {
            onSelect(event, id);
        }
    }, [isDisabled, isCurrent, onSelect, id]);
    const { pressProps } = usePress(onSelectHandler, {});
    const isLast = index !== numberOfSteps - 1;
    const onMouseUpHandler = useCallback(() => {
        setIsActive(false);
    }, []);
    const onMouseDownHandler = useCallback(() => {
        setIsActive(true);
    }, []);
    const { styles, variantClasses } = useComponentTheme(TrainRedwoodTheme, {
        stepDisabled: isDisabled ? 'isDisabled' : 'notDisabled',
        needsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        stepActive: isActive && !isCurrent ? 'isActive' : 'notActive'
    });
    const mergedProps = mergeProps(pressProps, interactionProps, {
        onMouseUp: onMouseUpHandler,
        onMouseDown: onMouseDownHandler
    });
    return (jsxs("span", { class: styles.stepContainerStyle, children: [isLast && jsx(Connector, { isConnected: isConnectorConnected }), jsxs("span", { ...mergedProps, class: classNames([styles.stepBaseStyle, variantClasses]), children: [jsx(StepIcon, { isVisited: isVisited, isDisabled: isDisabled, messageType: messageType }), jsx(StepLabel, { label: label, isVisited: isVisited, isDisabled: isDisabled, messageType: messageType })] })] }));
};

export { Step, Train };
//# sourceMappingURL=UNSAFE_Train.js.map
