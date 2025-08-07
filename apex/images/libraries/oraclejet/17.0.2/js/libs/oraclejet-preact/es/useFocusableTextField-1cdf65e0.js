/* @oracle/oraclejet-preact: undefined */
import { useRef, useEffect, useImperativeHandle } from 'preact/hooks';
import { u as useFocusWithin } from './useFocusWithin-30b1e2d8.js';

/**
 * A custom hook that handles the focus when the text field
 * is toggled between readonly and enabled
 * @typedef E represents the type of the enabled element
 * @typedef R represents the type of the readonly element
 */
function useFocusableTextField({ isReadonly, ref = () => { }, ...useFocusWithinProps }) {
    const { focusProps, isFocused } = useFocusWithin(useFocusWithinProps);
    const previousIsFocusedRef = useRef(isFocused);
    const enabledElementRef = useRef(null);
    const readonlyElementRef = useRef(null);
    // Retain focus when toggling between readonly and enabled
    useEffect(() => {
        // if the readonly state is changed and previously we
        // were holding focus, set the focus to newly rendered element
        if (previousIsFocusedRef.current) {
            if (isReadonly) {
                setTimeout(() => readonlyElementRef.current?.focus());
            }
            else {
                setTimeout(() => enabledElementRef.current?.focus());
            }
        }
    }, [isReadonly]);
    // Keep the previousFocusRef in sync, but be sure to run this hook
    // after handling focus for the readonly toggling.
    useEffect(() => {
        previousIsFocusedRef.current = isFocused;
    }, [isFocused]);
    // Add focus and blur methods
    useImperativeHandle(ref, () => ({
        focus: () => {
            if (isReadonly) {
                readonlyElementRef.current?.focus();
            }
            else {
                enabledElementRef.current?.focus();
            }
        },
        blur: () => {
            if (isReadonly) {
                readonlyElementRef.current?.blur();
            }
            else {
                enabledElementRef.current?.blur();
            }
        }
    }), [isReadonly]);
    return {
        enabledElementRef,
        readonlyElementRef,
        isFocused,
        focusProps
    };
}

export { useFocusableTextField as u };
//# sourceMappingURL=useFocusableTextField-1cdf65e0.js.map
