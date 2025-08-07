import { Ref } from 'preact';
import { useFocusWithin } from '../UNSAFE_useFocusWithin';
export type FocusableHandle = {
    focus: () => void;
    blur: () => void;
};
type UseFocusWithinProps = Parameters<typeof useFocusWithin>[0];
type UseFocusableTextFieldProps = UseFocusWithinProps & {
    /**
     * flag indicating whether the field is readonly
     */
    isReadonly?: boolean;
    /**
     * An optional ref to add imperative handles
     */
    ref?: Ref<FocusableHandle>;
};
/**
 * A custom hook that handles the focus when the text field
 * is toggled between readonly and enabled
 * @typedef E represents the type of the enabled element
 * @typedef R represents the type of the readonly element
 */
export declare function useFocusableTextField<E extends HTMLElement, R extends HTMLElement>({ isReadonly, ref, ...useFocusWithinProps }: UseFocusableTextFieldProps): {
    enabledElementRef: import("preact/hooks").Ref<E>;
    readonlyElementRef: import("preact/hooks").Ref<R>;
    isFocused: boolean;
    focusProps: {
        onFocusIn?: undefined;
        onFocusOut?: undefined;
    } | {
        onFocusIn: (event: FocusEvent) => void;
        onFocusOut: (event: FocusEvent) => void;
    };
};
export {};
