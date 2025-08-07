/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { Fragment } from 'preact';
import { useCallback, useState, useRef } from 'preact/hooks';
import { memo } from 'preact/compat';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useId } from './useId-03dbfdf0.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { c as containsKey, b as isSameKey } from './keys-df361af9.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { C as CollapseIcon } from './CollapseIcon-b6d7cfd6.js';
import { L as LiveRegion } from './LiveRegion-81216fe6.js';
import { u as useUser } from './useUser-99920e02.js';
import { k as keyExtractor } from './collectionUtils-d72c7c40.js';
import { B as Button } from './Button-50c5589f.js';
import { G as GROUP_SELECTOR, a as GroupLoadingIndicator, L as ListGroupHeader } from './GroupLoadingIndicator-9c995e99.js';
import { e as excludeGroup, L as List } from './List-9026206d.js';
import './LayerHost-45f545d7.js';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import './HiddenAccessibleStyles.styles.css';
import './Icon-90c3a630.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import './Floating-9703160e.js';
import './useFloating-c99976f8.js';
import './positionUtils-1ec41fd0.js';
import './refUtils-b9d8d91a.js';
import './useOutsideClick-eb8324f6.js';
import './arrayUtils-35a58161.js';
import './Layer-9b06412e.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './useComponentTheme-d2f9e47f.js';
import './logger-c92f309c.js';
import './UNSAFE_Floating/themes/redwood/FloatingTheme.js';
import './UNSAFE_Floating/themes/FloatingStyles.css.js';
import './FloatingStyles.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingVariants.css.js';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './vanilla-extract-dynamic.esm-2955d60a.js';
import './UNSAFE_Floating/themes/FloatingContract.css.js';
import './useHover-d5088fcd.js';
import './useToggle-8b7fcefe.js';
import './useFocus-38c95977.js';
import './useTouch-4828df25.js';
import './mergeProps-88ea8306.js';
import './useAnimation-fe9990dc.js';
import './useTestId-adde554c.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js';
import './hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js';
import './TooltipContentStyles.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js';
import './TooltipContentVariants.styles.css';
import './EnvironmentProvider-f543a463.js';
import './LayerManager-625d2503.js';
import './UNSAFE_Icon/themes/IconStyle.css.js';
import './IconStyle.styles.css';
import './ChevronRight-083aef16.js';
import './withDirectionIcon-f8ff778c.js';
import './LiveRegionStyles.styles.css';
import './clientHints-c76a913b.js';
import './BaseButton-5b2791b1.js';
import './usePress-97fc1cf1.js';
import './useActive-7d9737a5.js';
import './TabbableModeContext-7d8ad946.js';
import './useTabbableMode-a3a351d0.js';
import './dimensions-5229d942.js';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js';
import './UNSAFE_BaseButton/themes/BaseButtonStyles.css.js';
import './BaseButtonStyles.styles.css';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonVariants.css.js';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonBaseTheme.styles.css';
import './ButtonLabelLayout-03cfed16.js';
import './Text-da8588ce.js';
import './UNSAFE_Text/themes/TextStyles.css.js';
import './TextStyles.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js';
import './UNSAFE_ButtonLabelLayout/themes/ButtonLabelLayoutStyles.css.js';
import './ButtonLabelLayoutStyles.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.css.js';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutVariants.css.js';
import './ButtonLabelLayoutVariants.styles.css';
import './useViewportIntersect-2a2be24b.js';
import './useInteractionStyle-d65c72b6.js';
import './flexitem-7b7f7920.js';
import './flexitem.styles.css';
import './vanilla-extract-sprinkles-createRuntimeSprinkles.esm-2d655d37.js';
import './PRIVATE_List/themes/ListStyles.css.js';
import './ImageVars.styles.css';
import './ListStyles.styles.css';
import './UNSAFE_GroupedList/themes/redwood/GroupedListTheme.js';
import './UNSAFE_GroupedList/themes/GroupedListStyles.css.js';
import './GroupedListStyles.styles.css';
import './UNSAFE_GroupedList/themes/redwood/GroupedListBaseTheme.css.js';
import './UNSAFE_GroupedList/themes/redwood/GroupedListBaseTheme.styles.css';
import './Flex-24628925.js';
import './boxalignment-486c5ac9.js';
import './boxalignment.styles.css';
import './flexbox-529f25da.js';
import './flexbox.styles.css';
import './FlexStyles.styles.css';
import './Skeleton-c1d24eea.js';
import './borders-98a63040.js';
import './UNSAFE_Skeleton/themes/redwood/SkeletonTheme.js';
import './UNSAFE_Skeleton/themes/SkeletonStyles.css.js';
import './SkeletonStyles.styles.css';
import './UNSAFE_Skeleton/themes/redwood/SkeletonBaseTheme.css.js';
import './UNSAFE_Skeleton/themes/redwood/SkeletonBaseTheme.styles.css';
import './UNSAFE_Skeleton/themes/redwood/SkeletonVariants.css.js';
import './LoadMoreCollection-95a49d2a.js';
import './Collection-c4f2f3ea.js';
import './VirtualizedCollection-e73890a1.js';
import './FocusTrap-8ddd383f.js';
import './tabbableUtils-dca964ca.js';
import './head-6f17c50c.js';
import './_arity-be492b9e.js';
import './_isArray-694cc52d.js';
import './_isString-675f1de9.js';
import './FocusTracker-a0621449.js';
import './PRIVATE_FocusTracker/themes/FocusTrackerStyles.css.js';
import './FocusTrackerStyles.styles.css';
import './Selector-e56a73a8.js';
import './UNSAFE_Selector/themes/SelectorStyles.css.js';
import './SelectorStyles.styles.css';
import './StyledCheckbox-7dc33a92.js';
import './Check-c76fe451.js';
import './CheckboxOff-d9693a93.js';
import './CheckboxOn-965ecd2f.js';
import './CheckboxMixed-a08ccbb6.js';
import './UNSAFE_Checkbox/themes/CheckboxIconContract.css.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconTheme.js';
import './UNSAFE_Checkbox/themes/CheckboxIconStyles.css.js';
import './CheckboxIconStyles.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconBaseTheme.css.js';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconBaseTheme.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxIconVariants.css.js';
import './CheckboxIconVariants.styles.css';
import './StyledCheckbox.styles.css';
import './useCollectionGestureContext-f18b492f.js';
import './ImageVars.css-7b3180c8.js';
import './useTheme-1f6035d2.js';
import './useSelection-ce0f9a43.js';
import './textSelectionUtils-a6554a42.js';
import './useCurrentKey-db7d3bb9.js';
import './useCollectionFocusRing-d0c80397.js';
import './useItemAction-044c6369.js';
import './useTabbableModeSet-37cd3452.js';
import './Inset-081189b0.js';
import './UNSAFE_Inset/themes/InsetStyles.css.js';
import './InsetStyles.styles.css';
import './PRIVATE_List/themes/redwood/ListBaseTheme.styles.css';

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
    const { direction } = useUser();
    const onClick = useCallback((event) => {
        handleToggle(event, keyExtractor, onToggle);
    }, [keyExtractor, onToggle]);
    const onKeyUp = useCallback((event) => {
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
        const contains = containsKey(expanded, itemKey);
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
    const [statusText, setStatusText] = useState('');
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const updateStateText = useCallback((detail) => {
        onToggle?.(detail);
        if (data) {
            const previouslyExpanded = containsKey(data?.expanded, detail.value);
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
        return keyExtractor(element, GROUP_SELECTOR);
    }, data == null ? emptyKeys : data.expanded, onToggle && updateStateText);
    const descId = useId();
    const stableDescIdRef = useRef(descId);
    const createHierarchicalContext = (context, options) => {
        const expanderRenderer = options !== undefined
            ? () => (jsx(Expander, { itemKey: context.metadata.key, expanded: options.expanded, onToggle: options.onToggle }))
            : undefined;
        return {
            ...context,
            parentKey: context.metadata.parentKey,
            leaf: context.metadata.isLeaf ?? true,
            depth: context.metadata.treeDepth ?? 1,
            expander: expanderRenderer
        };
    };
    const handleSelectionChange = useCallback((detail) => {
        if (onSelectionChange && data) {
            const keys = excludeGroup(data, detail.value);
            if (isSameKey(keys, detail.value)) {
                onSelectionChange(detail);
            }
            else if (keys.keys && keys.keys.size > 0) {
                onSelectionChange({ ...detail, value: keys });
            }
        }
    }, [onSelectionChange, data]);
    const customItemRenderer = (context) => {
        const itemKey = context.listItemContext.metadata.key;
        const options = data && onToggle ? { expanded: containsKey(data.expanded, itemKey), onToggle } : undefined;
        const itemContext = createHierarchicalContext(context.listItemContext, options);
        if (itemContext.leaf) {
            return context.defaultListItem(itemContext, { itemDepth: itemContext.depth + 1 });
        }
        else {
            return (jsx(ListGroupHeader, { ariaDescribedBy: stableDescIdRef.current, itemKey: itemContext.metadata.key, itemIndex: itemContext.index, itemDepth: itemContext.depth, isFocused: context.isFocused, isFocusRingVisible: context.isFocusRingVisible, isActive: context.isActive, isGridlineVisible: false, isExpandable: true, expandedKeys: data == null ? emptyKeys : data.expanded, onToggle: onToggle, children: children(itemContext) }, itemContext.metadata.key));
        }
    };
    return (jsxs(Fragment, { children: [jsx(List, { currentKey: currentKey, data: data, role: "treegrid", loadingIndicator: jsx(GroupLoadingIndicator, {}), onSelectionChange: handleSelectionChange, customItemRenderer: customItemRenderer, ...props, ...expandCollapseProps, children: (context) => {
                    return children(context);
                } }), onToggle && (jsxs(Fragment, { children: [jsx(LiveRegion, { children: statusText }), jsx("span", { id: stableDescIdRef.current, children: jsx(HiddenAccessible, { children: translations.expandableList_expandCollapseInstructionText() }) })] }))] }));
}
const emptyKeys = { all: false, keys: new Set() };
const Expander = memo((props) => {
    const classes = classNames(['oj-listview-expander']);
    const actionHandler = () => {
        props.onToggle({ value: props.itemKey });
    };
    return (jsx("span", { class: classes, role: "presentation", children: jsx(Button, { onAction: actionHandler, variant: "ghost", startIcon: props.expanded ? jsx(SvgChevronDown, { size: "6x" }) : jsx(CollapseIcon, { size: "6x" }) }) }));
}, (prev, next) => {
    return (prev.itemKey === next.itemKey &&
        prev.expanded === next.expanded &&
        prev.onToggle === next.onToggle);
});

export { ExpandableList };
//# sourceMappingURL=UNSAFE_ExpandableList.js.map
