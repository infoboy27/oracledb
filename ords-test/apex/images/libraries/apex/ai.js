(() => {
  // images/libraries/apex/chat/EventDispatcher.mjs
  var EventDispatcher = class {
    // to keep track of the order when no priority (i.e. 0) is set
    #eventId = 0;
    #listeners = {};
    on(eventName, callback, { priority = 0, once = false, scope } = {}) {
      const [name, ...namespaces] = eventName.split(".");
      if (!name) {
        return;
      }
      if (namespaces.length) {
        namespaces.forEach((ns) => this.#maybeRegister(`${name}.${ns}`, callback, priority, scope, once));
      } else {
        this.#maybeRegister(name, callback, priority, scope, once);
      }
    }
    one(eventName, callback, { priority = 0, scope } = {}) {
      this.on(eventName, callback, { priority, scope, once: true });
    }
    off(eventName, callback, scope) {
      let handlers;
      let scopeWasPassed = arguments.length > 2;
      if (!arguments.length) {
        this.#listeners = {};
        return;
      }
      if (eventName == null && callback == null && scope) {
        const allEventNames = Object.keys(this.#listeners);
        allEventNames.forEach((name2) => {
          let handlers2 = this.#listeners[name2];
          handlers2 = handlers2.filter((handler) => handler.scope !== scope);
          if (handlers2.length) {
            this.#listeners[name2] = handlers2;
          } else {
            delete this.#listeners[name2];
          }
        });
        return;
      }
      const [name, ...namespaces] = eventName.split(".");
      if (!name && !namespaces.length) {
        return;
      }
      handlers = Object.entries(this.#listeners).filter(([key]) => {
        const [currKeyName, currKeyNs] = key.split(".");
        if (name) {
          if (name !== currKeyName) {
            return false;
          }
        }
        if (namespaces.length) {
          return namespaces.includes(currKeyNs);
        } else {
          return true;
        }
      }).map(([key, value]) => {
        return {
          [key]: value
        };
      });
      if (!handlers.length) {
        return;
      }
      handlers.forEach((item) => {
        const [name2, handlers2] = Object.entries(item)[0];
        const shouldKeepHandlers = callback ? handlers2.filter((handler) => {
          const diffCallback = handler.callback !== callback;
          if (scopeWasPassed && !diffCallback) {
            return handler.scope !== scope;
          }
          return diffCallback;
        }) : [];
        if (shouldKeepHandlers.length) {
          this.#listeners[name2] = shouldKeepHandlers;
        } else {
          delete this.#listeners[name2];
        }
      });
    }
    offAllScoped(scope) {
      this.off(null, null, scope);
    }
    triggerEvent(eventName, ...args) {
      const [name, ...namespace] = eventName.split(".");
      const toRemove = [];
      if (!name) {
        return;
      }
      Object.entries(this.#listeners).filter(([key]) => {
        const parts = key.split(".");
        if (parts[0] === name) {
          if (namespace?.length) {
            return parts.some((item) => namespace.includes(item));
          }
          return true;
        }
        return false;
      }).forEach(([e, handlers]) => {
        handlers.forEach((handler) => {
          const { callback, scope, priority, once } = handler;
          if (once) {
            toRemove.push({
              name: e,
              fn: callback
            });
          }
          callback.call(scope || this, {
            type: name,
            namespace: namespace || void 0,
            currentTarget: this,
            target: this,
            registered: e,
            priority,
            callback
          }, ...args);
        });
      });
      if (toRemove.length) {
        toRemove.forEach((r) => {
          this.off(r.name, r.fn);
        });
      }
    }
    relayEvents(origin, eventNames = [], prefix = "") {
      let added = [];
      eventNames.forEach((eventName) => {
        const fn = (e, ...rest) => {
          this.triggerEvent(`${prefix}${eventName}`, ...rest);
        };
        origin.on(eventName, fn);
        added.push({ origin, eventName, fn });
      });
      return () => {
        added.forEach(({ origin: origin2, eventName, fn }) => {
          origin2.off(eventName, fn);
        });
        added = [];
      };
    }
    #maybeRegister(name, callback, priority, scope, once) {
      this.#listeners[name] ??= [];
      const handlers = this.#listeners[name];
      const callbacks = handlers.filter((handler) => {
        return handler.callback === callback;
      });
      const callbackPresent = callbacks.some((handler) => {
        return handler.scope === scope;
      });
      if (!callbackPresent) {
        this.#eventId += 1;
        handlers.push({ callback, priority, scope, once, id: this.#eventId });
        handlers.sort((a, b) => {
          if (a.priority !== 0 || b.priority !== 0) {
            return b.priority - a.priority;
          } else {
            return a.id - b.id;
          }
        });
      }
    }
  };

  // images/libraries/apex/chat/Message.mjs
  var messageTypes = {
    TEXT: "text",
    MARKDOWN: "markdown",
    HTML: "html"
  };
  var events = {
    LOAD_COMPLETE: "loadcomplete",
    LOAD_ERROR: "loaderror",
    CONTENT_CHANGE: "contentchange",
    QUICK_ACTIONS_CHANGE: "quickactionschange",
    CODE_BLOCK_QUICK_ACTIONS_CHANGE: "codeblockquickactionchange",
    CSS_CLASSES_CHANGE: "cssclasseschange",
    EXPIRE: "expire"
  };
  var loadStatuses = {
    LOADING: "loading",
    LOAD_COMPLETE: "loadcomplete",
    LOAD_ERROR: "loaderror"
  };
  var Message = class extends EventDispatcher {
    #timestamp;
    #user;
    #content;
    #fullContent;
    #promise;
    #type;
    #excludeFromCommits = false;
    #hidden = false;
    // When hidden, it won't be rendered in the view
    #quickActions = [];
    #codeBlockQuickActions = [];
    #codeBlockQuickActionId = 0;
    #loadStatus;
    #processMessageFn;
    #cssClasses = [];
    // Classes added to (every) view which uses this model
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
        promise.then((value) => {
          this.#loadStatus = loadStatuses.LOAD_COMPLETE;
          this.#content = value;
          this.#fullContent = value;
          this.#processMessage();
          this.triggerEvent(events.LOAD_COMPLETE, value);
        }).catch((err) => {
          this.#loadStatus = loadStatuses.LOAD_ERROR;
          this.triggerEvent(events.LOAD_ERROR, err);
        });
      } else {
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
        arr = quickActions.filter((qa) => qa.label);
      }
      return arr;
    }
    #sanitizeCodeBlockQuickActions(quickActions) {
      let arr = [];
      if (Array.isArray(quickActions)) {
        arr = quickActions.filter((qa) => qa.label || qa.iconClasses);
        arr.forEach((qa) => {
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
        if (typeof cls === "string") {
          return cls.split(" ");
        } else if (Array.isArray(cls)) {
          return cls;
        }
      }
      return [];
    }
    #processMessage() {
      const fn = this.#processMessageFn;
      if (typeof fn === "function") {
        const {
          message: message2,
          quickActions,
          codeBlockQuickActions,
          cssClasses
        } = fn(this) || {};
        if (message2) {
          const contentType = typeof message2;
          if (contentType === "string") {
            this.#content = message2;
          } else if (contentType === "object") {
            const { type = messageTypes.TEXT, content } = message2;
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
  };
  Message.events = Object.freeze(events);

  // images/libraries/apex/chat/User.mjs
  var User = class {
    #id;
    #name;
    #avatarInitials;
    #messageStyle;
    #avatarImageUrl;
    #avatarIconClasses;
    constructor({
      id: id2,
      name,
      messageStyle = "outbound",
      avatar
    }) {
      this.#id = id2;
      this.#name = name;
      this.#messageStyle = messageStyle;
      this.#avatarImageUrl = avatar?.imageUrl;
      this.#avatarIconClasses = avatar?.iconClasses;
      this.#avatarInitials = avatar?.initials || "";
    }
    get messageStyle() {
      return this.#messageStyle;
    }
    get avatarInitials() {
      return this.#avatarInitials;
    }
    get name() {
      return this.#name;
    }
    get avatarImageUrl() {
      return this.#avatarImageUrl;
    }
    get avatarIconClasses() {
      return this.#avatarIconClasses;
    }
    get id() {
      return this.#id;
    }
  };

  // images/libraries/apex/chat/Chat.mjs
  var events2 = {
    MESSAGE_ADDED: "messageadded",
    CLEAR: "clear",
    CHAT_LOCK: "chatlocked",
    CHAT_UNLOCK: "chatunlocked",
    MESSAGE_LOAD_COMPLETE: "messageloadcomplete",
    MESSAGE_LOAD_ERROR: "messageloaderror",
    HISTORY_RESTORED: "historyrestored",
    COMMIT: "commit"
    // currently unused
    // MESSAGE_CONTENT_CHANGE: 'messagecontentchange'
  };
  var Chat = class extends EventDispatcher {
    #userMap = /* @__PURE__ */ new Map();
    #messages = [];
    // used for generating ids
    #userCounter = 1;
    #locked;
    #processMessageFn;
    constructor({ users = [], processMessage } = {}) {
      super();
      this.#processMessageFn = processMessage;
      users.forEach((user) => {
        let id2 = user.id ?? `u${this.#userCounter++}`;
        if (this.#userMap.has(id2)) {
          throw new Error(`User ${id2} already exists`);
        } else {
          this.#userMap.set(id2, user instanceof User ? user : new User({
            id: id2,
            name: user.name || ""
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
          throw new Error("Invalid user ID in history.");
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
      if (typeof content === "object" && "then" in content) {
        promise = content;
        content = void 0;
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
      this.triggerEvent(events2.MESSAGE_ADDED, msg);
      return msg;
    }
    getHistory() {
      return {
        messages: [...this.getMessages()]
        // so we don't modify the original array
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
        this.triggerEvent(events2.CHAT_LOCK);
      }
    }
    unlock() {
      if (this.#locked) {
        this.#locked = false;
        this.triggerEvent(events2.CHAT_UNLOCK);
      }
    }
    isLocked() {
      return this.#locked;
    }
    destroy(clearOwnListeners = true) {
      this.#messages.forEach((msg) => msg.offAllScoped(this));
      if (clearOwnListeners) {
        this.off();
      }
    }
    onMessageLoadComplete(e, content) {
      const msg = e.target;
      msg.off(Message.events.LOAD_ERROR, this.onMessageLoadError, this);
      this.triggerEvent(events2.MESSAGE_LOAD_COMPLETE, msg, content);
    }
    onMessageLoadError(e, err) {
      const msg = e.target;
      msg.off(Message.events.LOAD_COMPLETE, this.onMessageLoadComplete, this);
      this.triggerEvent(events2.MESSAGE_LOAD_ERROR, msg, err);
    }
    clear() {
      this.#messages.forEach((msg) => msg.offAllScoped(this));
      this.#messages = [];
      this.triggerEvent(events2.CLEAR);
      this.unlock();
    }
    expire() {
      this.#messages.forEach((msg) => msg.expired = true);
    }
  };
  Chat.events = Object.freeze(events2);

  // images/libraries/apex/chat/util.mjs
  var { util, message } = apex;
  function asyncConfirm(msg, options) {
    return new Promise((resolve) => {
      message.confirm(msg, (okPressed) => {
        resolve(okPressed);
      }, options);
    });
  }
  function getUniqueId() {
    return util.getTopApex().jQuery({}).uniqueId()[0].id;
  }
  function resolveAfter(delay = 0, resolutionValue) {
    return new Promise((resolve) => setTimeout(() => {
      resolve(resolutionValue);
    }, delay));
  }
  function selectElementTextContent(elem) {
    const selection = window.getSelection();
    const range = document.createRange();
    range.selectNodeContents(elem);
    selection.removeAllRanges();
    selection.addRange(range);
  }
  var DelaySpinner = class _DelaySpinner {
    static uniqueId = 0;
    #scopeName;
    #spinner$;
    #wasStarted;
    constructor() {
      _DelaySpinner.uniqueId += 1;
      this.#scopeName = "aiSpinner" + _DelaySpinner.uniqueId;
      util.delayLinger.start(this.#scopeName, () => {
        this.#wasStarted = true;
        this.#spinner$ = apex.util.showSpinner();
      });
    }
    finish() {
      return new Promise((resolve) => {
        if (this.#wasStarted) {
          util.delayLinger.finish(this.#scopeName, () => {
            this.#spinner$.remove();
            resolve();
          });
        } else {
          util.delayLinger.finish(this.#scopeName);
          resolve();
        }
      });
    }
  };

  // images/libraries/apex/chat/AIChat.mjs
  var { debug, lang } = apex;
  var MSG_ERROR = lang.getMessage("APEX.ERROR");
  var role = {
    USER: "user",
    ASSISTANT: "assistant"
  };
  var ajaxMode = {
    MESSAGE_ADDED: "new_message",
    GET_CONSENT_MESSAGE: "get_consent_message"
  };
  var AIChat = class extends Chat {
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
        throw new Error("currentUser must be a User instance.");
      }
      if (!(aiUser instanceof User)) {
        throw new Error("aiUser must be a User instance.");
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
        throw new Error("ajaxCallback is required.");
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
      } else if (user === this.#aiUser) {
        return this.addAiMessage(content, type, { fullContent, excludeFromCommits, hidden, cssClasses }, commit, commitDelay);
      } else {
        throw new Error("Invalid user.");
      }
    }
    async addUserMessage(content, type = messageTypes.TEXT, { fullContent, excludeFromCommits = false, hidden = false, cssClasses } = {}, commit = true, commitDelay = 200) {
      if (this.isLocked()) {
        throw new Error("Cannot add message, the model is locked.");
      }
      super.addMessage(this.#currentUser, content, type, { fullContent, excludeFromCommits, hidden, cssClasses });
      if (commit) {
        return this.commit(commitDelay);
      } else {
        return content;
      }
    }
    async addAiMessage(content, type = messageTypes.MARKDOWN, { fullContent = content, excludeFromCommits = false, hidden = false, cssClasses }, commit = false, commitDelay = 0, fakeTyping = true) {
      if (this.isLocked()) {
        throw new Error("Cannot add message, the model is locked.");
      }
      if (fakeTyping) {
        this.lock();
        await resolveAfter(100);
        const aiMessage = resolveAfter(400, content);
        super.addMessage(this.#aiUser, aiMessage, type, { fullContent, excludeFromCommits, hidden, cssClasses });
        await aiMessage;
        if (commit) {
          return this.commit(commitDelay);
        } else {
          this.unlock();
          return aiMessage;
        }
      } else {
        super.addMessage(this.#aiUser, content, type, { fullContent, excludeFromCommits, hidden, cssClasses });
        if (commit) {
          return this.commit(commitDelay);
        } else {
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
          resolveAfter(800),
          // is typing a little
          new Promise((locRes, locRej) => {
            const messages = this.getMessages().filter((message2) => !message2.excludeFromCommits && !message2.expired).map((message2) => {
              return {
                role: this.#currentUser.id === message2.user.id ? role.USER : role.ASSISTANT,
                message: message2.fullContent
              };
            });
            const ajaxCallbackPromise = this.#ajaxCallback({
              mode: ajaxMode.MESSAGE_ADDED,
              messages
            });
            ajaxCallbackPromise.then(({ response }) => {
              locRes(response);
            }).catch(({ responseJSON }) => {
              debug.error(responseJSON);
              locRej(MSG_ERROR);
            });
            this.triggerEvent(events2.COMMIT, messages, ajaxCallbackPromise);
          })
        ]).then((values) => resolve(values[1])).catch((errMsg) => reject(errMsg)).finally(() => this.unlock());
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
  };
  AIChat.events = Object.freeze(events2);

  // images/libraries/apex/chat/MessageView.mjs
  var events3 = {
    QUICK_ACTION_TRIGGER: "quickactiontrigger",
    CODE_BLOCK_QUICK_ACTION_TRIGGER: "codeblockquickactiontrigger",
    AFTER_LOAD_RENDER: "afterloadrender",
    // applies only to promises
    AFTER_QUICK_ACTIONS_RENDER: "afterquickactionsrender"
  };
  var { lang: lang2, util: util2 } = apex;
  var MSG_PROCESSING = lang2.getMessage("APEX.PROCESSING");
  var MSG_USER_AVATAR = lang2.getMessage("APEX.AI.USER_AVATAR");
  var MSG_ERROR2 = lang2.getMessage("APEX.ERROR");
  var loaderMarkup = `
    <div class="u-vh">${util2.escapeHTML(MSG_PROCESSING)}</div>
    <span class="a-ChatLoader"></span>`;
  var CLS_ROW = "a-ChatItem-row";
  var CLS_BUBBLE = "a-ChatItem-bubble";
  var CLS_BUBBLE_PROCESSING = "a-ChatItem-bubble--processing";
  var CLS_TEXT = "a-ChatItem-message";
  var CLS_QUICK_ACTIONS = "a-ChatItem-messageActions";
  var CLS_QUICK_ACTION_BTN = "a-ChatItem-messageButton";
  var CLS_ERROR = "a-ChatItem-row--error";
  var CLS_ICON = "a-ChatItem-icon";
  var CLS_IMAGE = "a-ChatItem-image";
  var CLS_CODE_BLOCK_CONTAINER = "a-ChatItem-pre";
  var CLS_EXPIRED = "a-ChatItem-row--expired";
  var markedRenderer = (() => {
    const renderer = new marked.Renderer();
    renderer.html = function({ text, block }) {
      if (block) {
        return `<p role="none">${util2.escapeHTML(text)}</p>
`;
      } else {
        return `<span>${util2.escapeHTML(text)}</span>`;
      }
    };
    renderer.paragraph = function({ tokens }) {
      return `<p role="none">${this.parser.parseInline(tokens)}</p>
`;
    };
    return renderer;
  })();
  var markedInst = new marked.Marked({
    gfm: true,
    breaks: true,
    tables: true,
    mangle: false,
    xhtml: false,
    headerIds: false,
    renderer: markedRenderer
  });
  var md2html = (message2, codeBlockQuickActions = []) => {
    markedRenderer.code = function({ text, lang: lang6, escaped }) {
      lang6 = (lang6 || "").match(/^\S*/)?.[0];
      if (!escaped) {
        text = util2.escapeHTML(text);
      }
      const actionBtnsMarkup = codeBlockQuickActions.reduce((prev, curr) => {
        const { id: id2, iconClasses, label, ariaLabel } = curr;
        return `${prev}
                <button class="a-ChatItem-button" data-code-block-action-id="${util2.escapeHTMLAttr(id2)}" type="button"${ariaLabel ? ` aria-label="${util2.escapeHTMLAttr(ariaLabel)}"` : ""}>
                    ${iconClasses ? `<span class="a-ChatItem-buttonIcon a-Icon ${util2.escapeHTMLAttr(iconClasses)}" aria-hidden="true"></span>` : ""}
                    ${label ? `<span class="a-ChatItem-buttonLabel">${util2.escapeHTML(label)}</span>` : ""}
                </button>`;
      }, "");
      const escLang = util2.escapeHTMLAttr(lang6 || "");
      let langElDomId;
      let headerMarkup = "";
      if (lang6 || actionBtnsMarkup) {
        langElDomId = getUniqueId();
        headerMarkup = `
                <div class="a-ChatItem-preHeader">
                    <span class="a-ChatItem-preLang" id="${langElDomId}">${escLang}</span>
                    <div class="a-ChatItem-preActions">${actionBtnsMarkup}</div>
                </div>`;
      }
      return `
            <div class="${CLS_CODE_BLOCK_CONTAINER}" role="group"${headerMarkup ? ` aria-labelledby="${langElDomId}` : ""}">
                ${headerMarkup}
                <pre><code${lang6 ? ` class="language-${escLang}" data-lang="${escLang}"` : ""}>${text}</code></pre>
            </div>`;
    };
    markedInst.setOptions({ renderer: markedRenderer });
    return markedInst.parse(message2);
  };
  var MessageView = class extends EventDispatcher {
    #model;
    #markup;
    #el;
    #quickActionsContainerEl;
    #quickActions = /* @__PURE__ */ new Map();
    #modelCssClasses = [];
    #highlightCodeFn;
    // Native events - handlers
    #quickActionHandler = (e) => {
      const obj = this.#quickActions.get(e.currentTarget);
      this.triggerEvent(events3.QUICK_ACTION_TRIGGER, obj);
    };
    // handles only the code block quick action clicks
    #onElementClick = (e) => {
      const { target } = e;
      const buttonEl = target.closest(".a-ChatItem-button");
      const actionId = buttonEl?.dataset.codeBlockActionId;
      if (actionId) {
        const codeBlockEl = buttonEl.closest(`.${CLS_CODE_BLOCK_CONTAINER}`).querySelector("pre");
        const actionObj = this.#model.codeBlockQuickActions.find((a) => a.id === actionId);
        if (actionObj) {
          this.triggerEvent(events3.CODE_BLOCK_QUICK_ACTION_TRIGGER, actionObj, buttonEl, codeBlockEl);
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
      } else {
        this.#performSyntaxHighlighting();
      }
      model.on(Message.events.CONTENT_CHANGE, this.#contentChangeHandler, { scope: this });
      model.on(Message.events.QUICK_ACTIONS_CHANGE, this.#onModelQuickActionsChange, { scope: this });
      model.on(Message.events.CODE_BLOCK_QUICK_ACTIONS_CHANGE, this.#onModelCodeBlockQuickActionsChange, { scope: this });
      model.on(Message.events.CSS_CLASSES_CHANGE, this.#onModelCssClassesChange, { scope: this });
      model.on(Message.events.EXPIRE, this.#onModelExpire, { scope: this });
      this.#el.addEventListener("click", this.#onElementClick);
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
          key.removeEventListener("click", this.#quickActionHandler);
        });
      }
      this.#el.removeEventListener("click", this.#onElementClick);
    }
    #setQuickActions(arr) {
      this.#clearQuickActions();
      if (!arr.length) {
        return;
      }
      const container = document.createElement("div");
      container.classList.add(CLS_QUICK_ACTIONS);
      this.#quickActionsContainerEl = container;
      arr.forEach((obj) => {
        const btn = document.createElement("button");
        const label = document.createTextNode(obj.label || "");
        btn.append(label);
        btn.type = "button";
        btn.classList.add(CLS_QUICK_ACTION_BTN);
        this.#quickActions.set(btn, obj);
        btn.addEventListener("click", this.#quickActionHandler);
        container.appendChild(btn);
      });
      this.#el.querySelector(`.${CLS_BUBBLE}`).appendChild(container);
      this.triggerEvent(events3.AFTER_QUICK_ACTIONS_RENDER);
    }
    #clearQuickActions() {
      if (this.#quickActions.size) {
        this.#quickActions.forEach((value, key) => {
          key.removeEventListener("click", this.#quickActionHandler);
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
      this.#updateContent(MSG_ERROR2);
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
      this.#el.classList[bool ? "add" : "remove"](CLS_EXPIRED);
    }
    #setModelCssClasses(cssClasses = []) {
      this.#clearModelCssClasses();
      this.#modelCssClasses = cssClasses.map((cls) => util2.escapeHTMLAttr(cls));
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
      this.triggerEvent(events3.AFTER_LOAD_RENDER, content);
    }
    #render() {
      const el = document.createRange().createContextualFragment(this.#markup).firstElementChild;
      return el;
    }
    #performSyntaxHighlighting() {
      this.el.querySelectorAll("code[class*=language]").forEach((el) => {
        const hFn = this.#highlightCodeFn;
        if (typeof hFn === "function") {
          hFn(this, el);
        } else {
          Prism.highlightElement(el);
        }
      });
    }
    #buildMarkup(message2) {
      const { user } = message2;
      let content = "";
      if (message2.isLoading()) {
        content = loaderMarkup;
      } else {
        content = this.#getFormattedContent(message2.content);
      }
      return `
            <li class="${CLS_ROW} ${CLS_ROW}--${util2.escapeHTMLAttr(user.messageStyle)}">
                <div class="a-ChatItem">
                    <div class="a-ChatItem-body">
                        <div class="a-ChatItem-visual" role="img" aria-label="${util2.escapeHTMLAttr(user.name)}">
                            <div class="a-ChatItem-avatar">${this.#getAvatarMarkup(user)}</div>
                        </div>
                        <div class="${CLS_BUBBLE} ${message2.isLoading() ? CLS_BUBBLE_PROCESSING : ""}">
                            <span class="u-vh">${lang2.formatMessage("APEX.AI.NAME_COMMA_MESSAGE", user.name, " ")}</span>
                            <div class="${CLS_TEXT} is-markdownified">${content}</div>
                        </div>
                    </div>
                </div>
            </li>`;
    }
    #getAvatarMarkup(user) {
      const { avatarInitials, avatarImageUrl, avatarIconClasses } = user;
      if (avatarImageUrl) {
        return `<img class="${CLS_IMAGE}" src="${util2.escapeHTMLAttr(avatarImageUrl)}" alt="${util2.escapeHTMLAttr(MSG_USER_AVATAR)}">`;
      } else if (avatarIconClasses) {
        return `<span class="${CLS_ICON} ${util2.escapeHTMLAttr(avatarIconClasses)}"></span>`;
      }
      return util2.escapeHTML(avatarInitials);
    }
    #getFormattedContent(content = "") {
      const { type, codeBlockQuickActions } = this.#model;
      if (type === messageTypes.MARKDOWN) {
        content = md2html(content, codeBlockQuickActions);
      } else if (type === messageTypes.HTML) {
      } else {
        content = util2.escapeHTML(content);
        content = content.replace(/\n/g, "<br>");
      }
      return content;
    }
  };
  MessageView.events = Object.freeze(events3);

  // images/libraries/apex/chat/ChatView.mjs
  var { jQuery: $, lang: lang3, util: util3 } = apex;
  var CLS_MAIN = "a-ChatClient";
  var CLS_TRANSCRIPT = "a-ChatTranscript";
  var CLS_TRANSCRIPT_DISCLAIMER = "a-ChatTranscript-disclaimer";
  var CLS_TRANSCRIPT_LOG = "a-ChatTranscript-log";
  var CLS_MESSAGES = "a-ChatItems";
  var CLS_QUICK_PICKS = "a-ChatActions-quickPicks";
  var CLS_INPUT_CONTAINER = "a-ChatInputContainer";
  var CLS_TEXTAREA_CONTAINER = "a-ChatInput";
  var CLS_TEXTAREA_WRAPPER = "a-ChatInput-textWrap";
  var CLS_TEXTAREA_RESIZER = "a-ChatInput-textPreview";
  var CLS_TEXTAREA = "a-ChatInput-text";
  var CLS_DIALOG = "ui-dialog--chat-client";
  var CLS_SEND_BTN = "a-ChatInput-button";
  var CLS_SEND_BTN_ICON = "a-ChatInput-icon";
  var renderModes = {
    INLINE: "inline",
    DIALOG: "dialog",
    NONE: "none"
    // default
  };
  var MSG_TEXTAREA_LABEL = lang3.getMessage("APEX.AI.TEXTAREA_LABEL");
  var MSG_DIALOG_TITLE = lang3.getMessage("APEX.AI.DIALOG_TITLE");
  var MSG_CONVERSATION_HISTORY = lang3.getMessage("APEX.AI.CONVERSATION_HISTORY");
  var MSG_TEXTAREA_PLACEHOLDER = lang3.getMessage("APEX.AI.TEXTAREA_PLACEHOLDER");
  var MSG_WARN_UNSENT_MESSAGE = lang3.getMessage("APEX.AI.WARN_UNSENT_MESSAGE");
  var MSG_SEND_MESSAGE = lang3.getMessage("APEX.AI.SEND_MESSAGE");
  var MSG_QUICK_ACTIONS_ARIA_LABEL = lang3.getMessage("APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL");
  var DIALOG_DEFAULT_WIDTH = 500;
  var DIALOG_DEFAULT_HEIGHT = 600;
  var baseHtml = `
    <div class="${CLS_MAIN}">
        <div class="${CLS_TRANSCRIPT}" role="region" aria-label="${util3.escapeHTMLAttr(MSG_CONVERSATION_HISTORY)}">
            <div class="${CLS_TRANSCRIPT_LOG}" role="log">
                <ul class="${CLS_MESSAGES}" tabindex="0" aria-label="${util3.escapeHTMLAttr(MSG_CONVERSATION_HISTORY)}">
                </ul>
            </div>
        </div>
        <div class="${CLS_INPUT_CONTAINER}">
            <div class="${CLS_TEXTAREA_CONTAINER}" role="region" aria-label="${util3.escapeHTMLAttr(MSG_TEXTAREA_LABEL)}">
                <div class="${CLS_TEXTAREA_WRAPPER}">
                    <textarea class="${CLS_TEXTAREA}" aria-label="${util3.escapeHTMLAttr(MSG_TEXTAREA_LABEL)}" enterkeyhint="send" rows="1"></textarea>
                    <span class="${CLS_TEXTAREA_RESIZER}" aria-hidden="true"></span>
                </div>
                <div class="a-ChatInput-actions">
                    <button class="${CLS_SEND_BTN} ${CLS_SEND_BTN}--send" title="${util3.escapeHTMLAttr(MSG_SEND_MESSAGE)}" aria-label="${util3.escapeHTMLAttr(MSG_SEND_MESSAGE)}">
                        <span class="${CLS_SEND_BTN_ICON} a-Icon icon-arrow-up" aria-hidden="true">
                        </span>
                    </button>
                </div>
            </div>
        </div>
    </div>`;
  var id = 0;
  var events4 = {
    MESSAGE_VIEW_RENDER: "messageviewrender",
    MESSAGE_QUICK_ACTION_TRIGGER: "messageviewquickactiontrigger",
    MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER: "messagecodeblockquickactiontrigger",
    QUICK_ACTION_TRIGGER: "quickactiontrigger",
    HIDE: "hide",
    DIALOG_CLOSE: "dialogclose",
    DESTROY: "destroy"
  };
  var ChatView = class extends EventDispatcher {
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
    #quickActions = /* @__PURE__ */ new Map();
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
    #onTextareaKeyDown = (e) => {
      const { which, shiftKey } = e;
      if (which === 13 && !shiftKey) {
        e.preventDefault();
        this.#maybeSubmitTextareaMessage();
      }
    };
    #onSendBtnClick = () => {
      this.#maybeSubmitTextareaMessage();
    };
    #onQuickActionClick = (e) => {
      if (this.#model.isLocked()) {
        return;
      }
      const pick = this.#quickActions.get(e.currentTarget);
      const { message: message2 } = pick;
      if (message2) {
        this.#model.addUserMessage(message2, messageTypes.TEXT);
      }
      this.removeQuickActions();
      this.#textareaEl.focus();
      this.triggerEvent(events4.QUICK_ACTION_TRIGGER, pick);
    };
    #onTranscriptScroll = (e) => {
      const { target: el } = e;
      this.#scrolledToBottom = el.scrollHeight - el.scrollTop - el.clientHeight < 1;
    };
    constructor(model, options) {
      super();
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
        width: DIALOG_DEFAULT_WIDTH,
        // applies only to dialog
        height: DIALOG_DEFAULT_HEIGHT
        // applies only to dialog
      }, options);
      if (model instanceof Chat) {
        this.#model = model;
      } else {
        throw new Error("A valid Chat instance must be provided");
      }
      this.#build();
    }
    findMessageViewByModel(model) {
      return this.#messageViews.find((view) => view.model === model);
    }
    show(focus = true) {
      if (!this.#hidden) {
        return;
      }
      const { mode } = this.#options;
      if (mode === renderModes.DIALOG) {
        this.#chatContainer$.dialog("open");
      } else {
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
        this.#chatContainer$.dialog("close");
        this.#apiInitiated = false;
        this.triggerEvent(events4.DIALOG_CLOSE);
      } else {
        $(this.#el).hide();
      }
      this.triggerEvent(events4.HIDE);
    }
    // syntactic sugar for hide(), to be used by dialog views
    close() {
      this.hide();
    }
    destroy(clearOwnListeners = true) {
      if (this.#destroyed) {
        return;
      }
      this.#destroyed = true;
      const { mode } = this.#options;
      this.close();
      const chat = this.#model;
      this.#messageViews.forEach((msgView) => {
        msgView.destroy();
        msgView.off();
      });
      chat.offAllScoped(this);
      if (clearOwnListeners) {
        this.off();
      }
      if (this.#quickActions.size) {
        this.#quickActions.forEach((value, key) => {
          key.removeEventListener("click", this.#onQuickActionClick);
        });
      }
      this.#textareaEl.removeEventListener("input", this.#onTextareaInput);
      this.#textareaEl.removeEventListener("keydown", this.#onTextareaKeyDown);
      this.#sendBtnEl.removeEventListener("click", this.#onSendBtnClick);
      this.#transcriptEl.removeEventListener("scroll", this.#onTranscriptScroll);
      if (mode === renderModes.DIALOG) {
        this.#chatContainer$.dialog("destroy").remove();
      } else {
        this.#el.remove();
      }
      this.triggerEvent(events4.DESTROY);
    }
    isDestroyed() {
      return this.#destroyed;
    }
    get destroyed() {
      return this.#destroyed;
    }
    hasUncommittedInput() {
      return !this.#destroyed && !this.#hidden && this.#textareaEl.value !== "";
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
      } else if (mode === renderModes.DIALOG) {
        chatContainer$ = apex.message.showDialog("", {
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
            if (this.#apiInitiated) {
              return;
            } else {
              if (this.hasUncommittedInput()) {
                apex.message.confirm(MSG_WARN_UNSENT_MESSAGE, (okPressed) => {
                  if (okPressed) {
                    this.close();
                  }
                });
                return false;
              } else {
                this.close();
                return false;
              }
            }
          }
        });
      } else {
        throw new Error("Invalid option for mode");
      }
      el = document.createRange().createContextualFragment(baseHtml).firstElementChild;
      chatContainer$[0].append(el);
      sendBtnEl = el.querySelector(`.${CLS_SEND_BTN}`);
      sendBtnEl.disabled = true;
      this.#chatContainer$ = chatContainer$;
      this.#el = el;
      this.#sendBtnEl = sendBtnEl;
      this.#transcriptEl = el.querySelector(`.${CLS_TRANSCRIPT}`);
      this.#messageListEl = el.querySelector(`.${CLS_MESSAGES}`);
      this.#textAreaContainerEl = el.querySelector(`.${CLS_INPUT_CONTAINER}`);
      this.#textareaEl = el.querySelector(`.${CLS_TEXTAREA}`);
      this.#textareaResizerEl = el.querySelector(`.${CLS_TEXTAREA_RESIZER}`);
      if (disclaimer) {
        const disclaimerEl = document.createElement("div");
        disclaimerEl.classList.add(CLS_TRANSCRIPT_DISCLAIMER);
        disclaimerEl.appendChild(document.createTextNode(disclaimer));
        this.#transcriptEl.prepend(disclaimerEl);
      }
      this.#setupTextarea();
      this.#setupListeners();
      if (Array.isArray(quickActions) && quickActions.length) {
        this.createQuickActions(quickActions);
      }
      model.getHistory().messages.forEach((message2) => this.#maybeRenderMessage(message2));
      if (model.isLocked()) {
        this.#onChatLock();
      }
      this.show(focus);
    }
    createQuickActions(arr = []) {
      this.removeQuickActions();
      if (arr.length) {
        const container = document.createElement("div");
        container.classList.add(CLS_QUICK_PICKS);
        container.setAttribute("role", "region");
        container.setAttribute("aria-label", MSG_QUICK_ACTIONS_ARIA_LABEL);
        this.#quickActionsEl = container;
        arr.forEach((pick) => {
          const btn = document.createElement("button");
          btn.type = "button";
          btn.classList.add("a-Button");
          const { title, description, disabled } = pick;
          if (title) {
            const titleEl = document.createElement("span");
            const id2 = getUniqueId();
            titleEl.textContent = title;
            titleEl.classList.add("a-Button-label", "a-Button-label--title");
            titleEl.id = id2;
            btn.setAttribute("aria-labelledby", id2);
            btn.appendChild(titleEl);
          }
          if (description) {
            const descriptionEl = document.createElement("span");
            const id2 = getUniqueId();
            descriptionEl.textContent = description;
            descriptionEl.classList.add("a-Button-label", "a-Button-label--description");
            descriptionEl.id = id2;
            btn.setAttribute("aria-describedby", id2);
            btn.appendChild(descriptionEl);
          }
          if (disabled) {
            btn.disabled = true;
          }
          this.#quickActions.set(btn, pick);
          btn.addEventListener("click", this.#onQuickActionClick);
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
          key.removeEventListener("click", this.#onQuickActionClick);
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
      this.#model.on(events2.MESSAGE_ADDED, this.#onMessageModelAdded, { scope: this });
      this.#model.on(events2.CHAT_LOCK, this.#onChatLock, { scope: this });
      this.#model.on(events2.CHAT_UNLOCK, this.#onChatUnlock, { scope: this });
      this.#model.on(events2.CLEAR, this.#onMessagesClear, { scope: this });
      this.#textareaEl.addEventListener("input", this.#onTextareaInput);
      this.#textareaEl.addEventListener("keydown", this.#onTextareaKeyDown);
      this.#sendBtnEl.addEventListener("click", this.#onSendBtnClick);
      this.#transcriptEl.addEventListener("scroll", this.#onTranscriptScroll);
    }
    #setSendButtonDisabledAttribute() {
      this.#sendBtnEl.disabled = this.#chatLocked || !this.#textareaEl.value;
    }
    #onMessageModelAdded(e, message2) {
      this.#maybeRenderMessage(message2);
    }
    #onChatLock() {
      this.#chatLocked = true;
      this.#sendBtnEl.disabled = true;
      this.#quickActionsEl?.querySelectorAll("button").forEach((btn) => btn.disabled = true);
    }
    #onChatUnlock() {
      this.#chatLocked = false;
      this.#setSendButtonDisabledAttribute();
      this.#quickActionsEl?.querySelectorAll("button").forEach((btn) => btn.disabled = false);
    }
    #onMessagesClear() {
      this.#messageViews.forEach((view) => {
        view.destroy();
        view.off();
        view.el.remove();
      });
      this.#messageViews = [];
    }
    #maybeRenderMessage(message2) {
      if (message2.hidden) {
        return;
      }
      const view = new MessageView(message2, { highlightCodeFn: this.#options.highlightCodeFn });
      this.#messageViews.push(view);
      this.#messageListEl.append(view.el);
      this.#scrollMessageIntoView(view);
      view.on(events3.QUICK_ACTION_TRIGGER, this.#onMessageViewQuickActionTrigger, { scope: this });
      view.on(events3.CODE_BLOCK_QUICK_ACTION_TRIGGER, this.#onMessageViewCodeBlockQuickActionTrigger, { scope: this });
      view.on(events3.AFTER_LOAD_RENDER, this.#onMessageViewAfterLoadRender, { scope: this });
      view.on(events3.AFTER_QUICK_ACTIONS_RENDER, this.#onMessageViewAfterQuickActionsRender, { scope: this });
      this.triggerEvent(events4.MESSAGE_VIEW_RENDER, view);
    }
    #onMessageViewQuickActionTrigger(e, actionObj) {
      this.triggerEvent(events4.MESSAGE_QUICK_ACTION_TRIGGER, e.target, actionObj);
    }
    #onMessageViewCodeBlockQuickActionTrigger(e, actionObj, buttonEl, codeBlockEl) {
      this.triggerEvent(events4.MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER, e.target, actionObj, buttonEl, codeBlockEl);
    }
    #onMessageViewAfterLoadRender(e) {
      this.#scrollMessageIntoView(e.target);
    }
    #onMessageViewAfterQuickActionsRender(e) {
      this.#scrollMessageIntoView(e.target);
    }
    #setupTextarea() {
      const self = this, o = self.#options, textareaEl = this.#textareaEl;
      if (o.placeholder) {
        textareaEl.setAttribute("placeholder", o.placeholder);
      }
    }
    #maybeSubmitTextareaMessage() {
      if (this.#chatLocked) {
        return false;
      }
      const ta = this.#textareaEl;
      const message2 = ta.value;
      if (message2.length) {
        if (this.#quickActionsEl) {
          this.removeQuickActions();
        }
        this.#model.addUserMessage(message2, messageTypes.TEXT);
        ta.value = "";
        this.#updateTextareaResizerText();
        this.#setSendButtonDisabledAttribute();
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
      el.scroll({ top: el.scrollHeight, behavior: instant ? "instant" : "smooth" });
    }
    #scrollMessageIntoView(messageView) {
      const messageEl = messageView.el;
      this.#transcriptEl.scroll({ top: messageEl.offsetTop, behavior: "smooth" });
    }
    #updateTextareaResizerText() {
      this.#textareaResizerEl.innerText = this.#textareaEl.value;
    }
  };
  ChatView.events = events4;

  // images/libraries/apex/chat/AIChatApp.mjs
  var { jQuery: $2, lang: lang4, server } = apex;
  var MSG_NAME_USER = lang4.getMessage("APEX.AI.NAME_USER");
  var MSG_NAME_ASSISTANT = lang4.getMessage("APEX.AI.NAME_ASSISTANT");
  var MSG_ACTION_COPY_LABEL = lang4.getMessage("APEX.AI.COPY");
  var MSG_ACTION_COPY_DONE_LABEL = lang4.getMessage("APEX.AI.COPIED");
  var events5 = {
    MESSAGE_QUICK_ACTION_TRIGGER: "messagequickactiontrigger",
    MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER: "messagecodeblockquickactiontrigger",
    MESSAGE_RENDER: "messagerender",
    QUICK_ACTION_TRIGGER: "quickactiontrigger",
    CHAT_LOCK: events2.CHAT_LOCK,
    CHAT_UNLOCK: events2.CHAT_UNLOCK,
    MESSAGE_ADDED: events2.MESSAGE_ADDED,
    MESSAGE_LOAD_COMPLETE: events2.MESSAGE_LOAD_COMPLETE,
    MESSAGE_LOAD_ERROR: events2.CHAT_LOCK
  };
  var actions = {
    COPY: {
      label: MSG_ACTION_COPY_LABEL,
      iconClasses: "icon-copy",
      action: function(app, mainView, messageView, actionObj, buttonEl, codeBlockEl) {
        const cls = "is-copied";
        const newIconClasses = "ui-icon-check";
        const { iconClasses } = actionObj;
        const updateBtn = (text, ariaLabel) => {
          const datasetName = "copyTimeoutId";
          const runningTimeout = parseInt(buttonEl.dataset[datasetName], 10);
          if (runningTimeout) {
            return;
          }
          const labelEl = buttonEl.querySelector(".a-ChatItem-buttonLabel");
          const iconEl = buttonEl.querySelector(".a-ChatItem-buttonIcon");
          let prevAriaLabel;
          buttonEl.classList.add(cls);
          if (text != null && labelEl) {
            labelEl.innerText = text;
          }
          if (ariaLabel != null) {
            prevAriaLabel = buttonEl.getAttribute("aria-label");
            buttonEl.setAttribute("aria-label", ariaLabel);
          }
          if (iconEl) {
            if (iconClasses) {
              iconEl.classList.toggle(...iconClasses.split(" "));
            }
            if (newIconClasses) {
              iconEl.classList.toggle(...newIconClasses.split(" "));
            }
          }
          buttonEl.dataset[datasetName] = setTimeout(() => {
            delete buttonEl.dataset[datasetName];
            buttonEl.classList.remove(cls);
            if (prevAriaLabel != null) {
              buttonEl.setAttribute("aria-label", prevAriaLabel);
            }
            if (labelEl) {
              labelEl.innerText = MSG_ACTION_COPY_LABEL;
            }
            if (iconEl) {
              if (iconClasses) {
                iconEl.classList.toggle(...iconClasses.split(" "));
              }
              if (newIconClasses) {
                iconEl.classList.toggle(...newIconClasses.split(" "));
              }
            }
          }, 3e3);
        };
        if (navigator.clipboard) {
          try {
            navigator.clipboard.writeText(codeBlockEl.innerText.replace(/\u00a0/g, " "));
            updateBtn(MSG_ACTION_COPY_DONE_LABEL);
          } catch (err) {
          }
        } else {
          selectElementTextContent(codeBlockEl);
          try {
            const result = document.execCommand("copy");
            if (result) {
              updateBtn(MSG_ACTION_COPY_DONE_LABEL);
            }
          } catch (err) {
          } finally {
            window.getSelection().removeAllRanges();
          }
        }
      }
    }
  };
  var AIChatApp = class extends EventDispatcher {
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
      const currentUser = new User($2.extend({
        id: "1",
        name: MSG_NAME_USER,
        messageStyle: "outbound",
        avatar: getUserAvatar()
      }, currentUserData));
      this.#currentUser = currentUser;
      const aiUser = new User($2.extend({
        id: "2",
        name: MSG_NAME_ASSISTANT,
        messageStyle: "inbound",
        avatar: {
          iconClasses: "a-Icon icon-apex-assistant"
        }
      }, aiUserData));
      this.#aiUser = aiUser;
      if (ajaxId) {
        this.#ajaxCallback = (data) => {
          return server.plugin(ajaxId, {
            p_widget_name: "ai",
            ...data
          });
        };
      } else if (ajaxCallback) {
        this.#ajaxCallback = ajaxCallback;
      } else {
        throw new Error("Either ajaxId or ajaxCallback is required");
      }
      if (typeof processMessage === "function") {
        processMessageFn = (messageModel) => {
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
    async addAiMessage(message2, fakeTyping = false) {
      let content, type = messageTypes.MARKDOWN, fullContent, excludeFromCommits = false, hidden = false, cssClasses;
      if (typeof message2 === "string") {
        content = fullContent = message2;
      } else {
        ({ content, type = messageTypes.MARKDOWN, fullContent, excludeFromCommits = false, hidden = false, cssClasses } = message2);
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
    async addUserMessage(message2) {
      let content, type = messageTypes.TEXT, fullContent, excludeFromCommits = false, hidden = false, cssClasses;
      if (typeof message2 === "string") {
        content = fullContent = message2;
      } else {
        ({ content, type = messageTypes.TEXT, fullContent, excludeFromCommits = false, hidden = false, cssClasses } = message2);
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
      } else {
        const lastModel = messages[messages.length - 1];
        if (lastModel.promise && !lastModel.isLoaded()) {
          messages.pop();
        }
      }
      retObj.messages = messages.map((model) => {
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
      el = "body",
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
      this.#views.forEach((view) => view.createQuickActions(arr));
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
      }, /* @__PURE__ */ new Map());
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
      this.#views.forEach((view) => {
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
        events2.CHAT_LOCK,
        events2.CHAT_UNLOCK,
        events2.MESSAGE_ADDED,
        events2.MESSAGE_LOAD_COMPLETE,
        events2.MESSAGE_LOAD_ERROR,
        events2.COMMIT
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
        if (typeof highlightCode === "function") {
          highlightCodeFn = (messageView, el2) => {
            return highlightCode(this, view, messageView, el2);
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
      throw new Error("Invalid render mode for the view.");
    }
    #onMessageViewQuickActionTrigger(e, messageView, actionObj) {
      const callback = actionObj.action;
      const mainView = e.currentTarget;
      if (callback && typeof callback === "function") {
        callback(this, mainView, messageView, actionObj);
      }
      this.triggerEvent(events5.MESSAGE_QUICK_ACTION_TRIGGER, mainView, messageView, actionObj);
    }
    #onMessageViewCodeBlockQuickActionTrigger(e, messageView, actionObj, buttonEl, codeBlockEl) {
      const callback = actionObj.action;
      const mainView = e.currentTarget;
      if (callback && typeof callback === "function") {
        callback(this, mainView, messageView, actionObj, buttonEl, codeBlockEl);
      }
      this.triggerEvent(events5.MESSAGE_CODE_BLOCK_QUICK_ACTION_TRIGGER, mainView, messageView, actionObj, buttonEl, codeBlockEl);
    }
    #onMessageViewRender(e, view) {
      const mainView = e.currentTarget;
      this.triggerEvent(events5.MESSAGE_RENDER, mainView, view);
    }
    #onViewQuickActionTrigger(e, actionObj) {
      const callback = actionObj.action;
      const mainView = e.target;
      if (callback && typeof callback === "function") {
        callback(this, mainView, actionObj);
      }
      this.triggerEvent(events5.QUICK_ACTION_TRIGGER, mainView, actionObj);
    }
    #onViewDestroy(e) {
      const view = e.target;
      const index = this.#views.findIndex((v) => v === view);
      if (index > -1) {
        this.#views.splice(index, 1);
      }
    }
  };
  AIChatApp.events = Object.freeze(events5);
  AIChatApp.renderModes = Object.freeze(renderModes);
  AIChatApp.messageTypes = Object.freeze(messageTypes);
  AIChatApp.actions = Object.freeze(actions);

  // images/libraries/apex/ai.mjs
  var { lang: lang5, server: server2 } = apex;
  var gUserConsentNeeded = false;
  var gUserAvatar;
  var configure = ({
    userConsentNeeded,
    userAvatar
  }) => {
    gUserConsentNeeded = userConsentNeeded;
    gUserAvatar = userAvatar;
  };
  var getUserAvatar = () => {
    return gUserAvatar;
  };
  var getUserConsent = (() => {
    let doGetConsentPromise;
    let consentMessage;
    const ajaxMode2 = {
      GET_CONSENT: "get_consent_message",
      SAVE_CONSENT: "save_consent"
    };
    const MSG_CONSENT_ACCEPT = lang5.getMessage("APEX.AI.CONSENT_ACCEPT"), MSG_CONSENT_DENY = lang5.getMessage("APEX.AI.CONSENT_DENY");
    const ajax = (data) => {
      return server2.widget("ai", data);
    };
    const doGetConsent = async () => {
      if (!consentMessage) {
        const delaySpinner = new DelaySpinner();
        consentMessage = (await ajax({ mode: ajaxMode2.GET_CONSENT })).message;
        await delaySpinner.finish();
      }
      const result = await asyncConfirm(consentMessage, {
        confirmLabel: MSG_CONSENT_ACCEPT,
        cancelLabel: MSG_CONSENT_DENY,
        dialogClasses: "ui-dialog--ai-consent",
        unsafe: false
      });
      if (result) {
        ajax({ mode: ajaxMode2.SAVE_CONSENT });
        gUserConsentNeeded = false;
      }
      return result;
    };
    return async () => {
      if (!gUserConsentNeeded) {
        return true;
      }
      if (doGetConsentPromise) {
        return await doGetConsentPromise;
      } else {
        doGetConsentPromise = doGetConsent();
        doGetConsentPromise.then(() => {
          doGetConsentPromise = void 0;
        });
        return await doGetConsentPromise;
      }
    };
  })();
  apex.ai = {
    // private
    configure,
    // public
    getUserConsent,
    Chat: AIChatApp
  };
})();
/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */
