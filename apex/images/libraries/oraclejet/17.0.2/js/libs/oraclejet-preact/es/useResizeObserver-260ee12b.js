/* @oracle/oraclejet-preact: undefined */
import { useLayoutEffect } from 'preact/hooks';

/**
 * A hook for observing and responding to changes to the size of a DOM element.
 * It utilizes a ResizeObserver to observe changes to the size of the specified element
 * and accepts a callback function to respond to these changes.
 *
 * @param ref The ref to the target DOM element to observe.
 * @param callback A callback function to be called when the size of the observed element changes.
 *     If the provided callback triggers the consuming component to re-render, then
 *     it's important to pass the same instance of the callback function during each render
 *     to prevent infinite re-render loops. One way to achieve this is by using useCallback.
 * @param options Configuration options.
 */
const useResizeObserver = (ref, callback, options) => {
    const { box, isDisabled = false } = options || {};
    useLayoutEffect(() => {
        // Note ref may be undefined in the hooks storybook demo
        if (!ref?.current || isDisabled)
            return;
        const target = ref.current;
        const resizeObserver = new ResizeObserver((entries) => {
            for (const entry of entries) {
                callback(entry);
            }
        });
        resizeObserver.observe(target, { box });
        return () => resizeObserver.disconnect();
    }, [ref, callback, box, isDisabled]);
};

export { useResizeObserver as u };
//# sourceMappingURL=useResizeObserver-260ee12b.js.map
