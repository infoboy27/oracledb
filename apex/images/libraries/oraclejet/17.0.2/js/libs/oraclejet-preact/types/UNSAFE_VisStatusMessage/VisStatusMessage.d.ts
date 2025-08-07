import { ComponentChildren } from 'preact';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
export type Props = {
    /**
     * The children to put in the grid.
     */
    children: ComponentChildren;
    isSelectable?: false;
    id?: string;
    'aria-label'?: HTMLAttributesSignalExcluded['aria-label'];
    'aria-describedby'?: HTMLAttributesSignalExcluded['aria-describedby'];
    'aria-labelledby'?: HTMLAttributesSignalExcluded['aria-labelledby'];
};
export declare function VisStatusMessage({ children, ...otherProps }: Props): import("preact").JSX.Element;
