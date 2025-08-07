/* @oracle/oraclejet-preact: undefined */
'use strict';

var mergeProps = require('./mergeProps-e3da7237.js');
var useHover = require('./useHover-910b8e32.js');
var useActive = require('./useActive-b15c9e7e.js');
var useFocus = require('./useFocus-1b288fb9.js');
var usePress = require('./usePress-00deca01.js');

const DefaultActionableOptions = {
    isDisabled: false,
    isRepeat: false
};
/**
 * A hook that can add actionable support to a target element, turning it into a
 * clickable button, div, card, etc.
 * If isHover, isFocus, and isActive are only used for changing visual rendering, it would be
 * faster to not use this hook, and instead use :hover, :focus-visible, :active and usePress.
 * @param onActionHandler
 * @returns
 */
function useActionable(onActionHandler, settings = DefaultActionableOptions) {
    const mergedSettings = { ...DefaultActionableOptions, ...settings };
    const { pressProps } = usePress.usePress(onActionHandler, mergedSettings);
    const { hoverProps, isHover } = useHover.useHover({ isDisabled: mergedSettings.isDisabled });
    const { focusProps, isFocus } = useFocus.useFocus({ isDisabled: mergedSettings.isDisabled });
    const { activeProps, isActive } = useActive.useActive({ isDisabled: mergedSettings.isDisabled });
    const actionableProps = mergeProps.mergeProps(pressProps, hoverProps, activeProps, focusProps);
    return { actionableProps, isActive, isHover, isFocus };
}

exports.useActionable = useActionable;
//# sourceMappingURL=useActionable-c6f17f0f.js.map
