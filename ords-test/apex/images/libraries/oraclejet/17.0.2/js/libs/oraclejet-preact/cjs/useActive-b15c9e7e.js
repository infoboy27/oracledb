/* @oracle/oraclejet-preact: undefined */
'use strict';

var useToggle = require('./useToggle-3ebba7d8.js');
var hooks = require('preact/hooks');

/**
 * Indicates if primary mouse button is down
 * @param e
 * @returns
 */
const isPrimaryMouseButtonDown = (e) => {
    const flags = e.buttons !== undefined ? e.buttons : e.which;
    const primaryMouseButtonDown = (flags & 1) === 1;
    if (primaryMouseButtonDown) {
        return true;
    }
    return false;
};
/**
 * Returns properties to manage active state indication
 * @returns
 */
function useActive(settings = { isDisabled: false }) {
    const { bool, setTrue, setFalse } = useToggle.useToggle(false);
    const wasActive = hooks.useRef(false);
    const mouseDownTarget = hooks.useCallback((e) => {
        if (isPrimaryMouseButtonDown(e)) {
            setTrue();
        }
    }, [setTrue]);
    const leftTarget = hooks.useCallback((e) => {
        if (isPrimaryMouseButtonDown(e)) {
            wasActive.current = true;
        }
        setFalse();
    }, [setFalse]);
    const enteredTarget = hooks.useCallback((e) => {
        if (wasActive.current) {
            if (isPrimaryMouseButtonDown(e)) {
                setTrue();
            }
            wasActive.current = false;
        }
    }, [setTrue]);
    const onKeyDown = hooks.useCallback((event) => {
        if (event.key === ' ' || event.key === 'Enter') {
            setTrue();
        }
    }, [setTrue]);
    const onKeyUp = hooks.useCallback(() => {
        setFalse();
    }, [setFalse]);
    const activeProps = settings.isDisabled
        ? {}
        : {
            onMouseDown: mouseDownTarget,
            onMouseLeave: leftTarget,
            onMouseEnter: enteredTarget,
            onMouseUp: setFalse,
            onTouchStart: setTrue,
            onTouchEnd: setFalse,
            onTouchCancel: setFalse,
            onKeyDown,
            onKeyUp
        };
    return {
        isActive: settings.isDisabled ? false : bool,
        activeProps: activeProps
    };
}

exports.useActive = useActive;
//# sourceMappingURL=useActive-b15c9e7e.js.map
