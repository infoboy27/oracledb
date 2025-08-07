/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentProps } from 'preact';
import { Ref } from 'preact/hooks';
import { DataState, ItemActionDetail } from '../UNSAFE_Collection';
import { Item } from '../utils/UNSAFE_dataProvider';
import { ValueUpdateDetail } from '../utils/UNSAFE_valueUpdateDetail';
import { SelectSingle } from './SelectSingle';
type PickedPropsFromSelectSingle = Pick<ComponentProps<typeof SelectSingle>, 'addToList' | 'advancedSearch' | 'isDisabled' | 'isReadonly' | 'onAddToListAction' | 'onAdvancedSearchAction' | 'onFilter'>;
type UseSelectSingleProps<K, D> = PickedPropsFromSelectSingle & {
    data?: DataState<K, D> | null;
    inputRef: Ref<HTMLInputElement>;
    isFocused?: boolean;
    onCommit: (detail: ValueUpdateDetail<K>) => void;
    valueItem?: Item<K, D>;
};
/**
 * Hook that manages SelectSingle state and behavior.  This hook creates state variables and
 * event listeners, returning properties to apply to components internally rendered by
 * SelectSingle, as well as state information.
 *
 * @param data Specifies data for the dropdown list.
 * @param inputRef Ref to the input element.
 * @param isDisabled Specifies whether the component is disabled.
 * @param isFocused Specifies whether the component has focus.
 * @param isReadonly Specifies whether the component is readonly.
 * @param onCommit Callback invoked when the selected value is committed.
 * @param onFilter Callback function to trigger loading data for the dropdown list,
 * which may or may not be filtered by user entered text.
 * @param valueItem Specifies the key, data, and optional metadata for the selected value.
 *
 * @returns Properties to apply to internal components that SelectSingle renders, and component
 * state.
 */
export declare function useSelectSingle<K, D>({ addToList, advancedSearch, data, inputRef, isDisabled, isFocused: propIsFocused, isReadonly, onAddToListAction, onAdvancedSearchAction, onCommit: propOnCommit, onFilter, valueItem }: UseSelectSingleProps<K, D>): {
    addToListEventHandlers: {
        onAction: () => void;
    };
    advancedSearchEventHandlers: {
        onAction: () => void;
    };
    collectionProps: {
        currentKey: K | undefined;
        onCurrentKeyChange: (detail: import("../UNSAFE_Collection").CurrentKeyDetail<K>) => void;
        onItemAction: (detail: ItemActionDetail<K, D>) => void;
        selectedKeys: Set<K> | undefined;
    };
    dropdownArrowEventHandlers: {
        onClick: () => void;
    };
    clearValue: (shouldCloseDropdown?: boolean) => void;
    dropdownEventHandlers: {
        onAutoDismiss: ((event?: Event | undefined) => void) | ((event?: Event) => void);
        onPosition: (data: import("../UNSAFE_Floating").PositionData) => void;
    };
    dropdownRef: Ref<HTMLDivElement>;
    inputEventHandlers: {
        onInput: (detail: ValueUpdateDetail<string>) => void;
        onKeyDown: ((event: KeyboardEvent) => void) | ((event: KeyboardEvent) => void);
        onKeyUp: (event: KeyboardEvent) => void;
    };
    inputRef: Ref<HTMLInputElement>;
    isAddToListShown: boolean;
    isAdvancedSearchShown: boolean;
    isDataFetched: boolean;
    isDropdownAbove: boolean;
    isDropdownOpen: boolean;
    isEmptyResults: boolean;
    isFocused: boolean;
    isUserFiltering: boolean;
    mainFieldRef: Ref<HTMLDivElement>;
    mouseProps: {
        onMouseDown?: undefined;
    } | {
        onMouseDown: (event: MouseEvent) => void;
    };
    searchText: string | undefined;
    setDropdownOpen: import("preact/hooks").Dispatch<import("preact/hooks").StateUpdater<boolean>>;
    setUserInput: import("preact/hooks").Dispatch<import("preact/hooks").StateUpdater<string | undefined>>;
    stopFiltering: () => void;
    textFieldRef: import("preact/hooks").MutableRef<HTMLElement | undefined>;
    userInput: string | undefined;
};
export {};
