/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

const { util, message } = apex;

/*
 * Wrapper around apex.message.confirm to be used in async contexts
 * Use as such:
 *
 * const okPressed = await asyncConfirm( "Are you sure", options );
 */
function asyncConfirm(msg, options) {
    return new Promise(resolve => {
        message.confirm(msg, okPressed => {
            resolve(okPressed);
        }, options);
    });
}

function getUniqueId() {
    return util.getTopApex().jQuery({}).uniqueId()[0].id;
}

function resolveAfter(delay = 0, resolutionValue) {
    return new Promise(resolve => setTimeout(() => {
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

/*
 * Class-based wrapper around apex.util.delayLinger to be used in async contexts
 * The scope name and spinner position are not configurable.
 * Use as such:
 *
 * const delaySpinner = new DelaySpinner();
 * await longProcess();
 * await delaySpinner.finish();
 */
class DelaySpinner {
    static uniqueId = 0;
    #scopeName;
    #spinner$;
    #wasStarted;

    constructor() {
        DelaySpinner.uniqueId += 1;
        this.#scopeName = 'aiSpinner' + DelaySpinner.uniqueId;
        util.delayLinger.start(this.#scopeName, () => {
            this.#wasStarted = true;
            this.#spinner$ = apex.util.showSpinner();
        });
    }

    finish() {
        return new Promise(resolve => {
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
}

export {
    asyncConfirm,
    getUniqueId,
    DelaySpinner,
    resolveAfter,
    selectElementTextContent
};