/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 *
 * Main view class containing all the visuals of the chat. It can be rendered either
 * as a dialog or as an inline view.
 */

import { Chat, events as chatEvents } from './Chat.mjs';
import { EventDispatcher } from './EventDispatcher.mjs';
import { MessageView, events as messageViewEvents } from './MessageView.mjs';
import { messageTypes } from './Message.mjs';
import { getUniqueId } from './util.mjs';

// dependencies
const { jQuery: $, lang, util } = apex;

const
    CLS_MAIN = 'a-ChatClient',
    CLS_TRANSCRIPT = 'a-ChatTranscript',
    CLS_TRANSCRIPT_DISCLAIMER = 'a-ChatTranscript-disclaimer',
    CLS_TRANSCRIPT_LOG = 'a-ChatTranscript-log',
    CLS_MESSAGES = 'a-ChatItems',
    CLS_QUICK_PICKS = 'a-ChatActions-quickPicks',
    CLS_INPUT_CONTAINER = 'a-ChatInputContainer',
    CLS_TEXTAREA_CONTAINER = 'a-ChatInput',
    CLS_TEXTAREA_WRAPPER = 'a-ChatInput-textWrap',
    CLS_TEXTAREA_RESIZER = 'a-ChatInput-textPreview',
    CLS_TEXTAREA = 'a-ChatInput-text',
    CLS_DIALOG = 'ui-dialog--chat-client',
    CLS_SEND_BTN = 'a-ChatInput-button',
    CLS_SEND_BTN_ICON = 'a-ChatInput-icon';

const renderModes = {
    INLINE: 'inline',
    DIALOG: 'dialog',
    NONE: 'none' // default
};

const
    MSG_TEXTAREA_LABEL = lang.getMessage('APEX.AI.TEXTAREA_LABEL'),
    MSG_DIALOG_TITLE = lang.getMessage('APEX.AI.DIALOG_TITLE'),
    MSG_CONVERSATION_HISTORY = lang.getMessage('APEX.AI.CONVERSATION_HISTORY'),
    MSG_TEXTAREA_PLACEHOLDER = lang.getMessage('APEX.AI.TEXTAREA_PLACEHOLDER'),
    MSG_WARN_UNSENT_MESSAGE = lang.getMessage('APEX.AI.WARN_UNSENT_MESSAGE'),
    MSG_SEND_MESSAGE = lang.getMessage('APEX.AI.SEND_MESSAGE'),
    MSG_QUICK_ACTIONS_ARIA_LABEL = lang.getMessage('APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL');

const
    DIALOG_DEFAULT_WIDTH = 500,
    DIALOG_DEFAULT_HEIGHT = 600;

const baseHtml = `
    <div class="${CLS_MAIN}">
        <div class="${CLS_TRANSCRIPT}" role="region" aria-label="${util.escapeHTMLAttr(MSG_CONVERSATION_HISTORY)}">
            <div class="${CLS_TRANSCRIPT_LOG}" role="log">
                <ul class="${CLS_MESSAGES}" tabindex="0" aria-label="${util.escapeHTMLAttr(MSG_CONVERSATION_HISTORY)}">
                </ul>
            </div>
        </div>
        <div class="${CLS_INPUT_CONTAINER}">
            <div class="${CLS_TEXTAREA_CONTAINER}" role="region" aria-label="${util.escapeHTMLAttr(MSG_TEXTAREA_LABEL)}">
                <div class="${CLS_TEXTAREA_WRAPPER}">
                    <textarea class="${CLS_TEXTAREA}" aria-label="${util.escapeHTMLAttr(MSG_TEXTAREA_LABEL)}" enterkeyhint="send" rows="1"></textarea>
                    <span class="${CLS_TEXTAREA_RESIZER}" aria-hidden="true"></span>
                </div>
                <div class="a-ChatInput-actions">
                    <button class="${CLS_SEND_BTN} ${CLS_SEND_BTN}--send" title="${util.escapeHTMLAttr(MSG_SEND_MESSAGE)}" aria-label="${util.escapeHTMLAttr(MSG_SEND_MESSAGE)}">
                        <span class="${CLS_SEND_BTN_ICON} a-Icon icon-arrow-up" aria-hidden="true">
                        </span>
                    </button>
                </div>
            </div>
        </div>
    </div>`;

let id = 0;

const events = {
    MESSAGE_VIEW_RENDER: 'messageviewrender',
    MESSAGE_QUICK_ACTION_TRIGGER: 'messageviewquickactiontrigger',
    MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER: 'messagecodeblockquickactiontrigger',
    QUICK_ACTION_TRIGGER: 'quickactiontrigger',
    HIDE: 'hide',
    DIALOG_CLOSE: 'dialogclose',
    DESTROY: 'destroy'
};

class ChatView extends EventDispatcher {

    #model;
    #options;

    #id;
    #chatContainer$;
    #el;
    #transcriptEl;
    #messageListEl;
    #textAreaContainerEl;
    #textareaEl;
    #textareaResizerEl;
    #quickActionsEl;
    #quickActions = new Map();
    #messageViews = [];
    #sendBtnEl;
    #chatLocked = false;
    #apiInitiated = false;
    #hidden = true;
    #destroyed = false;
    #scrolledToBottom = true;

    // Native events - handlers
    #onTextareaInput = () => {
        this.#setSendButtonDisabledAttribute();
        this.#updateTextareaResizerText();
    };

    #onTextareaKeyDown = e => {
        const { which, shiftKey } = e;
        // on enter click
        if (which === 13 && !shiftKey) {
            e.preventDefault();
            this.#maybeSubmitTextareaMessage();
        }
    };

    #onSendBtnClick = () => {
        this.#maybeSubmitTextareaMessage();
    };

    #onQuickActionClick = e => {
        if (this.#model.isLocked()) {
            return;
        }
        const pick = this.#quickActions.get(e.currentTarget);
        const { message } = pick;
        if (message) {
            this.#model.addUserMessage(message, messageTypes.TEXT);
        }
        this.removeQuickActions();
        this.#textareaEl.focus();
        this.triggerEvent(events.QUICK_ACTION_TRIGGER, pick);
    };

    #onTranscriptScroll = e => {
        const { target: el } = e;
        this.#scrolledToBottom = el.scrollHeight - el.scrollTop - el.clientHeight < 1;
    };

    constructor(model, options) {
        super();
        // eslint-disable-next-line
        this.#id = `main-view-${id++}`;
        this.#options = $.extend({
            user: null,
            el: null,
            focus: true,
            disclaimer: null,
            highlightCodeFn: null,
            mode: renderModes.DIALOG,
            title: MSG_DIALOG_TITLE,
            placeholder: MSG_TEXTAREA_PLACEHOLDER,
            width: DIALOG_DEFAULT_WIDTH, // applies only to dialog
            height: DIALOG_DEFAULT_HEIGHT // applies only to dialog
        }, options);

        if (model instanceof Chat) {
            this.#model = model;
        }
        else {
            throw new Error('A valid Chat instance must be provided');
        }

        this.#build();
    }

    findMessageViewByModel(model) {
        return this.#messageViews.find(view => view.model === model);
    }

    show(focus = true) {
        if (!this.#hidden) {
            return;
        }

        const { mode } = this.#options;

        if (mode === renderModes.DIALOG) {
            this.#chatContainer$.dialog('open');
        }
        else {
            $(this.#el).show();
        }
        if (focus) {
            this.#textareaEl.focus();
        }

        this.#hidden = false;
    }

    hide() {
        if (this.#hidden) {
            return;
        }

        this.#hidden = true;

        const { mode } = this.#options;

        if (mode === renderModes.DIALOG) {
            this.#apiInitiated = true;
            this.#chatContainer$.dialog('close');
            this.#apiInitiated = false;
            this.triggerEvent(events.DIALOG_CLOSE);
        }
        else {
            $(this.#el).hide();
        }

        this.triggerEvent(events.HIDE);
    }

    // syntactic sugar for hide(), to be used by dialog views
    close() {
        this.hide();
    }

    destroy(clearOwnListeners = true) {
        if (this.#destroyed) {
            return;
        }

        // needs to be before close() in case somebody calls destroy()
        // on the DIALOG_CLOSE event
        this.#destroyed = true;

        const { mode } = this.#options;

        this.close();

        const chat = this.#model;
        this.#messageViews.forEach(msgView => {
            msgView.destroy();
            // can be off-ed completely as there is no other instance using them
            msgView.off();
        });
        // remove only the listeners for 'this', scope
        chat.offAllScoped(this);

        if (clearOwnListeners) {
            this.off();
        }

        if (this.#quickActions.size) {
            this.#quickActions.forEach((value, key) => {
                key.removeEventListener('click', this.#onQuickActionClick);
            });
        }
        this.#textareaEl.removeEventListener('input', this.#onTextareaInput);
        this.#textareaEl.removeEventListener('keydown', this.#onTextareaKeyDown);
        this.#sendBtnEl.removeEventListener('click', this.#onSendBtnClick);
        this.#transcriptEl.removeEventListener('scroll', this.#onTranscriptScroll);

        if (mode === renderModes.DIALOG) {
            this.#chatContainer$
                .dialog('destroy')
                .remove();
        }
        else {
            this.#el.remove();
        }

        this.triggerEvent(events.DESTROY);
    }

    isDestroyed() {
        return this.#destroyed;
    }

    get destroyed() {
        return this.#destroyed;
    }

    hasUncommittedInput() {
        return !this.#destroyed &&
            !this.#hidden &&
            this.#textareaEl.value !== '';
    }

    get id() {
        return this.#id;
    }

    #build() {
        let chatContainer$;
        let el;
        let sendBtnEl;

        const model = this.#model;
        const {
            quickActions,
            mode,
            el: renderToEl,
            title,
            focus,
            width,
            height,
            disclaimer
        } = this.#options;

        if (mode === renderModes.INLINE) {
            chatContainer$ = $(renderToEl);
        }
        else if (mode === renderModes.DIALOG) {
            chatContainer$ = apex.message.showDialog('', {
                // disable various functionalities
                okButton: false,
                confirm: false,
                alert: false,
                //
                height,
                width,
                minHeight: 400,
                minWidth: 300,
                //
                autoOpen: false,
                dialogClass: CLS_DIALOG,
                // providing an ID, so the dialog won't get removed on close, only hidden
                // this is a quirk of message.showDialog
                id: getUniqueId(),
                isPopup: false,
                noOverlay: false,
                draggable: true,
                resizable: true,
                title,
                unsafe: false,
                takeFocus: true,
                beforeClose: () => {
                    // something triggered the close event. it's important to know what
                    if (this.#apiInitiated) {
                        //noting to do. close gracefully
                        return;
                    }
                    else {
                        // if the user initiated the close and the textfield has text, show a prompt
                        if (this.hasUncommittedInput()) {
                            apex.message.confirm(MSG_WARN_UNSENT_MESSAGE, okPressed => {
                                if (okPressed) {
                                    // we'll end up again in beforeClose but this time as apiInitiated
                                    this.close();
                                }
                            });
                            return false;
                        } else {
                            // go through the api so it sets isHidden, triggers events, etc
                            // we'll end up again in beforeClose but this time as apiInitiated
                            this.close();
                            return false;
                        }
                    }
                }
            });
        }
        else {
            throw new Error('Invalid option for mode');
        }

        el = document.createRange().createContextualFragment(baseHtml).firstElementChild;
        chatContainer$[0].append(el);

        sendBtnEl = el.querySelector(`.${CLS_SEND_BTN}`);
        sendBtnEl.disabled = true;

        // expose for other methods
        this.#chatContainer$ = chatContainer$;
        this.#el = el;
        this.#sendBtnEl = sendBtnEl;
        this.#transcriptEl = el.querySelector(`.${CLS_TRANSCRIPT}`);
        this.#messageListEl = el.querySelector(`.${CLS_MESSAGES}`);
        this.#textAreaContainerEl = el.querySelector(`.${CLS_INPUT_CONTAINER}`);
        this.#textareaEl = el.querySelector(`.${CLS_TEXTAREA}`);
        this.#textareaResizerEl = el.querySelector(`.${CLS_TEXTAREA_RESIZER}`);

        if (disclaimer) {
            const disclaimerEl = document.createElement('div');
            disclaimerEl.classList.add(CLS_TRANSCRIPT_DISCLAIMER);
            disclaimerEl.appendChild(document.createTextNode(disclaimer));
            this.#transcriptEl.prepend(disclaimerEl);
        }

        this.#setupTextarea();
        this.#setupListeners();

        if (Array.isArray(quickActions) && quickActions.length) {
            this.createQuickActions(quickActions);
        }

        model.getHistory().messages.forEach(message => this.#maybeRenderMessage(message));
        if (model.isLocked()) {
            this.#onChatLock();
        }

        this.show(focus);
    }

    createQuickActions(arr = []) {
        this.removeQuickActions();

        if (arr.length) {
            const container = document.createElement('div');
            container.classList.add(CLS_QUICK_PICKS);
            container.setAttribute('role', 'region');
            container.setAttribute('aria-label', MSG_QUICK_ACTIONS_ARIA_LABEL);
            this.#quickActionsEl = container;

            arr.forEach(pick => {
                const btn = document.createElement('button');
                btn.type = 'button';
                btn.classList.add('a-Button');
                const { title, description, disabled } = pick;
                if (title) {
                    const titleEl = document.createElement('span');
                    const id = getUniqueId();
                    titleEl.textContent = title;
                    titleEl.classList.add('a-Button-label', 'a-Button-label--title');
                    titleEl.id = id;
                    btn.setAttribute('aria-labelledby', id);
                    btn.appendChild(titleEl);
                }
                if (description) {
                    const descriptionEl = document.createElement('span');
                    const id = getUniqueId();
                    descriptionEl.textContent = description;
                    descriptionEl.classList.add('a-Button-label', 'a-Button-label--description');
                    descriptionEl.id = id;
                    btn.setAttribute('aria-describedby', id);
                    btn.appendChild(descriptionEl);
                }
                if (disabled) {
                    btn.disabled = true;
                }
                this.#quickActions.set(btn, pick);
                btn.addEventListener('click', this.#onQuickActionClick);
                container.appendChild(btn);
            });
            this.#el.insertBefore(container, this.#textAreaContainerEl);
            if (this.#scrolledToBottom) {
                this.scrollTranscriptToBottom(true);
            }
        }

        return this.getQuickActionButtons();
    }

    removeQuickActions() {
        if (this.#quickActions.size) {
            this.#quickActions.forEach((value, key) => {
                key.removeEventListener('click', this.#onQuickActionClick);
            });
            this.#quickActions.clear();
            this.#quickActionsEl.remove();
            this.#quickActionsEl = null;
        }
    }

    getQuickActionButtons() {
        return Array.from(this.#quickActions.entries()).map(([button, actionObj]) => ({ button, actionObj }));
    }

    getMessageViews() {
        return [...this.#messageViews];
    }

    get el() {
        return this.#el;
    }

    #setupListeners() {
        this.#model.on(chatEvents.MESSAGE_ADDED, this.#onMessageModelAdded, { scope: this });
        this.#model.on(chatEvents.CHAT_LOCK, this.#onChatLock, { scope: this });
        this.#model.on(chatEvents.CHAT_UNLOCK, this.#onChatUnlock, { scope: this });
        this.#model.on(chatEvents.CLEAR, this.#onMessagesClear, { scope: this });

        this.#textareaEl.addEventListener('input', this.#onTextareaInput);
        this.#textareaEl.addEventListener('keydown', this.#onTextareaKeyDown);
        this.#sendBtnEl.addEventListener('click', this.#onSendBtnClick);
        this.#transcriptEl.addEventListener('scroll', this.#onTranscriptScroll);
    }

    #setSendButtonDisabledAttribute() {
        this.#sendBtnEl.disabled = this.#chatLocked || !this.#textareaEl.value;
    }

    #onMessageModelAdded(e, message) {
        this.#maybeRenderMessage(message);
    }

    #onChatLock() {
        this.#chatLocked = true;
        this.#sendBtnEl.disabled = true;
        this.#quickActionsEl?.querySelectorAll('button').forEach(btn => btn.disabled = true);
    }

    #onChatUnlock() {
        this.#chatLocked = false;
        this.#setSendButtonDisabledAttribute();
        this.#quickActionsEl?.querySelectorAll('button').forEach(btn => btn.disabled = false);
    }

    #onMessagesClear() {
        this.#messageViews.forEach(view => {
            view.destroy();
            // can be off-ed completely as there is no other instance using them
            view.off();
            view.el.remove();
        });
        this.#messageViews = [];
    }

    #maybeRenderMessage(message) {
        // hidden messages should not appear in the view, they are for context only
        if (message.hidden) {
            return;
        }

        const view = new MessageView(message, { highlightCodeFn: this.#options.highlightCodeFn });
        this.#messageViews.push(view);
        this.#messageListEl.append(view.el);
        this.#scrollMessageIntoView(view);

        view.on(messageViewEvents.QUICK_ACTION_TRIGGER, this.#onMessageViewQuickActionTrigger, { scope: this });
        view.on(messageViewEvents.CODE_BLOCK_QUICK_ACTION_TRIGGER, this.#onMessageViewCodeBlockQuickActionTrigger, { scope: this });
        view.on(messageViewEvents.AFTER_LOAD_RENDER, this.#onMessageViewAfterLoadRender, { scope: this });
        view.on(messageViewEvents.AFTER_QUICK_ACTIONS_RENDER, this.#onMessageViewAfterQuickActionsRender, { scope: this });

        this.triggerEvent(events.MESSAGE_VIEW_RENDER, view);
    }

    #onMessageViewQuickActionTrigger(e, actionObj) {
        this.triggerEvent(events.MESSAGE_QUICK_ACTION_TRIGGER, e.target, actionObj);
    }

    #onMessageViewCodeBlockQuickActionTrigger(e, actionObj, buttonEl, codeBlockEl) {
        this.triggerEvent(events.MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER, e.target, actionObj, buttonEl, codeBlockEl);
    }

    #onMessageViewAfterLoadRender(e) {
        this.#scrollMessageIntoView(e.target);
    }

    #onMessageViewAfterQuickActionsRender(e) {
        this.#scrollMessageIntoView(e.target);
    }

    #setupTextarea() {
        const self = this,
            o = self.#options,
            textareaEl = this.#textareaEl;

        if (o.placeholder) {
            textareaEl.setAttribute('placeholder', o.placeholder);
        }
    }

    #maybeSubmitTextareaMessage() {
        if (this.#chatLocked) {
            return false;
        }

        const ta = this.#textareaEl;
        const message = ta.value;
        if (message.length) {
            // remove quick picks
            if (this.#quickActionsEl) {
                this.removeQuickActions();
            }
            this.#model.addUserMessage(message, messageTypes.TEXT);
            ta.value = '';
            this.#updateTextareaResizerText();
            this.#setSendButtonDisabledAttribute();
            // set the focus back to the textfield - this is necessary when the button was clicked/keyed down
            this.#textareaEl.focus();
        }

        return true;
    }

    isTranscriptScrolledToBottom() {
        const el = this.#transcriptEl;
        return el.scrollHeight - el.scrollTop - el.clientHeight < 1;
    }

    scrollTranscriptToBottom(instant = false) {
        const el = this.#transcriptEl;
        el.scroll({ top: el.scrollHeight, behavior: instant ? 'instant' : 'smooth' });
    }

    #scrollMessageIntoView(messageView) {
        const messageEl = messageView.el;
        this.#transcriptEl.scroll({ top: messageEl.offsetTop, behavior: 'smooth' });
    }

    #updateTextareaResizerText() {
        this.#textareaResizerEl.innerText = this.#textareaEl.value;
    }
}

ChatView.events = events;

export { ChatView, renderModes, events };