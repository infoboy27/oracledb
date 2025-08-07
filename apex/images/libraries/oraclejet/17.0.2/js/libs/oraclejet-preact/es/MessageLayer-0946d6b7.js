/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { F as Flex } from './Flex-24628925.js';
import { W as WindowOverlay } from './WindowOverlay-e14f8324.js';
import { u as useUser } from './useUser-99920e02.js';
import { L as Layer } from './Layer-9b06412e.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';

const positions = [
    'top',
    'top-left',
    'top-right',
    'top-start',
    'top-end',
    'bottom',
    'bottom-left',
    'bottom-right',
    'bottom-start',
    'bottom-end'
];
const MessageLayer = ({ children, offset, testId, position = 'bottom' }) => {
    const side = position.split('-')[0];
    let windowOverlayOffset;
    if (typeof offset === 'number') {
        windowOverlayOffset = { mainAxis: offset, crossAxis: offset };
    }
    else if (side == 'top' || side == 'bottom') {
        windowOverlayOffset = { mainAxis: offset?.vertical, crossAxis: offset?.horizontal };
    }
    else {
        windowOverlayOffset = { mainAxis: offset?.horizontal, crossAxis: offset?.vertical };
    }
    const { direction } = useUser();
    const isLtr = direction === 'ltr';
    let windowOverlayPlacement;
    switch (position) {
        case 'top-left':
            windowOverlayPlacement = isLtr ? 'top-start' : 'top-end';
            break;
        case 'top-right':
            windowOverlayPlacement = isLtr ? 'top-end' : 'top-start';
            break;
        case 'bottom-left':
            windowOverlayPlacement = isLtr ? 'bottom-start' : 'bottom-end';
            break;
        case 'bottom-right':
            windowOverlayPlacement = isLtr ? 'bottom-end' : 'bottom-start';
            break;
        default:
            windowOverlayPlacement = position;
            break;
    }
    return (jsx(Layer, { priority: "messages", level: "topLevel", children: jsx(WindowOverlay, { placement: windowOverlayPlacement, offset: windowOverlayOffset, children: jsx("div", { "data-testid": testId, children: jsx(Flex, { direction: "column", gap: "2x", children: children }) }) }) }));
};

export { MessageLayer as M, positions as p };
//# sourceMappingURL=MessageLayer-0946d6b7.js.map
