/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { useState, useCallback } from 'preact/compat';
import { L as LayerContext, a as LayerHost } from './LayerHost-45f545d7.js';

function LayerManager({ children }) {
    const [defaultHost, setDefaultHost] = useState();
    //const context = useContext(LayerContext);
    const defaultHostRef = useCallback((el) => {
        // ref callbacks fire after the component has been unnmounted so we do not
        // want to set state in this use-case
        if (el !== null) {
            setDefaultHost(el);
        }
    }, []);
    return (jsx(LayerContext.Consumer, { children: (value) => {
            let defaultHostContext = {};
            if (defaultHost) {
                defaultHostContext = {
                    getRootLayerHost: () => {
                        return defaultHost;
                    },
                    getLayerHost: () => {
                        return defaultHost;
                    }
                };
            }
            const layerContext = value.getLayerHost ? value : defaultHostContext;
            return (jsxs(LayerContext.Provider, { value: layerContext, children: [children, !value.getLayerHost && jsx(LayerHost, { ref: defaultHostRef })] }));
        } }));
}

export { LayerManager as L };
//# sourceMappingURL=LayerManager-625d2503.js.map
