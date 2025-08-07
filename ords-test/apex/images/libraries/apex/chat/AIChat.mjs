/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 *
 * Main model for the conversation with the AI.
 */

import { Chat, events } from './Chat.mjs';
import { User } from './User.mjs';
import { messageTypes } from './Message.mjs';
import { resolveAfter } from './util.mjs';

const { debug, lang } = apex;

const MSG_ERROR = lang.getMessage('APEX.ERROR');

const role = {
    USER: 'user',
    ASSISTANT: 'assistant'
};

const ajaxMode = {
    MESSAGE_ADDED: 'new_message',
    GET_CONSENT_MESSAGE: 'get_consent_message'
};

class AIChat extends Chat {

    #currentUser;
    #aiUser;
    #ajaxCallback;
    #loadingMessage;

    constructor({
        currentUser,
        aiUser,
        ajaxCallback,
        history,
        processMessage
    }) {
        if (!(currentUser instanceof User)) {
            throw new Error('currentUser must be a User instance.');
        }
        if (!(aiUser instanceof User)) {
            throw new Error('aiUser must be a User instance.');
        }
        super({
            users: [currentUser, aiUser],
            history,
            processMessage
        });

        this.#currentUser = currentUser;
        this.#aiUser = aiUser;

        if (ajaxCallback != null) {
            this.#ajaxCallback = ajaxCallback;
        } else {
            throw new Error('ajaxCallback is required.');
        }
    }

    addMessage(user, content, type, opt = {}, commit, commitDelay) {
        const {
            fullContent = content,
            excludeFromCommits = false,
            hidden = false,
            cssClasses
        } = opt;
        type ??= user === this.#currentUser ? messageTypes.TEXT : messageTypes.MARKDOWN;
        commit ??= user === this.#currentUser;

        if (user === this.#currentUser) {
            return this.addUserMessage(content, type, { fullContent, excludeFromCommits, hidden, cssClasses }, commit, commitDelay);
        }
        else if (user === this.#aiUser) {
            return this.addAiMessage(content, type, { fullContent, excludeFromCommits, hidden, cssClasses }, commit, commitDelay);
        }
        else {
            throw new Error('Invalid user.');
        }
    }

    async addUserMessage(
        content,
        type = messageTypes.TEXT,
        { fullContent, excludeFromCommits = false, hidden = false, cssClasses } = {},
        commit = true,
        commitDelay = 200
    ) {
        if (this.isLocked()) {
            throw new Error('Cannot add message, the model is locked.');
        }

        super.addMessage(this.#currentUser, content, type, { fullContent, excludeFromCommits, hidden, cssClasses });

        if (commit) {
            return this.commit(commitDelay); // will simulate a bit of reaction time - AI message bubble will be added after this
        }
        else {
            return content;
        }
    }

    async addAiMessage(
        content,
        type = messageTypes.MARKDOWN,
        { fullContent = content, excludeFromCommits = false, hidden = false, cssClasses },
        commit = false,
        commitDelay = 0,
        fakeTyping = true
    ) {
        if (this.isLocked()) {
            throw new Error('Cannot add message, the model is locked.');
        }

        // fake reponse time
        if (fakeTyping) {
            this.lock();
            await resolveAfter(100); // simulate reaction time
            const aiMessage = resolveAfter(400, content); // simulate typing
            super.addMessage(this.#aiUser, aiMessage, type, { fullContent, excludeFromCommits, hidden, cssClasses });
            await aiMessage;
            if (commit) {
                return this.commit(commitDelay);
            }
            else {
                this.unlock();
                return aiMessage;
            }
        }
        else {
            super.addMessage(this.#aiUser, content, type, { fullContent, excludeFromCommits, hidden, cssClasses });
            if (commit) {
                return this.commit(commitDelay);
            }
            else {
                return content;
            }
        }
    }

    getCurrentUser() {
        return this.#currentUser;
    }

    // synonym
    get currentUser() {
        return this.#currentUser;
    }

    getAiUser() {
        return this.#aiUser;
    }

    // synonym
    get aiUser() {
        return this.#aiUser;
    }

    async commit(delay = 0) {
        this.lock();
        await resolveAfter(delay);
        const aiMessage = new Promise((resolve, reject) => {
            Promise.all([
                resolveAfter(800), // is typing a little

                new Promise((locRes, locRej) => {
                    const messages = this.getMessages()
                        .filter(message => !message.excludeFromCommits && !message.expired)
                        .map(message => {
                            return {
                                role: this.#currentUser.id === message.user.id ? role.USER : role.ASSISTANT,
                                message: message.fullContent
                            };
                        });

                    const ajaxCallbackPromise = this.#ajaxCallback({
                        mode: ajaxMode.MESSAGE_ADDED,
                        messages: messages
                    });

                    ajaxCallbackPromise.then(({ response }) => {
                        locRes(response);
                    }).catch(({ responseJSON }) => {
                        debug.error(responseJSON);
                        locRej(MSG_ERROR);
                    });

                    this.triggerEvent(events.COMMIT, messages, ajaxCallbackPromise);
                })
            ])
            .then(values => resolve(values[1]))
            .catch(errMsg => reject(errMsg))
            .finally(() => this.unlock());
        });
        this.#loadingMessage = super.addMessage(this.#aiUser, aiMessage, messageTypes.MARKDOWN);
        return aiMessage;
    }

    onMessageLoadComplete() {
        this.#loadingMessage = null;
        super.onMessageLoadComplete(...arguments);
    }

    onMessageLoadError() {
        this.#loadingMessage = null;
        super.onMessageLoadError(...arguments);
    }

    restoreHistory(history) {
        const { commit = false } = history;
        super.restoreHistory(history);
        if (commit) {
            this.commit();
        }
    }

    getHistory() {
        const history = super.getHistory();
        history.loadingMessage = this.#loadingMessage;
        return history;
    }
}

AIChat.events = Object.freeze(events);

export { AIChat, events };