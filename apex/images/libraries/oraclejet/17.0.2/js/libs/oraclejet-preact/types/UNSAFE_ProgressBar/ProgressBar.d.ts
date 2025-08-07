import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'class'>;
type ProgressBarProps = IntrinsicProps & {
    /**
     * Specifies the id of the progress bar.  If the progress bar is being used to describe the loading process of a particular region
     * of the page, then the aria-describedby attribute of the region must point to the id of the ProgressBar
     */
    id?: HTMLAttributesSignalExcluded<HTMLDivElement>['id'];
    /**
     * The value of the progress bar.  If the value is 'indeterminate', an indeterminate progress bar will be shown.
     */
    value?: 'indeterminate' | number;
    /**
     * Whether the progress bar is positioned at the top edge of a container or not.
     * If set to 'top', the curved borders will be removed.
     */
    edge?: 'none' | 'top';
    /**
     * The maximum value of the progress bar.
     */
    max?: number;
    /**
     * The width of the progress bar.  This will use the CSS lengths styling.
     */
    width?: string;
    /**
     * A label to be used for accessibility purposes when value is set to 'indeterminate'. This will be used for the aria-valuetext of the DOM element.
     */
    'aria-valuetext'?: string;
};
/**
 * A progress bar allows the user to visualize the progression of an extended computer operation.
 */
export declare function ProgressBar({ value, max, ...otherProps }: ProgressBarProps): import("preact").JSX.Element;
export {};
