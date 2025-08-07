/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 *
 * The model for the messages.
 */

import { EventDispatcher } from './EventDispatcher.mjs';

const messageTypes = {
    TEXT: 'text',
    MARKDOWN: 'markdown',
    HTML: 'html'
};

const events = {
    LOAD_COMPLETE: 'loadcomplete',
    LOAD_ERROR: 'loaderror',
    CONTENT_CHANGE: 'contentchange',
    QUICK_ACTIONS_CHANGE: 'quickactionschange',
    CODE_BLOCK_QUICK_ACTIONS_CHANGE: 'codeblockquickactionchange',
    CSS_CLASSES_CHANGE: 'cssclasseschange',
    EXPIRE: 'expire'
};

const loadStatuses = {
    LOADING: 'loading',
    LOAD_COMPLETE: 'loadcomplete',
    LOAD_ERROR: 'loaderror'
};
class Message extends EventDispatcher {

    #timestamp;
    #user;
    #content;
    #fullContent;
    #promise;
    #type;
    #excludeFromCommits = false;
    #hidden = false; // When hidden, it won't be rendered in the view
    #quickActions = [];
    #codeBlockQuickActions = [];
    #codeBlockQuickActionId = 0;
    #loadStatus;
    #processMessageFn;
    #cssClasses = []; // Classes added to (every) view which uses this model
    #expired = false;

    constructor({
        user,
        content,
        fullContent,
        promise,
        type,
        excludeFromCommits = false,
        hidden = false,
        quickActions,
        codeBlockQuickActions,
        processMessageFn,
        cssClasses
    }) {
        super();
        this.#timestamp = Date.now();
        this.#user = user;
        this.#content = content;
        this.#type = this.#sanitizeType(type);
        this.#fullContent = fullContent || content;
        this.#excludeFromCommits = excludeFromCommits;
        this.#hidden = hidden;
        this.#processMessageFn = processMessageFn;
        this.#quickActions = this.#sanitizeQuickActions(quickActions);
        this.#codeBlockQuickActions = this.#sanitizeCodeBlockQuickActions(codeBlockQuickActions);
        this.#cssClasses = this.#sanitizeCssClasses(cssClasses);

        if (promise) {
            this.#promise = promise;
            this.#loadStatus = loadStatuses.LOADING;
            promise.then(value => {
                this.#loadStatus = loadStatuses.LOAD_COMPLETE;
                this.#content = value;
                this.#fullContent = value;
                this.#processMessage();
                this.triggerEvent(events.LOAD_COMPLETE, value);
            }).catch(err => {
                this.#loadStatus = loadStatuses.LOAD_ERROR;
                this.triggerEvent(events.LOAD_ERROR, err);
            });
        }
        else {
            this.#processMessage();
        }
    }

    get user() {
        return this.#user;
    }

    get content() {
        return this.#content;
    }

    set content(value) {
        const oldValue = this.#content;
        this.#content = value;
        this.triggerEvent(events.CONTENT_CHANGE, value, oldValue);
    }

    get fullContent() {
        return this.#fullContent;
    }

    get type() {
        return this.#type;
    }

    get promise() {
        return this.#promise;
    }

    get excludeFromCommits() {
        return this.#excludeFromCommits;
    }

    get hidden() {
        return this.#hidden;
    }

    get timestamp() {
        return this.#timestamp;
    }

    set quickActions(quickActions) {
        if (this.#expired) {
            return;
        }
        this.#quickActions = this.#sanitizeQuickActions(quickActions);
        this.triggerEvent(events.QUICK_ACTIONS_CHANGE, this.#quickActions);
    }

    get quickActions() {
        return this.#quickActions;
    }

    set codeBlockQuickActions(quickActions) {
        // for now, we will leave the modifications possible even if expired
        this.#codeBlockQuickActions = this.#sanitizeCodeBlockQuickActions(quickActions);
        this.triggerEvent(events.CODE_BLOCK_QUICK_ACTIONS_CHANGE, this.#codeBlockQuickActions);
    }

    get codeBlockQuickActions() {
        return this.#codeBlockQuickActions;
    }

    set cssClasses(cls) {
        this.#cssClasses = this.#sanitizeCssClasses(cls);
        this.triggerEvent(events.CSS_CLASSES_CHANGE, this.#cssClasses);
    }

    get cssClasses() {
        return this.#cssClasses;
    }

    set expired(bool) {
        if (this.#quickActions?.length) {
            this.quickActions = [];
        }
        this.#expired = !!bool;
        this.triggerEvent(events.EXPIRE, bool);
    }

    get expired() {
        return this.#expired;
    }

    isLoading() {
        return this.#loadStatus === loadStatuses.LOADING;
    }

    isLoaded() {
        if (this.#promise) {
            return this.#loadStatus === loadStatuses.LOAD_COMPLETE;
        }
        return true;
    }

    isErrored() {
        return this.#loadStatus === loadStatuses.LOAD_ERROR;
    }

    #sanitizeQuickActions(quickActions) {
        let arr = [];
        if (Array.isArray(quickActions)) {
            arr = quickActions.filter(qa => qa.label);
        }
        return arr;
    }

    #sanitizeCodeBlockQuickActions(quickActions) {
        let arr = [];
        if (Array.isArray(quickActions)) {
            arr = quickActions.filter(qa => qa.label || qa.iconClasses);
            arr.forEach(qa => {
                // eslint-disable-next-line
                qa.id = `${this.#codeBlockQuickActionId++}`;
            });
        }
        return arr;
    }

    #sanitizeType(type) {
        if (Object.values(messageTypes).includes(type)) {
            return type;
        }
        throw new Error(`Invalid message type (${type}).`);
    }

    #sanitizeCssClasses(cls) {
        if (cls) {
            if (typeof cls === 'string') {
                return cls.split(' ');
            }
            else if (Array.isArray(cls)) {
                return cls;
            }
        }
        return [];
    }

    #processMessage() {
        const fn = this.#processMessageFn;
        if (typeof fn === 'function') {
            // quick actions expected format: [{label, action}, {label, action}]
            const {
                message,
                quickActions,
                codeBlockQuickActions,
                cssClasses
            } = fn(this) || {};

            if (message) {
                const contentType = typeof message;
                if (contentType === 'string') {
                    this.#content = message;
                }
                else if (contentType === 'object') {
                    const { type = messageTypes.TEXT, content } = message;
                    this.#type = this.#sanitizeType(type);
                    this.#content = content;
                }
            }
            if (Array.isArray(quickActions) && quickActions.length) {
                this.#quickActions = this.#sanitizeQuickActions(quickActions);
            }
            if (Array.isArray(codeBlockQuickActions) && codeBlockQuickActions.length) {
                this.#codeBlockQuickActions = this.#sanitizeCodeBlockQuickActions(codeBlockQuickActions);
            }
            if (cssClasses) {
                this.#cssClasses = this.#sanitizeCssClasses(cssClasses);
            }
        }
    }
}

Message.events = Object.freeze(events);

export { Message, events, messageTypes };