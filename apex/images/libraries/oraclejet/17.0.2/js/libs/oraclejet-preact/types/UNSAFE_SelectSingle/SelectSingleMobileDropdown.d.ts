/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { DefaultList, SelectMobileDropdown } from "../PRIVATE_SelectCommon";
import { InlineUserAssistance, UserAssistanceDensityType } from "../UNSAFE_UserAssistance";
import { ComponentProps } from 'preact';
import { SelectSingleFieldInput } from './SelectSingleFieldInput';
import { type UseMobileDropdownProps } from './useMobileDropdown';
type SelectSingleFieldInputProps = ComponentProps<typeof SelectSingleFieldInput>;
type PickedInlineUserAssistanceProps = Pick<ComponentProps<typeof InlineUserAssistance>, 'assistiveText' | 'helpSourceLink' | 'helpSourceText'>;
type PickedSelectSingleFieldInputProps = Pick<ComponentProps<typeof SelectSingleFieldInput>, 'aria-describedby' | 'aria-label' | 'displayValue' | 'isAddToListShown' | 'isAdvancedSearchShown' | 'isRequired' | 'isUserFiltering' | 'placeholder' | 'textAlign' | 'virtualKeyboard'> & {
    onFieldBlur?: ComponentProps<typeof SelectSingleFieldInput>['onBlur'];
    onFieldFocus?: ComponentProps<typeof SelectSingleFieldInput>['onFocus'];
    onFieldInput?: ComponentProps<typeof SelectSingleFieldInput>['onInput'];
    onFieldKeyDown?: ComponentProps<typeof SelectSingleFieldInput>['onKeyDown'];
    onFieldKeyUp?: ComponentProps<typeof SelectSingleFieldInput>['onKeyUp'];
};
type PickedDefaultListProps<K extends string | number, D extends Record<string, any>> = Pick<ComponentProps<typeof DefaultList<K, D>>, 'currentKey' | 'data' | 'itemRenderer' | 'itemText' | 'onCurrentKeyChange' | 'onItemAction' | 'onLoadRange' | 'searchText' | 'selectedKeys'>;
type PickedSelectMobileDropdownProps = Pick<ComponentProps<typeof SelectMobileDropdown>, 'isOpen'>;
type PickedUseMobileDropdownProps<K, D> = Pick<UseMobileDropdownProps<K, D>, 'clearValue' | 'setDropdownOpen' | 'stopFiltering' | 'setUserInput'> & {
    mainFieldInputRef: UseMobileDropdownProps<K, D>['inputRef'];
};
type Props<K extends string | number, D extends Record<string, any>> = PickedDefaultListProps<K, D> & PickedInlineUserAssistanceProps & PickedSelectMobileDropdownProps & PickedSelectSingleFieldInputProps & PickedUseMobileDropdownProps<K, D> & {
    dropdownId: string;
    isEmptyResults: boolean;
    isFocused: boolean;
    isLoading: boolean;
    label: string;
    liveRegionText?: string;
    onAddToListAction?: () => void;
    onAdvancedSearchAction?: () => void;
    propIsLoading?: boolean;
    userAssistanceDensity?: UserAssistanceDensityType;
    userInput?: string;
    virtualKeyboard?: SelectSingleFieldInputProps['virtualKeyboard'];
};
export declare function SelectSingleMobileDropdown<K extends string | number, D extends Record<string, any>>({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, assistiveText, clearValue, currentKey, data, displayValue, dropdownId, helpSourceLink, helpSourceText, isAddToListShown, isAdvancedSearchShown, isEmptyResults, isFocused, isLoading, isOpen, isRequired, isUserFiltering, itemRenderer, itemText, label, liveRegionText, mainFieldInputRef, onAddToListAction, onAdvancedSearchAction, onCurrentKeyChange, onFieldBlur, onFieldFocus, onFieldInput, onFieldKeyDown, onFieldKeyUp, onItemAction, onLoadRange, placeholder, propIsLoading, searchText, selectedKeys, setDropdownOpen, setUserInput, stopFiltering, textAlign, userAssistanceDensity, userInput, virtualKeyboard }: Props<K, D>): import("preact").JSX.Element;
export {};
