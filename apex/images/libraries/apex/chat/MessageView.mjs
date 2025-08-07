/* global marked, Prism */

/**
 * @file
 *
 * View for the messages.
 */

import { EventDispatcher } from './EventDispatcher.mjs';
import { Message } from './Message.mjs';
import { messageTypes } from './Message.mjs';
import { getUniqueId } from './util.mjs';

const events = {
    QUICK_ACTION_TRIGGER: 'quickactiontrigger',
    CODE_BLOCK_QUICK_ACTION_TRIGGER: 'codeblockquickactiontrigger',
    AFTER_LOAD_RENDER: 'afterloadrender', // applies only to promises
    AFTER_QUICK_ACTIONS_RENDER: 'afterquickactionsrender'
};

const { lang, util } = apex;

const
    MSG_PROCESSING = lang.getMessage('APEX.PROCESSING'),
    MSG_USER_AVATAR = lang.getMessage('APEX.AI.USER_AVATAR'),
    MSG_ERROR = lang.getMessage('APEX.ERROR');

const loaderMarkup = `
    <div class="u-vh">${util.escapeHTML(MSG_PROCESSING)}</div>
    <span class="a-ChatLoader"></span>`;

const
    CLS_ROW = 'a-ChatItem-row',
    CLS_BUBBLE = 'a-ChatItem-bubble',
    CLS_BUBBLE_PROCESSING = 'a-ChatItem-bubble--processing',
    CLS_TEXT = 'a-ChatItem-message',
    CLS_QUICK_ACTIONS = 'a-ChatItem-messageActions',
    CLS_QUICK_ACTION_BTN = 'a-ChatItem-messageButton',
    CLS_ERROR = 'a-ChatItem-row--error',
    CLS_ICON = 'a-ChatItem-icon',
    CLS_IMAGE = 'a-ChatItem-image',
    CLS_CODE_BLOCK_CONTAINER = 'a-ChatItem-pre',
    CLS_EXPIRED = 'a-ChatItem-row--expired';

const markedRenderer = (() => {
    const renderer = new marked.Renderer();

    renderer.html = function({text, block}){
        if (block) {
            // role none needed for a11y
            return `<p role="none">${util.escapeHTML(text)}</p>\n`;
        }
        else {
            return `<span>${util.escapeHTML(text)}</span>`;
        }
    };

    renderer.paragraph = function({tokens}){
        // note that the contents of text are already properly escaped
        // role none needed for a11y
        return `<p role="none">${this.parser.parseInline(tokens)}</p>\n`;
    };

    return renderer;
})();

const markedInst = new marked.Marked({
    gfm: true,
    breaks: true,
    tables: true,
    mangle: false,
    xhtml: false,
    headerIds: false,
    renderer: markedRenderer
});

const md2html = (message, codeBlockQuickActions = []) => {
    // render logic for code blocks borrowed from markedjs, adapted for our needs
    markedRenderer.code = function({text, lang, escaped}){
        lang = (lang || '').match(/^\S*/)?.[0];

        if (!escaped) {
            text = util.escapeHTML(text);
        }

        const actionBtnsMarkup = codeBlockQuickActions.reduce((prev, curr) => {
            const { id, iconClasses, label, ariaLabel } = curr;
            return `${prev}
                <button class="a-ChatItem-button" data-code-block-action-id="${util.escapeHTMLAttr(id)}" type="button"${ariaLabel ? ` aria-label="${util.escapeHTMLAttr(ariaLabel)}"` : ''}>
                    ${iconClasses ? `<span class="a-ChatItem-buttonIcon a-Icon ${util.escapeHTMLAttr(iconClasses)}" aria-hidden="true"></span>` : ''}
                    ${label ? `<span class="a-ChatItem-buttonLabel">${util.escapeHTML(label)}</span>` : ''}
                </button>`;
        }, '');

        const escLang = util.escapeHTMLAttr(lang || '');
        let langElDomId;
        let headerMarkup = '';

        if (lang || actionBtnsMarkup) {
            langElDomId = getUniqueId();
            headerMarkup = `
                <div class="a-ChatItem-preHeader">
                    <span class="a-ChatItem-preLang" id="${langElDomId}">${escLang}</span>
                    <div class="a-ChatItem-preActions">${actionBtnsMarkup}</div>
                </div>`;
        }

        return `
            <div class="${CLS_CODE_BLOCK_CONTAINER}" role="group"${headerMarkup ? ` aria-labelledby="${langElDomId}` : ''}">
                ${headerMarkup}
                <pre><code${lang ? ` class="language-${escLang}" data-lang="${escLang}"` : ''}>${text}</code></pre>
            </div>`;
    };

    markedInst.setOptions({ renderer: markedRenderer });

    return markedInst.parse(message);
};

class MessageView extends EventDispatcher {

    #model;
    #markup;
    #el;
    #quickActionsContainerEl;
    #quickActions = new Map();
    #modelCssClasses = [];
    #highlightCodeFn;

    // Native events - handlers
    #quickActionHandler = (e) => {
        const obj = this.#quickActions.get(e.currentTarget);
        this.triggerEvent(events.QUICK_ACTION_TRIGGER, obj);
    };

    // handles only the code block quick action clicks
    #onElementClick = e => {
        const { target } = e;
        const buttonEl = target.closest('.a-ChatItem-button');
        const actionId = buttonEl?.dataset.codeBlockActionId;
        if (actionId) {
            const codeBlockEl = buttonEl.closest(`.${CLS_CODE_BLOCK_CONTAINER}`).querySelector('pre');
            const actionObj = this.#model.codeBlockQuickActions.find(a => a.id === actionId);
            if (actionObj) {
                this.triggerEvent(events.CODE_BLOCK_QUICK_ACTION_TRIGGER, actionObj, buttonEl, codeBlockEl);
            }
        }
    };

    constructor(model, options = {}) {
        super();
        this.#model = model;
        this.#highlightCodeFn = options.highlightCodeFn;
        this.#markup = this.#buildMarkup(model);
        this.#el = this.#render(model);
        if (model.isLoading()) {
            model.one(Message.events.LOAD_COMPLETE, this.#loadCompleteHandler, { scope: this });
            model.one(Message.events.LOAD_ERROR, this.#loadErrorHandler, { scope: this });
        }
        else {
            this.#performSyntaxHighlighting();
        }
        model.on(Message.events.CONTENT_CHANGE, this.#contentChangeHandler, { scope: this });
        model.on(Message.events.QUICK_ACTIONS_CHANGE, this.#onModelQuickActionsChange, { scope: this });
        model.on(Message.events.CODE_BLOCK_QUICK_ACTIONS_CHANGE, this.#onModelCodeBlockQuickActionsChange, { scope: this });
        model.on(Message.events.CSS_CLASSES_CHANGE, this.#onModelCssClassesChange, { scope: this });
        model.on(Message.events.EXPIRE, this.#onModelExpire, { scope: this });

        this.#el.addEventListener('click', this.#onElementClick);

        this.#setModelCssClasses(model.cssClasses);
        this.#setQuickActions(model.quickActions);
    }

    get markup() {
        return this.#markup;
    }

    get el() {
        return this.#el;
    }

    get model() {
        return this.#model;
    }

    destroy() {
        const model = this.#model;
        model.offAllScoped(this);
        if (this.#quickActions.size) {
            this.#quickActions.forEach((value, key) => {
                key.removeEventListener('click', this.#quickActionHandler);
            });
        }
        this.#el.removeEventListener('click', this.#onElementClick);
    }

    #setQuickActions(arr) {
        this.#clearQuickActions();

        if (!arr.length) {
            return;
        }

        const container = document.createElement('div');
        container.classList.add(CLS_QUICK_ACTIONS);
        this.#quickActionsContainerEl = container;
        arr.forEach(obj => {
            const btn = document.createElement('button');
            const label = document.createTextNode(obj.label || '');
            btn.append(label);
            btn.type = 'button';
            btn.classList.add(CLS_QUICK_ACTION_BTN);
            this.#quickActions.set(btn, obj);
            btn.addEventListener('click', this.#quickActionHandler);
            container.appendChild(btn);
        });
        this.#el.querySelector(`.${CLS_BUBBLE}`).appendChild(container);
        this.triggerEvent(events.AFTER_QUICK_ACTIONS_RENDER);
    }

    #clearQuickActions() {
        if (this.#quickActions.size) {
            this.#quickActions.forEach((value, key) => {
                key.removeEventListener('click', this.#quickActionHandler);
            });
            this.#quickActions.clear();

            this.#quickActionsContainerEl.remove();
            this.#quickActionsContainerEl = null;
        }
    }

    #loadCompleteHandler() {
        const { content, quickActions, cssClasses } = this.#model;
        this.#model.off(Message.events.LOAD_ERROR, this.#loadErrorHandler, this);
        this.#updateContent(content);
        if (quickActions.length) {
            this.#setQuickActions(quickActions);
        }
        if (cssClasses.length) {
            this.#setModelCssClasses(cssClasses);
        }
    }

    #loadErrorHandler(e, err) {
        this.#model.off(Message.events.LOAD_COMPLETE, this.#loadCompleteHandler, this);
        this.#updateContent(MSG_ERROR);
        this.#el.classList.add(CLS_ERROR);
        throw err;
    }

    #contentChangeHandler(e, content) {
        this.#updateContent(content);
    }

    #onModelQuickActionsChange(e, quickActions) {
        this.#setQuickActions(quickActions);
    }

    #onModelCodeBlockQuickActionsChange() {
        this.#updateContent(this.#model.content);
    }

    #onModelCssClassesChange(e, cssClasses) {
        this.#setModelCssClasses(cssClasses);
    }

    #onModelExpire(e, bool) {
        this.#el.classList[bool ? 'add' : 'remove'](CLS_EXPIRED);
    }

    #setModelCssClasses(cssClasses = []) {
        this.#clearModelCssClasses();
        this.#modelCssClasses = cssClasses.map(cls => util.escapeHTMLAttr(cls));
        this.#el.classList.add(...this.#modelCssClasses);
    }

    #clearModelCssClasses() {
        this.#el.classList.remove(...this.#modelCssClasses);
    }

    #updateContent(content) {
        this.#el.querySelector(`.${CLS_BUBBLE}`).classList.remove(CLS_BUBBLE_PROCESSING);
        content = this.#getFormattedContent(content);
        const contentNode = this.#el.querySelector(`.${CLS_TEXT}`);
        contentNode.replaceChildren(document.createRange().createContextualFragment(content));
        this.#performSyntaxHighlighting();
        this.triggerEvent(events.AFTER_LOAD_RENDER, content);
    }

    #render() {
        const el = document.createRange().createContextualFragment(this.#markup).firstElementChild;
        return el;
    }

    #performSyntaxHighlighting() {
        this.el.querySelectorAll('code[class*=language]').forEach(el => {
            const hFn = this.#highlightCodeFn;
            if (typeof hFn === 'function') {
                hFn(this, el);
            }
            else {
                Prism.highlightElement(el);
            }
        });
    }

    #buildMarkup(message) {
        const { user } = message;
        let content = '';
        if (message.isLoading()) {
            content = loaderMarkup;
        }
        else {
            content = this.#getFormattedContent(message.content);
        }

        return `
            <li class="${CLS_ROW} ${CLS_ROW}--${util.escapeHTMLAttr(user.messageStyle)}">
                <div class="a-ChatItem">
                    <div class="a-ChatItem-body">
                        <div class="a-ChatItem-visual" role="img" aria-label="${util.escapeHTMLAttr(user.name)}">
                            <div class="a-ChatItem-avatar">${this.#getAvatarMarkup(user)}</div>
                        </div>
                        <div class="${CLS_BUBBLE} ${message.isLoading() ? CLS_BUBBLE_PROCESSING : ""}">
                            <span class="u-vh">${lang.formatMessage('APEX.AI.NAME_COMMA_MESSAGE', user.name, ' ')}</span>
                            <div class="${CLS_TEXT} is-markdownified">${content}</div>
                        </div>
                    </div>
                </div>
            </li>`;
    }

    #getAvatarMarkup(user) {
        const { avatarInitials, avatarImageUrl, avatarIconClasses } = user;
        if (avatarImageUrl) {
            return `<img class="${CLS_IMAGE}" src="${util.escapeHTMLAttr(avatarImageUrl)}" alt="${util.escapeHTMLAttr(MSG_USER_AVATAR)}">`;
        }
        else if (avatarIconClasses) {
            return `<span class="${CLS_ICON} ${util.escapeHTMLAttr(avatarIconClasses)}"></span>`;
        }
        return util.escapeHTML(avatarInitials);
    }

    #getFormattedContent(content = '') {
        const { type, codeBlockQuickActions } = this.#model;

        if (type === messageTypes.MARKDOWN) {
            content = md2html(content, codeBlockQuickActions);
        }
        else if (type === messageTypes.HTML) {
            // do nothing
        }
        else {
            content = util.escapeHTML(content);
            content = content.replace(/\n/g, '<br>');
        }

        return content;
    }
}

MessageView.events = Object.freeze(events);

export { MessageView, events };