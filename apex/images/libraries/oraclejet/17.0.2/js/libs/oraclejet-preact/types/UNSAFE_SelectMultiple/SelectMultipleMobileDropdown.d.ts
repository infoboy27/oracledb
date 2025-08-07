/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren, ComponentProps } from 'preact';
import { Ref, StateUpdater, Dispatch } from 'preact/hooks';
import { DataState } from '../UNSAFE_Collection';
import { TextFieldInput } from '../UNSAFE_TextField';
import { InlineUserAssistance, UserAssistanceDensityType } from '../UNSAFE_UserAssistance';
import { VirtualizedListView } from '../UNSAFE_VirtualizedListView';
import { Item } from '../utils/UNSAFE_dataProvider';
import { ItemTextType } from '../utils/UNSAFE_selectUtils';
import { Handle } from '../utils/UNSAFE_typeUtils';
import { ValueUpdateDetail } from '../utils/UNSAFE_valueUpdateDetail';
import { ItemRendererProps } from './SelectMultiple.types';
import { SelectMultipleFieldInput } from './SelectMultipleFieldInput';
import { TextTagList } from './TextTagList';
type InlineUserAssistanceProps = ComponentProps<typeof InlineUserAssistance>;
type SelectMultipleFieldInputProps = ComponentProps<typeof SelectMultipleFieldInput>;
type TextFieldInputProps = ComponentProps<typeof TextFieldInput>;
type TextTagListHandle = Handle<typeof TextTagList, 'ref'>;
type Props<K extends string | number, D extends Record<string, any>> = {
    'aria-describedby'?: string;
    'aria-label'?: string;
    assistiveText?: string;
    data?: DataState<K, D> | null;
    dropdownId: string;
    enabledElementRef: Ref<HTMLElement>;
    helpSourceLink?: InlineUserAssistanceProps['helpSourceLink'];
    helpSourceText?: InlineUserAssistanceProps['helpSourceText'];
    isAddToListShown?: boolean;
    isDisabled?: boolean;
    isEmptyResults: boolean;
    isFocused: boolean;
    isLoading: boolean;
    isOpen: boolean;
    isReadonly?: false;
    isRequired?: boolean;
    isSelectedOnlyView: boolean;
    isUserFiltering: boolean;
    itemRenderer?: (itemRendererProps: ItemRendererProps<K, D>) => ComponentChildren;
    itemText: ItemTextType<K, D>;
    label: string;
    liveRegionText?: string;
    placeholder?: TextFieldInputProps['placeholder'];
    propIsLoading?: boolean;
    searchText?: string;
    selectedValuesDescriptionId?: string;
    setDropdownOpen: Dispatch<StateUpdater<boolean>>;
    setUserInput: Dispatch<StateUpdater<string | undefined>>;
    stopFiltering: () => void;
    textAlign?: TextFieldInputProps['textAlign'];
    textTagListRef: Ref<TextTagListHandle>;
    userAssistanceDensity?: UserAssistanceDensityType;
    userInput?: string;
    valueItems?: Item<K, D>[];
    virtualKeyboard?: SelectMultipleFieldInputProps['virtualKeyboard'];
    onAddToListAction?: () => void;
    onCommit: (detail: ValueUpdateDetail<Set<K>>) => void;
    onFieldBlur?: (event: FocusEvent) => void;
    onFieldFocus?: (event: FocusEvent) => void;
    onFieldInput?: SelectMultipleFieldInputProps['onInput'];
    onFieldKeyDown?: SelectMultipleFieldInputProps['onKeyDown'];
    onFieldKeyUp?: SelectMultipleFieldInputProps['onKeyUp'];
    onLoadRange?: ComponentProps<typeof VirtualizedListView>['onLoadRange'];
};
export declare function SelectMultipleMobileDropdown<K extends string | number, D extends Record<string, any>>({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, assistiveText, data, dropdownId, enabledElementRef, helpSourceLink, helpSourceText, isAddToListShown, isDisabled, isEmptyResults, isFocused, isLoading, isOpen, isReadonly, isRequired, isSelectedOnlyView: propIsSelectedOnlyView, isUserFiltering, itemRenderer, itemText, label, liveRegionText, placeholder, propIsLoading, searchText, selectedValuesDescriptionId, setDropdownOpen, setUserInput, stopFiltering, textAlign, textTagListRef, userAssistanceDensity, userInput, valueItems, virtualKeyboard, onAddToListAction, onCommit, onFieldBlur, onFieldFocus, onFieldInput, onFieldKeyDown, onFieldKeyUp, onLoadRange }: Props<K, D>): import("preact").JSX.Element;
export {};
