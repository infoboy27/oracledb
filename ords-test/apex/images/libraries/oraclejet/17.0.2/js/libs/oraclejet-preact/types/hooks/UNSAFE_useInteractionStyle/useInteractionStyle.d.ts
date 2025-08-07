/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
declare const useInteractionStyle: (isDisabled?: boolean) => {
    interactionProps: {};
    baseProps: {
        iosProps: {
            ontouchstart: () => void;
        } | {
            ontouchstart?: undefined;
        };
        activeProps: Record<string, any>;
        hoverProps: Record<string, any>;
    };
    applyPseudoHoverStyle: boolean;
    applyHoverStyle: boolean;
    applyActiveStyle: boolean;
    baseStates: {
        isActive: boolean;
        isHover: boolean;
    };
};
export { useInteractionStyle };
