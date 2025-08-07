/* @oracle/oraclejet-preact: undefined */
'use strict';

var clientHints$1 = require('./clientHints-9e411b6e.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const clientHints = clientHints$1.getClientHints();
/**
 * Checks if the key pressed is the backspace/delete key.
 *
 * @param event The keyboard event
 * @return the result of the check
 */
function isBackspaceOrDelete(event) {
    return event.code === 'Backspace' || event.code === 'Delete';
}
/**
 * Checks if the current event is a select-all event
 *
 * @param event The keyboard event
 * @returns the result of the check
 */
function isSelectAll(event) {
    return (((clientHints.platform === 'mac' && event.metaKey) ||
        (clientHints.platform === 'windows' && event.ctrlKey)) &&
        event.code === 'KeyA');
}
const KEYS = {
    TAB: 'Tab',
    ENTER: 'Enter',
    NUMPAD_ENTER: 'NumpadEnter',
    ESC: 'Escape',
    SPACE: 'Space',
    LEFT: 'ArrowLeft',
    UP: 'ArrowUp',
    RIGHT: 'ArrowRight',
    DOWN: 'ArrowDown',
    SHIFT_LEFT: 'ShiftLeft',
    SHIFT_RIGHT: 'ShiftRight',
    CTRL_LEFT: 'ControlLeft',
    CTRL_RIGHT: 'ControlRight',
    ALT_LEFT: 'AltLeft',
    ALT_RIGHT: 'AltRight',
    PAGE_UP: 'PageUp',
    PAGE_DOWN: 'PageDown',
    HOME: 'Home',
    END: 'End',
    BACKSPACE: 'Backspace',
    DELETE: 'Delete'
};
const isControlKey = (event) => {
    switch (event.code) {
        case KEYS.SHIFT_LEFT:
        case KEYS.SHIFT_RIGHT:
        case KEYS.CTRL_LEFT:
        case KEYS.CTRL_RIGHT:
        case KEYS.ALT_LEFT:
        case KEYS.ALT_RIGHT:
            return true;
        default:
            return event.metaKey || event.ctrlKey;
    }
};
const isFunctionKey = (event) => {
    return /\bF([1-9]|1[0-2])\b/i.test(event.code);
};
const isControlOrFunctionKey = (event) => {
    return isControlKey(event) || isFunctionKey(event);
};

exports.KEYS = KEYS;
exports.isBackspaceOrDelete = isBackspaceOrDelete;
exports.isControlOrFunctionKey = isControlOrFunctionKey;
exports.isSelectAll = isSelectAll;
//# sourceMappingURL=keyboardUtils-f835e1ee.js.map
