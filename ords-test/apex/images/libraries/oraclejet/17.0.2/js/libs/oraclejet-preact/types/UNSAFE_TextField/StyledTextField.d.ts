import { Ref } from 'preact';
import { StyledComponentProps } from '../utils/UNSAFE_typeUtils';
import { LayoutColumnSpan } from '../utils/UNSAFE_styles/Layout';
export type StyleProps = {
    columnSpan?: LayoutColumnSpan;
    hasInsideLabel?: boolean;
    variant?: 'default' | 'embedded';
};
type Props = StyledComponentProps<'div', StyleProps>;
export declare const StyledTextField: import("preact").FunctionalComponent<import("preact/compat").PropsWithoutRef<Props> & {
    ref?: Ref<HTMLElement> | undefined;
}>;
export {};
