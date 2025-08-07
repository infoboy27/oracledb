/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChild, Ref } from 'preact';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
import type { DimensionProps } from '../utils/UNSAFE_interpolations/dimensions';
import { TestIdProps } from '../hooks/UNSAFE_useTestId';
import type { ButtonIntrinsicProps } from '../utils/UNSAFE_buttonUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLButtonElement>, 'autofocus'>;
type WidthInterpolationProps = Pick<DimensionProps, 'width'>;
/**
 * Note that either an aria-label or tooltip must be specified.
 */
type VariationAccessibleLabelProps = {
    /**
     * aria-label - the aria label
     */
    'aria-label': string;
    /**
     * tooltip - overrides the aria-label for the tooltip
     */
    tooltip?: string;
} | {
    'aria-label'?: string;
    tooltip: string;
};
/**
 * Icon buttons are buttons that only show an icon and no label. They direct users to initiate or take actions and work with a single tap, click, or keystroke.
 */
export declare const IconButton: import("preact").FunctionalComponent<import("preact/compat").PropsWithoutRef<IntrinsicProps & ButtonIntrinsicProps & (Pick<import("preact/compat").PropsWithoutRef<import("../UNSAFE_BaseButton/BaseButton").Props> & {
    ref?: Ref<HTMLSpanElement> | undefined;
}, "aria-haspopup"> & (WidthInterpolationProps & {
    /**
     * Specifies the icon for the button.
     */
    children?: ComponentChild;
    /**
     * Specifies that the button element should be disabled.
     */
    isDisabled?: boolean | undefined;
    /**
     * Specifies if repeated events are dispatched for key or pointer held down
     */
    isRepeat?: boolean | undefined;
    /**
     * Specifes the button type
     */
    type?: "button" | "submit" | undefined;
    /**
     * The ID of an element (or space separated IDs of multiple elements) that
     * describes the button.
     */
    'aria-describedby'?: string | undefined;
    /**
     * Triggered when a button is clicked, whether by keyboard, mouse, or touch events.
     */
    onAction?: (() => void | null) | undefined;
    /**
     * Indicates in what states the button has chrome (background and border).
     *     "ghost": "Ghost buttons are the least prominent variant. Ghost buttons are
     * useful for performing low-priority tasks, such as manipulating the UI.",
     *     "borderless"': "Borderless buttons are a more prominent variant. Borderless
     * buttons are useful for supplemental actions that require minimal emphasis.",
     *     "outlined"': "Outlined buttons are salient, but lighter weight than
     * solid buttons. Outlined buttons are useful for secondary actions.",
     *     "solid"': "Solid buttons stand out, and direct the user's attention to the
     *  most important actions in the UI.",
     *     "callToAction"': "A Call To Action (CTA) button guides the user to take or
     * complete the action that is the main goal of the page or page section. There
     * should only be one CTA button on a page at any given time.",
     *     "danger"': "A Danger button alerts the user to a dangerous situation."
     */
    variant?: "solid" | "danger" | "ghost" | "borderless" | "outlined" | "callToAction" | undefined;
    /**
     * The size indicates how large the button is rendered.
     */
    size?: "xs" | "sm" | "md" | "lg" | undefined;
} & (VariationAccessibleLabelProps & TestIdProps)))> & {
    ref?: Ref<HTMLButtonElement> | undefined;
}>;
export {};
