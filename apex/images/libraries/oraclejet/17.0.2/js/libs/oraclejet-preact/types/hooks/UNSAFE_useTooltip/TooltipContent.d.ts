import { HTMLAttributesSignalExcluded } from '../../utils/UNSAFE_attributeUtils';
import { TestIdProps } from '../UNSAFE_useTestId';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'children'>;
type ContentProps = IntrinsicProps & {
    id: string;
    isOpen: boolean;
    isDatatip: boolean;
    onTransitionEnd: () => void;
} & TestIdProps;
export declare const TooltipContent: ({ children, id, isOpen, isDatatip, onTransitionEnd, testId, ...props }: ContentProps) => import("preact").JSX.Element;
export {};
