/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 *
 * The main class of the AI Chat widget. Upon instantiation it creates the main model.
 * It exposes the APIs for working with the model and the views, such as managing views,
 * adding messages, destroying instances, etc.
 */

import { AIChat, events as aiChatEvents } from './AIChat.mjs';
import { ChatView, renderModes } from './ChatView.mjs';
import { User } from './User.mjs';
import { EventDispatcher } from './EventDispatcher.mjs';
import { messageTypes } from './Message.mjs';
import { getUserAvatar } from '../ai.mjs';
import { selectElementTextContent } from './util.mjs';

const { jQuery: $, lang, server } = apex;

const
    MSG_NAME_USER = lang.getMessage('APEX.AI.NAME_USER'),
    MSG_NAME_ASSISTANT = lang.getMessage('APEX.AI.NAME_ASSISTANT'),
    MSG_ACTION_COPY_LABEL = lang.getMessage('APEX.AI.COPY'),
    MSG_ACTION_COPY_DONE_LABEL = lang.getMessage('APEX.AI.COPIED');

const events = {
    MESSAGE_QUICK_ACTION_TRIGGER: 'messagequickactiontrigger',
    MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER: 'messagecodeblockquickactiontrigger',
    MESSAGE_RENDER: 'messagerender',
    QUICK_ACTION_TRIGGER: 'quickactiontrigger',
    CHAT_LOCK: aiChatEvents.CHAT_LOCK,
    CHAT_UNLOCK: aiChatEvents.CHAT_UNLOCK,
    MESSAGE_ADDED: aiChatEvents.MESSAGE_ADDED,
    MESSAGE_LOAD_COMPLETE: aiChatEvents.MESSAGE_LOAD_COMPLETE,
    MESSAGE_LOAD_ERROR: aiChatEvents.CHAT_LOCK
};

const actions = {
    COPY: {
        label: MSG_ACTION_COPY_LABEL,
        iconClasses: 'icon-copy',
        action: function(app, mainView, messageView, actionObj, buttonEl, codeBlockEl) {
            const cls = 'is-copied';
            const newIconClasses = 'ui-icon-check';
            const { iconClasses } = actionObj;
            const updateBtn = (text, ariaLabel) => {
                const datasetName = 'copyTimeoutId';
                const runningTimeout = parseInt(buttonEl.dataset[datasetName], 10);

                // if the copy-button has been clicked already and the timeout is running, return
                if (runningTimeout) {
                    return;
                }

                const labelEl = buttonEl.querySelector('.a-ChatItem-buttonLabel');
                const iconEl = buttonEl.querySelector('.a-ChatItem-buttonIcon');
                let prevAriaLabel;

                buttonEl.classList.add(cls);

                if (text != null && labelEl) {
                    labelEl.innerText = text;
                }
                if (ariaLabel != null) {
                    prevAriaLabel = buttonEl.getAttribute('aria-label');
                    buttonEl.setAttribute('aria-label', ariaLabel);
                }
                if (iconEl) {
                    if (iconClasses) {
                        iconEl.classList.toggle(...iconClasses.split(' '));
                    }
                    if (newIconClasses) {
                        iconEl.classList.toggle(...newIconClasses.split(' '));
                    }
                }

                buttonEl.dataset[datasetName] = setTimeout(() => {
                    delete buttonEl.dataset[datasetName];
                    buttonEl.classList.remove(cls);
                    if (prevAriaLabel != null) {
                        buttonEl.setAttribute('aria-label', prevAriaLabel);
                    }
                    if (labelEl) {
                        labelEl.innerText = MSG_ACTION_COPY_LABEL;
                    }
                    if (iconEl) {
                        if (iconClasses) {
                            iconEl.classList.toggle(...iconClasses.split(' '));
                        }
                        if (newIconClasses) {
                            iconEl.classList.toggle(...newIconClasses.split(' '));
                        }
                    }
                }, 3000);

            };

            if (navigator.clipboard) {
                try {
                    navigator.clipboard.writeText(codeBlockEl.innerText.replace(/\u00a0/g, ' '));
                    updateBtn(MSG_ACTION_COPY_DONE_LABEL);
                }
                catch (err) {
                    // fail silently
                }
            }
            // legacy
            else {
                selectElementTextContent(codeBlockEl);
                try {
                    const result = document.execCommand('copy');
                    if (result) {
                        updateBtn(MSG_ACTION_COPY_DONE_LABEL);
                    }
                }
                catch (err) {
                    // fail silently
                }
                finally {
                    window.getSelection().removeAllRanges();
                }
            }
        }
    }
};

class AIChatApp extends EventDispatcher {

    #chat;
    #currentUser;
    #aiUser;
    #relayedModelEventsDestroy;
    #destroyed = false;

    #ajaxCallback;
    #views = [];

    constructor(options = {}) {
        const {
            ajaxCallback,
            ajaxId,
            processMessage,
            history,
            currentUserData = {},
            aiUserData = {}
        } = options;
        let processMessageFn;

        super();

        const currentUser = new User($.extend({
            id: '1',
            name: MSG_NAME_USER,
            messageStyle: 'outbound',
            avatar: getUserAvatar()
        }, currentUserData));
        this.#currentUser = currentUser;

        const aiUser = new User($.extend({
            id: '2',
            name: MSG_NAME_ASSISTANT,
            messageStyle: 'inbound',
            avatar: {
                iconClasses: 'a-Icon icon-apex-assistant'
            }
        }, aiUserData));
        this.#aiUser = aiUser;

        if (ajaxId) {
            this.#ajaxCallback = data => {
                return server.plugin(ajaxId, {
                    p_widget_name: 'ai',
                    ...data
                });
            };
        }
        else if (ajaxCallback) {
            this.#ajaxCallback = ajaxCallback;
        }
        else {
            throw new Error('Either ajaxId or ajaxCallback is required');
        }

        if (typeof processMessage === 'function') {
            processMessageFn = messageModel => {
                return processMessage(this, messageModel);
            };
        }

        this.#setupModel({ history, processMessage: processMessageFn });
    }

    /**
     * Adds a message to the model and displays it in the view(s). While the promise is resolving, it is not possible
     * to add more messages. Wait for the unlock event or the promise resolution. To submit the conversation see the `commit` method.
     *
     * @param {User} user User which adds the message.
     * @param {string} content Message to be displayed in the bubble and included in the communication (if no `fullContent` is set).
     * @param {string} messageType Type of the message, one of AIChatApp.messageTypes. It defaults to "markdown" (AIChatApp.messageTypes.MARKDOWN)
     * when the user is the AI and "text" (AIChatApp.messageTypes.TEXT) when the user is the current user (person).
     * @param {object} [opt] Options object for additional settings.
     * @param {string} [opt.fullContent] If set, `fullContent` will be sent to the AI instead of `content`. `content` will still appear in the bubble.
     * @param {boolean} [opt.excludeFromCommits] If true, this message will never be sent to the AI (will be excluded from the data sent).
     * @param {boolean} [opt.hidden] If true, this message will not be rendered in the view.
     * @param {boolean} [opt.cssClasses] The classes to add to the element of the message view in every chat view that uses this app's model.
     *
     * @returns {Promise} Promise which resolves to the `content` of the added message.
     */
    async addMessage(user, content, messageType, opt = {}) {
        return this.#chat.addMessage(user, content, messageType, opt, false);
    }

    /**
     * Adds a message to the model and displays it in the view(s) is it would be added by the AI. While the promise is resolving, it is not possible
     * to add more messages. Wait for the unlock event or the promise resolution. To submit the conversation see the `commit` method.
     *
     * @param {string|object} message Either the string content of the message or an object containing message properties.
     * @param {string} [message.content] Message string content.
     * @param {string} [message.type] Type of the message, one of AIChatApp.messageTypes. It defaults to "markdown" (AIChatApp.messageTypes.MARKDOWN).
     * @param {string} [message.fullContent] If set, `fullContent` will be sent to the AI instead of `content`. `content` will still appear in the bubble.
     * @param {boolean} [message.excludeFromCommits] If true, this message will never be sent to the AI (will be excluded from the data sent).
     * @param {boolean} [message.hidden] If true, this message will not be rendered in the view.
     * @param {boolean} [message.cssClasses] The classes to add to the element of the message view in every chat view that uses this app's model.
     * @param {boolean} fakeTyping Simulate the typing and response time of the AI for a more human-like feeling.
     *
     * @returns {Promise} Promise which resolves to the `content` of the added message if it is not committed, otherwise to the content of the AI's response.
     */
    async addAiMessage(message, fakeTyping = false) {
        let content,
            type = messageTypes.MARKDOWN,
            fullContent,
            excludeFromCommits = false,
            hidden = false,
            cssClasses;

        if (typeof message === 'string') {
            content = fullContent = message;
        }
        else {
            ({ content, type = messageTypes.MARKDOWN, fullContent, excludeFromCommits = false, hidden = false, cssClasses } = message);
        }
        return this.#chat.addAiMessage(content, type, { fullContent, excludeFromCommits, hidden, cssClasses }, false, 0, fakeTyping);
    }

    /**
     * Adds a message to the model and displays it in the view(s) is it would be added by the current user. While the promise is resolving, it is not possible
     * to add more messages. Wait for the unlock event or the promise resolution. To submit the conversation see the `commit` method.
     *
     * @param {string|object} message Either the string content of the message or an object containing message properties.
     * @param {string} [message.content] Message string content.
     * @param {string} [message.type] Type of the message, one of AIChatApp.messageTypes. It defaults to "text" (AIChatApp.messageTypes.TEXT).
     * @param {string} [message.fullContent] If set, `fullContent` will be sent to the AI instead of `content`. `content` will still appear in the bubble.
     * @param {boolean} [message.excludeFromCommits] If true, this message will never be sent to the AI (will be excluded from the data sent).
     * @param {boolean} [message.hidden] If true, this message will not be rendered in the view.
     * @param {boolean} [message.cssClasses] The classes to add to the element of the message view in every chat view that uses this app's model.
     *
     * @returns {Promise} Promise which resolves to the `content` of the added message if it is not committed, otherwise to the content of the AI's response.
     */
    async addUserMessage(message) {
        let content,
            type = messageTypes.TEXT,
            fullContent,
            excludeFromCommits = false,
            hidden = false,
            cssClasses;

        if (typeof message === 'string') {
            content = fullContent = message;
        }
        else {
            ({ content, type = messageTypes.TEXT, fullContent, excludeFromCommits = false, hidden = false, cssClasses } = message);
        }
        return this.#chat.addUserMessage(content, type, { fullContent, excludeFromCommits, hidden, cssClasses }, false);
    }

    /**
     * Submits the conversation to the AI.
     *
     * @returns {Promise} Promise which resolves with the `content` of the message returned by the AI.
     */
    commit() {
        return this.#chat.commit();
    }

    /**
     * Checks whether the chat is locked. If it is locked, no new messages can be added. Wait for the unlock event before adding messages.
     *
     * @returns {boolean} Whether the chat is locked.
     */
    isLocked() {
        return this.#chat.isLocked();
    }

    /**
     * Returns the history of the conversation which can be fed into another AIChatApp instance to restore it. Only resolved messages are returned.
     *
     * @returns {object} History of the chat.
     */
    getHistory() {
        let history = this.#chat.getHistory();
        let shouldCommit = false;
        const { messages, loadingMessage } = history;
        const retObj = {};

        if (!messages.length) {
            return {
                messages: [],
                commit: false
            };
        }

        if (loadingMessage) {
            shouldCommit = true;
            messages.pop();
        }
        else {
            const lastModel = messages[messages.length - 1];
            if (lastModel.promise && !lastModel.isLoaded()) {
                messages.pop();
            }
        }

        retObj.messages = messages.map(model => {
            return {
                content: model.content,
                fullContent: model.fullContent,
                userId: model.user.id,
                type: model.type,
                excludeFromCommits: model.excludeFromCommits,
                hidden: model.hidden,
                quickActions: model.quickActions
            };
        });
        retObj.commit = shouldCommit;

        return retObj;
    }

    /**
     * Creates a UI dialog view for this application.
     *
     * @param {object} opt Options object with the view's configuration.
     * @param {string} [opt.title] Title to appear in the header of the dialog.
     * @param {object[]} [opt.quickActions] Array of objects with `title`, `description` and `message` props which will display buttons with the `title`
     * and the `description` text after the view has been initialized. Clicking these buttons will automatically submit the `message` to the AI.
     * @param {boolean} [opt.focus] If true, focuses the input of the view.
     * @param {string} [opt.disclaimer] Permanently appears above the chat transcript, most commonly used to warn the users of possible inaccurate AI results.
     * @param {function} [opt.highlightCode] Function to override the default code block highlighting. The messageView and the highlighted element will be passed into it.
     *
     * @returns {ChatView} Created view.
     */

    createDialogView({
        title,
        quickActions,
        focus,
        width,
        height,
        disclaimer,
        highlightCode
    } = {}) {
        return this.#createView({
            mode: renderModes.DIALOG,
            title,
            quickActions,
            focus,
            width,
            height,
            disclaimer,
            highlightCode
        });
    }

    /**
     * Creates an inline view for this application.
     *
     * @param {object} opt Options object with the view's configuration.
     * @param {string} opt.el Element to render this view into.
     * @param {object[]} [opt.quickActions] Array of objects with `title`, `description` and `message` props which will display buttons with the `title`
     * and the `description` text after the view has been initialized. Clicking these buttons will automatically submit the `message` to the AI.
     * @param {boolean} [opt.focus] If true, focuses the input of the view.
     * @param {string} [opt.disclaimer] Permanently appears above the chat transcript, most commonly used to warn the users of possible inaccurate AI results.
     * @param {function} [opt.highlightCode] Function to override the default code block highlighting. The messageView and the highlighted element will be passed into it.
     *
     * @returns {ChatView} Created view.
     */
    createInlineView({
        el = 'body',
        quickActions,
        focus,
        disclaimer,
        highlightCode
    } = {}) {
        return this.#createView({
            mode: renderModes.INLINE,
            el,
            quickActions,
            focus,
            disclaimer,
            highlightCode
        });
    }

    /**
     * If the view has not been created using one of this class's exposed method (such as `createInlineView`) but instead with `new ChatView()`,
     * it should be registered using this method so the events dispatched by the view are correctly relayed through the app instance.
     *
     * @param {ChatView} view View to be managed through this app instance.
     */
    registerView(view) {
        view.on(ChatView.events.MESSAGE_QUICK_ACTION_TRIGGER, this.#onMessageViewQuickActionTrigger, { scope: this });
        view.on(ChatView.events.MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER, this.#onMessageViewCodeBlockQuickActionTrigger, { scope: this });
        view.on(ChatView.events.QUICK_ACTION_TRIGGER, this.#onViewQuickActionTrigger, { scope: this });
        view.on(ChatView.events.MESSAGE_VIEW_RENDER, this.#onMessageViewRender, { scope: this });
        view.on(ChatView.events.DESTROY, this.#onViewDestroy, { scope: this });
    }

    /**
     * Creates (and clears the previous) quick action buttons for the specified view.
     * 
     * @param {ChatView} view View to create the buttons for.
     * @param {object[]} arr Array of objects with the following properties: `title`, `description`, `message`, `action`.
     */
    setViewQuickActions(view, arr = []) {
        return view.createQuickActions(arr);
    }

    /**
     * Creates (and clears the previous) quick action buttons for every view created for this app/model.
     * 
     * @param {object[]} arr Array of objects with the following properties: `title`, `description`, `message`, `action`.
     */
    setAllViewsQuickActions(arr = []) {
        this.#views.forEach(view => view.createQuickActions(arr));
    }

    /**
     * Returns the HTML button elements of the quick actions for the specified view.
     * 
     * @param {ChatView} view View for which the buttons should be returned.
     * 
     * @returns {HTMLButtonElement[]} Array of objects with `buttons` and `actionObj` properties.
     */
    getViewQuickActionButtons(view) {
        return view.getQuickActionButtons();
    }

    /**
     * Returns the HTML button elements of the quick actions of all views created for this app/model.
     * 
     * @returns {Map} Map object with views as (map)keys, and arrays of objects with `buttons` and `actionObj` properties as (map)values.
     */
    getAllViewsQuickActionsButtons() {
        return this.#views.reduce((prev, currView) => {
            prev.set(currView, currView.getQuickActionButtons());
            return prev;
        }, new Map());
    }

    /**
     * Returns all views registered for the model of this app.
     * 
     * @returns {ChatView[]} Array of views.
     */
    getViews() {
        return [...this.#views];
    }

    /**
     * Closes (hides) the view. This method is a synonym to the `hide` method. Note: The element will remain in the DOM.
     *
     * @param {ChatView} view View to close.
     */
    closeView(view) {
        view.close();
    }

    /**
     * Hides the view. This method is a synonym to the `close` method.
     *
     * @param {ChatView} view View to hide.
     */
    hideView(view) {
        view.hide();
    }

    /**
     * Shows the view.
     *
     * @param {ChatView} view View to show.
     */
    showView(view) {
        view.show();
    }

    /**
     * Destroys the view and removes it from the DOM.
     *
     * @param {ChatView} view View to destroy.
     */
    destroyView(view) {
        // note: also clears own listeners (including the ones set in this class)
        view.destroy();
    }

    /**
     * Returns the current user (i.e. the human participant).
     *
     * @returns {User} The current user.
     */
    getCurrentUser() {
        return this.#currentUser;
    }

    /**
     * Returns the AI user.
     *
     * @returns {User} The AI user.
     */
    getAiUser() {
        return this.#aiUser;
    }

    /**
     * Returns the main model containing the conversation / messages.
     *
     * @returns {Chat} The model.
     */
    getModel() {
        return this.#chat;
    }

    /**
     * Clears all messages from the model and the view.
     */
    clearMessages() {
        this.#chat.clear();
    }

    /**
     * Expires all the messages of the model.
     * Expired messages will still appear in views but will not be submitted in the conversation with the AI.
     */
    expireMessages() {
        this.#chat.expire();
    }

    /**
     * Returns the main model containing the conversation / messages.
     *
     * @returns {Chat} The model.
     */
    get model() {
        return this.#chat;
    }

    /**
     * Destroys the app instance: cleans up the listeners, destroys the views and removes them from the DOM.
     */
    destroy() {
        const chat = this.#chat;

        this.#destroyed = true;

        this.#relayedModelEventsDestroy();
        chat.destroy();
        this.#views.forEach(view => {
            view.destroy();
        });
    }

    /**
     * Returns whether this app instance has been already destroyed.
     *
     * @returns {boolean} Whether app is destroyed.
     */
    isDestroyed() {
        return this.#destroyed;
    }

    /**
     * Returns whether this app instance has been already destroyed.
     *
     * @returns {boolean} Whether app is destroyed.
     */
    get destroyed() {
        return this.#destroyed;
    }

    #setupModel({
        history,
        processMessage
    }) {
        const chat = new AIChat({
            currentUser: this.#currentUser,
            aiUser: this.#aiUser,
            ajaxCallback: this.#ajaxCallback,
            processMessage
        });
        this.#chat = chat;

        if (history) {
            chat.restoreHistory(history);
        }

        this.#setupModelEvents();
    }

    #setupModelEvents() {
        this.#relayedModelEventsDestroy = this.relayEvents(this.#chat, [
            aiChatEvents.CHAT_LOCK,
            aiChatEvents.CHAT_UNLOCK,
            aiChatEvents.MESSAGE_ADDED,
            aiChatEvents.MESSAGE_LOAD_COMPLETE,
            aiChatEvents.MESSAGE_LOAD_ERROR,
            aiChatEvents.COMMIT
        ]);
    }

    #createView(cfg) {
        const { mode } = cfg;

        if (mode && Object.values(renderModes).includes(mode)) {
            const {
                el,
                quickActions,
                focus,
                disclaimer,
                title,
                width,
                height,
                highlightCode
            } = cfg;
            let highlightCodeFn;
            
            if (typeof highlightCode === 'function') {
                highlightCodeFn = (messageView, el) => {
                    return highlightCode(this, view, messageView, el);
                };
            }
            const view = new ChatView(this.#chat, {
                user: this.#currentUser,
                mode,
                el,
                quickActions,
                focus,
                disclaimer,
                title,
                width,
                height,
                highlightCodeFn
            });

            this.registerView(view);
            this.#views.push(view);

            return view;
        }
        throw new Error('Invalid render mode for the view.');
    }

    #onMessageViewQuickActionTrigger(e, messageView, actionObj) {
        const callback = actionObj.action;
        const mainView = e.currentTarget;
        if (callback && typeof callback === 'function') {
            callback(this, mainView, messageView, actionObj);
        }
        this.triggerEvent(events.MESSAGE_QUICK_ACTION_TRIGGER, mainView, messageView, actionObj);
    }

    #onMessageViewCodeBlockQuickActionTrigger(e, messageView, actionObj, buttonEl, codeBlockEl) {
        const callback = actionObj.action;
        const mainView = e.currentTarget;
        if (callback && typeof callback === 'function') {
            callback(this, mainView, messageView, actionObj, buttonEl, codeBlockEl);
        }
        this.triggerEvent(events.MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER, mainView, messageView, actionObj, buttonEl, codeBlockEl);
    }

    #onMessageViewRender(e, view) {
        const mainView = e.currentTarget;
        this.triggerEvent(events.MESSAGE_RENDER, mainView, view);
    }

    #onViewQuickActionTrigger(e, actionObj) {
        const callback = actionObj.action;
        const mainView = e.target;
        if (callback && typeof callback === 'function') {
            callback(this, mainView, actionObj);
        }
        this.triggerEvent(events.QUICK_ACTION_TRIGGER, mainView, actionObj);
    }

    #onViewDestroy(e) {
        const view = e.target;
        const index = this.#views.findIndex(v => v === view);
        if (index > -1) {
            this.#views.splice(index, 1);
        }
    }
}

AIChatApp.events = Object.freeze(events);
AIChatApp.renderModes = Object.freeze(renderModes);
AIChatApp.messageTypes = Object.freeze(messageTypes);
AIChatApp.actions = Object.freeze(actions);

export { AIChatApp, actions, events, renderModes as renderMode, messageTypes };