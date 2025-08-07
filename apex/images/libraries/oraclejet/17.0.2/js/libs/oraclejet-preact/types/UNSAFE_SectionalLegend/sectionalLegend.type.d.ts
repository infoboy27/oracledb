/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { CommonProps, LegendItemData, LegendSectionData } from '../utils/UNSAFE_visTypes/legend';
import { Property } from 'csstype';
/**
 * Props for legend section.
 */
export type SectionalLegendProps<K extends string | number, D extends LegendItemData<K>, S extends LegendSectionData<K, D>> = CommonProps<K, D> & SectionTitleStylesProps & {
    sections: S[];
};
/**
 * Props for legend text styles. Remove this when theming is available.
 */
export type SectionTitleStylesProps = {
    /**
     * The font style of the legend section title.
     */
    sectionTitleFontStyle?: Property.FontStyle;
    /**
     * The font size of the legend section title.
     */
    sectionTitleFontSize?: Property.FontSize;
    /**
     * The color of the legend section title.
     */
    sectionTitleColor?: Property.Color;
    /**
     * The font weight of the legend section title.
     */
    sectionTitleFontWeight?: Property.FontWeight;
    /**
     * The text decoration of the legend section title.
     */
    sectionTitleTextDecoration?: Property.TextDecoration;
    /**
     * The font family of the legend section title.
     */
    sectionTitleFontFamily?: Property.FontFamily;
    /**
     * The halign for the legend section title.
     */
    sectionTitleHAlign?: 'start' | 'center' | 'end';
};
