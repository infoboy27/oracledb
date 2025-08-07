/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { JSX } from 'preact';
import { Size } from '../utils/UNSAFE_size';
import { styles } from './themes/IconStyle.css';
type IntrinsicProps = JSX.SVGAttributes<SVGSVGElement>;
type Props = Pick<IntrinsicProps, 'viewBox' | 'children'> & {
    /**
     * The size of the component. Defaults to '1em', which means the font size of the parent is used.
     */
    size?: Size;
    /**
     * The color of the component. Defaults to 'currentColor', which behaves like the CSS 'currentColor' value.
     */
    color?: keyof typeof styles;
    /**
     * A label to be used for accessibility purposes.
     */
    accessibleLabel?: string;
};
export declare const Icon: ({ size, color, accessibleLabel, viewBox, children }: Props) => JSX.Element;
export {};
