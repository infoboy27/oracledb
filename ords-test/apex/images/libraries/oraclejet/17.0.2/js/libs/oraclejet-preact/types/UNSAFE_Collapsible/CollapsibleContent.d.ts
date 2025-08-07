import { JSX } from 'preact';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'children'>;
type ContentProps = IntrinsicProps & {
    id: string;
    isExpanded: boolean;
    onTransitionEnd: () => void;
};
export declare const CollapsibleContent: ({ children, id, isExpanded, onTransitionEnd }: ContentProps) => JSX.Element;
export {};
