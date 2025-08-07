/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { DefaultList, Dropdown } from "../PRIVATE_SelectCommon";
import { InlineUserAssistance, UserAssistanceDensityType } from "../UNSAFE_UserAssistance";
import { ComponentProps } from 'preact';
import { Ref } from 'preact/hooks';
type PickedDefaultListProps<K extends string | number, D extends Record<string, any>> = Pick<ComponentProps<typeof DefaultList<K, D>>, 'currentKey' | 'data' | 'itemRenderer' | 'itemText' | 'onCurrentKeyChange' | 'onItemAction' | 'onLoadRange' | 'searchText' | 'selectedKeys'>;
type PickedDropdownProps = Pick<ComponentProps<typeof Dropdown>, 'isOpen' | 'onAutoDismiss' | 'onPosition'>;
type PickedInlineUserAssistanceProps = Pick<ComponentProps<typeof InlineUserAssistance>, 'assistiveText' | 'helpSourceLink' | 'helpSourceText'>;
type Props<K extends string | number, D extends Record<string, any>> = PickedDefaultListProps<K, D> & PickedDropdownProps & PickedInlineUserAssistanceProps & {
    dropdownId: string;
    dropdownRef: Ref<HTMLDivElement>;
    isAddToListShown?: boolean;
    isAdvancedSearchShown: boolean;
    isDisabled?: boolean;
    isDropdownAbove: boolean;
    isEmptyResults: boolean;
    isReadonly?: false;
    isUserFiltering: boolean;
    label: string;
    mainFieldRef: Ref<HTMLDivElement>;
    onAddToListAction?: () => void;
    onAdvancedSearchAction?: () => void;
    userAssistanceDensity?: UserAssistanceDensityType;
};
export declare function SelectSingleDesktopDropdown<K extends string | number, D extends Record<string, any>>({ assistiveText, currentKey, data, dropdownId, dropdownRef, helpSourceLink, helpSourceText, isAddToListShown, isAdvancedSearchShown, isDisabled, isDropdownAbove, isEmptyResults, isOpen, isReadonly, isUserFiltering, itemRenderer, itemText, label, mainFieldRef, onAddToListAction, onAdvancedSearchAction, onAutoDismiss, onCurrentKeyChange, onItemAction, onLoadRange, onPosition, searchText, selectedKeys, userAssistanceDensity }: Props<K, D>): import("preact").JSX.Element;
export {};
