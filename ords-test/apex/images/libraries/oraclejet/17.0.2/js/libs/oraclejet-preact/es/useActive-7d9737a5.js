/* @oracle/oraclejet-preact: undefined */
import { u as useToggle } from './useToggle-8b7fcefe.js';
import { useRef, useCallback } from 'preact/hooks';

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
    const { bool, setTrue, setFalse } = useToggle(false);
    const wasActive = useRef(false);
    const mouseDownTarget = useCallback((e) => {
        if (isPrimaryMouseButtonDown(e)) {
            setTrue();
        }
    }, [setTrue]);
    const leftTarget = useCallback((e) => {
        if (isPrimaryMouseButtonDown(e)) {
            wasActive.current = true;
        }
        setFalse();
    }, [setFalse]);
    const enteredTarget = useCallback((e) => {
        if (wasActive.current) {
            if (isPrimaryMouseButtonDown(e)) {
                setTrue();
            }
            wasActive.current = false;
        }
    }, [setTrue]);
    const onKeyDown = useCallback((event) => {
        if (event.key === ' ' || event.key === 'Enter') {
            setTrue();
        }
    }, [setTrue]);
    const onKeyUp = useCallback(() => {
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

export { useActive as u };
//# sourceMappingURL=useActive-7d9737a5.js.map
