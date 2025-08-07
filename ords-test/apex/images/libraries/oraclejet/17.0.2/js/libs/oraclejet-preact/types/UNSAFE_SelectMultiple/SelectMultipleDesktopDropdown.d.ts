/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren, ComponentProps } from 'preact';
import { Ref } from 'preact/hooks';
import { CurrentKeyDetail, DataState, SelectionDetail } from '../UNSAFE_Collection';
import { InlineUserAssistance, UserAssistanceDensityType } from '../UNSAFE_UserAssistance';
import { PositionData } from '../UNSAFE_Floating';
import { VirtualizedListView } from '../UNSAFE_VirtualizedListView';
import { ItemTextType } from '../utils/UNSAFE_selectUtils';
import { ItemRendererProps } from './SelectMultiple.types';
type InlineUserAssistanceProps = ComponentProps<typeof InlineUserAssistance>;
type Props<K extends string | number, D extends Record<string, any>> = {
    assistiveText?: string;
    currentKey?: K;
    data?: DataState<K, D> | null;
    dropdownId: string;
    dropdownRef: Ref<HTMLDivElement>;
    helpSourceLink?: InlineUserAssistanceProps['helpSourceLink'];
    helpSourceText?: InlineUserAssistanceProps['helpSourceText'];
    isAddToListShown?: boolean;
    isDisabled?: boolean;
    isDropdownAbove: boolean;
    isEmptyResults: boolean;
    isOpen: boolean;
    isReadonly?: false;
    isSelectedOnlyView: boolean;
    isUserFiltering: boolean;
    itemRenderer?: (itemRendererProps: ItemRendererProps<K, D>) => ComponentChildren;
    itemText: ItemTextType<K, D>;
    label: string;
    mainFieldRef: Ref<HTMLDivElement>;
    searchText?: string;
    selectedKeys?: Set<K>;
    userAssistanceDensity?: UserAssistanceDensityType;
    onAddToListAction?: () => void;
    onAutoDismiss: ((event?: Event | undefined) => void) | ((event?: Event | undefined) => void);
    onCurrentKeyChange?: (detail: CurrentKeyDetail<K>) => void;
    onLoadRange?: ComponentProps<typeof VirtualizedListView>['onLoadRange'];
    onPosition: (data: PositionData) => void;
    onSelectionChange?: (detail: SelectionDetail<K>) => void;
};
export declare function SelectMultipleDesktopDropdown<K extends string | number, D extends Record<string, any>>({ assistiveText, currentKey, data, dropdownId, dropdownRef, helpSourceLink, helpSourceText, isAddToListShown, isDisabled, isDropdownAbove, isEmptyResults, isOpen, isReadonly, isSelectedOnlyView, isUserFiltering, itemRenderer, itemText, label, mainFieldRef, searchText, selectedKeys, userAssistanceDensity, onAddToListAction, onAutoDismiss, onCurrentKeyChange, onLoadRange, onPosition, onSelectionChange }: Props<K, D>): import("preact").JSX.Element;
export {};
