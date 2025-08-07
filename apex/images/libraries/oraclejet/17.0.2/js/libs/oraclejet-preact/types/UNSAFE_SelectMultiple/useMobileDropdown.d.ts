import { Ref } from 'preact/hooks';
import { CurrentKeyDetail, DataState, SelectionDetail } from '../UNSAFE_Collection';
import { ItemTextType } from '../utils/UNSAFE_selectUtils';
import type { UseSelectMultipleProps, useSelectMultiple } from './useSelectMultiple';
type UseSelectMultipleReturn = ReturnType<typeof useSelectMultiple>;
type PickedPropsFromUseSelectMultiple = Pick<UseSelectMultipleReturn, 'isDropdownOpen' | 'isDropdownSelectedOnlyView' | 'setDropdownOpen' | 'setUserInput' | 'stopFiltering' | 'userInput'>;
export type UseMobileDropdownProps<K, D> = PickedPropsFromUseSelectMultiple & {
    data: UseSelectMultipleProps<K, D>['data'];
    inputRef: Ref<HTMLElement>;
    itemText: ItemTextType<K, D>;
    textTagListRef: UseSelectMultipleReturn['textTagListProps']['textTagListRef'];
    valueItems: UseSelectMultipleProps<K, D>['valueItems'];
    onCommit: UseSelectMultipleProps<K, D>['onCommit'];
    onLoadRange: UseSelectMultipleProps<K, D>['onLoadRange'];
};
export declare function useMobileDropdown<K extends string | number, D>({ data, inputRef, isDropdownOpen, isDropdownSelectedOnlyView, itemText, textTagListRef, userInput, valueItems, onCommit, onLoadRange, setDropdownOpen, setUserInput, stopFiltering }: UseMobileDropdownProps<K, D>): {
    collectionProps: {
        currentKey: K | undefined;
        data: DataState<K, D> | null | undefined;
        selectedKeys: Set<K>;
        onCurrentKeyChange: (detail: CurrentKeyDetail<K>) => void;
        onLoadRange: ((range: import("../UNSAFE_Collection").Range) => void) | undefined;
        onSelectionChange: (detail: SelectionDetail<K>) => void;
    };
    footerProps: {
        onApply: () => void;
    };
    selectMultipleFieldInputProps: {
        displayValue: string;
        hasEmptyLabel: boolean;
        hasInsideLabel: boolean;
        inputRef: Ref<HTMLInputElement>;
        isTextTagListShown: boolean;
        isUserFiltering: boolean;
        removeIcon: "always";
        userInput: string | undefined;
        textTagListData: {
            label: string;
            value: K;
        }[];
        textTagListRef: Ref<{
            focus: () => void;
            blur: () => void;
        }>;
        onExitNavigation: () => void;
        onRemove: (keys: K[]) => void;
    };
    selectMultipleFieldProps: {
        hasInsideLabel: boolean;
        isBackButtonShown: boolean;
        isClearButtonShown: boolean;
        isDropdownArrowShown: boolean;
        isDropdownSelectedOnlyView: boolean;
        isSelectedValuesCountShown: boolean;
        selectedValuesCount: number;
        styleVariant: "embedded";
        onBackButtonClick: () => void;
        onClearButtonClick: () => void;
    };
    selectedValuesCountProps: {
        onSelectedValuesCountToggle: (detail: {
            previousValue?: boolean | undefined;
            value?: boolean | undefined;
        }) => void;
    };
    isDropdownSelectedOnlyView: boolean;
};
export {};
