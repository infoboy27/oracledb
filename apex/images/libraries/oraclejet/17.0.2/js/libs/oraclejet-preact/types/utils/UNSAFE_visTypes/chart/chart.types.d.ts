/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { DataAxisProps, Group, GroupAxisProps, TimeAxisProps } from '.';
import { ComponentChildren } from 'preact';
import { ChartPlotArea } from './plotArea.types';
import { DataCursorProps } from './dataCursor.types';
import type { TestIdProps } from '../../../hooks/UNSAFE_useTestId';
import { Property } from 'csstype';
import { ContextMenuConfig } from '../common';
import { VisTextStyle } from "../../UNSAFE_visUtils";
import { Size } from '../../UNSAFE_size';
import { Dimension } from '../common';
export type ChartGroupInfo = {
    groupIndex: number;
    isCurrent?: boolean;
    isFocusVisible?: boolean;
};
export type Info = {
    seriesIndex?: number;
} & Partial<ChartGroupInfo>;
export type ChartContextMenuConfig<K, D> = ContextMenuConfig<ChartContextMenuContext<K, D>>;
export type ChartContextMenuContext<K, D> = {
    type: 'item';
    groupIndex: number;
    seriesIndex: number;
    data: D;
} | {
    type: 'series';
    data: ChartSeriesData<K, D>;
} | {
    type: 'axisTitle';
    axis: 'x' | 'y';
} | {
    type: 'xAxisTickLabel';
    data: Group;
} | {
    type: 'background';
};
export type ItemInfo = Required<Pick<Info, 'seriesIndex' | 'groupIndex'>>;
export type AxisPosition = 'start' | 'end' | 'top' | 'bottom';
export type ViewportDetail = {
    /**
     * The viewport min of the x axis.
     */
    xMin?: number;
    /**
     * The viewport max of the x axis.
     */
    xMax?: number;
    /**
     * The viewport min of the y axis.
     */
    yMin?: number;
    /**
     * The viewport max of the y axis.
     */
    yMax?: number;
};
export type ItemDetail<K, D> = {
    /**
     * The group index of the given item.
     */
    groupIndex: number;
    /**
     * The series index of the given item.
     */
    seriesIndex: number;
    /**
     * The id of the given item.
     */
    id: K;
    /**
     * The data item.
     */
    data: D;
};
export type GroupDetail = {
    /**
     * The index of the group in the groups array.
     */
    groupIndex: number;
    /**
     * The id of the group.
     */
    id: string | number;
    /**
     * The group data.
     */
    group: Group;
};
export type SelectionProps<K, D> = {
    /**
     * An array used to define the ids of the initially selected objects.
     */
    selectedIds?: K[];
    /**
     * The type of selection behavior that is enabled on the chart.
     * If single or multiple is specified, selection gestures will be enabled, and the chart's selection styling will be applied to all items specified by the selection attribute.
     * If none is specified, selection gestures will be disabled, and the chart's selection styling will not be applied to any items specified by the selection attribute.
     */
    selectionMode?: 'single' | 'multiple' | 'none';
    /**
     * The callback to be fired when chart selection is changed. selection prop should be updated by this function.
     */
    onSelectionChange?: (detail: {
        ids: K[];
        data: (D | undefined)[];
    }) => void;
};
export type DrillProps<K, D> = {
    /**
     * Triggered on a chart item (double click if selection is enabled, single click otherwise).
     */
    onItemDrill?: (detail: ItemDetail<K, D>) => void;
    /**
     * Triggered on a chart group drill gesture (double click if selection is enabled, single click otherwise).
     */
    onGroupDrill?: (detail: GroupDetail) => void;
    /**
     * Whether drilling is enabled.
     * Drillable objects will show a pointer cursor on hover and fire an onItemDrill or onGroupDrill event on click (double click if selection is enabled).
     * Use "on" to enable drilling for all group objects (x-axis labels) and data items such as bars, area and marker.
     * To enable or disable drilling on group or data item use the drilling attribute in each series, group, or data item.
     */
    drilling?: 'on' | 'off' | 'groupsOnly';
};
export type TextValueFormat = {
    /**
     * Whether the string is displayed in the tooltip.
     */
    isDisplayed?: boolean;
    /**
     * A string representing the label that is displayed before the value in the tooltip.
     */
    label?: string;
};
export type NumericalValueFormat = {
    /**
     * Whether the value is displayed in the tooltip.
     */
    isDisplayed?: boolean;
    /**
     * A string representing the label that is displayed before the value in the tooltip.
     */
    label?: string;
    /**
     * The function called to get the formatted value.
     */
    format?: (value: number) => string;
};
export type ValueFormats = {
    /**
     * Object that specifies the value formatting and tooltip behavior for the group.
     */
    group?: TextValueFormat;
    /**
     * Object that specifies the value formatting and tooltip behavior for the series.
     */
    series?: TextValueFormat;
    /**
     * Object that specifies the value formatting and tooltip behavior for the item value.
     */
    value?: NumericalValueFormat;
};
export type ChartItemData<K> = {
    /**
     * The  color of the bar item.
     */
    color?: Property.BorderColor;
    /**
     * The border color of the bar item.
     */
    borderColor?: Property.BorderColor;
    /**
     * The label to be used for accessibility purposes.
     */
    accessibleLabel?: string;
    /**
     * The value of the data item. If undefined data item will not be rendered.
     */
    value: number;
    /**
     * Defines the label for the data item.
     */
    label?: string;
    /**
     * Defines the label style for the data item.
     */
    labelStyle?: VisTextStyle;
    /**
     * The id of the data item.
     */
    id: K;
    /**
     * The x value of the data item.
     */
    x?: string;
    /**
     * Whether the item is drillable or not.
     */
    drilling?: 'on' | 'off' | 'inherit';
};
export type ChartSeriesData<K, D> = {
    /**
     * The id of the series.
     */
    id: K;
    /**
     * The name of the series.
     */
    name?: string;
    /**
     * The color of the items of the series.
     */
    color?: Property.BorderColor;
    /**
     * The border color of the items of the series.
     */
    borderColor?: Property.BorderColor;
    /**
     * The label to be used for accessibility purposes.
     */
    accessibleLabel?: string;
    /**
     * The items present in the series.
     */
    items: D[];
};
export type ChartCommonProps<K, D> = {
    /**
     * Defines the hide and show behavior. When data items are hidden, the y axes can be optionally rescaled to fit to the remaining data.
     */
    hideAndShowBehavior?: 'withoutRescale' | 'withRescale' | 'none';
    /**
     * The ids of the hidden items.
     */
    hiddenIds?: K[];
    /**
     * An array of ids used for highlighting. Series or data items matching the ids in the array will be highlighted.
     */
    highlightedIds?: K[];
    /**
     * The orientation of the chart.
     */
    orientation?: 'vertical' | 'horizontal';
    /**
     * The width of the chart. The default value for this is theme driven.
     */
    width?: Size;
    /**
     * Defines the behavior applied when hovering over data items.
     * When hover behavior is set to dim, it will dim all other data items except the one being hovered.
     */
    hoverBehavior?: 'dim' | 'none';
    /**
     * The action that is performed when a drag occurs on the chart. Pan and marquee zoom are only available if zoom and scroll is turned on.
     * Marquee select is only available if multiple selection is turned on. If the value is set to "user" and multiple actions are available,
     * buttons will be displayed on the plot area to let users switch between modes. Only 'select' and 'pan' buttons are showed in mobile, as
     * zoom in or out can be performed with 2 finger pinch gesture.
     */
    dragMode?: 'user' | 'zoom' | 'select' | 'pan' | 'off';
    /**
     * The viewport change callback. This callback should update the xAxis and yAxis viewport props.
     */
    onViewportChange?: (detail: ViewportDetail) => void;
    /**
     * Triggered when item is hovered or looses hover.
     */
    onItemHover?: (detail: {
        seriesIndex?: number;
        groupIndex?: number;
    }) => void;
    /**
     * Triggered when item is is keyboard focused or looses focus
     */
    onItemFocus?: (detail: {
        seriesIndex?: number;
        groupIndex?: number;
    }) => void;
    /**
     * The function called to get the data item for given seriesIndex and groupIndex. With this callback, data items are not bound to particular
     * series or groups data structure.
     */
    getDataItem: (seriesIndex: number, groupIndex: number) => D | undefined;
    /**
     * The height of the chart. The default value for this is theme driven.
     */
    height?: Size;
    /**
     * An object defining properties for the yAxis, tick marks, tick labels, and axis titles.
     */
    yAxis?: DataAxisProps;
    /**
     * An object defining properties for the xAxis, tick marks, tick labels, and axis titles.
     */
    xAxis?: GroupAxisProps | TimeAxisProps;
    /**
     * An array of groups identifying the group labels.
     */
    groups: Group[];
    /**
     * Whether the chart is stacked or not.
     */
    isStacked?: boolean;
    /**
     * The function that returns datatip for the given item context.
     */
    datatip?: (detail: ItemDetail<K, D>) => {
        content: ComponentChildren;
        borderColor?: Property.BorderColor;
    };
    /**
     * Configuration used to specity a context menu.
     */
    contextMenuConfig?: ChartContextMenuConfig<K, D>;
    /**
     * The plot area of the chart.
     */
    plotArea?: ChartPlotArea;
    /**
     * Specifies the zoom and scroll behavior of the chart. "live" behavior means that the chart will be updated continuously as it is being manipulated.
     */
    zoomAndScroll?: 'live' | 'off';
    /**
     * An object specifying value formatting and tooltip behavior, whose keys generally correspond to the attribute names on the data items.
     */
    valueFormats?: ValueFormats;
    /**
     * The aria label of the chart.
     */
    'aria-label'?: string;
    /**
     * One or more ids (separated by spaces) of elements that label the chart. This will be used for the aria-labelledby of the DOM element.
     */
    'aria-labelledby'?: string;
    /**
     * One or more ids (separated by spaces) of elements that describe the chart. This will be used for the aria-describedby of the DOM element.
     */
    'aria-describedby'?: string;
} & TestIdProps & DataCursorProps & SelectionProps<K, D> & DrillProps<K, D>;
export type GetNextChartItemType = (info: Info, key: 'ArrowUp' | 'ArrowDown' | 'ArrowRight' | 'ArrowLeft') => Info;
export type getDataPosType = (seriesIndex: number, groupIndex: number) => Dimension | undefined;
export type Scale = {
    transform: (value: number) => number;
    invert: (value: number) => number;
    range: () => number[];
    domain: () => number[];
};
