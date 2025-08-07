/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useContext, useState, useRef, useLayoutEffect, createPortal } from 'preact/compat';
import { L as LayerContext } from './LayerHost-45f545d7.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { styles, baseStyle } from './UNSAFE_Layer/themes/LayerStyles.css.js';
import { u as useThemeInterpolations } from './useThemeInterpolations-9bddc683.js';

const LOGICAL_PARENT = Symbol.for('oj-logical-parent');
const Layer = ({ children, logicalParentRef, priority = 'popup', level = 'nearestAncestor' }) => {
    const context = useContext(LayerContext);
    const [layerContainer, _setLayerContainer] = useState(null);
    const layerContainerRef = useRef(null);
    const setLayerContainer = (elem) => {
        layerContainerRef.current = elem;
        _setLayerContainer(elem);
    };
    // because the children are being rendered into a portal that is out of the flow of parent dom,
    // we need to specify the colorScheme and scale class names here to pick up the correct CSS styles.
    const themeClasses = useThemeInterpolations();
    let priorityStyle = styles.popupPriorityStyle;
    switch (priority) {
        case 'dialog': {
            priorityStyle = styles.dialogPriorityStyle;
            break;
        }
        case 'messages': {
            priorityStyle = styles.messagesPriorityStyle;
            break;
        }
        default: {
            priorityStyle = styles.popupPriorityStyle;
            break;
        }
    }
    const classes = classNames([themeClasses, baseStyle, priorityStyle]);
    // Really need useLayoutEffect instead of useEffect here. Otherwise the re-parented
    // content does not get re-rendered with valid ref's
    useLayoutEffect(() => {
        const host = level === 'topLevel'
            ? context.getRootLayerHost?.(priority)
            : context.getLayerHost?.(priority);
        if (!host)
            return;
        const doc = host.ownerDocument ?? document;
        const layer = doc.createElement('div');
        layer.setAttribute('data-oj-layer', 'true');
        if (logicalParentRef) {
            layer[LOGICAL_PARENT] = logicalParentRef.current;
        }
        // layer.style.position = 'relative';
        host.appendChild(layer);
        setLayerContainer(layer);
        return () => {
            if (host && layer && host.contains(layer)) {
                delete layer[LOGICAL_PARENT];
                host.removeChild(layer);
            }
            if (context.onLayerUnmount) {
                context.onLayerUnmount(layer);
            }
            setLayerContainer(null);
        };
    }, [logicalParentRef, context, level, priority]);
    // add the colorScheme and scale classes if there is a layerContainer
    if (layerContainer) {
        // use the theme interpolations to set the appropriate style classes for colorScheme and scale
        layerContainer.className = classes;
    }
    const getLayerHost = () => {
        return layerContainer;
    };
    let newLayerContext = {};
    if (context.getLayerHost) {
        newLayerContext = {
            getRootLayerHost: context.getRootLayerHost?.bind(null, priority),
            getLayerHost: getLayerHost.bind(null)
        };
    }
    return (jsx(LayerContext.Provider, { value: newLayerContext, children: layerContainer && createPortal(children, layerContainer) }));
};

export { Layer as L, LOGICAL_PARENT as a };
//# sourceMappingURL=Layer-9b06412e.js.map
