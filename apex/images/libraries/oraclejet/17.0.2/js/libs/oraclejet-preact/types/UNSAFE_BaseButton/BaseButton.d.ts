/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Vers.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren } from 'preact';
import type { DimensionProps } from '../utils/UNSAFE_interpolations/dimensions';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
import { TestIdProps } from '../hooks/UNSAFE_useTestId';
export type ActionDetail = {
    reason: 'pointer' | 'keyboard';
};
type BaseButtonElementDetails = {
    type: 'button';
    isFocusable?: never;
    buttonType?: 'button' | 'submit';
    isLabel?: never;
    isSwitch?: boolean;
} | {
    type: 'a';
    href: string;
    target?: string;
    rel?: string;
    isFocusable?: never;
    isLabel?: never;
    isSwitch?: never;
} | {
    type: 'span';
    isFocusable?: boolean;
    isLabel?: boolean;
    isSwitch?: boolean;
};
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLElement>, 'autofocus' | 'title' | 'onBlur' | 'onFocus' | 'onMouseEnter' | 'onMouseLeave' | 'onTouchEnd' | 'onTouchStart' | 'onKeyDown'>;
export type StylingOptions = 'default' | 'min' | 'embedded' | 'container' | 'unstyled' | 'fill' | 'noBorderRadiusEnd' | 'noBorderRadiusStart' | 'noBorderEnd' | 'noBorderStart' | 'active' | 'selected' | 'buttonSetItem' | 'trailingItem' | 'widthEqual' | 'widthAuto';
type AriaProps = {
    'aria-label'?: string;
    'aria-hidden'?: boolean;
    'aria-expanded'?: boolean;
    'aria-roledescription'?: string;
    'aria-describedby'?: string;
    'aria-haspopup'?: HTMLAttributesSignalExcluded['aria-haspopup'];
    'aria-pressed'?: boolean;
    'aria-checked'?: boolean;
};
export type Props = IntrinsicProps & AriaProps & DimensionProps & TestIdProps & {
    /**
     *The default slot is the button's text label. The oj-c-base-button element accepts plain text or DOM nodes as children for the default slot."
     */
    children?: ComponentChildren;
    /**
     * Specifies that the button element should be disabled.
     */
    isDisabled?: boolean;
    /**
     * Specifies if repeated events are dispatched for key or pointer held down
     */
    isRepeat?: boolean;
    /**
     *
     * Indicates in what states the button has chrome (background and border).
     *     "ghost": "Ghost buttons are the least prominent variation.  Ghost buttons are
     * useful for performing low-priority tasks, such as manipulating the UI.",
     *     "borderless"': "Borderless buttons are a more prominent variation. Borderless
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
    variant?: 'ghost' | 'borderless' | 'outlined' | 'solid' | 'callToAction' | 'danger';
    /**
     * The size indicates how large the button is rendered: 'xs', "sm", "md" (default), "lg".
     */
    size?: 'xs' | 'sm' | 'md' | 'lg';
    /**
     * Edge can be used to specify that the button is intended to go at the bottom of
     * a region, stretching from left to right: "bottom" or "none" (default).
     */
    edge?: 'none' | 'bottom';
    /**
     * Styling can be used for customizing buttons by removing label padding ("min") or
     * removing all styling ("unstyled").
     */
    styling?: StylingOptions[];
    /**
     * Triggered when a button is clicked, whether by keyboard, mouse, or touch events.
     */
    onAction?: (details: ActionDetail) => void;
    /**
     * Indicate element type and associated details
     */
    elementDetails?: BaseButtonElementDetails;
};
export declare const BaseButton: import("preact").FunctionalComponent<import("preact/compat").PropsWithoutRef<Props> & {
    ref?: import("preact").Ref<HTMLSpanElement> | undefined;
}>;
export {};
