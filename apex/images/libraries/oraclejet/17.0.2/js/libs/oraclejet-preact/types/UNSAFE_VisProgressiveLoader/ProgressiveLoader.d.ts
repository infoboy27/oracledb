/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren } from 'preact';
import { HTMLAttributesSignalExcluded } from "../utils/UNSAFE_attributeUtils";
import { Size } from "../utils/UNSAFE_size";
type Props = {
    /**
     * Specifies whether the main content is currently loading.
     * The fallback content will be shown if the main content is taking too long to load.
     */
    isLoading: boolean;
    /**
     * The content to be shown when loading.
     */
    fallback: ComponentChildren;
    /**
     * The main content to be shown when not loading.
     */
    children: ComponentChildren;
    /**
     * The role.
     */
    role?: HTMLAttributesSignalExcluded['role'];
    /**
     * The tabIndex.
     */
    tabIndex?: HTMLAttributesSignalExcluded['tabIndex'];
    /**
     * The width of the component.
     */
    width?: Size;
    /**
     * The height of the component.
     */
    height?: Size;
    /**
     * The aria-label of the component.
     * This will be used for the aria-label of the DOM element.
     */
    'aria-label'?: HTMLAttributesSignalExcluded['aria-label'];
    /**
     * One or more ids (separated by spaces) of elements that describe the component.
     * This will be used for the aria-describedby of the DOM element.
     */
    'aria-describedby'?: HTMLAttributesSignalExcluded['aria-describedby'];
    /**
     * One or more ids (separated by spaces) of elements that label the component.
     * This will be used for the aria-labelledby of the DOM element.
     */
    'aria-labelledby'?: HTMLAttributesSignalExcluded['aria-labelledby'];
};
/**
 * Displays the specified fallback content during progressive loading of the main content.
 */
export declare function ProgressiveLoader({ isLoading, fallback, children, role, tabIndex, width, height, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy }: Props): import("preact").JSX.Element;
export {};
