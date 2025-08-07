/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var preact = require('preact');

/**
 * Context for CollectionGesture Consumer and Provider
 */
/**
 * This context (with value 'embedded') should be created by component that has a drop down and the drop down
 * contains a Collection component that uses grid role (ListView and Table).
 * The behavior of the Collection component will alter when it is inside of a drop down.  Specifically,
 * enter key will update the selection, and spacebar key will fire ItemAction event.
 */
const CollectionGestureContext = preact.createContext('default');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the CollectionGestureContext
 */
function useCollectionGestureContext() {
    return hooks.useContext(CollectionGestureContext);
}

exports.CollectionGestureContext = CollectionGestureContext;
exports.useCollectionGestureContext = useCollectionGestureContext;
//# sourceMappingURL=useCollectionGestureContext-daada886.js.map
