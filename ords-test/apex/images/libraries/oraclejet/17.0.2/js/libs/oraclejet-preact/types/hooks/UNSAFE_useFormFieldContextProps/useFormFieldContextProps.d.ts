import { FormFieldContextProps } from '../UNSAFE_useFormFieldContext';
type UseTextFieldProps = {
    hasValue?: boolean;
    isDisabled?: boolean;
    isFocused?: boolean;
    isInputFocused?: boolean;
    isLoading?: boolean;
    isReadonly?: boolean;
};
/**
 * A custom hook to determine props to set FormFieldContext
 */
export declare function useFormFieldContextProps({ hasValue, isDisabled, isFocused, isInputFocused, isLoading, isReadonly }: UseTextFieldProps): FormFieldContextProps;
export {};
