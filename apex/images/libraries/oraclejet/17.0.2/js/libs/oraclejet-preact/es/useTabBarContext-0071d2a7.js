/* @oracle/oraclejet-preact: undefined */
import { useContext } from 'preact/hooks';
import { createContext } from 'preact';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Context used to pass TabBar information without having to pass it to TabBar children props.
 * We want to communicate information down to any interested TabBar item children.
 */
const TabBarContext = createContext(null);

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the TabBarContext
 *
 * @returns The value of TabBarContext provider
 */
function useTabBarContext() {
    return useContext(TabBarContext);
}

export { TabBarContext as T, useTabBarContext as u };
//# sourceMappingURL=useTabBarContext-0071d2a7.js.map
