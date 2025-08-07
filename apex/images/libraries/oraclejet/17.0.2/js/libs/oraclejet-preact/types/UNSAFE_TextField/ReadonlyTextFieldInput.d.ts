import { ComponentChildren, Ref } from 'preact';
import type { TextProps } from '../utils/UNSAFE_interpolations/text';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type AutoFocusProp = HTMLAttributesSignalExcluded<HTMLInputElement>['autofocus'];
type ReadonlyAsInputProps = {
    as: 'input';
    type: HTMLAttributesSignalExcluded<HTMLInputElement>['type'];
    elementRef?: Ref<HTMLInputElement>;
    rows?: never;
};
type ReadonlyAsTextAreaProps = {
    as: 'textarea';
    elementRef?: Ref<HTMLTextAreaElement | HTMLDivElement>;
    type?: never;
    rows?: number;
};
type ReadonlyAsDivProps = {
    as?: 'div';
    elementRef?: Ref<HTMLTextAreaElement | HTMLDivElement>;
    type?: never;
    rows?: never;
};
type Props = TextProps & (ReadonlyAsDivProps | ReadonlyAsInputProps | ReadonlyAsTextAreaProps) & {
    'aria-describedby'?: string;
    'aria-label'?: string;
    'aria-labelledby'?: string;
    autoFocus?: AutoFocusProp;
    hasEmptyLabel?: boolean;
    hasInsideLabel?: boolean;
    id?: HTMLAttributesSignalExcluded<HTMLElement>['id'];
    inlineUserAssistance?: ComponentChildren;
    innerReadonlyField?: ComponentChildren;
    value?: string;
    variant?: 'textarea';
};
export declare function ReadonlyTextFieldInput({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, 'aria-labelledby': inputLabelledBy, autoFocus, as, elementRef, hasEmptyLabel, hasInsideLabel, inlineUserAssistance, innerReadonlyField, rows, type, value, variant, ...props }: Props): import("preact").JSX.Element;
export {};
