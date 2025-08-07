/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var LayerHost = require('./LayerHost-46e4d858.js');
require('preact/jsx-runtime');
require('preact/compat');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useDensity() {
    return hooks.useContext(LayerHost.EnvironmentContext).density;
}

exports.useDensity = useDensity;
//# sourceMappingURL=useDensity-6e80ddff.js.map
