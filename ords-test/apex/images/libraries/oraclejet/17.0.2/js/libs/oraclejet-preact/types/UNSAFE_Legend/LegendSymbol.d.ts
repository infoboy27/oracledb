import { Property } from 'csstype';
import { SymbolProps } from '../utils/UNSAFE_visTypes/legend';
type LegendSymbolProps = {
    isHidden?: boolean;
    lineLength?: number;
    width?: Property.Width;
    height?: Property.Height;
    borderColor?: Property.Color;
} & SymbolProps;
export declare const LegendSymbol: ({ markerColor, lineColor, markerShape, isHidden, lineStyle, ...props }: LegendSymbolProps) => import("preact").JSX.Element;
export {};
