import { type Ref } from 'preact/hooks';
type Options = {
    /**
     * When set to true, the callback will not be invoked even if the target element's size changes.
     */
    isDisabled?: boolean;
    /**
     * Sets which box model the observer will observe changes to.
     */
    box?: ResizeObserverBoxOptions;
};
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
declare const useResizeObserver: (ref: Ref<Element>, callback: (entry: ResizeObserverEntry) => void, options?: Options) => void;
export { useResizeObserver };
