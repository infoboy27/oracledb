/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var preact = require('preact');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useTestId = require('./useTestId-8234ec1e.js');
var UNSAFE_Train_themes_redwood_TrainTheme = require('./UNSAFE_Train/themes/redwood/TrainTheme.js');
var usePress = require('./usePress-00deca01.js');
var useInteractionStyle = require('./useInteractionStyle-442c6a12.js');
var classNames = require('./classNames-c14c6ef3.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var SuccessS = require('./SuccessS-862e9e4b.js');
var ErrorS = require('./ErrorS-bfe081e3.js');
var InformationS = require('./InformationS-5bf32f4c.js');
var WarningS = require('./WarningS-d18b9e00.js');
var useActive = require('./useActive-b15c9e7e.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
require('./logger-2b636482.js');
require('./LayerHost-46e4d858.js');
require('./Common/themes/redwood/theme.js');
require('./Common/themes/themeContract.css.js');
require('preact/compat');
require('./UNSAFE_Train/themes/TrainStyles.css.js');

require('./UNSAFE_Train/themes/redwood/TrainBaseTheme.css.js');

require('./UNSAFE_Train/themes/redwood/TrainVariants.css.js');

require('./vanilla-extract-recipes-createRuntimeFn.esm-d1301b2d.js');
require('./clientHints-9e411b6e.js');
require('./useHover-910b8e32.js');
require('./useToggle-3ebba7d8.js');
require('./Icon-3ffd13dc.js');
require('./size-4e606ce4.js');
require('./utils-b7099be5.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
require('./useId-6c0eeb27.js');
require('./Floating-1280c2ce.js');
require('./useFloating-7800fd56.js');
require('./useUser-a6d15333.js');
require('./positionUtils-ae9279d7.js');
require('./refUtils-915b985d.js');
require('./useOutsideClick-7420644b.js');
require('./arrayUtils-7d8dcfc3.js');
require('./Layer-3700cd37.js');
require('./UNSAFE_Layer/themes/LayerStyles.css.js');

require('./useThemeInterpolations-25313f34.js');
require('./useColorScheme-d2c4adcc.js');
require('./useScale-74bd6456.js');
require('./theme-dfd6a9fe.js');
require('./Theme-f06687af.js');
require('./mergeInterpolations-6727b536.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');
require('./UNSAFE_Floating/themes/redwood/FloatingTheme.js');
require('./UNSAFE_Floating/themes/FloatingStyles.css.js');

require('./UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js');

require('./UNSAFE_Floating/themes/redwood/FloatingVariants.css.js');
require('./vanilla-extract-dynamic.esm-d5dffce7.js');
require('./UNSAFE_Floating/themes/FloatingContract.css.js');
require('./useFocus-1b288fb9.js');
require('./useTouch-4dec8729.js');
require('./useAnimation-2f7dd313.js');
require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js');
require('./hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js');

require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js');

require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js');

require('./EnvironmentProvider-42b2b998.js');
require('./LayerManager-fa20a462.js');
require('./UNSAFE_Icon/themes/IconStyle.css.js');



const Context = preact.createContext(null);

/**
The JET Train component serves as a visual navigator enabling users to traverse through different 'steps'. Each 'step' is represented by the Step sub-component which can manifest its own state - 'visited', 'unvisited', or 'disabled', and is capable of communicating various message types including 'error', 'confirmation', 'warning', or 'info'.
 */
function Train({ onSelect, selectedStep, children, testId }) {
    const { classes, styles } = useComponentTheme.useComponentTheme(UNSAFE_Train_themes_redwood_TrainTheme.TrainRedwoodTheme);
    const testIdProps = useTestId.useTestId(testId);
    const selectedStepIndex = children.findIndex((step) => step.props.id === selectedStep);
    const onStepSelect = hooks.useCallback((event, stepId) => {
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
    const childrenArray = preact.toChildArray(children).filter(Boolean);
    return (jsxRuntime.jsx("div", { class: classes, ...testIdProps, children: childrenArray.map((step, index) => (jsxRuntime.jsx(Context.Provider, { value: { ...trainContext, index }, children: jsxRuntime.jsx("div", { class: styles.baseListStyle, children: step }) }))) }));
}

const Connector = ({ isConnected }) => {
    const { styles, variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_Train_themes_redwood_TrainTheme.TrainRedwoodTheme, {
        connectorConnected: isConnected ? 'isConnected' : 'notConnected'
    });
    return jsxRuntime.jsx("span", { class: classNames.classNames([styles.connectorBaseStyle, variantClasses]) });
};

const messageTypeIcons = {
    confirmation: SuccessS.SvgSuccessS,
    error: ErrorS.SvgErrorS,
    fatal: ErrorS.SvgErrorS,
    info: InformationS.SvgInformationS,
    warning: WarningS.SvgWarningS
};
/**
 * UserChosenIcon Component for rendering the severity based icon in Message
 */
function UserChosenIcon({ messageType, isDisabled = false }) {
    const IconComponent = messageTypeIcons[messageType];
    const { styles, variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_Train_themes_redwood_TrainTheme.TrainRedwoodTheme, {
        messageType: messageType,
        stepIconDisabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    return (jsxRuntime.jsx("div", { class: classNames.classNames([styles.messageTypeIconBaseStyle, variantClasses]), role: "presentation", children: jsxRuntime.jsx(IconComponent, {}) }));
}

/**
 * Step icon
 */
const StepIcon = ({ isDisabled, isVisited, messageType }) => {
    const { index, selectedStepIndex } = hooks.useContext(Context);
    const isCurrent = selectedStepIndex === index;
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle.useInteractionStyle(isDisabled || isCurrent);
    const { isActive, activeProps } = useActive.useActive({ isDisabled: isDisabled || isCurrent });
    const mergedProps = mergeProps.mergeProps(interactionProps, activeProps);
    const { styles, variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_Train_themes_redwood_TrainTheme.TrainRedwoodTheme, {
        stepIconDisabled: isDisabled ? 'isDisabled' : 'notDisabled',
        stepIconCurrent: isCurrent ? 'isCurrent' : 'notCurrent',
        stepIconVisited: isVisited ? 'isVisited' : 'notVisited',
        stepIconNeedsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        stepIconPseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        stepIconActive: isActive ? 'isActive' : 'notActive'
    });
    const iconStyles = () => {
        if (messageType) {
            return jsxRuntime.jsx(UserChosenIcon, { messageType: messageType, isDisabled: isDisabled });
        }
        else {
            return (jsxRuntime.jsx("span", { ...mergedProps, class: classNames.classNames([styles.stepIconBaseStyle, variantClasses]), children: index + 1 }));
        }
    };
    return jsxRuntime.jsx("span", { class: styles.stepIconContainerStyle, children: iconStyles() });
};

/**
 * Step label component
 */
const StepLabel = ({ label, isDisabled, isVisited, messageType }) => {
    const { numberOfSteps, index, selectedStepIndex } = hooks.useContext(Context);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const isCurrent = selectedStepIndex === index;
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle.useInteractionStyle(isDisabled || isCurrent);
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
    const { styles, variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_Train_themes_redwood_TrainTheme.TrainRedwoodTheme, {
        stepLabelDisabled: isDisabled ? 'isDisabled' : 'notDisabled',
        stepLabelCurrent: isCurrent ? 'isCurrent' : 'notCurrent',
        stepLabelVisited: isVisited ? 'isVisited' : 'notVisited',
        stepLabelNeedsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        stepLabelPseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover'
    });
    const handleClick = (event) => {
        event.preventDefault();
    };
    return (jsxRuntime.jsx("span", { class: styles.stepLabelWrapperStyle, children: jsxRuntime.jsxs("a", { ...interactionProps, href: "#", class: classNames.classNames([styles.stepLabelBaseStyle, variantClasses]), onClick: handleClick, children: [label, jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { children: statusTextForCurrentStep })] }) }));
};

/**
 * Step component
 */
const Step = ({ id, isDisabled, isVisited, messageType, label }) => {
    const { onSelect, /* selectedStep ,*/ numberOfSteps, selectedStepIndex, index } = hooks.useContext(Context) || // get the context object or...
        (() => {
            // if there's no context object, throw an error
            throw new Error('Step component must be rendered within a Train component.');
        })();
    const isCurrent = selectedStepIndex === index;
    const [isActive, setIsActive] = hooks.useState(false);
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle.useInteractionStyle(isDisabled || isCurrent);
    const isConnectorConnected = selectedStepIndex > index;
    const onSelectHandler = hooks.useCallback((event) => {
        if (!isDisabled && !isCurrent) {
            onSelect(event, id);
        }
    }, [isDisabled, isCurrent, onSelect, id]);
    const { pressProps } = usePress.usePress(onSelectHandler, {});
    const isLast = index !== numberOfSteps - 1;
    const onMouseUpHandler = hooks.useCallback(() => {
        setIsActive(false);
    }, []);
    const onMouseDownHandler = hooks.useCallback(() => {
        setIsActive(true);
    }, []);
    const { styles, variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_Train_themes_redwood_TrainTheme.TrainRedwoodTheme, {
        stepDisabled: isDisabled ? 'isDisabled' : 'notDisabled',
        needsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        stepActive: isActive && !isCurrent ? 'isActive' : 'notActive'
    });
    const mergedProps = mergeProps.mergeProps(pressProps, interactionProps, {
        onMouseUp: onMouseUpHandler,
        onMouseDown: onMouseDownHandler
    });
    return (jsxRuntime.jsxs("span", { class: styles.stepContainerStyle, children: [isLast && jsxRuntime.jsx(Connector, { isConnected: isConnectorConnected }), jsxRuntime.jsxs("span", { ...mergedProps, class: classNames.classNames([styles.stepBaseStyle, variantClasses]), children: [jsxRuntime.jsx(StepIcon, { isVisited: isVisited, isDisabled: isDisabled, messageType: messageType }), jsxRuntime.jsx(StepLabel, { label: label, isVisited: isVisited, isDisabled: isDisabled, messageType: messageType })] })] }));
};

exports.Step = Step;
exports.Train = Train;
//# sourceMappingURL=UNSAFE_Train.js.map
