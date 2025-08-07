/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentChildren } from 'preact';
import { DimensionProps } from '../utils/UNSAFE_interpolations/dimensions';
import { PaddingProps } from '../utils/UNSAFE_interpolations/padding';
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { AriaProps } from '../utils/UNSAFE_interpolations/aria';
type StyleProps = DimensionProps & PaddingProps & ColorProps & AriaProps;
type Props = StyleProps & {
    children?: ComponentChildren;
};
/**
 * A card is a simple container that renders a group of related information in a styled rectangular area.
 * Width, height, padding, and background color are set through props.
 * The aria role for card is normally "group" but this changes to "button" for action cards.
 */
export declare const Card: ({ children, ...rest }: Props) => import("preact").JSX.Element;
export {};
