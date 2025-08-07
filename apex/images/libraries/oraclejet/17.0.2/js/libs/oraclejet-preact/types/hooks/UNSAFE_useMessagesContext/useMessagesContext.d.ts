/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Uses the MessagesContext if one is available.
 *
 * @returns The context from the closes provider
 */
export declare function useMessagesContext(): {
    addBusyState?: ((description?: string | undefined) => () => void) | undefined;
    UNSAFE_messagesLayerId?: string | undefined;
};
