/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var hooks = require('preact/hooks');
var compat = require('preact/compat');
var classNames = require('./classNames-c14c6ef3.js');
var useId = require('./useId-6c0eeb27.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var keys = require('./keys-a4b54295.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var ChevronDown = require('./ChevronDown-ec558844.js');
var CollapseIcon = require('./CollapseIcon-a1da1523.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var useUser = require('./useUser-a6d15333.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
var Button = require('./Button-b5af1b23.js');
var GroupLoadingIndicator = require('./GroupLoadingIndicator-3c9d8341.js');
var List = require('./List-bd9ecebb.js');
require('./LayerHost-46e4d858.js');
require('./Common/themes/redwood/theme.js');
require('./Common/themes/themeContract.css.js');

require('./Icon-3ffd13dc.js');
require('./size-4e606ce4.js');
require('./utils-b7099be5.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
require('./Floating-1280c2ce.js');
require('./useFloating-7800fd56.js');
require('./positionUtils-ae9279d7.js');
require('./refUtils-915b985d.js');
require('./useOutsideClick-7420644b.js');
require('./arrayUtils-7d8dcfc3.js');
require('./Layer-3700cd37.js');
require('./UNSAFE_Layer/themes/LayerStyles.css.js');

require('./useThemeInterpolations-25313f34.js');
require('./useColorScheme-d2c4adcc.js');
require('./useScale-74bd6456.js');
require('./theme-dfd6a9fe.js');
require('./Theme-f06687af.js');
require('./mergeInterpolations-6727b536.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');
require('./useComponentTheme-082fc8e4.js');
require('./logger-2b636482.js');
require('./UNSAFE_Floating/themes/redwood/FloatingTheme.js');
require('./UNSAFE_Floating/themes/FloatingStyles.css.js');

require('./UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js');

require('./UNSAFE_Floating/themes/redwood/FloatingVariants.css.js');
require('./vanilla-extract-recipes-createRuntimeFn.esm-d1301b2d.js');
require('./vanilla-extract-dynamic.esm-d5dffce7.js');
require('./UNSAFE_Floating/themes/FloatingContract.css.js');
require('./useHover-910b8e32.js');
require('./useToggle-3ebba7d8.js');
require('./useFocus-1b288fb9.js');
require('./useTouch-4dec8729.js');
require('./mergeProps-e3da7237.js');
require('./useAnimation-2f7dd313.js');
require('./useTestId-8234ec1e.js');
require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js');
require('./hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js');

require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js');

require('./hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js');

require('./EnvironmentProvider-42b2b998.js');
require('./LayerManager-fa20a462.js');
require('./UNSAFE_Icon/themes/IconStyle.css.js');

require('./ChevronRight-3aa70117.js');
require('./withDirectionIcon-d9c7c79f.js');

require('./clientHints-9e411b6e.js');
require('./BaseButton-ff6f39f2.js');
require('./usePress-00deca01.js');
require('./useActive-b15c9e7e.js');
require('./TabbableModeContext-e99d527e.js');
require('./useTabbableMode-5c8fd9e5.js');
require('./dimensions-b48bf1ab.js');
require('./UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js');
require('./UNSAFE_BaseButton/themes/BaseButtonStyles.css.js');

require('./UNSAFE_BaseButton/themes/redwood/BaseButtonVariants.css.js');

require('./ButtonLabelLayout-3399b9e1.js');
require('./Text-aaacb6a0.js');
require('./UNSAFE_Text/themes/TextStyles.css.js');

require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js');
require('./UNSAFE_ButtonLabelLayout/themes/ButtonLabelLayoutStyles.css.js');

require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.css.js');

require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutVariants.css.js');

require('./useViewportIntersect-ca1f958b.js');
require('./useInteractionStyle-442c6a12.js');
require('./flexitem-fee13e26.js');

require('./vanilla-extract-sprinkles-createRuntimeSprinkles.esm-d68f3e0f.js');
require('./PRIVATE_List/themes/ListStyles.css.js');


require('./UNSAFE_GroupedList/themes/redwood/GroupedListTheme.js');
require('./UNSAFE_GroupedList/themes/GroupedListStyles.css.js');

require('./UNSAFE_GroupedList/themes/redwood/GroupedListBaseTheme.css.js');

require('./Flex-fbba4ad6.js');
require('./boxalignment-5ef612ee.js');

require('./flexbox-2cae9a01.js');


require('./Skeleton-f0f86df2.js');
require('./borders-4b8488cb.js');
require('./UNSAFE_Skeleton/themes/redwood/SkeletonTheme.js');
require('./UNSAFE_Skeleton/themes/SkeletonStyles.css.js');

require('./UNSAFE_Skeleton/themes/redwood/SkeletonBaseTheme.css.js');

require('./UNSAFE_Skeleton/themes/redwood/SkeletonVariants.css.js');
require('./LoadMoreCollection-73112ff0.js');
require('./Collection-9880039f.js');
require('./VirtualizedCollection-00aedb8b.js');
require('./FocusTrap-0a03f5a2.js');
require('./tabbableUtils-b49673af.js');
require('./head-68d0992f.js');
require('./_arity-c228159c.js');
require('./_isArray-73160ad5.js');
require('./_isString-f4443c9e.js');
require('./FocusTracker-9cc329a3.js');
require('./PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js');

require('./Selector-cc35dbb1.js');
require('./UNSAFE_Selector/themes/SelectorStyles.css.js');

require('./StyledCheckbox-7576d44a.js');
require('./Check-f72ac53c.js');
require('./CheckboxOff-9a4efabf.js');
require('./CheckboxOn-9b9aa373.js');
require('./CheckboxMixed-7728d6aa.js');
require('./UNSAFE_Checkbox/themes/CheckboxIconContract.css.js');
require('./UNSAFE_Checkbox/themes/redwood/CheckboxIconTheme.js');
require('./UNSAFE_Checkbox/themes/CheckboxIconStyles.css.js');

require('./UNSAFE_Checkbox/themes/redwood/CheckboxIconBaseTheme.css.js');

require('./UNSAFE_Checkbox/themes/redwood/CheckboxIconVariants.css.js');


require('./useCollectionGestureContext-daada886.js');
require('./ImageVars.css-3fbb1c0b.js');
require('./useTheme-9b0dc066.js');
require('./useSelection-b53f8255.js');
require('./textSelectionUtils-432ab66b.js');
require('./useCurrentKey-3b4c8a44.js');
require('./useCollectionFocusRing-ca37785b.js');
require('./useItemAction-dad80c7d.js');
require('./useTabbableModeSet-bfbdbba0.js');
require('./Inset-a076f9ab.js');
require('./UNSAFE_Inset/themes/InsetStyles.css.js');



/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * A hook that handles mouse and keyboard gesture that toggles the expanded state.
 * @param keyExtractor
 * @param expanded
 * @param onToggle
 * @returns
 */
function useExpandCollapse(keyExtractor, expanded, onToggle) {
    const { direction } = useUser.useUser();
    const onClick = hooks.useCallback((event) => {
        handleToggle(event, keyExtractor, onToggle);
    }, [keyExtractor, onToggle]);
    const onKeyUp = hooks.useCallback((event) => {
        if (event.key === 'Enter' || event.key === ' ') {
            handleToggle(event, keyExtractor, onToggle);
        }
        else if (event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
            const isRtl = direction === 'rtl';
            const isLeftArrow = event.key === 'ArrowLeft' && !isRtl;
            handleArrowKey(isLeftArrow, event.target, expanded, keyExtractor, onToggle);
            // arrow key might cause it to scroll horizontally
            event.preventDefault();
            event.stopPropagation();
        }
    }, [keyExtractor, onToggle, expanded, direction]);
    return onToggle ? { onClick, onKeyDown, onKeyUp } : {};
}
// prevent default (propagation) for keyDown to prevent scrolling the container
const onKeyDown = (event) => {
    if (event.key === 'Enter' || event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
        event.preventDefault();
    }
};
const handleArrowKey = (isLeftArrow, target, expanded, keyExtractor, onToggle) => {
    const itemKey = keyExtractor(target);
    if (onToggle && itemKey) {
        const contains = keys.containsKey(expanded, itemKey);
        if ((isLeftArrow && contains) || (!isLeftArrow && !contains)) {
            onToggle({ value: itemKey });
        }
    }
};
const handleToggle = (event, keyExtractor, onToggle) => {
    const itemKey = keyExtractor(event.target);
    if (onToggle && itemKey) {
        onToggle({ value: itemKey });
        if (event.type === 'click') {
            event.stopPropagation();
        }
    }
};

/**
 * An ExpandableList shows a two-level group of items where each group header can be expand or collapse.
 */
function ExpandableList({ children, currentKey, data, onSelectionChange, onToggle, ...props }) {
    const [statusText, setStatusText] = hooks.useState('');
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const updateStateText = hooks.useCallback((detail) => {
        onToggle?.(detail);
        if (data) {
            const previouslyExpanded = keys.containsKey(data?.expanded, detail.value);
            setStatusText(previouslyExpanded
                ? translations.expandableList_groupCollapse()
                : translations.expandableList_groupExpand());
            // we need to clear the live region text otherwise screenreader
            // won't read again if the content did not change the next time
            setTimeout(() => {
                setStatusText('');
            }, 1000);
        }
    }, [onToggle, data, translations]);
    const expandCollapseProps = useExpandCollapse((element) => {
        if (element.getAttribute('role') === 'treegrid') {
            return currentKey === undefined ? null : currentKey;
        }
        return collectionUtils.keyExtractor(element, GroupLoadingIndicator.GROUP_SELECTOR);
    }, data == null ? emptyKeys : data.expanded, onToggle && updateStateText);
    const descId = useId.useId();
    const stableDescIdRef = hooks.useRef(descId);
    const createHierarchicalContext = (context, options) => {
        const expanderRenderer = options !== undefined
            ? () => (jsxRuntime.jsx(Expander, { itemKey: context.metadata.key, expanded: options.expanded, onToggle: options.onToggle }))
            : undefined;
        return {
            ...context,
            parentKey: context.metadata.parentKey,
            leaf: context.metadata.isLeaf ?? true,
            depth: context.metadata.treeDepth ?? 1,
            expander: expanderRenderer
        };
    };
    const handleSelectionChange = hooks.useCallback((detail) => {
        if (onSelectionChange && data) {
            const keys$1 = List.excludeGroup(data, detail.value);
            if (keys.isSameKey(keys$1, detail.value)) {
                onSelectionChange(detail);
            }
            else if (keys$1.keys && keys$1.keys.size > 0) {
                onSelectionChange({ ...detail, value: keys$1 });
            }
        }
    }, [onSelectionChange, data]);
    const customItemRenderer = (context) => {
        const itemKey = context.listItemContext.metadata.key;
        const options = data && onToggle ? { expanded: keys.containsKey(data.expanded, itemKey), onToggle } : undefined;
        const itemContext = createHierarchicalContext(context.listItemContext, options);
        if (itemContext.leaf) {
            return context.defaultListItem(itemContext, { itemDepth: itemContext.depth + 1 });
        }
        else {
            return (jsxRuntime.jsx(GroupLoadingIndicator.ListGroupHeader, { ariaDescribedBy: stableDescIdRef.current, itemKey: itemContext.metadata.key, itemIndex: itemContext.index, itemDepth: itemContext.depth, isFocused: context.isFocused, isFocusRingVisible: context.isFocusRingVisible, isActive: context.isActive, isGridlineVisible: false, isExpandable: true, expandedKeys: data == null ? emptyKeys : data.expanded, onToggle: onToggle, children: children(itemContext) }, itemContext.metadata.key));
        }
    };
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(List.List, { currentKey: currentKey, data: data, role: "treegrid", loadingIndicator: jsxRuntime.jsx(GroupLoadingIndicator.GroupLoadingIndicator, {}), onSelectionChange: handleSelectionChange, customItemRenderer: customItemRenderer, ...props, ...expandCollapseProps, children: (context) => {
                    return children(context);
                } }), onToggle && (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(LiveRegion.LiveRegion, { children: statusText }), jsxRuntime.jsx("span", { id: stableDescIdRef.current, children: jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { children: translations.expandableList_expandCollapseInstructionText() }) })] }))] }));
}
const emptyKeys = { all: false, keys: new Set() };
const Expander = compat.memo((props) => {
    const classes = classNames.classNames(['oj-listview-expander']);
    const actionHandler = () => {
        props.onToggle({ value: props.itemKey });
    };
    return (jsxRuntime.jsx("span", { class: classes, role: "presentation", children: jsxRuntime.jsx(Button.Button, { onAction: actionHandler, variant: "ghost", startIcon: props.expanded ? jsxRuntime.jsx(ChevronDown.SvgChevronDown, { size: "6x" }) : jsxRuntime.jsx(CollapseIcon.CollapseIcon, { size: "6x" }) }) }));
}, (prev, next) => {
    return (prev.itemKey === next.itemKey &&
        prev.expanded === next.expanded &&
        prev.onToggle === next.onToggle);
});

exports.ExpandableList = ExpandableList;
//# sourceMappingURL=UNSAFE_ExpandableList.js.map
