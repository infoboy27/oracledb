/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { BarItemData, BarSeriesData, StackLabelContext } from './barChart.types';
import { ColorProps } from '../utils/UNSAFE_interpolations/colors';
import { Info, Scale, Group } from '../utils/UNSAFE_visTypes/chart';
import { Dimension } from '../utils/UNSAFE_visTypes/common';
import { VisTextStyle } from '../utils/UNSAFE_visUtils';
import { Font } from '../hooks/PRIVATE_useTextDimensions';
type BarGroupProps<K, D> = {
    yScale: Scale;
    xScale: Scale;
    colors: ColorProps['color'][];
    series: BarSeriesData<K, D>[];
    group: Group;
    timeAxisType?: 'enabled' | 'skipGaps' | 'mixedFrequency';
    focusedItemInfo?: Info;
    hoveredItemInfo?: Info;
    isSelectionEnabled: boolean;
    selectedIds?: Set<K>;
    hiddenIds?: Set<K>;
    highlightedIds?: Set<K>;
    groupIndex: number;
    barGapRatio: number;
    dataItemGaps: number;
    groupWidth: number;
    isStacked: boolean;
    activeId?: string;
    orientation: 'horizontal' | 'vertical';
    isDrillEnabled: boolean;
    isLog: boolean;
    isRtl: boolean;
    getDataItem: (seriesIndex: number, groupIndex: number) => D | undefined;
    isPointInsideMarquee: ((id: K, point: {
        x: number;
        y: number;
    }) => boolean) | undefined;
    getTextDimensions?: (text: string, style: Font) => Dimension;
    defaultFontSize: string;
    stacklabelStyle?: VisTextStyle;
    getStackLabel?: (context: StackLabelContext<D>) => string;
};
export declare function BarGroup<K extends string | number, D extends BarItemData<K>>({ yScale, xScale, colors, series, groupIndex, hiddenIds, barGapRatio, dataItemGaps, groupWidth, highlightedIds, selectedIds, isPointInsideMarquee, orientation, isLog, activeId, getDataItem, isRtl, isStacked, isSelectionEnabled, focusedItemInfo, hoveredItemInfo, isDrillEnabled, group, timeAxisType, getTextDimensions, defaultFontSize, stacklabelStyle, getStackLabel }: BarGroupProps<K, D>): import("preact").JSX.Element;
export {};
