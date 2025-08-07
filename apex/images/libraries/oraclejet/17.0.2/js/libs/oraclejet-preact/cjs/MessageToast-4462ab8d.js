/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
require('./LayerHost-46e4d858.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');
var useMessagesFocusManager = require('./useMessagesFocusManager-1bf493a6.js');
var useBreakpointValues = require('./useBreakpointValues-77cb15bb.js');
require('./MessagesContext-4e939750.js');
var useMessagesContext = require('./useMessagesContext-23d62331.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var Message = require('./Message-b703f9e4.js');
require('preact');
var utils = require('./utils-b7099be5.js');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');

require('./MessageFormattingUtils-42d84399.js');
var MessagesManager = require('./MessagesManager-9cc43d3a.js');
var Flex = require('./Flex-fbba4ad6.js');
var useTestId = require('./useTestId-8234ec1e.js');
var FocusTrap = require('./FocusTrap-0a03f5a2.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_MessageToast_themes_redwood_MessageToastTheme = require('./UNSAFE_MessageToast/themes/redwood/MessageToastTheme.js');
var MessageLayer = require('./MessageLayer-40ccf675.js');

/**
 * Animation states for toast messages
 * TODO: Get this from theme context provider
 */
const animationStates = {
    entering: (node) => ({
        from: {
            transform: `translate(0, ${node.offsetHeight}px)`,
            opacity: 1
        },
        to: {
            transform: 'translate(0, 0)',
            opacity: 1
        },
        end: {
            transform: 'unset',
            opacity: 1
        },
        options: {
            duration: 250
        }
    }),
    exiting: {
        from: {
            opacity: 1
        },
        to: {
            opacity: 0
        },
        end: {
            opacity: 0
        },
        options: {
            duration: 250
        }
    }
};
const initialAnimationStyles = {
    opacity: 0
};
/**
 * Message toasts are short, non-critical, auto-dismissible messages that communicate non-disruptive contextual messages.
 */
function MessageToast({ data, detailRendererKey, iconRendererKey, renderers, onClose, offset, position, testId }) {
    const testIdProps = useTestId.useTestId(testId);
    const messagesRef = hooks.useRef(new Map());
    const autoFocusRef = hooks.useRef(null);
    const containerDivRef = hooks.useRef(null);
    const focusHandleRef = hooks.useRef(null);
    const [liveRegionText, setLiveRegionText] = hooks.useState();
    const [shouldRender, setShouldRender] = hooks.useState(data.length > 0);
    const [shouldTrapFocus, setShouldTrapFocus] = hooks.useState(false);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const { UNSAFE_messagesLayerId } = useMessagesContext.useMessagesContext();
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
    // Update the focusHandleRef
    hooks.useImperativeHandle(focusHandleRef, () => ({
        focus: () => {
            // Only trigger focus if the component is rendering messages
            if (data.length) {
                // set the autoFocus ref to the first message and enable the focus trap
                // this will automatically focus the first message
                autoFocusRef.current = messagesRef.current.get(data[0].key) ?? null;
                setShouldTrapFocus(true);
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
        }, [translations]),
        onFocusLeave: hooks.useCallback(() => {
            // disable trap which should revert the focus back to the last focused item
            setShouldTrapFocus(false);
        }, [])
    }, {
        // we do not want the focus manager to handle Esc key as we handle it using the
        // FocusTrap here
        handleEscapeKey: false
    });
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
            setShouldTrapFocus(false);
            // If the current message holds focus, then restore previous focus
            if (isClosedMessageFocused) {
                // As we have FocusTrap, trying to restore focus now will simply result in focus being pulled
                // back again. So, we restore the focus in the next tick so that the rendering will have been
                // done in the microtask.
                setImmediate(() => controller.restorePriorFocus());
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
    // We will be using a function based ref to store the refs in the Map
    const setHTMLDivElement = hooks.useCallback(
    // TODO: use ramda.curry here (currently it is throwing ts error when used with generics)
    (key) => {
        return (ref) => messagesRef.current.set(key, ref);
    }, []);
    // Prioritize this component whenever the data changes and
    // the new data has at least one message
    hooks.useEffect(() => {
        const previousDataLength = prevDataLengthRef.current;
        prevDataLengthRef.current = data.length;
        // if there are messages that need to be rendered now, then do the following deeds:
        // 1. set the shouldRender flag
        // 2. set the live region
        // 3. prioritize this message component to be the latest
        if (data.length) {
            // set state to render content whenever the data is not empty
            setShouldRender(true);
            if (data.length > previousDataLength) {
                // Only when having a new message, update the aria-live area with the
                // text to indicate how to get the focus to the new message.
                setLiveRegionText(translations.message_navigationToMessagesRegion());
            }
            controller.prioritize();
            return;
        }
        // if there were messages and now removed, then set the live region to
        // announce this information
        if (previousDataLength) {
            setLiveRegionText(translations.messageToast_allMessagesClosed());
            return;
        }
        // When there are no messages, clear the live region so that
        // the navigation text will be read when a new message appear
        setLiveRegionText('');
    }, [controller, data.length, translations]);
    // determine responsive max-width
    const maxWidth = useBreakpointValues.useBreakpointValues({
        sm: `calc(100vw - ${utils.xUnits(8)})`,
        md: `calc(100vw - ${utils.xUnits(12)})`,
        lg: `calc(150 * ${utils.xUnits(1)})`
    });
    // without offset, the messages will be hugging the vertical edges of the screen
    // so we will set a default offset.vertical value (any offset from the props will be
    // added to this).
    const paddedOffset = useBreakpointValues.useBreakpointValues({
        sm: {
            horizontal: typeof offset === 'number' ? offset : offset?.horizontal ?? 0,
            vertical: 16 + (typeof offset === 'number' ? offset : offset?.vertical ?? 0)
        },
        lg: {
            horizontal: typeof offset === 'number' ? offset : offset?.horizontal ?? 0,
            vertical: 24 + (typeof offset === 'number' ? offset : offset?.vertical ?? 0)
        }
    });
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_MessageToast_themes_redwood_MessageToastTheme.MessageToastRedwoodTheme);
    // When both shouldRender flag is false and no data to render, do not render
    // anything except the live region
    if (!shouldRender && data.length === 0) {
        return jsxRuntime.jsx(LiveRegion.LiveRegion, { children: liveRegionText });
    }
    // TODO - Message Toast shouldn't always render as 'dark', it should be the inverse of the root environment context
    // See JET-57590
    return (jsxRuntime.jsxs(EnvironmentProvider.EnvironmentProvider, { environment: { colorScheme: 'dark' }, children: [jsxRuntime.jsx(MessageLayer.MessageLayer, { offset: paddedOffset, position: position, children: jsxRuntime.jsx("div", { class: classes, ref: containerDivRef, tabIndex: -1, id: UNSAFE_messagesLayerId, ...handlers, ...testIdProps, children: jsxRuntime.jsx(FocusTrap.FocusTrap, { autoFocusRef: autoFocusRef, isDisabled: !shouldTrapFocus, children: jsxRuntime.jsx(Flex.Flex, { direction: "column", gap: "1x", align: "center", maxWidth: maxWidth, children: jsxRuntime.jsx(MessagesManager.MessagesManager, { animationStates: animationStates, initialAnimationStyles: initialAnimationStyles, data: data, onMessageWillRemove: handleNextFocus, children: ({ item }) => (jsxRuntime.jsx(Message.Message, { messageRef: setHTMLDivElement(item.key), item: item, detailRenderer: MessagesManager.getRenderer(item, detailRendererKey, renderers), iconRenderer: MessagesManager.getRenderer(item, iconRendererKey, renderers), onClose: onClose, variant: "toast" }, item.key)) }) }) }) }) }), jsxRuntime.jsx(LiveRegion.LiveRegion, { children: liveRegionText })] }));
}

exports.MessageToast = MessageToast;
//# sourceMappingURL=MessageToast-4462ab8d.js.map
