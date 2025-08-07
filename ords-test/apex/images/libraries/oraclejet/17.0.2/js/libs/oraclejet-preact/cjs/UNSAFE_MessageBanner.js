/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var Message = require('./Message-b703f9e4.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var classNames = require('./classNames-c14c6ef3.js');

require('./MessageFormattingUtils-42d84399.js');
var MessagesManager = require('./MessagesManager-9cc43d3a.js');
var Flex = require('./Flex-fbba4ad6.js');
var useTestId = require('./useTestId-8234ec1e.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var useMessagesFocusManager = require('./useMessagesFocusManager-1bf493a6.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_MessageBanner_themes_redwood_MessageBannerTheme = require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerTheme.js');
require('./timer-c32f7725.js');
require('./Close-2adc0f0f.js');
require('./Icon-3ffd13dc.js');
require('./size-4e606ce4.js');
require('./utils-b7099be5.js');
require('./Common/themes/themeContract.css.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./useTooltip-468c1c92.js');
require('./UNSAFE_Icon/themes/IconStyle.css.js');
require('./PRIVATE_Message/themes/MessageStyles.css.js');
require('./useId-6c0eeb27.js');
require('./Floating-1280c2ce.js');
require('preact/compat');
require('./useFloating-7800fd56.js');
require('./useUser-a6d15333.js');
require('./LayerHost-46e4d858.js');
require('./Common/themes/redwood/theme.js');
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
require('./vanilla-extract-recipes-createRuntimeFn.esm-d1301b2d.js');
require('./vanilla-extract-dynamic.esm-d5dffce7.js');
require('./UNSAFE_Floating/themes/FloatingContract.css.js');
require('./useHover-910b8e32.js');
require('./useToggle-3ebba7d8.js');
require('./useFocus-1b288fb9.js');
require('./useTouch-4dec8729.js');
require('./mergeProps-e3da7237.js');
require('./useAnimation-2f7dd313.js');
require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js');
require('./hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js');

require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js');

require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js');

require('./EnvironmentProvider-42b2b998.js');
require('./LayerManager-fa20a462.js');
require('./BaseButton-ff6f39f2.js');
require('./usePress-00deca01.js');
require('./useActive-b15c9e7e.js');
require('./TabbableModeContext-e99d527e.js');
require('./useTabbableMode-5c8fd9e5.js');
require('./dimensions-b48bf1ab.js');
require('./clientHints-9e411b6e.js');
require('./UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js');
require('./UNSAFE_BaseButton/themes/BaseButtonStyles.css.js');

require('./UNSAFE_BaseButton/themes/redwood/BaseButtonVariants.css.js');

require('./ButtonLabelLayout-3399b9e1.js');
require('./Text-aaacb6a0.js');
require('./UNSAFE_Text/themes/TextStyles.css.js');

require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js');
require('./UNSAFE_ButtonLabelLayout/themes/ButtonLabelLayoutStyles.css.js');

require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.css.js');

require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutVariants.css.js');

require('./buttonUtils-252661e7.js');
require('./id-86356250.js');
require('./getLocale-8e17dc46.js');
require('./stringUtils-4e4a6b2b.js');
require('./SuccessS-862e9e4b.js');
require('./ErrorS-bfe081e3.js');
require('./InformationS-5bf32f4c.js');
require('./WarningS-d18b9e00.js');
require('./logger-2b636482.js');
require('./soundUtils-ff3c9c0d.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');
require('./useMessagesContext-23d62331.js');
require('./Transition-942950ed.js');
require('./boxalignment-5ef612ee.js');

require('./vanilla-extract-sprinkles-createRuntimeSprinkles.esm-d68f3e0f.js');
require('./flexbox-2cae9a01.js');

require('./flexitem-fee13e26.js');



require('./UNSAFE_MessageBanner/themes/MessageBannerStyles.css.js');

require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.css.js');

require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');


/**
 * Animation states for banner messages
 * TODO: Get this from theme context provider
 */
const animationStates = {
    entering: (node) => ({
        to: {
            maxHeight: `${node.scrollHeight}px`,
            overflow: 'hidden'
        },
        options: {
            duration: 250
        },
        end: {
            maxHeight: 'none',
            overflow: 'initial'
        }
    }),
    exiting: (node) => ({
        ...(node.style.maxHeight === 'none' && {
            from: {
                maxHeight: `${node.scrollHeight}px`,
                overflow: 'hidden'
            }
        }),
        to: {
            maxHeight: 0,
            overflow: 'hidden'
        },
        end: {
            maxHeight: 0,
            overflow: 'hidden'
        },
        options: {
            duration: 250
        }
    })
};
const initialAnimationStyles = {
    maxHeight: 0,
    overflow: 'hidden'
};
/**
 * Renders individual messages based on the provided data
 */
function MessageBanner({ detailRendererKey, data, onClose, renderers, testId, variant = 'section' }) {
    const testIdProps = useTestId.useTestId(testId);
    // Keyboard Navigation and Focus Management
    const messagesRef = hooks.useRef(new Map());
    const containerDivRef = hooks.useRef(null);
    const focusHandleRef = hooks.useRef(null);
    const [liveRegionText, setLiveRegionText] = hooks.useState();
    const [shouldRender, setShouldRender] = hooks.useState(data.length > 0);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    // We need a ref that holds the current & previous data length, as the exiting
    // node will always call handleNextFocus with previous data.
    // As in TransitionGroup, when an item is removed from the data, a new vnode
    // will not be created instead previous vnode will be used. So, the new handleNextFocus
    // will not be called when the old vnode exits. Thus, we will be using a ref
    // to always get the correct current data length.
    const dataLengthRef = hooks.useRef(data.length);
    const prevDataLengthRef = hooks.useRef(0);
    // Update the data length ref
    dataLengthRef.current = data.length;
    // We will be using a function based ref to store the refs in the Map
    const setMessageRef = hooks.useCallback(
    // TODO: use ramda.curry here (currently it is throwing ts error when used with generics)
    (key) => {
        return (ref) => messagesRef.current.set(key, ref);
    }, []);
    // Update the focusHandleRef
    hooks.useImperativeHandle(focusHandleRef, () => ({
        focus: () => {
            // Only trigger focus if the component is rendering messages
            if (data.length) {
                const firstItemKey = data[0].key;
                messagesRef.current.get(firstItemKey)?.focus();
                return true;
            }
            return false;
        },
        contains: (element) => {
            // Only invoke method if the component is rendering messages
            if (data.length && element) {
                return containerDivRef.current?.contains(element) ?? false;
            }
            return false;
        }
    }), [data]);
    // Register handlers for focus management
    const { controller, handlers } = useMessagesFocusManager.useMessageFocusManager(focusHandleRef, {
        onFocus: hooks.useCallback(() => {
            setLiveRegionText(translations.message_navigationFromMessagesRegion());
        }, [setLiveRegionText, translations])
    });
    /**
     * Emits onClose event for the provided message.
     * @param item The message which the user tried to close
     */
    const handleClose = hooks.useCallback((item) => {
        onClose?.(item);
    }, [onClose]);
    /**
     * Handles focus when a message is closed and animated away from the DOM
     * @param key The key of the message
     * @param index The index of the message
     */
    const handleNextFocus = hooks.useCallback((_key, index, closedMessageNode) => {
        const isClosedMessageFocused = closedMessageNode?.contains(document.activeElement);
        // If there are no messages, do not render anything. As the old messages
        // are still in the DOM, use the data count to determine what to do next as it
        // represents the next state.
        if (dataLengthRef.current === 0) {
            setShouldRender(false);
            // If the current message holds focus, then restore previous focus
            if (isClosedMessageFocused) {
                controller.restorePriorFocus();
            }
            return;
        }
        // In TransitionGroup, when an item is removed from the data, a new vnode
        // will not be created instead previous vnode will be used. So, the new handleNextFocus
        // will not be called when the old vnode exits. Thus, all the deps will not be pointing to
        // the current references, rather they will be pointing to the ones where this vnode
        // last existed in the data.
        // This means, the data will contain the closing message as well. But, all the ref objects
        // still point to the most up-to-date values. With that in mind, we will be evaluating the
        // following values.
        const renderedMessagesCount = data.length;
        // Now that this message is closed, focus the next message that will take this index. If no
        // message will take this message's index, then it means that this is the last message. If
        // that is the case, focus the message at the previous index.
        // Use the count of the messages that are currently shown in the UI (current state including
        // the message that will be removed). This way we can get the correct item from the data
        // as it will contain the closing message as well.
        const nextMessageIndexToFocus = index + 1 < renderedMessagesCount ? index + 1 : index - 1;
        // if next message is available then transfer the focus to the next element
        if (nextMessageIndexToFocus > -1 && isClosedMessageFocused) {
            const nextMessageKey = data[nextMessageIndexToFocus].key;
            messagesRef.current.get(nextMessageKey)?.focus();
        }
    }, [controller, data]);
    // Prioritize this component whenever the data changes and
    // the new data has at least one message
    hooks.useEffect(() => {
        if (data.length) {
            // set state to render content whenever the data is not empty
            setShouldRender(true);
            if (data.length > prevDataLengthRef.current) {
                // Only when having a new message, update the aria-live area with the
                // text to indicate how to get the focus to the new message.
                setLiveRegionText(translations.message_navigationToMessagesRegion());
            }
            controller.prioritize();
        }
        else {
            // When there are no messages, clear the live region so that
            // the navigation text will be read when a new message appear
            setLiveRegionText('');
        }
        prevDataLengthRef.current = data.length;
    }, [controller, data, translations]);
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_MessageBanner_themes_redwood_MessageBannerTheme.MessageBannerRedwoodTheme);
    // When both shouldRender flag is false and no data to render, do not render
    // anything
    if (!shouldRender && data.length === 0) {
        return null;
    }
    return (jsxRuntime.jsx("div", { ref: containerDivRef, class: classNames.classNames(['oj-c-messagebanner', classes]), tabIndex: -1, ...handlers, ...testIdProps, children: jsxRuntime.jsxs(Flex.Flex, { direction: "column", gap: variant === 'section' ? '1x' : undefined, children: [jsxRuntime.jsx(MessagesManager.MessagesManager, { animationStates: animationStates, initialAnimationStyles: initialAnimationStyles, data: data, onMessageWillRemove: handleNextFocus, children: ({ item }) => (jsxRuntime.jsx(Message.Message, { messageRef: setMessageRef(item.key), item: item, detailRenderer: MessagesManager.getRenderer(item, detailRendererKey, renderers), variant: variant === 'page' ? 'pageBanner' : 'sectionBanner', onClose: handleClose }, item.key)) }), jsxRuntime.jsx(LiveRegion.LiveRegion, { children: liveRegionText })] }) }));
}

exports.MessageBanner = MessageBanner;
//# sourceMappingURL=UNSAFE_MessageBanner.js.map
