/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { createRef } from 'preact';
import { useRef, useState, useCallback, useMemo } from 'preact/hooks';
import { c as classNames } from './classNames-4e12b00d.js';
import { T as TabBar } from './TabBar-e39e8dbd.js';
import { styles } from './UNSAFE_OverflowTabBar/themes/OverflowTabBarStyles.css.js';
import { u as useDetectHorizontalOverflow } from './useDetectHorizontalOverflow-7ad029aa.js';
import { f as findElementByKey } from './collectionUtils-d72c7c40.js';
import { R as RemovableTabBarItem } from './RemovableTabBarItem-217d4a0b.js';
import { T as TabBarItem } from './TabBarItem-c681fa07.js';
import { O as OverflowTabBarItem } from './OverflowTabBarItem-8f35961d.js';
import './LayerHost-45f545d7.js';
import './Common/themes/redwood/theme.js';
import './Common/themes/themeContract.css.js';
import 'preact/compat';
import './UNSAFE_Text/themes/TextStyles.css.js';
import './TextStyles.styles.css';
import './vanilla-extract-recipes-createRuntimeFn.esm-2aaf8c98.js';
import './Flex-24628925.js';
import './useTestId-adde554c.js';
import './boxalignment-486c5ac9.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './arrayUtils-35a58161.js';
import './boxalignment.styles.css';
import './vanilla-extract-sprinkles-createRuntimeSprinkles.esm-2d655d37.js';
import './dimensions-5229d942.js';
import './flexbox-529f25da.js';
import './flexbox.styles.css';
import './flexitem-7b7f7920.js';
import './flexitem.styles.css';
import './mergeInterpolations-e2db2a66.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './FlexStyles.styles.css';
import './useTabBarContext-0071d2a7.js';
import './logger-c92f309c.js';
import './TabBarItemStyles.styles.css';
import './UNSAFE_TabBarCommon/themes/redwood/TabBarItemBaseTheme.styles.css';
import './UNSAFE_TabBarCommon/themes/redwood/TabBarItemVariants.css.js';
import './TabBarItemVariants.styles.css';
import './ConveyorBeltContext-76a29c59.js';
import './useTooltipControlled-2044f639.js';
import './useId-03dbfdf0.js';
import './Floating-9703160e.js';
import './useFloating-c99976f8.js';
import './useUser-99920e02.js';
import './positionUtils-1ec41fd0.js';
import './refUtils-b9d8d91a.js';
import './useOutsideClick-eb8324f6.js';
import './Layer-9b06412e.js';
import './UNSAFE_Layer/themes/LayerStyles.css.js';
import './LayerStyles.styles.css';
import './useThemeInterpolations-9bddc683.js';
import './useColorScheme-e1b17324.js';
import './useScale-d64a1a28.js';
import './theme-63551f30.js';
import './Theme-e6dec6db.js';
import './useComponentTheme-d2f9e47f.js';
import './UNSAFE_Floating/themes/redwood/FloatingTheme.js';
import './UNSAFE_Floating/themes/FloatingStyles.css.js';
import './FloatingStyles.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.css.js';
import './UNSAFE_Floating/themes/redwood/FloatingBaseTheme.styles.css';
import './UNSAFE_Floating/themes/redwood/FloatingVariants.css.js';
import './vanilla-extract-dynamic.esm-2955d60a.js';
import './UNSAFE_Floating/themes/FloatingContract.css.js';
import './useHover-d5088fcd.js';
import './useToggle-8b7fcefe.js';
import './useFocus-38c95977.js';
import './useTouch-4828df25.js';
import './mergeProps-88ea8306.js';
import './useAnimation-fe9990dc.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentTheme.js';
import './hooks/UNSAFE_useTooltip/themes/TooltipContentStyles.css.js';
import './TooltipContentStyles.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.css.js';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentBaseTheme.styles.css';
import './hooks/UNSAFE_useTooltip/themes/redwood/TooltipContentVariants.css.js';
import './TooltipContentVariants.styles.css';
import './EnvironmentProvider-f543a463.js';
import './LayerManager-625d2503.js';
import './IconStyle.styles.css';
import './keyboardUtils-4db21770.js';
import './clientHints-c76a913b.js';
import './tabbableUtils-dca964ca.js';
import './head-6f17c50c.js';
import './_arity-be492b9e.js';
import './_isArray-694cc52d.js';
import './_isString-675f1de9.js';
import './dropdownStyles.styles.css';
import './Sheet-e4121f4a.js';
import './Modal-6b11d8cb.js';
import './UNSAFE_Modal/themes/ModalStyles.css.js';
import './ModalStyles.styles.css';
import './WindowOverlay-e14f8324.js';
import './UNSAFE_WindowOverlay/themes/WindowOverlayStyles.css.js';
import './WindowOverlayStyles.styles.css';
import './UNSAFE_WindowOverlay/themes/WindowOverlayContract.css.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayTheme.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.css.js';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayBaseTheme.styles.css';
import './UNSAFE_WindowOverlay/themes/redwood/WindowOverlayVariants.css.js';
import './UNSAFE_Sheet/themes/SheetStyles.css.js';
import './SheetStyles.styles.css';
import './useAnimationStatus-9ef65f0c.js';
import './animationUtils-5f409a6c.js';
import './OverflowTabBarItemStyles.styles.css';
import './TabBarLayout-a0d89ec4.js';
import './UNSAFE_TabBar/themes/TabBarStyles.css.js';
import './TabBarStyles.styles.css';
import './useTabBar-8af19c50.js';
import './useCollectionFocusRing-d0c80397.js';
import './useCurrentKey-db7d3bb9.js';
import './keys-df361af9.js';
import './OverflowTabBarStyles.styles.css';
import './Close-97d45aca.js';
import './Icon-90c3a630.js';
import './useTooltip-9dec25b3.js';
import './UNSAFE_Icon/themes/IconStyle.css.js';
import './useTranslationBundle-cd815e10.js';
import './EmbeddedIconButton-2bee9a35.js';
import './BaseButton-5b2791b1.js';
import './usePress-97fc1cf1.js';
import './useActive-7d9737a5.js';
import './TabbableModeContext-7d8ad946.js';
import './useTabbableMode-a3a351d0.js';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js';
import './UNSAFE_BaseButton/themes/BaseButtonStyles.css.js';
import './BaseButtonStyles.styles.css';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonVariants.css.js';
import './UNSAFE_BaseButton/themes/redwood/BaseButtonBaseTheme.styles.css';
import './ButtonLabelLayout-03cfed16.js';
import './Text-da8588ce.js';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js';
import './UNSAFE_ButtonLabelLayout/themes/ButtonLabelLayoutStyles.css.js';
import './ButtonLabelLayoutStyles.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.css.js';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutBaseTheme.styles.css';
import './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutVariants.css.js';
import './ButtonLabelLayoutVariants.styles.css';
import './UNSAFE_TabBarCommon/themes/redwood/TabBarItemTheme.js';
import './UNSAFE_TabBarCommon/themes/TabBarItemStyles.css.js';
import './UNSAFE_TabBarCommon/themes/redwood/TabBarItemBaseTheme.css.js';
import './useConveyorBeltItem-ce7d69d6.js';
import './WarningS-dc71c91a.js';
import './ErrorS-e6e7e0e2.js';
import './InformationS-170eee52.js';
import './SuccessS-b342103c.js';
import './UNSAFE_TabBarCommon/themes/TabBarItemContract.css.js';
import './Badge-a458c469.js';
import './UNSAFE_Badge/themes/redwood/BadgeTheme.js';
import './UNSAFE_Badge/themes/BadgeStyles.css.js';
import './BadgeStyles.styles.css';
import './UNSAFE_Badge/themes/redwood/BadgeThemeBaseTheme.css.js';
import './UNSAFE_Badge/themes/redwood/BadgeThemeBaseTheme.styles.css';
import './UNSAFE_Badge/themes/redwood/BadgeVariants.css.js';
import './BadgeVariants.styles.css';
import './Dropdown-717319bb.js';
import './usePopupAnimation-4be04290.js';
import './popupAnimationUtils-d4c27cd1.js';
import './UNSAFE_Dropdown/themes/dropdownStyles.css.js';
import './useOutsideMousedown-7307de8b.js';
import './UNSAFE_TabBarCommon/themes/OverflowTabBarItemStyles.css.js';
import './NavigationListItem-ea899fab.js';
import './UNSAFE_NavigationList/themes/NavigationListStyles.css.js';
import './NavigationListStyles.styles.css';
import './BaseNavigationListItem-3a377d46.js';
import './useInteractionStyle-d65c72b6.js';
import './UNSAFE_NavigationListCommon/themes/redwood/NavigationListItemTheme.js';
import './UNSAFE_NavigationList/themes/NavigationListItemStyles.css.js';
import './NavigationListItemStyles.styles.css';
import './UNSAFE_NavigationList/themes/redwood/NavigationListItemBaseTheme.css.js';
import './UNSAFE_NavigationList/themes/redwood/NavigationListItemBaseTheme.styles.css';
import './UNSAFE_NavigationList/themes/redwood/NavigationListItemVariants.css.js';
import './NavigationListItemVariants.styles.css';
import './RemovableNavigationListItem-4c86bec8.js';

/**
 * OverflowTabBar handles the rendering of overflowing tab items.
 */
function OverflowTabBar({ items, layout = 'stretch', display = 'standard', size = 'md', edge = 'top', selection, onSelect, onRemove, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby, testId }) {
    const displayStackProps = {
        display: display
    };
    const displayNonStackProps = {
        display: display,
        size: size
    };
    const itemSelector = '[role="tab"]';
    const displayProps = display === 'stacked' ? displayStackProps : displayNonStackProps;
    const rootRef = useRef(null);
    const tabBarRef = createRef();
    const [isDropDownOpen, setIsDropDownOpen] = useState(false);
    const isOutsideMouseDown = useRef(false);
    const handleClose = (e) => {
        if (tabBarRef.current && ['itemAction', 'dismissed'].includes(e.reason)) {
            tabBarRef?.current?.focus();
        }
        if (e.reason === 'outsideMousedown') {
            isOutsideMouseDown.current = true;
        }
        setIsDropDownOpen(false);
    };
    const handleSelect = useCallback((e) => {
        if (e.value === 'more') {
            //If overflow item is clicked after dropdown is open, the reason is outsideMouseDown and it needs to be closed
            if (isOutsideMouseDown.current) {
                setIsDropDownOpen(false);
            }
            else {
                setIsDropDownOpen(true);
            }
        }
        else {
            onSelect?.(e);
        }
        isOutsideMouseDown.current = false;
    }, [onSelect]);
    const overflowItemKey = 'more';
    const keysArray = useMemo(() => items.map((item) => item.itemKey), [items]);
    const getWidth = useCallback((itemKey) => {
        const elem = findElementByKey(rootRef.current, itemKey, itemSelector);
        const gapBetweenItems = 32;
        return elem ? elem.getBoundingClientRect().width + gapBetweenItems : 0;
    }, []);
    const { visibleItemKeys, overflowItemKeys } = useDetectHorizontalOverflow({
        rootRef,
        getWidth,
        keysArray
    });
    const overflowTabBarClass = classNames([styles.overflowTabBarBase]);
    return (jsx("div", { ref: rootRef, class: overflowTabBarClass, children: jsxs(TabBar, { ref: tabBarRef, selection: selection, onSelect: handleSelect, ...displayProps, layout: layout, edge: edge, onRemove: onRemove, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, testId: testId, children: [visibleItemKeys != null &&
                    visibleItemKeys.length > 0 &&
                    items
                        .filter((item) => visibleItemKeys?.includes(item.itemKey))
                        .map((item) => item.isRemovable ? (jsx(RemovableTabBarItem, { itemKey: item.itemKey, label: item.label, icon: item.icon, badge: item.badge, metadata: item.metadata, severity: item.severity, "aria-controls": item.tabPanelId })) : (jsx(TabBarItem, { itemKey: item.itemKey, label: item.label, icon: item.icon, badge: item.badge, metadata: item.metadata, severity: item.severity, "aria-controls": item.tabPanelId }))), overflowItemKeys != null && overflowItemKeys.length > 0 && (jsx(OverflowTabBarItem, { isOpen: isDropDownOpen, onClose: handleClose, overflowItemKey: overflowItemKey, overflowItems: items.filter((item) => overflowItemKeys.includes(item.itemKey)) }))] }) }));
}

export { OverflowTabBar };
//# sourceMappingURL=UNSAFE_OverflowTabBar.js.map
