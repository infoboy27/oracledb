import { ComponentChildren, ComponentProps, Ref } from 'preact';
import { TextFieldContent } from './TextFieldContent';
import { Size } from '../utils/UNSAFE_size';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
import { LayoutColumnSpan } from '../utils/UNSAFE_styles/Layout';
import { type TestIdProps } from "../hooks/UNSAFE_useTestId";
type PickedPropsFromTextFieldContent = Pick<ComponentProps<typeof TextFieldContent>, 'hasZeroStartMargin' | 'contentVariant' | 'startContent' | 'statusVariant' | 'styleVariant' | 'mainContent' | 'endContent' | 'resize'>;
type PickedPropsFromHTMLElement = Pick<HTMLAttributesSignalExcluded<HTMLElement>, 'id'>;
type FocusEvents = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'onFocus' | 'onBlur'>;
type KeyEvents = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'onKeyDown'>;
type MouseEvents = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'onMouseDown' | 'onMouseEnter' | 'onMouseLeave'>;
type LabelProps = {
    label?: ComponentChildren;
    labelEdge?: 'inside' | 'start' | 'top';
    labelStartWidth?: Size;
};
type Props = PickedPropsFromTextFieldContent & PickedPropsFromHTMLElement & FocusEvents & KeyEvents & MouseEvents & LabelProps & TestIdProps & {
    columnSpan?: LayoutColumnSpan;
    compactUserAssistance?: ComponentChildren;
    inlineUserAssistance?: ComponentChildren;
    mainFieldRef?: Ref<HTMLDivElement>;
    rootRef?: Ref<HTMLElement>;
};
export declare const TextField: ({ contentVariant, id, endContent, mainContent, startContent, columnSpan, compactUserAssistance, inlineUserAssistance, label, labelEdge, labelStartWidth, mainFieldRef, resize, statusVariant, styleVariant, hasZeroStartMargin, rootRef, onFocus, onBlur, onKeyDown, onMouseDown, onMouseEnter, onMouseLeave, testId }: Props) => import("preact").JSX.Element;
export {};
