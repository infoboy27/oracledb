/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChild } from 'preact';
import { TestIdProps } from '../UNSAFE_useTestId';
export declare const positions: readonly ["start", "top-start", "top", "top-end", "end", "bottom-end", "bottom", "bottom-start"];
type Position = (typeof positions)[number];
export declare const anchorTos: readonly ["element", "pointer"];
type AnchorTo = (typeof anchorTos)[number];
type AnchorModel = {
    x: AnchorTo;
    y: AnchorTo;
};
type Props = {
    text?: string;
    variant?: 'tooltip' | 'datatip';
    isOpen: boolean;
    position?: Position;
    isDisabled?: boolean;
    focusStrategy?: 'browser' | 'logical';
    anchor?: AnchorModel;
    offset?: {
        mainAxis?: number;
        crossAxis?: number;
    };
    onToggle?: (details: {
        value: boolean;
    }) => void;
} & TestIdProps;
export declare const useTooltipControlled: ({ text, isOpen, variant, position, focusStrategy, isDisabled, anchor, offset, onToggle, testId }: Props) => {
    tooltipContent: ComponentChild;
    tooltipProps: Record<string, any>;
};
export {};
