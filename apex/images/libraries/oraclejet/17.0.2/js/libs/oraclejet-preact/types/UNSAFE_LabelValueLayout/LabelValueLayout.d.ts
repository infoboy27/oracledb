import { ComponentChildren, JSX } from 'preact';
import { Size } from '../utils/UNSAFE_size';
type TextFieldProps = {
    /**
     * Defines how the label is going to be positioned. For a TextField only the start and top values are allowed.
     */
    labelEdge?: 'start' | 'top';
    parentComponentVariant?: 'textField' | 'textArea';
};
type CheckboxRadioSetProps = {
    /**
     * Defines how the label is going to be positioned. For CheckboxSet or RadioSet the start, top and inside values are supported.
     */
    labelEdge?: 'start' | 'top' | 'inside';
    parentComponentVariant: 'radioSet' | 'checkboxSet';
};
type Props = (TextFieldProps | CheckboxRadioSetProps) & {
    /**
     * Label content of the layout
     */
    label?: ComponentChildren;
    /**
     * Defines the label width for labelEdge 'start' ('top' is always 100%)
     */
    labelStartWidth?: Size;
    /**
     * Value content of the layout
     */
    children: ComponentChildren;
    hasTopUserAssistance?: boolean;
};
export declare const LabelValueLayout: ({ label, labelEdge, children, labelStartWidth, parentComponentVariant, hasTopUserAssistance }: Props) => JSX.Element;
export {};
