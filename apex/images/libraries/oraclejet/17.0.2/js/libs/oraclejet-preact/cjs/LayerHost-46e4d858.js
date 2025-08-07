/* @oracle/oraclejet-preact: undefined */
'use strict';

var preact = require('preact');
var Common_themes_redwood_theme = require('./Common/themes/redwood/theme.js');
var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');

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
    theme: Common_themes_redwood_theme.Redwood,
    colorScheme: 'light',
    scale: 'lg',
    currentBgColor: undefined,
    mode: 'production',
    density: 'standard'
};
const EnvironmentContext = preact.createContext(DefaultEnvironment);

const LayerContext = preact.createContext({});

const LayerHost = compat.forwardRef((_props, ref) => {
    return jsxRuntime.jsx("div", { id: "__root_layer_host", ref: ref });
});
LayerHost.displayName = 'Forwarded<LayerHost>';

exports.DefaultEnvironment = DefaultEnvironment;
exports.EnvironmentContext = EnvironmentContext;
exports.LayerContext = LayerContext;
exports.LayerHost = LayerHost;
//# sourceMappingURL=LayerHost-46e4d858.js.map
