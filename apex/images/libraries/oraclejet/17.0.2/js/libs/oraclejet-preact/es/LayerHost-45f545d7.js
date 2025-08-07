/* @oracle/oraclejet-preact: undefined */
import { createContext } from 'preact';
import { Redwood } from './Common/themes/redwood/theme.js';
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Default environment created for the application
 */
const DefaultEnvironment = {
    user: {
        locale: document.documentElement.getAttribute('lang') || 'en',
        direction: document.documentElement.getAttribute('dir')?.toLowerCase() === 'rtl' ? 'rtl' : 'ltr',
        forcedColors: window.matchMedia?.('(forced-colors: active)')?.matches ? 'active' : 'none'
    },
    theme: Redwood,
    colorScheme: 'light',
    scale: 'lg',
    currentBgColor: undefined,
    mode: 'production',
    density: 'standard'
};
const EnvironmentContext = createContext(DefaultEnvironment);

const LayerContext = createContext({});

const LayerHost = forwardRef((_props, ref) => {
    return jsx("div", { id: "__root_layer_host", ref: ref });
});
LayerHost.displayName = 'Forwarded<LayerHost>';

export { DefaultEnvironment as D, EnvironmentContext as E, LayerContext as L, LayerHost as a };
//# sourceMappingURL=LayerHost-45f545d7.js.map
