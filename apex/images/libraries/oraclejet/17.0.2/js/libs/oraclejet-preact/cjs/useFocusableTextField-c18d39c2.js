/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var useFocusWithin = require('./useFocusWithin-eb7f956a.js');

/**
 * A custom hook that handles the focus when the text field
 * is toggled between readonly and enabled
 * @typedef E represents the type of the enabled element
 * @typedef R represents the type of the readonly element
 */
function useFocusableTextField({ isReadonly, ref = () => { }, ...useFocusWithinProps }) {
    const { focusProps, isFocused } = useFocusWithin.useFocusWithin(useFocusWithinProps);
    const previousIsFocusedRef = hooks.useRef(isFocused);
    const enabledElementRef = hooks.useRef(null);
    const readonlyElementRef = hooks.useRef(null);
    // Retain focus when toggling between readonly and enabled
    hooks.useEffect(() => {
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
    hooks.useEffect(() => {
        previousIsFocusedRef.current = isFocused;
    }, [isFocused]);
    // Add focus and blur methods
    hooks.useImperativeHandle(ref, () => ({
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

exports.useFocusableTextField = useFocusableTextField;
//# sourceMappingURL=useFocusableTextField-c18d39c2.js.map
