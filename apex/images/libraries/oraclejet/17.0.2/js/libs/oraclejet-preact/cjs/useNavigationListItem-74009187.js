/* @oracle/oraclejet-preact: undefined */
'use strict';

var hooks = require('preact/hooks');
var usePress = require('./usePress-00deca01.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var classNames = require('./classNames-c14c6ef3.js');
var useInteractionStyle = require('./useInteractionStyle-442c6a12.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var preact = require('preact');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var UNSAFE_NavigationListCommon_themes_redwood_NavigationListItemTheme = require('./UNSAFE_NavigationListCommon/themes/redwood/NavigationListItemTheme.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Context used to pass navlist information without having to pass it to navlist children props.
 * We want to communicate information down to any interested navlist item children.
 */
const NavigationListContext = preact.createContext(null);

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the NavigationListContext
 *
 * @returns The value of NavigationListContext provider
 */
function useNavigationListContext() {
    return hooks.useContext(NavigationListContext);
}

const flexItemStyleInterpolations = mergeInterpolations.mergeInterpolations([
    ...Object.values(flexitem.flexitemInterpolations)
]);
const { class: labelContainerFlexItemClasses, ...labelContainerFlexItemStyle } = flexItemStyleInterpolations({
    alignSelf: 'center'
});
function useNavigationListItem({ itemKey }) {
    const { onSelectionChange, selection, currentKey, showFocusRing, navigationListItemPrefix } = useNavigationListContext();
    //Selection and focus state
    const isCurrent = currentKey === itemKey;
    const isSelected = selection === itemKey;
    //Styling
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle, applyActiveStyle } = useInteractionStyle.useInteractionStyle();
    const { classes: listItemClasses, styles: { labelContainerClasses } } = useComponentTheme.useComponentTheme(UNSAFE_NavigationListCommon_themes_redwood_NavigationListItemTheme.NavigationListItemRedwoodTheme, {
        focusRing: showFocusRing ? 'isFocusRing' : 'notFocusRing',
        current: isCurrent ? 'isCurrent' : 'notCurrtent',
        selected: isSelected ? 'isSelected' : 'notSelected',
        hybridHover: applyHoverStyle ? 'isHybridHover' : 'notHybridHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        active: applyActiveStyle ? 'isActive' : 'notActive'
    });
    //Item handlers
    const handlePress = hooks.useCallback(() => {
        onSelectionChange?.({ value: itemKey, reason: 'pointer' });
    }, [itemKey, onSelectionChange]);
    //Legacy navlist makes selection on keyDown, but since preact tabbar made selection after keyUp, will do the same
    //for preact navlist
    const { pressProps } = usePress.usePress(handlePress);
    return {
        itemId: navigationListItemPrefix + itemKey,
        itemHandlers: mergeProps.mergeProps(interactionProps, pressProps /*,onFocusProps*/),
        itemClasses: classNames.classNames([listItemClasses]),
        isSelected,
        labelContainerClasses: classNames.classNames([labelContainerClasses, labelContainerFlexItemClasses]),
        labelContainerStyle: labelContainerFlexItemStyle
    };
}

exports.NavigationListContext = NavigationListContext;
exports.useNavigationListContext = useNavigationListContext;
exports.useNavigationListItem = useNavigationListItem;
//# sourceMappingURL=useNavigationListItem-74009187.js.map
