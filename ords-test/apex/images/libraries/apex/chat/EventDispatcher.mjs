/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Event dispatching interface.
 */

class EventDispatcher {

    // to keep track of the order when no priority (i.e. 0) is set
    #eventId = 0;
    #listeners = {};

    on(eventName, callback, { priority = 0, once = false, scope } = {}) {
        const [name, ...namespaces] = eventName.split('.');

        if (!name) {
            return;
        }

        if (namespaces.length) {
            namespaces.forEach(ns => this.#maybeRegister(`${name}.${ns}`, callback, priority, scope, once));
        }
        else {
            this.#maybeRegister(name, callback, priority, scope, once);
        }
    }

    one(eventName, callback, { priority = 0, scope } = {}) {
        this.on(eventName, callback, { priority, scope, once: true });
    }

    off(eventName, callback, scope) {
        let handlers;
        let scopeWasPassed = arguments.length > 2;

        // remove all
        if (!arguments.length) {
            this.#listeners = {};
            return;
        }
        // remove all from scope
        if (eventName == null && callback == null && scope) {
            const allEventNames = Object.keys(this.#listeners);
            allEventNames.forEach(name => {
                let handlers = this.#listeners[name];
                handlers = handlers.filter(handler => handler.scope !== scope);
                if (handlers.length) {
                    this.#listeners[name] = handlers;
                }
                else {
                    delete this.#listeners[name];
                }
            });
            return;
        }

        const [name, ...namespaces] = eventName.split('.');

        if (!name && !namespaces.length) {
            return;
        }

        // find all the events/handlers that should be considered for removal
        handlers = Object.entries(this.#listeners)
            .filter(([key]) => {
                const [currKeyName, currKeyNs] = key.split('.');

                // if there is a name, it must be the same
                if (name) {
                    if (name !== currKeyName) {
                        return false;
                    }
                }
                // if there is also a ns or no name but only ns
                if (namespaces.length) {
                    return namespaces.includes(currKeyNs);
                }
                else {
                    return true;
                }
            })
            .map(([key, value]) => {
                return {
                    [key]: value
                };
            }); // => [{ eventName: [{callback, scope, priority}, {...}] }, { eventName: [{callback, scope, priority}] }]

        // no handlers found
        if (!handlers.length) {
            return;
        }

        handlers.forEach(item => {
            const [name, handlers] = Object.entries(item)[0];
            const shouldKeepHandlers = callback ? handlers.filter(handler => {
                const diffCallback = handler.callback !== callback;
                // if scope was passed and the callback IS the same
                if (scopeWasPassed && !diffCallback) {
                    return handler.scope !== scope;
                }
                return diffCallback;
            }) : [];
            if (shouldKeepHandlers.length) {
                this.#listeners[name] = shouldKeepHandlers;
            }
            else {
                delete this.#listeners[name];
            }
        });
    }

    offAllScoped(scope) {
        this.off(null, null, scope);
    }

    triggerEvent(eventName, ...args) {
        const [name, ...namespace] = eventName.split('.');
        const toRemove = [];
        // if no event name (but possibly only namespace), we cannot trigger
        if (!name) {
            return;
        }
        Object.entries(this.#listeners)
            .filter(([key]) => {
                const parts = key.split('.');
                if (parts[0] === name) {
                    if (namespace?.length) {
                        return parts.some(item => namespace.includes(item));
                    }
                    return true;
                }
                return false;
            })
            .forEach(([e, handlers]) => {
                handlers.forEach(handler => {
                    const { callback, scope, priority, once } = handler;
                    if (once) {
                        toRemove.push({
                            name: e,
                            fn: callback
                        });
                    }
                    callback.call(scope || this, {
                        type: name,
                        namespace: namespace || undefined,
                        currentTarget: this,
                        target: this,
                        registered: e,
                        priority,
                        callback
                    }, ...args);
                });
            });

        if (toRemove.length) {
            toRemove.forEach(r => {
                this.off(r.name, r.fn);
            });
        }
    }

    relayEvents(origin, eventNames = [], prefix = '') {
        let added = [];
        eventNames.forEach(eventName => {
            const fn = (e, ...rest) => {
                this.triggerEvent(`${prefix}${eventName}`, ...rest);
            };
            origin.on(eventName, fn);
            added.push({ origin, eventName, fn });
        });
        return () => {
            added.forEach(({ origin, eventName, fn }) => {
                origin.off(eventName, fn);
            });
            added = [];
        };
    }

    #maybeRegister(name, callback, priority, scope, once) {
        this.#listeners[name] ??= [];
        const handlers = this.#listeners[name];
        const callbacks = handlers.filter(handler => {
            return handler.callback === callback;
        });
        // if the scopes are not the same, we need to add different listeners
        const callbackPresent = callbacks.some(handler => {
            return handler.scope === scope;
        });
        if (!callbackPresent) {
            this.#eventId += 1;
            handlers.push({ callback, priority, scope, once, id: this.#eventId });
            // If it has a non-zero priority, we will sort it for correct triggering order.
            // If the priority is 0, it will keep the order as they were added.
            handlers.sort((a, b) => {
                if (a.priority !== 0 || b.priority !== 0) {
                    return b.priority - a.priority;
                }
                else {
                    return a.id - b.id;
                }
            });
        }
    }
}

export { EventDispatcher };