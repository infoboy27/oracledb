import { ComponentChildren, Ref } from 'preact';
type VariantProps = {
    contentVariant?: 'input' | 'textarea';
    statusVariant?: 'error' | 'none' | 'warning';
    styleVariant?: 'default' | 'embedded';
};
type Props = VariantProps & {
    mainContent?: ComponentChildren;
    insideLabel?: ComponentChildren;
    startContent?: ComponentChildren;
    endContent?: ComponentChildren;
    resize?: 'horizontal' | 'vertical' | 'both';
    rootRef?: Ref<HTMLDivElement>;
    hasZeroStartMargin?: boolean;
};
export declare const TextFieldContent: ({ contentVariant, insideLabel, mainContent, startContent, statusVariant, styleVariant, endContent, resize, rootRef, hasZeroStartMargin }: Props) => import("preact").JSX.Element;
export {};
