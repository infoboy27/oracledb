/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var LayerHost = require('./LayerHost-46e4d858.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_Layer_themes_LayerStyles_css = require('./UNSAFE_Layer/themes/LayerStyles.css.js');
var useThemeInterpolations = require('./useThemeInterpolations-25313f34.js');

const LOGICAL_PARENT = Symbol.for('oj-logical-parent');
const Layer = ({ children, logicalParentRef, priority = 'popup', level = 'nearestAncestor' }) => {
    const context = compat.useContext(LayerHost.LayerContext);
    const [layerContainer, _setLayerContainer] = compat.useState(null);
    const layerContainerRef = compat.useRef(null);
    const setLayerContainer = (elem) => {
        layerContainerRef.current = elem;
        _setLayerContainer(elem);
    };
    // because the children are being rendered into a portal that is out of the flow of parent dom,
    // we need to specify the colorScheme and scale class names here to pick up the correct CSS styles.
    const themeClasses = useThemeInterpolations.useThemeInterpolations();
    let priorityStyle = UNSAFE_Layer_themes_LayerStyles_css.styles.popupPriorityStyle;
    switch (priority) {
        case 'dialog': {
            priorityStyle = UNSAFE_Layer_themes_LayerStyles_css.styles.dialogPriorityStyle;
            break;
        }
        case 'messages': {
            priorityStyle = UNSAFE_Layer_themes_LayerStyles_css.styles.messagesPriorityStyle;
            break;
        }
        default: {
            priorityStyle = UNSAFE_Layer_themes_LayerStyles_css.styles.popupPriorityStyle;
            break;
        }
    }
    const classes = classNames.classNames([themeClasses, UNSAFE_Layer_themes_LayerStyles_css.baseStyle, priorityStyle]);
    // Really need useLayoutEffect instead of useEffect here. Otherwise the re-parented
    // content does not get re-rendered with valid ref's
    compat.useLayoutEffect(() => {
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
    return (jsxRuntime.jsx(LayerHost.LayerContext.Provider, { value: newLayerContext, children: layerContainer && compat.createPortal(children, layerContainer) }));
};

exports.LOGICAL_PARENT = LOGICAL_PARENT;
exports.Layer = Layer;
//# sourceMappingURL=Layer-3700cd37.js.map
