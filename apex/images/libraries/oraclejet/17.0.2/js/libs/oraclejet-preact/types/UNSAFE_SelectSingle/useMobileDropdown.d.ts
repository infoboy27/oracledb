import type { useSelectSingle } from './useSelectSingle';
type PickedPropsFromUseSelectSingle<K, D> = Pick<ReturnType<typeof useSelectSingle<K, D>>, 'clearValue' | 'inputRef' | 'isDropdownOpen' | 'setDropdownOpen' | 'setUserInput' | 'stopFiltering' | 'userInput'>;
export type UseMobileDropdownProps<K, D> = PickedPropsFromUseSelectSingle<K, D> & {
    displayValue: string;
};
export declare function useMobileDropdown<K extends string | number, D>({ clearValue, displayValue, inputRef, isDropdownOpen, userInput, setDropdownOpen, stopFiltering, setUserInput }: UseMobileDropdownProps<K, D>): {
    selectSingleFieldInputProps: {
        displayValue: string;
        hasEmptyLabel: boolean;
        hasInsideLabel: boolean;
        inputRef: import("preact/hooks").Ref<HTMLInputElement>;
        isUserFiltering: boolean;
        removeIcon: "always";
        userInput: string | undefined;
    };
    selectSingleFieldProps: {
        hasInsideLabel: boolean;
        isBackButtonShown: boolean;
        isClearButtonShown: boolean;
        isDropdownArrowShown: boolean;
        styleVariant: "embedded";
        onBackButtonClick: () => void;
        onClearButtonClick: () => void;
    };
};
export {};
