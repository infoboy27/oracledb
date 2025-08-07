/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentProps } from 'preact';
import { Ref } from 'preact/hooks';
import { AriaAttributesSignalExcluded, HTMLAttributesSignalExcluded } from "../utils/UNSAFE_attributeUtils";
import { DateSegmentState } from './useDateField';
import { InputDateMask } from './InputDateMask';
import type { DatePlaceholders, EditableDateSegment } from './types';
type InputDateMaskProps = ComponentProps<typeof InputDateMask>;
type AriaProps = Pick<AriaAttributesSignalExcluded, 'aria-describedby' | 'aria-invalid' | 'aria-label' | 'aria-labelledby'>;
type HTMLElementProps = Pick<HTMLAttributesSignalExcluded<HTMLElement>, 'onBlur' | 'onFocus'>;
export type Props = AriaProps & HTMLElementProps & {
    /**
     * A base id prefix.
     */
    baseId: string;
    /**
     * A ref to the element that receives focus when the field's label is clicked,
     * or when the component is toggled between readonly and enabled. This is the
     * first segment in the field.
     */
    fieldRef?: Ref<HTMLDivElement>;
    /**
     * Specifies the smallest date unit that is displayed by the component.
     * If set to month, only month and year are shown.
     * If set to day then month, day, and year are shown.
     */
    granularity?: InputDateMaskProps['granularity'];
    /**
     * True if the component has an inside label.
     */
    hasInsideLabel?: boolean;
    /**
     * Specifies for accessibility purposes whether a value is required.
     */
    isRequired?: InputDateMaskProps['isRequired'];
    /**
     * The placeholder masks used by the date field.
     */
    masks: DatePlaceholders;
    /**
     * Specifies how to align text within the field.
     */
    textAlign?: InputDateMaskProps['textAlign'];
    /**
     * The current display value of the component.
     */
    value?: InputDateMaskProps['value'];
    /**
     * The style variant of the component.
     */
    variant?: InputDateMaskProps['variant'];
    /**
     * Callback invoked each time the user changes the value of a segment For example, if the user
     * types '12' into the month segment, this callback will be called twice to change the month
     * first to '1' and then '12'.
     */
    onInput: InputDateMaskProps['onInput'];
    /**
     * Callback invoked when the user commits the entered value by blurring or hitting the enter key.
     */
    onCommit: InputDateMaskProps['onCommit'];
};
declare const findSegment: (segments: DateSegmentState[], type: EditableDateSegment) => DateSegmentState;
/**
 * Container for Segment children that represent different parts of a date with no time.
 */
declare const DateField: ({ "aria-describedby": describedBy, "aria-invalid": ariaInvalid, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, baseId, fieldRef, granularity, hasInsideLabel, isRequired, masks: dateMasks, onBlur, onCommit, onFocus, onInput, textAlign, value, variant }: Props) => import("preact").JSX.Element;
export { DateField, findSegment };
