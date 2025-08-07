import { Pan, Zoom, Bounds } from '../diagram.types';
import { Ref } from 'preact/hooks';
import { Property } from 'csstype';
type PanZoomProps = {
    props: Pan & Zoom;
    captureTargetRef: Ref<HTMLDivElement>;
    width: number;
    height: number;
    contentBounds: Bounds;
};
export declare const usePanZoom: ({ props, captureTargetRef, width, height, contentBounds }: PanZoomProps) => {
    panZoomProps: {};
    cursor: Property.Cursor | undefined;
    centerX: number;
    centerY: number;
    zoomValue: number;
    kbPanCallback: ((props: {
        dPan?: {
            dx: number;
            dy: number;
        };
        nPan?: {
            cx: number;
            cy: number;
        };
        center?: boolean;
    }) => void) | undefined;
    kbZoomCallback: ((props: {
        dZoom?: number;
        nZoom?: number;
    }) => void) | undefined;
};
export {};
