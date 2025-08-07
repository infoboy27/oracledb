/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 *
 * Base model.
 */

import { EventDispatcher } from './EventDispatcher.mjs';
import { Message } from './Message.mjs';
import { User } from './User.mjs';
import { messageTypes } from './Message.mjs';

// events
const events = {
    MESSAGE_ADDED: 'messageadded',
    CLEAR: 'clear',
    CHAT_LOCK: 'chatlocked',
    CHAT_UNLOCK: 'chatunlocked',
    MESSAGE_LOAD_COMPLETE: 'messageloadcomplete',
    MESSAGE_LOAD_ERROR: 'messageloaderror',
    HISTORY_RESTORED: 'historyrestored',
    COMMIT: 'commit'
    // currently unused
    // MESSAGE_CONTENT_CHANGE: 'messagecontentchange'
};

class Chat extends EventDispatcher {

    #userMap = new Map();
    #messages = [];
    // used for generating ids
    #userCounter = 1;
    #locked;
    #processMessageFn;

    constructor({ users = [], processMessage } = {}) {
        super();
        this.#processMessageFn = processMessage;
        users.forEach(user => {
            // eslint-disable-next-line no-plusplus
            let id = user.id ?? (`u${this.#userCounter++}`);
            if (this.#userMap.has(id)) {
                throw new Error(`User ${id} already exists`);
            }
            else {
                this.#userMap.set(id, user instanceof User ? user : new User({
                    id,
                    name: user.name || ''
                }));
            }
        });
    }

    restoreHistory(history) {
        const { messages: historyMessages = [] } = history;
        const messages = historyMessages.map((entry) => {
            const {
                userId,
                content,
                fullContent = content,
                type = messageTypes.TEXT,
                promise,
                excludeFromCommits,
                hidden,
                quickActions,
                codeBlockQuickActions
            } = entry;
            const user = this.getUser(userId);

            if (!user) {
                throw new Error('Invalid user ID in history.');
            }

            return new Message({
                user,
                content,
                fullContent,
                type,
                promise,
                excludeFromCommits,
                hidden,
                quickActions,
                codeBlockQuickActions
            });
        });

        messages.forEach(({ content }, index) => {
            if (!content) {
                throw new Error(`History's message at index ${index} is missing content.`);
            }
        });

        this.#messages = messages;
        return messages;
    }

    addMessage(user, content, type, { fullContent, excludeFromCommits = false, hidden = false, cssClasses } = {}) {
        let promise;
        if (typeof content === 'object' && 'then' in content) {
            promise = content;
            content = undefined;
        }
        const msg = new Message({
            user,
            promise,
            content,
            fullContent,
            type,
            excludeFromCommits,
            hidden,
            cssClasses,
            processMessageFn: this.#processMessageFn
        });
        this.#messages.push(msg);
        if (promise) {
            msg.one(Message.events.LOAD_COMPLETE, this.onMessageLoadComplete, { scope: this });
            msg.one(Message.events.LOAD_ERROR, this.onMessageLoadError, { scope: this });
        }
        this.triggerEvent(events.MESSAGE_ADDED, msg);

        return msg;
    }

    getHistory() {
        return {
            messages: [...this.getMessages()] // so we don't modify the original array
        };
    }

    getMessages() {
        return this.#messages;
    }

    getUser(userId) {
        return this.#userMap.get(userId);
    }

    lock() {
        if (!this.#locked) {
            this.#locked = true;
            this.triggerEvent(events.CHAT_LOCK);
        }
    }

    unlock() {
        if (this.#locked) {
            this.#locked = false;
            this.triggerEvent(events.CHAT_UNLOCK);
        }
    }

    isLocked() {
        return this.#locked;
    }

    destroy(clearOwnListeners = true) {
        this.#messages.forEach(msg => msg.offAllScoped(this));
        if (clearOwnListeners) {
            this.off();
        }
    }

    onMessageLoadComplete(e, content) {
        const msg = e.target;
        msg.off(Message.events.LOAD_ERROR, this.onMessageLoadError, this);
        this.triggerEvent(events.MESSAGE_LOAD_COMPLETE, msg, content);
    }

    onMessageLoadError(e, err) {
        const msg = e.target;
        msg.off(Message.events.LOAD_COMPLETE, this.onMessageLoadComplete, this);
        this.triggerEvent(events.MESSAGE_LOAD_ERROR, msg, err);
    }

    clear() {
        this.#messages.forEach(msg => msg.offAllScoped(this));
        this.#messages = [];
        this.triggerEvent(events.CLEAR);
        this.unlock();
    }

    expire() {
        this.#messages.forEach(msg => msg.expired = true);
    }
}

Chat.events = Object.freeze(events);

export { Chat, events };