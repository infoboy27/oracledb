import { ComponentChildren, Ref } from 'preact';
type VariantProps = {
    variant?: never;
    resize?: never;
} | {
    variant: 'textarea';
    resize?: 'horizontal' | 'vertical' | 'both';
};
type Props = VariantProps & {
    mainContent?: ComponentChildren;
    insideLabel?: ComponentChildren;
    endContent?: ComponentChildren;
    rootRef?: Ref<HTMLDivElement>;
    hasZeroStartMargin?: boolean;
};
export declare const ReadonlyTextFieldContent: ({ variant, insideLabel, mainContent, endContent, rootRef, resize }: Props) => import("preact").JSX.Element;
export type { VariantProps };
