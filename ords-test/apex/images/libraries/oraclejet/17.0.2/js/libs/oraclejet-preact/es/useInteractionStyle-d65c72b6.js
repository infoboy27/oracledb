/* @oracle/oraclejet-preact: undefined */
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { u as useActive } from './useActive-7d9737a5.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const useInteractionStyle = (isDisabled = false) => {
    const hints = getClientHints();
    // :active only works on IOS devices if a touch handler exists
    const iosProps = hints.platform === 'ios' ? { ontouchstart: function () { } } : {};
    const isHybrid = hints.hoverSupport === 'events';
    // hook props and state
    const { activeProps, isActive } = useActive();
    const { hoverProps, isHover } = useHover({ isDisabled: !isHybrid });
    // apply hover styling to element on a device that does not have hoverSupport
    // events and is not active or disabled
    const applyPseudoHoverStyle = !isHybrid && !isActive && !isDisabled;
    // apply hover styling to element on a device that has hoverSupport events
    // and is not active or disabled
    const applyHoverStyle = isHybrid && isHover && !isActive && !isDisabled;
    // apply active style when element is active and not disabled
    const applyActiveStyle = isActive && !isDisabled;
    // merge all props
    const interactionProps = mergeProps(iosProps, activeProps, hoverProps);
    // in the event a component wants to conditionally use base props or hook state,
    // baseProps, and baseStates are returned
    return {
        interactionProps,
        baseProps: {
            iosProps,
            activeProps,
            hoverProps
        },
        applyPseudoHoverStyle,
        applyHoverStyle,
        applyActiveStyle,
        baseStates: {
            isActive,
            isHover
        }
    };
};

export { useInteractionStyle as u };
//# sourceMappingURL=useInteractionStyle-d65c72b6.js.map
