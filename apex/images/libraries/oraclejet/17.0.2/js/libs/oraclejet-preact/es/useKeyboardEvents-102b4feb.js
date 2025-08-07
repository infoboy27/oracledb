/* @oracle/oraclejet-preact: undefined */
import { u as useUser } from './useUser-99920e02.js';

const handleInput = (inputValue, currentInput, onInput) => {
    onInput?.({ value: inputValue });
    currentInput.current = inputValue;
};
const cancelEvent = (event) => {
    event.preventDefault();
    event.stopPropagation();
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useKeyboardEvents(value, min, max, step, currentInputRef, onCommit, onInput) {
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const keyDownHandler = (event) => {
        const key = event.key;
        switch (key) {
            case 'Tab':
                return;
            case 'ArrowDown':
                handleInput(Math.max(min, value - step), currentInputRef, onInput);
                cancelEvent(event);
                break;
            case 'ArrowUp':
                handleInput(Math.min(max, value + step), currentInputRef, onInput);
                cancelEvent(event);
                break;
            case 'ArrowLeft': {
                const inputValue = isRtl ? Math.min(max, value + step) : Math.max(min, value - step);
                handleInput(inputValue, currentInputRef, onInput);
                cancelEvent(event);
                break;
            }
            case 'ArrowRight': {
                const inputValue = isRtl ? Math.max(min, value - step) : Math.min(max, value + step);
                handleInput(inputValue, currentInputRef, onInput);
                cancelEvent(event);
                break;
            }
        }
    };
    const keyUpHandler = (event) => {
        const key = event.key;
        switch (key) {
            case 'Enter':
                onCommit?.({ value: value });
                cancelEvent(event);
                break;
            case 'Tab':
                handleInput(value, currentInputRef, onInput);
                cancelEvent(event);
                break;
            case 'Home':
                handleInput(min, currentInputRef, onInput);
                cancelEvent(event);
                break;
            case 'End':
                handleInput(max, currentInputRef, onInput);
                cancelEvent(event);
                break;
        }
    };
    return {
        onKeyUp: keyUpHandler,
        onKeyDown: keyDownHandler
    };
}

export { handleInput as h, useKeyboardEvents as u };
//# sourceMappingURL=useKeyboardEvents-102b4feb.js.map
