/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { JSX } from 'preact';
import { BundleType } from '../resources/nls/bundle';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
export type TagItemProps<K> = {
    id: K;
    label: string;
    accessibleLabel?: string;
    value: number;
    fontSize: number;
    role?: HTMLAttributesSignalExcluded['role'];
    itemIdx?: number;
    supportsSelection?: boolean;
    supportsAction?: boolean;
    translations?: BundleType;
    x?: number;
    y?: number;
    w?: number;
    h?: number;
    isHighlighted?: boolean;
    isSelected?: boolean;
    isCurrent?: boolean;
    isFocused?: boolean;
    isReadonly?: boolean;
    class?: string;
    style?: JSX.CSSProperties;
    activeId?: string;
};
declare const TagCloudItem: <K>(props: TagItemProps<K>) => JSX.Element;
export { TagCloudItem };
