/* @oracle/oraclejet-preact: undefined */
'use strict';

require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var compat = require('preact/compat');
var useUser = require('./useUser-a6d15333.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * A custom hook that handles focus for a month or year cell.
 */
const useFocusableCell = ({ isFocusable, isFocused }) => {
    const cellRef = compat.useRef(null);
    const { isTabbable } = useTabbableMode.useTabbableMode();
    // Using layout effect here to set the focus as we want to focus the element
    // before the browser has a chance to paint. This way the browser don't have to
    // repaint the focused state.
    compat.useLayoutEffect(() => {
        if (isFocusable && isFocused) {
            cellRef.current?.focus();
        }
    }, [isFocusable, isFocused]);
    return { ref: cellRef, tabIndex: isFocusable && isTabbable ? 0 : -1 };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * A custom hook that handles navigation for a DatePicker cell.
 */
const useCellNavigation = ({ navigationMap, payload, onAction, onNavigation }) => {
    const { direction } = useUser.useUser();
    const handleSelection = compat.useCallback(() => {
        onAction(payload);
    }, [payload, onAction]);
    const handleKeyDown = compat.useCallback((event) => {
        const killEvent = () => {
            event.preventDefault();
            event.stopPropagation();
        };
        if (['Enter', 'Space'].includes(event.code)) {
            // since we are handling the event, we need to kill the event here
            // so that no other action is performed
            killEvent();
            handleSelection();
            return;
        }
        // Handle Ctrl + Alt + T
        if (event.code === 'KeyT' && event.ctrlKey && event.altKey) {
            const navigationDirection = navigationMap['CtrlAltT'];
            if (navigationDirection !== undefined) {
                // since we are handling the event, we need to kill the event here
                // so that no other action is performed
                killEvent();
                onNavigation({
                    direction: getLogicalValue(navigationDirection, direction),
                    ...payload
                });
            }
        }
        const { key, shiftKey } = event;
        switch (key) {
            // since we are handling the event, we need to kill the event here
            // so that no other action is performed
            case 'ArrowLeft':
            case 'ArrowRight':
            case 'ArrowUp':
            case 'ArrowDown':
            case 'End':
            case 'Home':
            case 'PageUp':
            case 'PageDown':
                const mapKey = shiftKey && (key === 'PageUp' || key === 'PageDown') ? `Shift${key}` : key;
                if (navigationMap[mapKey] !== undefined) {
                    killEvent();
                    const navigationDirection = navigationMap[mapKey];
                    onNavigation({
                        direction: getLogicalValue(navigationDirection, direction),
                        ...payload
                    });
                }
        }
    }, [direction, handleSelection, navigationMap, onNavigation, payload]);
    return {
        onClick: handleSelection,
        onKeyDown: handleKeyDown
    };
};
/**
 * Determines the logical value for the navigation direction.
 * @param value The value representing the navigation direction
 * @param dir The reading direction from the user preferences
 * @returns The logical navigation direction
 */
const getLogicalValue = (value, dir) => typeof value === 'string' ? value : value[dir];

exports.useCellNavigation = useCellNavigation;
exports.useFocusableCell = useFocusableCell;
//# sourceMappingURL=useCellNavigation-24bff833.js.map
