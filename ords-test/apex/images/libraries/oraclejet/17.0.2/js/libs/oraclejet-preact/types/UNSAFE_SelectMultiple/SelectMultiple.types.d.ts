/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ListItemRendererContext, Metadata } from '../UNSAFE_Collection';
type PickedPropsFromListItemContext<K, D> = Pick<ListItemRendererContext<K, D>, 'data' | 'index' | 'selector'>;
type ItemRendererSelectionDetail<K> = {
    value: Set<K>;
    target: EventTarget | null;
};
type ItemRendererMetadata<K> = Pick<Metadata<K>, 'key' | 'suggestion'>;
export type ItemRendererProps<K, D> = PickedPropsFromListItemContext<K, D> & {
    /**
     * Metadata for the item.
     */
    metadata: ItemRendererMetadata<K>;
    /**
     * User-entered search text.
     * This property will be undefined for the default, unfiltered list.
     */
    searchText?: string;
    /**
     * The selected keys in the dropdown.
     * This property will be undefined when nothing is selected.
     */
    selectedKeys?: Set<K>;
    /**
     * Callback function to trigger when the selection changes
     *
     * @param detail The selection change details
     */
    onSelectionChange: (detail: ItemRendererSelectionDetail<K>) => void;
};
export {};
