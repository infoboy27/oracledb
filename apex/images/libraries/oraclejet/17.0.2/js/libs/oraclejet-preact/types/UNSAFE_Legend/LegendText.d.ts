/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { Property } from 'csstype';
type LegendTextProps = {
    text: string;
    type: 'label' | 'title';
    fontStyle?: Property.FontStyle;
    fontSize?: Property.FontSize;
    fontWeight?: Property.FontWeight;
    textDecoration?: Property.TextDecoration;
    color?: Property.Color;
    fontFamily?: Property.FontFamily;
    id?: string;
    align?: 'start' | 'center' | 'end';
};
/**
 * Returns the legend text component.
 */
export declare const LegendText: ({ text, type, id, align, ...props }: LegendTextProps) => import("preact").JSX.Element;
export {};
