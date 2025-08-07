/* @oracle/oraclejet-preact: undefined */
import { u as useColorScheme } from './useColorScheme-e1b17324.js';
import { u as useScale } from './useScale-d64a1a28.js';
import { t as themeInterpolations } from './theme-63551f30.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { D as DefaultEnvironment } from './LayerHost-45f545d7.js';

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
    const colorScheme = useColorScheme();
    const currentScale = useScale();
    // We don't want to interpolate the default environment values for scacle.  Those should get picked up by default.
    // This fixes an issue for core pack components that utilize the Layer component, when in a legacy cookbook page.
    const scale = currentScale !== DefaultEnvironment.scale ? currentScale : undefined;
    const interpolations = mergeInterpolations([...Object.values(themeInterpolations)]);
    const { class: classes } = interpolations({ colorScheme, scale });
    return classes;
}

export { useThemeInterpolations as u };
//# sourceMappingURL=useThemeInterpolations-9bddc683.js.map
