/* @oracle/oraclejet-preact: undefined */
'use strict';

var useColorScheme = require('./useColorScheme-d2c4adcc.js');
var useScale = require('./useScale-74bd6456.js');
var theme = require('./theme-dfd6a9fe.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var LayerHost = require('./LayerHost-46e4d858.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
// This hook encasulates the logic required to determine which theme style classes are needed
// for the current environment context's colorScheme and scale value.  This would be used when
// rendering dom outside of the current dom tree, but desire to match the colorScheme and scale
// of the original dom tree.
function useThemeInterpolations() {
    const colorScheme = useColorScheme.useColorScheme();
    const currentScale = useScale.useScale();
    // We don't want to interpolate the default environment values for scacle.  Those should get picked up by default.
    // This fixes an issue for core pack components that utilize the Layer component, when in a legacy cookbook page.
    const scale = currentScale !== LayerHost.DefaultEnvironment.scale ? currentScale : undefined;
    const interpolations = mergeInterpolations.mergeInterpolations([...Object.values(theme.themeInterpolations)]);
    const { class: classes } = interpolations({ colorScheme, scale });
    return classes;
}

exports.useThemeInterpolations = useThemeInterpolations;
//# sourceMappingURL=useThemeInterpolations-25313f34.js.map
